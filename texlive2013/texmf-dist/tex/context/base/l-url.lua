if not modules then modules = { } end modules ['l-url'] = {
    version   = 1.001,
    comment   = "companion to luat-lib.mkiv",
    author    = "Hans Hagen, PRAGMA-ADE, Hasselt NL",
    copyright = "PRAGMA ADE / ConTeXt Development Team",
    license   = "see context related readme files"
}

local char, format, byte = string.char, string.format, string.byte
local concat = table.concat
local tonumber, type = tonumber, type
local P, C, R, S, Cs, Cc, Ct, Cf, Cg, V = lpeg.P, lpeg.C, lpeg.R, lpeg.S, lpeg.Cs, lpeg.Cc, lpeg.Ct, lpeg.Cf, lpeg.Cg, lpeg.V
local lpegmatch, lpegpatterns, replacer = lpeg.match, lpeg.patterns, lpeg.replacer

-- from wikipedia:
--
--   foo://username:password@example.com:8042/over/there/index.dtb?type=animal;name=narwhal#nose
--   \_/   \_______________/ \_________/ \__/            \___/ \_/ \______________________/ \__/
--    |           |               |       |                |    |            |                |
--    |       userinfo         hostname  port              |    |          query          fragment
--    |    \________________________________/\_____________|____|/
-- scheme                  |                          |    |    |
--    |                authority                    path   |    |
--    |                                                    |    |
--    |            path                       interpretable as filename
--    |   ___________|____________                              |
--   / \ /                        \                             |
--   urn:example:animal:ferret:nose               interpretable as extension

url       = url or { }
local url = url

local tochar      = function(s) return char(tonumber(s,16)) end

local colon       = P(":")
local qmark       = P("?")
local hash        = P("#")
local slash       = P("/")
local percent     = P("%")
local endofstring = P(-1)

local hexdigit    = R("09","AF","af")
local plus        = P("+")
local nothing     = Cc("")
local escapedchar = (percent * C(hexdigit * hexdigit)) / tochar
local escaped     = (plus / " ") + escapedchar

local noslash     = P("/") / ""

-- we assume schemes with more than 1 character (in order to avoid problems with windows disks)
-- we also assume that when we have a scheme, we also have an authority
--
-- maybe we should already split the query (better for unescaping as = & can be part of a value

local schemestr    = Cs((escaped+(1-colon-slash-qmark-hash))^2)
local authoritystr = Cs((escaped+(1-      slash-qmark-hash))^0)
local pathstr      = Cs((escaped+(1-            qmark-hash))^0)
----- querystr     = Cs((escaped+(1-                  hash))^0)
local querystr     = Cs((        (1-                  hash))^0)
local fragmentstr  = Cs((escaped+(1-           endofstring))^0)

local scheme    =                 schemestr    * colon + nothing
local authority = slash * slash * authoritystr         + nothing
local path      = slash         * pathstr              + nothing
local query     = qmark         * querystr             + nothing
local fragment  = hash          * fragmentstr          + nothing

local validurl  = scheme * authority * path * query * fragment
local parser    = Ct(validurl)

lpegpatterns.url         = validurl
lpegpatterns.urlsplitter = parser

local escapes = { }

setmetatable(escapes, { __index = function(t,k)
    local v = format("%%%02X",byte(k))
    t[k] = v
    return v
end })

local escaper   = Cs((R("09","AZ","az")^1 + P(" ")/"%%20" + S("-./_")^1 + P(1) / escapes)^0) -- space happens most
local unescaper = Cs((escapedchar + 1)^0)

lpegpatterns.urlunescaped = escapedchar
lpegpatterns.urlescaper   = escaper
lpegpatterns.urlunescaper = unescaper

-- todo: reconsider Ct as we can as well have five return values (saves a table)
-- so we can have two parsers, one with and one without

local function split(str)
    return (type(str) == "string" and lpegmatch(parser,str)) or str
end

local isscheme = schemestr * colon * slash * slash -- this test also assumes authority

local function hasscheme(str)
    if str then
        local scheme = lpegmatch(isscheme,str) -- at least one character
        return scheme ~= "" and scheme or false
    else
        return false
    end
end

--~ print(hasscheme("home:"))
--~ print(hasscheme("home://"))

-- todo: cache them

local rootletter       = R("az","AZ")
                       + S("_-+")
local separator        = P("://")
local qualified        = P(".")^0 * P("/")
                       + rootletter * P(":")
                       + rootletter^1 * separator
                       + rootletter^1 * P("/")
local rootbased        = P("/")
                       + rootletter * P(":")

local barswapper       = replacer("|",":")
local backslashswapper = replacer("\\","/")

-- queries:

local equal = P("=")
local amp   = P("&")
local key   = Cs(((escapedchar+1)-equal            )^0)
local value = Cs(((escapedchar+1)-amp  -endofstring)^0)

local splitquery = Cf ( Ct("") * P { "sequence",
    sequence = V("pair") * (amp * V("pair"))^0,
    pair     = Cg(key * equal * value),
}, rawset)

-- hasher

local function hashed(str) -- not yet ok (/test?test)
    if str == "" then
        return {
            scheme   = "invalid",
            original = str,
        }
    end
    local s = split(str)
    local rawscheme  = s[1]
    local rawquery   = s[4]
    local somescheme = rawscheme ~= ""
    local somequery  = rawquery  ~= ""
    if not somescheme and not somequery then
        s = {
            scheme    = "file",
            authority = "",
            path      = str,
            query     = "",
            fragment  = "",
            original  = str,
            noscheme  = true,
            filename  = str,
        }
    else -- not always a filename but handy anyway
        local authority, path, filename = s[2], s[3]
        if authority == "" then
            filename = path
        elseif path == "" then
            filename = ""
        else
            filename = authority .. "/" .. path
        end
        s = {
            scheme    = rawscheme,
            authority = authority,
            path      = path,
            query     = lpegmatch(unescaper,rawquery),  -- unescaped, but possible conflict with & and =
            queries   = lpegmatch(splitquery,rawquery), -- split first and then unescaped
            fragment  = s[5],
            original  = str,
            noscheme  = false,
            filename  = filename,
        }
    end
    return s
end

-- inspect(hashed("template://test"))

-- Here we assume:
--
-- files: ///  = relative
-- files: //// = absolute (!)

--~ table.print(hashed("file://c:/opt/tex/texmf-local")) -- c:/opt/tex/texmf-local
--~ table.print(hashed("file://opt/tex/texmf-local"   )) -- opt/tex/texmf-local
--~ table.print(hashed("file:///opt/tex/texmf-local"  )) -- opt/tex/texmf-local
--~ table.print(hashed("file:////opt/tex/texmf-local" )) -- /opt/tex/texmf-local
--~ table.print(hashed("file:///./opt/tex/texmf-local" )) -- ./opt/tex/texmf-local

--~ table.print(hashed("c:/opt/tex/texmf-local"       )) -- c:/opt/tex/texmf-local
--~ table.print(hashed("opt/tex/texmf-local"          )) -- opt/tex/texmf-local
--~ table.print(hashed("/opt/tex/texmf-local"         )) -- /opt/tex/texmf-local

url.split     = split
url.hasscheme = hasscheme
url.hashed    = hashed

function url.addscheme(str,scheme) -- no authority
    if hasscheme(str) then
        return str
    elseif not scheme then
        return "file:///" .. str
    else
        return scheme .. ":///" .. str
    end
end

function url.construct(hash) -- dodo: we need to escape !
    local fullurl, f = { }, 0
    local scheme, authority, path, query, fragment = hash.scheme, hash.authority, hash.path, hash.query, hash.fragment
    if scheme and scheme ~= "" then
        f = f + 1 ; fullurl[f] = scheme .. "://"
    end
    if authority and authority ~= "" then
        f = f + 1 ; fullurl[f] = authority
    end
    if path and path ~= "" then
        f = f + 1 ; fullurl[f] = "/" .. path
    end
    if query and query ~= "" then
        f = f + 1 ; fullurl[f] = "?".. query
    end
    if fragment and fragment ~= "" then
        f = f + 1 ; fullurl[f] = "#".. fragment
    end
    return lpegmatch(escaper,concat(fullurl))
end

local pattern = Cs(noslash * R("az","AZ") * (S(":|")/":") * noslash * P(1)^0)

function url.filename(filename)
    local spec = hashed(filename)
    local path = spec.path
    return (spec.scheme == "file" and path and lpegmatch(pattern,path)) or filename
end

-- print(url.filename("/c|/test"))
-- print(url.filename("/c/test"))

local function escapestring(str)
    return lpegmatch(escaper,str)
end

url.escape = escapestring

function url.query(str)
    if type(str) == "string" then
        return lpegmatch(splitquery,str) or ""
    else
        return str
    end
end

function url.toquery(data)
    local td = type(data)
    if td == "string" then
        return #str and escape(data) or nil -- beware of double escaping
    elseif td == "table" then
        if next(data) then
            local t = { }
            for k, v in next, data do
                t[#t+1] = format("%s=%s",k,escapestring(v))
            end
            return concat(t,"&")
        end
    else
        -- nil is a signal that no query
    end
end

-- /test/ | /test | test/ | test => test

local pattern = Cs(noslash^0 * (1 - noslash * P(-1))^0)

function url.barepath(path)
    if not path or path == "" then
        return ""
    else
        return lpegmatch(pattern,path)
    end
end

-- print(url.barepath("/test"),url.barepath("test/"),url.barepath("/test/"),url.barepath("test"))
-- print(url.barepath("/x/yz"),url.barepath("x/yz/"),url.barepath("/x/yz/"),url.barepath("x/yz"))

--~ print(url.filename("file:///c:/oeps.txt"))
--~ print(url.filename("c:/oeps.txt"))
--~ print(url.filename("file:///oeps.txt"))
--~ print(url.filename("file:///etc/test.txt"))
--~ print(url.filename("/oeps.txt"))

--~ from the spec on the web (sort of):

--~ local function test(str)
--~     local t = url.hashed(str)
--~     t.constructed = url.construct(t)
--~     print(table.serialize(t))
--~ end

--~ inspect(url.hashed("http://www.pragma-ade.com/test%20test?test=test%20test&x=123%3d45"))
--~ inspect(url.hashed("http://www.pragma-ade.com/test%20test?test=test%20test&x=123%3d45"))

--~ test("sys:///./colo-rgb")

--~ test("/data/site/output/q2p-develop/resources/ecaboperception4_res/topicresources/58313733/figuur-cow.jpg")
--~ test("file:///M:/q2p/develop/output/q2p-develop/resources/ecaboperception4_res/topicresources/58313733")
--~ test("M:/q2p/develop/output/q2p-develop/resources/ecaboperception4_res/topicresources/58313733")
--~ test("file:///q2p/develop/output/q2p-develop/resources/ecaboperception4_res/topicresources/58313733")
--~ test("/q2p/develop/output/q2p-develop/resources/ecaboperception4_res/topicresources/58313733")

--~ test("file:///cow%20with%20spaces")
--~ test("file:///cow%20with%20spaces.pdf")
--~ test("cow%20with%20spaces.pdf")
--~ test("some%20file")
--~ test("/etc/passwords")
--~ test("http://www.myself.com/some%20words.html")
--~ test("file:///c:/oeps.txt")
--~ test("file:///c|/oeps.txt")
--~ test("file:///etc/oeps.txt")
--~ test("file://./etc/oeps.txt")
--~ test("file:////etc/oeps.txt")
--~ test("ftp://ftp.is.co.za/rfc/rfc1808.txt")
--~ test("http://www.ietf.org/rfc/rfc2396.txt")
--~ test("ldap://[2001:db8::7]/c=GB?objectClass?one#what")
--~ test("mailto:John.Doe@example.com")
--~ test("news:comp.infosystems.www.servers.unix")
--~ test("tel:+1-816-555-1212")
--~ test("telnet://192.0.2.16:80/")
--~ test("urn:oasis:names:specification:docbook:dtd:xml:4.1.2")
--~ test("http://www.pragma-ade.com/spaced%20name")

--~ test("zip:///oeps/oeps.zip#bla/bla.tex")
--~ test("zip:///oeps/oeps.zip?bla/bla.tex")

--~ table.print(url.hashed("/test?test"))
