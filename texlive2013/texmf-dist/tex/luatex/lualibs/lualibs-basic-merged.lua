-- merged file : lualibs-basic-merged.lua
-- parent file : lualibs-basic.lua
-- merge date  : Thu May 23 21:13:25 2013

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['l-lua']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local major,minor=string.match(_VERSION,"^[^%d]+(%d+)%.(%d+).*$")
_MAJORVERSION=tonumber(major) or 5
_MINORVERSION=tonumber(minor) or 1
_LUAVERSION=_MAJORVERSION+_MINORVERSION/10
if not lpeg then
  lpeg=require("lpeg")
end
if loadstring then
  local loadnormal=load
  function load(first,...)
    if type(first)=="string" then
      return loadstring(first,...)
    else
      return loadnormal(first,...)
    end
  end
else
  loadstring=load
end
if not ipairs then
  local function iterate(a,i)
    i=i+1
    local v=a[i]
    if v~=nil then
      return i,v 
    end
  end
  function ipairs(a)
    return iterate,a,0
  end
end
if not pairs then
  function pairs(t)
    return next,t 
  end
end
if not table.unpack then
  table.unpack=_G.unpack
elseif not unpack then
  _G.unpack=table.unpack
end
if not package.loaders then 
  package.loaders=package.searchers
end
local print,select,tostring=print,select,tostring
local inspectors={}
function setinspector(inspector) 
  inspectors[#inspectors+1]=inspector
end
function inspect(...) 
  for s=1,select("#",...) do
    local value=select(s,...)
    local done=false
    for i=1,#inspectors do
      done=inspectors[i](value)
      if done then
        break
      end
    end
    if not done then
      print(tostring(value))
    end
  end
end
local dummy=function() end
function optionalrequire(...)
  local ok,result=xpcall(require,dummy,...)
  if ok then
    return result
  end
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['l-package']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local type=type
local gsub,format=string.gsub,string.format
local P,S,Cs,lpegmatch=lpeg.P,lpeg.S,lpeg.Cs,lpeg.match
local package=package
local searchers=package.searchers or package.loaders
local filejoin=file and file.join    or function(path,name)  return path.."/"..name end
local isreadable=file and file.is_readable or function(name)    local f=io.open(name) if f then f:close() return true end end
local addsuffix=file and file.addsuffix  or function(name,suffix) return name.."."..suffix end
local function cleanpath(path) 
  return path
end
local pattern=Cs((((1-S("\\/"))^0*(S("\\/")^1/"/"))^0*(P(".")^1/"/"+P(1))^1)*-1)
local function lualibfile(name)
  return lpegmatch(pattern,name) or name
end
local offset=luarocks and 1 or 0 
local helpers=package.helpers or {
  cleanpath=cleanpath,
  lualibfile=lualibfile,
  trace=false,
  report=function(...) print(format(...)) end,
  builtin={
    ["preload table"]=searchers[1+offset],
    ["path specification"]=searchers[2+offset],
    ["cpath specification"]=searchers[3+offset],
    ["all in one fallback"]=searchers[4+offset],
  },
  methods={},
  sequence={
    "already loaded",
    "preload table",
    "lua extra list",
    "lib extra list",
    "path specification",
    "cpath specification",
    "all in one fallback",
    "not loaded",
  }
}
package.helpers=helpers
local methods=helpers.methods
local builtin=helpers.builtin
local extraluapaths={}
local extralibpaths={}
local luapaths=nil 
local libpaths=nil 
local oldluapath=nil
local oldlibpath=nil
local nofextralua=-1
local nofextralib=-1
local nofpathlua=-1
local nofpathlib=-1
local function listpaths(what,paths)
  local nofpaths=#paths
  if nofpaths>0 then
    for i=1,nofpaths do
      helpers.report("using %s path %i: %s",what,i,paths[i])
    end
  else
    helpers.report("no %s paths defined",what)
  end
  return nofpaths
end
local function getextraluapaths()
  if helpers.trace and #extraluapaths~=nofextralua then
    nofextralua=listpaths("extra lua",extraluapaths)
  end
  return extraluapaths
end
local function getextralibpaths()
  if helpers.trace and #extralibpaths~=nofextralib then
    nofextralib=listpaths("extra lib",extralibpaths)
  end
  return extralibpaths
end
local function getluapaths()
  local luapath=package.path or ""
  if oldluapath~=luapath then
    luapaths=file.splitpath(luapath,";")
    oldluapath=luapath
    nofpathlua=-1
  end
  if helpers.trace and #luapaths~=nofpathlua then
    nofpathlua=listpaths("builtin lua",luapaths)
  end
  return luapaths
end
local function getlibpaths()
  local libpath=package.cpath or ""
  if oldlibpath~=libpath then
    libpaths=file.splitpath(libpath,";")
    oldlibpath=libpath
    nofpathlib=-1
  end
  if helpers.trace and #libpaths~=nofpathlib then
    nofpathlib=listpaths("builtin lib",libpaths)
  end
  return libpaths
end
package.luapaths=getluapaths
package.libpaths=getlibpaths
package.extraluapaths=getextraluapaths
package.extralibpaths=getextralibpaths
local hashes={
  lua={},
  lib={},
}
local function registerpath(tag,what,target,...)
  local pathlist={... }
  local cleanpath=helpers.cleanpath
  local trace=helpers.trace
  local report=helpers.report
  local hash=hashes[what]
  local function add(path)
    local path=cleanpath(path)
    if not hash[path] then
      target[#target+1]=path
      hash[path]=true
      if trace then
        report("registered %s path %s: %s",tag,#target,path)
      end
    else
      if trace then
        report("duplicate %s path: %s",tag,path)
      end
    end
  end
  for p=1,#pathlist do
    local path=pathlist[p]
    if type(path)=="table" then
      for i=1,#path do
        add(path[i])
      end
    else
      add(path)
    end
  end
  return paths
end
helpers.registerpath=registerpath
function package.extraluapath(...)
  registerpath("extra lua","lua",extraluapaths,...)
end
function package.extralibpath(...)
  registerpath("extra lib","lib",extralibpaths,...)
end
local function loadedaslib(resolved,rawname) 
  local base=gsub(rawname,"%.","_")
  local init="luaopen_"..gsub(base,"%.","_")
  if helpers.trace then
    helpers.report("calling loadlib with '%s' with init '%s'",resolved,init)
  end
  return package.loadlib(resolved,init)
end
helpers.loadedaslib=loadedaslib
local function loadedbypath(name,rawname,paths,islib,what)
  local trace=helpers.trace
  for p=1,#paths do
    local path=paths[p]
    local resolved=filejoin(path,name)
    if trace then
      helpers.report("%s path, identifying '%s' on '%s'",what,name,path)
    end
    if isreadable(resolved) then
      if trace then
        helpers.report("%s path, '%s' found on '%s'",what,name,resolved)
      end
      if islib then
        return loadedaslib(resolved,rawname)
      else
        return loadfile(resolved)
      end
    end
  end
end
helpers.loadedbypath=loadedbypath
methods["already loaded"]=function(name)
  return package.loaded[name]
end
methods["preload table"]=function(name)
  return builtin["preload table"](name)
end
methods["lua extra list"]=function(name)
  return loadedbypath(addsuffix(lualibfile(name),"lua"    ),name,getextraluapaths(),false,"lua")
end
methods["lib extra list"]=function(name)
  return loadedbypath(addsuffix(lualibfile(name),os.libsuffix),name,getextralibpaths(),true,"lib")
end
methods["path specification"]=function(name)
  getluapaths() 
  return builtin["path specification"](name)
end
methods["cpath specification"]=function(name)
  getlibpaths() 
  return builtin["cpath specification"](name)
end
methods["all in one fallback"]=function(name)
  return builtin["all in one fallback"](name)
end
methods["not loaded"]=function(name)
  if helpers.trace then
    helpers.report("unable to locate '%s'",name or "?")
  end
  return nil
end
local level=0
local used={}
helpers.traceused=false
function helpers.loaded(name)
  local sequence=helpers.sequence
  level=level+1
  for i=1,#sequence do
    local method=sequence[i]
    if helpers.trace then
      helpers.report("%s, level '%s', method '%s', name '%s'","locating",level,method,name)
    end
    local result,rest=methods[method](name)
    if type(result)=="function" then
      if helpers.trace then
        helpers.report("%s, level '%s', method '%s', name '%s'","found",level,method,name)
      end
      if helpers.traceused then
        used[#used+1]={ level=level,name=name }
      end
      level=level-1
      return result,rest
    end
  end
  level=level-1
  return nil
end
function helpers.showused()
  local n=#used
  if n>0 then
    helpers.report("%s libraries loaded:",n)
    helpers.report()
    for i=1,n do
      local u=used[i]
      helpers.report("%i %a",u.level,u.name)
    end
    helpers.report()
   end
end
function helpers.unload(name)
  if helpers.trace then
    if package.loaded[name] then
      helpers.report("unloading, name '%s', %s",name,"done")
    else
      helpers.report("unloading, name '%s', %s",name,"not loaded")
    end
  end
  package.loaded[name]=nil
end
table.insert(searchers,1,helpers.loaded)

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['l-lpeg']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
lpeg=require("lpeg")
local type,next,tostring=type,next,tostring
local byte,char,gmatch,format=string.byte,string.char,string.gmatch,string.format
local floor=math.floor
local P,R,S,V,Ct,C,Cs,Cc,Cp,Cmt=lpeg.P,lpeg.R,lpeg.S,lpeg.V,lpeg.Ct,lpeg.C,lpeg.Cs,lpeg.Cc,lpeg.Cp,lpeg.Cmt
local lpegtype,lpegmatch,lpegprint=lpeg.type,lpeg.match,lpeg.print
setinspector(function(v) if lpegtype(v) then lpegprint(v) return true end end)
lpeg.patterns=lpeg.patterns or {} 
local patterns=lpeg.patterns
local anything=P(1)
local endofstring=P(-1)
local alwaysmatched=P(true)
patterns.anything=anything
patterns.endofstring=endofstring
patterns.beginofstring=alwaysmatched
patterns.alwaysmatched=alwaysmatched
local digit,sign=R('09'),S('+-')
local cr,lf,crlf=P("\r"),P("\n"),P("\r\n")
local newline=crlf+S("\r\n") 
local escaped=P("\\")*anything
local squote=P("'")
local dquote=P('"')
local space=P(" ")
local utfbom_32_be=P('\000\000\254\255')
local utfbom_32_le=P('\255\254\000\000')
local utfbom_16_be=P('\255\254')
local utfbom_16_le=P('\254\255')
local utfbom_8=P('\239\187\191')
local utfbom=utfbom_32_be+utfbom_32_le+utfbom_16_be+utfbom_16_le+utfbom_8
local utftype=utfbom_32_be*Cc("utf-32-be")+utfbom_32_le*Cc("utf-32-le")+utfbom_16_be*Cc("utf-16-be")+utfbom_16_le*Cc("utf-16-le")+utfbom_8*Cc("utf-8")+alwaysmatched*Cc("utf-8") 
local utfoffset=utfbom_32_be*Cc(4)+utfbom_32_le*Cc(4)+utfbom_16_be*Cc(2)+utfbom_16_le*Cc(2)+utfbom_8*Cc(3)+Cc(0)
local utf8next=R("\128\191")
patterns.utf8one=R("\000\127")
patterns.utf8two=R("\194\223")*utf8next
patterns.utf8three=R("\224\239")*utf8next*utf8next
patterns.utf8four=R("\240\244")*utf8next*utf8next*utf8next
patterns.utfbom=utfbom
patterns.utftype=utftype
patterns.utfoffset=utfoffset
local utf8char=patterns.utf8one+patterns.utf8two+patterns.utf8three+patterns.utf8four
local validutf8char=utf8char^0*endofstring*Cc(true)+Cc(false)
local utf8character=P(1)*R("\128\191")^0 
patterns.utf8=utf8char
patterns.utf8char=utf8char
patterns.utf8character=utf8character 
patterns.validutf8=validutf8char
patterns.validutf8char=validutf8char
local eol=S("\n\r")
local spacer=S(" \t\f\v") 
local whitespace=eol+spacer
local nonspacer=1-spacer
local nonwhitespace=1-whitespace
patterns.eol=eol
patterns.spacer=spacer
patterns.whitespace=whitespace
patterns.nonspacer=nonspacer
patterns.nonwhitespace=nonwhitespace
local stripper=spacer^0*C((spacer^0*nonspacer^1)^0)
local collapser=Cs(spacer^0/""*nonspacer^0*((spacer^0/" "*nonspacer^1)^0))
patterns.stripper=stripper
patterns.collapser=collapser
patterns.digit=digit
patterns.sign=sign
patterns.cardinal=sign^0*digit^1
patterns.integer=sign^0*digit^1
patterns.unsigned=digit^0*P('.')*digit^1
patterns.float=sign^0*patterns.unsigned
patterns.cunsigned=digit^0*P(',')*digit^1
patterns.cfloat=sign^0*patterns.cunsigned
patterns.number=patterns.float+patterns.integer
patterns.cnumber=patterns.cfloat+patterns.integer
patterns.oct=P("0")*R("07")^1
patterns.octal=patterns.oct
patterns.HEX=P("0x")*R("09","AF")^1
patterns.hex=P("0x")*R("09","af")^1
patterns.hexadecimal=P("0x")*R("09","AF","af")^1
patterns.lowercase=R("az")
patterns.uppercase=R("AZ")
patterns.letter=patterns.lowercase+patterns.uppercase
patterns.space=space
patterns.tab=P("\t")
patterns.spaceortab=patterns.space+patterns.tab
patterns.newline=newline
patterns.emptyline=newline^1
patterns.equal=P("=")
patterns.comma=P(",")
patterns.commaspacer=P(",")*spacer^0
patterns.period=P(".")
patterns.colon=P(":")
patterns.semicolon=P(";")
patterns.underscore=P("_")
patterns.escaped=escaped
patterns.squote=squote
patterns.dquote=dquote
patterns.nosquote=(escaped+(1-squote))^0
patterns.nodquote=(escaped+(1-dquote))^0
patterns.unsingle=(squote/"")*patterns.nosquote*(squote/"") 
patterns.undouble=(dquote/"")*patterns.nodquote*(dquote/"") 
patterns.unquoted=patterns.undouble+patterns.unsingle 
patterns.unspacer=((patterns.spacer^1)/"")^0
patterns.singlequoted=squote*patterns.nosquote*squote
patterns.doublequoted=dquote*patterns.nodquote*dquote
patterns.quoted=patterns.doublequoted+patterns.singlequoted
patterns.propername=R("AZ","az","__")*R("09","AZ","az","__")^0*P(-1)
patterns.somecontent=(anything-newline-space)^1 
patterns.beginline=#(1-newline)
patterns.longtostring=Cs(whitespace^0/""*nonwhitespace^0*((whitespace^0/" "*(patterns.quoted+nonwhitespace)^1)^0))
local function anywhere(pattern) 
  return P { P(pattern)+1*V(1) }
end
lpeg.anywhere=anywhere
function lpeg.instringchecker(p)
  p=anywhere(p)
  return function(str)
    return lpegmatch(p,str) and true or false
  end
end
function lpeg.splitter(pattern,action)
  return (((1-P(pattern))^1)/action+1)^0
end
function lpeg.tsplitter(pattern,action)
  return Ct((((1-P(pattern))^1)/action+1)^0)
end
local splitters_s,splitters_m,splitters_t={},{},{}
local function splitat(separator,single)
  local splitter=(single and splitters_s[separator]) or splitters_m[separator]
  if not splitter then
    separator=P(separator)
    local other=C((1-separator)^0)
    if single then
      local any=anything
      splitter=other*(separator*C(any^0)+"") 
      splitters_s[separator]=splitter
    else
      splitter=other*(separator*other)^0
      splitters_m[separator]=splitter
    end
  end
  return splitter
end
local function tsplitat(separator)
  local splitter=splitters_t[separator]
  if not splitter then
    splitter=Ct(splitat(separator))
    splitters_t[separator]=splitter
  end
  return splitter
end
lpeg.splitat=splitat
lpeg.tsplitat=tsplitat
function string.splitup(str,separator)
  if not separator then
    separator=","
  end
  return lpegmatch(splitters_m[separator] or splitat(separator),str)
end
local cache={}
function lpeg.split(separator,str)
  local c=cache[separator]
  if not c then
    c=tsplitat(separator)
    cache[separator]=c
  end
  return lpegmatch(c,str)
end
function string.split(str,separator)
  if separator then
    local c=cache[separator]
    if not c then
      c=tsplitat(separator)
      cache[separator]=c
    end
    return lpegmatch(c,str)
  else
    return { str }
  end
end
local spacing=patterns.spacer^0*newline 
local empty=spacing*Cc("")
local nonempty=Cs((1-spacing)^1)*spacing^-1
local content=(empty+nonempty)^1
patterns.textline=content
local linesplitter=tsplitat(newline)
patterns.linesplitter=linesplitter
function string.splitlines(str)
  return lpegmatch(linesplitter,str)
end
local cache={}
function lpeg.checkedsplit(separator,str)
  local c=cache[separator]
  if not c then
    separator=P(separator)
    local other=C((1-separator)^1)
    c=Ct(separator^0*other*(separator^1*other)^0)
    cache[separator]=c
  end
  return lpegmatch(c,str)
end
function string.checkedsplit(str,separator)
  local c=cache[separator]
  if not c then
    separator=P(separator)
    local other=C((1-separator)^1)
    c=Ct(separator^0*other*(separator^1*other)^0)
    cache[separator]=c
  end
  return lpegmatch(c,str)
end
local function f2(s) local c1,c2=byte(s,1,2) return  c1*64+c2-12416 end
local function f3(s) local c1,c2,c3=byte(s,1,3) return (c1*64+c2)*64+c3-925824 end
local function f4(s) local c1,c2,c3,c4=byte(s,1,4) return ((c1*64+c2)*64+c3)*64+c4-63447168 end
local utf8byte=patterns.utf8one/byte+patterns.utf8two/f2+patterns.utf8three/f3+patterns.utf8four/f4
patterns.utf8byte=utf8byte
local cache={}
function lpeg.stripper(str)
  if type(str)=="string" then
    local s=cache[str]
    if not s then
      s=Cs(((S(str)^1)/""+1)^0)
      cache[str]=s
    end
    return s
  else
    return Cs(((str^1)/""+1)^0)
  end
end
local cache={}
function lpeg.keeper(str)
  if type(str)=="string" then
    local s=cache[str]
    if not s then
      s=Cs((((1-S(str))^1)/""+1)^0)
      cache[str]=s
    end
    return s
  else
    return Cs((((1-str)^1)/""+1)^0)
  end
end
function lpeg.frontstripper(str) 
  return (P(str)+P(true))*Cs(anything^0)
end
function lpeg.endstripper(str) 
  return Cs((1-P(str)*endofstring)^0)
end
function lpeg.replacer(one,two,makefunction,isutf) 
  local pattern
  local u=isutf and utf8char or 1
  if type(one)=="table" then
    local no=#one
    local p=P(false)
    if no==0 then
      for k,v in next,one do
        p=p+P(k)/v
      end
      pattern=Cs((p+u)^0)
    elseif no==1 then
      local o=one[1]
      one,two=P(o[1]),o[2]
      pattern=Cs((one/two+u)^0)
    else
      for i=1,no do
        local o=one[i]
        p=p+P(o[1])/o[2]
      end
      pattern=Cs((p+u)^0)
    end
  else
    pattern=Cs((P(one)/(two or "")+u)^0)
  end
  if makefunction then
    return function(str)
      return lpegmatch(pattern,str)
    end
  else
    return pattern
  end
end
function lpeg.finder(lst,makefunction)
  local pattern
  if type(lst)=="table" then
    pattern=P(false)
    if #lst==0 then
      for k,v in next,lst do
        pattern=pattern+P(k) 
      end
    else
      for i=1,#lst do
        pattern=pattern+P(lst[i])
      end
    end
  else
    pattern=P(lst)
  end
  pattern=(1-pattern)^0*pattern
  if makefunction then
    return function(str)
      return lpegmatch(pattern,str)
    end
  else
    return pattern
  end
end
local splitters_f,splitters_s={},{}
function lpeg.firstofsplit(separator) 
  local splitter=splitters_f[separator]
  if not splitter then
    separator=P(separator)
    splitter=C((1-separator)^0)
    splitters_f[separator]=splitter
  end
  return splitter
end
function lpeg.secondofsplit(separator) 
  local splitter=splitters_s[separator]
  if not splitter then
    separator=P(separator)
    splitter=(1-separator)^0*separator*C(anything^0)
    splitters_s[separator]=splitter
  end
  return splitter
end
function lpeg.balancer(left,right)
  left,right=P(left),P(right)
  return P { left*((1-left-right)+V(1))^0*right }
end
local nany=utf8char/""
function lpeg.counter(pattern)
  pattern=Cs((P(pattern)/" "+nany)^0)
  return function(str)
    return #lpegmatch(pattern,str)
  end
end
utf=utf or (unicode and unicode.utf8) or {}
local utfcharacters=utf and utf.characters or string.utfcharacters
local utfgmatch=utf and utf.gmatch
local utfchar=utf and utf.char
lpeg.UP=lpeg.P
if utfcharacters then
  function lpeg.US(str)
    local p=P(false)
    for uc in utfcharacters(str) do
      p=p+P(uc)
    end
    return p
  end
elseif utfgmatch then
  function lpeg.US(str)
    local p=P(false)
    for uc in utfgmatch(str,".") do
      p=p+P(uc)
    end
    return p
  end
else
  function lpeg.US(str)
    local p=P(false)
    local f=function(uc)
      p=p+P(uc)
    end
    lpegmatch((utf8char/f)^0,str)
    return p
  end
end
local range=utf8byte*utf8byte+Cc(false) 
function lpeg.UR(str,more)
  local first,last
  if type(str)=="number" then
    first=str
    last=more or first
  else
    first,last=lpegmatch(range,str)
    if not last then
      return P(str)
    end
  end
  if first==last then
    return P(str)
  elseif utfchar and (last-first<8) then 
    local p=P(false)
    for i=first,last do
      p=p+P(utfchar(i))
    end
    return p 
  else
    local f=function(b)
      return b>=first and b<=last
    end
    return utf8byte/f 
  end
end
function lpeg.is_lpeg(p)
  return p and lpegtype(p)=="pattern"
end
function lpeg.oneof(list,...) 
  if type(list)~="table" then
    list={ list,... }
  end
  local p=P(list[1])
  for l=2,#list do
    p=p+P(list[l])
  end
  return p
end
local sort=table.sort
local function copyindexed(old)
  local new={}
  for i=1,#old do
    new[i]=old
  end
  return new
end
local function sortedkeys(tab)
  local keys,s={},0
  for key,_ in next,tab do
    s=s+1
    keys[s]=key
  end
  sort(keys)
  return keys
end
function lpeg.append(list,pp,delayed,checked)
  local p=pp
  if #list>0 then
    local keys=copyindexed(list)
    sort(keys)
    for i=#keys,1,-1 do
      local k=keys[i]
      if p then
        p=P(k)+p
      else
        p=P(k)
      end
    end
  elseif delayed then 
    local keys=sortedkeys(list)
    if p then
      for i=1,#keys,1 do
        local k=keys[i]
        local v=list[k]
        p=P(k)/list+p
      end
    else
      for i=1,#keys do
        local k=keys[i]
        local v=list[k]
        if p then
          p=P(k)+p
        else
          p=P(k)
        end
      end
      if p then
        p=p/list
      end
    end
  elseif checked then
    local keys=sortedkeys(list)
    for i=1,#keys do
      local k=keys[i]
      local v=list[k]
      if p then
        if k==v then
          p=P(k)+p
        else
          p=P(k)/v+p
        end
      else
        if k==v then
          p=P(k)
        else
          p=P(k)/v
        end
      end
    end
  else
    local keys=sortedkeys(list)
    for i=1,#keys do
      local k=keys[i]
      local v=list[k]
      if p then
        p=P(k)/v+p
      else
        p=P(k)/v
      end
    end
  end
  return p
end
local function make(t)
  local p
  local keys=sortedkeys(t)
  for i=1,#keys do
    local k=keys[i]
    local v=t[k]
    if not p then
      if next(v) then
        p=P(k)*make(v)
      else
        p=P(k)
      end
    else
      if next(v) then
        p=p+P(k)*make(v)
      else
        p=p+P(k)
      end
    end
  end
  return p
end
function lpeg.utfchartabletopattern(list) 
  local tree={}
  for i=1,#list do
    local t=tree
    for c in gmatch(list[i],".") do
      if not t[c] then
        t[c]={}
      end
      t=t[c]
    end
  end
  return make(tree)
end
patterns.containseol=lpeg.finder(eol)
local function nextstep(n,step,result)
  local m=n%step   
  local d=floor(n/step) 
  if d>0 then
    local v=V(tostring(step))
    local s=result.start
    for i=1,d do
      if s then
        s=v*s
      else
        s=v
      end
    end
    result.start=s
  end
  if step>1 and result.start then
    local v=V(tostring(step/2))
    result[tostring(step)]=v*v
  end
  if step>0 then
    return nextstep(m,step/2,result)
  else
    return result
  end
end
function lpeg.times(pattern,n)
  return P(nextstep(n,2^16,{ "start",["1"]=pattern }))
end
local digit=R("09")
local period=P(".")
local zero=P("0")
local trailingzeros=zero^0*-digit 
local case_1=period*trailingzeros/""
local case_2=period*(digit-trailingzeros)^1*(trailingzeros/"")
local number=digit^1*(case_1+case_2)
local stripper=Cs((number+1)^0)
lpeg.patterns.stripzeros=stripper

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['l-functions']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
functions=functions or {}
function functions.dummy() end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['l-string']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local string=string
local sub,gmatch,format,char,byte,rep,lower=string.sub,string.gmatch,string.format,string.char,string.byte,string.rep,string.lower
local lpegmatch,patterns=lpeg.match,lpeg.patterns
local P,S,C,Ct,Cc,Cs=lpeg.P,lpeg.S,lpeg.C,lpeg.Ct,lpeg.Cc,lpeg.Cs
local unquoted=patterns.squote*C(patterns.nosquote)*patterns.squote+patterns.dquote*C(patterns.nodquote)*patterns.dquote
function string.unquoted(str)
  return lpegmatch(unquoted,str) or str
end
function string.quoted(str)
  return format("%q",str) 
end
function string.count(str,pattern) 
  local n=0
  for _ in gmatch(str,pattern) do 
    n=n+1
  end
  return n
end
function string.limit(str,n,sentinel) 
  if #str>n then
    sentinel=sentinel or "..."
    return sub(str,1,(n-#sentinel))..sentinel
  else
    return str
  end
end
local stripper=patterns.stripper
local collapser=patterns.collapser
local longtostring=patterns.longtostring
function string.strip(str)
  return lpegmatch(stripper,str) or ""
end
function string.collapsespaces(str)
  return lpegmatch(collapser,str) or ""
end
function string.longtostring(str)
  return lpegmatch(longtostring,str) or ""
end
local pattern=P(" ")^0*P(-1)
function string.is_empty(str)
  if str=="" then
    return true
  else
    return lpegmatch(pattern,str) and true or false
  end
end
local anything=patterns.anything
local allescapes=Cc("%")*S(".-+%?()[]*") 
local someescapes=Cc("%")*S(".-+%()[]")  
local matchescapes=Cc(".")*S("*?")     
local pattern_a=Cs ((allescapes+anything )^0 )
local pattern_b=Cs ((someescapes+matchescapes+anything )^0 )
local pattern_c=Cs (Cc("^")*(someescapes+matchescapes+anything )^0*Cc("$") )
function string.escapedpattern(str,simple)
  return lpegmatch(simple and pattern_b or pattern_a,str)
end
function string.topattern(str,lowercase,strict)
  if str=="" or type(str)~="string" then
    return ".*"
  elseif strict then
    str=lpegmatch(pattern_c,str)
  else
    str=lpegmatch(pattern_b,str)
  end
  if lowercase then
    return lower(str)
  else
    return str
  end
end
function string.valid(str,default)
  return (type(str)=="string" and str~="" and str) or default or nil
end
string.itself=function(s) return s end
local pattern=Ct(C(1)^0) 
function string.totable(str)
  return lpegmatch(pattern,str)
end
local replacer=lpeg.replacer("@","%%") 
function string.tformat(fmt,...)
  return format(lpegmatch(replacer,fmt),...)
end
string.quote=string.quoted
string.unquote=string.unquoted

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['l-table']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local type,next,tostring,tonumber,ipairs,select=type,next,tostring,tonumber,ipairs,select
local table,string=table,string
local concat,sort,insert,remove=table.concat,table.sort,table.insert,table.remove
local format,lower,dump=string.format,string.lower,string.dump
local getmetatable,setmetatable=getmetatable,setmetatable
local getinfo=debug.getinfo
local lpegmatch,patterns=lpeg.match,lpeg.patterns
local floor=math.floor
local stripper=patterns.stripper
function table.strip(tab)
  local lst,l={},0
  for i=1,#tab do
    local s=lpegmatch(stripper,tab[i]) or ""
    if s=="" then
    else
      l=l+1
      lst[l]=s
    end
  end
  return lst
end
function table.keys(t)
  if t then
    local keys,k={},0
    for key,_ in next,t do
      k=k+1
      keys[k]=key
    end
    return keys
  else
    return {}
  end
end
local function compare(a,b)
  local ta,tb=type(a),type(b) 
  if ta==tb then
    return a<b
  else
    return tostring(a)<tostring(b)
  end
end
local function sortedkeys(tab)
  if tab then
    local srt,category,s={},0,0 
    for key,_ in next,tab do
      s=s+1
      srt[s]=key
      if category==3 then
      else
        local tkey=type(key)
        if tkey=="string" then
          category=(category==2 and 3) or 1
        elseif tkey=="number" then
          category=(category==1 and 3) or 2
        else
          category=3
        end
      end
    end
    if category==0 or category==3 then
      sort(srt,compare)
    else
      sort(srt)
    end
    return srt
  else
    return {}
  end
end
local function sortedhashkeys(tab,cmp) 
  if tab then
    local srt,s={},0
    for key,_ in next,tab do
      if key then
        s=s+1
        srt[s]=key
      end
    end
    sort(srt,cmp)
    return srt
  else
    return {}
  end
end
function table.allkeys(t)
  local keys={}
  for k,v in next,t do
    for k,v in next,v do
      keys[k]=true
    end
  end
  return sortedkeys(keys)
end
table.sortedkeys=sortedkeys
table.sortedhashkeys=sortedhashkeys
local function nothing() end
local function sortedhash(t,cmp)
  if t then
    local s
    if cmp then
      s=sortedhashkeys(t,function(a,b) return cmp(t,a,b) end)
    else
      s=sortedkeys(t) 
    end
    local n=0
    local function kv(s)
      n=n+1
      local k=s[n]
      return k,t[k]
    end
    return kv,s
  else
    return nothing
  end
end
table.sortedhash=sortedhash
table.sortedpairs=sortedhash 
function table.append(t,list)
  local n=#t
  for i=1,#list do
    n=n+1
    t[n]=list[i]
  end
  return t
end
function table.prepend(t,list)
  local nl=#list
  local nt=nl+#t
  for i=#t,1,-1 do
    t[nt]=t[i]
    nt=nt-1
  end
  for i=1,#list do
    t[i]=list[i]
  end
  return t
end
function table.merge(t,...) 
  t=t or {}
  for i=1,select("#",...) do
    for k,v in next,(select(i,...)) do
      t[k]=v
    end
  end
  return t
end
function table.merged(...)
  local t={}
  for i=1,select("#",...) do
    for k,v in next,(select(i,...)) do
      t[k]=v
    end
  end
  return t
end
function table.imerge(t,...)
  local nt=#t
  for i=1,select("#",...) do
    local nst=select(i,...)
    for j=1,#nst do
      nt=nt+1
      t[nt]=nst[j]
    end
  end
  return t
end
function table.imerged(...)
  local tmp,ntmp={},0
  for i=1,select("#",...) do
    local nst=select(i,...)
    for j=1,#nst do
      ntmp=ntmp+1
      tmp[ntmp]=nst[j]
    end
  end
  return tmp
end
local function fastcopy(old,metatabletoo) 
  if old then
    local new={}
    for k,v in next,old do
      if type(v)=="table" then
        new[k]=fastcopy(v,metatabletoo) 
      else
        new[k]=v
      end
    end
    if metatabletoo then
      local mt=getmetatable(old)
      if mt then
        setmetatable(new,mt)
      end
    end
    return new
  else
    return {}
  end
end
local function copy(t,tables) 
  tables=tables or {}
  local tcopy={}
  if not tables[t] then
    tables[t]=tcopy
  end
  for i,v in next,t do 
    if type(i)=="table" then
      if tables[i] then
        i=tables[i]
      else
        i=copy(i,tables)
      end
    end
    if type(v)~="table" then
      tcopy[i]=v
    elseif tables[v] then
      tcopy[i]=tables[v]
    else
      tcopy[i]=copy(v,tables)
    end
  end
  local mt=getmetatable(t)
  if mt then
    setmetatable(tcopy,mt)
  end
  return tcopy
end
table.fastcopy=fastcopy
table.copy=copy
function table.derive(parent) 
  local child={}
  if parent then
    setmetatable(child,{ __index=parent })
  end
  return child
end
function table.tohash(t,value)
  local h={}
  if t then
    if value==nil then value=true end
    for _,v in next,t do 
      h[v]=value
    end
  end
  return h
end
function table.fromhash(t)
  local hsh,h={},0
  for k,v in next,t do 
    if v then
      h=h+1
      hsh[h]=k
    end
  end
  return hsh
end
local noquotes,hexify,handle,reduce,compact,inline,functions
local reserved=table.tohash { 
  'and','break','do','else','elseif','end','false','for','function','if',
  'in','local','nil','not','or','repeat','return','then','true','until','while',
}
local function simple_table(t)
  if #t>0 then
    local n=0
    for _,v in next,t do
      n=n+1
    end
    if n==#t then
      local tt,nt={},0
      for i=1,#t do
        local v=t[i]
        local tv=type(v)
        if tv=="number" then
          nt=nt+1
          if hexify then
            tt[nt]=format("0x%04X",v)
          else
            tt[nt]=tostring(v) 
          end
        elseif tv=="boolean" then
          nt=nt+1
          tt[nt]=tostring(v)
        elseif tv=="string" then
          nt=nt+1
          tt[nt]=format("%q",v)
        else
          tt=nil
          break
        end
      end
      return tt
    end
  end
  return nil
end
local propername=patterns.propername 
local function dummy() end
local function do_serialize(root,name,depth,level,indexed)
  if level>0 then
    depth=depth.." "
    if indexed then
      handle(format("%s{",depth))
    else
      local tn=type(name)
      if tn=="number" then
        if hexify then
          handle(format("%s[0x%04X]={",depth,name))
        else
          handle(format("%s[%s]={",depth,name))
        end
      elseif tn=="string" then
        if noquotes and not reserved[name] and lpegmatch(propername,name) then
          handle(format("%s%s={",depth,name))
        else
          handle(format("%s[%q]={",depth,name))
        end
      elseif tn=="boolean" then
        handle(format("%s[%s]={",depth,tostring(name)))
      else
        handle(format("%s{",depth))
      end
    end
  end
  if root and next(root) then
    local first,last=nil,0
    if compact then
      last=#root
      for k=1,last do
        if root[k]==nil then
          last=k-1
          break
        end
      end
      if last>0 then
        first=1
      end
    end
    local sk=sortedkeys(root)
    for i=1,#sk do
      local k=sk[i]
      local v=root[k]
      local t,tk=type(v),type(k)
      if compact and first and tk=="number" and k>=first and k<=last then
        if t=="number" then
          if hexify then
            handle(format("%s 0x%04X,",depth,v))
          else
            handle(format("%s %s,",depth,v)) 
          end
        elseif t=="string" then
          if reduce and tonumber(v) then
            handle(format("%s %s,",depth,v))
          else
            handle(format("%s %q,",depth,v))
          end
        elseif t=="table" then
          if not next(v) then
            handle(format("%s {},",depth))
          elseif inline then 
            local st=simple_table(v)
            if st then
              handle(format("%s { %s },",depth,concat(st,", ")))
            else
              do_serialize(v,k,depth,level+1,true)
            end
          else
            do_serialize(v,k,depth,level+1,true)
          end
        elseif t=="boolean" then
          handle(format("%s %s,",depth,tostring(v)))
        elseif t=="function" then
          if functions then
            handle(format('%s load(%q),',depth,dump(v)))
          else
            handle(format('%s "function",',depth))
          end
        else
          handle(format("%s %q,",depth,tostring(v)))
        end
      elseif k=="__p__" then 
        if false then
          handle(format("%s __p__=nil,",depth))
        end
      elseif t=="number" then
        if tk=="number" then
          if hexify then
            handle(format("%s [0x%04X]=0x%04X,",depth,k,v))
          else
            handle(format("%s [%s]=%s,",depth,k,v)) 
          end
        elseif tk=="boolean" then
          if hexify then
            handle(format("%s [%s]=0x%04X,",depth,tostring(k),v))
          else
            handle(format("%s [%s]=%s,",depth,tostring(k),v)) 
          end
        elseif noquotes and not reserved[k] and lpegmatch(propername,k) then
          if hexify then
            handle(format("%s %s=0x%04X,",depth,k,v))
          else
            handle(format("%s %s=%s,",depth,k,v)) 
          end
        else
          if hexify then
            handle(format("%s [%q]=0x%04X,",depth,k,v))
          else
            handle(format("%s [%q]=%s,",depth,k,v)) 
          end
        end
      elseif t=="string" then
        if reduce and tonumber(v) then
          if tk=="number" then
            if hexify then
              handle(format("%s [0x%04X]=%s,",depth,k,v))
            else
              handle(format("%s [%s]=%s,",depth,k,v))
            end
          elseif tk=="boolean" then
            handle(format("%s [%s]=%s,",depth,tostring(k),v))
          elseif noquotes and not reserved[k] and lpegmatch(propername,k) then
            handle(format("%s %s=%s,",depth,k,v))
          else
            handle(format("%s [%q]=%s,",depth,k,v))
          end
        else
          if tk=="number" then
            if hexify then
              handle(format("%s [0x%04X]=%q,",depth,k,v))
            else
              handle(format("%s [%s]=%q,",depth,k,v))
            end
          elseif tk=="boolean" then
            handle(format("%s [%s]=%q,",depth,tostring(k),v))
          elseif noquotes and not reserved[k] and lpegmatch(propername,k) then
            handle(format("%s %s=%q,",depth,k,v))
          else
            handle(format("%s [%q]=%q,",depth,k,v))
          end
        end
      elseif t=="table" then
        if not next(v) then
          if tk=="number" then
            if hexify then
              handle(format("%s [0x%04X]={},",depth,k))
            else
              handle(format("%s [%s]={},",depth,k))
            end
          elseif tk=="boolean" then
            handle(format("%s [%s]={},",depth,tostring(k)))
          elseif noquotes and not reserved[k] and lpegmatch(propername,k) then
            handle(format("%s %s={},",depth,k))
          else
            handle(format("%s [%q]={},",depth,k))
          end
        elseif inline then
          local st=simple_table(v)
          if st then
            if tk=="number" then
              if hexify then
                handle(format("%s [0x%04X]={ %s },",depth,k,concat(st,", ")))
              else
                handle(format("%s [%s]={ %s },",depth,k,concat(st,", ")))
              end
            elseif tk=="boolean" then
              handle(format("%s [%s]={ %s },",depth,tostring(k),concat(st,", ")))
            elseif noquotes and not reserved[k] and lpegmatch(propername,k) then
              handle(format("%s %s={ %s },",depth,k,concat(st,", ")))
            else
              handle(format("%s [%q]={ %s },",depth,k,concat(st,", ")))
            end
          else
            do_serialize(v,k,depth,level+1)
          end
        else
          do_serialize(v,k,depth,level+1)
        end
      elseif t=="boolean" then
        if tk=="number" then
          if hexify then
            handle(format("%s [0x%04X]=%s,",depth,k,tostring(v)))
          else
            handle(format("%s [%s]=%s,",depth,k,tostring(v)))
          end
        elseif tk=="boolean" then
          handle(format("%s [%s]=%s,",depth,tostring(k),tostring(v)))
        elseif noquotes and not reserved[k] and lpegmatch(propername,k) then
          handle(format("%s %s=%s,",depth,k,tostring(v)))
        else
          handle(format("%s [%q]=%s,",depth,k,tostring(v)))
        end
      elseif t=="function" then
        if functions then
          local f=getinfo(v).what=="C" and dump(dummy) or dump(v)
          if tk=="number" then
            if hexify then
              handle(format("%s [0x%04X]=load(%q),",depth,k,f))
            else
              handle(format("%s [%s]=load(%q),",depth,k,f))
            end
          elseif tk=="boolean" then
            handle(format("%s [%s]=load(%q),",depth,tostring(k),f))
          elseif noquotes and not reserved[k] and lpegmatch(propername,k) then
            handle(format("%s %s=load(%q),",depth,k,f))
          else
            handle(format("%s [%q]=load(%q),",depth,k,f))
          end
        end
      else
        if tk=="number" then
          if hexify then
            handle(format("%s [0x%04X]=%q,",depth,k,tostring(v)))
          else
            handle(format("%s [%s]=%q,",depth,k,tostring(v)))
          end
        elseif tk=="boolean" then
          handle(format("%s [%s]=%q,",depth,tostring(k),tostring(v)))
        elseif noquotes and not reserved[k] and lpegmatch(propername,k) then
          handle(format("%s %s=%q,",depth,k,tostring(v)))
        else
          handle(format("%s [%q]=%q,",depth,k,tostring(v)))
        end
      end
    end
  end
  if level>0 then
    handle(format("%s},",depth))
  end
end
local function serialize(_handle,root,name,specification) 
  local tname=type(name)
  if type(specification)=="table" then
    noquotes=specification.noquotes
    hexify=specification.hexify
    handle=_handle or specification.handle or print
    reduce=specification.reduce or false
    functions=specification.functions
    compact=specification.compact
    inline=specification.inline and compact
    if functions==nil then
      functions=true
    end
    if compact==nil then
      compact=true
    end
    if inline==nil then
      inline=compact
    end
  else
    noquotes=false
    hexify=false
    handle=_handle or print
    reduce=false
    compact=true
    inline=true
    functions=true
  end
  if tname=="string" then
    if name=="return" then
      handle("return {")
    else
      handle(name.."={")
    end
  elseif tname=="number" then
    if hexify then
      handle(format("[0x%04X]={",name))
    else
      handle("["..name.."]={")
    end
  elseif tname=="boolean" then
    if name then
      handle("return {")
    else
      handle("{")
    end
  else
    handle("t={")
  end
  if root then
    if getmetatable(root) then 
      local dummy=root._w_h_a_t_e_v_e_r_
      root._w_h_a_t_e_v_e_r_=nil
    end
    if next(root) then
      do_serialize(root,name,"",0)
    end
  end
  handle("}")
end
function table.serialize(root,name,specification)
  local t,n={},0
  local function flush(s)
    n=n+1
    t[n]=s
  end
  serialize(flush,root,name,specification)
  return concat(t,"\n")
end
table.tohandle=serialize
local maxtab=2*1024
function table.tofile(filename,root,name,specification)
  local f=io.open(filename,'w')
  if f then
    if maxtab>1 then
      local t,n={},0
      local function flush(s)
        n=n+1
        t[n]=s
        if n>maxtab then
          f:write(concat(t,"\n"),"\n") 
          t,n={},0 
        end
      end
      serialize(flush,root,name,specification)
      f:write(concat(t,"\n"),"\n")
    else
      local function flush(s)
        f:write(s,"\n")
      end
      serialize(flush,root,name,specification)
    end
    f:close()
    io.flush()
  end
end
local function flattened(t,f,depth) 
  if f==nil then
    f={}
    depth=0xFFFF
  elseif tonumber(f) then
    depth=f
    f={}
  elseif not depth then
    depth=0xFFFF
  end
  for k,v in next,t do
    if type(k)~="number" then
      if depth>0 and type(v)=="table" then
        flattened(v,f,depth-1)
      else
        f[#f+1]=v
      end
    end
  end
  for k=1,#t do
    local v=t[k]
    if depth>0 and type(v)=="table" then
      flattened(v,f,depth-1)
    else
      f[#f+1]=v
    end
  end
  return f
end
table.flattened=flattened
local function unnest(t,f) 
  if not f then     
    f={}      
  end
  for i=1,#t do
    local v=t[i]
    if type(v)=="table" then
      if type(v[1])=="table" then
        unnest(v,f)
      else
        f[#f+1]=v
      end
    else
      f[#f+1]=v
    end
  end
  return f
end
function table.unnest(t) 
  return unnest(t)
end
local function are_equal(a,b,n,m) 
  if a and b and #a==#b then
    n=n or 1
    m=m or #a
    for i=n,m do
      local ai,bi=a[i],b[i]
      if ai==bi then
      elseif type(ai)=="table" and type(bi)=="table" then
        if not are_equal(ai,bi) then
          return false
        end
      else
        return false
      end
    end
    return true
  else
    return false
  end
end
local function identical(a,b) 
  for ka,va in next,a do
    local vb=b[ka]
    if va==vb then
    elseif type(va)=="table" and type(vb)=="table" then
      if not identical(va,vb) then
        return false
      end
    else
      return false
    end
  end
  return true
end
table.identical=identical
table.are_equal=are_equal
function table.compact(t) 
  if t then
    for k,v in next,t do
      if not next(v) then 
        t[k]=nil
      end
    end
  end
end
function table.contains(t,v)
  if t then
    for i=1,#t do
      if t[i]==v then
        return i
      end
    end
  end
  return false
end
function table.count(t)
  local n=0
  for k,v in next,t do
    n=n+1
  end
  return n
end
function table.swapped(t,s) 
  local n={}
  if s then
    for k,v in next,s do
      n[k]=v
    end
  end
  for k,v in next,t do
    n[v]=k
  end
  return n
end
function table.mirrored(t) 
  local n={}
  for k,v in next,t do
    n[v]=k
    n[k]=v
  end
  return n
end
function table.reversed(t)
  if t then
    local tt,tn={},#t
    if tn>0 then
      local ttn=0
      for i=tn,1,-1 do
        ttn=ttn+1
        tt[ttn]=t[i]
      end
    end
    return tt
  end
end
function table.reverse(t)
  if t then
    local n=#t
    for i=1,floor(n/2) do
      local j=n-i+1
      t[i],t[j]=t[j],t[i]
    end
    return t
  end
end
function table.sequenced(t,sep,simple) 
  if not t then
    return ""
  end
  local n=#t
  local s={}
  if n>0 then
    for i=1,n do
      s[i]=tostring(t[i])
    end
  else
    n=0
    for k,v in sortedhash(t) do
      if simple then
        if v==true then
          n=n+1
          s[n]=k
        elseif v and v~="" then
          n=n+1
          s[n]=k.."="..tostring(v)
        end
      else
        n=n+1
        s[n]=k.."="..tostring(v)
      end
    end
  end
  return concat(s,sep or " | ")
end
function table.print(t,...)
  if type(t)~="table" then
    print(tostring(t))
  else
    serialize(print,t,...)
  end
end
setinspector(function(v) if type(v)=="table" then serialize(print,v,"table") return true end end)
function table.sub(t,i,j)
  return { unpack(t,i,j) }
end
function table.is_empty(t)
  return not t or not next(t)
end
function table.has_one_entry(t)
  return t and not next(t,next(t))
end
function table.loweredkeys(t) 
  local l={}
  for k,v in next,t do
    l[lower(k)]=v
  end
  return l
end
function table.unique(old)
  local hash={}
  local new={}
  local n=0
  for i=1,#old do
    local oi=old[i]
    if not hash[oi] then
      n=n+1
      new[n]=oi
      hash[oi]=true
    end
  end
  return new
end
function table.sorted(t,...)
  sort(t,...)
  return t 
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['l-boolean']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local type,tonumber=type,tonumber
boolean=boolean or {}
local boolean=boolean
function boolean.tonumber(b)
  if b then return 1 else return 0 end 
end
function toboolean(str,tolerant) 
  if str==nil then
    return false
  elseif str==false then
    return false
  elseif str==true then
    return true
  elseif str=="true" then
    return true
  elseif str=="false" then
    return false
  elseif not tolerant then
    return false
  elseif str==0 then
    return false
  elseif (tonumber(str) or 0)>0 then
    return true
  else
    return str=="yes" or str=="on" or str=="t"
  end
end
string.toboolean=toboolean
function string.booleanstring(str)
  if str=="0" then
    return false
  elseif str=="1" then
    return true
  elseif str=="" then
    return false
  elseif str=="false" then
    return false
  elseif str=="true" then
    return true
  elseif (tonumber(str) or 0)>0 then
    return true
  else
    return str=="yes" or str=="on" or str=="t"
  end
end
function string.is_boolean(str,default)
  if type(str)=="string" then
    if str=="true" or str=="yes" or str=="on" or str=="t" then
      return true
    elseif str=="false" or str=="no" or str=="off" or str=="f" then
      return false
    end
  end
  return default
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['l-number']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local tostring,tonumber=tostring,tonumber
local format,floor,match,rep=string.format,math.floor,string.match,string.rep
local concat,insert=table.concat,table.insert
local lpegmatch=lpeg.match
number=number or {}
local number=number
if bit32 then 
  local btest,bor=bit32.btest,bit32.bor
  function number.bit(p)
    return 2^(p-1) 
  end
  number.hasbit=btest
  number.setbit=bor
  function number.setbit(x,p) 
    return btest(x,p) and x or x+p
  end
  function number.clearbit(x,p)
    return btest(x,p) and x-p or x
  end
else
  function number.bit(p)
    return 2^(p-1) 
  end
  function number.hasbit(x,p) 
    return x%(p+p)>=p
  end
  function number.setbit(x,p)
    return (x%(p+p)>=p) and x or x+p
  end
  function number.clearbit(x,p)
    return (x%(p+p)>=p) and x-p or x
  end
end
if bit32 then
  local bextract=bit32.extract
  local t={
    "0","0","0","0","0","0","0","0",
    "0","0","0","0","0","0","0","0",
    "0","0","0","0","0","0","0","0",
    "0","0","0","0","0","0","0","0",
  }
  function number.tobitstring(b,m)
    local n=32
    for i=0,31 do
      local v=bextract(b,i)
      local k=32-i
      if v==1 then
        n=k
        t[k]="1"
      else
        t[k]="0"
      end
    end
    if m then
      m=33-m*8
      if m<1 then
        m=1
      end
      return concat(t,"",m)
    elseif n<8 then
      return concat(t)
    elseif n<16 then
      return concat(t,"",9)
    elseif n<24 then
      return concat(t,"",17)
    else
      return concat(t,"",25)
    end
  end
else
  function number.tobitstring(n,m)
    if n>0 then
      local t={}
      while n>0 do
        insert(t,1,n%2>0 and 1 or 0)
        n=floor(n/2)
      end
      local nn=8-#t%8
      if nn>0 and nn<8 then
        for i=1,nn do
          insert(t,1,0)
        end
      end
      if m then
        m=m*8-#t
        if m>0 then
          insert(t,1,rep("0",m))
        end
      end
      return concat(t)
    elseif m then
      rep("00000000",m)
    else
      return "00000000"
    end
  end
end
function number.valid(str,default)
  return tonumber(str) or default or nil
end
function number.toevenhex(n)
  local s=format("%X",n)
  if #s%2==0 then
    return s
  else
    return "0"..s
  end
end
local one=lpeg.C(1-lpeg.S('')/tonumber)^1
function number.toset(n)
  return lpegmatch(one,tostring(n))
end
local function bits(n,i,...)
  if n>0 then
    local m=n%2
    local n=floor(n/2)
    if m>0 then
      return bits(n,i+1,i,...)
    else
      return bits(n,i+1,...)
    end
  else
    return...
  end
end
function number.bits(n)
  return { bits(n,1) }
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['l-math']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local floor,sin,cos,tan=math.floor,math.sin,math.cos,math.tan
if not math.round then
  function math.round(x) return floor(x+0.5) end
end
if not math.div then
  function math.div(n,m) return floor(n/m) end
end
if not math.mod then
  function math.mod(n,m) return n%m end
end
local pipi=2*math.pi/360
if not math.sind then
  function math.sind(d) return sin(d*pipi) end
  function math.cosd(d) return cos(d*pipi) end
  function math.tand(d) return tan(d*pipi) end
end
if not math.odd then
  function math.odd (n) return n%2~=0 end
  function math.even(n) return n%2==0 end
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['l-io']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local io=io
local byte,find,gsub,format=string.byte,string.find,string.gsub,string.format
local concat=table.concat
local floor=math.floor
local type=type
if string.find(os.getenv("PATH"),";") then
  io.fileseparator,io.pathseparator="\\",";"
else
  io.fileseparator,io.pathseparator="/",":"
end
local function readall(f)
  return f:read("*all")
end
local function readall(f)
  local size=f:seek("end")
  if size==0 then
    return ""
  elseif size<1024*1024 then
    f:seek("set",0)
    return f:read('*all')
  else
    local done=f:seek("set",0)
    if size<1024*1024 then
      step=1024*1024
    elseif size>16*1024*1024 then
      step=16*1024*1024
    else
      step=floor(size/(1024*1024))*1024*1024/8
    end
    local data={}
    while true do
      local r=f:read(step)
      if not r then
        return concat(data)
      else
        data[#data+1]=r
      end
    end
  end
end
io.readall=readall
function io.loaddata(filename,textmode) 
  local f=io.open(filename,(textmode and 'r') or 'rb')
  if f then
    local data=readall(f)
    f:close()
    if #data>0 then
      return data
    end
  end
end
function io.savedata(filename,data,joiner)
  local f=io.open(filename,"wb")
  if f then
    if type(data)=="table" then
      f:write(concat(data,joiner or ""))
    elseif type(data)=="function" then
      data(f)
    else
      f:write(data or "")
    end
    f:close()
    io.flush()
    return true
  else
    return false
  end
end
function io.loadlines(filename,n) 
  local f=io.open(filename,'r')
  if not f then
  elseif n then
    local lines={}
    for i=1,n do
      local line=f:read("*lines")
      if line then
        lines[#lines+1]=line
      else
        break
      end
    end
    f:close()
    lines=concat(lines,"\n")
    if #lines>0 then
      return lines
    end
  else
    local line=f:read("*line") or ""
    f:close()
    if #line>0 then
      return line
    end
  end
end
function io.loadchunk(filename,n)
  local f=io.open(filename,'rb')
  if f then
    local data=f:read(n or 1024)
    f:close()
    if #data>0 then
      return data
    end
  end
end
function io.exists(filename)
  local f=io.open(filename)
  if f==nil then
    return false
  else
    f:close()
    return true
  end
end
function io.size(filename)
  local f=io.open(filename)
  if f==nil then
    return 0
  else
    local s=f:seek("end")
    f:close()
    return s
  end
end
function io.noflines(f)
  if type(f)=="string" then
    local f=io.open(filename)
    if f then
      local n=f and io.noflines(f) or 0
      f:close()
      return n
    else
      return 0
    end
  else
    local n=0
    for _ in f:lines() do
      n=n+1
    end
    f:seek('set',0)
    return n
  end
end
local nextchar={
  [ 4]=function(f)
    return f:read(1,1,1,1)
  end,
  [ 2]=function(f)
    return f:read(1,1)
  end,
  [ 1]=function(f)
    return f:read(1)
  end,
  [-2]=function(f)
    local a,b=f:read(1,1)
    return b,a
  end,
  [-4]=function(f)
    local a,b,c,d=f:read(1,1,1,1)
    return d,c,b,a
  end
}
function io.characters(f,n)
  if f then
    return nextchar[n or 1],f
  end
end
local nextbyte={
  [4]=function(f)
    local a,b,c,d=f:read(1,1,1,1)
    if d then
      return byte(a),byte(b),byte(c),byte(d)
    end
  end,
  [3]=function(f)
    local a,b,c=f:read(1,1,1)
    if b then
      return byte(a),byte(b),byte(c)
    end
  end,
  [2]=function(f)
    local a,b=f:read(1,1)
    if b then
      return byte(a),byte(b)
    end
  end,
  [1]=function (f)
    local a=f:read(1)
    if a then
      return byte(a)
    end
  end,
  [-2]=function (f)
    local a,b=f:read(1,1)
    if b then
      return byte(b),byte(a)
    end
  end,
  [-3]=function(f)
    local a,b,c=f:read(1,1,1)
    if b then
      return byte(c),byte(b),byte(a)
    end
  end,
  [-4]=function(f)
    local a,b,c,d=f:read(1,1,1,1)
    if d then
      return byte(d),byte(c),byte(b),byte(a)
    end
  end
}
function io.bytes(f,n)
  if f then
    return nextbyte[n or 1],f
  else
    return nil,nil
  end
end
function io.ask(question,default,options)
  while true do
    io.write(question)
    if options then
      io.write(format(" [%s]",concat(options,"|")))
    end
    if default then
      io.write(format(" [%s]",default))
    end
    io.write(format(" "))
    io.flush()
    local answer=io.read()
    answer=gsub(answer,"^%s*(.*)%s*$","%1")
    if answer=="" and default then
      return default
    elseif not options then
      return answer
    else
      for k=1,#options do
        if options[k]==answer then
          return answer
        end
      end
      local pattern="^"..answer
      for k=1,#options do
        local v=options[k]
        if find(v,pattern) then
          return v
        end
      end
    end
  end
end
local function readnumber(f,n,m)
  if m then
    f:seek("set",n)
    n=m
  end
  if n==1 then
    return byte(f:read(1))
  elseif n==2 then
    local a,b=byte(f:read(2),1,2)
    return 256*a+b
  elseif n==3 then
    local a,b,c=byte(f:read(3),1,3)
    return 256*256*a+256*b+c
  elseif n==4 then
    local a,b,c,d=byte(f:read(4),1,4)
    return 256*256*256*a+256*256*b+256*c+d
  elseif n==8 then
    local a,b=readnumber(f,4),readnumber(f,4)
    return 256*a+b
  elseif n==12 then
    local a,b,c=readnumber(f,4),readnumber(f,4),readnumber(f,4)
    return 256*256*a+256*b+c
  elseif n==-2 then
    local b,a=byte(f:read(2),1,2)
    return 256*a+b
  elseif n==-3 then
    local c,b,a=byte(f:read(3),1,3)
    return 256*256*a+256*b+c
  elseif n==-4 then
    local d,c,b,a=byte(f:read(4),1,4)
    return 256*256*256*a+256*256*b+256*c+d
  elseif n==-8 then
    local h,g,f,e,d,c,b,a=byte(f:read(8),1,8)
    return 256*256*256*256*256*256*256*a+256*256*256*256*256*256*b+256*256*256*256*256*c+256*256*256*256*d+256*256*256*e+256*256*f+256*g+h
  else
    return 0
  end
end
io.readnumber=readnumber
function io.readstring(f,n,m)
  if m then
    f:seek("set",n)
    n=m
  end
  local str=gsub(f:read(n),"\000","")
  return str
end
if not io.i_limiter then function io.i_limiter() end end 
if not io.o_limiter then function io.o_limiter() end end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['l-os']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local os=os
local date,time=os.date,os.time
local find,format,gsub,upper,gmatch=string.find,string.format,string.gsub,string.upper,string.gmatch
local concat=table.concat
local random,ceil,randomseed=math.random,math.ceil,math.randomseed
local rawget,rawset,type,getmetatable,setmetatable,tonumber,tostring=rawget,rawset,type,getmetatable,setmetatable,tonumber,tostring
math.initialseed=tonumber(string.sub(string.reverse(tostring(ceil(socket and socket.gettime()*10000 or time()))),1,6))
randomseed(math.initialseed)
if not os.__getenv__ then
  os.__getenv__=os.getenv
  os.__setenv__=os.setenv
  if os.env then
    local osgetenv=os.getenv
    local ossetenv=os.setenv
    local osenv=os.env   local _=osenv.PATH 
    function os.setenv(k,v)
      if v==nil then
        v=""
      end
      local K=upper(k)
      osenv[K]=v
      if type(v)=="table" then
        v=concat(v,";") 
      end
      ossetenv(K,v)
    end
    function os.getenv(k)
      local K=upper(k)
      local v=osenv[K] or osenv[k] or osgetenv(K) or osgetenv(k)
      if v=="" then
        return nil
      else
        return v
      end
    end
  else
    local ossetenv=os.setenv
    local osgetenv=os.getenv
    local osenv={}
    function os.setenv(k,v)
      if v==nil then
        v=""
      end
      local K=upper(k)
      osenv[K]=v
    end
    function os.getenv(k)
      local K=upper(k)
      local v=osenv[K] or osgetenv(K) or osgetenv(k)
      if v=="" then
        return nil
      else
        return v
      end
    end
    local function __index(t,k)
      return os.getenv(k)
    end
    local function __newindex(t,k,v)
      os.setenv(k,v)
    end
    os.env={}
    setmetatable(os.env,{ __index=__index,__newindex=__newindex } )
  end
end
local execute,spawn,exec,iopopen,ioflush=os.execute,os.spawn or os.execute,os.exec or os.execute,io.popen,io.flush
function os.execute(...) ioflush() return execute(...) end
function os.spawn (...) ioflush() return spawn (...) end
function os.exec  (...) ioflush() return exec  (...) end
function io.popen (...) ioflush() return iopopen(...) end
function os.resultof(command)
  local handle=io.popen(command,"r")
  return handle and handle:read("*all") or ""
end
if not io.fileseparator then
  if find(os.getenv("PATH"),";") then
    io.fileseparator,io.pathseparator,os.type="\\",";",os.type or "mswin"
  else
    io.fileseparator,io.pathseparator,os.type="/",":",os.type or "unix"
  end
end
os.type=os.type or (io.pathseparator==";"    and "windows") or "unix"
os.name=os.name or (os.type=="windows" and "mswin" ) or "linux"
if os.type=="windows" then
  os.libsuffix,os.binsuffix,os.binsuffixes='dll','exe',{ 'exe','cmd','bat' }
else
  os.libsuffix,os.binsuffix,os.binsuffixes='so','',{ '' }
end
local launchers={
  windows="start %s",
  macosx="open %s",
  unix="$BROWSER %s &> /dev/null &",
}
function os.launch(str)
  os.execute(format(launchers[os.name] or launchers.unix,str))
end
if not os.times then
  function os.times()
    return {
      utime=os.gettimeofday(),
      stime=0,
      cutime=0,
      cstime=0,
    }
  end
end
os.gettimeofday=os.gettimeofday or os.clock
local startuptime=os.gettimeofday()
function os.runtime()
  return os.gettimeofday()-startuptime
end
os.resolvers=os.resolvers or {} 
local resolvers=os.resolvers
setmetatable(os,{ __index=function(t,k)
  local r=resolvers[k]
  return r and r(t,k) or nil 
end })
local name,platform=os.name or "linux",os.getenv("MTX_PLATFORM") or ""
local function guess()
  local architecture=os.resultof("uname -m") or ""
  if architecture~="" then
    return architecture
  end
  architecture=os.getenv("HOSTTYPE") or ""
  if architecture~="" then
    return architecture
  end
  return os.resultof("echo $HOSTTYPE") or ""
end
if platform~="" then
  os.platform=platform
elseif os.type=="windows" then
  function os.resolvers.platform(t,k)
    local platform,architecture="",os.getenv("PROCESSOR_ARCHITECTURE") or ""
    if find(architecture,"AMD64") then
      platform="mswin-64"
    else
      platform="mswin"
    end
    os.setenv("MTX_PLATFORM",platform)
    os.platform=platform
    return platform
  end
elseif name=="linux" then
  function os.resolvers.platform(t,k)
    local platform,architecture="",os.getenv("HOSTTYPE") or os.resultof("uname -m") or ""
    if find(architecture,"x86_64") then
      platform="linux-64"
    elseif find(architecture,"ppc") then
      platform="linux-ppc"
    else
      platform="linux"
    end
    os.setenv("MTX_PLATFORM",platform)
    os.platform=platform
    return platform
  end
elseif name=="macosx" then
  function os.resolvers.platform(t,k)
    local platform,architecture="",os.resultof("echo $HOSTTYPE") or ""
    if architecture=="" then
      platform="osx-intel"
    elseif find(architecture,"i386") then
      platform="osx-intel"
    elseif find(architecture,"x86_64") then
      platform="osx-64"
    else
      platform="osx-ppc"
    end
    os.setenv("MTX_PLATFORM",platform)
    os.platform=platform
    return platform
  end
elseif name=="sunos" then
  function os.resolvers.platform(t,k)
    local platform,architecture="",os.resultof("uname -m") or ""
    if find(architecture,"sparc") then
      platform="solaris-sparc"
    else 
      platform="solaris-intel"
    end
    os.setenv("MTX_PLATFORM",platform)
    os.platform=platform
    return platform
  end
elseif name=="freebsd" then
  function os.resolvers.platform(t,k)
    local platform,architecture="",os.resultof("uname -m") or ""
    if find(architecture,"amd64") then
      platform="freebsd-amd64"
    else
      platform="freebsd"
    end
    os.setenv("MTX_PLATFORM",platform)
    os.platform=platform
    return platform
  end
elseif name=="kfreebsd" then
  function os.resolvers.platform(t,k)
    local platform,architecture="",os.getenv("HOSTTYPE") or os.resultof("uname -m") or ""
    if find(architecture,"x86_64") then
      platform="kfreebsd-amd64"
    else
      platform="kfreebsd-i386"
    end
    os.setenv("MTX_PLATFORM",platform)
    os.platform=platform
    return platform
  end
else
  function os.resolvers.platform(t,k)
    local platform="linux"
    os.setenv("MTX_PLATFORM",platform)
    os.platform=platform
    return platform
  end
end
local t={ 8,9,"a","b" }
function os.uuid()
  return format("%04x%04x-4%03x-%s%03x-%04x-%04x%04x%04x",
    random(0xFFFF),random(0xFFFF),
    random(0x0FFF),
    t[ceil(random(4))] or 8,random(0x0FFF),
    random(0xFFFF),
    random(0xFFFF),random(0xFFFF),random(0xFFFF)
  )
end
local d
function os.timezone(delta)
  d=d or tonumber(tonumber(date("%H")-date("!%H")))
  if delta then
    if d>0 then
      return format("+%02i:00",d)
    else
      return format("-%02i:00",-d)
    end
  else
    return 1
  end
end
local timeformat=format("%%s%s",os.timezone(true))
local dateformat="!%Y-%m-%d %H:%M:%S"
function os.fulltime(t,default)
  t=tonumber(t) or 0
  if t>0 then
  elseif default then
    return default
  else
    t=nil
  end
  return format(timeformat,date(dateformat,t))
end
local dateformat="%Y-%m-%d %H:%M:%S"
function os.localtime(t,default)
  t=tonumber(t) or 0
  if t>0 then
  elseif default then
    return default
  else
    t=nil
  end
  return date(dateformat,t)
end
function os.converttime(t,default)
  local t=tonumber(t)
  if t and t>0 then
    return date(dateformat,t)
  else
    return default or "-"
  end
end
local memory={}
local function which(filename)
  local fullname=memory[filename]
  if fullname==nil then
    local suffix=file.suffix(filename)
    local suffixes=suffix=="" and os.binsuffixes or { suffix }
    for directory in gmatch(os.getenv("PATH"),"[^"..io.pathseparator.."]+") do
      local df=file.join(directory,filename)
      for i=1,#suffixes do
        local dfs=file.addsuffix(df,suffixes[i])
        if io.exists(dfs) then
          fullname=dfs
          break
        end
      end
    end
    if not fullname then
      fullname=false
    end
    memory[filename]=fullname
  end
  return fullname
end
os.which=which
os.where=which
function os.today()
  return date("!*t") 
end
function os.now()
  return date("!%Y-%m-%d %H:%M:%S") 
end
if not os.sleep then
  local socket=socket
  function os.sleep(n)
    if not socket then
      socket=require("socket")
    end
    socket.sleep(n)
  end
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['l-file']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
file=file or {}
local file=file
if not lfs then
  lfs=optionalrequire("lfs")
end
if not lfs then
  lfs={
    getcurrentdir=function()
      return "."
    end,
    attributes=function()
      return nil
    end,
    isfile=function(name)
      local f=io.open(name,'rb')
      if f then
        f:close()
        return true
      end
    end,
    isdir=function(name)
      print("you need to load lfs")
      return false
    end
  }
elseif not lfs.isfile then
  local attributes=lfs.attributes
  function lfs.isdir(name)
    return attributes(name,"mode")=="directory"
  end
  function lfs.isfile(name)
    return attributes(name,"mode")=="file"
  end
end
local insert,concat=table.insert,table.concat
local match,find,gmatch=string.match,string.find,string.gmatch
local lpegmatch=lpeg.match
local getcurrentdir,attributes=lfs.currentdir,lfs.attributes
local checkedsplit=string.checkedsplit
local P,R,S,C,Cs,Cp,Cc,Ct=lpeg.P,lpeg.R,lpeg.S,lpeg.C,lpeg.Cs,lpeg.Cp,lpeg.Cc,lpeg.Ct
local colon=P(":")
local period=P(".")
local periods=P("..")
local fwslash=P("/")
local bwslash=P("\\")
local slashes=S("\\/")
local noperiod=1-period
local noslashes=1-slashes
local name=noperiod^1
local suffix=period/""*(1-period-slashes)^1*-1
local pattern=C((1-(slashes^1*noslashes^1*-1))^1)*P(1) 
local function pathpart(name,default)
  return name and lpegmatch(pattern,name) or default or ""
end
local pattern=(noslashes^0*slashes)^1*C(noslashes^1)*-1
local function basename(name)
  return name and lpegmatch(pattern,name) or name
end
local pattern=(noslashes^0*slashes^1)^0*Cs((1-suffix)^1)*suffix^0
local function nameonly(name)
  return name and lpegmatch(pattern,name) or name
end
local pattern=(noslashes^0*slashes)^0*(noperiod^1*period)^1*C(noperiod^1)*-1
local function suffixonly(name)
  return name and lpegmatch(pattern,name) or ""
end
local pattern=(noslashes^0*slashes)^0*noperiod^1*((period*C(noperiod^1))^1)*-1+Cc("")
local function suffixesonly(name)
  if name then
    return lpegmatch(pattern,name)
  else
    return ""
  end
end
file.pathpart=pathpart
file.basename=basename
file.nameonly=nameonly
file.suffixonly=suffixonly
file.suffix=suffixonly
file.suffixesonly=suffixesonly
file.suffixes=suffixesonly
file.dirname=pathpart  
file.extname=suffixonly
local drive=C(R("az","AZ"))*colon
local path=C((noslashes^0*slashes)^0)
local suffix=period*C(P(1-period)^0*P(-1))
local base=C((1-suffix)^0)
local rest=C(P(1)^0)
drive=drive+Cc("")
path=path+Cc("")
base=base+Cc("")
suffix=suffix+Cc("")
local pattern_a=drive*path*base*suffix
local pattern_b=path*base*suffix
local pattern_c=C(drive*path)*C(base*suffix) 
local pattern_d=path*rest
function file.splitname(str,splitdrive)
  if not str then
  elseif splitdrive then
    return lpegmatch(pattern_a,str) 
  else
    return lpegmatch(pattern_b,str) 
  end
end
function file.splitbase(str)
  if str then
    return lpegmatch(pattern_d,str) 
  else
    return "",str 
  end
end
function file.nametotable(str,splitdrive)
  if str then
    local path,drive,subpath,name,base,suffix=lpegmatch(pattern_c,str)
    if splitdrive then
      return {
        path=path,
        drive=drive,
        subpath=subpath,
        name=name,
        base=base,
        suffix=suffix,
      }
    else
      return {
        path=path,
        name=name,
        base=base,
        suffix=suffix,
      }
    end
  end
end
local pattern=Cs(((period*(1-period-slashes)^1*-1)/""+1)^1)
function file.removesuffix(name)
  return name and lpegmatch(pattern,name)
end
local suffix=period/""*(1-period-slashes)^1*-1
local pattern=Cs((noslashes^0*slashes^1)^0*((1-suffix)^1))*Cs(suffix)
function file.addsuffix(filename,suffix,criterium)
  if not filename or not suffix or suffix=="" then
    return filename
  elseif criterium==true then
    return filename.."."..suffix
  elseif not criterium then
    local n,s=lpegmatch(pattern,filename)
    if not s or s=="" then
      return filename.."."..suffix
    else
      return filename
    end
  else
    local n,s=lpegmatch(pattern,filename)
    if s and s~="" then
      local t=type(criterium)
      if t=="table" then
        for i=1,#criterium do
          if s==criterium[i] then
            return filename
          end
        end
      elseif t=="string" then
        if s==criterium then
          return filename
        end
      end
    end
    return (n or filename).."."..suffix
  end
end
local suffix=period*(1-period-slashes)^1*-1
local pattern=Cs((1-suffix)^0)
function file.replacesuffix(name,suffix)
  if name and suffix and suffix~="" then
    return lpegmatch(pattern,name).."."..suffix
  else
    return name
  end
end
local reslasher=lpeg.replacer(P("\\"),"/")
function file.reslash(str)
  return str and lpegmatch(reslasher,str)
end
function file.is_writable(name)
  if not name then
  elseif lfs.isdir(name) then
    name=name.."/m_t_x_t_e_s_t.tmp"
    local f=io.open(name,"wb")
    if f then
      f:close()
      os.remove(name)
      return true
    end
  elseif lfs.isfile(name) then
    local f=io.open(name,"ab")
    if f then
      f:close()
      return true
    end
  else
    local f=io.open(name,"ab")
    if f then
      f:close()
      os.remove(name)
      return true
    end
  end
  return false
end
local readable=P("r")*Cc(true)
function file.is_readable(name)
  if name then
    local a=attributes(name)
    return a and lpegmatch(readable,a.permissions) or false
  else
    return false
  end
end
file.isreadable=file.is_readable 
file.iswritable=file.is_writable 
function file.size(name)
  if name then
    local a=attributes(name)
    return a and a.size or 0
  else
    return 0
  end
end
function file.splitpath(str,separator) 
  return str and checkedsplit(lpegmatch(reslasher,str),separator or io.pathseparator)
end
function file.joinpath(tab,separator) 
  return tab and concat(tab,separator or io.pathseparator) 
end
local stripper=Cs(P(fwslash)^0/""*reslasher)
local isnetwork=fwslash*fwslash*(1-fwslash)+(1-fwslash-colon)^1*colon
local isroot=fwslash^1*-1
local hasroot=fwslash^1
local deslasher=lpeg.replacer(S("\\/")^1,"/")
function file.join(...)
  local lst={... }
  local one=lst[1]
  if lpegmatch(isnetwork,one) then
    local two=lpegmatch(deslasher,concat(lst,"/",2))
    return one.."/"..two
  elseif lpegmatch(isroot,one) then
    local two=lpegmatch(deslasher,concat(lst,"/",2))
    if lpegmatch(hasroot,two) then
      return two
    else
      return "/"..two
    end
  elseif one=="" then
    return lpegmatch(stripper,concat(lst,"/",2))
  else
    return lpegmatch(deslasher,concat(lst,"/"))
  end
end
local drivespec=R("az","AZ")^1*colon
local anchors=fwslash+drivespec
local untouched=periods+(1-period)^1*P(-1)
local splitstarter=(Cs(drivespec*(bwslash/"/"+fwslash)^0)+Cc(false))*Ct(lpeg.splitat(S("/\\")^1))
local absolute=fwslash
function file.collapsepath(str,anchor) 
  if not str then
    return
  end
  if anchor==true and not lpegmatch(anchors,str) then
    str=getcurrentdir().."/"..str
  end
  if str=="" or str=="." then
    return "."
  elseif lpegmatch(untouched,str) then
    return lpegmatch(reslasher,str)
  end
  local starter,oldelements=lpegmatch(splitstarter,str)
  local newelements={}
  local i=#oldelements
  while i>0 do
    local element=oldelements[i]
    if element=='.' then
    elseif element=='..' then
      local n=i-1
      while n>0 do
        local element=oldelements[n]
        if element~='..' and element~='.' then
          oldelements[n]='.'
          break
        else
          n=n-1
        end
       end
      if n<1 then
        insert(newelements,1,'..')
      end
    elseif element~="" then
      insert(newelements,1,element)
    end
    i=i-1
  end
  if #newelements==0 then
    return starter or "."
  elseif starter then
    return starter..concat(newelements,'/')
  elseif lpegmatch(absolute,str) then
    return "/"..concat(newelements,'/')
  else
    newelements=concat(newelements,'/')
    if anchor=="." and find(str,"^%./") then
      return "./"..newelements
    else
      return newelements
    end
  end
end
local validchars=R("az","09","AZ","--","..")
local pattern_a=lpeg.replacer(1-validchars)
local pattern_a=Cs((validchars+P(1)/"-")^1)
local whatever=P("-")^0/""
local pattern_b=Cs(whatever*(1-whatever*-1)^1)
function file.robustname(str,strict)
  if str then
    str=lpegmatch(pattern_a,str) or str
    if strict then
      return lpegmatch(pattern_b,str) or str 
    else
      return str
    end
  end
end
file.readdata=io.loaddata
file.savedata=io.savedata
function file.copy(oldname,newname)
  if oldname and newname then
    local data=io.loaddata(oldname)
    if data and data~="" then
      file.savedata(newname,data)
    end
  end
end
local letter=R("az","AZ")+S("_-+")
local separator=P("://")
local qualified=period^0*fwslash+letter*colon+letter^1*separator+letter^1*fwslash
local rootbased=fwslash+letter*colon
lpeg.patterns.qualified=qualified
lpeg.patterns.rootbased=rootbased
function file.is_qualified_path(filename)
  return filename and lpegmatch(qualified,filename)~=nil
end
function file.is_rootbased_path(filename)
  return filename and lpegmatch(rootbased,filename)~=nil
end
function file.strip(name,dir)
  if name then
    local b,a=match(name,"^(.-)"..dir.."(.*)$")
    return a~="" and a or name
  end
end
function lfs.mkdirs(path)
  local full=""
  for sub in gmatch(path,"(/*[^\\/]+)") do 
    full=full..sub
    lfs.mkdir(full)
  end
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['l-md5']={
  version=1.001,
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
if not md5 then
  md5=optionalrequire("md5")
end
if not md5 then
  md5={
    sum=function(str) print("error: md5 is not loaded (sum     ignored)") return str end,
    sumhexa=function(str) print("error: md5 is not loaded (sumhexa ignored)") return str end,
  }
end
local md5,file=md5,file
local gsub,format,byte=string.gsub,string.format,string.byte
local md5sum=md5.sum
local function convert(str,fmt)
  return (gsub(md5sum(str),".",function(chr) return format(fmt,byte(chr)) end))
end
if not md5.HEX then function md5.HEX(str) return convert(str,"%02X") end end
if not md5.hex then function md5.hex(str) return convert(str,"%02x") end end
if not md5.dec then function md5.dec(str) return convert(str,"%03i") end end
function file.needsupdating(oldname,newname,threshold) 
  local oldtime=lfs.attributes(oldname,"modification")
  if oldtime then
    local newtime=lfs.attributes(newname,"modification")
    if not newtime then
      return true 
    elseif newtime>=oldtime then
      return false 
    elseif oldtime-newtime<(threshold or 1) then
      return false 
    else
      return true 
    end
  else
    return false 
  end
end
file.needs_updating=file.needsupdating
function file.syncmtimes(oldname,newname)
  local oldtime=lfs.attributes(oldname,"modification")
  if oldtime and lfs.isfile(newname) then
    lfs.touch(newname,oldtime,oldtime)
  end
end
function file.checksum(name)
  if md5 then
    local data=io.loaddata(name)
    if data then
      return md5.HEX(data)
    end
  end
  return nil
end
function file.loadchecksum(name)
  if md5 then
    local data=io.loaddata(name..".md5")
    return data and (gsub(data,"%s",""))
  end
  return nil
end
function file.savechecksum(name,checksum)
  if not checksum then checksum=file.checksum(name) end
  if checksum then
    io.savedata(name..".md5",checksum)
    return checksum
  end
  return nil
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['l-dir']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local type,select=type,select
local find,gmatch,match,gsub=string.find,string.gmatch,string.match,string.gsub
local concat,insert,remove,unpack=table.concat,table.insert,table.remove,table.unpack
local lpegmatch=lpeg.match
local P,S,R,C,Cc,Cs,Ct,Cv,V=lpeg.P,lpeg.S,lpeg.R,lpeg.C,lpeg.Cc,lpeg.Cs,lpeg.Ct,lpeg.Cv,lpeg.V
dir=dir or {}
local dir=dir
local lfs=lfs
local attributes=lfs.attributes
local walkdir=lfs.dir
local isdir=lfs.isdir
local isfile=lfs.isfile
local currentdir=lfs.currentdir
local chdir=lfs.chdir
if not isdir then
  function isdir(name)
    local a=attributes(name)
    return a and a.mode=="directory"
  end
  lfs.isdir=isdir
end
if not isfile then
  function isfile(name)
    local a=attributes(name)
    return a and a.mode=="file"
  end
  lfs.isfile=isfile
end
function dir.current()
  return (gsub(currentdir(),"\\","/"))
end
local lfsisdir=isdir
local function isdir(path)
  path=gsub(path,"[/\\]+$","")
  return lfsisdir(path)
end
lfs.isdir=isdir
local function globpattern(path,patt,recurse,action)
  if path=="/" then
    path=path.."."
  elseif not find(path,"/$") then
    path=path..'/'
  end
  if isdir(path) then 
    for name in walkdir(path) do 
      local full=path..name
      local mode=attributes(full,'mode')
      if mode=='file' then
        if find(full,patt) then
          action(full)
        end
      elseif recurse and (mode=="directory") and (name~='.') and (name~="..") then
        globpattern(full,patt,recurse,action)
      end
    end
  end
end
dir.globpattern=globpattern
local function collectpattern(path,patt,recurse,result)
  local ok,scanner
  result=result or {}
  if path=="/" then
    ok,scanner,first=xpcall(function() return walkdir(path..".") end,function() end) 
  else
    ok,scanner,first=xpcall(function() return walkdir(path)   end,function() end) 
  end
  if ok and type(scanner)=="function" then
    if not find(path,"/$") then path=path..'/' end
    for name in scanner,first do
      local full=path..name
      local attr=attributes(full)
      local mode=attr.mode
      if mode=='file' then
        if find(full,patt) then
          result[name]=attr
        end
      elseif recurse and (mode=="directory") and (name~='.') and (name~="..") then
        attr.list=collectpattern(full,patt,recurse)
        result[name]=attr
      end
    end
  end
  return result
end
dir.collectpattern=collectpattern
local pattern=Ct {
  [1]=(C(P(".")+P("/")^1)+C(R("az","AZ")*P(":")*P("/")^0)+Cc("./"))*V(2)*V(3),
  [2]=C(((1-S("*?/"))^0*P("/"))^0),
  [3]=C(P(1)^0)
}
local filter=Cs ((
  P("**")/".*"+P("*")/"[^/]*"+P("?")/"[^/]"+P(".")/"%%."+P("+")/"%%+"+P("-")/"%%-"+P(1)
)^0 )
local function glob(str,t)
  if type(t)=="function" then
    if type(str)=="table" then
      for s=1,#str do
        glob(str[s],t)
      end
    elseif isfile(str) then
      t(str)
    else
      local split=lpegmatch(pattern,str) 
      if split then
        local root,path,base=split[1],split[2],split[3]
        local recurse=find(base,"%*%*")
        local start=root..path
        local result=lpegmatch(filter,start..base)
        globpattern(start,result,recurse,t)
      end
    end
  else
    if type(str)=="table" then
      local t=t or {}
      for s=1,#str do
        glob(str[s],t)
      end
      return t
    elseif isfile(str) then
      if t then
        t[#t+1]=str
        return t
      else
        return { str }
      end
    else
      local split=lpegmatch(pattern,str) 
      if split then
        local t=t or {}
        local action=action or function(name) t[#t+1]=name end
        local root,path,base=split[1],split[2],split[3]
        local recurse=find(base,"%*%*")
        local start=root..path
        local result=lpegmatch(filter,start..base)
        globpattern(start,result,recurse,action)
        return t
      else
        return {}
      end
    end
  end
end
dir.glob=glob
local function globfiles(path,recurse,func,files) 
  if type(func)=="string" then
    local s=func
    func=function(name) return find(name,s) end
  end
  files=files or {}
  local noffiles=#files
  for name in walkdir(path) do
    if find(name,"^%.") then
    else
      local mode=attributes(name,'mode')
      if mode=="directory" then
        if recurse then
          globfiles(path.."/"..name,recurse,func,files)
        end
      elseif mode=="file" then
        if not func or func(name) then
          noffiles=noffiles+1
          files[noffiles]=path.."/"..name
        end
      end
    end
  end
  return files
end
dir.globfiles=globfiles
function dir.ls(pattern)
  return concat(glob(pattern),"\n")
end
local make_indeed=true 
local onwindows=os.type=="windows" or find(os.getenv("PATH"),";")
if onwindows then
  function dir.mkdirs(...)
    local str,pth="",""
    for i=1,select("#",...) do
      local s=select(i,...)
      if s=="" then
      elseif str=="" then
        str=s
      else
        str=str.."/"..s
      end
    end
    local first,middle,last
    local drive=false
    first,middle,last=match(str,"^(//)(//*)(.*)$")
    if first then
    else
      first,last=match(str,"^(//)/*(.-)$")
      if first then
        middle,last=match(str,"([^/]+)/+(.-)$")
        if middle then
          pth="//"..middle
        else
          pth="//"..last
          last=""
        end
      else
        first,middle,last=match(str,"^([a-zA-Z]:)(/*)(.-)$")
        if first then
          pth,drive=first..middle,true
        else
          middle,last=match(str,"^(/*)(.-)$")
          if not middle then
            last=str
          end
        end
      end
    end
    for s in gmatch(last,"[^/]+") do
      if pth=="" then
        pth=s
      elseif drive then
        pth,drive=pth..s,false
      else
        pth=pth.."/"..s
      end
      if make_indeed and not isdir(pth) then
        lfs.mkdir(pth)
      end
    end
    return pth,(isdir(pth)==true)
  end
else
  function dir.mkdirs(...)
    local str,pth="",""
    for i=1,select("#",...) do
      local s=select(i,...)
      if s and s~="" then 
        if str~="" then
          str=str.."/"..s
        else
          str=s
        end
      end
    end
    str=gsub(str,"/+","/")
    if find(str,"^/") then
      pth="/"
      for s in gmatch(str,"[^/]+") do
        local first=(pth=="/")
        if first then
          pth=pth..s
        else
          pth=pth.."/"..s
        end
        if make_indeed and not first and not isdir(pth) then
          lfs.mkdir(pth)
        end
      end
    else
      pth="."
      for s in gmatch(str,"[^/]+") do
        pth=pth.."/"..s
        if make_indeed and not isdir(pth) then
          lfs.mkdir(pth)
        end
      end
    end
    return pth,(isdir(pth)==true)
  end
end
dir.makedirs=dir.mkdirs
if onwindows then
  function dir.expandname(str) 
    local first,nothing,last=match(str,"^(//)(//*)(.*)$")
    if first then
      first=dir.current().."/" 
    end
    if not first then
      first,last=match(str,"^(//)/*(.*)$")
    end
    if not first then
      first,last=match(str,"^([a-zA-Z]:)(.*)$")
      if first and not find(last,"^/") then
        local d=currentdir()
        if chdir(first) then
          first=dir.current()
        end
        chdir(d)
      end
    end
    if not first then
      first,last=dir.current(),str
    end
    last=gsub(last,"//","/")
    last=gsub(last,"/%./","/")
    last=gsub(last,"^/*","")
    first=gsub(first,"/*$","")
    if last=="" or last=="." then
      return first
    else
      return first.."/"..last
    end
  end
else
  function dir.expandname(str) 
    if not find(str,"^/") then
      str=currentdir().."/"..str
    end
    str=gsub(str,"//","/")
    str=gsub(str,"/%./","/")
    str=gsub(str,"(.)/%.$","%1")
    return str
  end
end
file.expandname=dir.expandname 
local stack={}
function dir.push(newdir)
  insert(stack,currentdir())
  if newdir and newdir~="" then
    chdir(newdir)
  end
end
function dir.pop()
  local d=remove(stack)
  if d then
    chdir(d)
  end
  return d
end
local function found(...) 
  for i=1,select("#",...) do
    local path=select(i,...)
    local kind=type(path)
    if kind=="string" then
      if isdir(path) then
        return path
      end
    elseif kind=="table" then
      local path=found(unpack(path))
      if path then
        return path
      end
    end
  end
end
dir.found=found

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['l-unicode']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
utf=utf or (unicode and unicode.utf8) or {}
utf.characters=utf.characters or string.utfcharacters
utf.values=utf.values   or string.utfvalues
local type=type
local char,byte,format,sub=string.char,string.byte,string.format,string.sub
local concat=table.concat
local P,C,R,Cs,Ct,Cmt,Cc,Carg,Cp=lpeg.P,lpeg.C,lpeg.R,lpeg.Cs,lpeg.Ct,lpeg.Cmt,lpeg.Cc,lpeg.Carg,lpeg.Cp
local lpegmatch,patterns=lpeg.match,lpeg.patterns
local bytepairs=string.bytepairs
local finder=lpeg.finder
local replacer=lpeg.replacer
local utfvalues=utf.values
local utfgmatch=utf.gmatch 
local p_utftype=patterns.utftype
local p_utfoffset=patterns.utfoffset
local p_utf8char=patterns.utf8char
local p_utf8byte=patterns.utf8byte
local p_utfbom=patterns.utfbom
local p_newline=patterns.newline
local p_whitespace=patterns.whitespace
if not unicode then
  unicode={ utf=utf } 
end
if not utf.char then
  local floor,char=math.floor,string.char
  function utf.char(n)
    if n<0x80 then
      return char(n)
    elseif n<0x800 then
      return char(
        0xC0+floor(n/0x40),
        0x80+(n%0x40)
      )
    elseif n<0x10000 then
      return char(
        0xE0+floor(n/0x1000),
        0x80+(floor(n/0x40)%0x40),
        0x80+(n%0x40)
      )
    elseif n<0x200000 then
      return char(
        0xF0+floor(n/0x40000),
        0x80+(floor(n/0x1000)%0x40),
        0x80+(floor(n/0x40)%0x40),
        0x80+(n%0x40)
      )
    else
      return ""
    end
  end
end
if not utf.byte then
  local utf8byte=patterns.utf8byte
  function utf.byte(c)
    return lpegmatch(utf8byte,c)
  end
end
local utfchar,utfbyte=utf.char,utf.byte
function utf.filetype(data)
  return data and lpegmatch(p_utftype,data) or "unknown"
end
local toentities=Cs (
  (
    patterns.utf8one+(
        patterns.utf8two+patterns.utf8three+patterns.utf8four
      )/function(s) local b=utfbyte(s) if b<127 then return s else return format("&#%X;",b) end end
  )^0
)
patterns.toentities=toentities
function utf.toentities(str)
  return lpegmatch(toentities,str)
end
local one=P(1)
local two=C(1)*C(1)
local four=C(R(utfchar(0xD8),utfchar(0xFF)))*C(1)*C(1)*C(1)
local pattern=P("\254\255")*Cs((
          four/function(a,b,c,d)
                local ab=0xFF*byte(a)+byte(b)
                local cd=0xFF*byte(c)+byte(d)
                return utfchar((ab-0xD800)*0x400+(cd-0xDC00)+0x10000)
              end+two/function(a,b)
                return utfchar(byte(a)*256+byte(b))
              end+one
        )^1 )+P("\255\254")*Cs((
          four/function(b,a,d,c)
                local ab=0xFF*byte(a)+byte(b)
                local cd=0xFF*byte(c)+byte(d)
                return utfchar((ab-0xD800)*0x400+(cd-0xDC00)+0x10000)
              end+two/function(b,a)
                return utfchar(byte(a)*256+byte(b))
              end+one
        )^1 )
function string.toutf(s) 
  return lpegmatch(pattern,s) or s 
end
local validatedutf=Cs (
  (
    patterns.utf8one+patterns.utf8two+patterns.utf8three+patterns.utf8four+P(1)/"�"
  )^0
)
patterns.validatedutf=validatedutf
function utf.is_valid(str)
  return type(str)=="string" and lpegmatch(validatedutf,str) or false
end
if not utf.len then
  local n,f=0,1
  local utfcharcounter=patterns.utfbom^-1*Cmt (
    Cc(1)*patterns.utf8one^1+Cc(2)*patterns.utf8two^1+Cc(3)*patterns.utf8three^1+Cc(4)*patterns.utf8four^1,
    function(_,t,d) 
      n=n+(t-f)/d
      f=t
      return true
    end
  )^0
  function utf.len(str)
    n,f=0,1
    lpegmatch(utfcharcounter,str or "")
    return n
  end
end
utf.length=utf.len
if not utf.sub then
  local utflength=utf.length
  local b,e,n,first,last=0,0,0,0,0
  local function slide_zero(s,p)
    n=n+1
    if n>=last then
      e=p-1
    else
      return p
    end
  end
  local function slide_one(s,p)
    n=n+1
    if n==first then
      b=p
    end
    if n>=last then
      e=p-1
    else
      return p
    end
  end
  local function slide_two(s,p)
    n=n+1
    if n==first then
      b=p
    else
      return true
    end
  end
  local pattern_zero=Cmt(p_utf8char,slide_zero)^0
  local pattern_one=Cmt(p_utf8char,slide_one )^0
  local pattern_two=Cmt(p_utf8char,slide_two )^0
  function utf.sub(str,start,stop)
    if not start then
      return str
    end
    if start==0 then
      start=1
    end
    if not stop then
      if start<0 then
        local l=utflength(str) 
        start=l+start
      else
        start=start-1
      end
      b,n,first=0,0,start
      lpegmatch(pattern_two,str)
      if n>=first then
        return sub(str,b)
      else
        return ""
      end
    end
    if start<0 or stop<0 then
      local l=utf.length(str)
      if start<0 then
        start=l+start
        if start<=0 then
          start=1
        else
          start=start+1
        end
      end
      if stop<0 then
        stop=l+stop
        if stop==0 then
          stop=1
        else
          stop=stop+1
        end
      end
    end
    if start>stop then
      return ""
    elseif start>1 then
      b,e,n,first,last=0,0,0,start-1,stop
      lpegmatch(pattern_one,str)
      if n>=first and e==0 then
        e=#str
      end
      return sub(str,b,e)
    else
      b,e,n,last=1,0,0,stop
      lpegmatch(pattern_zero,str)
      if e==0 then
        e=#str
      end
      return sub(str,b,e)
    end
  end
end
function utf.remapper(mapping)
  local pattern=Cs((p_utf8char/mapping)^0)
  return function(str)
    if not str or str=="" then
      return ""
    else
      return lpegmatch(pattern,str)
    end
  end,pattern
end
function utf.replacer(t) 
  local r=replacer(t,false,false,true)
  return function(str)
    return lpegmatch(r,str)
  end
end
function utf.subtituter(t) 
  local f=finder (t)
  local r=replacer(t,false,false,true)
  return function(str)
    local i=lpegmatch(f,str)
    if not i then
      return str
    elseif i>#str then
      return str
    else
      return lpegmatch(r,str)
    end
  end
end
local utflinesplitter=p_utfbom^-1*lpeg.tsplitat(p_newline)
local utfcharsplitter_ows=p_utfbom^-1*Ct(C(p_utf8char)^0)
local utfcharsplitter_iws=p_utfbom^-1*Ct((p_whitespace^1+C(p_utf8char))^0)
local utfcharsplitter_raw=Ct(C(p_utf8char)^0)
patterns.utflinesplitter=utflinesplitter
function utf.splitlines(str)
  return lpegmatch(utflinesplitter,str or "")
end
function utf.split(str,ignorewhitespace) 
  if ignorewhitespace then
    return lpegmatch(utfcharsplitter_iws,str or "")
  else
    return lpegmatch(utfcharsplitter_ows,str or "")
  end
end
function utf.totable(str) 
  return lpegmatch(utfcharsplitter_raw,str)
end
function utf.magic(f) 
  local str=f:read(4) or ""
  local off=lpegmatch(p_utfoffset,str)
  if off<4 then
    f:seek('set',off)
  end
  return lpegmatch(p_utftype,str)
end
local function utf16_to_utf8_be(t)
  if type(t)=="string" then
    t=lpegmatch(utflinesplitter,t)
  end
  local result={} 
  for i=1,#t do
    local r,more=0,0
    for left,right in bytepairs(t[i]) do
      if right then
        local now=256*left+right
        if more>0 then
          now=(more-0xD800)*0x400+(now-0xDC00)+0x10000 
          more=0
          r=r+1
          result[r]=utfchar(now)
        elseif now>=0xD800 and now<=0xDBFF then
          more=now
        else
          r=r+1
          result[r]=utfchar(now)
        end
      end
    end
    t[i]=concat(result,"",1,r) 
  end
  return t
end
local function utf16_to_utf8_le(t)
  if type(t)=="string" then
    t=lpegmatch(utflinesplitter,t)
  end
  local result={} 
  for i=1,#t do
    local r,more=0,0
    for left,right in bytepairs(t[i]) do
      if right then
        local now=256*right+left
        if more>0 then
          now=(more-0xD800)*0x400+(now-0xDC00)+0x10000 
          more=0
          r=r+1
          result[r]=utfchar(now)
        elseif now>=0xD800 and now<=0xDBFF then
          more=now
        else
          r=r+1
          result[r]=utfchar(now)
        end
      end
    end
    t[i]=concat(result,"",1,r) 
  end
  return t
end
local function utf32_to_utf8_be(t)
  if type(t)=="string" then
    t=lpegmatch(utflinesplitter,t)
  end
  local result={} 
  for i=1,#t do
    local r,more=0,-1
    for a,b in bytepairs(t[i]) do
      if a and b then
        if more<0 then
          more=256*256*256*a+256*256*b
        else
          r=r+1
          result[t]=utfchar(more+256*a+b)
          more=-1
        end
      else
        break
      end
    end
    t[i]=concat(result,"",1,r)
  end
  return t
end
local function utf32_to_utf8_le(t)
  if type(t)=="string" then
    t=lpegmatch(utflinesplitter,t)
  end
  local result={} 
  for i=1,#t do
    local r,more=0,-1
    for a,b in bytepairs(t[i]) do
      if a and b then
        if more<0 then
          more=256*b+a
        else
          r=r+1
          result[t]=utfchar(more+256*256*256*b+256*256*a)
          more=-1
        end
      else
        break
      end
    end
    t[i]=concat(result,"",1,r)
  end
  return t
end
utf.utf32_to_utf8_be=utf32_to_utf8_be
utf.utf32_to_utf8_le=utf32_to_utf8_le
utf.utf16_to_utf8_be=utf16_to_utf8_be
utf.utf16_to_utf8_le=utf16_to_utf8_le
function utf.utf8_to_utf8(t)
  return type(t)=="string" and lpegmatch(utflinesplitter,t) or t
end
function utf.utf16_to_utf8(t,endian)
  return endian and utf16_to_utf8_be(t) or utf16_to_utf8_le(t) or t
end
function utf.utf32_to_utf8(t,endian)
  return endian and utf32_to_utf8_be(t) or utf32_to_utf8_le(t) or t
end
local function little(c)
  local b=byte(c)
  if b<0x10000 then
    return char(b%256,b/256)
  else
    b=b-0x10000
    local b1,b2=b/1024+0xD800,b%1024+0xDC00
    return char(b1%256,b1/256,b2%256,b2/256)
  end
end
local function big(c)
  local b=byte(c)
  if b<0x10000 then
    return char(b/256,b%256)
  else
    b=b-0x10000
    local b1,b2=b/1024+0xD800,b%1024+0xDC00
    return char(b1/256,b1%256,b2/256,b2%256)
  end
end
local _,l_remap=utf.remapper(little)
local _,b_remap=utf.remapper(big)
function utf.utf8_to_utf16(str,littleendian)
  if littleendian then
    return char(255,254)..lpegmatch(l_remap,str)
  else
    return char(254,255)..lpegmatch(b_remap,str)
  end
end
local pattern=Cs (
  (p_utf8byte/function(unicode     ) return format("0x%04X",unicode) end)*(p_utf8byte*Carg(1)/function(unicode,separator) return format("%s0x%04X",separator,unicode) end)^0
)
function utf.tocodes(str,separator)
  return lpegmatch(pattern,str,1,separator or " ")
end
function utf.ustring(s)
  return format("U+%05X",type(s)=="number" and s or utfbyte(s))
end
function utf.xstring(s)
  return format("0x%05X",type(s)=="number" and s or utfbyte(s))
end
local p_nany=p_utf8char/""
if utfgmatch then
  function utf.count(str,what)
    if type(what)=="string" then
      local n=0
      for _ in utfgmatch(str,what) do
        n=n+1
      end
      return n
    else 
      return #lpegmatch(Cs((P(what)/" "+p_nany)^0),str)
    end
  end
else
  local cache={}
  function utf.count(str,what)
    if type(what)=="string" then
      local p=cache[what]
      if not p then
        p=Cs((P(what)/" "+p_nany)^0)
        cache[p]=p
      end
      return #lpegmatch(p,str)
    else 
      return #lpegmatch(Cs((P(what)/" "+p_nany)^0),str)
    end
  end
end
if not utf.characters then
  function utf.characters(str)
    return gmatch(str,".[\128-\191]*")
  end
  string.utfcharacters=utf.characters
end
if not utf.values then
  local find=string.find
  local dummy=function()
  end
  function utf.values(str)
    local n=#str
    if n==0 then
      return dummy
    elseif n==1 then
      return function() return utfbyte(str) end
    else
      local p=1
      return function()
          local b,e=find(str,".[\128-\191]*",p)
          if b then
            p=e+1
            return utfbyte(sub(str,b,e))
          end
      end
    end
  end
  string.utfvalues=utf.values
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['l-url']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local char,format,byte=string.char,string.format,string.byte
local concat=table.concat
local tonumber,type=tonumber,type
local P,C,R,S,Cs,Cc,Ct,Cf,Cg,V=lpeg.P,lpeg.C,lpeg.R,lpeg.S,lpeg.Cs,lpeg.Cc,lpeg.Ct,lpeg.Cf,lpeg.Cg,lpeg.V
local lpegmatch,lpegpatterns,replacer=lpeg.match,lpeg.patterns,lpeg.replacer
url=url or {}
local url=url
local tochar=function(s) return char(tonumber(s,16)) end
local colon=P(":")
local qmark=P("?")
local hash=P("#")
local slash=P("/")
local percent=P("%")
local endofstring=P(-1)
local hexdigit=R("09","AF","af")
local plus=P("+")
local nothing=Cc("")
local escapedchar=(percent*C(hexdigit*hexdigit))/tochar
local escaped=(plus/" ")+escapedchar
local noslash=P("/")/""
local schemestr=Cs((escaped+(1-colon-slash-qmark-hash))^2)
local authoritystr=Cs((escaped+(1-   slash-qmark-hash))^0)
local pathstr=Cs((escaped+(1-      qmark-hash))^0)
local querystr=Cs(((1-         hash))^0)
local fragmentstr=Cs((escaped+(1-      endofstring))^0)
local scheme=schemestr*colon+nothing
local authority=slash*slash*authoritystr+nothing
local path=slash*pathstr+nothing
local query=qmark*querystr+nothing
local fragment=hash*fragmentstr+nothing
local validurl=scheme*authority*path*query*fragment
local parser=Ct(validurl)
lpegpatterns.url=validurl
lpegpatterns.urlsplitter=parser
local escapes={}
setmetatable(escapes,{ __index=function(t,k)
  local v=format("%%%02X",byte(k))
  t[k]=v
  return v
end })
local escaper=Cs((R("09","AZ","az")^1+P(" ")/"%%20"+S("-./_")^1+P(1)/escapes)^0) 
local unescaper=Cs((escapedchar+1)^0)
lpegpatterns.urlunescaped=escapedchar
lpegpatterns.urlescaper=escaper
lpegpatterns.urlunescaper=unescaper
local function split(str)
  return (type(str)=="string" and lpegmatch(parser,str)) or str
end
local isscheme=schemestr*colon*slash*slash 
local function hasscheme(str)
  if str then
    local scheme=lpegmatch(isscheme,str) 
    return scheme~="" and scheme or false
  else
    return false
  end
end
local rootletter=R("az","AZ")+S("_-+")
local separator=P("://")
local qualified=P(".")^0*P("/")+rootletter*P(":")+rootletter^1*separator+rootletter^1*P("/")
local rootbased=P("/")+rootletter*P(":")
local barswapper=replacer("|",":")
local backslashswapper=replacer("\\","/")
local equal=P("=")
local amp=P("&")
local key=Cs(((escapedchar+1)-equal      )^0)
local value=Cs(((escapedchar+1)-amp -endofstring)^0)
local splitquery=Cf (Ct("")*P { "sequence",
  sequence=V("pair")*(amp*V("pair"))^0,
  pair=Cg(key*equal*value),
},rawset)
local function hashed(str) 
  if str=="" then
    return {
      scheme="invalid",
      original=str,
    }
  end
  local s=split(str)
  local rawscheme=s[1]
  local rawquery=s[4]
  local somescheme=rawscheme~=""
  local somequery=rawquery~=""
  if not somescheme and not somequery then
    s={
      scheme="file",
      authority="",
      path=str,
      query="",
      fragment="",
      original=str,
      noscheme=true,
      filename=str,
    }
  else 
    local authority,path,filename=s[2],s[3]
    if authority=="" then
      filename=path
    elseif path=="" then
      filename=""
    else
      filename=authority.."/"..path
    end
    s={
      scheme=rawscheme,
      authority=authority,
      path=path,
      query=lpegmatch(unescaper,rawquery),
      queries=lpegmatch(splitquery,rawquery),
      fragment=s[5],
      original=str,
      noscheme=false,
      filename=filename,
    }
  end
  return s
end
url.split=split
url.hasscheme=hasscheme
url.hashed=hashed
function url.addscheme(str,scheme) 
  if hasscheme(str) then
    return str
  elseif not scheme then
    return "file:///"..str
  else
    return scheme..":///"..str
  end
end
function url.construct(hash) 
  local fullurl,f={},0
  local scheme,authority,path,query,fragment=hash.scheme,hash.authority,hash.path,hash.query,hash.fragment
  if scheme and scheme~="" then
    f=f+1;fullurl[f]=scheme.."://"
  end
  if authority and authority~="" then
    f=f+1;fullurl[f]=authority
  end
  if path and path~="" then
    f=f+1;fullurl[f]="/"..path
  end
  if query and query~="" then
    f=f+1;fullurl[f]="?"..query
  end
  if fragment and fragment~="" then
    f=f+1;fullurl[f]="#"..fragment
  end
  return lpegmatch(escaper,concat(fullurl))
end
local pattern=Cs(noslash*R("az","AZ")*(S(":|")/":")*noslash*P(1)^0)
function url.filename(filename)
  local spec=hashed(filename)
  local path=spec.path
  return (spec.scheme=="file" and path and lpegmatch(pattern,path)) or filename
end
local function escapestring(str)
  return lpegmatch(escaper,str)
end
url.escape=escapestring
function url.query(str)
  if type(str)=="string" then
    return lpegmatch(splitquery,str) or ""
  else
    return str
  end
end
function url.toquery(data)
  local td=type(data)
  if td=="string" then
    return #str and escape(data) or nil 
  elseif td=="table" then
    if next(data) then
      local t={}
      for k,v in next,data do
        t[#t+1]=format("%s=%s",k,escapestring(v))
      end
      return concat(t,"&")
    end
  else
  end
end
local pattern=Cs(noslash^0*(1-noslash*P(-1))^0)
function url.barepath(path)
  if not path or path=="" then
    return ""
  else
    return lpegmatch(pattern,path)
  end
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['l-set']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
set=set or {}
local nums={}
local tabs={}
local concat=table.concat
local next,type=next,type
set.create=table.tohash
function set.tonumber(t)
  if next(t) then
    local s=""
    for k,v in next,t do
      if v then
        s=s.." "..k
      end
    end
    local n=nums[s]
    if not n then
      n=#tabs+1
      tabs[n]=t
      nums[s]=n
    end
    return n
  else
    return 0
  end
end
function set.totable(n)
  if n==0 then
    return {}
  else
    return tabs[n] or {}
  end
end
function set.tolist(n)
  if n==0 or not tabs[n] then
    return ""
  else
    local t,n={},0
    for k,v in next,tabs[n] do
      if v then
        n=n+1
        t[n]=k
      end
    end
    return concat(t," ")
  end
end
function set.contains(n,s)
  if type(n)=="table" then
    return n[s]
  elseif n==0 then
    return false
  else
    local t=tabs[n]
    return t and t[s]
  end
end

end -- closure
