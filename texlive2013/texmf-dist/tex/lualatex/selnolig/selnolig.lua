-- Lua code for the selnolig package, to be loaded
-- with an instruction such as 
--    \directlua{  require("selnolig.lua")  }
-- from a (Lua)LaTeX .sty file.
--
-- Author: Mico Loretan (loretan dot mico at gmail dot com)
--    (with crucial contributions by Taco Hoekwater, 
--    Patrick Gundlach, and Steffen Hildebrandt)
--
-- The entire selnolig package is placed under the terms 
-- of the LaTeX Project Public License, version 1.3 or 
-- later. (http://www.latex-project.org/lppl.txt).
-- It has the status "maintained".

selnolig = { }
selnolig.module = {
   name         = "selnolig",
   version      = "0.218",
   date         = "2013/05/28",
   description  = "Selective suppression of typographic ligatures",
   author       = "Mico Loretan",
   copyright    = "Mico Loretan",
   license      = "LPPL 1.3 or later"
}

-- Define variables corresponding to various text nodes 
-- (cf. section 8.1.2 of LuaTeX reference guide)
local hlist   = node.id('hlist')
local vlist   = node.id('vlist')
local rule    = node.id('rule')
local ins     = node.id('ins')
local mark    = node.id('mark')
local adjust  = node.id('adjust')
local disc    = node.id('disc')
local math    = node.id('math')
local glue    = node.id("glue") --
local kern    = node.id('kern')
local penalty = node.id('penalty')
local glyph   = node.id('glyph') --
local margin_kern  = node.id('margin_kern')

-- see section 8.1.4 for whatsit nodes:
local whatsit = node.id("whatsit") --

local userdefined

for n,v in pairs ( node.whatsits() ) do
  if v == 'user_defined' then userdefined = n end
end

local identifier = 123456  -- any unique identifier
local noliga={}
local keepliga={}          -- String -> Boolean
debug=false

function debug_info(s)
  if debug then
    texio.write_nl(s)
  end
end

local blocknode   = node.new(whatsit, userdefined)
blocknode.type    = 100
blocknode.user_id = identifier

local prefix_length = function(word, byte)
  return unicode.utf8.len( string.sub(word,0,byte) )
end

  -- Problem: string.find and unicode.utf8.find return 
  -- the byte-position at which the pattern is found 
  -- instead of the character-position. Fix this by
  -- providing a dedicated string search function.

local unicode_find = function(s, pattern, position)
  -- Start by correcting the incoming position
  if position ~= nil then
    -- debug_info("Position: "..position)
    sub = string.sub(s, 1, position)
    position=position+string.len(sub) - unicode.utf8.len(sub)
    -- debug_info("Corrected position: "..position)
  end
  -- Now execute find and fix it accordingly
  byte_pos = unicode.utf8.find(s, pattern, position)
  if byte_pos ~= nil then
    -- "convert" byte_pos to "unicode_pos"
    return unicode.utf8.len( string.sub(s, 1, byte_pos) )
  else
    return nil
  end
end

function process_ligatures(nodes,tail)
  local s={}
  local current_node=nodes
  local build_liga_table =  function(strlen,t)
    local p={}
    for i = 1, strlen do
      p[i]=0
    end
    for k,v in pairs(t) do
      -- debug_info("Match: "..v[3])
      local c= unicode_find(noliga[v[3]],"|")
      local correction=1
      while c~=nil do
         --debug_info("Position "..(v[1]+c))
         p[v[1]+c-correction] = 1
         c = unicode_find(noliga[v[3]],"|",c+1)
         correction = correction+1
      end
    end
    --debug_info("Liga table: "..table.concat(p, ""))
    return p
  end
  local apply_ligatures=function(head,ligatures)
     local i=1
     local hh=head
     local last=node.tail(head)
     for curr in node.traverse_id(glyph,head) do
       if ligatures[i]==1 then
         debug_info("Inserting nolig whatsit before glyph: " ..unicode.utf8.char(curr.char))
         node.insert_before(hh,curr, node.copy(blocknode))
         hh=curr
       end
       last=curr
       if i==#ligatures then
         -- debug_info("Leave node list on position: "..i)
         break
       end
       i=i+1
     end
     if(last~=nil) then
       debug_info("Last char: "..unicode.utf8.char(last.char))
     end
  end
  for t in node.traverse(nodes) do
    if t.id==glyph then
      s[#s+1]=unicode.utf8.char(t.char)
    -- Up until version 0.215, the next instruction was
    --   coded simply as "elseif (t.id==glue) then"
    elseif ( t.id==glue or t.id==rule or t.id==kern ) then 
      local f=string.gsub(table.concat(s,""),"[\\?!,\\.]+","")
      local throwliga={} 
      for k,v in pairs (noliga) do
        local count=1
        local match = string.find(f,k)
        while match do
          count    = match
          keep     = false
          debug_k1 = ""
          for k1,v1 in pairs (keepliga) do
            if v1 and string.find(f,k1) and string.find(k1,k) then
              debug_k1=k1
              keep=true
              break
            end
          end
          if not keep then
            debug_info("pattern match: "..f .." - "..k)
            local n = match + string.len(k) - 1
            table.insert(throwliga,{prefix_length(f,match),n,k})
          else
            debug_info("pattern match nolig and keeplig: "..f .." - "..k.." - "..debug_k1)
          end
          match= string.find(f,k,count+1)
        end
      end
      if #throwliga==0 then
      --  debug_info("No ligature suppression for: "..f)
      else
        debug_info("Do ligature suppression for: "..f)
        local ligabreaks = build_liga_table(f:len(),throwliga)
        apply_ligatures(current_node,ligabreaks)
      end
      s = {}
      current_node = t
    end
  end
end -- end of function process_ligatures(nodes,tail)

function suppress_liga(s,t)
  noliga[s] = t
end

function always_keep_liga(s)
  keepliga[s] = true
end

function enableselnolig()
  luatexbase.add_to_callback( "ligaturing", 
    process_ligatures, "Suppress ligatures selectively", 1 )
end

function disableselnolig()
  luatexbase.remove_from_callback( "ligaturing", 
    "Suppress ligatures selectively" )
end
