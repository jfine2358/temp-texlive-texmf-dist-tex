-- merged file : lualibs-extended-merged.lua
-- parent file : lualibs-extended.lua
-- merge date  : Wed Apr  6 23:53:30 2016

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['util-str']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
utilities=utilities or {}
utilities.strings=utilities.strings or {}
local strings=utilities.strings
local format,gsub,rep,sub=string.format,string.gsub,string.rep,string.sub
local load,dump=load,string.dump
local tonumber,type,tostring=tonumber,type,tostring
local unpack,concat=table.unpack,table.concat
local P,V,C,S,R,Ct,Cs,Cp,Carg,Cc=lpeg.P,lpeg.V,lpeg.C,lpeg.S,lpeg.R,lpeg.Ct,lpeg.Cs,lpeg.Cp,lpeg.Carg,lpeg.Cc
local patterns,lpegmatch=lpeg.patterns,lpeg.match
local utfchar,utfbyte=utf.char,utf.byte
local loadstripped=nil
if _LUAVERSION<5.2 then
  loadstripped=function(str,shortcuts)
    return load(str)
  end
else
  loadstripped=function(str,shortcuts)
    if shortcuts then
      return load(dump(load(str),true),nil,nil,shortcuts)
    else
      return load(dump(load(str),true))
    end
  end
end
if not number then number={} end 
local stripper=patterns.stripzeros
local newline=patterns.newline
local endofstring=patterns.endofstring
local whitespace=patterns.whitespace
local spacer=patterns.spacer
local spaceortab=patterns.spaceortab
local function points(n)
  n=tonumber(n)
  return (not n or n==0) and "0pt" or lpegmatch(stripper,format("%.5fpt",n/65536))
end
local function basepoints(n)
  n=tonumber(n)
  return (not n or n==0) and "0bp" or lpegmatch(stripper,format("%.5fbp",n*(7200/7227)/65536))
end
number.points=points
number.basepoints=basepoints
local rubish=spaceortab^0*newline
local anyrubish=spaceortab+newline
local anything=patterns.anything
local stripped=(spaceortab^1/"")*newline
local leading=rubish^0/""
local trailing=(anyrubish^1*endofstring)/""
local redundant=rubish^3/"\n"
local pattern=Cs(leading*(trailing+redundant+stripped+anything)^0)
function strings.collapsecrlf(str)
  return lpegmatch(pattern,str)
end
local repeaters={} 
function strings.newrepeater(str,offset)
  offset=offset or 0
  local s=repeaters[str]
  if not s then
    s={}
    repeaters[str]=s
  end
  local t=s[offset]
  if t then
    return t
  end
  t={}
  setmetatable(t,{ __index=function(t,k)
    if not k then
      return ""
    end
    local n=k+offset
    local s=n>0 and rep(str,n) or ""
    t[k]=s
    return s
  end })
  s[offset]=t
  return t
end
local extra,tab,start=0,0,4,0
local nspaces=strings.newrepeater(" ")
string.nspaces=nspaces
local pattern=Carg(1)/function(t)
    extra,tab,start=0,t or 7,1
  end*Cs((
   Cp()*patterns.tab/function(position)
     local current=(position-start+1)+extra
     local spaces=tab-(current-1)%tab
     if spaces>0 then
       extra=extra+spaces-1
       return nspaces[spaces] 
     else
       return ""
     end
   end+newline*Cp()/function(position)
     extra,start=0,position
   end+patterns.anything
 )^1)
function strings.tabtospace(str,tab)
  return lpegmatch(pattern,str,1,tab or 7)
end
local space=spacer^0
local nospace=space/""
local endofline=nospace*newline
local stripend=(whitespace^1*endofstring)/""
local normalline=(nospace*((1-space*(newline+endofstring))^1)*nospace)
local stripempty=endofline^1/""
local normalempty=endofline^1
local singleempty=endofline*(endofline^0/"")
local doubleempty=endofline*endofline^-1*(endofline^0/"")
local stripstart=stripempty^0
local p_prune_normal=Cs (stripstart*(stripend+normalline+normalempty )^0 )
local p_prune_collapse=Cs (stripstart*(stripend+normalline+doubleempty )^0 )
local p_prune_noempty=Cs (stripstart*(stripend+normalline+singleempty )^0 )
local p_retain_normal=Cs ((normalline+normalempty )^0 )
local p_retain_collapse=Cs ((normalline+doubleempty )^0 )
local p_retain_noempty=Cs ((normalline+singleempty )^0 )
local striplinepatterns={
  ["prune"]=p_prune_normal,
  ["prune and collapse"]=p_prune_collapse,
  ["prune and no empty"]=p_prune_noempty,
  ["retain"]=p_retain_normal,
  ["retain and collapse"]=p_retain_collapse,
  ["retain and no empty"]=p_retain_noempty,
  ["collapse"]=patterns.collapser,
}
setmetatable(striplinepatterns,{ __index=function(t,k) return p_prune_collapse end })
strings.striplinepatterns=striplinepatterns
function strings.striplines(str,how)
  return str and lpegmatch(striplinepatterns[how],str) or str
end
strings.striplong=strings.striplines
function strings.nice(str)
  str=gsub(str,"[:%-+_]+"," ") 
  return str
end
local n=0
local sequenced=table.sequenced
function string.autodouble(s,sep)
  if s==nil then
    return '""'
  end
  local t=type(s)
  if t=="number" then
    return tostring(s) 
  end
  if t=="table" then
    return ('"'..sequenced(s,sep or ",")..'"')
  end
  return ('"'..tostring(s)..'"')
end
function string.autosingle(s,sep)
  if s==nil then
    return "''"
  end
  local t=type(s)
  if t=="number" then
    return tostring(s) 
  end
  if t=="table" then
    return ("'"..sequenced(s,sep or ",").."'")
  end
  return ("'"..tostring(s).."'")
end
local tracedchars={ [0]=
  "[null]","[soh]","[stx]","[etx]","[eot]","[enq]","[ack]","[bel]",
  "[bs]","[ht]","[lf]","[vt]","[ff]","[cr]","[so]","[si]",
  "[dle]","[dc1]","[dc2]","[dc3]","[dc4]","[nak]","[syn]","[etb]",
  "[can]","[em]","[sub]","[esc]","[fs]","[gs]","[rs]","[us]",
  "[space]",
}
string.tracedchars=tracedchars
strings.tracers=tracedchars
function string.tracedchar(b)
  if type(b)=="number" then
    return tracedchars[b] or (utfchar(b).." (U+"..format("%05X",b)..")")
  else
    local c=utfbyte(b)
    return tracedchars[c] or (b.." (U+"..(c and format("%05X",c) or "?????")..")")
  end
end
function number.signed(i)
  if i>0 then
    return "+",i
  else
    return "-",-i
  end
end
local zero=P("0")^1/""
local plus=P("+")/""
local minus=P("-")
local separator=S(".")
local digit=R("09")
local trailing=zero^1*#S("eE")
local exponent=(S("eE")*(plus+Cs((minus*zero^0*P(-1))/"")+minus)*zero^0*(P(-1)*Cc("0")+P(1)^1))
local pattern_a=Cs(minus^0*digit^1*(separator/""*trailing+separator*(trailing+digit)^0)*exponent)
local pattern_b=Cs((exponent+P(1))^0)
function number.sparseexponent(f,n)
  if not n then
    n=f
    f="%e"
  end
  local tn=type(n)
  if tn=="string" then 
    local m=tonumber(n)
    if m then
      return lpegmatch((f=="%e" or f=="%E") and pattern_a or pattern_b,format(f,m))
    end
  elseif tn=="number" then
    return lpegmatch((f=="%e" or f=="%E") and pattern_a or pattern_b,format(f,n))
  end
  return tostring(n)
end
local template=[[
%s
%s
return function(%s) return %s end
]]
local preamble,environment="",{}
if _LUAVERSION<5.2 then
  preamble=[[
local lpeg=lpeg
local type=type
local tostring=tostring
local tonumber=tonumber
local format=string.format
local concat=table.concat
local signed=number.signed
local points=number.points
local basepoints= number.basepoints
local utfchar=utf.char
local utfbyte=utf.byte
local lpegmatch=lpeg.match
local nspaces=string.nspaces
local tracedchar=string.tracedchar
local autosingle=string.autosingle
local autodouble=string.autodouble
local sequenced=table.sequenced
local formattednumber=number.formatted
local sparseexponent=number.sparseexponent
    ]]
else
  environment={
    global=global or _G,
    lpeg=lpeg,
    type=type,
    tostring=tostring,
    tonumber=tonumber,
    format=string.format,
    concat=table.concat,
    signed=number.signed,
    points=number.points,
    basepoints=number.basepoints,
    utfchar=utf.char,
    utfbyte=utf.byte,
    lpegmatch=lpeg.match,
    nspaces=string.nspaces,
    tracedchar=string.tracedchar,
    autosingle=string.autosingle,
    autodouble=string.autodouble,
    sequenced=table.sequenced,
    formattednumber=number.formatted,
    sparseexponent=number.sparseexponent,
  }
end
local arguments={ "a1" } 
setmetatable(arguments,{ __index=function(t,k)
    local v=t[k-1]..",a"..k
    t[k]=v
    return v
  end
})
local prefix_any=C((S("+- .")+R("09"))^0)
local prefix_tab=P("{")*C((1-P("}"))^0)*P("}")+C((1-R("az","AZ","09","%%"))^0)
local format_s=function(f)
  n=n+1
  if f and f~="" then
    return format("format('%%%ss',a%s)",f,n)
  else 
    return format("(a%s or '')",n) 
  end
end
local format_S=function(f) 
  n=n+1
  if f and f~="" then
    return format("format('%%%ss',tostring(a%s))",f,n)
  else
    return format("tostring(a%s)",n)
  end
end
local format_q=function()
  n=n+1
  return format("(a%s and format('%%q',a%s) or '')",n,n) 
end
local format_Q=function() 
  n=n+1
  return format("format('%%q',tostring(a%s))",n)
end
local format_i=function(f)
  n=n+1
  if f and f~="" then
    return format("format('%%%si',a%s)",f,n)
  else
    return format("format('%%i',a%s)",n) 
  end
end
local format_d=format_i
local format_I=function(f)
  n=n+1
  return format("format('%%s%%%si',signed(a%s))",f,n)
end
local format_f=function(f)
  n=n+1
  return format("format('%%%sf',a%s)",f,n)
end
local format_F=function(f) 
  n=n+1
  if not f or f=="" then
    return format("(((a%s > -0.0000000005 and a%s < 0.0000000005) and '0') or format((a%s %% 1 == 0) and '%%i' or '%%.9f',a%s))",n,n,n,n)
  else
    return format("format((a%s %% 1 == 0) and '%%i' or '%%%sf',a%s)",n,f,n)
  end
end
local format_g=function(f)
  n=n+1
  return format("format('%%%sg',a%s)",f,n)
end
local format_G=function(f)
  n=n+1
  return format("format('%%%sG',a%s)",f,n)
end
local format_e=function(f)
  n=n+1
  return format("format('%%%se',a%s)",f,n)
end
local format_E=function(f)
  n=n+1
  return format("format('%%%sE',a%s)",f,n)
end
local format_j=function(f)
  n=n+1
  return format("sparseexponent('%%%se',a%s)",f,n)
end
local format_J=function(f)
  n=n+1
  return format("sparseexponent('%%%sE',a%s)",f,n)
end
local format_x=function(f)
  n=n+1
  return format("format('%%%sx',a%s)",f,n)
end
local format_X=function(f)
  n=n+1
  return format("format('%%%sX',a%s)",f,n)
end
local format_o=function(f)
  n=n+1
  return format("format('%%%so',a%s)",f,n)
end
local format_c=function()
  n=n+1
  return format("utfchar(a%s)",n)
end
local format_C=function()
  n=n+1
  return format("tracedchar(a%s)",n)
end
local format_r=function(f)
  n=n+1
  return format("format('%%%s.0f',a%s)",f,n)
end
local format_h=function(f)
  n=n+1
  if f=="-" then
    f=sub(f,2)
    return format("format('%%%sx',type(a%s) == 'number' and a%s or utfbyte(a%s))",f=="" and "05" or f,n,n,n)
  else
    return format("format('0x%%%sx',type(a%s) == 'number' and a%s or utfbyte(a%s))",f=="" and "05" or f,n,n,n)
  end
end
local format_H=function(f)
  n=n+1
  if f=="-" then
    f=sub(f,2)
    return format("format('%%%sX',type(a%s) == 'number' and a%s or utfbyte(a%s))",f=="" and "05" or f,n,n,n)
  else
    return format("format('0x%%%sX',type(a%s) == 'number' and a%s or utfbyte(a%s))",f=="" and "05" or f,n,n,n)
  end
end
local format_u=function(f)
  n=n+1
  if f=="-" then
    f=sub(f,2)
    return format("format('%%%sx',type(a%s) == 'number' and a%s or utfbyte(a%s))",f=="" and "05" or f,n,n,n)
  else
    return format("format('u+%%%sx',type(a%s) == 'number' and a%s or utfbyte(a%s))",f=="" and "05" or f,n,n,n)
  end
end
local format_U=function(f)
  n=n+1
  if f=="-" then
    f=sub(f,2)
    return format("format('%%%sX',type(a%s) == 'number' and a%s or utfbyte(a%s))",f=="" and "05" or f,n,n,n)
  else
    return format("format('U+%%%sX',type(a%s) == 'number' and a%s or utfbyte(a%s))",f=="" and "05" or f,n,n,n)
  end
end
local format_p=function()
  n=n+1
  return format("points(a%s)",n)
end
local format_b=function()
  n=n+1
  return format("basepoints(a%s)",n)
end
local format_t=function(f)
  n=n+1
  if f and f~="" then
    return format("concat(a%s,%q)",n,f)
  else
    return format("concat(a%s)",n)
  end
end
local format_T=function(f)
  n=n+1
  if f and f~="" then
    return format("sequenced(a%s,%q)",n,f)
  else
    return format("sequenced(a%s)",n)
  end
end
local format_l=function()
  n=n+1
  return format("(a%s and 'true' or 'false')",n)
end
local format_L=function()
  n=n+1
  return format("(a%s and 'TRUE' or 'FALSE')",n)
end
local format_N=function() 
  n=n+1
  return format("tostring(tonumber(a%s) or a%s)",n,n)
end
local format_a=function(f)
  n=n+1
  if f and f~="" then
    return format("autosingle(a%s,%q)",n,f)
  else
    return format("autosingle(a%s)",n)
  end
end
local format_A=function(f)
  n=n+1
  if f and f~="" then
    return format("autodouble(a%s,%q)",n,f)
  else
    return format("autodouble(a%s)",n)
  end
end
local format_w=function(f) 
  n=n+1
  f=tonumber(f)
  if f then 
    return format("nspaces[%s+a%s]",f,n) 
  else
    return format("nspaces[a%s]",n) 
  end
end
local format_W=function(f) 
  return format("nspaces[%s]",tonumber(f) or 0)
end
local digit=patterns.digit
local period=patterns.period
local three=digit*digit*digit
local splitter=Cs (
  (((1-(three^1*period))^1+C(three))*(Carg(1)*three)^1+C((1-period)^1))*(P(1)/""*Carg(2))*C(2)
)
patterns.formattednumber=splitter
function number.formatted(n,sep1,sep2)
  local s=type(s)=="string" and n or format("%0.2f",n)
  if sep1==true then
    return lpegmatch(splitter,s,1,".",",")
  elseif sep1=="." then
    return lpegmatch(splitter,s,1,sep1,sep2 or ",")
  elseif sep1=="," then
    return lpegmatch(splitter,s,1,sep1,sep2 or ".")
  else
    return lpegmatch(splitter,s,1,sep1 or ",",sep2 or ".")
  end
end
local format_m=function(f)
  n=n+1
  if not f or f=="" then
    f=","
  end
  return format([[formattednumber(a%s,%q,".")]],n,f)
end
local format_M=function(f)
  n=n+1
  if not f or f=="" then
    f="."
  end
  return format([[formattednumber(a%s,%q,",")]],n,f)
end
local format_z=function(f)
  n=n+(tonumber(f) or 1)
  return "''" 
end
local format_rest=function(s)
  return format("%q",s) 
end
local format_extension=function(extensions,f,name)
  local extension=extensions[name] or "tostring(%s)"
  local f=tonumber(f) or 1
  if f==0 then
    return extension
  elseif f==1 then
    n=n+1
    local a="a"..n
    return format(extension,a,a) 
  elseif f<0 then
    local a="a"..(n+f+1)
    return format(extension,a,a)
  else
    local t={}
    for i=1,f do
      n=n+1
      t[#t+1]="a"..n
    end
    return format(extension,unpack(t))
  end
end
local builder=Cs { "start",
  start=(
    (
      P("%")/""*(
        V("!") 
+V("s")+V("q")+V("i")+V("d")+V("f")+V("F")+V("g")+V("G")+V("e")+V("E")+V("x")+V("X")+V("o")
+V("c")+V("C")+V("S") 
+V("Q") 
+V("N")
+V("r")+V("h")+V("H")+V("u")+V("U")+V("p")+V("b")+V("t")+V("T")+V("l")+V("L")+V("I")+V("w") 
+V("W") 
+V("a") 
+V("A") 
+V("j")+V("J") 
+V("m")+V("M") 
+V("z")
      )+V("*")
    )*(P(-1)+Carg(1))
  )^0,
  ["s"]=(prefix_any*P("s"))/format_s,
  ["q"]=(prefix_any*P("q"))/format_q,
  ["i"]=(prefix_any*P("i"))/format_i,
  ["d"]=(prefix_any*P("d"))/format_d,
  ["f"]=(prefix_any*P("f"))/format_f,
  ["F"]=(prefix_any*P("F"))/format_F,
  ["g"]=(prefix_any*P("g"))/format_g,
  ["G"]=(prefix_any*P("G"))/format_G,
  ["e"]=(prefix_any*P("e"))/format_e,
  ["E"]=(prefix_any*P("E"))/format_E,
  ["x"]=(prefix_any*P("x"))/format_x,
  ["X"]=(prefix_any*P("X"))/format_X,
  ["o"]=(prefix_any*P("o"))/format_o,
  ["S"]=(prefix_any*P("S"))/format_S,
  ["Q"]=(prefix_any*P("Q"))/format_S,
  ["N"]=(prefix_any*P("N"))/format_N,
  ["c"]=(prefix_any*P("c"))/format_c,
  ["C"]=(prefix_any*P("C"))/format_C,
  ["r"]=(prefix_any*P("r"))/format_r,
  ["h"]=(prefix_any*P("h"))/format_h,
  ["H"]=(prefix_any*P("H"))/format_H,
  ["u"]=(prefix_any*P("u"))/format_u,
  ["U"]=(prefix_any*P("U"))/format_U,
  ["p"]=(prefix_any*P("p"))/format_p,
  ["b"]=(prefix_any*P("b"))/format_b,
  ["t"]=(prefix_tab*P("t"))/format_t,
  ["T"]=(prefix_tab*P("T"))/format_T,
  ["l"]=(prefix_any*P("l"))/format_l,
  ["L"]=(prefix_any*P("L"))/format_L,
  ["I"]=(prefix_any*P("I"))/format_I,
  ["w"]=(prefix_any*P("w"))/format_w,
  ["W"]=(prefix_any*P("W"))/format_W,
  ["j"]=(prefix_any*P("j"))/format_j,
  ["J"]=(prefix_any*P("J"))/format_J,
  ["m"]=(prefix_tab*P("m"))/format_m,
  ["M"]=(prefix_tab*P("M"))/format_M,
  ["z"]=(prefix_any*P("z"))/format_z,
  ["a"]=(prefix_any*P("a"))/format_a,
  ["A"]=(prefix_any*P("A"))/format_A,
  ["*"]=Cs(((1-P("%"))^1+P("%%")/"%%")^1)/format_rest,
  ["?"]=Cs(((1-P("%"))^1        )^1)/format_rest,
  ["!"]=Carg(2)*prefix_any*P("!")*C((1-P("!"))^1)*P("!")/format_extension,
}
local direct=Cs (
  P("%")*(S("+- .")+R("09"))^0*S("sqidfgGeExXo")*P(-1)/[[local format = string.format return function(str) return format("%0",str) end]]
)
local function make(t,str)
  local f
  local p
  local p=lpegmatch(direct,str)
  if p then
    f=loadstripped(p)()
  else
    n=0
    p=lpegmatch(builder,str,1,t._connector_,t._extensions_) 
    if n>0 then
      p=format(template,preamble,t._preamble_,arguments[n],p)
      f=loadstripped(p,t._environment_)() 
    else
      f=function() return str end
    end
  end
  t[str]=f
  return f
end
local function use(t,fmt,...)
  return t[fmt](...)
end
strings.formatters={}
if _LUAVERSION<5.2 then
  function strings.formatters.new(noconcat)
    local t={ _type_="formatter",_connector_=noconcat and "," or "..",_extensions_={},_preamble_=preamble,_environment_={} }
    setmetatable(t,{ __index=make,__call=use })
    return t
  end
else
  function strings.formatters.new(noconcat)
    local e={} 
    for k,v in next,environment do
      e[k]=v
    end
    local t={ _type_="formatter",_connector_=noconcat and "," or "..",_extensions_={},_preamble_="",_environment_=e }
    setmetatable(t,{ __index=make,__call=use })
    return t
  end
end
local formatters=strings.formatters.new() 
string.formatters=formatters 
string.formatter=function(str,...) return formatters[str](...) end 
local function add(t,name,template,preamble)
  if type(t)=="table" and t._type_=="formatter" then
    t._extensions_[name]=template or "%s"
    if type(preamble)=="string" then
      t._preamble_=preamble.."\n"..t._preamble_ 
    elseif type(preamble)=="table" then
      for k,v in next,preamble do
        t._environment_[k]=v
      end
    end
  end
end
strings.formatters.add=add
patterns.xmlescape=Cs((P("<")/"&lt;"+P(">")/"&gt;"+P("&")/"&amp;"+P('"')/"&quot;"+P(1))^0)
patterns.texescape=Cs((C(S("#$%\\{}"))/"\\%1"+P(1))^0)
patterns.luaescape=Cs(((1-S('"\n'))^1+P('"')/'\\"'+P('\n')/'\\n"')^0) 
patterns.luaquoted=Cs(Cc('"')*((1-S('"\n'))^1+P('"')/'\\"'+P('\n')/'\\n"')^0*Cc('"'))
if _LUAVERSION<5.2 then
  add(formatters,"xml",[[lpegmatch(xmlescape,%s)]],"local xmlescape = lpeg.patterns.xmlescape")
  add(formatters,"tex",[[lpegmatch(texescape,%s)]],"local texescape = lpeg.patterns.texescape")
  add(formatters,"lua",[[lpegmatch(luaescape,%s)]],"local luaescape = lpeg.patterns.luaescape")
else
  add(formatters,"xml",[[lpegmatch(xmlescape,%s)]],{ xmlescape=lpeg.patterns.xmlescape })
  add(formatters,"tex",[[lpegmatch(texescape,%s)]],{ texescape=lpeg.patterns.texescape })
  add(formatters,"lua",[[lpegmatch(luaescape,%s)]],{ luaescape=lpeg.patterns.luaescape })
end
local dquote=patterns.dquote 
local equote=patterns.escaped+dquote/'\\"'+1
local space=patterns.space
local cquote=Cc('"')
local pattern=Cs(dquote*(equote-P(-2))^0*dquote)          
+Cs(cquote*(equote-space)^0*space*equote^0*cquote) 
function string.optionalquoted(str)
  return lpegmatch(pattern,str) or str
end
local pattern=Cs((newline/(os.newline or "\r")+1)^0)
function string.replacenewlines(str)
  return lpegmatch(pattern,str)
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['util-fil']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local byte=string.byte
local extract=bit32.extract
utilities=utilities or {}
local files={}
utilities.files=files
local zerobased={}
function files.open(filename,zb)
  local f=io.open(filename,"rb")
  if f then
    zerobased[f]=zb or false
  end
  return f
end
function files.close(f)
  zerobased[f]=nil
  f:close()
end
function files.size(f)
  return f:seek("end")
end
function files.setposition(f,n)
  if zerobased[f] then
    f:seek("set",n)
  else
    f:seek("set",n-1)
  end
end
function files.getposition(f)
  if zerobased[f] then
    return f:seek()
  else
    return f:seek()+1
  end
end
function files.look(f,n,chars)
  local p=f:seek()
  local s=f:read(n)
  f:seek("set",p)
  if chars then
    return s
  else
    return byte(s,1,#s)
  end
end
function files.skip(f,n)
  if n==1 then
    f:read(n)
  else
    f:seek("set",f:seek()+n)
  end
end
function files.readbyte(f)
  return byte(f:read(1))
end
function files.readbytes(f,n)
  return byte(f:read(n),1,n)
end
function files.readchar(f)
  return f:read(1)
end
function files.readstring(f,n)
  return f:read(n or 1)
end
function files.readinteger1(f) 
  local n=byte(f:read(1))
  if n>=0x80 then
    return n-0xFF-1
  else
    return n
  end
end
files.readcardinal1=files.readbyte 
files.readcardinal=files.readcardinal1
files.readinteger=files.readinteger1
function files.readcardinal2(f)
  local a,b=byte(f:read(2),1,2)
  return 0x100*a+b
end
function files.readinteger2(f)
  local a,b=byte(f:read(2),1,2)
  local n=0x100*a+b
  if n>=0x8000 then
    return n-0xFFFF-1
  else
    return n
  end
end
function files.readcardinal3(f)
  local a,b,c=byte(f:read(3),1,3)
  return 0x10000*a+0x100*b+c
end
function files.readcardinal4(f)
  local a,b,c,d=byte(f:read(4),1,4)
  return 0x1000000*a+0x10000*b+0x100*c+d
end
function files.readinteger4(f)
  local a,b,c,d=byte(f:read(4),1,4)
  local n=0x1000000*a+0x10000*b+0x100*c+d
  if n>=0x8000000 then
    return n-0xFFFFFFFF-1
  else
    return n
  end
end
function files.readfixed4(f)
  local a,b,c,d=byte(f:read(4),1,4)
  local n=0x100*a+b
  if n>=0x8000 then
    return n-0xFFFF-1+(0x100*c+d)/0xFFFF
  else
    return n+(0x100*c+d)/0xFFFF
  end
end
function files.read2dot14(f)
  local a,b=byte(f:read(2),1,2)
  local n=0x100*a+b
  local m=extract(n,0,30)
  if n>0x7FFF then
    n=extract(n,30,2)
    return m/0x4000-4
  else
    n=extract(n,30,2)
    return n+m/0x4000
  end
end
function files.skipshort(f,n)
  f:read(2*(n or 1))
end
function files.skiplong(f,n)
  f:read(4*(n or 1))
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['util-tab']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
utilities=utilities or {}
utilities.tables=utilities.tables or {}
local tables=utilities.tables
local format,gmatch,gsub,sub=string.format,string.gmatch,string.gsub,string.sub
local concat,insert,remove,sort=table.concat,table.insert,table.remove,table.sort
local setmetatable,getmetatable,tonumber,tostring=setmetatable,getmetatable,tonumber,tostring
local type,next,rawset,tonumber,tostring,load,select=type,next,rawset,tonumber,tostring,load,select
local lpegmatch,P,Cs,Cc=lpeg.match,lpeg.P,lpeg.Cs,lpeg.Cc
local sortedkeys,sortedpairs=table.sortedkeys,table.sortedpairs
local formatters=string.formatters
local utftoeight=utf.toeight
local splitter=lpeg.tsplitat(".")
function utilities.tables.definetable(target,nofirst,nolast) 
  local composed,t=nil,{}
  local snippets=lpegmatch(splitter,target)
  for i=1,#snippets-(nolast and 1 or 0) do
    local name=snippets[i]
    if composed then
      composed=composed.."."..name
        t[#t+1]=formatters["if not %s then %s = { } end"](composed,composed)
    else
      composed=name
      if not nofirst then
        t[#t+1]=formatters["%s = %s or { }"](composed,composed)
      end
    end
  end
  if composed then
    if nolast then
      composed=composed.."."..snippets[#snippets]
    end
    return concat(t,"\n"),composed 
  else
    return "",target
  end
end
function tables.definedtable(...)
  local t=_G
  for i=1,select("#",...) do
    local li=select(i,...)
    local tl=t[li]
    if not tl then
      tl={}
      t[li]=tl
    end
    t=tl
  end
  return t
end
function tables.accesstable(target,root)
  local t=root or _G
  for name in gmatch(target,"([^%.]+)") do
    t=t[name]
    if not t then
      return
    end
  end
  return t
end
function tables.migratetable(target,v,root)
  local t=root or _G
  local names=lpegmatch(splitter,target)
  for i=1,#names-1 do
    local name=names[i]
    t[name]=t[name] or {}
    t=t[name]
    if not t then
      return
    end
  end
  t[names[#names]]=v
end
function tables.removevalue(t,value) 
  if value then
    for i=1,#t do
      if t[i]==value then
        remove(t,i)
      end
    end
  end
end
function tables.replacevalue(t,oldvalue,newvalue)
  if oldvalue and newvalue then
    for i=1,#t do
      if t[i]==oldvalue then
        t[i]=newvalue
      end
    end
  end
end
function tables.insertbeforevalue(t,value,extra)
  for i=1,#t do
    if t[i]==extra then
      remove(t,i)
    end
  end
  for i=1,#t do
    if t[i]==value then
      insert(t,i,extra)
      return
    end
  end
  insert(t,1,extra)
end
function tables.insertaftervalue(t,value,extra)
  for i=1,#t do
    if t[i]==extra then
      remove(t,i)
    end
  end
  for i=1,#t do
    if t[i]==value then
      insert(t,i+1,extra)
      return
    end
  end
  insert(t,#t+1,extra)
end
local escape=Cs(Cc('"')*((P('"')/'""'+P(1))^0)*Cc('"'))
function table.tocsv(t,specification)
  if t and #t>0 then
    local result={}
    local r={}
    specification=specification or {}
    local fields=specification.fields
    if type(fields)~="string" then
      fields=sortedkeys(t[1])
    end
    local separator=specification.separator or ","
    if specification.preamble==true then
      for f=1,#fields do
        r[f]=lpegmatch(escape,tostring(fields[f]))
      end
      result[1]=concat(r,separator)
    end
    for i=1,#t do
      local ti=t[i]
      for f=1,#fields do
        local field=ti[fields[f]]
        if type(field)=="string" then
          r[f]=lpegmatch(escape,field)
        else
          r[f]=tostring(field)
        end
      end
      result[#result+1]=concat(r,separator)
    end
    return concat(result,"\n")
  else
    return ""
  end
end
local nspaces=utilities.strings.newrepeater(" ")
local function toxml(t,d,result,step)
  for k,v in sortedpairs(t) do
    local s=nspaces[d] 
    local tk=type(k)
    local tv=type(v)
    if tv=="table" then
      if tk=="number" then
        result[#result+1]=formatters["%s<entry n='%s'>"](s,k)
        toxml(v,d+step,result,step)
        result[#result+1]=formatters["%s</entry>"](s,k)
      else
        result[#result+1]=formatters["%s<%s>"](s,k)
        toxml(v,d+step,result,step)
        result[#result+1]=formatters["%s</%s>"](s,k)
      end
    elseif tv=="string" then
      if tk=="number" then
        result[#result+1]=formatters["%s<entry n='%s'>%!xml!</entry>"](s,k,v,k)
      else
        result[#result+1]=formatters["%s<%s>%!xml!</%s>"](s,k,v,k)
      end
    elseif tk=="number" then
      result[#result+1]=formatters["%s<entry n='%s'>%S</entry>"](s,k,v,k)
    else
      result[#result+1]=formatters["%s<%s>%S</%s>"](s,k,v,k)
    end
  end
end
function table.toxml(t,specification)
  specification=specification or {}
  local name=specification.name
  local noroot=name==false
  local result=(specification.nobanner or noroot) and {} or { "<?xml version='1.0' standalone='yes' ?>" }
  local indent=specification.indent or 0
  local spaces=specification.spaces or 1
  if noroot then
    toxml(t,indent,result,spaces)
  else
    toxml({ [name or "data"]=t },indent,result,spaces)
  end
  return concat(result,"\n")
end
function tables.encapsulate(core,capsule,protect)
  if type(capsule)~="table" then
    protect=true
    capsule={}
  end
  for key,value in next,core do
    if capsule[key] then
      print(formatters["\ninvalid %s %a in %a"]("inheritance",key,core))
      os.exit()
    else
      capsule[key]=value
    end
  end
  if protect then
    for key,value in next,core do
      core[key]=nil
    end
    setmetatable(core,{
      __index=capsule,
      __newindex=function(t,key,value)
        if capsule[key] then
          print(formatters["\ninvalid %s %a' in %a"]("overload",key,core))
          os.exit()
        else
          rawset(t,key,value)
        end
      end
    } )
  end
end
local f_hashed_string=formatters["[%q]=%q,"]
local f_hashed_number=formatters["[%q]=%s,"]
local f_hashed_boolean=formatters["[%q]=%l,"]
local f_hashed_table=formatters["[%q]="]
local f_indexed_string=formatters["[%s]=%q,"]
local f_indexed_number=formatters["[%s]=%s,"]
local f_indexed_boolean=formatters["[%s]=%l,"]
local f_indexed_table=formatters["[%s]="]
local f_ordered_string=formatters["%q,"]
local f_ordered_number=formatters["%s,"]
local f_ordered_boolean=formatters["%l,"]
function table.fastserialize(t,prefix)
  local r={ type(prefix)=="string" and prefix or "return" }
  local m=1
  local function fastserialize(t,outer) 
    local n=#t
    m=m+1
    r[m]="{"
    if n>0 then
      for i=0,n do
        local v=t[i]
        local tv=type(v)
        if tv=="string" then
          m=m+1 r[m]=f_ordered_string(v)
        elseif tv=="number" then
          m=m+1 r[m]=f_ordered_number(v)
        elseif tv=="table" then
          fastserialize(v)
        elseif tv=="boolean" then
          m=m+1 r[m]=f_ordered_boolean(v)
        end
      end
    end
    for k,v in next,t do
      local tk=type(k)
      if tk=="number" then
        if k>n or k<0 then
          local tv=type(v)
          if tv=="string" then
            m=m+1 r[m]=f_indexed_string(k,v)
          elseif tv=="number" then
            m=m+1 r[m]=f_indexed_number(k,v)
          elseif tv=="table" then
            m=m+1 r[m]=f_indexed_table(k)
            fastserialize(v)
          elseif tv=="boolean" then
            m=m+1 r[m]=f_indexed_boolean(k,v)
          end
        end
      else
        local tv=type(v)
        if tv=="string" then
          m=m+1 r[m]=f_hashed_string(k,v)
        elseif tv=="number" then
          m=m+1 r[m]=f_hashed_number(k,v)
        elseif tv=="table" then
          m=m+1 r[m]=f_hashed_table(k)
          fastserialize(v)
        elseif tv=="boolean" then
          m=m+1 r[m]=f_hashed_boolean(k,v)
        end
      end
    end
    m=m+1
    if outer then
      r[m]="}"
    else
      r[m]="},"
    end
    return r
  end
  return concat(fastserialize(t,true))
end
function table.deserialize(str)
  if not str or str=="" then
    return
  end
  local code=load(str)
  if not code then
    return
  end
  code=code()
  if not code then
    return
  end
  return code
end
function table.load(filename,loader)
  if filename then
    local t=(loader or io.loaddata)(filename)
    if t and t~="" then
      local t=utftoeight(t)
      t=load(t)
      if type(t)=="function" then
        t=t()
        if type(t)=="table" then
          return t
        end
      end
    end
  end
end
function table.save(filename,t,n,...)
  io.savedata(filename,table.serialize(t,n==nil and true or n,...)) 
end
local f_key_value=formatters["%s=%q"]
local f_add_table=formatters[" {%t},\n"]
local f_return_table=formatters["return {\n%t}"]
local function slowdrop(t) 
  local r={}
  local l={}
  for i=1,#t do
    local ti=t[i]
    local j=0
    for k,v in next,ti do
      j=j+1
      l[j]=f_key_value(k,v)
    end
    r[i]=f_add_table(l)
  end
  return f_return_table(r)
end
local function fastdrop(t)
  local r={ "return {\n" }
  local m=1
  for i=1,#t do
    local ti=t[i]
    m=m+1 r[m]=" {"
    for k,v in next,ti do
      m=m+1 r[m]=f_key_value(k,v)
    end
    m=m+1 r[m]="},\n"
  end
  m=m+1
  r[m]="}"
  return concat(r)
end
function table.drop(t,slow) 
  if #t==0 then
    return "return { }"
  elseif slow==true then
    return slowdrop(t) 
  else
    return fastdrop(t) 
  end
end
function table.autokey(t,k)
  local v={}
  t[k]=v
  return v
end
local selfmapper={ __index=function(t,k) t[k]=k return k end }
function table.twowaymapper(t)
  if not t then
    t={}
  else
    for i=0,#t do
      local ti=t[i]    
      if ti then
        local i=tostring(i)
        t[i]=ti   
        t[ti]=i    
      end
    end
    t[""]=t[0] or ""
  end
  setmetatable(t,selfmapper)
  return t
end
local f_start_key_idx=formatters["%w{"]
local f_start_key_num=formatters["%w[%s]={"]
local f_start_key_str=formatters["%w[%q]={"]
local f_start_key_boo=formatters["%w[%l]={"]
local f_start_key_nop=formatters["%w{"]
local f_stop=formatters["%w},"]
local f_key_num_value_num=formatters["%w[%s]=%s,"]
local f_key_str_value_num=formatters["%w[%q]=%s,"]
local f_key_boo_value_num=formatters["%w[%l]=%s,"]
local f_key_num_value_str=formatters["%w[%s]=%q,"]
local f_key_str_value_str=formatters["%w[%q]=%q,"]
local f_key_boo_value_str=formatters["%w[%l]=%q,"]
local f_key_num_value_boo=formatters["%w[%s]=%l,"]
local f_key_str_value_boo=formatters["%w[%q]=%l,"]
local f_key_boo_value_boo=formatters["%w[%l]=%l,"]
local f_key_num_value_not=formatters["%w[%s]={},"]
local f_key_str_value_not=formatters["%w[%q]={},"]
local f_key_boo_value_not=formatters["%w[%l]={},"]
local f_key_num_value_seq=formatters["%w[%s]={ %, t },"]
local f_key_str_value_seq=formatters["%w[%q]={ %, t },"]
local f_key_boo_value_seq=formatters["%w[%l]={ %, t },"]
local f_val_num=formatters["%w%s,"]
local f_val_str=formatters["%w%q,"]
local f_val_boo=formatters["%w%l,"]
local f_val_not=formatters["%w{},"]
local f_val_seq=formatters["%w{ %, t },"]
local f_fin_seq=formatters[" %, t }"]
local f_table_return=formatters["return {"]
local f_table_name=formatters["%s={"]
local f_table_direct=formatters["{"]
local f_table_entry=formatters["[%q]={"]
local f_table_finish=formatters["}"]
local spaces=utilities.strings.newrepeater(" ")
local original_serialize=table.serialize
local function serialize(root,name,specification)
  if type(specification)=="table" then
    return original_serialize(root,name,specification) 
  end
  local t  
  local n=1
  local unknown=false
  local function simple_table(t)
    local nt=#t
    if nt>0 then
      local n=0
      for _,v in next,t do
        n=n+1
        if type(v)=="table" then
          return nil
        end
      end
      local haszero=t[0]
      if n==nt then
        local tt={}
        for i=1,nt do
          local v=t[i]
          local tv=type(v)
          if tv=="number" then
            tt[i]=v 
          elseif tv=="string" then
            tt[i]=format("%q",v) 
          elseif tv=="boolean" then
            tt[i]=v and "true" or "false"
          else
            return nil
          end
        end
        return tt
      elseif haszero and (n==nt+1) then
        local tt={}
        for i=0,nt do
          local v=t[i]
          local tv=type(v)
          if tv=="number" then
            tt[i+1]=v 
          elseif tv=="string" then
            tt[i+1]=format("%q",v) 
          elseif tv=="boolean" then
            tt[i+1]=v and "true" or "false"
          else
            return nil
          end
        end
        tt[1]="[0] = "..tt[1]
        return tt
      end
    end
    return nil
  end
  local function do_serialize(root,name,depth,level,indexed)
    if level>0 then
      n=n+1
      if indexed then
        t[n]=f_start_key_idx(depth)
      else
        local tn=type(name)
        if tn=="number" then
          t[n]=f_start_key_num(depth,name)
        elseif tn=="string" then
          t[n]=f_start_key_str(depth,name)
        elseif tn=="boolean" then
          t[n]=f_start_key_boo(depth,name)
        else
          t[n]=f_start_key_nop(depth)
        end
      end
      depth=depth+1
    end
    if root and next(root)~=nil then
      local first=nil
      local last=0
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
      local sk=sortedkeys(root) 
      for i=1,#sk do
        local k=sk[i]
        local v=root[k]
        local tv=type(v)
        local tk=type(k)
        if first and tk=="number" and k<=last and k>=first then
          if tv=="number" then
            n=n+1 t[n]=f_val_num(depth,v)
          elseif tv=="string" then
            n=n+1 t[n]=f_val_str(depth,v)
          elseif tv=="table" then
            if next(v)==nil then 
              n=n+1 t[n]=f_val_not(depth)
            else
              local st=simple_table(v)
              if st then
                n=n+1 t[n]=f_val_seq(depth,st)
              else
                do_serialize(v,k,depth,level+1,true)
              end
            end
          elseif tv=="boolean" then
            n=n+1 t[n]=f_val_boo(depth,v)
          elseif unknown then
            n=n+1 t[n]=f_val_str(depth,tostring(v))
          end
        elseif tv=="number" then
          if tk=="number" then
            n=n+1 t[n]=f_key_num_value_num(depth,k,v)
          elseif tk=="string" then
            n=n+1 t[n]=f_key_str_value_num(depth,k,v)
          elseif tk=="boolean" then
            n=n+1 t[n]=f_key_boo_value_num(depth,k,v)
          elseif unknown then
            n=n+1 t[n]=f_key_str_value_num(depth,tostring(k),v)
          end
        elseif tv=="string" then
          if tk=="number" then
            n=n+1 t[n]=f_key_num_value_str(depth,k,v)
          elseif tk=="string" then
            n=n+1 t[n]=f_key_str_value_str(depth,k,v)
          elseif tk=="boolean" then
            n=n+1 t[n]=f_key_boo_value_str(depth,k,v)
          elseif unknown then
            n=n+1 t[n]=f_key_str_value_str(depth,tostring(k),v)
          end
        elseif tv=="table" then
          if next(v)==nil then
            if tk=="number" then
              n=n+1 t[n]=f_key_num_value_not(depth,k)
            elseif tk=="string" then
              n=n+1 t[n]=f_key_str_value_not(depth,k)
            elseif tk=="boolean" then
              n=n+1 t[n]=f_key_boo_value_not(depth,k)
            elseif unknown then
              n=n+1 t[n]=f_key_str_value_not(depth,tostring(k))
            end
          else
            local st=simple_table(v)
            if not st then
              do_serialize(v,k,depth,level+1)
            elseif tk=="number" then
              n=n+1 t[n]=f_key_num_value_seq(depth,k,st)
            elseif tk=="string" then
              n=n+1 t[n]=f_key_str_value_seq(depth,k,st)
            elseif tk=="boolean" then
              n=n+1 t[n]=f_key_boo_value_seq(depth,k,st)
            elseif unknown then
              n=n+1 t[n]=f_key_str_value_seq(depth,tostring(k),st)
            end
          end
        elseif tv=="boolean" then
          if tk=="number" then
            n=n+1 t[n]=f_key_num_value_boo(depth,k,v)
          elseif tk=="string" then
            n=n+1 t[n]=f_key_str_value_boo(depth,k,v)
          elseif tk=="boolean" then
            n=n+1 t[n]=f_key_boo_value_boo(depth,k,v)
          elseif unknown then
            n=n+1 t[n]=f_key_str_value_boo(depth,tostring(k),v)
          end
        else
          if tk=="number" then
            n=n+1 t[n]=f_key_num_value_str(depth,k,tostring(v))
          elseif tk=="string" then
            n=n+1 t[n]=f_key_str_value_str(depth,k,tostring(v))
          elseif tk=="boolean" then
            n=n+1 t[n]=f_key_boo_value_str(depth,k,tostring(v))
          elseif unknown then
            n=n+1 t[n]=f_key_str_value_str(depth,tostring(k),tostring(v))
          end
        end
      end
    end
    if level>0 then
      n=n+1 t[n]=f_stop(depth-1)
    end
  end
  local tname=type(name)
  if tname=="string" then
    if name=="return" then
      t={ f_table_return() }
    else
      t={ f_table_name(name) }
    end
  elseif tname=="number" then
    t={ f_table_entry(name) }
  elseif tname=="boolean" then
    if name then
      t={ f_table_return() }
    else
      t={ f_table_direct() }
    end
  else
    t={ f_table_name("t") }
  end
  if root then
    if getmetatable(root) then 
      local dummy=root._w_h_a_t_e_v_e_r_
      root._w_h_a_t_e_v_e_r_=nil
    end
    if next(root)~=nil then
      local st=simple_table(root)
      if st then
        return t[1]..f_fin_seq(st) 
      else
        do_serialize(root,name,1,0)
      end
    end
  end
  n=n+1
  t[n]=f_table_finish()
  return concat(t,"\n")
end
table.serialize=serialize
if setinspector then
  setinspector("table",function(v) if type(v)=="table" then print(serialize(v,"table",{})) return true end end)
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['util-sto']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local setmetatable,getmetatable,type=setmetatable,getmetatable,type
utilities=utilities or {}
utilities.storage=utilities.storage or {}
local storage=utilities.storage
function storage.mark(t)
  if not t then
    print("\nfatal error: storage cannot be marked\n")
    os.exit()
    return
  end
  local m=getmetatable(t)
  if not m then
    m={}
    setmetatable(t,m)
  end
  m.__storage__=true
  return t
end
function storage.allocate(t)
  t=t or {}
  local m=getmetatable(t)
  if not m then
    m={}
    setmetatable(t,m)
  end
  m.__storage__=true
  return t
end
function storage.marked(t)
  local m=getmetatable(t)
  return m and m.__storage__
end
function storage.checked(t)
  if not t then
    report("\nfatal error: storage has not been allocated\n")
    os.exit()
    return
  end
  return t
end
function storage.setinitializer(data,initialize)
  local m=getmetatable(data) or {}
  m.__index=function(data,k)
    m.__index=nil 
    initialize()
    return data[k]
  end
  setmetatable(data,m)
end
local keyisvalue={ __index=function(t,k)
  t[k]=k
  return k
end }
function storage.sparse(t)
  t=t or {}
  setmetatable(t,keyisvalue)
  return t
end
local function f_empty ()              return "" end 
local function f_self (t,k) t[k]=k        return k end
local function f_table (t,k) local v={} t[k]=v return v end
local function f_number(t,k) t[k]=0        return 0 end 
local function f_ignore()                   end 
local f_index={
  ["empty"]=f_empty,
  ["self"]=f_self,
  ["table"]=f_table,
  ["number"]=f_number,
}
function table.setmetatableindex(t,f)
  if type(t)~="table" then
    f,t=t,{}
  end
  local m=getmetatable(t)
  local i=f_index[f] or f
  if m then
    m.__index=i
  else
    setmetatable(t,{ __index=i })
  end
  return t
end
local f_index={
  ["ignore"]=f_ignore,
}
function table.setmetatablenewindex(t,f)
  if type(t)~="table" then
    f,t=t,{}
  end
  local m=getmetatable(t)
  local i=f_index[f] or f
  if m then
    m.__newindex=i
  else
    setmetatable(t,{ __newindex=i })
  end
  return t
end
function table.setmetatablecall(t,f)
  if type(t)~="table" then
    f,t=t,{}
  end
  local m=getmetatable(t)
  if m then
    m.__call=f
  else
    setmetatable(t,{ __call=f })
  end
  return t
end
function table.setmetatablekey(t,key,value)
  local m=getmetatable(t)
  if not m then
    m={}
    setmetatable(t,m)
  end
  m[key]=value
  return t
end
function table.getmetatablekey(t,key,value)
  local m=getmetatable(t)
  return m and m[key]
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['util-prs']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local lpeg,table,string=lpeg,table,string
local P,R,V,S,C,Ct,Cs,Carg,Cc,Cg,Cf,Cp=lpeg.P,lpeg.R,lpeg.V,lpeg.S,lpeg.C,lpeg.Ct,lpeg.Cs,lpeg.Carg,lpeg.Cc,lpeg.Cg,lpeg.Cf,lpeg.Cp
local lpegmatch,lpegpatterns=lpeg.match,lpeg.patterns
local concat,gmatch,find=table.concat,string.gmatch,string.find
local tostring,type,next,rawset=tostring,type,next,rawset
local mod,div=math.mod,math.div
utilities=utilities or {}
local parsers=utilities.parsers or {}
utilities.parsers=parsers
local patterns=parsers.patterns or {}
parsers.patterns=patterns
local setmetatableindex=table.setmetatableindex
local sortedhash=table.sortedhash
local sortedkeys=table.sortedkeys
local tohash=table.tohash
local hashes={}
utilities.parsers.hashes=hashes
local digit=R("09")
local space=P(' ')
local equal=P("=")
local comma=P(",")
local lbrace=P("{")
local rbrace=P("}")
local lparent=P("(")
local rparent=P(")")
local period=S(".")
local punctuation=S(".,:;")
local spacer=lpegpatterns.spacer
local whitespace=lpegpatterns.whitespace
local newline=lpegpatterns.newline
local anything=lpegpatterns.anything
local endofstring=lpegpatterns.endofstring
local nobrace=1-(lbrace+rbrace )
local noparent=1-(lparent+rparent)
local escape,left,right=P("\\"),P('{'),P('}')
lpegpatterns.balanced=P {
  [1]=((escape*(left+right))+(1-(left+right))+V(2))^0,
  [2]=left*V(1)*right
}
local nestedbraces=P { lbrace*(nobrace+V(1))^0*rbrace }
local nestedparents=P { lparent*(noparent+V(1))^0*rparent }
local spaces=space^0
local argument=Cs((lbrace/"")*((nobrace+nestedbraces)^0)*(rbrace/""))
local content=(1-endofstring)^0
lpegpatterns.nestedbraces=nestedbraces 
lpegpatterns.nestedparents=nestedparents 
lpegpatterns.nested=nestedbraces 
lpegpatterns.argument=argument   
lpegpatterns.content=content    
local value=P(lbrace*C((nobrace+nestedbraces)^0)*rbrace)+C((nestedbraces+(1-comma))^0)
local key=C((1-equal-comma)^1)
local pattern_a=(space+comma)^0*(key*equal*value+key*C(""))
local pattern_c=(space+comma)^0*(key*equal*value)
local key=C((1-space-equal-comma)^1)
local pattern_b=spaces*comma^0*spaces*(key*((spaces*equal*spaces*value)+C("")))
local hash={}
local function set(key,value)
  hash[key]=value
end
local pattern_a_s=(pattern_a/set)^1
local pattern_b_s=(pattern_b/set)^1
local pattern_c_s=(pattern_c/set)^1
patterns.settings_to_hash_a=pattern_a_s
patterns.settings_to_hash_b=pattern_b_s
patterns.settings_to_hash_c=pattern_c_s
function parsers.make_settings_to_hash_pattern(set,how)
  if how=="strict" then
    return (pattern_c/set)^1
  elseif how=="tolerant" then
    return (pattern_b/set)^1
  else
    return (pattern_a/set)^1
  end
end
function parsers.settings_to_hash(str,existing)
  if not str or str=="" then
    return {}
  elseif type(str)=="table" then
    if existing then
      for k,v in next,str do
        existing[k]=v
      end
      return exiting
    else
      return str
    end
  else
    hash=existing or {}
    lpegmatch(pattern_a_s,str)
    return hash
  end
end
function parsers.settings_to_hash_tolerant(str,existing)
  if not str or str=="" then
    return {}
  elseif type(str)=="table" then
    if existing then
      for k,v in next,str do
        existing[k]=v
      end
      return exiting
    else
      return str
    end
  else
    hash=existing or {}
    lpegmatch(pattern_b_s,str)
    return hash
  end
end
function parsers.settings_to_hash_strict(str,existing)
  if not str or str=="" then
    return nil
  elseif type(str)=="table" then
    if existing then
      for k,v in next,str do
        existing[k]=v
      end
      return exiting
    else
      return str
    end
  elseif str and str~="" then
    hash=existing or {}
    lpegmatch(pattern_c_s,str)
    return next(hash) and hash
  end
end
local separator=comma*space^0
local value=P(lbrace*C((nobrace+nestedbraces)^0)*rbrace)+C((nestedbraces+(1-comma))^0)
local pattern=spaces*Ct(value*(separator*value)^0)
patterns.settings_to_array=pattern
function parsers.settings_to_array(str,strict)
  if not str or str=="" then
    return {}
  elseif type(str)=="table" then
    return str
  elseif strict then
    if find(str,"{",1,true) then
      return lpegmatch(pattern,str)
    else
      return { str }
    end
  elseif find(str,",",1,true) then
    return lpegmatch(pattern,str)
  else
    return { str }
  end
end
local cache_a={}
local cache_b={}
function parsers.groupedsplitat(symbol,withaction)
  if not symbol then
    symbol=","
  end
  local pattern=(withaction and cache_b or cache_a)[symbol]
  if not pattern then
    local symbols=S(symbol)
    local separator=space^0*symbols*space^0
    local value=P(lbrace*C((nobrace+nestedbraces)^0)*rbrace)+C((nestedbraces+(1-(space^0*(symbols+P(-1)))))^0)
    if withaction then
      local withvalue=Carg(1)*value/function(f,s) return f(s) end
      pattern=spaces*withvalue*(separator*withvalue)^0
      cache_b[symbol]=pattern
    else
      pattern=spaces*Ct(value*(separator*value)^0)
      cache_a[symbol]=pattern
    end
  end
  return pattern
end
local pattern_a=parsers.groupedsplitat(",",false)
local pattern_b=parsers.groupedsplitat(",",true)
function parsers.stripped_settings_to_array(str)
  if not str or str=="" then
    return {}
  else
    return lpegmatch(pattern_a,str)
  end
end
function parsers.process_stripped_settings(str,action)
  if not str or str=="" then
    return {}
  else
    return lpegmatch(pattern_b,str,1,action)
  end
end
local function set(t,v)
  t[#t+1]=v
end
local value=P(Carg(1)*value)/set
local pattern=value*(separator*value)^0*Carg(1)
function parsers.add_settings_to_array(t,str)
  return lpegmatch(pattern,str,nil,t)
end
function parsers.hash_to_string(h,separator,yes,no,strict,omit)
  if h then
    local t,tn,s={},0,sortedkeys(h)
    omit=omit and tohash(omit)
    for i=1,#s do
      local key=s[i]
      if not omit or not omit[key] then
        local value=h[key]
        if type(value)=="boolean" then
          if yes and no then
            if value then
              tn=tn+1
              t[tn]=key..'='..yes
            elseif not strict then
              tn=tn+1
              t[tn]=key..'='..no
            end
          elseif value or not strict then
            tn=tn+1
            t[tn]=key..'='..tostring(value)
          end
        else
          tn=tn+1
          t[tn]=key..'='..value
        end
      end
    end
    return concat(t,separator or ",")
  else
    return ""
  end
end
function parsers.array_to_string(a,separator)
  if a then
    return concat(a,separator or ",")
  else
    return ""
  end
end
local pattern=Cf(Ct("")*Cg(C((1-S(", "))^1)*S(", ")^0*Cc(true))^1,rawset)
function utilities.parsers.settings_to_set(str)
  return str and lpegmatch(pattern,str) or {}
end
hashes.settings_to_set=table.setmetatableindex(function(t,k) 
  local v=k and lpegmatch(pattern,k) or {}
  t[k]=v
  return v
end)
getmetatable(hashes.settings_to_set).__mode="kv" 
function parsers.simple_hash_to_string(h,separator)
  local t,tn={},0
  for k,v in sortedhash(h) do
    if v then
      tn=tn+1
      t[tn]=k
    end
  end
  return concat(t,separator or ",")
end
local str=Cs(lpegpatterns.unquoted)+C((1-whitespace-equal)^1)
local setting=Cf(Carg(1)*(whitespace^0*Cg(str*whitespace^0*(equal*whitespace^0*str+Cc(""))))^1,rawset)
local splitter=setting^1
function utilities.parsers.options_to_hash(str,target)
  return str and lpegmatch(splitter,str,1,target or {}) or {}
end
local splitter=lpeg.tsplitat(" ")
function utilities.parsers.options_to_array(str)
  return str and lpegmatch(splitter,str) or {}
end
local value=P(lbrace*C((nobrace+nestedbraces)^0)*rbrace)+C(digit^1*lparent*(noparent+nestedparents)^1*rparent)+C((nestedbraces+(1-comma))^1)
local pattern_a=spaces*Ct(value*(separator*value)^0)
local function repeater(n,str)
  if not n then
    return str
  else
    local s=lpegmatch(pattern_a,str)
    if n==1 then
      return unpack(s)
    else
      local t,tn={},0
      for i=1,n do
        for j=1,#s do
          tn=tn+1
          t[tn]=s[j]
        end
      end
      return unpack(t)
    end
  end
end
local value=P(lbrace*C((nobrace+nestedbraces)^0)*rbrace)+(C(digit^1)/tonumber*lparent*Cs((noparent+nestedparents)^1)*rparent)/repeater+C((nestedbraces+(1-comma))^1)
local pattern_b=spaces*Ct(value*(separator*value)^0)
function parsers.settings_to_array_with_repeat(str,expand) 
  if expand then
    return lpegmatch(pattern_b,str) or {}
  else
    return lpegmatch(pattern_a,str) or {}
  end
end
local value=lbrace*C((nobrace+nestedbraces)^0)*rbrace
local pattern=Ct((space+value)^0)
function parsers.arguments_to_table(str)
  return lpegmatch(pattern,str)
end
function parsers.getparameters(self,class,parentclass,settings)
  local sc=self[class]
  if not sc then
    sc={}
    self[class]=sc
    if parentclass then
      local sp=self[parentclass]
      if not sp then
        sp={}
        self[parentclass]=sp
      end
      setmetatableindex(sc,sp)
    end
  end
  parsers.settings_to_hash(settings,sc)
end
function parsers.listitem(str)
  return gmatch(str,"[^, ]+")
end
local pattern=Cs { "start",
  start=V("one")+V("two")+V("three"),
  rest=(Cc(",")*V("thousand"))^0*(P(".")+endofstring)*anything^0,
  thousand=digit*digit*digit,
  one=digit*V("rest"),
  two=digit*digit*V("rest"),
  three=V("thousand")*V("rest"),
}
lpegpatterns.splitthousands=pattern 
function parsers.splitthousands(str)
  return lpegmatch(pattern,str) or str
end
local optionalwhitespace=whitespace^0
lpegpatterns.words=Ct((Cs((1-punctuation-whitespace)^1)+anything)^1)
lpegpatterns.sentences=Ct((optionalwhitespace*Cs((1-period)^0*period))^1)
lpegpatterns.paragraphs=Ct((optionalwhitespace*Cs((whitespace^1*endofstring/""+1-(spacer^0*newline*newline))^1))^1)
local dquote=P('"')
local equal=P('=')
local escape=P('\\')
local separator=S(' ,')
local key=C((1-equal)^1)
local value=dquote*C((1-dquote-escape*dquote)^0)*dquote
local pattern=Cf(Ct("")*(Cg(key*equal*value)*separator^0)^1,rawset)^0*P(-1)
function parsers.keq_to_hash(str)
  if str and str~="" then
    return lpegmatch(pattern,str)
  else
    return {}
  end
end
local defaultspecification={ separator=",",quote='"' }
function parsers.csvsplitter(specification)
  specification=specification and setmetatableindex(specification,defaultspecification) or defaultspecification
  local separator=specification.separator
  local quotechar=specification.quote
  local separator=S(separator~="" and separator or ",")
  local whatever=C((1-separator-newline)^0)
  if quotechar and quotechar~="" then
    local quotedata=nil
    for chr in gmatch(quotechar,".") do
      local quotechar=P(chr)
      local quoteword=quotechar*C((1-quotechar)^0)*quotechar
      if quotedata then
        quotedata=quotedata+quoteword
      else
        quotedata=quoteword
      end
    end
    whatever=quotedata+whatever
  end
  local parser=Ct((Ct(whatever*(separator*whatever)^0)*S("\n\r")^1)^0 )
  return function(data)
    return lpegmatch(parser,data)
  end
end
function parsers.rfc4180splitter(specification)
  specification=specification and setmetatableindex(specification,defaultspecification) or defaultspecification
  local separator=specification.separator 
  local quotechar=P(specification.quote) 
  local dquotechar=quotechar*quotechar  
/specification.quote
  local separator=S(separator~="" and separator or ",")
  local escaped=quotechar*Cs((dquotechar+(1-quotechar))^0)*quotechar
  local non_escaped=C((1-quotechar-newline-separator)^1)
  local field=escaped+non_escaped+Cc("")
  local record=Ct(field*(separator*field)^1)
  local headerline=record*Cp()
  local wholeblob=Ct((newline^(specification.strict and -1 or 1)*record)^0)
  return function(data,getheader)
    if getheader then
      local header,position=lpegmatch(headerline,data)
      local data=lpegmatch(wholeblob,data,position)
      return data,header
    else
      return lpegmatch(wholeblob,data)
    end
  end
end
local function ranger(first,last,n,action)
  if not first then
  elseif last==true then
    for i=first,n or first do
      action(i)
    end
  elseif last then
    for i=first,last do
      action(i)
    end
  else
    action(first)
  end
end
local cardinal=lpegpatterns.cardinal/tonumber
local spacers=lpegpatterns.spacer^0
local endofstring=lpegpatterns.endofstring
local stepper=spacers*(C(cardinal)*(spacers*S(":-")*spacers*(C(cardinal)+Cc(true) )+Cc(false) )*Carg(1)*Carg(2)/ranger*S(", ")^0 )^1
local stepper=spacers*(C(cardinal)*(spacers*S(":-")*spacers*(C(cardinal)+(P("*")+endofstring)*Cc(true) )+Cc(false) )*Carg(1)*Carg(2)/ranger*S(", ")^0 )^1*endofstring 
function parsers.stepper(str,n,action)
  if type(n)=="function" then
    lpegmatch(stepper,str,1,false,n or print)
  else
    lpegmatch(stepper,str,1,n,action or print)
  end
end
local pattern_math=Cs((P("%")/"\\percent "+P("^")*Cc("{")*lpegpatterns.integer*Cc("}")+anything)^0)
local pattern_text=Cs((P("%")/"\\percent "+(P("^")/"\\high")*Cc("{")*lpegpatterns.integer*Cc("}")+anything)^0)
patterns.unittotex=pattern
function parsers.unittotex(str,textmode)
  return lpegmatch(textmode and pattern_text or pattern_math,str)
end
local pattern=Cs((P("^")/"<sup>"*lpegpatterns.integer*Cc("</sup>")+anything)^0)
function parsers.unittoxml(str)
  return lpegmatch(pattern,str)
end
local cache={}
local spaces=lpegpatterns.space^0
local dummy=function() end
setmetatableindex(cache,function(t,k)
  local separator=P(k)
  local value=(1-separator)^0
  local pattern=spaces*C(value)*separator^0*Cp()
  t[k]=pattern
  return pattern
end)
local commalistiterator=cache[","]
function utilities.parsers.iterator(str,separator)
  local n=#str
  if n==0 then
    return dummy
  else
    local pattern=separator and cache[separator] or commalistiterator
    local p=1
    return function()
      if p<=n then
        local s,e=lpegmatch(pattern,str,p)
        if e then
          p=e
          return s
        end
      end
    end
  end
end
local function initialize(t,name)
  local source=t[name]
  if source then
    local result={}
    for k,v in next,t[name] do
      result[k]=v
    end
    return result
  else
    return {}
  end
end
local function fetch(t,name)
  return t[name] or {}
end
local function process(result,more)
  for k,v in next,more do
    result[k]=v
  end
  return result
end
local name=C((1-S(", "))^1)
local parser=(Carg(1)*name/initialize)*(S(", ")^1*(Carg(1)*name/fetch))^0
local merge=Cf(parser,process)
function utilities.parsers.mergehashes(hash,list)
  return lpegmatch(merge,list,1,hash)
end
function utilities.parsers.runtime(time)
  if not time then
    time=os.runtime()
  end
  local days=div(time,24*60*60)
  time=mod(time,24*60*60)
  local hours=div(time,60*60)
  time=mod(time,60*60)
  local minutes=div(time,60)
  local seconds=mod(time,60)
  return days,hours,minutes,seconds
end
local spacing=whitespace^0
local apply=P("->")
local method=C((1-apply)^1)
local token=lbrace*C((1-rbrace)^1)*rbrace+C(anything^1)
local pattern=spacing*(method*spacing*apply+Carg(1))*spacing*token
function utilities.parsers.splitmethod(str,default)
  if str then
    return lpegmatch(pattern,str,1,default or false)
  else
    return default or false,""
  end
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['util-dim']={
  version=1.001,
  comment="support for dimensions",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local format,match,gsub,type,setmetatable=string.format,string.match,string.gsub,type,setmetatable
local P,S,R,Cc,C,lpegmatch=lpeg.P,lpeg.S,lpeg.R,lpeg.Cc,lpeg.C,lpeg.match
local allocate=utilities.storage.allocate
local setmetatableindex=table.setmetatableindex
local formatters=string.formatters
local texget=tex and tex.get or function() return 65536*10*100 end
local p_stripzeros=lpeg.patterns.stripzeros
number=number or {}
local number=number
number.tonumberf=function(n) return lpegmatch(p_stripzeros,format("%.20f",n)) end
number.tonumberg=function(n) return format("%.20g",n) end
local dimenfactors=allocate {
  ["pt"]=1/65536,
  ["in"]=(100/7227)/65536,
  ["cm"]=(254/7227)/65536,
  ["mm"]=(2540/7227)/65536,
  ["sp"]=1,
  ["bp"]=(7200/7227)/65536,
  ["pc"]=(1/12)/65536,
  ["dd"]=(1157/1238)/65536,
  ["cc"]=(1157/14856)/65536,
  ["nd"]=(20320/21681)/65536,
  ["nc"]=(5080/65043)/65536
}
local f_none=formatters["%s%s"]
local f_true=formatters["%0.5F%s"]
local function numbertodimen(n,unit,fmt) 
  if type(n)=='string' then
    return n
  else
    unit=unit or 'pt'
    n=n*dimenfactors[unit]
    if not fmt then
      fmt=f_none(n,unit)
    elseif fmt==true then
      fmt=f_true(n,unit)
    else
      return formatters[fmt](n,unit)
    end
  end
end
number.maxdimen=1073741823
number.todimen=numbertodimen
number.dimenfactors=dimenfactors
function number.topoints   (n,fmt) return numbertodimen(n,"pt",fmt) end
function number.toinches   (n,fmt) return numbertodimen(n,"in",fmt) end
function number.tocentimeters (n,fmt) return numbertodimen(n,"cm",fmt) end
function number.tomillimeters (n,fmt) return numbertodimen(n,"mm",fmt) end
function number.toscaledpoints(n,fmt) return numbertodimen(n,"sp",fmt) end
function number.toscaledpoints(n)   return      n.."sp"   end
function number.tobasepoints (n,fmt) return numbertodimen(n,"bp",fmt) end
function number.topicas    (n,fmt) return numbertodimen(n "pc",fmt) end
function number.todidots   (n,fmt) return numbertodimen(n,"dd",fmt) end
function number.tociceros   (n,fmt) return numbertodimen(n,"cc",fmt) end
function number.tonewdidots  (n,fmt) return numbertodimen(n,"nd",fmt) end
function number.tonewciceros (n,fmt) return numbertodimen(n,"nc",fmt) end
local amount=(S("+-")^0*R("09")^0*P(".")^0*R("09")^0)+Cc("0")
local unit=R("az")^1+P("%")
local dimenpair=amount/tonumber*(unit^1/dimenfactors+Cc(1)) 
lpeg.patterns.dimenpair=dimenpair
local splitter=amount/tonumber*C(unit^1)
function number.splitdimen(str)
  return lpegmatch(splitter,str)
end
setmetatableindex(dimenfactors,function(t,s)
  return false
end)
local stringtodimen 
local amount=S("+-")^0*R("09")^0*S(".,")^0*R("09")^0
local unit=P("pt")+P("cm")+P("mm")+P("sp")+P("bp")+P("in")+P("pc")+P("dd")+P("cc")+P("nd")+P("nc")
local validdimen=amount*unit
lpeg.patterns.validdimen=validdimen
local dimensions={}
function dimensions.__add(a,b)
  local ta,tb=type(a),type(b)
  if ta=="string" then a=stringtodimen(a) elseif ta=="table" then a=a[1] end
  if tb=="string" then b=stringtodimen(b) elseif tb=="table" then b=b[1] end
  return setmetatable({ a+b },dimensions)
end
function dimensions.__sub(a,b)
  local ta,tb=type(a),type(b)
  if ta=="string" then a=stringtodimen(a) elseif ta=="table" then a=a[1] end
  if tb=="string" then b=stringtodimen(b) elseif tb=="table" then b=b[1] end
  return setmetatable({ a-b },dimensions)
end
function dimensions.__mul(a,b)
  local ta,tb=type(a),type(b)
  if ta=="string" then a=stringtodimen(a) elseif ta=="table" then a=a[1] end
  if tb=="string" then b=stringtodimen(b) elseif tb=="table" then b=b[1] end
  return setmetatable({ a*b },dimensions)
end
function dimensions.__div(a,b)
  local ta,tb=type(a),type(b)
  if ta=="string" then a=stringtodimen(a) elseif ta=="table" then a=a[1] end
  if tb=="string" then b=stringtodimen(b) elseif tb=="table" then b=b[1] end
  return setmetatable({ a/b },dimensions)
end
function dimensions.__unm(a)
  local ta=type(a)
  if ta=="string" then a=stringtodimen(a) elseif ta=="table" then a=a[1] end
  return setmetatable({-a },dimensions)
end
function dimensions.__lt(a,b)
  return a[1]<b[1]
end
function dimensions.__eq(a,b)
  return a[1]==b[1]
end
function dimensions.__tostring(a)
  return a[1]/65536 .."pt" 
end
function dimensions.__index(tab,key)
  local d=dimenfactors[key]
  if not d then
    error("illegal property of dimen: "..key)
    d=1
  end
  return 1/d
end
  dimenfactors["ex"]=4*1/65536 
  dimenfactors["em"]=10*1/65536
local known={} setmetatable(known,{ __mode="v" })
function dimen(a)
  if a then
    local ta=type(a)
    if ta=="string" then
      local k=known[a]
      if k then
        a=k
      else
        local value,unit=lpegmatch(dimenpair,a)
        if value and unit then
          k=value/unit 
        else
          k=0
        end
        known[a]=k
        a=k
      end
    elseif ta=="table" then
      a=a[1]
    end
    return setmetatable({ a },dimensions)
  else
    return setmetatable({ 0 },dimensions)
  end
end
function string.todimen(str) 
  if type(str)=="number" then
    return str
  else
    local k=known[str]
    if not k then
      local value,unit=lpegmatch(dimenpair,str)
      if value and unit then
        k=value/unit 
      else
        k=0
      end
      known[str]=k
    end
    return k
  end
end
stringtodimen=string.todimen 
function number.toscaled(d)
  return format("%0.5f",d/2^16)
end
function number.percent(n,d) 
  d=d or texget("hsize")
  if type(d)=="string" then
    d=stringtodimen(d)
  end
  return (n/100)*d
end
number["%"]=number.percent

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['util-jsn']={
  version=1.001,
  comment="companion to m-json.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local P,V,R,S,C,Cc,Cs,Ct,Cf,Cg=lpeg.P,lpeg.V,lpeg.R,lpeg.S,lpeg.C,lpeg.Cc,lpeg.Cs,lpeg.Ct,lpeg.Cf,lpeg.Cg
local lpegmatch=lpeg.match
local format=string.format
local utfchar=utf.char
local concat=table.concat
local tonumber,tostring,rawset,type=tonumber,tostring,rawset,type
local json=utilities.json or {}
utilities.json=json
local lbrace=P("{")
local rbrace=P("}")
local lparent=P("[")
local rparent=P("]")
local comma=P(",")
local colon=P(":")
local dquote=P('"')
local whitespace=lpeg.patterns.whitespace
local optionalws=whitespace^0
local escapes={
  ["b"]="\010",
  ["f"]="\014",
  ["n"]="\n",
  ["r"]="\r",
  ["t"]="\t",
}
local escape_un=C(P("\\u")/"0x"*S("09","AF","af"))/function(s) return utfchar(tonumber(s)) end
local escape_bs=P([[\]])/""*(P(1)/escapes) 
local jstring=dquote*Cs((escape_un+escape_bs+(1-dquote))^0)*dquote
local jtrue=P("true")*Cc(true)
local jfalse=P("false")*Cc(false)
local jnull=P("null")*Cc(nil)
local jnumber=(1-whitespace-rparent-rbrace-comma)^1/tonumber
local key=jstring
local jsonconverter={ "value",
  object=lbrace*Cf(Ct("")*V("pair")*(comma*V("pair"))^0,rawset)*rbrace,
  pair=Cg(optionalws*key*optionalws*colon*V("value")),
  array=Ct(lparent*V("value")*(comma*V("value"))^0*rparent),
  value=optionalws*(jstring+V("object")+V("array")+jtrue+jfalse+jnull+jnumber+#rparent)*optionalws,
}
function json.tolua(str)
  return lpegmatch(jsonconverter,str)
end
local function tojson(value,t) 
  local kind=type(value)
  if kind=="table" then
    local done=false
    local size=#value
    if size==0 then
      for k,v in next,value do
        if done then
          t[#t+1]=","
        else
          t[#t+1]="{"
          done=true
        end
        t[#t+1]=format("%q:",k)
        tojson(v,t)
      end
      if done then
        t[#t+1]="}"
      else
        t[#t+1]="{}"
      end
    elseif size==1 then
      t[#t+1]="["
      tojson(value[1],t)
      t[#t+1]="]"
    else
      for i=1,size do
        if done then
          t[#t+1]=","
        else
          t[#t+1]="["
          done=true
        end
        tojson(value[i],t)
      end
      t[#t+1]="]"
    end
  elseif kind=="string" then
    t[#t+1]=format("%q",value)
  elseif kind=="number" then
    t[#t+1]=value
  elseif kind=="boolean" then
    t[#t+1]=tostring(value)
  end
  return t
end
function json.tostring(value)
  local kind=type(value)
  if kind=="table" then
    return concat(tojson(value,{}),"")
  elseif kind=="string" or kind=="number" then
    return value
  else
    return tostring(value)
  end
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['trac-inf']={
  version=1.001,
  comment="companion to trac-inf.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local type,tonumber,select=type,tonumber,select
local format,lower,find=string.format,string.lower,string.find
local concat=table.concat
local clock=os.gettimeofday or os.clock 
local setmetatableindex=table.setmetatableindex
local serialize=table.serialize
local formatters=string.formatters
statistics=statistics or {}
local statistics=statistics
statistics.enable=true
statistics.threshold=0.01
local statusinfo,n,registered,timers={},0,{},{}
setmetatableindex(timers,function(t,k)
  local v={ timing=0,loadtime=0 }
  t[k]=v
  return v
end)
local function hastiming(instance)
  return instance and timers[instance]
end
local function resettiming(instance)
  timers[instance or "notimer"]={ timing=0,loadtime=0 }
end
local function starttiming(instance)
  local timer=timers[instance or "notimer"]
  local it=timer.timing or 0
  if it==0 then
    timer.starttime=clock()
    if not timer.loadtime then
      timer.loadtime=0
    end
  end
  timer.timing=it+1
end
local function stoptiming(instance)
  local timer=timers[instance or "notimer"]
  local it=timer.timing
  if it>1 then
    timer.timing=it-1
  else
    local starttime=timer.starttime
    if starttime then
      local stoptime=clock()
      local loadtime=stoptime-starttime
      timer.stoptime=stoptime
      timer.loadtime=timer.loadtime+loadtime
      timer.timing=0
      return loadtime
    end
  end
  return 0
end
local function elapsed(instance)
  if type(instance)=="number" then
    return instance or 0
  else
    local timer=timers[instance or "notimer"]
    return timer and timer.loadtime or 0
  end
end
local function elapsedtime(instance)
  return format("%0.3f",elapsed(instance))
end
local function elapsedindeed(instance)
  return elapsed(instance)>statistics.threshold
end
local function elapsedseconds(instance,rest) 
  if elapsedindeed(instance) then
    return format("%0.3f seconds %s",elapsed(instance),rest or "")
  end
end
statistics.hastiming=hastiming
statistics.resettiming=resettiming
statistics.starttiming=starttiming
statistics.stoptiming=stoptiming
statistics.elapsed=elapsed
statistics.elapsedtime=elapsedtime
statistics.elapsedindeed=elapsedindeed
statistics.elapsedseconds=elapsedseconds
function statistics.register(tag,fnc)
  if statistics.enable and type(fnc)=="function" then
    local rt=registered[tag] or (#statusinfo+1)
    statusinfo[rt]={ tag,fnc }
    registered[tag]=rt
    if #tag>n then n=#tag end
  end
end
local report=logs.reporter("mkiv lua stats")
function statistics.show()
  if statistics.enable then
    local register=statistics.register
    register("used platform",function()
      return format("%s, type: %s, binary subtree: %s",
        os.platform or "unknown",os.type or "unknown",environment.texos or "unknown")
    end)
    register("luatex banner",function()
      return lower(status.banner)
    end)
    register("control sequences",function()
      return format("%s of %s + %s",status.cs_count,status.hash_size,status.hash_extra)
    end)
    register("callbacks",function()
      local total,indirect=status.callbacks or 0,status.indirect_callbacks or 0
      return format("%s direct, %s indirect, %s total",total-indirect,indirect,total)
    end)
    if jit then
      local jitstatus={ jit.status() }
      if jitstatus[1] then
        register("luajit options",concat(jitstatus," ",2))
      end
    end
    register("lua properties",function()
      local hashchar=tonumber(status.luatex_hashchars)
      local hashtype=status.luatex_hashtype
      local mask=lua.mask or "ascii"
      return format("engine: %s, used memory: %s, hash type: %s, hash chars: min(%s,40), symbol mask: %s (%s)",
        jit and "luajit" or "lua",
        statistics.memused(),
        hashtype or "default",
        hashchar and 2^hashchar or "unknown",
        mask,
        mask=="utf" and "τεχ" or "tex")
    end)
    register("runtime",statistics.runtime)
    logs.newline() 
    for i=1,#statusinfo do
      local s=statusinfo[i]
      local r=s[2]()
      if r then
        report("%s: %s",s[1],r)
      end
    end
    statistics.enable=false
  end
end
function statistics.memused() 
  local round=math.round or math.floor
  return format("%s MB (ctx: %s MB)",round(collectgarbage("count")/1000),round(status.luastate_bytes/1000000))
end
starttiming(statistics)
function statistics.formatruntime(runtime) 
  return format("%s seconds",runtime)  
end
function statistics.runtime()
  stoptiming(statistics)
  return statistics.formatruntime(elapsedtime(statistics))
end
local report=logs.reporter("system")
function statistics.timed(action)
  starttiming("run")
  action()
  stoptiming("run")
  report("total runtime: %s seconds",elapsedtime("run"))
end
function statistics.tracefunction(base,tag,...)
  for i=1,select("#",...) do
    local name=select(i,...)
    local stat={}
    local func=base[name]
    setmetatableindex(stat,function(t,k) t[k]=0 return 0 end)
    base[name]=function(n,k,v) stat[k]=stat[k]+1 return func(n,k,v) end
    statistics.register(formatters["%s.%s"](tag,name),function() return serialize(stat,"calls") end)
  end
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['util-lua']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  comment="the strip code is written by Peter Cawley",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local rep,sub,byte,dump,format=string.rep,string.sub,string.byte,string.dump,string.format
local load,loadfile,type=load,loadfile,type
utilities=utilities or {}
utilities.lua=utilities.lua or {}
local luautilities=utilities.lua
local report_lua=logs.reporter("system","lua")
local tracestripping=false
local forcestupidcompile=true 
luautilities.stripcode=true 
luautilities.alwaysstripcode=false 
luautilities.nofstrippedchunks=0
luautilities.nofstrippedbytes=0
local strippedchunks={} 
luautilities.strippedchunks=strippedchunks
luautilities.suffixes={
  tma="tma",
  tmc=jit and "tmb" or "tmc",
  lua="lua",
  luc=jit and "lub" or "luc",
  lui="lui",
  luv="luv",
  luj="luj",
  tua="tua",
  tuc="tuc",
}
local function register(name)
  if tracestripping then
    report_lua("stripped bytecode from %a",name or "unknown")
  end
  strippedchunks[#strippedchunks+1]=name
  luautilities.nofstrippedchunks=luautilities.nofstrippedchunks+1
end
local function stupidcompile(luafile,lucfile,strip)
  local code=io.loaddata(luafile)
  if code and code~="" then
    code=load(code)
    if code then
      code=dump(code,strip and luautilities.stripcode or luautilities.alwaysstripcode)
      if code and code~="" then
        register(name)
        io.savedata(lucfile,code)
        return true,0
      end
    else
      report_lua("fatal error %a in file %a",1,luafile)
    end
  else
    report_lua("fatal error %a in file %a",2,luafile)
  end
  return false,0
end
function luautilities.loadedluacode(fullname,forcestrip,name)
  name=name or fullname
  local code,message
  if environment.loadpreprocessedfile then
    code,message=environment.loadpreprocessedfile(fullname)
  else
    code,message=loadfile(fullname)
  end
  if code then
    code()
  else
    report_lua("loading of file %a failed:\n\t%s",fullname,message or "no message")
  end
  if forcestrip and luautilities.stripcode then
    if type(forcestrip)=="function" then
      forcestrip=forcestrip(fullname)
    end
    if forcestrip or luautilities.alwaysstripcode then
      register(name)
      return load(dump(code,true)),0
    else
      return code,0
    end
  elseif luautilities.alwaysstripcode then
    register(name)
    return load(dump(code,true)),0
  else
    return code,0
  end
end
function luautilities.strippedloadstring(code,forcestrip,name) 
  local code,message=load(code)
  if not code then
    report_lua("loading of file %a failed:\n\t%s",name,message or "no message")
  end
  if forcestrip and luautilities.stripcode or luautilities.alwaysstripcode then
    register(name)
    return load(dump(code,true)),0 
  else
    return code,0
  end
end
function luautilities.compile(luafile,lucfile,cleanup,strip,fallback) 
  report_lua("compiling %a into %a",luafile,lucfile)
  os.remove(lucfile)
  local done=stupidcompile(luafile,lucfile,strip~=false)
  if done then
    report_lua("dumping %a into %a stripped",luafile,lucfile)
    if cleanup==true and lfs.isfile(lucfile) and lfs.isfile(luafile) then
      report_lua("removing %a",luafile)
      os.remove(luafile)
    end
  end
  return done
end
function luautilities.loadstripped(...)
  local l=load(...)
  if l then
    return load(dump(l,true))
  end
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['util-deb']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local debug=require "debug"
local getinfo=debug.getinfo
local type,next,tostring=type,next,tostring
local format,find=string.format,string.find
local is_boolean=string.is_boolean
utilities=utilities or {}
local debugger=utilities.debugger or {}
utilities.debugger=debugger
local counters={}
local names={}
local report=logs.reporter("debugger")
local function hook()
  local f=getinfo(2) 
  if f then
    local n="unknown"
    if f.what=="C" then
      n=f.name or '<anonymous>'
      if not names[n] then
        names[n]=format("%42s",n)
      end
    else
      n=f.name or f.namewhat or f.what
      if not n or n=="" then
        n="?"
      end
      if not names[n] then
        names[n]=format("%42s : % 5i : %s",n,f.linedefined or 0,f.short_src or "unknown source")
      end
    end
    counters[n]=(counters[n] or 0)+1
  end
end
function debugger.showstats(printer,threshold) 
  printer=printer or report
  threshold=threshold or 0
  local total,grandtotal,functions=0,0,0
  local dataset={}
  for name,count in next,counters do
    dataset[#dataset+1]={ name,count }
  end
  table.sort(dataset,function(a,b) return a[2]==b[2] and b[1]>a[1] or a[2]>b[2] end)
  for i=1,#dataset do
    local d=dataset[i]
    local name=d[1]
    local count=d[2]
    if count>threshold and not find(name,"for generator") then 
      printer(format("%8i  %s\n",count,names[name]))
      total=total+count
    end
    grandtotal=grandtotal+count
    functions=functions+1
  end
  printer("\n")
  printer(format("functions  : % 10i\n",functions))
  printer(format("total      : % 10i\n",total))
  printer(format("grand total: % 10i\n",grandtotal))
  printer(format("threshold  : % 10i\n",threshold))
end
function debugger.savestats(filename,threshold)
  local f=io.open(filename,'w')
  if f then
    debugger.showstats(function(str) f:write(str) end,threshold)
    f:close()
  end
end
function debugger.enable()
  debug.sethook(hook,"c")
end
function debugger.disable()
  debug.sethook()
end
local function showtraceback(rep) 
  local level=2 
  local reporter=rep or report
  while true do
    local info=getinfo(level,"Sl")
    if not info then
      break
    elseif info.what=="C" then
      reporter("%2i : %s",level-1,"C function")
    else
      reporter("%2i : %s : %s",level-1,info.short_src,info.currentline)
    end
    level=level+1
  end
end
debugger.showtraceback=showtraceback

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['util-tpl']={
  version=1.001,
  comment="companion to luat-lib.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
utilities.templates=utilities.templates or {}
local templates=utilities.templates
local trace_template=false trackers.register("templates.trace",function(v) trace_template=v end)
local report_template=logs.reporter("template")
local tostring=tostring
local format,sub,byte=string.format,string.sub,string.byte
local P,C,R,Cs,Cc,Carg,lpegmatch,lpegpatterns=lpeg.P,lpeg.C,lpeg.R,lpeg.Cs,lpeg.Cc,lpeg.Carg,lpeg.match,lpeg.patterns
local replacer
local function replacekey(k,t,how,recursive)
  local v=t[k]
  if not v then
    if trace_template then
      report_template("unknown key %a",k)
    end
    return ""
  else
    v=tostring(v)
    if trace_template then
      report_template("setting key %a to value %a",k,v)
    end
    if recursive then
      return lpegmatch(replacer,v,1,t,how,recursive)
    else
      return v
    end
  end
end
local sqlescape=lpeg.replacer {
  { "'","''"  },
  { "\\","\\\\" },
  { "\r\n","\\n" },
  { "\r","\\n" },
}
local sqlquoted=Cs(Cc("'")*sqlescape*Cc("'"))
lpegpatterns.sqlescape=sqlescape
lpegpatterns.sqlquoted=sqlquoted
local luaescape=lpegpatterns.luaescape
local escapers={
  lua=function(s)
    return lpegmatch(luaescape,s)
  end,
  sql=function(s)
    return lpegmatch(sqlescape,s)
  end,
}
local quotedescapers={
  lua=function(s)
    return format("%q",s)
  end,
  sql=function(s)
    return lpegmatch(sqlquoted,s)
  end,
}
local luaescaper=escapers.lua
local quotedluaescaper=quotedescapers.lua
local function replacekeyunquoted(s,t,how,recurse) 
  if how==false then
    return replacekey(s,t,how,recurse)
  else
    local escaper=how and escapers[how] or luaescaper
    return escaper(replacekey(s,t,how,recurse))
  end
end
local function replacekeyquoted(s,t,how,recurse) 
  if how==false then
    return replacekey(s,t,how,recurse)
  else
    local escaper=how and quotedescapers[how] or quotedluaescaper
    return escaper(replacekey(s,t,how,recurse))
  end
end
local function replaceoptional(l,m,r,t,how,recurse)
  local v=t[l]
  return v and v~="" and lpegmatch(replacer,r,1,t,how or "lua",recurse or false) or ""
end
local single=P("%") 
local double=P("%%") 
local lquoted=P("%[") 
local rquoted=P("]%") 
local lquotedq=P("%(") 
local rquotedq=P(")%") 
local escape=double/'%%'
local nosingle=single/''
local nodouble=double/''
local nolquoted=lquoted/''
local norquoted=rquoted/''
local nolquotedq=lquotedq/''
local norquotedq=rquotedq/''
local noloptional=P("%?")/''
local noroptional=P("?%")/''
local nomoptional=P(":")/''
local args=Carg(1)*Carg(2)*Carg(3)
local key=nosingle*((C((1-nosingle  )^1)*args)/replacekey    )*nosingle
local quoted=nolquotedq*((C((1-norquotedq )^1)*args)/replacekeyquoted )*norquotedq
local unquoted=nolquoted*((C((1-norquoted )^1)*args)/replacekeyunquoted)*norquoted
local optional=noloptional*((C((1-nomoptional)^1)*nomoptional*C((1-noroptional)^1)*args)/replaceoptional)*noroptional
local any=P(1)
   replacer=Cs((unquoted+quoted+escape+optional+key+any)^0)
local function replace(str,mapping,how,recurse)
  if mapping and str then
    return lpegmatch(replacer,str,1,mapping,how or "lua",recurse or false) or str
  else
    return str
  end
end
templates.replace=replace
function templates.replacer(str,how,recurse) 
  return function(mapping)
    return lpegmatch(replacer,str,1,mapping,how or "lua",recurse or false) or str
  end
end
function templates.load(filename,mapping,how,recurse)
  local data=io.loaddata(filename) or ""
  if mapping and next(mapping) then
    return replace(data,mapping,how,recurse)
  else
    return data
  end
end
function templates.resolve(t,mapping,how,recurse)
  if not mapping then
    mapping=t
  end
  for k,v in next,t do
    t[k]=replace(v,mapping,how,recurse)
  end
  return t
end

end -- closure

do -- begin closure to overcome local limits and interference

if not modules then modules={} end modules ['util-sta']={
  version=1.001,
  comment="companion to util-ini.mkiv",
  author="Hans Hagen, PRAGMA-ADE, Hasselt NL",
  copyright="PRAGMA ADE / ConTeXt Development Team",
  license="see context related readme files"
}
local insert,remove,fastcopy,concat=table.insert,table.remove,table.fastcopy,table.concat
local format=string.format
local select,tostring=select,tostring
local trace_stacker=false trackers.register("stacker.resolve",function(v) trace_stacker=v end)
local stacker=stacker or {}
utilities.stacker=stacker
local function start(s,t,first,last)
  if s.mode=="switch" then
    local n=tostring(t[last])
    if trace_stacker then
      s.report("start: %s",n)
    end
    return n
  else
    local r={}
    for i=first,last do
      r[#r+1]=tostring(t[i])
    end
    local n=concat(r," ")
    if trace_stacker then
      s.report("start: %s",n)
    end
    return n
  end
end
local function stop(s,t,first,last)
  if s.mode=="switch" then
    local n=tostring(false)
    if trace_stacker then
      s.report("stop: %s",n)
    end
    return n
  else
    local r={}
    for i=last,first,-1 do
      r[#r+1]=tostring(false)
    end
    local n=concat(r," ")
    if trace_stacker then
      s.report("stop: %s",n)
    end
    return n
  end
end
local function change(s,t1,first1,last1,t2,first2,last2)
  if s.mode=="switch" then
    local n=tostring(t2[last2])
    if trace_stacker then
      s.report("change: %s",n)
    end
    return n
  else
    local r={}
    for i=last1,first1,-1 do
      r[#r+1]=tostring(false)
    end
    local n=concat(r," ")
    for i=first2,last2 do
      r[#r+1]=tostring(t2[i])
    end
    if trace_stacker then
      s.report("change: %s",n)
    end
    return n
  end
end
function stacker.new(name)
  local report=logs.reporter("stacker",name or nil)
  local s
  local stack={}
  local list={}
  local ids={}
  local hash={}
  local hashing=true
  local function push(...)
    for i=1,select("#",...) do
      insert(stack,(select(i,...))) 
    end
    if hashing then
      local c=concat(stack,"|")
      local n=hash[c]
      if not n then
        n=#list+1
        hash[c]=n
        list[n]=fastcopy(stack)
      end
      insert(ids,n)
      return n
    else
      local n=#list+1
      list[n]=fastcopy(stack)
      insert(ids,n)
      return n
    end
  end
  local function pop()
    remove(stack)
    remove(ids)
    return ids[#ids] or s.unset or -1
  end
  local function clean()
    if #stack==0 then
      if trace_stacker then
        s.report("%s list entries, %s stack entries",#list,#stack)
      end
    end
  end
  local tops={}
  local top=nil
  local switch=nil
  local function resolve_reset(mode)
    if #tops>0 then
      report("resetting %s left-over states of %a",#tops,name)
    end
    tops={}
    top=nil
    switch=nil
  end
  local function resolve_begin(mode)
    if mode then
      switch=mode=="switch"
    else
      switch=s.mode=="switch"
    end
    top={ switch=switch }
    insert(tops,top)
  end
  local function resolve_step(ti)
    local result=nil
    local noftop=#top
    if ti>0 then
      local current=list[ti]
      if current then
        local noflist=#current
        local nofsame=0
        if noflist>noftop then
          for i=1,noflist do
            if current[i]==top[i] then
              nofsame=i
            else
              break
            end
          end
        else
          for i=1,noflist do
            if current[i]==top[i] then
              nofsame=i
            else
              break
            end
          end
        end
        local plus=nofsame+1
        if plus<=noftop then
          if plus<=noflist then
            if switch then
              result=s.change(s,top,plus,noftop,current,nofsame,noflist)
            else
              result=s.change(s,top,plus,noftop,current,plus,noflist)
            end
          else
            if switch then
              result=s.change(s,top,plus,noftop,current,nofsame,noflist)
            else
              result=s.stop(s,top,plus,noftop)
            end
          end
        elseif plus<=noflist then
          if switch then
            result=s.start(s,current,nofsame,noflist)
          else
            result=s.start(s,current,plus,noflist)
          end
        end
        top=current
      else
        if 1<=noftop then
          result=s.stop(s,top,1,noftop)
        end
        top={}
      end
      return result
    else
      if 1<=noftop then
        result=s.stop(s,top,1,noftop)
      end
      top={}
      return result
    end
  end
  local function resolve_end()
    if #tops>0 then 
      local result=s.stop(s,top,1,#top)
      remove(tops)
      top=tops[#tops]
      switch=top and top.switch
      return result
    end
  end
  local function resolve(t)
    resolve_begin()
    for i=1,#t do
      resolve_step(t[i])
    end
    resolve_end()
  end
  s={
    name=name or "unknown",
    unset=-1,
    report=report,
    start=start,
    stop=stop,
    change=change,
    push=push,
    pop=pop,
    clean=clean,
    resolve=resolve,
    resolve_begin=resolve_begin,
    resolve_step=resolve_step,
    resolve_end=resolve_end,
    resolve_reset=resolve_reset,
  }
  return s 
end

end -- closure
