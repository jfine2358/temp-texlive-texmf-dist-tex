%%
%% This is file `easybook.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% easybook.dtx  (with options: `class')
%% Copyright (C) 2021 by Qu Yi <quee123@foxmail.com>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the CC-BY 4.0 License.
%% The latest version of this license is in
%%   https://creativecommons.org/licenses/by/4.0/legalcode
\NeedsTeXFormat{LaTeX2e}[2020/10/01]
\RequirePackage{l3keys2e}
\ProvidesExplClass{easybook}{2021/03/23}{1.23z}{beta}

\cs_generate_variant:Nn \keys_define:nn {nx}
\cs_generate_variant:Nn \int_to_arabic:n {v}
\cs_generate_variant:Nn \dim_add:Nn {NV}
\cs_new_protected:Npn \__ctex_define:nn #1
  {\keys_define:nn {ctex/#1}}
\cs_new_protected:Npn \__put_ctexbook:n #1
  {\PassOptionsToClass{#1}{ctexbook}}
\cs_new_protected:Npn \__patch_cmd:Nnn #1#2#3
  {\ctex_patch_cmd_once:NnnnTF #1{}{#2}{#3}{}{\ctex_patch_failure:N #1}}
\cs_new_protected:Npn \__appto_cmd:Nn #1#2
  {\ctex_appto_cmd:NnnTF #1{}{#2}{}{\ctex_patch_failure:N #1}}

\bool_set_false:N \l__draft_bool
\bool_set_false:N \l__newline_bool
\bool_set_false:N \l__font_noto_bool
\bool_set_true:N  \l__zhtitle_bool
\bool_set_true:N  \l__lang_chinese_bool
\bool_set_true:N  \l__page_twoside_bool
\bool_set_true:N  \l__class_book_bool
\clist_new:N      \g__options_clist

\keys_define:nn {easybook}
  {
    draft         .code:n = {\bool_set_true:N  \l__draft_bool},
    newline       .code:n = {\bool_set_true:N  \l__newline_bool},
    entitle       .code:n = {\bool_set_false:N \l__zhtitle_bool},
    english       .code:n = {\bool_set_false:N \l__lang_chinese_bool},
    enstyle       .meta:n = {newline,entitle,english},

    font          .choice:,
    font          .value_required:n = true,
    font/overleaf .code:n = {},
    font/adobe    .code:n = {\__put_ctexbook:n {fontset = #1}},
    font/founder  .code:n = {\__put_ctexbook:n {fontset = #1}},
    font/mac      .code:n = {\__put_ctexbook:n {fontset = #1}},
    font/windows  .code:n = {\__put_ctexbook:n {fontset = #1}},
    font/linux    .code:n = {\__put_ctexbook:n {fontset = ubuntu}},
    font/none     .code:n = {\__put_ctexbook:n {fontset = #1}},
    font/noto     .code:n =
      {
        \bool_set_true:N \l__font_noto_bool
        \__put_ctexbook:n {fontset = none}
      },
    font          .initial:n = overleaf,

    paper         .choice:,
    paper         .value_required:n = true,
    paper/unknown .code:n = {\PassOptionsToPackage{#1}{geometry}},
    paper         .initial:n = a4paper,

    oneside       .value_forbidden:n = true,
    twoside       .value_forbidden:n = true,
    oneside       .code:n =
      {
        \bool_set_false:N \l__page_twoside_bool
        \__put_ctexbook:n {oneside}
      },

    class         .choice:,
    class         .value_required:n = true,
    class/book    .code:n = {},
    class/article .code:n = {\bool_set_false:N \l__class_book_bool},
    class         .initial:n = book,

    unknown       .code:n =
      {\clist_gput_right:No \g__options_clist{\CurrentOption}}
  }

\ProcessKeysOptions{easybook}

\bool_if:NTF \l__lang_chinese_bool
  {\__put_ctexbook:n {scheme = chinese}}
  {\__put_ctexbook:n {scheme = plain}}

\clist_map_inline:nn
  {
    {svgnames}{xcolor},
    {hang,stable}{footmisc},
    {normalem}{ulem},
    {protrusion = false}{microtype},
    {shortlabels,inline}{enumitem},
    {many}{tcolorbox},
    {xindy}{imakeidx},
    {CJKmath = true}{xeCJK},
    {no-math}{fontspec},
    {noto,upint}{newtxmath}
  }{\PassOptionsToPackage#1}
\__put_ctexbook:n {\g__options_clist}
\LoadClass[UTF8]{ctexbook}

\bool_new:N \l__multoc_bool
\bool_new:N \l__notomath_bool
\bool_new:N \l__uppercase_bool
\bool_new:N \l__chap_withpart_bool
\tl_new:N   \l__foot_numberwith_tl
\tl_new:N   \g__config_tl

\seq_const_from_clist:Nn \c__options_path_seq
  {
    style,link,elsefont,
    spread,bibset,thmset,
    geoset,hdrset,tocset
  }
\seq_map_inline:Nn \c__options_path_seq
  {\ctex_define:n {#1 .meta:nn = {ctex/#1}{##1}}}
\ctex_define:n
  {
    config              .tl_set:N = \g__config_tl,
    lstlistlistingname  .tl_set:N = \lstlistlistingname,
    lstlistingname      .tl_set:N = \lstlistingname
  }
\__ctex_define:nn {style}
  {
    multoc            .bool_set:N = \l__multoc_bool,
    multoc            .default:n = true,
    withpart          .bool_set:N = \l__chap_withpart_bool,
    withpart          .default:n = true,
    withpart          .initial:n = false,
    notomath          .bool_set:N = \l__notomath_bool,
    notomath          .default:n = true,
    notomath          .initial:n = true,
    rulewidth         .dim_set:N = \l__rule_width_dim,
    rulewidth         .initial:n = 0.75pt,
    uppercase         .bool_set:N = \l__uppercase_bool,
    uppercase         .default:n = true,
    uppercase         .initial:n = true,

    footwith          .choice:,
    footwith          .value_required:n = true,
    footwith/part     .code:n =
      {\tl_set:Nn \l__foot_numberwith_tl{#1}},
    footwith/page     .code:n =
      {\tl_set:Nn \l__foot_numberwith_tl{#1}},
    footwith/chapter  .code:n = {},
    footwith          .initial:n = chapter,

    figure-sep        .tl_set:N = \l__figure_separator_tl,
    table-sep         .tl_set:N = \l__table_separator_tl,
    listing-sep       .tl_set:N = \l__lstlisting_separator_tl,
    equation-sep      .tl_set:N = \l__equation_separator_tl,
    number-sep        .meta:n =
      {
        figure-sep = {#1},table-sep = {#1},
        listing-sep = {#1},equation-sep = {#1}
      },
    number-sep        .initial:n = {.}
  }

\RequirePackage
  {
    xcolor,
    footmisc,setspace,
    amsmath,amsthm,thmtools,cases,
    chemformula,siunitx,ulem,pifont,
    geometry,marginnote,nccfoots,
    pdfpages,graphicx,
    fancyhdr,titletoc,
    caption-light,subcaption,
    tabularx,multirow,makecell,booktabs,
    tasks,enumitem,
    listings,
    imakeidx
  }
\ctex_at_end_preamble:n
  {
    \bool_if:NT \l__notomath_bool{\RequirePackage{newtxmath,bm}}
    \tl_if_empty:NF \g__config_tl{\file_input:n {\g__config_tl}}
  }

\cs_new_protected:Npn \__ifpackage_later:nn #1#2
  {
    \@ifpackagelater{#1}{#2}
      {}{\msg_warning:nnn {easybook}{package-old}{#1}}
  }
\msg_new:nnn {easybook}{package-old}
  {
    Package~#1~has~been~out~of~date. \\
    Some~problems~or~errors~may~occur \\
    if~you~continue~compiling. \\\\
    Please~update~your~macro~package~from~CTAN.
  }
\clist_map_inline:nn
  {
    {expl3}{2020/10/27},
    {xparse}{2020/10/27},
    {l3keys2e}{2020/10/27},
    {ctex}{2020/10/19},
    {thmtools}{2020/08/01},
    {caption-light}{2020/08/24}
  }{\__ifpackage_later:nn #1}

\sys_if_engine_xetex:TF
  {
    \cs_new_eq:NN \__set_family:nnn  \xeCJK_set_family:nnn
    \cs_new_eq:NN \__switch_family:n \xeCJK_switch_family:n
  }{
    \cs_new_eq:NN \__set_family:nnn  \ctex_ltj_set_family:nnn
    \cs_new_eq:NN \__switch_family:n \ctex_ltj_switch_family:n
  }

\cs_new_protected:Npn \__setmainfont:nn #1#2
  {\__fontspec_main_setmainfont:nn {#2}{#1}}
\cs_new_protected:Npn \__setsansfont:nn #1#2
  {\__fontspec_main_setsansfont:nn {#2}{#1}}
\cs_new_protected:Npn \__setmonofont:nn #1#2
  {\__fontspec_main_setmonofont:nn {#2}{#1}}
\cs_new_protected:Npn \__setCJKmainfont:nn #1#2
  {\__set_family:nnn {\CJKrmdefault}{#2}{#1}}
\cs_new_protected:Npn \__setCJKsansfont:nn #1#2
  {\__set_family:nnn {\CJKsfdefault}{#2}{#1}}
\cs_new_protected:Npn \__setCJKmonofont:nn #1#2
  {\__set_family:nnn {\CJKttdefault}{#2}{#1}}
\cs_new_protected:Npn \__set_zhfont_songti:nn #1#2
  {\__set_family:nnn {songti}{#2}{#1}}
\cs_new_protected:Npn \__set_zhfont_heiti:nn #1#2
  {\__set_family:nnn {heiti}{#2}{#1}}
\cs_new_protected:Npn \__set_zhfont_kaishu:nn #1#2
  {\__set_family:nnn {kaishu}{#2}{#1}}
\cs_new_protected:Npn \__set_zhfont_fangsong:nn #1#2
  {\__set_family:nnn {fangsong}{#2}{#1}}

\tl_const:Nn \__option_zhfont_tl
  {UprightFont = *,AutoFakeBold = 1.5,ItalicFont = *}
\cs_new_protected:Npx \__setCJKmainfont:n #1
  {\__setCJKmainfont:nn {#1}{\__option_zhfont_tl}}
\cs_new_protected:Npx \__setCJKsansfont:n #1
  {\__setCJKsansfont:nn {#1}{\__option_zhfont_tl}}
\cs_new_protected:Npx \__setCJKmonofont:n #1
  {\__setCJKmonofont:nn {#1}{\__option_zhfont_tl}}
\cs_new_protected:Npx \__set_zhfont_songti:n #1
  {\__set_zhfont_songti:nn {#1}{\__option_zhfont_tl}}
\cs_new_protected:Npx \__set_zhfont_heiti:n #1
  {\__set_zhfont_heiti:nn {#1}{\__option_zhfont_tl}}
\cs_new_protected:Npx \__set_zhfont_kaishu:n #1
  {\__set_zhfont_kaishu:nn {#1}{\__option_zhfont_tl}}
\cs_new_protected:Npx \__set_zhfont_fangsong:n #1
  {\__set_zhfont_fangsong:nn {#1}{\__option_zhfont_tl}}

\bool_if:NT \l__font_noto_bool
  {
    \__setmainfont:nn {NotoSerif}
      {
        Extension = .ttf,
        UprightFont = *-Regular,
        BoldFont = *-Bold,
        ItalicFont = *-Italic
      }
    \__setsansfont:nn {NotoSans}
      {
        Extension = .ttf,
        UprightFont = *-Regular,
        BoldFont = *-Bold,
        ItalicFont = *-Italic
      }
    \__setmonofont:nn {NotoSansMono}
      {
        Extension = .ttf,
        UprightFont = *-Regular,
        BoldFont = *-Bold
      }
    \__setCJKmainfont:nn {FZShuSong-Z01S}
      {
        UprightFont = *,
        BoldFont = FZHei-B01S,
        ItalicFont = FZKai-Z03S
      }
    \__setCJKsansfont:n {FZHei-B01S}
    \__setCJKmonofont:n {FZFangSong-Z02S}
    \__set_zhfont_songti:n {FZShuSong-Z01S}
    \__set_zhfont_heiti:n {FZHei-B01S}
    \__set_zhfont_kaishu:n {FZKai-Z03S}
    \__set_zhfont_fangsong:n {FZFangSong-Z02S}
    \cs_new_protected:Npn \songti{\__switch_family:n {songti}}
    \cs_new_protected:Npn \heiti{\__switch_family:n {heiti}}
    \cs_new_protected:Npn \kaishu{\__switch_family:n {kaishu}}
    \cs_new_protected:Npn \fangsong{\__switch_family:n {fangsong}}
  }
\cs_if_exist:NF \kaishu{\cs_gset_eq:NN \kaishu\normalfont}

\includepdfset{fitpaper = true}
\geometry
  {
    vmargin = 2.54cm,
    hmargin = 3.17cm,
    columnsep = 2\ccwd,
    headheight = 2.04cm,
    headsep = 0.5cm,
    footskip = 0.79cm,
    footnotesep = 0.5cm,
    marginparsep = 8pt,
    marginparwidth = 2.54cm
  }
\clist_new:N \g__geometry_clist
\__ctex_define:nn {geoset}
  {
    footnotemargin  .dim_set:N = \footnotemargin,
    footnotemargin  .initial:n = 0.5\ccwd,
    footparskip     .tl_set:N = \hangfootparskip,
    footparskip     .initial:n = 0ex,
    footparindent   .tl_set:N = \hangfootparindent,
    footparindent   .initial:n = 2\ccwd,
    list-labelsep   .dim_set:N = \list@labelsep,
    list-labelsep   .initial:n = \ccwd,
    unknown         .code:n =
      {
        \clist_gput_right:Nx \g__geometry_clist
          {
            \l_keys_key_str
            \tl_if_empty:NF \l_keys_value_tl{ = {#1}}
          }
      }
  }

\cs_gset:Npn \cleardoublepage
  {
    \clearpage
    \bool_if:NT \l__page_twoside_bool
      {
        \int_if_odd:nF \c@page
          {\hbox:n {}\thispagestyle{empty}\clearpage}
      }
  }
\RenewDocumentCommand{\frontmatter}{sO{Roman}}
  {
    \IfBooleanTF{#1}{\clearpage}{\cleardoublepage}
    \@mainmatterfalse
    \pagenumbering{#2}
  }
\RenewDocumentCommand{\mainmatter}{s}
  {
    \IfBooleanTF{#1}{\clearpage}{\cleardoublepage}
    \@mainmattertrue
    \pagenumbering{arabic}
  }
\cs_gset_eq:NN \easyhead\fancyhead
\cs_gset_eq:NN \easyfoot\fancyfoot
\__ctex_define:nn {hdrset}
  {
    head-foot     .tl_set:N = \l__fancyhf_content_tl,
    head-foot     .initial:n =
      {
        \easyhead[EC]{\color{ctex@frame}\kaishu\leftmark}
        \easyhead[OC]{\color{ctex@frame}\kaishu\rightmark}
        \easyhead[EL,OR]{\color{ctex@frame}\thepage}
      },
    chap-mark     .tl_set:N = \l__fancyhf_chap_mark_tl,
    chap-mark     .initial:n =
      {
        \int_compare:nT {\c@secnumdepth > -1}
          {
            \if@mainmatter
              \ifodd\CTEX@chapter@numbering
                \CTEXthechapter\hspace{\ccwd}
              \fi
            \fi
          }
      },
    sec-mark      .tl_set:N = \l__fancyhf_sec_mark_tl,
    sec-mark      .initial:n =
      {
        \int_compare:nT {\c@secnumdepth > 0}
          {
            \ifodd\CTEX@section@numbering
              \CTEXthesection\hspace{0.5\ccwd}
            \fi
          }
      },
    headrule      .tl_gset:N = \headrule,
    headrule      .initial:n =
      {
        \group_begin:
        \color{ctex@frame}\vspace*{1.5pt}
        \hrule width \textwidth height \l__rule_width_dim
        \group_end:
      },
    footrule      .tl_gset:N = \footrule,
    footrule      .initial:n = {},
    footnoterule  .tl_gset:N = \footnoterule,
    footnoterule  .initial:n =
      {
        \group_begin:
        \color{ctex@frame}
        \hrule width 0.35\columnwidth height \l__rule_width_dim
        \vspace*{2.6pt}
        \group_end:
      }
  }
\ctex_at_end_preamble:n
  {
    \exp_args:NV \geometry\g__geometry_clist
    \pagestyle{fancy}
    \fancyhf{}
    \bool_if:NTF \l__page_twoside_bool
      {
        \cs_gset:Npn \chaptermark#1
          {
            \markboth
              {
                \bool_if:NTF \l__uppercase_bool
                  {\text_uppercase:n {\l__fancyhf_chap_mark_tl#1}}
                  {\text_titlecase_first:n {\l__fancyhf_chap_mark_tl#1}}
              }{
                \bool_if:NTF \l__uppercase_bool
                  {\text_uppercase:n {\l__fancyhf_chap_mark_tl#1}}
                  {\text_titlecase_first:n {\l__fancyhf_chap_mark_tl#1}}
              }
          }
        \l__fancyhf_content_tl
        \cs_gset_eq:NN \ps@plain\ps@empty
      }{
        \cs_gset:Npn \chaptermark#1
          {
            \markboth
              {
                \bool_if:NTF \l__uppercase_bool
                  {\text_uppercase:n {\l__fancyhf_chap_mark_tl#1}}
                  {\text_titlecase_first:n {\l__fancyhf_chap_mark_tl#1}}
              }{}
          }
        \l__fancyhf_content_tl
        \cs_gset_eq:NN \ps@plain\ps@empty
      }
    \cs_gset:Npn \sectionmark#1
      {
        \markright
          {
            \bool_if:NTF \l__uppercase_bool
              {\text_uppercase:n {\l__fancyhf_sec_mark_tl#1}}
              {\text_titlecase_first:n {\l__fancyhf_sec_mark_tl#1}}
          }
      }
    \bool_if:NT \l__draft_bool
      {
        \bool_if:NTF \l__page_twoside_bool
          {\easyfoot[C]{\color{gray!60}\sffamily\today}}
          {\easyhead[L]{\color{gray!60}\sffamily\today}}
        \geometry{showframe}
      }
  }

\seq_const_from_clist:Nn \c__toc_headings_level_seq
  {part,chapter,section,subsection,lists}
\seq_map_inline:Nn \c__toc_headings_level_seq
  {
    \ctex_define:n {tocset/#1 .meta:nn = {ctex/tocset/#1}{##1}}
    \__ctex_define:nn {tocset}
      {
        #1/format .tl_set:c = l__toc_#1_format_tl,
        #1/indent .tl_set:c = l__toc_#1_indent_tl,
        #1/rule   .tl_set:c = l__toc_#1_rule_tl
      }
  }
\__ctex_define:nn {tocset}
  {
    lists/lolskip     .skip_set:N = \l__toc_lolskip_skip,
    lists/lolskip     .initial:n = 0.8pc,
    lists/belowoffset .dim_set:N = \l__toc_listsoffset_dim,
    lists/belowoffset .initial:n = 0pc,
    belowoffset       .dim_set:N = \l__toc_offset_dim,
    belowoffset       .initial:n = -1pc
  }
\ctex_set:nn {tocset}
  {
    part/format = \addvspace{1pc}\sffamily\large,
    part/indent = 0\ccwd,
    part/rule = \tocrule{}[\bfseries],

    chapter/format = \addvspace{1pc}\sffamily\large,
    chapter/indent = 0\ccwd,
    chapter/rule = \tocrule{$\cdot$}[\bfseries],

    section/format = \addvspace{0.35pc},
    section/indent = 1.5\ccwd,
    section/rule = \tocrule{$\cdot$},

    subsection/format = \addvspace{0.35pc},
    subsection/indent = 3.8\ccwd,
    subsection/rule = \tocrule{$\cdot$},

    lists/format = \addvspace{0.2pc},
    lists/indent = 0\ccwd,
    lists/rule = \tocrule{$\cdot$}
  }

\NewDocumentCommand{\tocrule}{O{0.7pc}D(){1.2}mO{}}
  {
    \normalsize\normalfont
    \titlerule*[#1]{\scalebox{#2}{#3}}#4\contentspage
  }
\cs_new_protected:Npn \__titlecontents_set:nn #1#2
  {
    \titlecontents{#1}
      [\use:c {l__toc_#2_indent_tl}]
      {\use:c {l__toc_#2_format_tl}}{}{}
      {\use:c {l__toc_#2_rule_tl}}
  }
\contentsuse{lstlisting}{lol}
\clist_map_inline:nn
  {
    {part}{part},
    {chapter}{chapter},
    {section}{section},
    {subsection}{subsection},
    {figure}{lists},
    {table}{lists},
    {lstlisting}{lists}
  }{\__titlecontents_set:nn #1}
\ctex_patch_cmd:Nnn \caption@@@addcontentsline
  {\addcontentsline{#1}{#2}{\protect\numberline{#3}{#4}}}
  {\addcontentsline{#1}{#2}{#3\hspace{\list@labelsep}#4}}
\ctex_patch_cmd:Nnn \lst@MakeCaption
  {
    \addcontentsline{lol}{lstlisting}
      {\protect\numberline{\thelstlisting}\lst@@caption}
  }{
    \addcontentsline{lol}{lstlisting}
      {\thelstlisting\hspace{\list@labelsep}\lst@@caption}
  }
\__appto_cmd:Nn \@chapter
  {
    \skip_if_eq:nnF {\l__toc_lolskip_skip}{\c_zero_skip}
      {
        \addtocontents{lol}
          {\protect\addvspace{\skip_use:N \l__toc_lolskip_skip}}
      }
    \bool_if:NF \l__class_book_bool
      {\msg_error:nn {easybook}{no-chapter}}
  }
\__appto_cmd:Nn \@schapter
  {
    \bool_if:NF \l__class_book_bool
      {\msg_error:nn {easybook}{no-chapter}}
  }
\msg_new:nnn {easybook}{no-chapter}
  {
    Your~document~class~is~in~article~mode. \\
    The~\string\chapter\space~command~will~not~be~used.
  }

\cs_new_protected:Npn \__markboth:n #1
  {
    \bool_if:NTF \l__page_twoside_bool
      {
        \markboth
          {
            \bool_if:NTF \l__uppercase_bool
              {\text_uppercase:n {#1}}
              {\text_titlecase_first:n {#1}}
          }{
            \bool_if:NTF \l__uppercase_bool
              {\text_uppercase:n {#1}}
              {\text_titlecase_first:n {#1}}
          }
      }{
        \markboth
          {
            \bool_if:NTF \l__uppercase_bool
              {\text_uppercase:n {#1}}
              {\text_titlecase_first:n {#1}}
          }{}
      }
  }

\tl_set:Nn \l__toc_type_tl{book}
\keys_define:nn {listoc}
  {
    article .code:n = \tl_set:Nn \l__toc_type_tl{article},
    book    .code:n = {},
    multoc  .bool_set:N = \l__multoc_bool,
    multoc  .default:n = true,
    multoc  .initial:n = false
  }

\cs_new_protected:Npn \__title_mark_intoc:n #1
  {
    \tl_if_eq:NnTF \l__toc_type_tl{book}
      {
        \chapter*{\phantomsection#1}
        \CTEX@addtocline{chapter}{#1}
      }{
        \section*{\phantomsection#1}
        \CTEX@addtocline{section}{#1}
      }
    \__markboth:n {#1}
  }
\cs_new_protected:Npn \__title_mark:n #1
  {
    \tl_if_eq:NnTF \l__toc_type_tl{book}
      {\chapter*{\phantomsection#1}}
      {\section*{\phantomsection#1}}
    \__markboth:n {#1}
  }
\cs_new_protected:Npn \__ifmultoc_pre_set:
  {
    \bool_if:NTF \l__class_book_bool
      {
        \if@twocolumn
          \@restonecoltrue
          \bool_if:NTF \l__multoc_bool{\twocolumn}{\onecolumn}
        \else
          \@restonecolfalse
          \bool_if:NT \l__multoc_bool{\twocolumn}
        \fi
      }{\tl_set:Nn \l__toc_type_tl{article}}
  }
\cs_new_protected:Npn \__ifmultoc_after_set:
  {
    \bool_if:NTF \l__class_book_bool
      {
        \if@restonecol
          \twocolumn
        \else
          \onecolumn
        \fi
      }{\tl_set:Nn \l__toc_type_tl{article}}
  }
\RenewDocumentCommand{\tableofcontents}{o}
  {
    \group_begin:
    \IfValueT{#1}{\keys_set:nn {listoc}{#1}}
    \__ifmultoc_pre_set:
    \__title_mark:n {\contentsname}
    \vspace*{\dim_use:N \l__toc_offset_dim}
    \@starttoc{toc}
    \__ifmultoc_after_set:
    \group_end:
  }
\RenewDocumentCommand{\listoffigures}{so}
  {
    \group_begin:
    \IfValueT{#2}{\keys_set:nn {listoc}{#2}}
    \__ifmultoc_pre_set:
    \IfBooleanTF{#1}
      {\__title_mark:n {\listfigurename}}
      {\__title_mark_intoc:n {\listfigurename}}
    \dim_add:NV \l__toc_offset_dim\l__toc_listsoffset_dim
    \vspace*{\dim_use:N \l__toc_offset_dim}
    \@starttoc{lof}
    \__ifmultoc_after_set:
    \group_end:
  }
\RenewDocumentCommand{\listoftables}{so}
  {
    \group_begin:
    \IfValueT{#2}{\keys_set:nn {listoc}{#2}}
    \__ifmultoc_pre_set:
    \IfBooleanTF{#1}
      {\__title_mark:n {\listtablename}}
      {\__title_mark_intoc:n {\listtablename}}
    \dim_add:NV \l__toc_offset_dim\l__toc_listsoffset_dim
    \vspace*{\dim_use:N \l__toc_offset_dim}
    \@starttoc{lot}
    \__ifmultoc_after_set:
    \group_end:
  }
\NewDocumentCommand{\listoflistings}{so}
  {
    \group_begin:
    \IfValueT{#2}{\keys_set:nn {listoc}{#2}}
    \__ifmultoc_pre_set:
    \IfBooleanTF{#1}
      {\__title_mark:n {\lstlistlistingname}}
      {\__title_mark_intoc:n {\lstlistlistingname}}
    \dim_add:NV \l__toc_offset_dim\l__toc_listsoffset_dim
    \vspace*{\dim_use:N \l__toc_offset_dim}
    \@starttoc{lol}
    \__ifmultoc_after_set:
    \group_end:
  }

\makeindex[
  intoc,
  options = -M~texindy~-C~utf8,
  program = truexindy,
  columns = 2,
  columnsep = 2\ccwd
  ]
\indexsetup
  {
    level = \bool_if:NTF \l__class_book_bool{\chapter*}{\section*},
    toclevel = \bool_if:NTF \l__class_book_bool{chapter}{section},
    firstpagestyle = \bool_if:NTF \l__class_book_bool{plain}{fancy}
  }
\__patch_cmd:Nnn \imki@indexheaders
  {\@mkboth{\MakeUppercase\indexname}{\MakeUppercase\indexname}}
  {\__markboth:n {\indexname}}

\tl_new:N \l__font_table_tl
\tl_new:N \l__font_figure_tl
\tl_new:N \l__font_listing_tl
\tl_new:N \l__font_footnote_tl

\__ctex_define:nn {elsefont}
  {
    table-cap   .tl_set:N = \l__font_table_tl,
    table-cap   .initial:n = \sffamily\small,
    figure-cap  .tl_set:N = \l__font_figure_tl,
    figure-cap  .initial:n = \sffamily\small,
    listing-cap .tl_set:N = \l__font_listing_tl,
    listing-cap .initial:n = \sffamily\small,
    footnote    .tl_set:N = \l__font_footnote_tl,
    footnote    .initial:n = \rmfamily,
    marginpar   .tl_set:N = \marginfont,
    marginpar   .initial:n = \rmfamily\footnotesize
  }

\DeclareCaptionLabelSeparator{ccwd}{\hspace{\ccwd}}
\DeclareCaptionLabelFormat{parens}{\bothIfFirst{#1}{~}(#2)}
\DeclareCaptionFont{table@font}{\l__font_table_tl}
\DeclareCaptionFont{figure@font}{\l__font_figure_tl}
\DeclareCaptionFont{listing@font}{\l__font_listing_tl}
\captionsetup
  {
    format = hang,
    % figurewithin = section,
    % tablewithin = section,
    font = {stretch = {\fp_use:N \l__spread_caption_fp}},
    labelfont = {color = ctex@frame},
    labelsep = ccwd,
    singlelinecheck = true,
    belowskip = 0pt,aboveskip = 10pt
  }
\captionsetup[table]{font += table@font}
\captionsetup[figure]{font += figure@font}
\captionsetup[lstlisting]{font += listing@font}
\captionsetup[subfigure]
  {
    labelformat = parens,
    font += figure@font,
    belowskip = 2pt,aboveskip = 6pt
  }
\ctex_at_end_package:nn {bicaption}
  {
    \captionsetup[figure][bi-second]{name = Figure}
    \captionsetup[table][bi-second]{name = Table}
  }
\cs_new:Npn \__arabic:n #1{\int_to_arabic:v {c@#1}}
\cs_new_protected:Npn \__separator_set:n #1
  {
    \cs_set:cpn {the#1}
      {
        \int_compare:nT {\c@chapter > 0}
          {
            \thechapter
            \use:c {l__#1_separator_tl}
          }
        \__arabic:n {#1}
      }
  }
\cs_gset:cpn {thesection}
  {
    \int_compare:nT {\c@chapter > 0}{\thechapter.}
    \__arabic:n {section}
  }
\clist_map_inline:nn
  {figure,table,lstlisting,equation}
  {\__separator_set:n {#1}}
\cs_gset_protected:Npn \appendix
  {
    \int_compare:nNnTF {\c@chapter} > {0}
      {
        \setcounter{chapter}{0}
        \setcounter{section}{0}
        \gdef\thechapter{\@Alph\c@chapter}
        \gdef\CTEX@prechapter{\CTEX@preappendix}
        \gdef\CTEX@thechapter{\CTEX@appendix@number}
        \gdef\CTEX@postchapter{\CTEX@postappendix}
        \gdef\CTEX@chapter@numbering{\CTEX@appendix@numbering}
      }{
        \setcounter{section}{0}
        \setcounter{subsection}{0}
        \gdef\thesection{\@Alph\c@section}
        \gdef\CTEX@presection{\CTEX@preappendix}
        \gdef\CTEX@thesection{\CTEX@appendix@number}
        \gdef\CTEX@postsection{\CTEX@postappendix}
        \gdef\CTEX@section@numbering{\CTEX@appendix@numbering}
        \ctex_set:nn {appendix}{number = {\@Alph\c@section},name = {}}
      }
  }
\AtBeginEnvironment{tabularx}
  {
    \exp_args:Nx \linespread{\fp_use:N \l__spread_table_fp}
    \selectfont\ignorespaces
  }
\AtBeginEnvironment{tabular}
  {
    \exp_args:Nx \linespread{\fp_use:N \l__spread_table_fp}
    \selectfont\ignorespaces
  }
\ctex_after_end_preamble:n
  {
    \exp_args:Nx \linespread{\fp_use:N \l__spread_line_fp}
    \selectfont\ignorespaces
  }

\fp_new:N \l__spread_line_fp
\fp_new:N \l__spread_table_fp
\fp_new:N \l__spread_math_fp
\fp_new:N \l__spread_caption_fp
\fp_new:N \l__spread_footnote_fp

\__ctex_define:nn {spread}
  {
    line      .fp_set:N = \l__spread_line_fp,
    line      .initial:n = 1.3,
    table     .fp_set:N = \l__spread_table_fp,
    table     .initial:n = 1.05,
    math      .fp_set:N = \l__spread_math_fp,
    math      .initial:n = 1.05,
    caption   .fp_set:N = \l__spread_caption_fp,
    caption   .initial:n = 1,
    footnote  .fp_set:N = \l__spread_footnote_fp,
    footnote  .initial:n = 1
  }

\skip_set:Nn \parskip{0pt plus 2pt minus 1pt}
\skip_set:Nn \floatsep{12pt plus 2pt minus 2pt}
\skip_set:Nn \intextsep{14pt plus 2pt minus 2pt}
\skip_set:Nn \textfloatsep{16pt plus 2pt minus 4pt}
\skip_set:Nn \dbltextfloatsep{16pt plus 2pt minus 4pt}
\skip_set:Nn \@fpsep{8pt plus 2.0fil}
\setcounter{topnumber}{4}
\setcounter{bottomnumber}{4}
\setcounter{totalnumber}{8}
\cs_gset:Npn \textfraction{0.18}
\cs_gset:Npn \topfraction{0.85}
\cs_gset:Npn \bottomfraction{0.65}
\cs_gset:Npn \floatpagefraction{0.60}

\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}
\graphicspath{{figures/}}
\DeclareGraphicsExtensions{.pdf,.png,.jpg,.eps,.tif}

\setlist
  {
    labelsep = .75\ccwd,listparindent = 2\ccwd,
    itemsep = .75ex plus .1ex,topsep = .75ex plus .1ex,
    partopsep = 0ex,parsep = 0ex
  }
\newlist{outlinelist}{itemize}{1}
\setlist[outlinelist]
  {
    label = \color{ctex@emph}\upshape\ding{111},
    itemsep = .5ex plus .1ex,leftmargin = *
  }
\setlist[itemize,1]
  {label = \color{ctex@emph}\ensuremath{\bullet},leftmargin = *}
\setlist[itemize,2]
  {label = \color{ctex@emph}\ensuremath{\circ},leftmargin = *}
\setlist[enumerate,1]
  {label = \color{ctex@emph}\arabic*.,ref = \arabic*,leftmargin = *}
\setlist[enumerate,2]
  {label = \color{ctex@emph}(\alph*),ref = \theenumi(\alph*),leftmargin = *}
\setlist[description]
  {font = \color{ctex@emph}\sf,labelwidth = *,leftmargin = 2\ccwd}

\cs_new_protected:Npn \__thmname_set:nn #1#2
  {\tl_const:cn {c__name_#1_tl}{#2}}
\bool_if:NTF \l__lang_chinese_bool
  {
    \clist_map_inline:nn
      {
        {theorem}{定理},
        {definition}{定义},
        {lemma}{引理},
        {corollary}{推论},
        {proposition}{性质},
        {example}{例},
        {remark}{注},
        {exercise}{练习}
      }{\__thmname_set:nn #1}
  }{
    \clist_map_inline:nn
      {
        {theorem}{Theorem},
        {definition}{Definition},
        {lemma}{Lemma},
        {corollary}{Corollary},
        {proposition}{Proposition},
        {example}{Example},
        {remark}{Remark},
        {exercise}{Exercise}
      }{\__thmname_set:nn #1}
  }

\bool_new:N \l__thmbox_bool
\tl_new:N \l__thm_numberwith_tl
\tl_new:N \l__thm_headpunct_tl
\tl_new:N \l__thm_bodyfont_tl
\tl_new:N \l__thm_notefont_tl
\tl_new:N \l__thm_headindent_tl
\tl_new:N \l__thm_spaceabove_tl
\tl_new:N \l__thm_spacebelow_tl

\RenewDocumentCommand{\newtheorem}{O{}m}
  {\AfterPreamble{\declaretheorem[#1]{#2}}}
\__ctex_define:nn {thmset}
  {
    thmbox      .bool_set:N = \l__thmbox_bool,
    thmbox      .default:n = true,
    thmbox      .initial:n = false,
    numberwith  .tl_set:N = \l__thm_numberwith_tl,
    numberwith  .initial:n = {chapter},
    headpunct   .tl_set:N = \l__thm_headpunct_tl,
    headpunct   .initial:n = {},
    bodyfont    .tl_set:N = \l__thm_bodyfont_tl,
    bodyfont    .initial:n = {},
    notefont    .tl_set:N = \l__thm_notefont_tl,
    notefont    .initial:n = {},
    headfont    .tl_set:N = \l__thm_headfont_tl,
    headfont    .initial:n = {\color{ctex@emph}\sffamily},
    headindent  .tl_set:N = \l__thm_headindent_tl,
    headindent  .initial:n = {0\ccwd},
    spaceabove  .tl_set:N = \l__thm_spaceabove_tl,
    spaceabove  .initial:n = {.75ex plus .1ex},
    spacebelow  .tl_set:N = \l__thm_spacebelow_tl,
    spacebelow  .initial:n = {.75ex plus .1ex},
    spacepost   .tl_set:N = \l__thm_spacepost_tl,
    spacepost   .initial:n = {\ccwd}
  }
\ctex_at_end_preamble:n
  {
    \declaretheoremstyle[
      spaceabove = \l__thm_spaceabove_tl,
      spacebelow = \l__thm_spacebelow_tl,
      headindent = \l__thm_headindent_tl,
      headfont = \l__thm_headfont_tl,
      notefont = \l__thm_notefont_tl,
      notebraces = {}{},
      bodyfont = \l__thm_bodyfont_tl,
      headpunct = \l__thm_headpunct_tl,
      postheadspace = \l__thm_spacepost_tl,
      numberwithin = \l__thm_numberwith_tl,
      headformat = \NAME\space\NUMBER\NOTE
      ]{mythm}
    \declaretheorem[style = mythm,name = \c__name_theorem_tl]{theorem}
    \declaretheorem[style = mythm,name = \c__name_definition_tl]{definition}
    \declaretheorem[style = mythm,name = \c__name_lemma_tl]{lemma}
    \declaretheorem[style = mythm,name = \c__name_corollary_tl]{corollary}
    \declaretheorem[style = mythm,name = \c__name_proposition_tl]{proposition}
    \declaretheorem[style = mythm,name = \c__name_example_tl]{example}
    \cs_gset_eq:NN \proof\relax
    \declaretheorem{remark}[
      style = mythm,
      name = \c__name_remark_tl,
      numbered = no
      ]
    \declaretheorem{proof}[
      style = mythm,
      name = \proofname,
      numbered = no,
      qed = \qedsymbol
      ]
  }

\settasks
  {
    label = (\Alph*),
    after-item-skip = 0ex plus .1ex,
    column-sep = .5\ccwd,
    item-indent = 2\ccwd,
    label-width = 1.5\ccwd
  }
\setchemformula
  {
    math-scripts = false,
    charge-hshift = 0.25\ccwd,
    subscript-vshift = -0.2ex
  }
\sisetup
  {
    detect-family,
    detect-weight,
    detect-shape,
    detect-inline-family = math,
    detect-inline-weight = math,
    detect-display-math,
    range-phrase = \ensuremath{\sim},
    range-units = single,
    table-parse-only,
    group-digits = false
  }
\allowdisplaybreaks[4]
\cs_gset:Npn \ULthickness{.75pt}
\skip_set:Nn \jot{4pt plus 1pt minus 1pt}
\cs_new_protected:Npn \l__math_restore:n #1
  {
    \AtBeginEnvironment{#1}
      {\linespread{\fp_use:N \l__spread_math_fp}\selectfont\ignorespaces}
  }
\clist_map_inline:nn
  {
    array,matrix,pmatrix,bmatrix,Bmatrix,vmatrix,Vmatrix,
    matrix*,pmatrix*,bmatrix*,Bmatrix*,vmatrix*,Vmatrix*,
    cases,cases*,dcases,dcases*,rcases,rcases*,drcases,drcases*,
    aligned,alignedat,gathered,multlined,lgathered,rgathered
  }{\l__math_restore:n {#1}}
\__patch_cmd:Nnn \start@gather
  {\collect@body}
  {\linespread{\fp_use:N \l__spread_math_fp}\selectfont\collect@body}
\__patch_cmd:Nnn \start@align
  {\collect@body}
  {\linespread{\fp_use:N \l__spread_math_fp}\selectfont\collect@body}
\__patch_cmd:Nnn \start@multline
  {\collect@body}
  {\linespread{\fp_use:N \l__spread_math_fp}\selectfont\collect@body}
\__patch_cmd:Nnn \gather@split
  {\spread@equation}
  {\linespread{\fp_use:N \l__spread_math_fp}\selectfont\spread@equation}
\ctex_after_end_preamble:n
  {
    \skip_set:Nn \abovedisplayskip{5pt plus 1pt minus 1pt}
    \skip_set:Nn \belowdisplayskip{5pt plus 1pt minus 1pt}
    \skip_set:Nn \abovedisplayshortskip{0pt}
    \skip_set:Nn \belowdisplayshortskip{5pt plus 1pt minus 1pt}
  }
\cs_gset:Npn \tagform@#1
  {\maketag@@@{\color{ctex@emph}(\ignorespaces#1\unskip\@@italiccorr)}}

\ctex_at_end_package:nn {tcolorbox}
  {
    \__ifpackage_later:nn {tcolorbox}{2020/10/09}
    \tcbset
      {
        thmsty/.style =
          {
            enhanced~jigsaw,pad~at~break* = 3pt,
            opacityback = 0,
            colframe = ctex@emph,
            left = .2pc,right = .2pc,top = .5pc,bottom = .5pc,middle= .5pc,
            arc = 0pt
          },
        outlinesty/.style =
          {
            enhanced,nofloat,
            tikznode~boxed~title,
            interior~style = white,colframe = ctex@emph,
            colbacktitle = white,coltitle = ctex@emph,
            fonttitle = \large\sffamily,fontupper = \itshape,
            boxed~title~style = {size = normal,opacityframe = 0,boxrule = 0pt},
            attach~boxed~title~to~top~center = {yshift = -\tcboxedtitleheight/2},
            arc = 3pt,
            after~skip = 3ex,
            left = 1.5pc,right = 1.5pc,top = 1pc,bottom = 0.5pc,
            boxsep = 5pt
          },
        exersty/.style =
          {
            enhanced,on~line,
            arc = 5pt,
            fontupper = \sffamily\Large,
            boxrule = 1pt,boxsep = 0pt,
            left = 6pt,right = 6pt,top = 3.5pt,bottom = 3.5pt,
            before~skip = 4ex,after~skip = 2.25ex
          },
        breakable,
        boxrule = \l__rule_width_dim
      }
    \NewDocumentEnvironment{outline}{D(){\abstractname}o+b}
      {
        \begin{tcolorbox}[outlinesty,title = #1,IfValueT = {#2}{#2}]
          \begin{outlinelist}
            #3
          \end{outlinelist}
        \end{tcolorbox}
      }{}
    \NewDocumentEnvironment{exercise}
      {sO{LightYellow}O{1.}D(){\c__name_exercise_tl}o+b}
      {
        \begin{center}
          \bool_if:NTF \l__thmbox_bool
            {
              \tcbox[
                exersty,
                colback = #2,colframe = black,
                drop~fuzzy~shadow = #2,
                IfValueT = {#5}{#5},
                phantom =
                  \IfBooleanF{#1}
                    {
                      \CTEX@ifnametrue
                      \refstepcounter{section}
                      \markright{\CTEXthesection\hspace{0.5\ccwd}#4}
                      \CTEX@addtocline{section}{#4}
                    }
                ]{\IfBooleanF{#1}{\CTEXthesection\hspace{0.5\ccwd}}#4}
            }{
              \sffamily\Large
              \IfBooleanF{#1}
                {
                  \CTEX@ifnametrue
                  \refstepcounter{section}
                  \markright{\CTEXthesection\hspace{0.5\ccwd}#4}
                  \CTEX@addtocline{section}{#4}
                  \CTEXthesection\hspace{0.5\ccwd}
                }#4
            }
        \end{center}
        \begin{enumerate}[#3,labelsep = 0.5\ccwd]
          #6
        \end{enumerate}
      }{}
    \DeclareTColorBox{mybox}{sO{MintCream}d()O{}}
      {
        enhanced~jigsaw,pad~at~break* = 3pt,
        IfBooleanTF = {#1}{colback = #2}{opacityback = 0,colframe = ctex@emph},
        IfValueT = {#3}{title = #3},
        coltitle = black,colbacktitle = white,
        fonttitle = \sffamily,
        left = .2pc,right = .2pc,top = .5pc,bottom = .5pc,middle= .5pc,
        arc = 0pt,
        toptitle = 2pt,bottomtitle = 2pt,
        beforeafter~skip=2ex,
        halign~upper = left,halign~lower = left,
        center~title,#4
      }
    \DeclareTotalTCBox{\fuzzy}{O{DarkSeaGreen}vO{}}
      {
        nobeforeafter,tcbox~raise~base,
        blank,fuzzy~halo = 2pt~with~#1,#3
      }{#2}
    \DeclareTotalTCBox{\concise}{O{Aqua}vO{}}
      {
        nobeforeafter,tcbox~raise~base,
        top = 2pt,bottom = 2.5pt,left = 2pt,right = 2pt,
        boxsep = 0pt,boxrule = 0.75pt,arc = 1pt,
        colback = #1!15!white,#3
      }{#2}
  }
\ctex_at_end_preamble:n
  {
    \bool_if:NT \l__thmbox_bool
      {
        \@ifpackageloaded{tcolorbox}
          {
            \tcolorboxenvironment{theorem}{thmsty}
            \tcolorboxenvironment{definition}{thmsty}
            \tcolorboxenvironment{lemma}{thmsty}
            \tcolorboxenvironment{corollary}{thmsty}
            \tcolorboxenvironment{proposition}{thmsty}
            \tcolorboxenvironment{example}{thmsty}
          }{}
      }
  }

\bool_set_true:N \l__backend_bibtex_bool
\tl_new:N \l__bib_style_tl
\tl_new:N \l__bib_otherstyle_tl
\tl_new:N \l__bib_citestyle_tl
\tl_new:N \l__bib_file_tl

\__ctex_define:nn {bibset}
  {
    backend               .choice:,
    backend/bibtex        .code:n = {},
    backend/biblatex      .code:n =
      {\bool_set_false:N \l__backend_bibtex_bool},

    bib-style             .choice:,
    bib-style             .value_required:n = true,
    bib-style/numerical   .code:n =
      {
        \tl_set:Nn  \l__bib_style_tl{#1}
        \tl_clear:N \l__bib_otherstyle_tl
      },
    bib-style/authoryear  .code:n =
      {
        \tl_set:Nn  \l__bib_style_tl{#1}
        \tl_clear:N \l__bib_otherstyle_tl
      },
    bib-style/unknown     .code:n =
      {\tl_set_eq:NN \l__bib_otherstyle_tl\l_keys_value_tl},
    bib-style             .initial:n = numerical,

    cite-style            .code:n =
      {\tl_set:Nn \l__bib_citestyle_tl{#1}},
    bibfile               .tl_set:N = \l__bib_file_tl,
    bibfile               .initial:n = refs.bib
  }

\cs_new_protected:Npn \__bibtex_set:
  {
    \tl_if_empty:NTF \l__bib_otherstyle_tl
      {
        \tl_if_eq:VnT \l__bib_style_tl{numerical}
          {
            \bibliographystyle{gbt7714-numerical}
            \setcitestyle{comma,square,super}
          }
        \tl_if_eq:VnT \l__bib_style_tl{authoryear}
          {\bibliographystyle{gbt7714-author-year}}
        \cs_set_eq:NN \cite\citep
      }{
        \exp_args:NV \bibliographystyle\l__bib_otherstyle_tl
      }
    \tl_if_empty:NF \l__bib_citestyle_tl
      {\exp_args:NV \setcitestyle\l__bib_citestyle_tl}
    \skip_set:Nn \bibsep{0ex}
    \NewDocumentCommand{\printbibliography}{so}
      {
        \group_begin:
        \IfValueT{##2}{\keys_set:nn {listoc}{##2}}
        \__ifmultoc_pre_set:
        \cs_set:Npn \bibsection
          {
            \IfBooleanTF{##1}
              {\__title_mark:n {\bibname}}
              {\__title_mark_intoc:n {\bibname}}
          }
        \exp_args:NV \bibliography\l__bib_file_tl
        \__ifmultoc_after_set:
        \group_end:
      }
  }
\cs_new_protected:Npn \__put_biblatex:n #1
  {\PassOptionsToPackage{#1}{biblatex}}
\cs_new_protected:Npn \__biblatex_pre_set:
  {
    \tl_if_empty:NTF \l__bib_otherstyle_tl
      {
        \tl_if_eq:VnT \l__bib_style_tl{numerical}
          {\__put_biblatex:n {style = gb7714-2015}}
        \tl_if_eq:VnT \l__bib_style_tl{authoryear}
          {\__put_biblatex:n {style = gb7714-2015ay}}
      }{\__put_biblatex:n {style = \l__bib_otherstyle_tl}}
    \tl_if_empty:NF \l__bib_citestyle_tl
      {\__put_biblatex:n {citestyle = \l__bib_citestyle_tl}}
    \__put_biblatex:n {backend = biber}
  }
\cs_new_protected:Npn \__biblatex_after_set:
  {
    \exp_args:NV \addbibresource\l__bib_file_tl
    \cs_gset:Npn \blx@default@theheading{bibintoc}
    \defbibheading{bibintoc}[\bibname]{\__title_mark_intoc:n {##1}}
    \skip_set:Nn \bibitemsep{0ex}
  }
\ctex_at_end_preamble:n
  {
    \bool_if:NTF \l__backend_bibtex_bool
      {
        \RequirePackage[sort&compress]{natbib}
        \__bibtex_set:
      }{
        \__biblatex_pre_set:
        \RequirePackage{biblatex}
        \__biblatex_after_set:
      }
  }

\ctex_at_end_preamble:n
  {
    \group_begin:
    \footnotesize
    \exp_args:Nx \linespread{\fp_use:N \l__spread_footnote_fp}\selectfont
    \skip_gset:Nn \footnotesep{\ht\strutbox}
    \group_end:
    \bool_if:NT \l__chap_withpart_bool
      {\counterwithin*{chapter}{part}}
    \tl_if_eq:NnT \l__foot_numberwith_tl{part}
      {
        \counterwithout*{footnote}{chapter}
        \counterwithin*{footnote}{part}
      }
    \tl_if_eq:NnT \l__foot_numberwith_tl{page}
      {
        \counterwithout*{footnote}{chapter}
        \counterwithin*{footnote}{page}
      }
  }
\__patch_cmd:Nnn \@footnotetext
  {\reset@font}
  {\def\baselinestretch{\fp_use:N \l__spread_footnote_fp}\l__font_footnote_tl}
\__patch_cmd:Nnn \@mpfootnotetext
  {\reset@font}
  {\def\baselinestretch{\fp_use:N \l__spread_footnote_fp}\l__font_footnote_tl}
\__patch_cmd:Nnn \@makefnmark
  {\normalfont}{\l__font_footnote_tl}

\lstdefinestyle{mystyle}
  {
    language = [LaTeX]TeX,
    texcsstyle =
      *\lst@ifdisplaystyle\bfseries\color{ctex@verb}\else\color{ctex@verb}\fi,
    basicstyle =
      \ttfamily\lst@ifdisplaystyle\small\else\color{ctex@verb}\fi,
    framexleftmargin = 0pt,
    framexrightmargin = 0pt,
    xleftmargin = 3pt,
    xrightmargin = 3pt,
    numbersep = 10pt,
    framesep = 3pt,
    frame = single,
    rulecolor = \color{ctex@frame},
    commentstyle = \color{gray},
    emphstyle = \color{ctex@emph},
    emph = {caption,makecell,subcaption,tabularx},
    keywordstyle =
      \lst@ifdisplaystyle\bfseries\color{ctex@verb}\else\color{ctex@verb}\fi,
    morekeywords =
      {
        includegraphics,setmainfont,setsansfont,setmonofont,setCJKmainfont,setCJKsansfont,setCJKmonofont,setCJKfamilyfont,RequirePackage
      }
  }
\lstset
  {
    style = mystyle,
    breaklines = true,
    resetmargins = true,
    % numbers = left,
    numberstyle = \footnotesize,
    abovecaptionskip = -1ex,
    belowcaptionskip = 1.5ex,
    aboveskip = 1.5ex plus .2ex minus .1ex,
    belowskip = 0.55ex plus .2ex minus .1ex,
    keepspaces = true,
    framerule = \l__rule_width_dim,
    columns = flexible
  }
\lstloadlanguages{C,C++,Java,Python,Matlab}

\clist_new:N \l__hyperref_clist
\cs_new_protected:Npn \__put_hyperref:n #1
  {\clist_put_right:Nn \l__hyperref_clist{#1}}
\cs_new_protected:Npn \__define_linkcolor:nnn #1#2#3
  {\definecolorset{HTML}{ctex@}{}{link,#1;url,#2;cite,#3}}
\cs_new_protected:Npn \__define_themecolor:nnn #1#2#3
  {\definecolorset{HTML}{ctex@}{}{frame,#1;emph,#2;verb,#3}}
\cs_new:Npn \__linkcolor_set:n #1
  {
    linkcolor/\clist_item:nn {#1}{1} .code:n =
      {
        \__define_linkcolor:nnn
          {\clist_item:nn {#1}{2}}
          {\clist_item:nn {#1}{3}}
          {\clist_item:nn {#1}{4}}
        \__put_hyperref:n
          {
            linkcolor = ctex@link,linkbordercolor = ctex@link,
            urlcolor = ctex@url,urlbordercolor = ctex@url,
            citecolor = ctex@cite,citebordercolor = ctex@cite
          }
      },
  }
\cs_new:Npn \__themecolor_set:n #1
  {
    color/\clist_item:nn {#1}{1} .code:n =
      {
        \__define_themecolor:nnn
          {\clist_item:nn {#1}{2}}
          {\clist_item:nn {#1}{3}}
          {\clist_item:nn {#1}{4}}
      },
  }

\cs_new:Npn \__allow_urlbreak:
  {
    \cs_new:Npn \__add_urlbreak_points:
      {\tl_map_function:NN \c__urlbreak_points_tl\do}
    \__appto_cmd:Nn
      \UrlBreaks{\UrlOrds\__add_urlbreak_points:}
  }
\tl_const:Nn \c__urlbreak_points_tl
  {ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789}

\keys_define:nx {ctex/link}
  {
    hyperlink         .choice:,
    hyperlink/edge    .code:n = {},
    hyperlink/various .code:n = {\__put_hyperref:n {colorlinks}},
    hyperlink/none    .code:n = {\__put_hyperref:n {hidelinks}},
    hyperlink         .default:n = edge,
    hyperlink         .initial:n = edge,

    linkcolor         .choice:,
    \clist_map_function:nN
      {
        {fresh,     62d71f,0000B2,005752},
        {cutepink,  ff69b4,9d5196,57b5e5},
        {skyblue,   0000ff,004986,eb6877},
        {crimson,   dc143c,00c1c9,afcd20}
      }
      \__linkcolor_set:n
    linkcolor         .default:n = fresh,
    linkcolor         .initial:n = fresh,

    linktopage        .choice:,
    linktopage/true   .code:n = {\__put_hyperref:n {linktocpage}},
    linktopage/false  .code:n = {},
    linktopage        .default:n = true,
    linktopage        .initial:n = false
  }
\keys_define:nx {ctex/style}
  {
    color             .choice:,
    color             .value_required:n = true,
    \clist_map_function:nN
      {
        {none,      000000,000000,000000},
        {seaside,   4682B4,004986,a40000},
        {energy,    f39800,00a0e9,893895},
        {cyberpunk, 601986,eb6877,a4005b}
      }
      \__themecolor_set:n
    color             .initial:n = none
  }

\ctex_at_end_preamble:n
  {
    \RequirePackage{hyperref,cleveref}
    \urlstyle{same}
    \__allow_urlbreak:
    \ctex_hypersetup:n {pdfstartview = FitH,bookmarksnumbered}
    \exp_args:NV \hypersetup\l__hyperref_clist
    \bool_if:NTF \l__lang_chinese_bool
      {
        \keys_set_known:nn {ctex}
          {
            contentsname = {目\hspace{\ccwd}录},
            indexname = {索\hspace{\ccwd}引},
            listfigurename = {图片索引},
            listtablename = {表格索引},
            abstractname = {摘\hspace{\ccwd}要},
            lstlistlistingname = {代码索引},
            lstlistingname = {代码}
          }
        \crefformat{equation}{#2式（#1）#3}
        \crefformat{align}{#2式（#1）#3}
        \crefformat{multline}{#2式（#1）#3}
        \crefformat{gather}{#2式（#1）#3}
        \crefformat{figure}{#2图#1#3}
        \crefformat{table}{#2表#1#3}
        \crefformat{chapter}{#2第#1章#3}
        \crefformat{section}{#2节#1#3}
        \crefformat{subsection}{#2小节#1#3}
        \crefformat{theorem}{#2定理#1#3}
        \crefformat{definition}{#2定义#1#3}
        \crefformat{lemma}{#2引理#1#3}
        \crefformat{corollary}{#2推论#1#3}
        \crefformat{proposition}{#2性质#1#3}
        \crefformat{example}{#2例#1#3}
      }{
        \keys_set_known:nn {ctex}
          {
            abstractname = {Abstract},
            lstlistlistingname = {List~of~Listings},
            lstlistingname = {Code}
          }
        \crefformat{equation}{#2Equation~(#1)#3}
        \crefformat{align}{#2Equation~(#1)#3}
        \crefformat{multline}{#2Equation~(#1)#3}
        \crefformat{gather}{#2Equation~(#1)#3}
        \crefformat{figure}{#2Figure~#1#3}
        \crefformat{table}{#2Table~#1#3}
        \crefformat{chapter}{#2Chapter~#1#3}
        \crefformat{section}{#2Section~#1#3}
        \crefformat{subsection}{#2Subsection~#1#3}
        \crefformat{theorem}{#2Theorem~#1#3}
        \crefformat{definition}{#2Definition~#1#3}
        \crefformat{lemma}{#2Lemma~#1#3}
        \crefformat{corollary}{#2Corollary~#1#3}
        \crefformat{proposition}{#2Proposition~#1#3}
        \crefformat{example}{#2Example~#1#3}
      }
  }

\ctex_set:n
  {
    secnumdepth = 3,
    tocdepth = 1,
    part =
      {
        pagestyle = empty,
        number =
          {\bool_if:NTF \l__zhtitle_bool{\chinese{part}}{\thepart}},
        format = {\color{ctex@frame}\sffamily\Huge},
        aftername =
          {\bool_if:NTF \l__newline_bool{\par\nobreak}{\hspace{\ccwd}}},
        tocline = {\CTEXifname{\CTEXthepart\hspace{\ccwd}}{}#2}
      },
    chapter =
      {
        % pagestyle = fancy,
        number =
          {\bool_if:NTF \l__zhtitle_bool{\chinese{chapter}}{\thechapter}},
        format =
          {
            \color{ctex@frame}\sffamily\LARGE
            \bool_if:NF \l__newline_bool{\centering}
          },
        aftername =
          {
            \bool_if:NTF \l__newline_bool
              {\par\nobreak\vskip 1.5pc}{\hspace{\ccwd}}
          },
        beforeskip = {-1.5ex},
        afterskip = {3ex},
        lotskip = {0.8pc},
        lofskip = {0.8pc},
        tocline = {\CTEXifname{\CTEXthechapter\hspace{\ccwd}}{}#2}
      },
    section =
      {
        hang = true,
        format = {\color{ctex@frame}\sffamily\Large},
        aftername = {\hspace{0.5\ccwd}},
        beforeskip = {1.5ex plus .2ex minus .1ex},
        afterskip = {1.5ex plus .2ex minus .1ex},
        tocline = {\CTEXifname{\CTEXthesection\hspace{\ccwd}}{}#2}
      },
    subsection =
      {
        hang = true,
        format = {\color{ctex@frame}\sffamily\large},
        aftername = {\hspace{0.5\ccwd}},
        beforeskip = {1.3ex plus .2ex minus .1ex},
        afterskip = {1.3ex plus .2ex minus .1ex},
        tocline = {\CTEXifname{\CTEXthesubsection\hspace{\ccwd}}{}#2}
      },
    subsubsection =
      {
        hang = true,
        format = {\color{ctex@frame}\sffamily},
        aftername = {\hspace{0.5\ccwd}},
        beforeskip = {\parskip},
        afterskip = {\parskip}
      }
  }

\bool_if:NF \l__newline_bool
  {
    \ctex_set:n
      {
        part/hang = true,
        chapter/hang = true
      }
  }
\endinput
%%
%% End of file `easybook.cls'.
