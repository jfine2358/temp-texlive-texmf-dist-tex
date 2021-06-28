-- 
--  This is file `tagpdf.lua',
--  generated with the docstrip utility.
-- 
--  The original source files were:
-- 
--  tagpdf-backend.dtx  (with options: `lua')
--  
--  Copyright (C) 2019 Ulrike Fischer
--  
--  It may be distributed and/or modified under the conditions of
--  the LaTeX Project Public License (LPPL), either version 1.3c of
--  this license or (at your option) any later version.  The latest
--  version of this license is in the file:
--  
--     https://www.latex-project.org/lppl.txt
--  
--  This file is part of the "tagpdf bundle" (The Work in LPPL)
--  and all files in that bundle must be distributed together.
--  
--  File: tagpdf-backend.dtx
-- tagpdf.lua
-- Ulrike Fischer

local ProvidesLuaModule = {
    name          = "tagpdf",
    version       = "0.80",       --TAGVERSION
    date          = "2021-02-23", --TAGDATE
    description   = "tagpdf lua code",
    license       = "The LATEX Project Public License 1.3c"
}

if luatexbase and luatexbase.provides_module then
  luatexbase.provides_module (ProvidesLuaModule)
end

--[[
The code has quite probably a number of problems
 - more variables should be local instead of global
 - the naming is not always consistent due to the development of the code
 - the traversing of the shipout box must be tested with more complicated setups
 - it should probably handle more node types
 -
--]]

--[[
the main table is named ltx.__tag. It contains the functions and also the data
collected during the compilation.

ltx.__tag.mc     will contain mc connected data.
ltx.__tag.struct will contain structure related data.
ltx.__tag.page   will contain page data
ltx.__tag.tables contains also data from mc and struct (from older code). This needs cleaning up.
             There are certainly dublettes, but I don't dare yet ...
ltx.__tag.func   will contain (public) functions.
ltx.__tag.trace  will contain tracing/loging functions.
local funktions starts with __
functions meant for users will be in ltx.tag

functions
 ltx.__tag.func.get_num_from (tag):    takes a tag (string) and returns the id number
 ltx.__tag.func.output_num_from (tag): takes a tag (string) and prints (to tex) the id number
 ltx.__tag.func.get_tag_from (num):    takes a num and returns the tag
 ltx.__tag.func.output_tag_from (num): takes a num and prints (to tex) the tag
 ltx.__tag.func.store_mc_data (num,key,data): stores key=data in ltx.__tag.mc[num]
 ltx.__tag.func.store_mc_label (label,num): stores label=num in ltx.__tag.mc.labels
 ltx.__tag.func.store_mc_kid (mcnum,kid,page): stores the mc-kids of mcnum on page page
 ltx.__tag.func.store_mc_in_page(mcnum,mcpagecnt,page): stores in the page table the number of mcnum on this page
 ltx.__tag.func.store_struct_mcabs (structnum,mcnum): stores relations structnum<->mcnum (abs)
 ltx.__tag.func.mc_insert_kids (mcnum): inserts the /K entries for mcnum by wandering throught the [kids] table
 ltx.__tag.func.mark_page_elements(box,mcpagecnt,mccntprev,mcopen,name,mctypeprev) : the main function
 ltx.__tag.func.mark_shipout (): a wrapper around the core function which inserts the last EMC
 ltx.__tag.func.fill_parent_tree_line (page): outputs the entries of the parenttree for this page
 ltx.__tag.func.output_parenttree(): outputs the content of the parenttree
 ltx.__tag.func.markspaceon(), ltx.__tag.func.markspaceoff(): (de)activates the marking of positions for space chars
 ltx.__tag.trace.show_mc_data (num): shows ltx.__tag.mc[num]
 ltx.__tag.trace.show_all_mc_data (max): shows a maximum about mc's
 ltx.__tag.trace.show_seq: shows a sequence (array)
 ltx.__tag.trace.show_struct_data (num): shows data of structure num
 ltx.__tag.trace.show_prop: shows a prop
 ltx.__tag.trace.log
 ltx.__tag.trace.showspaces : boolean
--]]

local mctypeattributeid       = luatexbase.registernumber ("l__tag_mc_type_attr")
local mccntattributeid        = luatexbase.registernumber ("l__tag_mc_cnt_attr")
local iwspaceattributeid = luatexbase.registernumber ("g__tag_interwordspace_attr")
local iwfontattributeid = luatexbase.registernumber ("g__tag_interwordfont_attr")

local catlatex       = luatexbase.registernumber("catcodetable@latex")
local tagunmarkedbool= token.create("g__tag_tagunmarked_bool")
local truebool       = token.create("c_true_bool")

local tableinsert    = table.insert

-- not all needed, copied from lua-visual-debug.
local nodeid           = node.id
local nodecopy         = node.copy
local nodegetattribute = node.get_attribute
local nodesetattribute = node.set_attribute
local nodenew          = node.new
local nodetail         = node.tail
local nodeslide        = node.slide
local noderemove       = node.remove
local nodetraverseid   = node.traverse_id
local nodetraverse     = node.traverse
local nodeinsertafter  = node.insert_after
local nodeinsertbefore = node.insert_before
local pdfpageref       = pdf.pageref

local HLIST          = node.id("hlist")
local VLIST          = node.id("vlist")
local RULE           = node.id("rule")
local DISC           = node.id("disc")
local GLUE           = node.id("glue")
local GLYPH          = node.id("glyph")
local KERN           = node.id("kern")
local PENALTY        = node.id("penalty")
local LOCAL_PAR      = node.id("local_par")
local MATH           = node.id("math")

local function __tag_get_mathsubtype  (mathnode)
 if mathnode.subtype == 0 then
  subtype = "beginmath"
 else
  subtype = "endmath"
 end
 return subtype
end

ltx             = ltx        or { }
ltx.__tag          = ltx.__tag        or { }
ltx.__tag.mc             = ltx.__tag.mc     or  { } -- mc data
ltx.__tag.struct         = ltx.__tag.struct or  { } -- struct data
ltx.__tag.tables         = ltx.__tag.tables or  { } -- tables created with new prop and new seq.
                                            -- wasn't a so great idea ...
ltx.__tag.page           = ltx.__tag.page   or  { } -- page data, currently only i->{0->mcnum,1->mcnum,...}
ltx.__tag.trace          = ltx.__tag.trace  or  { } -- show commands
ltx.__tag.func           = ltx.__tag.func   or  { } -- functions
ltx.__tag.conf           = ltx.__tag.conf   or  { } -- configuration variables

local __tag_log =
 function (message,loglevel)
  if (loglevel or 3) <= tex.count["l__tag_loglevel_int"] then
   texio.write_nl("tagpdf: ".. message)
  end
 end

ltx.__tag.trace.log = __tag_log

local __tag_get_mc_cnt_type_tag = function (n)
  local mccnt      =  nodegetattribute(n,mccntattributeid)  or -1
  local mctype     =  nodegetattribute(n,mctypeattributeid)  or -1
  local tag        =  ltx.__tag.func.get_tag_from(mctype)
  return mccnt,mctype,tag
end

local function __tag_insert_emc_node (head,current)
 local emcnode = nodenew("whatsit","pdf_literal")
       emcnode.data = "EMC"
       emcnode.mode=1
       head = node.insert_before(head,current,emcnode)
 return head
end

local function __tag_insert_bmc_node (head,current,tag)
 local bmcnode = nodenew("whatsit","pdf_literal")
       bmcnode.data = "/"..tag.." BMC"
       bmcnode.mode=1
       head = node.insert_before(head,current,bmcnode)
 return head
end

local function __tag_insert_bdc_node (head,current,tag,dict)
 local bdcnode = nodenew("whatsit","pdf_literal")
       bdcnode.data = "/"..tag.."<<"..dict..">> BDC"
       bdcnode.mode=1
       head = node.insert_before(head,current,bdcnode)
 return head
end

-- this is for debugging the space chars
local function __tag_show_spacemark (head,current,color,height)
 local markcolor = color or "1 0 0"
 local markheight = height or 10
 local pdfstring = node.new("whatsit","pdf_literal")
       pdfstring.data =
       string.format("q "..markcolor.." RG "..markcolor.." rg 0.4 w 0 %g m 0 %g l S Q",-3,markheight)
       head = node.insert_after(head,current,pdfstring)
 return head
end

--[[ a function to mark up places where real space chars should be inserted
     it only sets an attribute.
--]]

local function __tag_mark_spaces (head)
  local inside_math = false
  for n in nodetraverse(head) do
    local id = n.id
    if id == GLYPH then
      local glyph = n
      if glyph.next and (glyph.next.id == GLUE)
        and not inside_math  and (glyph.next.width >0)
      then
        nodesetattribute(glyph.next,iwspaceattributeid,1)
        nodesetattribute(glyph.next,iwfontattributeid,glyph.font)
      -- for debugging
       if ltx.__tag.trace.showspaces then
        __tag_show_spacemark (head,glyph)
       end
      elseif glyph.next and (glyph.next.id==KERN) and not inside_math then
       local kern = glyph.next
       if kern.next and (kern.next.id== GLUE)  and (kern.next.width >0)
       then
        nodesetattribute(kern.next,iwspaceattributeid,1)
        nodesetattribute(kern.next,iwfontattributeid,glyph.font)
       end
      end
    elseif id == PENALTY then
      local glyph = n
      -- ltx.__tag.trace.log ("PENALTY ".. n.subtype.."VALUE"..n.penalty,3)
      if glyph.next and (glyph.next.id == GLUE)
        and not inside_math  and (glyph.next.width >0) and n.subtype==0
      then
        nodesetattribute(glyph.next,iwspaceattributeid,1)
      --  nodesetattribute(glyph.next,iwfontattributeid,glyph.font)
      -- for debugging
       if ltx.__tag.trace.showspaces then
        __tag_show_spacemark (head,glyph)
       end
      end
    elseif id == MATH then
      inside_math = (n.subtype == 0)
    end
  end
  return head
end

local function __tag_activate_mark_space ()
 if not luatexbase.in_callback ("pre_linebreak_filter","markspaces") then
  luatexbase.add_to_callback("pre_linebreak_filter",__tag_mark_spaces,"markspaces")
  luatexbase.add_to_callback("hpack_filter",__tag_mark_spaces,"markspaces")
 end
end

ltx.__tag.func.markspaceon=__tag_activate_mark_space

local function __tag_deactivate_mark_space ()
 if luatexbase.in_callback ("pre_linebreak_filter","markspaces") then
 luatexbase.remove_from_callback("pre_linebreak_filter","markspaces")
 luatexbase.remove_from_callback("hpack_filter","markspaces")
 end
end
--
ltx.__tag.func.markspaceoff=__tag_deactivate_mark_space

local default_space_char = node.new(GLYPH)
local default_fontid     = font.id("TU/lmr/m/n/10")
default_space_char.char  = 32
default_space_char.font  = default_fontid

local function __tag_insert_space_char (head,n,fontid)
 if luaotfload.aux.slot_of_name(fontid,"space") then
  local space
  -- head, space = node.insert_before(head, n, ) -- Set the right font
  -- n.width = n.width - space.width
  -- space.attr = n.attr
 end
end

--[[
    Now follows the core function
    It wades through the shipout box and checks the attributes
    ARGUMENTS
    box: is a box,
    mcpagecnt: num, the current page cnt of mc (should start at -1 in shipout box), needed for recursion
    mccntprev: num, the attribute cnt of the previous node/whatever - if different we have a chunk border
    mcopen: num, records if some bdc/emc is open
    These arguments are only needed for log messages, if not present are replaces by fix strings:
    name: string to describe the box
    mctypeprev: num, the type attribute of the previous node/whatever

    there are lots of logging messages currently. Should be cleaned up in due course.
    One should also find ways to make the function shorter.
--]]

function ltx.__tag.func.mark_page_elements (box,mcpagecnt,mccntprev,mcopen,name,mctypeprev)
  local name = name or ("SOMEBOX")
  local mctypeprev = mctypeprev or -1
  local abspage = status.total_pages + 1  -- the real counter is increased inside the box so one off
                                                                       -- if the callback is not used.
  ltx.__tag.trace.log ("PAGE " .. abspage,3)
  ltx.__tag.trace.log ("FUNC ARGS: pagecnt".. mcpagecnt.." prev "..mccntprev .. " type prev "..mctypeprev,4)
  ltx.__tag.trace.log ("TRAVERSING BOX ".. tostring(name).." TYPE ".. node.type(node.getid(box)),3)
  local head = box.head -- ShipoutBox is a vlist?
  if head then
    mccnthead, mctypehead,taghead = __tag_get_mc_cnt_type_tag (head)
    ltx.__tag.trace.log ("HEAD " .. node.type(node.getid(head)).. " MC"..tostring(mccnthead).." => TAG "..tostring(mctypehead).." => "..tostring(taghead),3)
  else
    ltx.__tag.trace.log ("HEAD is ".. tostring(head),3)
  end
  for n in node.traverse(head) do
    local mccnt, mctype, tag = __tag_get_mc_cnt_type_tag (n)
    local spaceattr = nodegetattribute(n,iwspaceattributeid)  or -1
    ltx.__tag.trace.log ("NODE ".. node.type(node.getid(n)).." MC"..tostring(mccnt).." => TAG "..tostring(mctype).." => " .. tostring(tag),3)
    if n.id == HLIST
    then -- enter the hlist
     mcopen,mcpagecnt,mccntprev,mctypeprev=
      ltx.__tag.func.mark_page_elements (n,mcpagecnt,mccntprev,mcopen,"INTERNAL HLIST",mctypeprev)
    elseif n.id == VLIST then -- enter the vlist
     mcopen,mcpagecnt,mccntprev,mctypeprev=
      ltx.__tag.func.mark_page_elements (n,mcpagecnt,mccntprev,mcopen,"INTERNAL VLIST",mctypeprev)
    elseif n.id == GLUE then       -- at glue real space chars are inserted, for the rest it is ignored
     -- for debugging
     if ltx.__tag.trace.showspaces and spaceattr==1  then
        __tag_show_spacemark (head,n,"0 1 0")
     end
     if spaceattr==1  then
        local space
        local space_char = node.copy(default_space_char)
        local curfont    = nodegetattribute(n,iwfontattributeid)
        ltx.__tag.trace.log ("FONT ".. tostring(curfont),3)
        if curfont and luaotfload.aux.slot_of_name(curfont,"space") then
          space_char.font=curfont
        end
        head, space = node.insert_before(head, n, space_char) --
        n.width     = n.width - space.width
        space.attr  = n.attr
     end
    elseif n.id == LOCAL_PAR then  -- local_par is ignored
    elseif n.id == PENALTY then    -- penalty is ignored
    elseif n.id == KERN then       -- kern is ignored
     ltx.__tag.trace.log ("SUBTYPE KERN ".. n.subtype,3)
    else
     -- math is currently only logged.
     -- we could mark the whole as math
     -- for inner processing the mlist_to_hlist callback is probably needed.
     if n.id == MATH then
      ltx.__tag.trace.log("NODE "..node.type(node.getid(n)).." "..__tag_get_mathsubtype(n),3)
     end
     -- endmath
     ltx.__tag.trace.log("CURRENT "..mccnt.." PREV "..mccntprev,3)
     if mccnt~=mccntprev then -- a new mc chunk
      ltx.__tag.trace.log ("NODE ".. node.type(node.getid(n)).." MC"..tostring(mccnt).." <=> PREVIOUS "..tostring(mccntprev),3)
      if mcopen~=0 then -- there is a chunk open, close it (hope there is only one ...
       box.list=__tag_insert_emc_node (box.list,n)
       mcopen = mcopen - 1
       ltx.__tag.trace.log ("INSERT EMC " .. mcpagecnt .. " MCOPEN = " .. mcopen,2)
       if mcopen ~=0 then
        ltx.__tag.trace.log ("!WARNING! open mc" .. " MCOPEN = " .. mcopen,1)
       end
      end
      if ltx.__tag.mc[mccnt] then
       if ltx.__tag.mc[mccnt]["artifact"] then
        ltx.__tag.trace.log("THIS IS AN ARTIFACT of type "..tostring(ltx.__tag.mc[mccnt]["artifact"]),3)
        if ltx.__tag.mc[mccnt]["artifact"] == "" then
         box.list = __tag_insert_bmc_node (box.list,n,"Artifact")
        else
         box.list = __tag_insert_bdc_node (box.list,n,"Artifact", "/Type /"..ltx.__tag.mc[mccnt]["artifact"])
        end
       else
        ltx.__tag.trace.log("THIS IS A TAG "..tostring(tag),3)
        mcpagecnt = mcpagecnt +1
        ltx.__tag.trace.log ("INSERT BDC "..mcpagecnt,2)
        local dict= "/MCID "..mcpagecnt
        if ltx.__tag.mc[mccnt]["raw"] then
         ltx.__tag.trace.log("RAW CONTENT"..tostring(ltx.__tag.mc[mccnt]["raw"]),3)
         dict= dict .. " " .. ltx.__tag.mc[mccnt]["raw"]
        end
        if ltx.__tag.mc[mccnt]["alt"] then
         ltx.__tag.trace.log("RAW CONTENT"..tostring(ltx.__tag.mc[mccnt]["alt"]),3)
         dict= dict .. " " .. ltx.__tag.mc[mccnt]["alt"]
        end
        if ltx.__tag.mc[mccnt]["actualtext"] then
         ltx.__tag.trace.log("RAW CONTENT"..tostring(ltx.__tag.mc[mccnt]["actualtext"]),3)
         dict= dict .. " " .. ltx.__tag.mc[mccnt]["actualtext"]
        end
        box.list = __tag_insert_bdc_node (box.list,n,tag, dict)
        ltx.__tag.func.store_mc_kid (mccnt,mcpagecnt,abspage)
        ltx.__tag.func.store_mc_in_page(mccnt,mcpagecnt,abspage)
        ltx.__tag.trace.show_mc_data (mccnt)
       end
       mcopen = mcopen + 1
      else
       ltx.__tag.trace.log("THIS HAS NOT BEEN TAGGED",1)
     -- perhaps code that tag a artifact can be added ...
       if tagunmarkedbool.mode == truebool.mode then
        box.list = __tag_insert_bmc_node (box.list,n,"Artifact")
        mcopen = mcopen + 1
       end
      end
      mccntprev = mccnt
     end
    end -- end if
  end -- end for
  if head then
    mccnthead, mctypehead,taghead = __tag_get_mc_cnt_type_tag (head)
    ltx.__tag.trace.log ("ENDHEAD " .. node.type(node.getid(head)).. " MC"..tostring(mccnthead).." => TAG "..tostring(mctypehead).." => "..tostring(taghead),3)
  else
    ltx.__tag.trace.log ("ENDHEAD is ".. tostring(head),3)
  end
  ltx.__tag.trace.log ("QUITTING TRAVERSING BOX ".. tostring(name).." TYPE ".. node.type(node.getid(box)),3)
 return mcopen,mcpagecnt,mccntprev,mctypeprev
end

function ltx.__tag.func.mark_shipout (box)
 mcopen = ltx.__tag.func.mark_page_elements (box,-1,-100,0,"Shipout",-1)
 if mcopen~=0 then -- there is a chunk open, close it (hope there is only one ...
  local emcnode = nodenew("whatsit","pdf_literal")
  local list = box.list
  emcnode.data = "EMC"
  emcnode.mode=1
  if list then
     list = node.insert_after (list,node.tail(list),emcnode)
     mcopen = mcopen - 1
     ltx.__tag.trace.log ("INSERT LAST EMC, MCOPEN = " .. mcopen,2)
  else
     ltx.__tag.trace.log ("UPS ",1)
  end
  if mcopen ~=0 then
     ltx.__tag.trace.log ("!WARNING! open mc" .. " MCOPEN = " .. mcopen,1)
  end
 end
end

function ltx.__tag.trace.show_seq (seq)
 if (type(seq) == "table") then
  for i,v in ipairs(seq) do
   __tag_log ("[" .. i .. "] => " .. tostring(v),1)
  end
  else
   __tag_log ("sequence " .. tostring(seq) .. " not found",1)
  end
end

local __tag_pairs_prop =
 function  (prop)
      local a = {}
      for n in pairs(prop) do tableinsert(a, n) end
      table.sort(a)
      local i = 0                -- iterator variable
      local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then return nil
        else return a[i], prop[a[i]]
        end
      end
      return iter
  end

function ltx.__tag.trace.show_prop (prop)
 if (type(prop) == "table") then
  for i,v in __tag_pairs_prop (prop) do
    __tag_log ("[" .. i .. "] => " .. tostring(v),1)
  end
 else
   __tag_log ("prop " .. tostring(prop) .. " not found or not a table",1)
 end
 end

local __tag_get_num_from =
 function (tag)
  if ltx.__tag.tables["g__tag_role_tags_prop"][tag] then
    a= ltx.__tag.tables["g__tag_role_tags_prop"][tag]
  else
    a= -1
  end
  return a
 end

ltx.__tag.func.get_num_from = __tag_get_num_from

function ltx.__tag.func.output_num_from (tag)
  local num = __tag_get_num_from (tag)
  tex.sprint(catlatex,num)
  if num == -1 then
   __tag_log ("Unknown tag "..tag.." used")
  end
end

local __tag_get_tag_from =
 function  (num)
  if ltx.__tag.tables["g__tag_role_tags_seq"][num] then
   a = ltx.__tag.tables["g__tag_role_tags_seq"][num]
  else
   a= "UNKNOWN"
  end
 return a
end

ltx.__tag.func.get_tag_from = __tag_get_tag_from

function ltx.__tag.func.output_tag_from (num)
  tex.sprint(catlatex,__tag_get_tag_from (num))
end

function ltx.__tag.func.store_mc_data (num,key,data)
 ltx.__tag.mc[num] = ltx.__tag.mc[num] or { }
 ltx.__tag.mc[num][key] = data
 __tag_log  ("storing mc"..num..": "..tostring(key).."=>"..tostring(data))
end

function ltx.__tag.trace.show_mc_data (num)
 if ltx.__tag and ltx.__tag.mc and ltx.__tag.mc[num] then
  for k,v in pairs(ltx.__tag.mc[num]) do
   __tag_log  ("mc"..num..": "..tostring(k).."=>"..tostring(v),3)
  end
  if ltx.__tag.mc[num]["kids"] then
  __tag_log ("mc" .. num .. " has " .. #ltx.__tag.mc[num]["kids"] .. " kids",3)
   for k,v in ipairs(ltx.__tag.mc[num]["kids"]) do
    __tag_log ("mc ".. num .. " kid "..k.." =>" .. v.kid.." on page " ..v.page,3)
   end
  end
 else
  __tag_log  ("mc"..num.." not found",3)
 end
end

function ltx.__tag.trace.show_all_mc_data (max)
 for i = 1, max do
  ltx.__tag.trace.show_mc_data (i)
 end
end

function ltx.__tag.func.store_mc_label (label,num)
 ltx.__tag.mc["labels"] = ltx.__tag.mc["labels"] or { }
 ltx.__tag.mc.labels[label] = num
end

function ltx.__tag.func.store_mc_kid (mcnum,kid,page)
 ltx.__tag.trace.log("MC"..mcnum.." STORING KID" .. kid.." on page " .. page,3)
 ltx.__tag.mc[mcnum]["kids"] = ltx.__tag.mc[mcnum]["kids"] or { }
 local kidtable = {kid=kid,page=page}
 tableinsert(ltx.__tag.mc[mcnum]["kids"], kidtable )
end

function ltx.__tag.func.mc_num_of_kids (mcnum)
 local num = 0
 if ltx.__tag.mc[mcnum] and ltx.__tag.mc[mcnum]["kids"] then
   num = #ltx.__tag.mc[mcnum]["kids"]
 end
 ltx.__tag.trace.log ("MC" .. mcnum .. "has " .. num .. "KIDS",4)
 return num
end

function ltx.__tag.func.mc_insert_kids (mcnum,single)
  if ltx.__tag.mc[mcnum] then
  ltx.__tag.trace.log("MC-KIDS test " .. mcnum,4)
   if ltx.__tag.mc[mcnum]["kids"] then
    if #ltx.__tag.mc[mcnum]["kids"] > 1 and single==1 then
     tex.sprint("[")
    end
    for i,kidstable in ipairs( ltx.__tag.mc[mcnum]["kids"] ) do
     local kidnum  = kidstable["kid"]
     local kidpage = kidstable["page"]
     local kidpageobjnum = pdfpageref(kidpage)
     ltx.__tag.trace.log("MC" .. mcnum .. " insert KID " ..i.. " with num " .. kidnum .. " on page " .. kidpage.."/"..kidpageobjnum,3)
     tex.sprint(catlatex,"<</Type /MCR /Pg "..kidpageobjnum .. " 0 R /MCID "..kidnum.. ">> " )
    end
    if #ltx.__tag.mc[mcnum]["kids"] > 1 and single==1 then
     tex.sprint("]")
    end
   else
    ltx.__tag.trace.log("WARN! MC"..mcnum.." has no kids",0)
    if single==1 then
      tex.sprint("null")
    end
   end
  else
   ltx.__tag.trace.log("WARN! MC"..mcnum.." doesn't exist",0)
  end
end

function ltx.__tag.func.store_struct_mcabs (structnum,mcnum)
 ltx.__tag.struct[structnum]=ltx.__tag.struct[structnum] or { }
 ltx.__tag.struct[structnum]["mc"]=ltx.__tag.struct[structnum]["mc"] or { }
 -- a structure can contain more than on mc chunk, the content should be ordered
 tableinsert(ltx.__tag.struct[structnum]["mc"],mcnum)
 ltx.__tag.trace.log("MCNUM "..mcnum.." insert in struct "..structnum,3)
 -- but every mc can only be in one structure
 ltx.__tag.mc[mcnum]= ltx.__tag.mc[mcnum] or { }
 ltx.__tag.mc[mcnum]["parent"] = structnum
end

function ltx.__tag.trace.show_struct_data (num)
 if ltx.__tag and ltx.__tag.struct and ltx.__tag.struct[num] then
  for k,v in ipairs(ltx.__tag.struct[num]) do
   __tag_log  ("struct "..num..": "..tostring(k).."=>"..tostring(v))
  end
 else
  __tag_log   ("struct "..num.." not found ")
 end
end

-- pay attention: lua counts arrays from 1, tex pages from one
-- mcid and arrays in pdf count from 0.
function ltx.__tag.func.store_mc_in_page (mcnum,mcpagecnt,page)
 ltx.__tag.page[page] = ltx.__tag.page[page] or {}
 ltx.__tag.page[page][mcpagecnt] = mcnum
 ltx.__tag.trace.log("PAGE " .. page .. ": inserting MCID " .. mcpagecnt .. " => " .. mcnum,3)
end

function ltx.__tag.func.fill_parent_tree_line (page)
     -- we need to get page-> i=kid -> mcnum -> structnum
     -- pay attention: the kid numbers and the page number in the parent tree start with 0!
    local numsentry =""
    local pdfpage = page-1
    if ltx.__tag.page[page] and ltx.__tag.page[page][0] then
     mcchunks=#ltx.__tag.page[page]
     ltx.__tag.trace.log("PAGETREE PAGE "..page.." has "..mcchunks.."+1 Elements ",3)
     for i=0,mcchunks do
      ltx.__tag.trace.log("PAGETREE CHUNKS "..ltx.__tag.page[page][i],3)
     end
     if mcchunks == 0 then
      -- only one chunk so no need for an array
      local mcnum  = ltx.__tag.page[page][0]
      local structnum = ltx.__tag.mc[mcnum]["parent"]
      local propname  = "g__tag_struct_"..structnum.."_prop"
      local objref   =  ltx.__tag.tables[propname]["objref"] or "XXXX"
       texio.write_nl("=====>"..tostring(objref))
      numsentry = pdfpage .. " [".. objref .. "]"
      ltx.__tag.trace.log("PAGETREE PAGE" .. page.. " NUM ENTRY = ".. numsentry,3)
     else
      numsentry = pdfpage .. " ["
       for i=0,mcchunks do
        local mcnum  = ltx.__tag.page[page][i]
        local structnum = ltx.__tag.mc[mcnum]["parent"] or 0
        local propname  = "g__tag_struct_"..structnum.."_prop"
        local objref   =  ltx.__tag.tables[propname]["objref"] or "XXXX"
        numsentry = numsentry .. " ".. objref
       end
      numsentry = numsentry .. "] "
      ltx.__tag.trace.log("PAGETREE PAGE" .. page.. " NUM ENTRY = ".. numsentry,3)
     end
    else
      ltx.__tag.trace.log ("PAGETREE: NO DATA FOR PAGE "..page,3)
    end
    return numsentry
end

function ltx.__tag.func.output_parenttree (abspage)
 for i=1,abspage do
  line = ltx.__tag.func.fill_parent_tree_line (i) .. "^^J"
  tex.sprint(catlatex,line)
 end
end

-- 
--  End of File `tagpdf.lua'.
