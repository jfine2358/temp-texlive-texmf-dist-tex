--
-- This is file `texnegar-char-table.lua',
-- generated with the docstrip utility.
--
-- The original source files were:
--
-- texnegar.dtx  (with options: `texnegar-char-table-lua')
--
-- Copyright (C) 2020-2021 Hossein Movahhedian
--
-- It may be distributed and/or modified under the LaTeX Project Public License,
-- version 1.3c or higher (your choice). The latest version of
-- this license is at: http://www.latex-project.org/lppl.txt
--
-- texnegar_char_table        = texnegar_char_table or {}
-- local texnegar_char_table  = texnegar_char_table
-- texnegar_char_table.module = {
--     name                   = "texnegar_char_table",
--     version                = "0.1e",
--     date                   = "2021-02-09",
--     description            = "Full implementation of kashida feature in XeLaTex and LuaLaTeX",
--     author                 = "Hossein Movahhedian",
--     copyright              = "Hossein Movahhedian",
--     license                = "LPPL v1.3c"
-- }
--
-- -- ^^A%%  texnegar-lua.dtx -- part of TEXNEGAR <bitbucket.org/dma8hm1334/texnegar>
-- local err, warn, info, log = luatexbase.provides_module(texnegar_char_table.module)
-- texnegar_char_table.log     = log  or (function (s) luatexbase.module_info("texnegar_char_table", s)    end)
-- texnegar_char_table.warning = warn or (function (s) luatexbase.module_warning("texnegar_char_table", s) end)
-- texnegar_char_table.error   = err  or (function (s) luatexbase.module_error("texnegar_char_table", s)   end)

local peCharTableDiacritic  = {
  [1611]  = utf8.char(1611),   -- "ً",  utf8.codepoint("ً") == 1611,   "\u{064B}", ARABIC-FATHATAN
  [1612]  = utf8.char(1612),   -- "ٌ",  utf8.codepoint("ٌ") == 1612,   "\u{064C}", ARABIC-DAMMATAN
  [1613]  = utf8.char(1613),   -- "ٍ",  utf8.codepoint("ٍ") == 1613,   "\u{064D}", ARABIC-KASRATAN
  [1614]  = utf8.char(1614),   -- "َ",  utf8.codepoint("َ") == 1614,   "\u{064E}", ARABIC-FATHA
  [1615]  = utf8.char(1615),   -- "ُ",  utf8.codepoint("ُ") == 1615,   "\u{064F}", ARABIC-DAMMA
  [1616]  = utf8.char(1616),   -- "ِ",  utf8.codepoint("ِ") == 1616,   "\u{0650}", ARABIC-KASRA
  [1617]  = utf8.char(1617),   -- "ّ",  utf8.codepoint("ّ") == 1617,   "\u{0651}", ARABIC-SHADDA
  [1618]  = utf8.char(1618),   -- "ْ",  utf8.codepoint("ْ") == 1618,   "\u{0652}", ARABIC-SUKUN
  [1619]  = utf8.char(1619),   -- "ٓ",  utf8.codepoint("ٓ") == 1619,   "\u{0653}", ARABIC-MADDA ABOVE
  [1620]  = utf8.char(1620),   -- "ٔ",  utf8.codepoint("ٔ") == 1620,   "\u{0654}", ARABIC-HAMZA ABOVE
  [1621]  = utf8.char(1621),   -- "ٕ",  utf8.codepoint("ٕ") == 1621,   "\u{0655}", ARABIC-HAMZA BELOW
  [1622]  = utf8.char(1622),   -- "ٖ",  utf8.codepoint("ٖ") == 1622,   "\u{0656}", ARABIC-SUBSCRIPT ALEF
  [1623]  = utf8.char(1623),   -- "ٗ",  utf8.codepoint("ٗ") == 1623,   "\u{0657}", ARABIC-INVERTED DAMMA
  [1624]  = utf8.char(1624),   -- "٘",  utf8.codepoint("٘") == 1624,   "\u{0658}", ARABIC-MARK NOON GHUNNA
  [1625]  = utf8.char(1625),   -- "ٙ",  utf8.codepoint("ٙ") == 1625,   "\u{0659}", ARABIC-ZWARAKAY
  [1648]  = utf8.char(1648),   -- "",  utf8.codepoint("") == 1648,   "\u{0670}", ARABIC-SUPERSCRIPT ALEF
  [64606] = utf8.char(64606),  -- "",  utf8.codepoint("") == 64606,  "\u{FC5E}", ARABIC-LIGATURE SHADDA WITH DAMMATAN ISOLATED FORM
  [64607] = utf8.char(64607),  -- "",  utf8.codepoint("") == 64607,  "\u{FC5F}", ARABIC-LIGATURE SHADDA WITH KASRATAN ISOLATED FORM
  [64608] = utf8.char(64608),  -- "",  utf8.codepoint("") == 64608,  "\u{FC60}", ARABIC-LIGATURE SHADDA WITH FATHA ISOLATED FORM
  [64609] = utf8.char(64609),  -- "",  utf8.codepoint("") == 64609,  "\u{FC61}", ARABIC-LIGATURE SHADDA WITH DAMMA ISOLATED FORM
  [64610] = utf8.char(64610),  -- "",  utf8.codepoint("") == 64610,  "\u{FC62}", ARABIC-LIGATURE SHADDA WITH KASRA ISOLATED FORM
  [64611] = utf8.char(64611),  -- "",  utf8.codepoint("") == 64611,  "\u{FC63}", ARABIC-LIGATURE SHADDA WITH SUPERSCRIPT ALEF ISOLATED FORM
}

local peCharTableDigit  = {
  [1632] = utf8.char(1632),  -- "٠",  utf8.codepoint("٠") == 1632,  "\u{0660}", ARABIC-INDIC DIGIT ZERO
  [1633] = utf8.char(1633),  -- "١",  utf8.codepoint("١") == 1633,  "\u{0661}", ARABIC-INDIC DIGIT ONE
  [1634] = utf8.char(1634),  -- "٢",  utf8.codepoint("٢") == 1634,  "\u{0662}", ARABIC-INDIC DIGIT TWO
  [1635] = utf8.char(1635),  -- "٣",  utf8.codepoint("٣") == 1635,  "\u{0663}", ARABIC-INDIC DIGIT THREE
  [1636] = utf8.char(1636),  -- "٤",  utf8.codepoint("٤") == 1636,  "\u{0664}", ARABIC-INDIC DIGIT FOUR
  [1637] = utf8.char(1637),  -- "٥",  utf8.codepoint("٥") == 1637,  "\u{0665}", ARABIC-INDIC DIGIT FIVE
  [1638] = utf8.char(1638),  -- "٦",  utf8.codepoint("٦") == 1638,  "\u{0666}", ARABIC-INDIC DIGIT SIX
  [1639] = utf8.char(1639),  -- "٧",  utf8.codepoint("٧") == 1639,  "\u{0667}", ARABIC-INDIC DIGIT SEVEN
  [1640] = utf8.char(1640),  -- "٨",  utf8.codepoint("٨") == 1640,  "\u{0668}", ARABIC-INDIC DIGIT EIGHT
  [1641] = utf8.char(1641),  -- "٩",  utf8.codepoint("٩") == 1641,  "\u{0669}", ARABIC-INDIC DIGIT NINE
  [1780] = utf8.char(1780),  -- "۴",  utf8.codepoint("۴") == 1780,  "\u{06F4}", EXTENDED ARABIC-INDIC DIGIT FOUR
  [1781] = utf8.char(1781),  -- "۵",  utf8.codepoint("۵") == 1781,  "\u{06F5}", EXTENDED ARABIC-INDIC DIGIT FIVE
  [1782] = utf8.char(1782),  -- "۶",  utf8.codepoint("۶") == 1782,  "\u{06F6}", EXTENDED ARABIC-INDIC DIGIT SIX
}

local peCharTablePunctuation  = {
  [1548] = utf8.char(1548),  -- "،",  utf8.codepoint("،") == 1548,  "\u{060C}", ARABIC COMMA
  [1549] = utf8.char(1549),  -- "؍",  utf8.codepoint("؍") == 1549,  "\u{060D}", ARABIC DATE SEPARATOR
  [1563] = utf8.char(1563),  -- "؛",  utf8.codepoint("؛") == 1563,  "\u{061B}", ARABIC SEMICOLON
  [1567] = utf8.char(1567),  -- "؟",  utf8.codepoint("؟") == 1567,  "\u{061F}", ARABIC QUESTION MARK
  [1642] = utf8.char(1642),  -- "٪",  utf8.codepoint("٪") == 1642,  "\u{066A}", ARABIC PERCENT SIGN
  [1643] = utf8.char(1643),  -- "٫",  utf8.codepoint("٫") == 1643,  "\u{066B}", ARABIC DECIMAL SEPARATOR
  [1644] = utf8.char(1644),  -- "٬",  utf8.codepoint("٬") == 1644,  "\u{066C}", ARABIC THOUSANDS SEPARATOR
  [1645] = utf8.char(1645),  -- "٭",  utf8.codepoint("٭") == 1645,  "\u{066D}", ARABIC FIVE POINTED STAR
}

local peCharTable  = {
  [1569] = utf8.char(1569),    -- "ء",  utf8.codepoint("ء") == 1569,  "\u{0621}", ARABIC LETTER ALEF HAMZA
  [1570] = utf8.char(1570),    -- "آ",  utf8.codepoint("آ") == 1570,  "\u{0622}", ARABIC LETTER ALEF WITH MADDA ABOVE
  [1571] = utf8.char(1571),    -- "أ",  utf8.codepoint("أ") == 1571,  "\u{0623}", ARABIC LETTER ALEF WITH HAMZA ABOVE
  [1572] = utf8.char(1572),    -- "ؤ",  utf8.codepoint("ؤ") == 1572,  "\u{0624}", ARABIC LETTER WAW WITH HAMZA ABOVE
  [1573] = utf8.char(1573),    -- "إ",  utf8.codepoint("إ") == 1573,  "\u{0625}", ARABIC LETTER ALEF WITH HAMZA BELOW
  [1574] = utf8.char(1574),    -- "ئ",  utf8.codepoint("ئ") == 1574,  "\u{0626}", ARABIC LETTER YEH WITH HAMZA ABOVE
  [1575] = utf8.char(1575),    -- "ا",  utf8.codepoint("ا") == 1575,  "\u{0627}", ARABIC LETTER ALEF
  [1576] = utf8.char(1576),    -- "ب",  utf8.codepoint("ب") == 1576,  "\u{0628}", ARABIC LETTER BEH
  [1577] = utf8.char(1577),    -- "ة",  utf8.codepoint("ة") == 1577,  "\u{0629}", ARABIC LETTER TEH MARBUTA
  [1578] = utf8.char(1578),    -- "ت",  utf8.codepoint("ت") == 1578,  "\u{062A}", ARABIC LETTER TEH
  [1579] = utf8.char(1579),    -- "ث",  utf8.codepoint("ث") == 1579,  "\u{062B}", ARABIC LETTER THEH
  [1580] = utf8.char(1580),    -- "ج",  utf8.codepoint("ج") == 1580,  "\u{062C}", ARABIC LETTER JEEM
  [1581] = utf8.char(1581),    -- "ح",  utf8.codepoint("ح") == 1581,  "\u{062D}", ARABIC LETTER HAH
  [1582] = utf8.char(1582),    -- "خ",  utf8.codepoint("خ") == 1582,  "\u{062E}", ARABIC LETTER KHAH
  [1583] = utf8.char(1583),    -- "د",  utf8.codepoint("د") == 1583,  "\u{062F}", ARABIC LETTER DAL
  [1584] = utf8.char(1584),    -- "ذ",  utf8.codepoint("ذ") == 1584,  "\u{0630}", ARABIC LETTER THAL
  [1585] = utf8.char(1585),    -- "ر",  utf8.codepoint("ر") == 1585,  "\u{0631}", ARABIC LETTER REH
  [1586] = utf8.char(1586),    -- "ز",  utf8.codepoint("ز") == 1586,  "\u{0632}", ARABIC LETTER ZAIN
  [1587] = utf8.char(1587),    -- "س",  utf8.codepoint("س") == 1587,  "\u{0633}", ARABIC LETTER SEEN
  [1588] = utf8.char(1588),    -- "ش",  utf8.codepoint("ش") == 1588,  "\u{0634}", ARABIC LETTER SHEEN
  [1589] = utf8.char(1589),    -- "ص",  utf8.codepoint("ص") == 1589,  "\u{0635}", ARABIC LETTER SAD
  [1590] = utf8.char(1590),    -- "ض",  utf8.codepoint("ض") == 1590,  "\u{0636}", ARABIC LETTER DAD
  [1591] = utf8.char(1591),    -- "ط",  utf8.codepoint("ط") == 1591,  "\u{0637}", ARABIC LETTER TAH
  [1592] = utf8.char(1592),    -- "ظ",  utf8.codepoint("ظ") == 1592,  "\u{0638}", ARABIC LETTER ZAH
  [1593] = utf8.char(1593),    -- "ع",  utf8.codepoint("ع") == 1593,  "\u{0639}", ARABIC LETTER AIN
  [1594] = utf8.char(1594),    -- "غ",  utf8.codepoint("غ") == 1594,  "\u{063A}", ARABIC LETTER GHAIN
  [1601] = utf8.char(1601),    -- "ف",  utf8.codepoint("ف") == 1601,  "\u{0641}", ARABIC LETTER FEH
  [1602] = utf8.char(1602),    -- "ق",  utf8.codepoint("ق") == 1602,  "\u{0642}", ARABIC LETTER QAF
  [1603] = utf8.char(1603),    -- "ك",  utf8.codepoint("ك") == 1603,  "\u{0643}", ARABIC LETTER KAF
  [1604] = utf8.char(1604),    -- "ل",  utf8.codepoint("ل") == 1604,  "\u{0644}", ARABIC LETTER LAM
  [1605] = utf8.char(1605),    -- "م",  utf8.codepoint("م") == 1605,  "\u{0645}", ARABIC LETTER MEEM
  [1606] = utf8.char(1606),    -- "ن",  utf8.codepoint("ن") == 1606,  "\u{0646}", ARABIC LETTER NOON
  [1607] = utf8.char(1607),    -- "ه",  utf8.codepoint("ه") == 1607,  "\u{0647}", ARABIC LETTER HEH
  [1608] = utf8.char(1608),    -- "و",  utf8.codepoint("و") == 1608,  "\u{0648}", ARABIC LETTER WAW
  [1609] = utf8.char(1609),    -- "ى",  utf8.codepoint("ى") == 1609,  "\u{0649}", ARABIC LETTER ALEF MAKSURA
  [1610] = utf8.char(1610),    -- "ي",  utf8.codepoint("ي") == 1610,  "\u{064A}", ARABIC LETTER YEH
  [1662] = utf8.char(1662),    -- "پ",  utf8.codepoint("پ") == 1662,  "\u{067E}", ARABIC LETTER PEH
  [1670] = utf8.char(1670),    -- "چ",  utf8.codepoint("چ") == 1670,  "\u{0686}", ARABIC LETTER TCHEH
  [1688] = utf8.char(1688),    -- "ژ",  utf8.codepoint("ژ") == 1688,  "\u{0698}", ARABIC LETTER JEH
  [1705] = utf8.char(1705),    -- "ک",  utf8.codepoint("ک") == 1705,  "\u{06A9}", ARABIC LETTER KEHEH
  [1706] = utf8.char(1706),    -- "ڪ",  utf8.codepoint("ڪ") == 1706,  "\u{06AA}", ARABIC LETTER SWASH KAF
  [1711] = utf8.char(1711),    -- "گ",  utf8.codepoint("گ") == 1711,  "\u{06AF}", ARABIC LETTER GAF
  [1726] = utf8.char(1726),    -- "ھ",  utf8.codepoint("ھ") == 1726,  "\u{06BE}", ARABIC LETTER HEH DOACHASHMEE
  [1728] = utf8.char(1728),    -- "ۀ",  utf8.codepoint("ۀ") == 1728,  "\u{06C0}", ARABIC LETTER HEH WITH YEH ABOVE
  [1740] = utf8.char(1740),    -- "ی",  utf8.codepoint("ی") == 1740,  "\u{06CC}", ARABIC LETTER FARSI YEH
  [1749] = utf8.char(1749),    -- "ە",  utf8.codepoint("ە") == 1740,  "\u{06D5}", ARABIC LETTER AE
  [65275] = utf8.char(65275),  -- "ﻻ",  utf8.codepoint("ﻻ") == 65275,  "\u{FEFB}", ARABIC LIGATURE LAM WITH ALEF ISOLATED FORM
  [65276] = utf8.char(65276),  -- "ﻼ",  utf8.codepoint("ﻼ") == 65276,  "\u{FEFC}", ARABIC LIGATURE LAM WITH ALEF FINAL FORM
}

local peCharTableInitial  = {
  [64344] = utf8.char(64344),  -- "ﭘ",  utf8.codepoint("ﭘ") == 64344,  "\u{FB58}", INITIAL FORM PEH
  [64380] = utf8.char(64380),  -- "ﭼ",  utf8.codepoint("ﭼ") == 64380,  "\u{FB7C}", INITIAL FORM TCHEH
  [64400] = utf8.char(64400),  -- "ﮐ",  utf8.codepoint("ﮐ") == 64400,  "\u{FB90}", INITIAL FORM KEHEH
  [64404] = utf8.char(64404),  -- "ﮔ",  utf8.codepoint("ﮔ") == 64404,  "\u{FB94}", INITIAL FORM GAF
  [64510] = utf8.char(64510),  -- "ﯾ",  utf8.codepoint("ﯾ") == 64510,  "\u{FBFE}", INITIAL FORM YEH
  [65169] = utf8.char(65169),  -- "ﺑ",  utf8.codepoint("ﺑ") == 65169,  "\u{FE91}", INITIAL FORM BEH
  [65175] = utf8.char(65175),  -- "ﺗ",  utf8.codepoint("ﺗ") == 65175,  "\u{FE97}", INITIAL FORM TEH
  [65179] = utf8.char(65179),  -- "ﺛ",  utf8.codepoint("ﺛ") == 65179,  "\u{FE9B}", INITIAL FORM THEH
  [65183] = utf8.char(65183),  -- "ﺟ",  utf8.codepoint("ﺟ") == 65183,  "\u{FE9F}", INITIAL FORM JEEM
  [65187] = utf8.char(65187),  -- "ﺣ",  utf8.codepoint("ﺣ") == 65187,  "\u{FEA3}", INITIAL FORM HAH
  [65191] = utf8.char(65191),  -- "ﺧ",  utf8.codepoint("ﺧ") == 65191,  "\u{FEA7}", INITIAL FORM KHAH
  [65203] = utf8.char(65203),  -- "ﺳ",  utf8.codepoint("ﺳ") == 65203,  "\u{FEB3}", INITIAL FORM SEEN
  [65207] = utf8.char(65207),  -- "ﺷ",  utf8.codepoint("ﺷ") == 65207,  "\u{FEB7}", INITIAL FORM SHEEN
  [65211] = utf8.char(65211),  -- "ﺻ",  utf8.codepoint("ﺻ") == 65211,  "\u{FEBB}", INITIAL FORM SAD
  [65215] = utf8.char(65215),  -- "ﺿ",  utf8.codepoint("ﺿ") == 65215,  "\u{FEBF}", INITIAL FORM DAD
  [65219] = utf8.char(65219),  -- "ﻃ",  utf8.codepoint("ﻃ") == 65219,  "\u{FEC3}", INITIAL FORM TAH
  [65223] = utf8.char(65223),  -- "ﻇ",  utf8.codepoint("ﻇ") == 65223,  "\u{FEC7}", INITIAL FORM ZAH
  [65227] = utf8.char(65227),  -- "ﻋ",  utf8.codepoint("ﻋ") == 65227,  "\u{FECB}", INITIAL FORM AIN
  [65231] = utf8.char(65231),  -- "ﻏ",  utf8.codepoint("ﻏ") == 65231,  "\u{FECF}", INITIAL FORM GHAIN
  [65235] = utf8.char(65235),  -- "ﻓ",  utf8.codepoint("ﻓ") == 65235,  "\u{FED3}", INITIAL FORM FEH
  [65239] = utf8.char(65239),  -- "ﻗ",  utf8.codepoint("ﻗ") == 65239,  "\u{FED7}", INITIAL FORM QAF
  [65243] = utf8.char(65243),  -- "ﻛ",  utf8.codepoint("ﻛ") == 65243,  "\u{FEDB}", INITIAL FORM KAF
  [65247] = utf8.char(65247),  -- "ﻟ",  utf8.codepoint("ﻟ") == 65247,  "\u{FEDF}", INITIAL FORM LAM
  [65251] = utf8.char(65251),  -- "ﻣ",  utf8.codepoint("ﻣ") == 65251,  "\u{FEE3}", INITIAL FORM MEEM
  [65255] = utf8.char(65255),  -- "ﻧ",  utf8.codepoint("ﻧ") == 65255,  "\u{FEE7}", INITIAL FORM NOON
  [65259] = utf8.char(65259),  -- "ﻫ",  utf8.codepoint("ﻫ") == 65259,  "\u{FEEB}", INITIAL FORM HEH
  [65267] = utf8.char(65267),  -- "ﻳ",  utf8.codepoint("ﻳ") == 65267,  "\u{FEF3}", INITIAL FORM YEH
}

local peCharTableMedial  = {
  [1600]  = utf8.char(1600),   -- "ـ",  utf8.codepoint("ـ") == 1600,   "\u{0640}", ARABIC TATWEEL
  [64345] = utf8.char(64345),  -- "ﭙ",  utf8.codepoint("ﭙ") == 64345,  "\u{FB59}", MEDIAL FORM PEH
  [64381] = utf8.char(64381),  -- "ﭽ",  utf8.codepoint("ﭽ") == 64381,  "\u{FB7D}", MEDIAL FORM TCHEH
  [64401] = utf8.char(64401),  -- "ﮑ",  utf8.codepoint("ﮑ") == 64401,  "\u{FB91}", MEDIAL FORM KEHEH
  [64405] = utf8.char(64405),  -- "ﮕ",  utf8.codepoint("ﮕ") == 64405,  "\u{FB95}", MEDIAL FORM GAF
  [64425] = utf8.char(64425),  -- "ﮩ",  utf8.codepoint("ﮩ") == 64425,  "\u{FBA9}", MEDIAL FORM HEH GOAL
  [64429] = utf8.char(64429),  -- "ﮭ",  utf8.codepoint("ﮭ") == 64429,  "\u{FBAD}", MEDIAL FORM HEH DOACHESMEE
  [64511] = utf8.char(64511),  -- "ﯿ",  utf8.codepoint("ﯿ") == 64511,  "\u{FBFF}", MEDIAL FORM YEH
  [65170] = utf8.char(65170),  -- "ﺒ",  utf8.codepoint("ﺒ") == 65170,  "\u{FE92}", MEDIAL FORM BEH
  [65176] = utf8.char(65176),  -- "ﺘ",  utf8.codepoint("ﺘ") == 65176,  "\u{FE98}", MEDIAL FORM TEH
  [65180] = utf8.char(65180),  -- "ﺜ",  utf8.codepoint("ﺜ") == 65180,  "\u{FE9C}", MEDIAL FORM THEH
  [65184] = utf8.char(65184),  -- "ﺠ",  utf8.codepoint("ﺠ") == 65184,  "\u{FEA0}", MEDIAL FORM JEEM
  [65188] = utf8.char(65188),  -- "ﺤ",  utf8.codepoint("ﺤ") == 65188,  "\u{FEA4}", MEDIAL FORM HAH
  [65192] = utf8.char(65192),  -- "ﺨ",  utf8.codepoint("ﺨ") == 65192,  "\u{FEA8}", MEDIAL FORM KHAH
  [65204] = utf8.char(65204),  -- "ﺴ",  utf8.codepoint("ﺴ") == 65204,  "\u{FEB4}", MEDIAL FORM SEEN
  [65208] = utf8.char(65208),  -- "ﺸ",  utf8.codepoint("ﺸ") == 65208,  "\u{FEB8}", MEDIAL FORM SHEEN
  [65212] = utf8.char(65212),  -- "ﺼ",  utf8.codepoint("ﺼ") == 65212,  "\u{FEBC}", MEDIAL FORM SAD
  [65216] = utf8.char(65216),  -- "ﻀ",  utf8.codepoint("ﻀ") == 65216,  "\u{FEC0}", MEDIAL FORM DAD
  [65220] = utf8.char(65220),  -- "ﻄ",  utf8.codepoint("ﻄ") == 65220,  "\u{FEC4}", MEDIAL FORM TAH
  [65224] = utf8.char(65224),  -- "ﻈ",  utf8.codepoint("ﻈ") == 65224,  "\u{FEC8}", MEDIAL FORM ZAH
  [65228] = utf8.char(65228),  -- "ﻌ",  utf8.codepoint("ﻌ") == 65228,  "\u{FECC}", MEDIAL FORM AIN
  [65232] = utf8.char(65232),  -- "ﻐ",  utf8.codepoint("ﻐ") == 65232,  "\u{FED0}", MEDIAL FORM GHAIN
  [65236] = utf8.char(65236),  -- "ﻔ",  utf8.codepoint("ﻔ") == 65236,  "\u{FED4}", MEDIAL FORM FEH
  [65240] = utf8.char(65240),  -- "ﻘ",  utf8.codepoint("ﻘ") == 65240,  "\u{FED8}", MEDIAL FORM QAF
  [65244] = utf8.char(65244),  -- "ﻜ",  utf8.codepoint("ﻜ") == 65244,  "\u{FEDC}", MEDIAL FORM KAF
  [65248] = utf8.char(65248),  -- "ﻠ",  utf8.codepoint("ﻠ") == 65248,  "\u{FEE0}", MEDIAL FORM LAM
  [65252] = utf8.char(65252),  -- "ﻤ",  utf8.codepoint("ﻤ") == 65252,  "\u{FEE4}", MEDIAL FORM MEEM
  [65256] = utf8.char(65256),  -- "ﻨ",  utf8.codepoint("ﻨ") == 65256,  "\u{FEE8}", MEDIAL FORM NOON
  [65260] = utf8.char(65260),  -- "ﻬ",  utf8.codepoint("ﻬ") == 65260,  "\u{FEEC}", MEDIAL FORM HEH
  [65268] = utf8.char(65268),  -- "ﻴ",  utf8.codepoint("ﻴ") == 65268,  "\u{FEF4}", MEDIAL FORM YEH
}

local peCharTableFinal  = {
  [64343] = utf8.char(64343),  -- "ﭗ",  utf8.codepoint("ﭗ") == 64343,  "\u{FB57}", FINAL FORM PEH
  [64379] = utf8.char(64379),  -- "ﭻ",  utf8.codepoint("ﭻ") == 64379,  "\u{FB7B}", FINAL FORM TCHEH
  [64395] = utf8.char(64395),  -- "ﮋ",  utf8.codepoint("ﮋ") == 64395,  "\u{FB8B}", FINAL FORM JEH
  [64399] = utf8.char(64399),  -- "ﮏ",  utf8.codepoint("ﮏ") == 64399,  "\u{FB8F}", FINAL FORM KEHEH
  [64403] = utf8.char(64403),  -- "ﮓ",  utf8.codepoint("ﮓ") == 64403,  "\u{FB93}", FINAL FORM GAF
  [64421] = utf8.char(64421),  -- "ﮥ",  utf8.codepoint("ﮥ") == 64421,  "\u{FBA5}", FINAL FORM HEH WITH YEH ABOVE
  [64509] = utf8.char(64509),  -- "ﯽ",  utf8.codepoint("ﯽ") == 64509,  "\u{FBFD}", FINAL FORM YEH
  [65166] = utf8.char(65166),  -- "ﺎ",  utf8.codepoint("ﺎ") == 65166,  "\u{FE8E}", FINAL FORM ALEF
  [65168] = utf8.char(65168),  -- "ﺐ",  utf8.codepoint("ﺐ") == 65168,  "\u{FE90}", FINAL FORM BEH
  [65172] = utf8.char(65172),  -- "ﺔ",  utf8.codepoint("ﺔ") == 65172,  "\u{FE94}", FINAL FORM TEH MARBUTAH
  [65174] = utf8.char(65174),  -- "ﺖ",  utf8.codepoint("ﺖ") == 65174,  "\u{FE96}", FINAL FORM TEH
  [65178] = utf8.char(65178),  -- "ﺚ",  utf8.codepoint("ﺚ") == 65178,  "\u{FE9A}", FINAL FORM THEH
  [65182] = utf8.char(65182),  -- "ﺞ",  utf8.codepoint("ﺞ") == 65182,  "\u{FE9E}", FINAL FORM JEEM
  [65186] = utf8.char(65186),  -- "ﺢ",  utf8.codepoint("ﺢ") == 65186,  "\u{FEA2}", FINAL FORM HAH
  [65190] = utf8.char(65190),  -- "ﺦ",  utf8.codepoint("ﺦ") == 65190,  "\u{FEA6}", FINAL FORM KHAH
  [65194] = utf8.char(65194),  -- "ﺪ",  utf8.codepoint("ﺪ") == 65194,  "\u{FEAA}", FINAL FORM DAL
  [65196] = utf8.char(65196),  -- "ﺬ",  utf8.codepoint("ﺬ") == 65196,  "\u{FEAC}", FINAL FORM THAL
  [65198] = utf8.char(65198),  -- "ﺮ",  utf8.codepoint("ﺮ") == 65198,  "\u{FEAE}", FINAL FORM REH
  [65200] = utf8.char(65200),  -- "ﺰ",  utf8.codepoint("ﺰ") == 65200,  "\u{FEB0}", FINAL FORM ZAIN
  [65202] = utf8.char(65202),  -- "ﺲ",  utf8.codepoint("ﺲ") == 65202,  "\u{FEB2}", FINAL FORM SEEN
  [65206] = utf8.char(65206),  -- "ﺶ",  utf8.codepoint("ﺶ") == 65206,  "\u{FEB6}", FINAL FORM SHEEN
  [65210] = utf8.char(65210),  -- "ﺺ",  utf8.codepoint("ﺺ") == 65210,  "\u{FEBA}", FINAL FORM SAD
  [65214] = utf8.char(65214),  -- "ﺾ",  utf8.codepoint("ﺾ") == 65214,  "\u{FEBE}", FINAL FORM DAD
  [65218] = utf8.char(65218),  -- "ﻂ",  utf8.codepoint("ﻂ") == 65218,  "\u{FEC2}", FINAL FORM TAH
  [65222] = utf8.char(65222),  -- "ﻆ",  utf8.codepoint("ﻆ") == 65222,  "\u{FEC6}", FINAL FORM ZAH
  [65226] = utf8.char(65226),  -- "ﻊ",  utf8.codepoint("ﻊ") == 65226,  "\u{FECA}", FINAL FORM AIN
  [65230] = utf8.char(65230),  -- "ﻎ",  utf8.codepoint("ﻎ") == 65230,  "\u{FECE}", FINAL FORM GHAIN
  [65234] = utf8.char(65234),  -- "ﻒ",  utf8.codepoint("ﻒ") == 65234,  "\u{FED2}", FINAL FORM FEH
  [65238] = utf8.char(65238),  -- "ﻖ",  utf8.codepoint("ﻖ") == 65238,  "\u{FED6}", FINAL FORM QAF
  [65242] = utf8.char(65242),  -- "ﻚ",  utf8.codepoint("ﻚ") == 65242,  "\u{FEDA}", FINAL FORM KAF
  [65246] = utf8.char(65246),  -- "ﻞ",  utf8.codepoint("ﻞ") == 65246,  "\u{FEDE}", FINAL FORM LAM
  [65250] = utf8.char(65250),  -- "ﻢ",  utf8.codepoint("ﻢ") == 65250,  "\u{FEE2}", FINAL FORM MEEM
  [65254] = utf8.char(65254),  -- "ﻦ",  utf8.codepoint("ﻦ") == 65254,  "\u{FEE6}", FINAL FORM NOON
  [65258] = utf8.char(65258),  -- "ﻪ",  utf8.codepoint("ﻪ") == 65258,  "\u{FEEA}", FINAL FORM HEH
  [65262] = utf8.char(65262),  -- "ﻮ",  utf8.codepoint("ﻮ") == 65262,  "\u{FEEE}", FINAL FORM WAW
  [65264] = utf8.char(65264),  -- "ﻰ",  utf8.codepoint("ﻰ") == 65264,  "\u{FEF0}", FINAL FORM ALEF MAKSURAH
  [65266] = utf8.char(65266),  -- "ﻲ",  utf8.codepoint("ﻲ") == 65266,  "\u{FEF2}", FINAL FORM YEH
  [65276] = utf8.char(65276),  -- "ﻼ",  utf8.codepoint("ﻼ") == 65276,  "\u{FEFC}", FINAL FORM LIGATURE LAM WITH ALEF
}

return peCharTableInitial, peCharTableMedial, peCharTableFinal, peCharTableDiacritic
--
--
-- End of file `texnegar-char-table.lua'.
