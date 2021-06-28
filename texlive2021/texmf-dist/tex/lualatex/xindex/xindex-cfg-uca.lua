-----------------------------------------------------------------------
--         FILE:  xindex-cfg-uca.lua
--  DESCRIPTION:  configuration file for lua-uca
-- REQUIREMENTS:  
--       AUTHOR:  Herbert Voß
--      LICENSE:  LPPL1.3
-----------------------------------------------------------------------

if not modules then modules = { } end modules ['xindex-cfg-lua'] = {
      version = 0.28,
      comment = "configuration to xindex-cfg-uca.lua",
       author = "Herbert Voss",
    copyright = "Herbert Voss",
      license = "LPPL 1.3"
}

-- put any additional code for lua-uca here ---
languages.no = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:uppercase_first()
--  tailoring("&[before 1]b<á<<<Á")
--  tailoring("&[before 1]d<č<<<Č<ʒ<<<Ʒ<ǯ<<<Ǯ")
--  tailoring("&[before 1]e<đ<<<Đ<<ð<<<Ð")
--  tailoring("&[before 1]h<ǧ<<<Ǧ<ǥ<<<Ǥ")
--  tailoring("&[before 1]l<ǩ<<<Ǩ")
--  tailoring("&[before 1]o<ŋ<<<Ŋ<<ń<<<Ń<<ñ<<<Ñ")
--  tailoring("&[before 1]t<š<<<Š")
--  tailoring("&[before 1]u<ŧ<<<Ŧ<<þ<<<Þ")
--  tailoring("&y<<ü<<<Ü<<ű<<<Ű")
--  tailoring("&[before 1]ǀ<ž<<<Ž<ø<<<Ø<<œ<<<Œ<æ<<<Æ<å<<<Å<<ȧ<<<Ȧ<ä<<<Ä<<ã<<<Ã<ö<<<Ö<<ő<<<Ő<<õ<<<Õ<<ô<<<Ô<<ǫ<<<Ǫ")
--  tailoring("&D<<đ<<<Đ<<ð<<<Ð")
--  tailoring("&th<<<þ")
--  tailoring("&TH<<<Þ")
--  tailoring("&Y<<ü<<<Ü<<ű<<<Ű")
--  tailoring("&ǀ<æ<<<Æ<<ä<<<Ä<ø<<<Ø<<ö<<<Ö<<ő<<<Ő<å<<<Å<<<aa<<<Aa<<<AA")
--  tailoring("&oe<<œ<<<Œ")
  tailoring("&A<a<B<b<C<D<E<F<G<H<I<J<K<L<M<N<O<P<Q<R<S<T<U<V<W<X<Y<Z<Æ<Ø<Å")
  return collator_obj
end

--ABCDEFGHIJKLMNOPQRSTUVWXYZÆØÅ

--[[
Symbol 	Example 	Description
< 	a < b 	Identifies a primary (base letter) difference between "a" and "b"
<< 	a << ä 	Signifies a secondary (accent) difference between "a" and "ä"
<<< 	a<<<A 	Identifies a tertiary difference between "a" and "A"
<<<< 	か<<<<カ  	Identifies a quaternary difference between "か" and "カ". (New in ICU 53.) ICU permits up to three quaternary relations in a row (except for intervening "=" identity relations).
= 	x = y 	Signifies no difference between "x" and "y".
& 	&Z 	Instructs ICU to reset at this letter. These rules will be relative to this letter from here on, but will not affect the position of Z itself. 
]]