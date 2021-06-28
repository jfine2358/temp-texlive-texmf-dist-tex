%%
%% This is file `tudscrposter.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% tudscr-version.dtx  (with options: `class,poster')
%% tudscr-base.dtx  (with options: `class,poster,load')
%% tudscr-fonts.dtx  (with options: `class,poster,option')
%% tudscr-area.dtx  (with options: `class,poster,option')
%% tudscr-pagestyle.dtx  (with options: `class,poster,option')
%% tudscr-layout.dtx  (with options: `class,poster,option')
%% tudscr-title.dtx  (with options: `class,poster,option')
%% tudscr-frontmatter.dtx  (with options: `class,poster,option')
%% tudscr-comp.dtx  (with options: `class,poster,option')
%% tudscr-misc.dtx  (with options: `class,poster,option')
%% tudscr-misc.dtx  (with options: `class,poster,execute')
%% tudscr-base.dtx  (with options: `class,poster,body')
%% tudscr-fonts.dtx  (with options: `class,poster,body')
%% tudscr-fields.dtx  (with options: `class,poster,body')
%% tudscr-locale.dtx  (with options: `class,poster,body')
%% tudscr-area.dtx  (with options: `class,poster,body')
%% tudscr-pagestyle.dtx  (with options: `class,poster,body')
%% tudscr-layout.dtx  (with options: `class,poster,body')
%% tudscr-title.dtx  (with options: `class,poster,body')
%% tudscr-frontmatter.dtx  (with options: `class,poster,body')
%% tudscr-comp.dtx  (with options: `class,poster,body')
%% tudscr-misc.dtx  (with options: `class,poster,body')
%% 
%% TUD-Script -- Corporate Design of Technische Universitaet Dresden
%% 
%%   2017/05/30 v2.05m TUD-Script
%% 
%% Copyright (C) Falk Hanisch <hanisch.latex@outlook.com>, 2012-2017
%% 
%% This file was generated from file(s) of the TUD-Script bundle.
%% ----------------------------------------------------------------------------
%% 
%% This work may be distributed and/or modified under the conditions
%% of the LaTeX Project Public License, version 1.3c of the license.
%% The latest version of this license is in
%%     http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of
%% LaTeX 2005/12/01 or later and of this work.
%% 
%% This work has the LPPL maintenance status "author-maintained".
%% 
%% The current maintainer and author of this work is Falk Hanisch.
%% 
%%% From File: tudscr-version.dtx
\begingroup
  \catcode`\@11\relax
  \ifx\TUD@Version\@undefined
    \newcommand*\TUD@Version@Check[1]{%
      \gdef\TUD@Version{#1}%
      \gdef\TUDScriptVersion{#1}%
      \def\@tempb##1 v##2 ##3\relax##4\relax{\gdef\TUDScriptVersionNumber{##2}}%
      \edef\@tempa{\TUD@Version}%
      \expandafter\@tempb\@tempa\relax? ? \relax\relax%
      \gdef\TUD@Version@KOMA{3.17}%
    }
  \else
    \newcommand*\TUD@Version@Check[1]{%
      \def\@tempa{#1}%
      \ifx\TUD@Version\@tempa\else%
        \@latex@warning@no@line{%
          \noexpand\TUD@Version\space is `\TUD@Version',\MessageBreak%
          but `#1' was expected!\MessageBreak%
          You should not use classes, packages or files from\MessageBreak%
          different TUD-Script-Bundle versions%
        }%
      \fi%
    }
  \fi
  \TUD@Version@Check{2017/05/30 v2.05m TUD-Script}
\endgroup
\NeedsTeXFormat{LaTeX2e}
\providecommand*\tudscrmail{hanisch.latex@outlook.com}
\newcommand*\TUD@ProvidesClass[3]{%
  \ProvidesClass{#1}[%
  2017/05/30 v2.05m TUD-Script
    ^^J#3 (#2)%
  ]%
  \newcommand*\TUD@Class@KOMA{#2}%
  \ifx\TUD@Class@Parent\@undefined%
    \newcommand*\TUD@Class@Name{#1}%
    \TUD@Class@Info%
  \fi%
}
\providecommand*\TUD@Class@Info{%
  \typeout{+---------------------------------------------------------------}%
  \typeout{| Corporate Design of Technische Universitaet Dresden}%
  \typeout{| Class: \TUD@Class@Name}%
  \typeout{| Version: \TUD@Version}%
  \typeout{| Author: Falk Hanisch (\tudscrmail)}%
  \typeout{| Forum: http://latex.wcms-file3.tu-dresden.de/phpBB3/}%
  \typeout{+---------------------------------------------------------------}%
}
\TUD@ProvidesClass{tudscrposter}{scrartcl}{poster class}
\edef\TUDScriptClassName{\TUD@Class@Name}
\providecommand*\TUDClassName{\TUDScriptClassName}
\@ifundefined{TUDScript}{%
  \DeclareRobustCommand\TUDScript{%
    \ifdin{TUD-SCRIPT}{%
      \textsf{T\kern.05em U\kern.05em D\kern.1em-\kern.1em Script}%
    }\csname xspace\endcsname%
  }%
}{}
%%% From File: tudscr-base.dtx
\RequirePackage{tudscrbase}[\TUD@Version]
\renewcommand*\TUD@KOMAoptions[1]{\PassOptionsToClass{#1}{\TUD@Class@KOMA}}
\AfterClass{\TUD@Class@KOMA}{\let\TUD@KOMAoptions\KOMAoptions}
%%% From File: tudscr-fonts.dtx
\PreventPackageFromLoading[%
  \ClassWarning{\TUD@Class@Name}{%
    The package `tudscrfonts' must not be used with\MessageBreak%
    a TUD-Script class%
  }%
]{tudscrfonts}
\newif\if@tud@x@fontspec@enabled
\AfterPackage*{fontspec}{%
  \@ifpackagelater{fontspec}{2017/01/24}{%
    \@tud@x@fontspec@enabledtrue%
  }{%
    \@tud@x@fontspec@enabledfalse%
    \ClassWarningNoLine{\TUD@Class@Name}%
    {%
      Version `2017/01/24' of package `fontspec' is needed,\MessageBreak
      but only version\MessageBreak
      `\csname ver@fontspec.sty\endcsname'\MessageBreak
      is available, so a fallback layout is used%
    }%
  }%
}
\newif\if@tud@cdfont@din
\newif\if@tud@cdfont@ultrabold
\@tud@cdfont@dintrue
\newcommand*\tud@cdfont@num{1}
\TUD@key{cdfont}[true]{%
  \TUD@set@numkey{cdfont}{@tempa}{%
    \TUD@bool@numkey,%
    {light}{1},{lightfont}{1},{lite}{1},{litefont}{1},{noheavyfont}{1},%
    {heavy}{2},{heavyfont}{2},{bold}{2},{boldfont}{2},%
    {normalbold}{3},{boldnormal}{3},%
    {ultrabold}{4},{boldultra}{4},{heavybold}{4},{boldheavy}{4},%
    {extendedbold}{4},{boldextended}{4},%
    {nodin}{5},{nodinbold}{5},{noDIN}{5},{noDINBold}{5},%
    {din}{6},{dinbold}{6},{DIN}{6},{DINBold}{6},%
    {nohead}{7},{nocdhead}{7},{noheadfont}{7},{noheadcdfont}{7},%
    {nocdheadfont}{7},{nobar}{7},{nobarfont}{7},%
    {head}{8},{headfont}{8},{cdhead}{8},{headcdfont}{8},{cdheadfont}{8},%
    {bar}{8},{barfont}{8},%
    {lighthead}{8},{lightheadfont}{8},{lightfonthead}{8},%
    {lightcdhead}{8},{lightheadcdfont}{8},{lightcdheadfont}{8},%
    {lightbar}{8},{lightbarfont}{8},{lightfontbar}{8},%
    {headlight}{8},{headfontlight}{8},{headlightfont}{8},%
    {cdheadlight}{8},{headcdfontlight}{8},{cdheadfontlight}{8},%
    {barlight}{8},{barfontlight}{8},{barlightfont}{8},%
    {litehead}{8},{liteheadfont}{8},{litefonthead}{8},%
    {litecdhead}{8},{liteheadcdfont}{8},{litecdheadfont}{8},%
    {litebar}{8},{litebarfont}{8},{litefontbar}{8},%
    {headlite}{8},{headfontlite}{8},{headlitefont}{8},%
    {cdheadlite}{8},{headcdfontlite}{8},{cdheadfontlite}{8},%
    {barlite}{8},{barfontlite}{8},{barlitefont}{8},%
    {noheavyhead}{8},{noheavyheadfont}{8},{noheavyfonthead}{8},%
    {noheavycdhead}{8},{noheavyheadcdfont}{8},{noheavycdheadfont}{8},%
    {noheavybar}{8},{noheavybarfont}{8},{noheavyfontbar}{8},%
    {headnoheavy}{8},{headfontnoheavy}{8},{headnoheavyfont}{8},%
    {cdheadnoheavy}{8},{headcdfontnoheavy}{8},{cdheadfontnoheavy}{8},%
    {barnoheavy}{8},{barfontnoheavy}{8},{barnoheavyfont}{8},%
    {heavyhead}{9},{heavyheadfont}{9},{heavyfonthead}{9},%
    {heavycdhead}{9},{heavyheadcdfont}{9},{heavycdheadfont}{9},%
    {heavybar}{9},{heavybarfont}{9},{heavyfontbar}{9},%
    {headheavy}{9},{headfontheavy}{9},{headheavyfont}{9},%
    {cdheadheavy}{9},{headcdfontheavy}{9},{cdheadfontheavy}{9},%
    {barheavy}{9},{barfontheavy}{9},{barheavyfont}{9},%
    {nomath}{10},{nocdmath}{10},%
    {serifmath}{10},{serif}{10},{nosansmath}{10},{nosans}{10},%
    {math}{11},{cdmath}{11},{sansmath}{11},{sans}{11},%
    {upgreek}{12},{upright}{12},{uprightgreek}{12},{uprightGreek}{12},%
    {slgreek}{13},{slanted}{13},{slantedgreek}{13},{slantedGreek}{13},%
    {fontspec}{14},{luatex}{14},{lualatex}{14}{xetex}{14},{xelatex}{14},%
    {nofontspec}{15},{nfss}{15},{pdftex}{15},{pdflatex}{15}%
  }{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \ifcase\@tempa\relax% false
      \renewcommand*\tud@cdfont@num{0}%
      \bool@std@lock{@tud@cdmath}{false}%
      \TUD@SpecialOptionAtDocument{tud@font@set}%
    \or% true
      \renewcommand*\tud@cdfont@num{1}%
      \bool@std@lock{@tud@cdmath}{true}%
      \TUD@SpecialOptionAtDocument{tud@font@set}%
    \or% heavy
      \renewcommand*\tud@cdfont@num{2}%
      \bool@std@lock{@tud@cdmath}{true}%
      \TUD@SpecialOptionAtDocument{tud@font@set}%
    \or% normalbold
      \@tud@cdfont@ultraboldfalse%
      \ifcase\tud@cdfont@num\relax% false to true
        \renewcommand*\tud@cdfont@num{1}%
      \fi%
      \bool@std@lock{@tud@cdmath}{true}%
      \TUD@SpecialOptionAtDocument{tud@font@set}%
    \or% ultrabold
      \@tud@cdfont@ultraboldtrue%
      \ifcase\tud@cdfont@num\relax% false to true
        \renewcommand*\tud@cdfont@num{1}%
      \fi%
      \bool@std@lock{@tud@cdmath}{true}%
      \TUD@SpecialOptionAtDocument{tud@font@set}%
    \or% nodin
      \@tud@cdfont@dinfalse%
    \or% din
      \@tud@cdfont@dintrue%
    \or% nohead
      \TUDoptions{cdhead=false}%
    \or% head
      \TUDoptions{cdhead=true}%
    \or% heavyhead
      \TUDoptions{cdhead=heavy}%
    \or% nomath
      \TUDoptions{cdmath=false}%
    \or% math
      \TUDoptions{cdmath=true}%
    \or% upgreek
      \TUDoptions{slantedgreek=false}%
    \or% slgreek
      \TUDoptions{slantedgreek=true}%
    \or% fontspec
      \TUDoptions{fontspec=true}%
    \or% nofontspec
      \TUDoptions{fontspec=false}%
    \fi%
  \else%
    \ifdimen{#1}{%
      \ifdim#1>\z@\relax%
        \TUD@KOMAoptions{fontsize=#1}%
        \csname @tud@fontsize@settrue\endcsname%
        \ifcase\tud@cdfont@num\relax% false to true
          \renewcommand*\tud@cdfont@num{1}%
          \bool@std@lock{@tud@cdmath}{true}%
          \TUD@SpecialOptionAtDocument{tud@font@set}%
        \fi%
        \FamilyKeyStateProcessed%
      \fi%
    }{}%
  \fi%
}
\newif\if@tud@relspacing
\TUD@key{relspacing}[true]{%
  \TUD@set@numkey{relspacing}{@tempa}{%
    \TUD@bool@numkey,%
    {absolute}{0},{classic}{0},{standard}{0},%
    {relative}{1},{fontsize}{1},{font}{1},{size}{1}%
  }{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \ifcase\@tempa\relax% false
      \@tud@relspacingfalse%
    \or% true
      \@tud@relspacingtrue%
    \fi%
    \TUD@SpecialOptionAtDocument{tud@font@skip@set}%
  \fi%
}
\DefineFamilyMember{KOMA}
\DefineFamilyKey{KOMA}{fontsize}{%
  \TUD@SpecialOptionAtDocument{tud@font@skip@set}%
  \FamilyKeyStateProcessed%
}
\bool@lock{@tud@cdmath}
\bool@std@lock{@tud@cdmath}{true}%
\TUD@key{cdmath}[true]{%
  \TUD@set@numkey{cdmath}{@tempa}{%
    \TUD@bool@numkey,%
    {serifmath}{0},{serif}{0},{nosansmath}{0},{nosans}{0},%
    {sansmath}{1},{sans}{1},%
    {upgreek}{2},{upright}{2},{uprightgreek}{2},{uprightGreek}{2},%
    {slgreek}{3},{slanted}{3},{slantedgreek}{3},{slantedGreek}{3}%
  }{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \ifcase\@tempa\relax% false
      \bool@set@lock{@tud@cdmath}{false}%
      \TUD@SpecialOptionAtDocument{tud@font@math@set}%
    \or% true
      \bool@set@lock{@tud@cdmath}{true}%
      \TUD@SpecialOptionAtDocument{tud@font@math@set}%
    \or% upgreek
      \TUDoptions{slantedgreek=false}%
    \or% slgreek
      \TUDoptions{slantedgreek=true}%
    \fi%
  \fi%
}
\bool@lock{@tud@slantedgreek}
\TUD@key{slantedgreek}[true]{%
  \TUD@set@ifkey{slantedgreek}{@tud@slantedgreek}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \bool@set@lock{@tud@slantedgreek}{#1}%
    \TUD@SpecialOptionAtDocument{tud@font@math@set}%
  \fi%
}
\TUD@key{slantedGreek}[true]{\TUDoptions{slantedgreek=#1}}
%%% From File: tudscr-area.dtx
\cs@lock{tud@cdgeometry@num}{0}
\newcommand*\tud@cdgeometry@calc@num{0}
\TUD@key{cdgeometry}[true]{%
  \let\@tempb\tud@cdgeometry@num%
  \let\@tempc\tud@cdgeometry@calc@num%
  \TUD@set@numkey{cdgeometry}{@tempa}{%
    \TUD@bool@numkey,%
    {typearea}{0},%
    {cd}{1},{tud}{1},{asymmetric}{1},%
    {symmetric}{2},{centred}{2},{centered}{2},%
    {normal}{2},{standard}{2},{std}{2},%
    {twoside}{3},{balanced}{3},%
    {oneside}{4},%
    {restricted}{5},%
    {adapted}{6},{adapt}{6},{adapting}{6},{unrestricted}{6},%
    {calculated}{7},{calc}{7},{calculate}{7},{calculating}{7},%
    {custom}{8},{user}{8},{package}{8}%
  }{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \ifcase\@tempa\relax% false/typearea
      \cs@set@lock{tud@cdgeometry@num}{0}%
    \or% true/cd
      \cs@set@lock{tud@cdgeometry@num}{2}%
    \or% symmetric
      \cs@set@lock{tud@cdgeometry@num}{3}%
    \or% twoside
      \cs@set@lock{tud@cdgeometry@num}{4}%
      \TUD@KOMAoptions{twoside=true}%
    \or% oneside
      \ifnum\tud@cdgeometry@num>\thr@@\relax%
        \cs@set@lock{tud@cdgeometry@num}{3}%
      \fi%
      \TUD@KOMAoptions{twoside=false}%
    \or% restricted
      \cs@std@lock{tud@cdgeometry@num}{2}%
      \renewcommand*\tud@cdgeometry@calc@num{0}%
    \or% adapted
      \cs@std@lock{tud@cdgeometry@num}{2}%
      \renewcommand*\tud@cdgeometry@calc@num{1}%
    \or% calculated
      \cs@std@lock{tud@cdgeometry@num}{2}%
      \renewcommand*\tud@cdgeometry@calc@num{2}%
    \or% custom
      \cs@set@lock{tud@cdgeometry@num}{1}%
    \fi%
    \@tempswafalse%
    \ifx\@tempb\tud@cdgeometry@num\relax\else\@tempswatrue\fi%
    \ifx\@tempc\tud@cdgeometry@calc@num\relax\else\@tempswatrue\fi%
    \if@tempswa%
      \TUD@SpecialOptionAtDocument{tud@cdgeometry@process}%
    \fi%
  \fi%
}
\newcommand*\tud@dim@extrabottommargin{\z@}
\TUD@key{extrabottommargin}{%
  \TUD@set@dimenkey{extrabottommargin}{\tud@dim@extrabottommargin}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \TUD@SpecialOptionAtDocument{tud@cdgeometry@@process}%
  \fi%
}
\newcommand*\tud@dim@bleedmargin{.2in}
\TUD@key{bleedmargin}{%
  \TUD@set@dimenkey{bleedmargin}{\tud@dim@bleedmargin}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \ifdim\dimexpr\tud@dim@bleedmargin\relax<\z@\relax%
      \def\@tempa-##1\@nil{\def\tud@dim@bleedmargin{##1}}%
      \@tempa#1\@nil%
    \fi%
  \fi%
}
\DefineFamilyMember{KOMA}
\DefineFamilyKey{KOMA}{twoside}{%
  \TUD@SpecialOptionAtDocument{tud@cdgeometry@@process}%
  \FamilyKeyStateProcessed%
}
\DefineFamilyKey{KOMA}{twocolumn}{%
  \TUD@SpecialOptionAtDocument{tud@cdgeometry@@process}%
  \FamilyKeyStateProcessed%
}
\newcommand*\tud@x@ta@warnings@off{}
\newcommand*\tud@x@ta@warnings@on{}
\IfFileExists{silence.sty}{%
  \RequirePackage{silence}[2012/07/02]%
  \WarningFilter[typearea]{typearea}{DIV for}%
  \WarningFilter[typearea]{typearea}{Bad type area settings!}%
  \WarningFilter[typearea]{typearea}{Maybe no optimal type area settings!}%
  \WarningFilter[typearea]{typearea}{Very low DIV value!}%
  \BeforePackage{typearea}{\ActivateWarningFilters[typearea]}%
  \AfterPackage{typearea}{\DeactivateWarningFilters[typearea]}%
  \renewcommand*\tud@x@ta@warnings@off{\ActivateWarningFilters[typearea]}
  \renewcommand*\tud@x@ta@warnings@on{\DeactivateWarningFilters[typearea]}
}{}
%%% From File: tudscr-pagestyle.dtx
\cs@lock{tud@head@font@num}{0}
\cs@lock{tud@head@bar@num}{0}
\bool@lock{@tud@head@widebar}
\newif\if@tud@head@font@set
\newif\if@tud@head@date
\TUD@key{cdhead}[true]{%
  \TUD@set@numkey{cdhead}{@tempa}{%
    \TUD@bool@numkey,%
    {nocd}{0},{nocdfont}{0},{nocdfonts}{0},{notudfonts}{0},%
    {cd}{1},{cdfont}{1},{cdfonts}{1},{tudfonts}{1},%
    {light}{1},{lightfont}{1},{lite}{1},{litefont}{1},{noheavyfont}{1},%
    {heavy}{2},{heavyfont}{2},{bold}{2},{boldfont}{2},%
    {nocolor}{3},{nocolour}{3},{monochrome}{3},{monochromatic}{3},%
    {colorlite}{4},{litecolor}{4},{colourlite}{4},{litecolour}{4},%
    {colorlight}{4},{lightcolor}{4},{colourlight}{4},{lightcolour}{4},%
    {pale}{4},{colorpale}{4},{palecolor}{4},{colourpale}{4},{palecolour}{4},%
    {colorbar}{5},{barcolor}{5},{colourbar}{5},{barcolour}{5},%
    {bicolor}{6},{bicolour}{6},{twocolor}{6},{twocolour}{6},%
    {bichrome}{6},{bichromatic}{6},{dichrome}{6},{dichromatic}{6},%
    {color}{6},{colour}{6},%
    {full}{6},{colorfull}{6},{fullcolor}{6},{colourfull}{6},{fullcolour}{6},%
    {textwidth}{7},{slim}{7},{slimhead}{7},{nowide}{7},{nowidehead}{7},%
    {narrow}{7},{narrowhead}{7},{small}{7},{smallhead}{7},%
    {paperwidth}{8},{wide}{8},{widehead}{8},%
    {date}{9},{showdate}{9},{dateon}{9},{datetrue}{9},{dateyes}{9},%
    {nodate}{10},{hidedate}{10},{dateoff}{10},{datefalse}{10},{dateno}{10}%
  }{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \ifcase\@tempa\relax% false
      \cs@set@lock{tud@head@font@num}{0}%
    \or% true
      \cs@set@lock{tud@head@font@num}{1}%
    \or% heavy
      \cs@set@lock{tud@head@font@num}{2}%
    \or% nocolor
      \cs@set@lock{tud@head@bar@num}{0}%
    \or% litecolor
      \cs@set@lock{tud@head@bar@num}{1}%
    \or% barcolor
      \cs@set@lock{tud@head@bar@num}{2}%
    \or% color
      \cs@set@lock{tud@head@bar@num}{3}%
    \or% textwidth
      \bool@set@lock{@tud@head@widebar}{false}%
    \or% paperwidth
      \bool@set@lock{@tud@head@widebar}{true}%
    \or% date
      \@tud@head@datetrue%
    \or% nodate
      \@tud@head@datefalse%
    \fi%
    \ifnum\@tempa<\thr@@\relax%
      \global\@tud@head@font@settrue%
    \fi%
  \fi%
}
\TUD@AfterPackage@set{scrlayer-scrpage}
\bool@lock{@tud@foot@colored}
\TUD@key{cdfoot}[true]{%
  \TUD@set@numkey{cdfoot}{@tempa}{%
    \TUD@bool@numkey,%
    {nocolor}{2},{nocolour}{2},{monochrome}{2},{monochromatic}{2},%
    {bicolor}{3},{bicolour}{3},{twocolor}{3},{twocolour}{3},%
    {bichrome}{3},{bichromatic}{3},{dichrome}{3},{dichromatic}{3},%
    {color}{3},{colour}{3},%
    {full}{3},{colorfull}{3},{fullcolor}{3},{colourfull}{3},{fullcolour}{3}%
  }{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \ifcase\@tempa\relax% false
      \TUD@AfterPackage@do{scrlayer-scrpage}{%
        \tud@ps@restore{scrheadings}%
        \tud@ps@restore{plain.scrheadings}%
        \tud@font@koma@unset{pageheadfoot}%
      }%
    \or% true
      \TUD@AfterPackage@do{scrlayer-scrpage}{%
        \tud@ps@store{scrheadings}%
        \tud@ps@store{plain.scrheadings}%
        \tud@font@koma@set{pageheadfoot}{\upshape}%
        \clearpairofpagestyles%
        \ofoot[\pagemark]{%
          \if@twoside\ifodd\value{page}\else\pagemark\quad\fi\fi%
          {\footnotesize\headmark}%
          \if@twoside\ifodd\value{page}\quad\pagemark\fi\else\quad\pagemark\fi%
        }%
        \ifx\@mkdouble\@gobble\else\KOMAoptions{automark}\fi%
      }%
    \or% nocolor
      \bool@set@lock{@tud@foot@colored}{false}%
    \or% color
      \bool@set@lock{@tud@foot@colored}{true}%
    \fi%
  \else%
    \ifdimen{#1}{\TUDoptions{extrabottommargin=#1}}{}%
  \fi%
}
\newcommand*\tud@ps@store[1]{%
  \tud@ps@@store{#1}{odd}{left}{head}%
  \tud@ps@@store{#1}{odd}{right}{head}%
  \tud@ps@@store{#1}{odd}{middle}{head}%
  \tud@ps@@store{#1}{even}{left}{head}%
  \tud@ps@@store{#1}{even}{right}{head}%
  \tud@ps@@store{#1}{even}{middle}{head}%
  \tud@ps@@store{#1}{odd}{left}{foot}%
  \tud@ps@@store{#1}{odd}{right}{foot}%
  \tud@ps@@store{#1}{odd}{middle}{foot}%
  \tud@ps@@store{#1}{even}{left}{foot}%
  \tud@ps@@store{#1}{even}{right}{foot}%
  \tud@ps@@store{#1}{even}{middle}{foot}%
}
\newcommand*\tud@ps@@store[4]{%
  \ifcsdef{@@tud@ps@#1@#2@#3@#4}{}{%
    \csletcs{@@tud@ps@#1@#2@#3@#4}{sls@ps@#1@#2@#3@#4}%
  }%
}
\newcommand*\tud@ps@restore[1]{%
  \tud@ps@@restore{#1}{odd}{left}{head}%
  \tud@ps@@restore{#1}{odd}{right}{head}%
  \tud@ps@@restore{#1}{odd}{middle}{head}%
  \tud@ps@@restore{#1}{even}{left}{head}%
  \tud@ps@@restore{#1}{even}{right}{head}%
  \tud@ps@@restore{#1}{even}{middle}{head}%
  \tud@ps@@restore{#1}{odd}{left}{foot}%
  \tud@ps@@restore{#1}{odd}{right}{foot}%
  \tud@ps@@restore{#1}{odd}{middle}{foot}%
  \tud@ps@@restore{#1}{even}{left}{foot}%
  \tud@ps@@restore{#1}{even}{right}{foot}%
  \tud@ps@@restore{#1}{even}{middle}{foot}%
}
\newcommand*\tud@ps@@restore[4]{%
  \ifcsdef{@@tud@ps@#1@#2@#3@#4}{%
    \csletcs{sls@ps@#1@#2@#3@#4}{@@tud@ps@#1@#2@#3@#4}%
    \csundef{@@tud@ps@#1@#2@#3@#4}%
  }{}%
}
\newcommand*\tud@dim@footlogoheight{}
\let\tud@dim@footlogoheight\relax
\TUD@key{footlogoheight}{%
  \TUD@set@dimenkey{footlogoheight}{\tud@dim@footlogoheight}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \ifdim\dimexpr\tud@dim@footlogoheight\relax<\z@\relax%
      \def\@tempa-##1\@nil{\def\tud@dim@footlogoheight{##1}}%
      \@tempa#1\@nil%
    \fi%
    \global\@tud@footlogo@option@settrue%
  \fi%
}
\newif\if@tud@ddc@internal
\newcommand*\tud@comp@clearpage{}%
\newcommand*\tud@comp@resetpagestyle{}%
\newcommand*\tud@ddc@switch{}
\edef\tud@ddc@switch{%
  \TUD@bool@numkey,%
  {color}{2},{colour}{2},{cdcolor}{2},{cdcolour}{2},%
  {colorblack}{3},{colourblack}{3},{cdcolorblack}{3},{cdcolourblack}{3},%
  {gray}{4},{grey}{4},{HKS92}{4},{cdgray}{4},{cdgrey}{4},%
  {black}{5},{cdblack}{5},%
  {blue}{6},{HKS41}{6},{cdblue}{6},{cddarkblue}{6},%
  {white}{7},{cdwhite}{7}%
}
\newif\if@tud@headlogo@option@set
\newif\if@tud@footlogo@option@set
\newif\if@tud@ddc@auto
\newcommand*\tud@ddc@auto@num{0}
\TUD@key{ddc}[true]{%
  \tud@comp@clearpage%
  \TUD@set@numkey{ddc}{tud@ddc@auto@num}{\tud@ddc@switch}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \if@tud@ddc@internal%
      \@tud@ddc@autofalse%
    \else%
      \@tud@ddc@autotrue%
      \@tud@ddc@internaltrue%
      \TUDoptions{ddchead=false}%
      \TUDoptions{ddcfoot=false}%
      \@tud@ddc@internalfalse%
    \fi%
    \global\@tud@headlogo@option@settrue%
    \global\@tud@footlogo@option@settrue%
  \fi%
  \tud@comp@resetpagestyle%
}
\newcommand*\tud@ddc@head@num{0}
\TUD@key{ddchead}[true]{%
  \tud@comp@clearpage%
  \TUD@set@numkey{ddchead}{tud@ddc@head@num}{\tud@ddc@switch}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \if@tud@ddc@internal\else%
      \@tud@ddc@internaltrue%
      \TUDoptions{ddcfoot=false}%
      \TUDoptions{ddc=false}%
      \@tud@ddc@internalfalse%
    \fi%
  \fi%
  \tud@comp@resetpagestyle%
}
\newcommand*\tud@ddc@foot@num{0}
\TUD@key{ddcfoot}[true]{%
  \tud@comp@clearpage%
  \TUD@set@numkey{ddcfoot}{tud@ddc@foot@num}{\tud@ddc@switch}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \if@tud@ddc@internal\else%
      \@tud@ddc@internaltrue%
      \TUDoptions{ddchead=false}%
      \TUDoptions{ddc=false}%
      \@tud@ddc@internalfalse%
    \fi%
  \fi%
  \tud@comp@resetpagestyle%
}
%%% From File: tudscr-layout.dtx
\newcommand*\tud@layout@switch{}
\edef\tud@layout@switch{%
  \TUD@bool@numkey,%
  {nocolor}{1},{nocolour}{1},{monochrome}{1},{monochromatic}{1},%
  {lite}{2},{colorlite}{2},{litecolor}{2},{colourlite}{2},{litecolour}{2},%
  {light}{2},{colorlight}{2},{lightcolor}{2},{colourlight}{2},{lightcolour}{2},%
  {pale}{2},{colorpale}{2},{palecolor}{2},{colourpale}{2},{palecolour}{2},%
  {colorbar}{3},{barcolor}{3},{colourbar}{3},{barcolour}{3},%
  {bicolor}{4},{bicolour}{4},{twocolor}{4},{twocolour}{4},%
  {bichrome}{4},{bichromatic}{4},{dichrome}{4},{dichromatic}{4},%
  {color}{5},{colour}{5},%
  {full}{6},{colorfull}{6},{fullcolor}{6},{colourfull}{6},{fullcolour}{6}%
}
\cs@lock{tud@layout@title@num}{0}
\cs@lock{tud@layout@part@num}{0}
\cs@lock{tud@layout@section@num}{0}
\newcommand*\tud@cd@num{0}
\TUD@key{cd}[true]{%
  \TUD@set@numkey{cd}{tud@cd@num}{\tud@layout@switch}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \ifcase\tud@cd@num\relax% false
      \cs@std@lock{tud@layout@title@num}{0}%
      \cs@std@lock{tud@layout@part@num}{0}%
      \cs@std@lock{tud@layout@section@num}{0}%
    \or% true
      \cs@std@lock{tud@layout@title@num}{1}%
      \cs@std@lock{tud@layout@part@num}{1}%
      \cs@std@lock{tud@layout@section@num}{1}%
    \or% litecolor
      \cs@std@lock{tud@layout@title@num}{2}%
      \cs@std@lock{tud@layout@part@num}{2}%
      \cs@std@lock{tud@layout@section@num}{2}%
    \or% barcolor
      \cs@std@lock{tud@layout@title@num}{3}%
      \cs@std@lock{tud@layout@part@num}{3}%
      \cs@std@lock{tud@layout@section@num}{2}%
    \or% bicolor
      \cs@std@lock{tud@layout@title@num}{4}%
      \cs@std@lock{tud@layout@part@num}{4}%
      \cs@std@lock{tud@layout@section@num}{2}%
    \or% color
      \cs@std@lock{tud@layout@title@num}{5}%
      \cs@std@lock{tud@layout@part@num}{5}%
      \cs@std@lock{tud@layout@section@num}{2}%
    \or% full
      \cs@std@lock{tud@layout@title@num}{6}%
      \cs@std@lock{tud@layout@part@num}{6}%
      \cs@std@lock{tud@layout@section@num}{2}%
    \fi%
    \TUD@SpecialOptionAtDocument{tud@layout@process}%
    \if@atdocument\else%
      \ifcase\tud@cd@num\relax% false
        \cs@std@lock{tud@cdgeometry@num}{0}%
      \else% !false
        \cs@std@lock{tud@cdgeometry@num}{2}%
      \fi%
    \fi%
  \fi%
}
\TUD@key{cdtitle}[true]{%
  \TUD@set@numkey{cdtitle}{@tempa}{\tud@layout@switch}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \ifcase\@tempa\relax% false
      \cs@set@lock{tud@layout@title@num}{0}%
    \or% true
      \cs@set@lock{tud@layout@title@num}{1}%
    \or% litecolor
      \cs@set@lock{tud@layout@title@num}{2}%
    \or% barcolor
      \cs@set@lock{tud@layout@title@num}{3}%
    \or% bicolor
      \cs@set@lock{tud@layout@title@num}{4}%
    \or% color
      \cs@set@lock{tud@layout@title@num}{5}%
    \or% full
      \cs@set@lock{tud@layout@title@num}{6}%
    \fi%
    \TUD@SpecialOptionAtDocument{tud@layout@process}%
  \fi%
}
\TUD@key{cdpart}[true]{%
  \TUD@set@numkey{cdpart}{@tempa}{\tud@layout@switch}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \ifcase\@tempa\relax% false
      \cs@set@lock{tud@layout@part@num}{0}%
    \or% true
      \cs@set@lock{tud@layout@part@num}{1}%
    \or% litecolor
      \cs@set@lock{tud@layout@part@num}{2}%
    \or% barcolor
      \cs@set@lock{tud@layout@part@num}{3}%
    \or% bicolor
      \cs@set@lock{tud@layout@part@num}{4}%
    \or% color
      \cs@set@lock{tud@layout@part@num}{5}%
    \or% full
      \cs@set@lock{tud@layout@part@num}{6}%
    \fi%
    \TUD@SpecialOptionAtDocument{tud@layout@process}%
  \fi%
}
\TUD@key{cdsection}[true]{%
  \TUD@set@numkey{cdsection}{@tempa}{\tud@layout@switch}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \ifcase\@tempa\relax% false
      \cs@set@lock{tud@layout@section@num}{0}%
    \or% true
      \cs@set@lock{tud@layout@section@num}{1}%
    \else% *color
      \cs@set@lock{tud@layout@section@num}{2}%
    \fi%
    \TUD@SpecialOptionAtDocument{tud@layout@process}%
  \fi%
}
\newcommand*\tud@pagecolor{}%
\TUD@key{backgroundcolor}[true]{%
  \TUD@set@numkey{backgroundcolor}{@tempa}{%
    \TUD@bool@numkey,%
    {nocolor}{0},{nocolour}{0},{none}{0},%
    {color}{1},{colour}{1},{cdcolor}{1},{cdcolour}{1}%
  }{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \ifcase\@tempa\relax% false
      \renewcommand*\tud@pagecolor{}%
    \else% true
      \renewcommand*\tud@pagecolor{HKS41}%
    \fi%
  \else%
    \renewcommand*\tud@pagecolor{#1}%
    \FamilyKeyStateProcessed%
  \fi%
  \if@atdocument%
    \ifdefvoid{\tud@pagecolor}{}{\sbox\z@{\color{\tud@pagecolor}}}%
    \normalcolor%
  \fi%
}
\AfterPackage{xcolor}{%
  \CheckCommand*\normalcolor{\let\current@color\default@color\set@color}%
  \apptocmd{\normalcolor}{%
    \ifstr{\tud@pagecolor}{HKS41}{\color{white}}{}%
  }{}{\tud@patch@wrn{normalcolor}}%
  \AtBeginDocument{%
    \ifdefvoid{\tud@pagecolor}{}{\sbox\z@{\color{\tud@pagecolor}}}%
    \normalcolor%
  }%
}
\DefineFamilyMember{KOMA}
\DefineFamilyKey{KOMA}{headings}{%
  \TUD@SpecialOptionAtDocument{tud@x@scr@headings@reset}%
  \FamilyKeyStateProcessed%
}
\DefineFamilyKey{KOMA}{open}{%
  \TUD@SpecialOptionAtDocument{tud@x@scr@headings@reset}%
  \FamilyKeyStateProcessed%
}
\DefineFamilyKey{KOMA}{chapterprefix}{%
  \TUD@SpecialOptionAtDocument{tud@x@scr@headings@reset}%
  \FamilyKeyStateProcessed%
}
%%% From File: tudscr-title.dtx
\DefineFamilyMember{KOMA}
\DefineFamilyKey{KOMA}{titlepage}[true]{%
  \TUD@set@numkey{titlepage}{@tempa}{\TUD@bool@numkey,{firstiscover}{2}}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \AtEndOfFamilyOptions{\tud@titlepage@deactivate}%
  \fi%
}
\newcommand*\tud@titlepage@deactivate{%
  \if@titlepage%
    \KOMAoptions{titlepage=false}%
    \ClassWarning{\TUD@Class@Name}{%
      The class `\TUD@Class@Name' can't be used with\MessageBreak%
      activated titlepage option. It will be enforced to\MessageBreak%
      `titlepage=false'%
    }%
    \renewcommand*\tud@titlepage@deactivate{%
      \if@titlepage\KOMAoptions{titlepage=false}\fi%
    }%
  \fi%
}
\AtBeginDocument{\tud@titlepage@deactivate}
%%% From File: tudscr-frontmatter.dtx
\newcommand*\tud@fm@switch{%
  {section}{2},{sect}{2},{sec}{2},{addsec}{2},%
  {new}{2},{standard}{2},{heading}{2},%
}
\newcommand*\tud@abstract@level@num{0}
\TUD@key{abstract}[true]{%
  \edef\@tempb{\TUD@bool@numkey,\tud@fm@switch}%
  \TUD@set@numkey{abstract}{@tempa}{\@tempb}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \ifcase\@tempa\relax% false
      \renewcommand*\tud@abstract@level@num{0}%
    \or% true
      \renewcommand*\tud@abstract@level@num{1}%
    \or% section
      \renewcommand*\tud@abstract@level@num{2}%
    \fi%
  \fi%
}
\DefineFamilyMember{KOMA}
\DefineFamilyKey{KOMA}{abstract}[true]{%
  \AtEndOfFamilyOptions{\TUDoptions{abstract=#1}}%
}
%%% From File: tudscr-comp.dtx
\newcommand*\TUD@deprecated@key[2]{%
  \ClassWarning{\TUD@Class@Name}%
  {%
    The option key `#1' is deprecated\MessageBreak%
    It's recommended to use `#2'\MessageBreak%
    instead%
  }%
  \TUDoptions{#2}%
}
\newcommand*\tud@v@comp{\tud@v@last}
\TUD@key{tudscrver}[last]{%
  \tud@v@get\@tempa{#1}%
  \ifcsundef{tud@v@\@tempa}{%
    \ClassWarningNoLine{\TUD@Class@Name}%
    {%
      You have set option `tudscrver' to `\@tempa', but\MessageBreak%
      this value is not supported. Because of this, the\MessageBreak%
      value for `tudscrver' was set to `first'%
    }%
    \def\tud@v@comp{0}%
  }{%
    \ClassInfoNoLine{\TUD@Class@Name}%
    {%
      Switching compatibility level to `\@tempa'%
    }%
    \edef\tud@v@comp{\csuse{tud@v@\@tempa}}%
  }%
  \FamilyKeyStateProcessed%
}
\AtEndOfClass%
{%
  \TUD@key{tudscrver}[]{%
    \ClassError{\TUD@Class@Name}%
    {Option `tudscrver' too late}{%
      Option `tudscrver' can only be set while loading the\MessageBreak%
      class `\TUD@Class@Name'
      but you have tried to set it up later.%
    }%
    \FamilyKeyStateProcessed%
  }%
  \ifcsdef{scr@v@\TUD@Version@KOMA}{%
    \ifnum\scr@compatibility<\csuse{scr@v@3.12}\relax%
      \ClassError{\TUD@Class@Name}{%
        KOMA-Script compatibility level too low%
      }{%
        \TUD@Version\space must be used at least with\MessageBreak%
        `version=3.12' KOMA-Script compatibility option.%
      }%
    \fi%
  }{%
    \ClassError{\TUD@Class@Name}{%
      KOMA-Script v\TUD@Version@KOMA is required%
    }{%
      \TUD@Version\space must at least be used with\MessageBreak%
      KOMA-Script v\TUD@Version@KOMA, but \KOMAScriptVersion is used.%
    }%
  }%
}
\csdef{tud@v@first}{0}
\csdef{tud@v@2.00}{0}
\csdef{tud@v@2.01}{0}
\csdef{tud@v@2.01a}{0}
\csdef{tud@v@2.01b}{0}
\csdef{tud@v@2.02}{0}
\csdef{tud@v@2.02}{0}
\csdef{tud@v@2.03}{1}
\csdef{tud@v@2.03a}{1}
\csdef{tud@v@2.04}{2}
\csdef{tud@v@2.04a}{2}
\csdef{tud@v@2.04b}{2}
\csdef{tud@v@2.04c}{2}
\csdef{tud@v@2.04d}{2}
\csdef{tud@v@2.04e}{2}
\csdef{tud@v@2.05}{3}
\csdef{tud@v@2.05a}{3}
\csdef{tud@v@2.05b}{3}
\csdef{tud@v@2.05c}{3}
\csdef{tud@v@2.05d}{3}
\csdef{tud@v@2.05e}{3}
\csdef{tud@v@2.05f}{3}
\csdef{tud@v@2.05g}{3}
\csdef{tud@v@2.05h}{3}
\csdef{tud@v@2.05i}{3}
\csdef{tud@v@2.05k}{3}
\csdef{tud@v@2.05l}{3}
\csdef{tud@v@2.05m}{3}
\csdef{tud@v@last}{3}
\newcommand*\tud@v@get[2]{%
  \begingroup%
    \def\@tempa{\kernel@ifnextchar v{\@tempb}{\@tempb v}}%
    \def\@tempb v##1\@nil{\def\@tempc{##1}}%
    \@tempa #2\@nil%
    \edef\tud@reserved{%
      \endgroup%
      \etex@unexpanded{\def#1}{\@tempc}%
    }%
  \tud@reserved%
}
\newcommand*\tud@if@v@lower[1]{%
  \begingroup%
    \tud@v@get\@tempa{#1}%
    \ifcsdef{tud@v@\@tempa}{%
      \ifnum\tud@v@comp<\csuse{tud@v@\@tempa}\relax%
        \def\tud@reserved{\endgroup\@firstoftwo}%
      \else%
        \def\tud@reserved{\endgroup\@secondoftwo}%
      \fi%
    }{%
      \def\tud@reserved{%
        \ClassWarningNoLine{\TUD@Class@Name}%
        {%
          Erroneous usage of `\string\tud@if@v@lower'.\MessageBreak%
          There's no defined macro `\string\tud@v@\@tempa'%
        }%
        \endgroup\@firstoftwo%
      }%
    }%
  \tud@reserved%
}
\TUD@key{fontspec}[true]{%
  \ClassWarningNoLine{\TUD@Class@Name}%
  {%
    The option key `fontspec' is deprecated\MessageBreak%
    You should load the package `fontspec' manually%
  }%
  \TUD@set@ifkey{fontspec}{@tud@x@fontspec@enabled}{#1}%
}
\AtEndOfClass%
{%
  \TUD@key{fontspec}[]%
  {%
    \ClassError{\TUD@Class@Name}%
      {Option `fontspec' too late}{%
      Option `fontspec' can only be set while loading the\MessageBreak%
      class `\TUD@Class@Name'
      but you have tried to set it up later.%
    }%
    \FamilyKeyStateProcessed%
  }%
  \if@tud@x@fontspec@enabled%
    \RequirePackage{fontspec}[2017/01/24]%
  \fi%
}
\TUD@key{cdfonts}[true]{%
  \TUD@set@ifkey{cdfonts}{@tempswa}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \if@tempswa%
      \TUD@deprecated@key{cdfonts=#1}{cdfont=true}%
    \else%
      \TUD@deprecated@key{cdfonts=#1}{cdfont=false}%
    \fi%
  \fi%
}
\TUD@key{tudfonts}[true]{%
  \TUD@set@ifkey{tudfonts}{@tempswa}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \if@tempswa%
      \TUD@deprecated@key{tudfonts=#1}{cdfont=true}%
    \else%
      \TUD@deprecated@key{tudfonts=#1}{cdfont=false}%
    \fi%
  \fi%
}
\TUD@key{heavyfont}[true]{%
  \TUD@set@ifkey{heavyfont}{@tempswa}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \if@tempswa%
      \TUD@deprecated@key{heavyfont}{cdfont=heavy}%
    \else%
      \TUD@deprecated@key{heavyfont=#1}{cdfont=true}%
    \fi%
  \fi%
}
\TUD@key{din}[true]{%
  \TUD@set@ifkey{din}{@tempswa}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \if@tempswa%
      \TUD@deprecated@key{din}{cdfont=din}%
    \else%
      \TUD@deprecated@key{din=#1}{cdfont=nodin}%
    \fi%
  \fi%
}
\TUD@key{nodin}[true]{%
  \TUD@set@ifkey{nodin}{@tempswa}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \if@tempswa%
      \TUD@deprecated@key{nodin}{cdfont=nodin}%
    \else%
      \TUD@deprecated@key{nodin=#1}{cdfont=din}%
    \fi%
  \fi%
}
\TUD@key{noDIN}[true]{%
  \TUD@set@ifkey{noDIN}{@tempswa}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \if@tempswa%
      \TUD@deprecated@key{noDIN}{cdfont=nodin}%
    \else%
      \TUD@deprecated@key{noDIN=#1}{cdfont=din}%
    \fi%
  \fi%
}
\TUD@key{sansmath}[true]{%
  \TUD@set@ifkey{sansmath}{@tempswa}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \if@tempswa%
      \TUD@deprecated@key{sansmath}{cdmath=true}%
    \else%
      \TUD@deprecated@key{sansmath=#1}{cdmath=false}%
    \fi%
  \fi%
}
\TUD@key{serifmath}[true]{%
  \TUD@set@ifkey{serifmath}{@tempswa}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \if@tempswa%
      \TUD@deprecated@key{serifmath}{cdmath=false}%
    \else%
      \TUD@deprecated@key{serifmath=#1}{cdmath=true}%
    \fi%
  \fi%
}
\TUD@key{geometry}[true]{\TUD@deprecated@key{geometry=#1}{cdgeometry=#1}}
\TUD@key{barfont}[true]{%
  \TUD@set@numkey{barfont}{@tempa}{%
    \TUD@bool@numkey,%
    {nocd}{0},{nocdfont}{0},{nocdfonts}{0},{notudfonts}{0},%
    {cd}{1},{cdfont}{1},{cdfonts}{1},{tudfonts}{1},%
    {light}{1},{lightfont}{1},{lite}{1},{litefont}{1},{noheavyfont}{1},%
    {heavy}{2},{heavyfont}{2},{bold}{2},{boldfont}{2}%
  }{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \ifcase\@tempa\relax% false
      \TUD@deprecated@key{barfont=#1}{cdhead=false}%
    \or% true
      \TUD@deprecated@key{barfont=#1}{cdhead=true}%
    \or% heavy
      \TUD@deprecated@key{barfont=#1}{cdhead=heavy}%
    \fi%
  \fi%
}
\TUD@key{widehead}[true]{%
  \TUD@set@ifkey{widehead}{@tempswa}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \if@tempswa%
      \TUD@deprecated@key{widehead}{cdhead=paperwidth}%
    \else%
      \TUD@deprecated@key{widehead=#1}{cdhead=textwidth}%
    \fi%
  \fi%
}
\TUD@key{tudfoot}[true]{%
  \TUD@set@ifkey{tudfoot}{@tempswa}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \if@tempswa%
      \TUD@deprecated@key{tudfoot}{cdfoot=true}%
    \else%
      \TUD@deprecated@key{tudfoot=#1}{cdfoot=false}%
    \fi%
  \fi%
}
\TUD@key{color}[true]{%
  \TUD@set@numkey{color}{@tempa}{%
    \TUD@bool@numkey,%
    {nocolor}{0},{nocolour}{0},{monochrome}{0},{monochromatic}{0},%
    {color}{1},{colour}{1},%
    {lite}{2},{light}{2},{pale}{2},%
    {colorlite}{2},{litecolor}{2},{colourlite}{2},{litecolour}{2},%
    {colorlight}{2},{lightcolor}{2},{colourlight}{2},{lightcolour}{2},%
    {colorpale}{2},{palecolor}{2},{colourpale}{2},{palecolour}{2},%
    {bicolor}{3},{bicolour}{3},{twocolor}{3},{twocolour}{3},%
    {bichrome}{3},{bichromatic}{3},{dichrome}{3},{dichromatic}{3},%
    {full}{4},{colorfull}{4},{fullcolor}{4},{colourfull}{4},{fullcolour}{4}%
  }{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \ifcase\@tempa\relax% false
      \TUD@deprecated@key{color=#1}{cd=true}%
    \or% true
      \TUD@deprecated@key{color=#1}{cd=color}%
    \or% litecolor
      \TUD@deprecated@key{color=#1}{cd=pale}%
    \or% bicolor
      \TUD@deprecated@key{color=#1}{cd=bicolor}%
    \or% full
      \TUD@deprecated@key{color=#1}{cd=fullcolor}%
    \fi%
  \fi%
}
\TUD@key{colour}[true]{\TUDoptions{color=#1}}
%%% From File: tudscr-misc.dtx
\newif\if@tud@x@scr@paper@set
\TUD@key{paper}{%
  \tud@lowerstring{\@tempa}{#1}%
  \def\@tempb##1##2\@nil{%
    \@tempswafalse%
    \if ##1a\@tempswatrue%
      \else\if ##1b\@tempswatrue%
        \else\if ##1c\@tempswatrue%
          \else\if ##1d\@tempswatrue%
    \fi\fi\fi\fi%
    \if@tempswa%
      \ifnumber{##2}{}{\@tempswafalse}%
    \fi%
  }%
  \expandafter\@tempb\@tempa\@nil%
  \if@tempswa\else%
    \def\@tempb##1:##2:##3\@nil{%
      \edef\@tempc{##1}%
      \ifx\@tempc\@empty\@tempswafalse\else%
        \edef\@tempc{##2}%
        \ifx\@tempc\@empty\@tempswafalse\else\@tempswatrue\fi%
      \fi%
    }%
    \expandafter\@tempb\@tempa::\@nil%
  \fi%
  \@tud@x@scr@paper@setfalse%
  \if@tempswa%
    \ifstr{\@tempa}{a4}{}{\@tud@x@scr@paper@settrue}%
    \FamilyKeyStateProcessed%
  \else%
    \FamilyKeyStateUnknownValue%
  \fi%
}
\newif\if@tud@fontsize@set
\TUD@key{fontsize}{%
  \@tud@fontsize@settrue%
  \PassOptionsToClass{fontsize=#1}{\TUD@Class@KOMA}%
  \FamilyKeyStateProcessed%
}
\AtEndOfClass{%
  \RelaxFamilyKey{TUD}{paper}%
  \RelaxFamilyKey{TUD}{fontsize}%
  \ifboolexpr{bool {@tud@x@scr@paper@set} or bool {@landscape}}{%
    \if@tud@fontsize@set\else%
      \ClassWarningNoLine{\TUD@Class@Name}{%
        You've set a paper size, which is different from\MessageBreak%
        default (paper=a4, paper=portrait). Therefore you\MessageBreak%
        should additionally specify an explicit font size.\MessageBreak%
        See the manual for further information%
      }%
    \fi%
  }{}%
}
\newif\if@tud@bookmarks
\TUD@ifkey{tudbookmarks}{@tud@bookmarks}
\newif\if@tud@symbolheadings
\TUD@key{footnotes}{%
  \TUD@set@numkey{footnotes}{@tempa}{%
    {nosymbolheadings}{0},{numberheadings}{0},%
    {symbolheadings}{1}%
  }{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed%
    \ifcase\@tempa\relax% nosymbolheadings
      \@tud@symbolheadingsfalse%
    \or% symbolheadings
      \@tud@symbolheadingstrue%
    \fi%
  \fi%
}
\AtEndOfClass{%
  \newcounter{symbolheadings}
}
%%% From File: tudscr-misc.dtx
\newcommand*\TUD@SpecialOptionAtDocument[1]{}
\newcommand*\tud@x@scr@paper{%
  \expandafter\tud@x@scr@@paper\CurrentOption paper\tud@x@scr@@paper%
}
\newcommand*\tud@x@scr@@paper{}
\def\tud@x@scr@@paper #1#2paper#3\tud@x@scr@@paper{%
  \@tempswafalse%
  \ifstr{#3}{paper}{\ifnumber{#2}{%
    \ifstr{#1}{a}{\@tempswatrue}{%
    \ifstr{#1}{b}{\@tempswatrue}{%
    \ifstr{#1}{c}{\@tempswatrue}{%
    \ifstr{#1}{d}{\@tempswatrue}{%
    }}}}%
  }{}}{}%
  \if@tempswa\TUDExecuteOptions{#3=#1#2}\fi%
  \PassOptionsToClass{\CurrentOption}{\TUD@Class@KOMA}%
}
\DeclareOption*{\tud@x@scr@paper}
\TUDExecuteOptions{%
  cd=bicolor,relspacing=true,tudbookmarks=false,cdfont=ultrabold%
}
\TUDProcessOptions\relax
\LoadClass{\TUD@Class@KOMA}[2015/04/23]
%%% From File: tudscr-base.dtx
\RequirePackage{environ}[2013/04/01]
\cs@lock{tud@x@multicol@num}{1}
\newcommand*\tud@x@multicol@check{%
  \ifnum\tud@x@multicol@num>\@ne\relax%
    \ClassWarning{\TUD@Class@Name}{%
      The option `columns=\tud@x@multicol@num' is only\MessageBreak%
      supported, when package `multicol' is loaded%
    }%
    \cs@set@lock{tud@x@multicol@num}{1}%
  \fi%
}
\AfterPackage{multicol}{\renewcommand*\tud@x@multicol@check{\relax}}
\AtEndPreamble{%
  \@ifpackageloaded{graphicx}{}{%
    \@ifpackageloaded{graphics}{%
      \ClassWarningNoLine{\TUD@Class@Name}{%
        Package `graphics' was superseded by `graphicx',\MessageBreak%
        which now will be loaded automatically%
      }%
    }{}%
    \RequirePackage{graphicx}[1999/02/16]%
  }%
  \RequirePackage{tudscrcolor}[\TUD@Version]%
}
%%% From File: tudscr-fonts.dtx
\newcommand*\tud@univers{lun}
\newif\if@tud@univers
\newif\if@tud@universmath
\newcommand*\tud@dinbold{0m6}
\newif\if@tud@dinbold
\newif\if@tud@dinboldmath
\newcommand*\tud@font@check{%
  \edef\@tempa##1##2{\lowercase{\noexpand\IfFileExists{##1##2.fd}}}%
  \def\@tempb##1{%
    \if@tud@cdmath%
      \tud@font@math@missing@wrn{##1}%
    \fi%
  }%
  \@tempa{OT1}{\tud@univers}{\@tud@universmathtrue}{\@tempb{Univers}}%
  \@tempa{OT1}{\tud@dinbold}{\@tud@dinboldmathtrue}{\@tempb{DIN-Bold}}%
  \if@tud@cdmath%
    \ifboolexpr{bool {@tud@universmath} and bool {@tud@dinboldmath}}{}{%
      \bool@set@lock{@tud@cdmath}{false}%
    }%
  \fi%
  \if@tud@x@fontspec@enabled%
    \def\@tempc##1##2{%
      \IfFontExistsTF{##1}{}{%
        ##2%
        \ifnum\tud@cdfont@num>\z@\relax% true/heavy
          \tud@font@missing@wrn{##1}%
        \fi%
      }%
    }%
    \@tud@universtrue%
    \@tempc{Univers Light}{\@tud@universfalse}%
    \@tempc{Univers}{\@tud@universfalse}%
    \@tempc{Univers Bold}{\@tud@universfalse}%
    \@tempc{Univers Black}{\@tud@universfalse}%
    \@tempc{Univers LightOblique}{\@tud@universfalse}%
    \@tempc{Univers Oblique}{\@tud@universfalse}%
    \@tempc{Univers BoldOblique}{\@tud@universfalse}%
    \@tempc{Univers BlackOblique}{\@tud@universfalse}%
    \@tud@dinboldtrue%
    \@tempc{DIN-Bold}{\@tud@dinboldfalse}%
  \else%
    \def\@tempc##1{%
      \ifnum\tud@cdfont@num>\z@\relax% true/heavy
        \tud@font@missing@wrn{##1}%
      \fi%
    }%
    \expandafter\@tempa\expandafter{\encodingdefault}%
      {\tud@univers}{\@tud@universtrue}{\@tempc{Univers}}%
    \expandafter\@tempa\expandafter{\encodingdefault}%
      {\tud@dinbold}{\@tud@dinboldtrue}{\@tempc{DIN-Bold}}%
  \fi%
  \ifboolexpr{bool {@tud@univers} and bool {@tud@dinbold}}{}{%
    \renewcommand*\tud@cdfont@num{0}%
    \bool@std@lock{@tud@cdmath}{false}%
  }%
  \undef\tud@font@check%
}
\newcommand*\tud@font@missing@wrn[1]{%
  \begingroup%
    \def\@tempa{%
      `#1' font not found for `\encodingdefault' encoding.\MessageBreak%
    }%
    \if@tud@x@fontspec@enabled%
      \appto\@tempa{%
        It seems, you haven't installed the required\MessageBreak%
        OTF-font on your system%
      }%
    \else%
      \ifstr{TU}{\encodingdefault}{%
        \appto\@tempa{%
          You should load package `fontspec'\MessageBreak%
          or %
        }%
      }{%
         \appto\@tempa{Please }%
      }%
      \@tempswafalse%
      \ifstr{OT1}{\encodingdefault}{\@tempswatrue}{}%
      \ifstr{T1}{\encodingdefault}{\@tempswatrue}{}%
      \if@tempswa%
        \appto\@tempa{%
          use one of the installation scripts listed\MessageBreak%
          in the TUD-Script manual%
        }%
      \else%
        \appto\@tempa{%
          choose a possible encoding with\MessageBreak%
          package `fontenc' (`OT1' or `T1')%
        }%
      \fi%
    \fi%
    \appto\@tempa{.\MessageBreak A fallback layout is used}%
    \ClassWarning{\TUD@Class@Name}{\@tempa}%
  \endgroup%
}
\newcommand*\tud@font@math@missing@wrn[1]{%
  \ClassWarning{\TUD@Class@Name}%
  {%
    `#1' fonts for math typesetting not found.\MessageBreak%
    Please use one of the installation scripts listed\MessageBreak%
    in the TUD-Script manual%
  }%
}
\begingroup
\catcode`\^=7
\catcode30=12
\catcode`\!=12
\edef\tud@reserved{\@gobble^^^^0021}
\expandafter\endgroup
\ifx\tud@reserved\@empty\relax
  \RequirePackage{newunicodechar}[2012/11/12]%
  \uccode"00DF="1E9E%
  \lccode"1E9E="00DF%
  \newunicodechar{^^^^00df}{\iffontchar\font"00DF \symbol{"00DF}\else ss\fi}%
  \newunicodechar{^^^^1e9e}{\iffontchar\font"1E9E \symbol{"1E9E}\else SS\fi}%
\fi
\newcommand*\tud@raggedright{\raggedright}
\newcommand*\tud@RaggedRight{\raggedright}
\AfterPackage*{ragged2e}{%
  \ifdef{\LaTeXraggedright}{%
    \renewcommand*\tud@raggedright{\LaTeXraggedright}%
  }{}%
  \renewcommand*\tud@RaggedRight{\RaggedRight}%
}
\newif\if@tud@x@siunitx@enabled
\AfterPackage*{siunitx}{%
  \@tud@x@siunitx@enabledtrue%
  \providecommand*\lseries{\fontseries{l}\selectfont}%
}
\newif\if@tud@x@bm@requested
\PreventPackageFromLoading[\@tud@x@bm@requestedtrue]{bm}
\RequirePackage{trimspaces}[2009/09/17]
\newif\if@tud@x@mweights@enabled
\AfterPackage*{mweights}{\@tud@x@mweights@enabledtrue}
\newcommand*\tud@font@set{%
  \if@atdocument%
    \ifnum\tud@cdfont@num>\z@\relax% true/heavy
      \if@tud@univers\else%
        \tud@font@missing@wrn{Univers}%
      \fi%
      \if@tud@dinbold\else%
        \tud@font@missing@wrn{DIN-Bold}%
      \fi%
      \ifboolexpr{bool {@tud@univers} and bool {@tud@dinbold}}{}{%
        \renewcommand*\tud@cdfont@num{0}%
        \bool@std@lock{@tud@cdmath}{false}%
      }%
    \fi%
  \fi%
  \ifcase\tud@cdfont@num\relax% false
    \tud@cmd@restore{rmdefault}%
    \tud@cmd@restore{sfdefault}%
    \tud@cmd@restore{ttdefault}%
    \tud@cmd@restore{bfdefault}%
    \tud@cmd@restore{mddefault}%
    \tud@cmd@restore{itdefault}%
    \tud@cmd@restore{familydefault}%
    \tud@cmd@restore{seriesdefault}%
    \tud@cmd@restore{shapedefault}%
    \if@tud@x@mweights@enabled%
      \tud@cmd@restore{bfseries@rm}%
      \tud@cmd@restore{bfseries@sf}%
      \tud@cmd@restore{bfseries@tt}%
      \tud@cmd@restore{mdseries@rm}%
      \tud@cmd@restore{mdseries@sf}%
      \tud@cmd@restore{mdseries@tt}%
    \fi%
    \ifcase\tud@cd@num\relax% false
      \cs@std@lock{tud@head@font@num}{0}%
    \else% !false
      \cs@std@lock{tud@head@font@num}{1}%
    \fi%
  \else% true/heavy
    \tud@cmd@store{rmdefault}%
    \tud@cmd@store{sfdefault}%
    \tud@cmd@store{ttdefault}%
    \tud@cmd@store{bfdefault}%
    \tud@cmd@store{mddefault}%
    \tud@cmd@store{itdefault}%
    \tud@cmd@store{familydefault}%
    \tud@cmd@store{seriesdefault}%
    \tud@cmd@store{shapedefault}%
    \if@tud@x@mweights@enabled%
      \tud@cmd@store{bfseries@rm}%
      \tud@cmd@store{bfseries@sf}%
      \tud@cmd@store{bfseries@tt}%
      \tud@cmd@store{mdseries@rm}%
      \tud@cmd@store{mdseries@sf}%
      \tud@cmd@store{mdseries@tt}%
    \fi%
    \cs@std@lock{tud@head@font@num}{\tud@cdfont@num}%
    \if@tud@univers%
      \if@tud@x@fontspec@enabled%
        \setsansfont{Univers}[\tud@x@fontspec@set@univ]%
        \setmonofont{LMMono10-Regular}[%
          BoldFont={},%
          ItalicFont={},%
          BoldItalicFont={},%
          SmallCapsFont={},%
          FontFace={l}{\updefault}{LMMonoLt10-Regular},%
          FontFace={m}{\updefault}{LMMono10-Regular},%
          FontFace={b}{\updefault}{LMMonoLt10-Bold},%
          FontFace={bx}{\updefault}{LMMonoLt10-Bold},%
          FontFace={eb}{\updefault}{LMMonoLt10-Bold},%
          FontFace={l}{\sldefault}{LMMonoLt10-Oblique},%
          FontFace={m}{\sldefault}{LMMonoSlant10-Regular},%
          FontFace={b}{\sldefault}{LMMonoLt10-BoldOblique},%
          FontFace={bx}{\sldefault}{LMMonoLt10-BoldOblique},%
          FontFace={eb}{\sldefault}{LMMonoLt10-BoldOblique},%
          NFSSFamily=\tud@univers t%
        ]%
      \else%
        \renewcommand*\sfdefault{\tud@univers}%
        \renewcommand*\ttdefault{\tud@univers t}%
      \fi%
      \ifnum\tud@cdfont@num=\@ne\relax% true
        \if@tud@cdfont@ultrabold% ultrabold
          \renewcommand*\bfdefault{b}%
        \else% normalbold
          \renewcommand*\bfdefault{m}%
        \fi%
        \renewcommand*\mddefault{l}%
        \if@tud@x@mweights@enabled%
          \def\bfseries@rm{m}%
          \def\bfseries@sf{m}%
          \def\bfseries@tt{m}%
          \def\mdseries@rm{l}%
          \def\mdseries@sf{l}%
          \def\mdseries@tt{l}%
        \fi%
      \else% heavy
        \if@tud@cdfont@ultrabold% ultrabold
          \renewcommand*\bfdefault{eb}%
        \else% normalbold
          \renewcommand*\bfdefault{b}%
        \fi%
        \renewcommand*\mddefault{m}%
        \if@tud@x@mweights@enabled%
          \def\bfseries@rm{b}%
          \def\bfseries@sf{b}%
          \def\bfseries@tt{b}%
          \def\mdseries@rm{m}%
          \def\mdseries@sf{m}%
          \def\mdseries@tt{m}%
        \fi%
      \fi%
      \renewcommand*\rmdefault{\sfdefault}%
      \renewcommand*\itdefault{\sldefault}%
    \fi%
    \renewcommand*\familydefault{\sfdefault}%
    \renewcommand*\seriesdefault{\mddefault}%
    \renewcommand*\shapedefault{\updefault}%
  \fi%
  \if@tud@x@mweights@enabled%
    \edef\rmdef@ult{\rmdefault}%
    \edef\sfdef@ult{\sfdefault}%
    \edef\ttdef@ult{\ttdefault}%
    \edef\bfdef@ult{\bfdefault}%
    \edef\mddef@ult{\mddefault}%
    \edef\famdef@ult{\familydefault}%
  \fi%
  \ifundef{\tud@font@math@init}{\tud@font@math@set}{}%
  \tud@font@skip@set%
  \normalfont\selectfont%
  \tud@layout@process%
  \global\@tud@head@font@settrue%
}
\newcommand*\tud@font@skip@set{%
  \if@tud@relspacing%
    \tud@skip@store{smallskipamount}%
    \tud@skip@store{medskipamount}%
    \tud@skip@store{bigskipamount}%
    \tud@skip@store{abovecaptionskip}%
    \tud@skip@store{belowcaptionskip}%
    \tud@skip@store{columnsep}%
    \tud@font@skip@@set%
  \else%
    \tud@skip@restore{smallskipamount}%
    \tud@skip@restore{medskipamount}%
    \tud@skip@restore{bigskipamount}%
    \tud@skip@restore{abovecaptionskip}%
    \tud@skip@restore{belowcaptionskip}%
    \tud@skip@restore{columnsep}%
  \fi%
}
\newcommand*\tud@font@skip@@set{%
  \smallskipamount=\partopsep%
  \medskipamount=\partopsep%
  \multiply\medskipamount by 2%
  \bigskipamount=\partopsep%
  \multiply\bigskipamount by 4%
  \tud@skip@set{abovecaptionskip}{\dimexpr\bigskipamount*5/6\relax}%
  \tud@skip@set{belowcaptionskip}{\z@}%
  \tud@skip@set{columnsep}{1.1\baselineskip}%
}
\newcommand*\tud@font@init{%
  \if@tud@x@fontspec@enabled%
    \if@tud@univers%
      \newcommand*\tud@x@fontspec@set@univ{%
        Ligatures=TeX,%
        BoldFont={},%
        ItalicFont={},%
        BoldItalicFont={},%
        SmallCapsFont={},%
        FontFace={l}{\updefault}{Univers Light},%
        FontFace={m}{\updefault}{Univers},%
        FontFace={b}{\updefault}{Univers Bold},%
        FontFace={bx}{\updefault}{Univers Bold},%
        FontFace={eb}{\updefault}{Univers Black},%
        FontFace={l}{\sldefault}{Univers LightOblique},%
        FontFace={m}{\sldefault}{Univers Oblique},%
        FontFace={b}{\sldefault}{Univers BoldOblique},%
        FontFace={bx}{\sldefault}{Univers BoldOblique},%
        FontFace={eb}{\sldefault}{Univers BlackOblique}%
      }%
      \newfontfamily\tud@x@fontspec@fam@univ{Univers}[%
        \tud@x@fontspec@set@univ,NFSSFamily=\tud@univers%
      ]%
    \fi%
    \if@tud@dinbold%
      \newcommand*\tud@x@fontspec@set@din{%
        Ligatures=TeX,%
        BoldFont={},%
        ItalicFont={},%
        BoldItalicFont={},%
        SmallCapsFont={},%
        FontFace={l}{\updefault}{DIN-Bold},%
        FontFace={m}{\updefault}{DIN-Bold},%
        FontFace={b}{\updefault}{DIN-Bold},%
        FontFace={bx}{\updefault}{DIN-Bold},%
        FontFace={eb}{\updefault}{DIN-Bold},%
        FontFace={l}{\sldefault}{Font=DIN-Bold,FakeSlant=0.15},%
        FontFace={m}{\sldefault}{Font=DIN-Bold,FakeSlant=0.15},%
        FontFace={b}{\sldefault}{Font=DIN-Bold,FakeSlant=0.15},%
        FontFace={bx}{\sldefault}{Font=DIN-Bold,FakeSlant=0.15},%
        FontFace={eb}{\sldefault}{Font=DIN-Bold,FakeSlant=0.15}%
      }%
      \newfontfamily\tud@x@fontspec@fam@din{DIN-Bold}[%
        \tud@x@fontspec@set@din,NFSSFamily=\tud@dinbold%
      ]%
    \fi%
  \fi%
  \if@tud@univers%
    \newrobustcmd*\univln{\usefont{\encodingdefault}{\tud@univers}{l}{n}}%
    \newrobustcmd*\univrn{\usefont{\encodingdefault}{\tud@univers}{m}{n}}%
    \newrobustcmd*\univbn{\usefont{\encodingdefault}{\tud@univers}{b}{n}}%
    \newrobustcmd*\univxn{\usefont{\encodingdefault}{\tud@univers}{eb}{n}}%
    \newrobustcmd*\univls{\usefont{\encodingdefault}{\tud@univers}{l}{sl}}%
    \newrobustcmd*\univrs{\usefont{\encodingdefault}{\tud@univers}{m}{sl}}%
    \newrobustcmd*\univbs{\usefont{\encodingdefault}{\tud@univers}{b}{sl}}%
    \newrobustcmd*\univxs{\usefont{\encodingdefault}{\tud@univers}{eb}{sl}}%
  \else%
    \newrobustcmd*\univln{\tud@font@fallback{Univers Light}{md}{up}}%
    \newrobustcmd*\univrn{\tud@font@fallback{Univers}{md}{up}}%
    \newrobustcmd*\univbn{\tud@font@fallback{Univers Bold}{bf}{up}}%
    \newrobustcmd*\univxn{\tud@font@fallback{Univers Black}{bf}{up}}%
    \newrobustcmd*\univls{\tud@font@fallback{Univers LightOblique}{md}{sl}}%
    \newrobustcmd*\univrs{\tud@font@fallback{Univers Oblique}{md}{sl}}%
    \newrobustcmd*\univbs{\tud@font@fallback{Univers BoldOblique}{bf}{sl}}%
    \newrobustcmd*\univxs{\tud@font@fallback{Univers BlackOblique}{bf}{sl}}%
  \fi%
  \if@tud@dinbold%
    \newrobustcmd*\tud@dinbn{\usefont{\encodingdefault}{\tud@dinbold}{b}{n}}%
    \if@tud@dinboldmath%
      \appto\tud@dinbn{\mathversion{dinbold}}%
    \fi%
    \newrobustcmd*\dinbn{\tud@dinbn}%
  \else%
    \newrobustcmd*\tud@dinbn{\sectfont}%
    \newrobustcmd*\dinbn{\tud@font@fallback@wrn{DIN-Bold}\tud@dinbn}%
  \fi%
  \newcommand*\textuln{}%
  \newcommand*\texturn{}%
  \newcommand*\textubn{}%
  \newcommand*\textuxn{}%
  \newcommand*\textuls{}%
  \newcommand*\texturs{}%
  \newcommand*\textubs{}%
  \newcommand*\textuxs{}%
  \newcommand*\textdbn{}%
  \DeclareTextFontCommand\textuln{\univln}%
  \DeclareTextFontCommand\texturn{\univrn}%
  \DeclareTextFontCommand\textubn{\univbn}%
  \DeclareTextFontCommand\textuxn{\univxn}%
  \DeclareTextFontCommand\textuls{\univls}%
  \DeclareTextFontCommand\texturs{\univrs}%
  \DeclareTextFontCommand\textubs{\univbs}%
  \DeclareTextFontCommand\textuxs{\univxs}%
  \DeclareTextFontCommand\textdbn{\dinbn}%
  \undef\tud@font@init%
}
\newcommand*\tud@font@fallback[3]{%
  \tud@font@fallback@wrn{#1}%
  \sffamily\csuse{#2series}\csuse{#3shape}%
}
\newcommand*\tud@font@fallback@wrn[1]{%
  \ClassWarning{\TUD@Class@Name}%
  {%
    The requested font `#1' is not available, so\MessageBreak%
    a fallback layout is used%
  }%
}
\newcommand*\cdfont[1]{%
  \tud@cdfont@get{#1}%
  \ifx\@tempc\relax\else%
    \ifstr{\@tempc}{dinbn}{\dinbn}{\csuse{univ\@tempc}}%
  \fi%
}
\providecommand*\tudfont[1]{\cdfont{#1}}
\newcommand*\textcdfont[2]{%
  \tud@cdfont@get{#1}%
  \ifx\@tempc\relax\else%
    \ifstr{\@tempc}{dinbn}{\textdbn{#2}}{\csuse{textu\@tempc}{#2}}%
  \fi%
}
\newcommand*\tud@cdfont@get[1]{%
  \tud@cdfont@trim\@tempa{#1}%
  \ifstr{\@tempa}{45}{\def\@tempc{ln}}{%
  \ifstr{\@tempa}{55}{\def\@tempc{rn}}{%
  \ifstr{\@tempa}{65}{\def\@tempc{bn}}{%
  \ifstr{\@tempa}{75}{\def\@tempc{xn}}{%
  \ifstr{\@tempa}{45oblique}{\def\@tempc{ls}}{%
  \ifstr{\@tempa}{55oblique}{\def\@tempc{rs}}{%
  \ifstr{\@tempa}{65oblique}{\def\@tempc{bs}}{%
  \ifstr{\@tempa}{75oblique}{\def\@tempc{xs}}{%
  \ifstr{\@tempa}{oblique45}{\def\@tempc{ls}}{%
  \ifstr{\@tempa}{oblique55}{\def\@tempc{rs}}{%
  \ifstr{\@tempa}{oblique65}{\def\@tempc{bs}}{%
  \ifstr{\@tempa}{oblique75}{\def\@tempc{xs}}{%
  \ifstr{\@tempa}{din}{\def\@tempc{dinbn}}{%
  \ifstr{\@tempa}{din65}{\def\@tempc{dinbn}}{%
    \let\@tempc\relax%
    \ClassWarning{\TUD@Class@Name}%
      {The font `#1' is unknown}%
  }}}}}}}}}}}}}}%
}
\newcommand*\tud@cdfont@trim[2]{%
  \protected@edef\@tempa{\trim@spaces{#2}}%
  \tud@lowerstring{\@tempa}{\@tempa}%
  \tud@cdfont@@trim{ }{}%
  \tud@cdfont@@trim{-}{}%
  \tud@cdfont@@trim{_}{}%
  \tud@cdfont@@trim{~}{}%
  \tud@cdfont@@trim{ce}{}%
  \tud@cdfont@@trim{ff}{}%
  \tud@cdfont@@trim{univers}{}%
  \tud@cdfont@@trim{60}{65}%
  \tud@cdfont@@trim{light}{45}%
  \tud@cdfont@@trim{regular}{55}%
  \tud@cdfont@@trim{bold}{65}%
  \tud@cdfont@@trim{black}{75}%
  \tud@cdfont@@trim{4545}{45}%
  \tud@cdfont@@trim{5555}{55}%
  \tud@cdfont@@trim{6565}{65}%
  \tud@cdfont@@trim{7575}{75}%
  \tud@cdfont@@trim{italic}{oblique}%
  \tud@cdfont@@trim{slanted}{oblique}%
  \let#1\@tempa%
}
\newcommand*\tud@cdfont@@trim[2]{%
  \def\@tempb##1#1##2\relax{\def\@tempa{##1#2##2}}%
  \@expandtwoargs\in@{#1}{\@tempa}%
  \@whilesw\ifin@\fi{%
    \expandafter\@tempb\@tempa\relax%
    \@expandtwoargs\in@{#1}{\@tempa}%
  }%
}
\newcommand*\tud@font@greek@loop[1]{%
  \@for\@tempa:={%
    Gamma,Delta,Theta,Lambda,Xi,Pi,Sigma,Upsilon,Phi,Psi,Omega%
  }\do{#1{\@tempa}}%
}
\newcommand*\tud@font@greek@declare[1]{%
  \edef\@tempb{%
    \noexpand\DeclareMathSymbol{\csname tud@up#1\endcsname}%
      {\noexpand\mathalpha}{operators}{\the\@tempcnta}%
  }\@tempb%
  \edef\@tempb{%
    \noexpand\DeclareMathSymbol{\csname tud@var#1\endcsname}%
      {\noexpand\mathalpha}{letters}{\the\@tempcnta}%
  }\@tempb%
  \csletcs{tud@#1}{tud@up#1}%
  \advance \@tempcnta by 1%
}
\@tempcnta=\z@\relax
\tud@font@greek@loop\tud@font@greek@declare
\newcommand*\mv@univers{}
\newcommand*\mv@universbold{}
\newcommand*\mv@dinbold{}
\newcommand*\tud@font@math@init{%
  \if@tud@x@fontspec@enabled\if@tud@cdmath%
    \ifboolexpr{bool {@tud@universmath} or bool {@tud@dinboldmath}}{%
      \@ifpackagewith{fontspec}{no-math}{}{%
        \ClassWarningNoLine{\TUD@Class@Name}%
        {%
          It's recommended to load package `fontspec'\MessageBreak%
          with option `no-math', if you want to use the\MessageBreak%
          corporate design fonts in math mode%
        }%
      }%
    }{}%
  \fi\fi%
  \if@tud@universmath%
    \DeclareMathVersion{univers}%
    \DeclareMathVersion{universbold}%
    \SetSymbolFont{operators}{univers}{OT1}{\tud@univers}{l}{n}%
    \SetSymbolFont{operators}{universbold}{OT1}{\tud@univers}{b}{n}%
    \SetSymbolFont{letters}{univers}{OML}{\tud@univers}{l}{sl}%
    \SetSymbolFont{letters}{universbold}{OML}{\tud@univers}{b}{sl}%
    \SetSymbolFont{symbols}{univers}{OMS}{\tud@univers}{l}{n}%
    \SetSymbolFont{symbols}{universbold}{OMS}{\tud@univers}{b}{n}%
    \SetSymbolFont{largesymbols}{univers}{OMX}{iwona}{m}{n}%
    \SetSymbolFont{largesymbols}{universbold}{OMX}{iwona}{b}{n}%
    \SetMathAlphabet{\mathrm}{univers}{OT1}{\tud@univers}{l}{n}%
    \SetMathAlphabet{\mathrm}{universbold}{OT1}{\tud@univers}{b}{n}%
    \SetMathAlphabet{\mathnormal}{univers}{OML}{\tud@univers}{l}{sl}%
    \SetMathAlphabet{\mathnormal}{universbold}{OML}{\tud@univers}{b}{sl}%
    \SetMathAlphabet{\mathbf}{univers}{OT1}{\tud@univers}{b}{n}%
    \SetMathAlphabet{\mathbf}{universbold}{OT1}{\tud@univers}{eb}{n}%
    \SetMathAlphabet{\mathsf}{univers}{OT1}{\tud@univers}{l}{n}%
    \SetMathAlphabet{\mathsf}{universbold}{OT1}{\tud@univers}{b}{n}%
    \SetMathAlphabet{\mathit}{univers}{OT1}{\tud@univers}{l}{sl}%
    \SetMathAlphabet{\mathit}{universbold}{OT1}{\tud@univers}{b}{sl}%
    \SetMathAlphabet{\mathtt}{univers}{OT1}{\tud@univers t}{l}{n}%
    \SetMathAlphabet{\mathtt}{universbold}{OT1}{\tud@univers t}{b}{n}%
    \SetMathAlphabet{\mathcal}{univers}{OMS}{lmsy}{m}{n}%
    \SetMathAlphabet{\mathcal}{universbold}{OMS}{lmsy}{b}{n}%
    \@ifpackageloaded{amsfonts}{%
      \DeclareFontFamily{U}{\tud@univers a}{}%
      \DeclareFontShape{U}{\tud@univers a}{m}{n}{<->cmbras10}{}%
      \SetSymbolFont{AMSa}{univers}{U}{\tud@univers a}{m}{n}%
      \SetSymbolFont{AMSa}{universbold}{U}{\tud@univers a}{m}{n}%
      \DeclareFontFamily{U}{\tud@univers b}{}%
      \DeclareFontShape{U}{\tud@univers b}{m}{n}{<->cmbrbs10}{}%
      \SetSymbolFont{AMSb}{univers}{U}{\tud@univers b}{m}{n}%
      \SetSymbolFont{AMSb}{universbold}{U}{\tud@univers b}{m}{n}%
      \SetMathAlphabet{\mathfrak}{univers}{U}{euf}{m}{n}%
      \SetMathAlphabet{\mathfrak}{universbold}{U}{euf}{b}{n}%
    }{}%
  \fi%
  \if@tud@dinboldmath%
    \DeclareMathVersion{dinbold}%
    \SetSymbolFont{operators}{dinbold}{OT1}{\tud@dinbold}{b}{n}%
    \SetSymbolFont{letters}{dinbold}{OML}{\tud@dinbold}{b}{sl}%
    \SetSymbolFont{symbols}{dinbold}{OMS}{\tud@dinbold}{b}{n}%
    \SetSymbolFont{largesymbols}{dinbold}{OMX}{iwona}{ebc}{n}%
    \SetMathAlphabet{\mathrm}{dinbold}{OT1}{\tud@dinbold}{b}{n}%
    \SetMathAlphabet{\mathnormal}{dinbold}{OML}{\tud@dinbold}{b}{sl}%
    \SetMathAlphabet{\mathbf}{dinbold}{OT1}{\tud@dinbold}{b}{n}%
    \SetMathAlphabet{\mathsf}{dinbold}{OT1}{\tud@dinbold}{b}{n}%
    \SetMathAlphabet{\mathit}{dinbold}{OT1}{\tud@dinbold}{b}{sl}%
    \SetMathAlphabet{\mathtt}{dinbold}{OT1}{\tud@univers t}{b}{n}%
    \SetMathAlphabet{\mathcal}{dinbold}{OMS}{lmsy}{b}{n}%
  \fi%
  \@ifpackageloaded{unicode-math}{%
    \let\tud@font@math@set\relax%
    \bool@set@lock{@tud@cdmath}{false}%
  }{%
    \tud@font@greek@check@slanted%
    \tud@font@greek@loop\tud@font@greek@init%
    \tud@font@math@set%
  }%
  \sbox\z@{\tud@dinbn$ $}%
}
\newcommand*\tud@font@greek@check@slanted{%
  \let\@tempb\relax%
  \let\@tempc\relax%
  \DeclareMathSymbol{\@tempb}{\mathalpha}{letters}{0}%
  \DeclareMathSymbol{\@tempc}{\mathord}{letters}{0}%
  \@tempswafalse%
  \ifnum\Gamma=\@tempb\relax\@tempswatrue\fi%
  \ifnum\Gamma=\@tempc\relax\@tempswatrue\fi%
  \if@tempswa%
    \bool@std@lock{@tud@slantedgreek}{true}%
  \fi%
  \let\tud@font@greek@check@slanted\relax%
}
\BeforePackage{flexisym}{\tud@font@greek@check@slanted}
\newcommand*\tud@font@greek@init[1]{%
  \ifcsundef{up#1}{%
    \if@tempswa%
      \csletcs{up#1}{tud@up#1}%
    \else%
      \csletcs{up#1}{#1}%
    \fi%
  }{}%
  \ifcsundef{var#1}{%
    \if@tempswa%
      \csletcs{var#1}{#1}%
    \else%
      \csletcs{var#1}{tud@var#1}%
    \fi%
  }{}%
}
\newcommand*\tud@font@math@set{%
  \if@atdocument%
    \if@tud@cdmath%
      \if@tud@universmath\else%
        \tud@font@math@missing@wrn{Univers}%
      \fi%
      \if@tud@dinboldmath\else%
        \tud@font@math@missing@wrn{DIN-Bold}%
      \fi%
      \ifboolexpr{bool {@tud@universmath} and bool {@tud@dinboldmath}}{}{%
        \bool@set@lock{@tud@cdmath}{false}%
      }%
    \fi%
  \fi%
  \if@tud@universmath%
    \if@tud@cdmath%
      \tud@cmd@store{mv@normal}%
      \tud@cmd@store{mv@bold}%
      \let\mv@normal\mv@univers%
      \let\mv@bold\mv@universbold%
      \tud@font@greek@loop\tud@font@greek@set%
    \else%
      \tud@cmd@restore{mv@normal}%
      \tud@cmd@restore{mv@bold}%
      \tud@font@greek@loop\tud@font@greek@reset%
    \fi%
  \fi%
  \if@tud@slantedgreek%
    \tud@font@greek@loop\tud@font@greek@slanted%
  \else%
    \tud@font@greek@loop\tud@font@greek@upright%
  \fi%
  \mathversion{normal}%
}
\newcommand*\tud@font@greek@set[1]{%
  \tud@cmd@store{#1}%
  \tud@cmd@store{up#1}%
  \tud@cmd@store{var#1}%
  \csletcs{#1}{tud@#1}%
  \csletcs{up#1}{tud@up#1}%
  \csletcs{var#1}{tud@var#1}%
}
\newcommand*\tud@font@greek@reset[1]{%
  \tud@cmd@restore{#1}%
  \tud@cmd@restore{up#1}%
  \tud@cmd@restore{var#1}%
}
\newcommand*\tud@font@greek@upright[1]{\csletcs{#1}{up#1}}
\newcommand*\tud@font@greek@slanted[1]{\csletcs{#1}{var#1}}
\AtEndPreamble{%
  \if@tud@x@mweights@enabled%
    \ifundef{\bfseries@rm}{\edef\bfseries@rm{\bfdefault}}{}%
    \ifundef{\bfseries@sf}{\edef\bfseries@sf{\bfdefault}}{}%
    \ifundef{\bfseries@tt}{\edef\bfseries@tt{\bfdefault}}{}%
    \ifundef{\mdseries@rm}{\edef\mdseries@rm{\mddefault}}{}%
    \ifundef{\mdseries@sf}{\edef\mdseries@sf{\mddefault}}{}%
    \ifundef{\mdseries@tt}{\edef\mdseries@tt{\mddefault}}{}%
  \fi%
  \tud@font@check%
  \tud@font@init%
  \if@tud@x@siunitx@enabled%
    \ifcase\tud@cdfont@num\relax% false
      \def\tud@reserved{\TUDoptions{cdfont=false}}%
    \or% true
      \def\tud@reserved{\TUDoptions{cdfont=true}}%
    \or% heavy
      \def\tud@reserved{\TUDoptions{cdfont=heavy}}%
    \fi%
    \expandafter\AtBeginDocument\expandafter{\tud@reserved}%
    \TUDoptions{cdfont=false}%
  \fi%
  \tud@font@set%
  \if@tud@x@bm@requested%
    \tud@font@math@init%
    \UnPreventPackageFromLoading{bm}%
    \RequirePackage{bm}[2017/01/16]%
  \fi%
  \AtBeginDocument{\tud@font@math@init\let\tud@font@math@init\relax}%
}
\newrobustcmd*\ifdin{%
  \ifx\f@family\tud@dinbold%
    \expandafter\@firstoftwo%
  \else%
    \expandafter\@secondoftwo%
  \fi%
}
\newcommand*\tud@sec@fontface[1][]{%
  \if@tud@cdfont@din%
    \tud@dinbn\tud@raggedright%
  \else%
    \sectfont#1%
  \fi%
}
\RequirePackage{textcase}[2004/10/07]
\newcommand*\tud@makeuppercase[1]{%
  \ifdin{\begingroup\MakeTextUppercase{#1}\endgroup}{#1}%
  \protect\vphantom{\"A\"O\"U}%
}
%%% From File: tudscr-fields.dtx
\newcommand*\@faculty{}
\newcommand*\@department{}
\newcommand*\@institute{}
\newcommand*\@chair{}
\newcommand*\@@faculty{}
\newcommand*\@@department{}
\newcommand*\@@institute{}
\newcommand*\@@chair{}
\newcommand*\faculty[2][\@empty]{\tud@foot@line@add{faculty}{#2}{#1}}
\newcommand*\department[2][\@empty]{\tud@foot@line@add{department}{#2}{#1}}
\newcommand*\institute[2][\@empty]{\tud@foot@line@add{institute}{#2}{#1}}
\newcommand*\chair[2][\@empty]{\tud@foot@line@add{chair}{#2}{#1}}
\newcommand*\@extraheadline{}
\newcommand*\extraheadline[1]{\tud@head@text@field{extraheadline}{#1}}
\newcommand*\tud@head@text@field[2]{%
  \csgdef{@#1}{\trim@spaces{#2}}%
  \global\@tud@head@text@settrue%
}
\newcommand*\tud@foot@line@add[3]{%
  \tud@head@text@field{#1}{#2}%
  \ifx\@empty#3\relax%
    \global\csletcs{@@#1}{@#1}%
  \else%
    \csgdef{@@#1}{\trim@spaces{#3}}%
  \fi%
}
\newcommand*\tud@foot@line@write[1]{%
  \protected@edef\@tempa{\csuse{@@#1}}%
  \ifx\@tempa\@empty\else\newline\mbox{\csuse{@@#1}}\fi%
}
\newcommand*\@@title{}
\robustify\@title
\renewcommand*\title[1]{%
  \gdef\@title{#1}%
  \begingroup%
    \let\thanks\@gobble%
    \let\footnote\@gobble%
    \def\newline{\space\ignorespaces}%
    \def\\{\space\ignorespaces}%
    \protected@xdef\@@title{\trim@spaces{#1}}%
  \endgroup%
}
\newcommand*\@@author{}
\renewcommand*\author[1]{%
  \gdef\@author{#1}%
  \begingroup%
    \let\thanks\@gobble%
    \let\footnote\@gobble%
    \def\newline{\space\ignorespaces}%
    \def\\{\space\ignorespaces}%
    \let\@tempc\relax%
    \def\@tempa##1{\csedef{##1}####1{\@tempc}}%
    \let\@tempb\tud@split@author@list%
    \ifx\and\relax\else%
      \robustify\and%
    \fi%
    \expandafter\forcsvlist\expandafter\@tempa\expandafter{\@tempb}%
    \def\@tempa##1##2{%
      \def\@tempb####1##2####2\@nil{%
        \IfArgIsEmpty{####2}{%
          \def##1{####1}%
        }{%
          \@tempb####1####2\@nil%
        }%
      }%
      \expandafter\@tempb##1##2\@nil%
    }%
    \protected@edef\@@author{#1}%
    \@tempa{\@@author}{ \@tempc }%
    \@tempa{\@@author}{\@tempc }%
    \@tempa{\@@author}{ \@tempc}%
    \@tempa{\@@author}{\@tempc}%
    \xdef\@@author{\expandonce\@@author}%
  \endgroup%
}
\newcommand*\@authormore{}
\newrobustcmd*\authormore[1]{\gdef\@authormore{#1}\ignorespaces}
\newcommand*\@course{}
\newrobustcmd*\course[1]{\gdef\@course{#1}\ignorespaces}
\newcommand*\@discipline{}
\newrobustcmd*\discipline[1]{\gdef\@discipline{#1}\ignorespaces}
\providecommand*\publisher[1]{\publishers{#1}}
\newcommand*\@@professor{}
\newcommand*\professor[1]{\gdef\@@professor{#1}}
\newcommand*\supervisor[1]{}
\newcommand*\@webpage{}
\newrobustcmd*\webpage{%
  \kernel@ifstar{\tud@webpage@simple}{\tud@webpage@hyper}%
}
\newrobustcmd*\tud@webpage@simple[1]{\gdef\@webpage{#1}}
\newrobustcmd*\tud@webpage@hyper[2][]{\gdef\@webpage{#2}}
\AfterPackage{hyperref}{%
  \renewrobustcmd*\tud@webpage@hyper[2][hidelinks]{%
    \gdef\@webpage{%
      \begingroup%
        \urlstyle{same}%
        \hypersetup{#1}%
        \url{#2}%
      \endgroup%
    }%
  }%
}
\TUD@UnwindPackage{isodate}{\providecommand*\printdate[1]{#1}}
\newcommand*\tud@x@isodate@printdate[2]{%
  \ifx\today#2\relax%
    \gdef#1{#2}%
  \else%
    \ifxblank{#2}%
      {\gdef#1{}}%
      {\gdef#1{\printdate{#2}}}%
  \fi%
}
\newcommand*\tud@date@check{%
  \ifdefvoid{\@duedate}{%
    \ClassWarning{\TUD@Class@Name}{%
      `\string\date' was not given\MessageBreak%
      Since a thesis is a self-contained work, an end\MessageBreak%
      date should be specified by the author.\MessageBreak%
      Nevertheless, today's date is used%
    }%
  }{%
    \ClassWarning{\TUD@Class@Name}{%
      `\string\date' was not given\MessageBreak%
      It's substituted by the given due date%
    }%
    \global\let\@date\@duedate%
  }%
  \global\let\tud@date@check\relax%
}
\renewcommand*\date{%
  \kernel@ifstar{%
    \TUD@parameter@set{date}{pre=\noexpand\@place{,}}%
    \tud@date@set%
  }{\tud@date@set}%
}
\newcommand*\tud@date@set[2][]{%
  \TUD@parameter@set{date}{#1}%
  \tud@x@isodate@printdate{\@date}{#2}%
  \global\let\tud@date@check\relax%
}
\newcommand*\tud@date@pre{}
\newcommand*\tud@date@app{}
\TUD@parameter@family{date}{%
  \TUD@parameter@def{before}{\def\tud@date@pre{#1}}%
  \TUD@parameter@let{pre}{before}%
  \TUD@parameter@let{prefix}{before}%
  \TUD@parameter@def{after}{\def\tud@date@app{#1}}%
  \TUD@parameter@let{app}{after}%
  \TUD@parameter@let{suffix}{after}%
  \TUD@parameter@def{place}{\def\@place{#1}\def\tud@date@pre{#1,}}%
  \TUD@parameter@handler@value{after}%
}
\newcommand*\tud@date@print{%
  \ifx\@date\@empty\else%
    \ifx\tud@date@pre\@empty\else%
      \expandafter\trim@spaces@noexp\expandafter{\tud@date@pre}\nobreakspace%
    \fi%
    \@date%
    \ifx\tud@date@app\@empty\else%
      \nobreakspace\expandafter\trim@spaces@noexp\expandafter{\tud@date@app}%
    \fi%
  \fi%
}
\newcommand*\@contactperson{}
\newcommand*\contactperson[1]{\gdef\@contactperson{#1}}
\let\supervisor\contactperson
\newcommand*\@office{}
\newrobustcmd*\office[1]{\gdef\@office{#1}}
\newcommand*\@telephone{}
\newrobustcmd*\telephone[1]{\gdef\@telephone{#1}}
\newcommand*\@telefax{}
\newrobustcmd*\telefax[1]{\gdef\@telefax{#1}}
\newcommand*\@emailaddress{}
\newrobustcmd*\emailaddress{%
  \kernel@ifstar{\tud@emailaddress@simple}{\tud@emailaddress@hyper}%
}
\newrobustcmd*\tud@emailaddress@simple[1]{\gdef\@emailaddress{#1}}
\newrobustcmd*\tud@emailaddress@hyper[2][]{\gdef\@emailaddress{#2}}
\AfterPackage*{hyperref}{%
  \renewrobustcmd*\tud@emailaddress@hyper[2][hidelinks]{%
    \gdef\@emailaddress{%
      \begingroup%
        \urlstyle{same}%
        \hypersetup{#1}%
        \href{mailto:#2}{\nolinkurl{#2}}%
      \endgroup%
    }%
  }%
}
\newcommand*\tud@multiple@@split{}
\newcommand*\tud@multiple@split[1]{%
  \expandafter\ifpatchable\expandafter{\csname#1\endcsname}{%
    \@latex@warning@no@line%
  }{%
    \csuse{#1}\csgdef{#1}{}%
  }{}%
  \def\tud@multiple@@split##1\and##2\relax{%
    \expandafter\csname tud@split#1@do\endcsname{##1}{##2}%
  }%
  \begingroup%
    \let\and\relax%
    \def\newline{}%
    \def\\{}%
    \edef\@tempa{\csname#1\endcsname\and}%
  \expandafter\endgroup%
  \expandafter\tud@multiple@@split\@tempa\relax%
}
\newcommand*\tud@multiple@@@split[2]{%
  \ifx\relax#1\relax%
    \let\@tempb\relax%
  \else%
    \def\@tempb{#2\tud@multiple@@split#1\relax}%
  \fi%
  \@tempb%
}
\newcommand*\tud@multiple@fields@store[2]{%
  \def\@tempa##1{\ifcsdef{@##1}{\tud@cmd@store{@##1}}{}}%
  \letcs\@tempb{tud@split#1@list}%
  \let\and\relax%
  \expandafter\forcsvlist\expandafter\@tempa\expandafter{\@tempb}%
  \begingroup%
    \let\thanks\@gobble%
    \let\footnote\@gobble%
    \sbox\z@{#2}%
  \endgroup%
}
\newcommand*\tud@multiple@fields@restore[1]{%
  \def\@tempa##1{%
    \ifcsdef{@##1}{%
      \tud@cmd@restore{@##1}%
      \global\csletcs{@##1}{@##1}%
    }{}%
  }%
  \letcs\@tempb{tud@split#1@list}%
  \let\and\relax%
  \expandafter\forcsvlist\expandafter\@tempa\expandafter{\@tempb}%
}
\newcommand*\tud@multiple@fields@preset[3]{%
  \def\@tempa##1{%
    \edef\@tempc{\csuse{##1}}%
    \ifstr{#2}{*}{%
      \csdef{@##1}{}%
    }{%
      \begingroup%
        \protected@expandtwoargs\in@{\@tempc}{\csuse{#1}}%
        \ifin@%
          \ifcsvoid{@##1}{\@tempc{#2}}{}%
        \fi%
      \endgroup%
    }%
  }%
  \letcs\@tempb{tud@split#1@list}%
  \let\and\relax%
  \expandafter\forcsvlist\expandafter\@tempa\expandafter{\@tempb}%
  \begingroup%
    \let\thanks\@gobble%
    \let\footnote\@gobble%
    \sbox\z@{#3}%
  \endgroup%
}
\newcommand*\tud@split@author@do[2]{}
\newcommand*\tud@split@author@list{%
  authormore,course,discipline,office,telephone,telefax,emailaddress%
}
\newcommand*\tud@split@contactperson@do[2]{}
\newcommand*\tud@split@contactperson@list{office,telephone,telefax,emailaddress}
%%% From File: tudscr-locale.dtx
\newcommand*\tud@locale@define[1]{%
  \providecommand*#1{%
    \ClassError{\TUD@Class@Name}{%
      `\string#1' not defined for language `\languagename'%
    }{%
      Currently the class `\TUD@Class@Name' only supports the\MessageBreak%
      languages german and english an its dialects. You must\MessageBreak%
      define single patterns by yourself, e.g.:\MessageBreak%
      `\string\providecaptionname{\languagename}\string#1{<text>}'\MessageBreak%
      You can send your definitions to \tudscrmail\space in\MessageBreak%
      order to implement support for additional languages.%
    }%
  }%
}
\tud@locale@define{\coursename}
\tud@locale@define{\disciplinename}
\tud@locale@define{\listingname}
\tud@locale@define{\listlistingname}
\tud@locale@define{\dissertationname}
\tud@locale@define{\diplomathesisname}
\tud@locale@define{\masterthesisname}
\tud@locale@define{\bachelorthesisname}
\tud@locale@define{\studentthesisname}
\tud@locale@define{\studentresearchname}
\tud@locale@define{\projectpapername}
\tud@locale@define{\seminarpapername}
\tud@locale@define{\termpapername}
\tud@locale@define{\researchname}
\tud@locale@define{\logname}
\tud@locale@define{\internshipname}
\tud@locale@define{\reportname}
\tud@locale@define{\authorname}
\tud@locale@define{\contactname}
\tud@locale@define{\contactpersonname}
\newcommand*\tud@ifin@and[1]{%
  \begingroup%
    \let\and\relax%
    \protected@edef\@tempb{#1}%
    \def\@tempa##1\and##2\relax{%
      \IfArgIsEmpty{##2}{%
        \aftergroup\@secondoftwo%
      }{%
        \aftergroup\@firstoftwo%
      }%
    }%
    \expandafter\@tempa\@tempb\and\relax%
  \endgroup
}
\newcommand*\tud@locale@german{%
  \providecaptionname{%
    german,ngerman,austrian,naustrian,swissgerman,nswissgerman%
  }%
}
\tud@locale@german{\coursename}{Studiengang}%
\tud@locale@german{\disciplinename}{Studienrichtung}%
\tud@locale@german{\listingname}{Quelltext}%
\tud@locale@german{\listlistingname}{Quelltextverzeichnis}%
\tud@locale@german{\dissertationname}{Dissertation}%
\tud@locale@german{\diplomathesisname}{Diplomarbeit}%
\tud@locale@german{\masterthesisname}{Master-Arbeit}%
\tud@locale@german{\bachelorthesisname}{Bachelor-Arbeit}%
\tud@locale@german{\studentthesisname}{Studienarbeit}%
\tud@locale@german{\studentresearchname}{Gro\ss{}er Beleg}%
\tud@locale@german{\projectpapername}{Projektarbeit}%
\tud@locale@german{\seminarpapername}{Seminararbeit}%
\tud@locale@german{\termpapername}{Hausarbeit}%
\tud@locale@german{\researchname}{Forschungsbericht}%
\tud@locale@german{\logname}{Protokoll}%
\tud@locale@german{\internshipname}{Praktikumsbericht}%
\tud@locale@german{\reportname}{Bericht}%
\tud@locale@german{\authorname}{Autor}%
\tud@locale@german{\contactname}{Kontakt}%
\tud@locale@german{\contactpersonname}{Ansprechpartner}%
\newcommand*\tud@locale@english{%
  \providecaptionname{%
    american,australian,british,canadian,english,newzealand,UKenglish,USenglish%
  }%
}
\tud@locale@english{\coursename}{Course}%
\tud@locale@english{\disciplinename}{Discipline}%
\tud@locale@english{\listingname}{Listing}%
\tud@locale@english{\listlistingname}{List of Listings}%
\tud@locale@english{\dissertationname}{Dissertation}%
\tud@locale@english{\diplomathesisname}{Diploma Thesis}%
\tud@locale@english{\masterthesisname}{Master Thesis}%
\tud@locale@english{\bachelorthesisname}{Bachelor Thesis}%
\tud@locale@english{\studentthesisname}{Student Thesis}%
\tud@locale@english{\studentresearchname}{Student Research Project}%
\tud@locale@english{\projectpapername}{Project Paper}%
\tud@locale@english{\seminarpapername}{Seminar Paper}%
\tud@locale@english{\termpapername}{Term Paper}%
\tud@locale@english{\researchname}{Research Report}%
\tud@locale@english{\logname}{Log}%
\tud@locale@english{\internshipname}{Internship Report}%
\tud@locale@english{\reportname}{Report}%
\tud@locale@english{\authorname}{Author}%
\tud@locale@english{\contactname}{Contact}%
\tud@locale@english{\contactpersonname}{Contact}%
\AfterPackage{listings}{%
  \renewcommand*\lstlistingname{\listingname}%
  \renewcommand*\lstlistlistingname{\listlistingname}%
}
\AfterPackage{mathswap}{%
  \tud@locale@german{\@commaswap}{,}%
  \tud@locale@german{\@dotswap}{\,}%
  \tud@locale@english{\@commaswap}{\,}%
  \tud@locale@english{\@dotswap}{.}%
}
%%% From File: tudscr-area.dtx
\newif\if@tud@x@crop@center
\AfterPackage{crop}{%
  \CheckCommand*\CROP@center{%
    \voffset\stockheight
    \advance\voffset-\paperheight
    \voffset.5\voffset
    \hoffset\stockwidth
    \advance\hoffset-\paperwidth
    \hoffset.5\hoffset
  }%
  \pretocmd{\CROP@center}{%
    \@tud@x@crop@centertrue%
  }{}{\tud@patch@wrn{CROP@center}}
}
\newif\if@tud@x@standalone@crop
\AfterClass*{standalone}{\let\if@tud@x@standalone@crop\ifsa@crop}
\newlength\tud@len@widemargin
\newlength\tud@len@slimmargin
\newlength\tud@len@both
\newlength\tud@len@topmargin
\newlength\tud@len@barheight
\newlength\tud@len@headsep
\newlength\tud@len@footsep
\newlength\tud@len@logox
\newlength\tud@len@logoy
\newlength\tud@len@logowidth
\newlength\tud@len@line
\newlength\tud@len@heavyline
\newlength\tud@len@thinline
\newlength\tud@len@areaheadvskip
\newlength\tud@len@areadiff
\newlength\tud@len@areavskip
\tud@if@v@lower{2.03}{\newlength\tud@len@ddcdiff}{}
\newif\if@tud@cdgeometry@adjust
\newlength\tud@len@layoutheight
\newlength\tud@len@layoutwidth
\newlength\tud@len@layouthoffset
\newlength\tud@len@layoutvoffset
\newcommand*\tud@cdgeometry@set{%
  \ifGm@layout%
    \setlength\tud@len@layoutheight{\Gm@layoutheight}%
    \setlength\tud@len@layoutwidth{\Gm@layoutwidth}%
  \else%
    \setlength\tud@len@layoutheight{\paperheight}%
    \setlength\tud@len@layoutwidth{\paperwidth}%
  \fi%
  \setlength\tud@len@layouthoffset{\Gm@layouthoffset}%
  \setlength\tud@len@layoutvoffset{\Gm@layoutvoffset}%
  \tud@if@v@lower{2.05}{%
    \ifdim\tud@len@layoutheight<\dimexpr105mm+1.5mm\relax%
      \def\@tempa{0}%
    \else\ifdim\tud@len@layoutheight<\dimexpr148mm+1.5mm\relax%
      \def\@tempa{1}%
    \else\ifdim\tud@len@layoutheight<\dimexpr229mm+2mm\relax%
      \def\@tempa{2}%
    \else\ifdim\tud@len@layoutheight<\dimexpr297mm+2mm\relax%
      \def\@tempa{3}%
    \else\ifdim\tud@len@layoutheight<\dimexpr420mm+2mm\relax%
      \def\@tempa{4}%
    \else\ifdim\tud@len@layoutheight<\dimexpr594mm+2mm\relax%
      \def\@tempa{5}%
    \else\ifdim\tud@len@layoutheight<\dimexpr841mm+3mm\relax%
      \def\@tempa{6}%
    \else\ifdim\tud@len@layoutheight<\dimexpr1189mm+3mm\relax%
      \def\@tempa{7}%
    \else%
      \def\@tempa{8}%
    \fi\fi\fi\fi\fi\fi\fi\fi%
  }{%
    \ifdim\tud@len@layoutheight<\dimexpr125mm+1.5mm\relax%
      \def\@tempa{0}%
    \else\ifdim\tud@len@layoutheight<\dimexpr176mm+2mm\relax%
      \def\@tempa{1}%
    \else\ifdim\tud@len@layoutheight<\dimexpr250mm+2mm\relax%
      \def\@tempa{2}%
    \else\ifdim\tud@len@layoutheight<\dimexpr353mm+2mm\relax%
      \def\@tempa{3}%
    \else\ifdim\tud@len@layoutheight<\dimexpr500mm+2mm\relax%
      \def\@tempa{4}%
    \else\ifdim\tud@len@layoutheight<\dimexpr707mm+3mm\relax%
      \def\@tempa{5}%
    \else\ifdim\tud@len@layoutheight<\dimexpr1000mm+3mm\relax%
      \def\@tempa{6}%
    \else\ifdim\tud@len@layoutheight<\dimexpr1414mm+3mm\relax%
      \def\@tempa{7}%
    \else%
      \def\@tempa{8}%
    \fi\fi\fi\fi\fi\fi\fi\fi%
  }%
  \@tud@cdgeometry@adjustfalse%
  \ifnum\tud@cdgeometry@calc@num=\tw@\relax%
    \ifnum\@tempa>\z@\relax%
      \ifnum\@tempa<8\relax%
        \def\@tempa{3}%
      \fi%
    \fi%
  \fi%
  \ifcase\@tempa\relax% <=A7/B7
    \ifnum\tud@cdgeometry@calc@num=\tw@\relax\else%
      \ClassWarning{\TUD@Class@Name}{%
        There's no type area defined for such a\MessageBreak%
        small paper height. It is recommended to increase\MessageBreak%
        the paper size. Nevertheless, it will be tried to\MessageBreak%
        calculate a proper type area%
      }%
    \fi%
    \tud@divide\@tempa{\tud@len@layoutheight}{148mm}%
    \setlength\tud@len@widemargin{15mm}%
    \setlength\tud@len@widemargin{\@tempa\tud@len@widemargin}%
    \setlength\tud@len@heavyline{0.5pt}%
    \setlength\tud@len@heavyline{\@tempa\tud@len@heavyline}%
    \setlength\tud@len@thinline{0.25pt}%
    \setlength\tud@len@thinline{\@tempa\tud@len@thinline}%
    \setlength{\@tempdima}{4.5pt}%
    \setlength{\@tempdima}{\@tempa\@tempdima}%
    \edef\tud@head@fontsize{\strip@pt\@tempdima}%
  \or% <=A6/B6
    \setlength\tud@len@widemargin{15mm}%
    \setlength\tud@len@heavyline{0.5pt}%
    \setlength\tud@len@thinline{0.25pt}%
    \renewcommand*\tud@head@fontsize{4.5}%
  \or% <=A5/B5
    \ifnum\tud@cdgeometry@calc@num=\z@\relax% restricted
      \@tud@cdgeometry@adjusttrue%
      \setlength\tud@len@widemargin{30mm}%
      \setlength\tud@len@heavyline{1pt}%
      \setlength\tud@len@thinline{0.5pt}%
      \renewcommand*\tud@head@fontsize{9}%
    \else%
      \setlength\tud@len@widemargin{21.213203mm}%
      \setlength\tud@len@heavyline{0.707107pt}%
      \setlength\tud@len@thinline{0.353553pt}%
      \renewcommand*\tud@head@fontsize{6.363961}%
    \fi%
  \or% <=A4/B4
    \setlength\tud@len@widemargin{30mm}%
    \setlength\tud@len@heavyline{1pt}%
    \setlength\tud@len@thinline{0.5pt}%
    \renewcommand*\tud@head@fontsize{9}%
  \or% <=A3/B3
    \setlength\tud@len@widemargin{42.426407mm}%
    \setlength\tud@len@heavyline{1.414214pt}%
    \setlength\tud@len@thinline{0.707107pt}%
    \renewcommand*\tud@head@fontsize{12.727922}%
  \or% <=A2/B2
    \setlength\tud@len@widemargin{60mm}%
    \setlength\tud@len@heavyline{2pt}%
    \setlength\tud@len@thinline{1pt}%
    \renewcommand*\tud@head@fontsize{18}%
  \or% <=A1/B1
    \setlength\tud@len@widemargin{84.852814mm}%
    \setlength\tud@len@heavyline{2.828427pt}%
    \setlength\tud@len@thinline{1.414214pt}%
    \renewcommand*\tud@head@fontsize{25.455844}%
  \or% <=A0/B0
    \setlength\tud@len@widemargin{120mm}%
    \setlength\tud@len@heavyline{4pt}%
    \setlength\tud@len@thinline{2pt}%
    \renewcommand*\tud@head@fontsize{36}%
  \else% >A0/B0
    \ifnum\tud@cdgeometry@calc@num=\tw@\relax\else%
      \ClassWarning{\TUD@Class@Name}{%
        There's no type area defined for such a\MessageBreak%
        huge paper height. It is recommended to reduce\MessageBreak%
        the paper size. Nevertheless, it will be tried to\MessageBreak%
        calculate a proper type area%
      }%
    \fi%
    \tud@divide\@tempa{\tud@len@layoutheight}{1189mm}%
    \setlength\tud@len@widemargin{120mm}%
    \setlength\tud@len@widemargin{\@tempa\tud@len@widemargin}%
    \setlength\tud@len@heavyline{4pt}%
    \setlength\tud@len@heavyline{\@tempa\tud@len@heavyline}%
    \setlength\tud@len@thinline{2pt}%
    \setlength\tud@len@thinline{\@tempa\tud@len@thinline}%
    \setlength{\@tempdima}{36pt}%
    \setlength{\@tempdima}{\@tempa\@tempdima}%
    \edef\tud@head@fontsize{\strip@pt\@tempdima}%
  \fi%
  \ifnum\tud@cdgeometry@calc@num=\tw@\relax%
    \tud@divide\@tempa{\tud@len@layoutheight}{297mm}%
    \setlength\tud@len@widemargin{\@tempa\tud@len@widemargin}%
    \setlength\tud@len@heavyline{\@tempa\tud@len@heavyline}%
    \setlength\tud@len@thinline{\@tempa\tud@len@thinline}%
    \setlength{\@tempdima}{\tud@head@fontsize pt}%
    \setlength{\@tempdima}{\@tempa\@tempdima}%
    \edef\tud@head@fontsize{\strip@pt\@tempdima}%
  \fi%
  \global\@tud@head@font@settrue%
  \setlength\tud@len@slimmargin{\dimexpr2\tud@len@widemargin/3\relax}%
  \setlength\tud@len@both{\dimexpr5\tud@len@widemargin/3\relax}%
  \setlength\tud@len@topmargin{\dimexpr7\tud@len@widemargin/6\relax}%
  \setlength\tud@len@barheight{\dimexpr\tud@len@widemargin/6\relax}%
  \setlength\tud@len@headsep{\dimexpr2\tud@len@widemargin/5\relax}%
  \setlength\tud@len@logox{\dimexpr1.1\tud@len@widemargin/3\relax}%
  \setlength\tud@len@logoy{\dimexpr0.45\tud@len@widemargin\relax}%
  \setlength\tud@len@logowidth{\dimexpr1.9\tud@len@widemargin\relax}%
  \setlength\tud@len@footsep{%
    \dimexpr\tud@len@widemargin-.6\tud@len@topmargin\relax%
  }%
  \if@tud@cdgeometry@adjust%
    \setlength\tud@len@headsep{\dimexpr.707107\tud@len@headsep\relax}%
    \setlength\tud@len@footsep{\dimexpr.707107\tud@len@footsep\relax}%
  \fi%
}
\newcommand*\tud@cdgeometry@process{}
\newcommand*\tud@cdgeometry@@process{}
\if@tud@x@standalone@crop
  \PreventPackageFromLoading{geometry}%
\else
  \RequirePackage{geometry}[2010/09/12]%
\fi
\AfterPackage*{geometry}{%
  \CheckCommand*\Gm@initnewgm{%
    \Gm@passfalse
    \Gm@swap@papersizefalse
    \Gm@dimlist={}
    \Gm@hbodyfalse
    \Gm@vbodyfalse
    \Gm@heightroundedfalse
    \Gm@includeheadfalse
    \Gm@includefootfalse
    \Gm@includempfalse
    \let\Gm@width\@undefined
    \let\Gm@height\@undefined
    \let\Gm@textwidth\@undefined
    \let\Gm@textheight\@undefined
    \let\Gm@lines\@undefined
    \let\Gm@hscale\@undefined
    \let\Gm@vscale\@undefined
    \let\Gm@hmarginratio\@undefined
    \let\Gm@vmarginratio\@undefined
    \let\Gm@lmargin\@undefined
    \let\Gm@rmargin\@undefined
    \let\Gm@tmargin\@undefined
    \let\Gm@bmargin\@undefined
    \Gm@layoutfalse
    \Gm@layouthoffset\z@
    \Gm@layoutvoffset\z@
    \Gm@bindingoffset\z@
  }%
  \expandafter\CheckCommand%
  \csname\expandafter\@gobble\string\Gm@changelayout\space\endcsname{%
    \setlength{\@colht}{\textheight}
    \setlength{\@colroom}{\textheight}%
    \setlength{\vsize}{\textheight}
    \setlength{\columnwidth}{\textwidth}%
    \if@twocolumn%
      \advance\columnwidth-\columnsep
      \divide\columnwidth\tw@%
      \@firstcolumntrue%
    \fi%
    \setlength{\hsize}{\columnwidth}%
    \setlength{\linewidth}{\hsize}%
  }%
  \CheckCommand*\Gm@@process{%
    \Gm@expandlengths
    \Gm@adjustpaper
    \addtolength\Gm@layoutwidth{-\Gm@bindingoffset}%
    \Gm@adjustmp
    \Gm@adjustbody
    \Gm@detall{h}{width}{lmargin}{rmargin}%
    \Gm@detall{v}{height}{tmargin}{bmargin}%
    \setlength\textwidth{\Gm@width}%
    \setlength\textheight{\Gm@height}%
    \setlength\topmargin{\Gm@tmargin}%
    \setlength\oddsidemargin{\Gm@lmargin}%
    \addtolength\oddsidemargin{-1\Gm@truedimen in}%
    \ifGm@includemp
      \advance\textwidth-\Gm@wd@mp
      \advance\oddsidemargin\Gm@odd@mp
    \fi
    \if@mparswitch
      \setlength\evensidemargin{\Gm@rmargin}%
      \addtolength\evensidemargin{-1\Gm@truedimen in}%
      \ifGm@includemp
        \advance\evensidemargin\Gm@even@mp
      \fi
    \else
      \evensidemargin\oddsidemargin
    \fi
    \advance\oddsidemargin\Gm@bindingoffset
    \addtolength\topmargin{-1\Gm@truedimen in}%
    \ifGm@includehead
      \addtolength\textheight{-\headheight}%
      \addtolength\textheight{-\headsep}%
    \else
      \addtolength\topmargin{-\headheight}%
      \addtolength\topmargin{-\headsep}%
    \fi
    \ifGm@includefoot
      \addtolength\textheight{-\footskip}%
    \fi
    \ifGm@heightrounded
      \setlength\@tempdima{\textheight}%
      \addtolength\@tempdima{-\topskip}%
      \@tempcnta\@tempdima
      \@tempcntb\baselineskip
      \divide\@tempcnta\@tempcntb
      \setlength\@tempdimb{\baselineskip}%
      \multiply\@tempdimb\@tempcnta
      \advance\@tempdima-\@tempdimb
      \multiply\@tempdima\tw@
      \ifdim\@tempdima>\baselineskip
        \addtolength\@tempdimb{\baselineskip}%
      \fi
      \addtolength\@tempdimb{\topskip}%
      \textheight\@tempdimb
    \fi
    \advance\oddsidemargin\Gm@layouthoffset%
    \advance\evensidemargin\Gm@layouthoffset%
    \advance\topmargin\Gm@layoutvoffset%
    \addtolength\Gm@layoutwidth{\Gm@bindingoffset}%
  }%
  \CheckCommand\geometry[1]{%
    \Gm@clean
    \setkeys{Gm}{#1}%
    \Gm@process%
  }%
  \CheckCommand\newgeometry[1]{%
    \clearpage
    \Gm@restore@org
    \Gm@initnewgm
    \Gm@newgmtrue
    \setkeys{Gm}{#1}%
    \Gm@newgmfalse
    \Gm@process
    \ifnum\mag=\@m\else\Gm@magtooffset\fi
    \Gm@changelayout
    \Gm@showparams{newgeometry}%
  }%
  \CheckCommand\restoregeometry{%
    \clearpage
    \Gm@restore@pkg
    \Gm@changelayout%
  }%
  \CheckCommand*\savegeometry[1]{%
    \Gm@save
    \expandafter\edef\csname Gm@restore@@#1\endcsname{\Gm@restore}%
  }%
  \CheckCommand*\loadgeometry[1]{%
    \clearpage
    \@ifundefined{Gm@restore@@#1}{%
      \PackageError{geometry}{%
      \string\loadgeometry : name `#1' undefined}{%
      The name `#1' should be predefined with \string\savegeometry}%
    }{\@nameuse{Gm@restore@@#1}%
    \Gm@changelayout}%
  }%
  \tud@cmd@store{geometry}
  \tud@cmd@store{newgeometry}
  \newif\if@tud@x@geometry@enabled%
  \@tud@x@geometry@enabledtrue%
  \newcommand*\tud@setgeometry[1]{%
    \@tud@x@geometry@enabledfalse%
    \ifGm@pass%
      \def\@tempb{}%
    \else%
      \edef\@tempb{layoutoffset={\the\Gm@layouthoffset,\the\Gm@layoutvoffset}}%
      \ifGm@layout%
        \eappto\@tempb{,layoutsize={\the\Gm@layoutwidth,\the\Gm@layoutheight}}%
      \fi%
    \fi%
    \if@atdocument%
      \edef\@tempa{\@tempb,#1}%
      \tud@cmd@store{Gm@restore@org}%
      \eappto\Gm@restore@org{%
        \paperwidth=\the\paperwidth\relax%
        \paperheight=\the\paperheight\relax%
      }%
      \def\@tempc{\tud@cmd@use{newgeometry}}%
      \expandafter\@tempc\expandafter{\@tempa}%
      \tud@cmd@restore{Gm@restore@org}%
    \else%
      \Gm@initnewgm%
      \edef\@tempa{%
        paperwidth=\the\paperwidth,paperheight=\the\paperheight,\@tempb,#1%
      }%
      \def\@tempc{\tud@cmd@use{geometry}}%
      \expandafter\@tempc\expandafter{\@tempa}%
    \fi%
    \@tud@x@geometry@enabledtrue%
  }%
  \newcommand*\tud@savegeometry[1]{%
    \def\Gm@restore{}%
    \savegeometry{#1}%
    \csepreto{Gm@restore@@#1}{%
      \etex@unexpanded{\def\Gm@lmargin}{\Gm@lmargin}%
      \etex@unexpanded{\def\Gm@rmargin}{\Gm@rmargin}%
      \noexpand\Gm@bindingoffset=\the\Gm@bindingoffset%
      \ifGm@includemp%
        \noexpand\Gm@includemptrue%
      \else%
        \noexpand\Gm@includempfalse%
      \fi%
      \ifGm@layout%
        \noexpand\Gm@layouttrue%
      \else%
        \noexpand\Gm@layoutfalse%
      \fi%
    }%
  }%
  \newcommand*\tud@loadgeometry[1]{%
    \@tud@x@geometry@enabledfalse%
    \loadgeometry{#1}%
    \@currsize%
    \if@tud@x@crop@center\CROP@center\fi%
    \@tud@x@geometry@enabledtrue%
  }%
  \TUD@parameter@family{geometry}{%
    \TUD@parameter@def{paper}{\tud@area@def{paper}{#1}}%
    \TUD@parameter@let{papername}{paper}%
    \TUD@parameter@def{paperwidth}{\tud@area@def{paper}{#1:\the\paperheight}}%
    \TUD@parameter@def{paperheight}{\tud@area@def{paper}{\the\paperwidth:#1}}%
    \TUD@parameter@def{papersize}{%
      \def\@tempa##1,##2,##3\@nil{%
        \IfArgIsEmpty{##2}{%
          \tud@area@def{paper}{##1:##1}%
        }{%
          \tud@area@def{paper}{##1:##2}%
        }%
      }%
      \@tempa#1,,\@nil%
    }%
    \TUD@parameter@def{layout}{\tud@area@def{layout}{#1}}%
    \TUD@parameter@let{layoutname}{layout}%
    \TUD@parameter@def{layoutwidth}{%
      \tud@area@def{layout}{#1:\the\tud@len@layoutheight}%
    }%
    \TUD@parameter@def{layoutheight}{%
      \tud@area@def{layout}{\the\tud@len@layoutwidth:#1}%
    }%
    \TUD@parameter@def{layoutsize}{%
      \def\@tempa##1,##2,##3\@nil{%
        \IfArgIsEmpty{##2}{%
          \tud@area@def{layout}{##1:##1}%
        }{%
          \tud@area@def{layout}{##1:##2}%
        }%
      }%
      \@tempa#1,,\@nil%
    }%
    \TUD@parameter@def{bleedmargin}{\TUDoption{bleedmargin}{#1}}%
    \TUD@parameter@handler@macro{%
      \eappto\tud@x@geometry@parameter{%
        \expandonce\kv@key=\expandonce\kv@value,%
      }%
    }{%
      \tud@area@def{paper}{#2}%
    }%
  }
  \newcommand*\tud@area@def[2]{%
    \tud@lowerstring{\@tempa}{#2}%
    \def\@tempb##1paper##2\@nil{%
      \ifstr{##2}{paper}{\def\@tempa{##1}}{}%
    }%
    \expandafter\@tempb\@tempa paper\@nil%
    \@tempswafalse%
    \ifstr{\@tempa}{seascape}{\@tempswatrue}{}%
    \ifstr{\@tempa}{landscape}{\@tempswatrue}{}%
    \ifstr{\@tempa}{portrait}{\@tempswatrue}{}%
    \ifstr{\@tempa}{letter}{\@tempswatrue}{}%
    \ifstr{\@tempa}{executive}{\@tempswatrue}{}%
    \ifstr{\@tempa}{legal}{\@tempswatrue}{}%
    \if@tempswa\else%
      \ifx\@tempa\@empty\relax\else%
        \def\@tempb##1##2\@nil{%
          \if ##1a\@tempswatrue%
            \else\if ##1b\@tempswatrue%
              \else\if ##1c\@tempswatrue%
                \else\if ##1d\@tempswatrue%
          \fi\fi\fi\fi%
          \if@tempswa%
            \@tempswafalse%
            \IfArgIsEmpty{##2}{}{\ifnumber{##2}{\@tempswatrue}{}}%
          \fi%
        }%
        \expandafter\@tempb\@tempa\@nil%
        \if@tempswa\else%
          \def\@tempb##1:##2:##3\@nil{%
            \IfArgIsEmpty{##2}{}{%
              \@tempswatrue%
              \def\@tempa{##1:##2}%
            }%
          }%
          \expandafter\@tempb\@tempa::\@nil%
        \fi%
        \if@tempswa\else%
          \def\tud@reserved##1:##2:##3:##4\@nil{%
            \if@tempswa\else%
              \ifstr{\@tempa}{##1}{%
                \@tempswatrue%
                \def\@tempa{##2##4:##3##4}%
              }{}%
            \fi%
          }%
          \tud@reserved b0j:1030:1456:mm\@nil%
          \tud@reserved b1j:728:1030:mm\@nil%
          \tud@reserved b2j:515:728:mm\@nil%
          \tud@reserved b3j:364:515:mm\@nil%
          \tud@reserved b4j:257:364:mm\@nil%
          \tud@reserved b5j:182:257:mm\@nil%
          \tud@reserved b6j:128:182:mm\@nil%
          \tud@reserved ansia:8.5:11:in\@nil%
          \tud@reserved ansib:11:17:in\@nil%
          \tud@reserved ansic:17:22:in\@nil%
          \tud@reserved ansid:22:34:in\@nil%
          \tud@reserved ansie:34:44:in\@nil%
          \tud@reserved screen:225:180:mm\@nil%
        \fi%
      \fi%
    \fi%
    \if@tempswa%
      \cseappto{tud@x@geometry@#1}{\@tempa,}%
      \def\@tempb##1:##2:##3\@nil{%
        \IfArgIsEmpty{##2}{}{%
          \ifstr{#1}{paper}{%
            \setlength\paperwidth{##1}%
            \setlength\paperheight{##2}%
          }{%
            \ifstr{#1}{layout}{%
              \setlength\tud@len@layoutwidth{##1}%
              \setlength\tud@len@layoutheight{##2}%
            }{}%
          }%
        }%
      }%
      \expandafter\@tempb\@tempa::\@nil%
    \else%
      \appto\tud@x@geometry@parameter{#2,}%
    \fi%
  }
  \newcommand*\tud@area@set[1]{%
    \letcs{\@tempa}{tud@x@geometry@#1}%
    \ifdefvoid{\@tempa}{}{%
      \def\@tempb##1:##2:##3\@nil{%
        \tud@cmd@store{@tempa}%
        \tud@cmd@store{@tempb}%
        \tud@cmd@store{@tempc}%
        \IfArgIsEmpty{##2}{%
          \KOMAoption{paper}{##1}%
        }{%
          \if@landscape%
            \KOMAoption{paper}{##2:##1}%
          \else%
            \KOMAoption{paper}{##1:##2}%
          \fi%
        }%
        \tud@cmd@restore{@tempa}%
        \tud@cmd@restore{@tempb}%
        \tud@cmd@restore{@tempc}%
      }%
      \def\@tempc##1{\@tempb##1::\@nil}%
      \expandafter\forcsvlist\expandafter\@tempc\expandafter{\@tempa}%
    }%
  }
  \newcommand*\tud@x@geometry@init{}
  \newcommand*\tud@x@geometry@paper{}
  \newcommand*\tud@x@geometry@layout{}
  \newcommand*\tud@x@geometry@parameter{}
  \newcommand*\tud@geometry[2]{%
    \ifGm@layout%
      \setlength\tud@len@layoutheight{\Gm@layoutheight}%
      \setlength\tud@len@layoutwidth{\Gm@layoutwidth}%
    \else%
      \setlength\tud@len@layoutheight{\paperheight}%
      \setlength\tud@len@layoutwidth{\paperwidth}%
    \fi%
    \let\tud@x@geometry@paper\@empty%
    \let\tud@x@geometry@layout\@empty%
    \let\tud@x@geometry@parameter\@empty%
    \TUD@parameter@set{geometry}{#1}%
    \tud@area@set{paper}%
    \ifstr{#2}{newgeometry}{%
      \eappto\Gm@restore@org{%
        \paperwidth=\the\paperwidth\relax%
        \paperheight=\the\paperheight\relax%
      }%
    }{%
      \etex@unexpanded{\epreto{\tud@x@geometry@parameter}}{%
        paperwidth=\the\paperwidth,paperheight=\the\paperheight,%
      }%
    }%
    \ifx\tud@x@geometry@layout\@empty\else%
      \begingroup%
        \setlength\paperwidth{\Gm@layoutwidth}%
        \setlength\paperheight{\Gm@layoutheight}%
        \tud@area@set{layout}%
        \edef\tud@reserved{%
          \endgroup%
          \etex@unexpanded{\epreto{\tud@x@geometry@parameter}}{%
            layoutwidth=\the\paperwidth,layoutheight=\the\paperheight,%
          }%
        }%
      \tud@reserved%
    \fi%
    \def\@tempa{\tud@cmd@use{#2}}%
    \expandafter\@tempa\expandafter{\tud@x@geometry@parameter}%
    \ifstr{#2}{geometry}{%
      \ifbool{@tud@x@geometry@enabled}{%
        \eappto\tud@x@geometry@init{,\expandonce\tud@x@geometry@parameter}%
      }{}%
    }{}%
  }
  \renewcommand*\geometry[1]{\tud@geometry{#1}{geometry}}
  \renewcommand*\newgeometry[1]{%
    \tud@cmd@store{Gm@restore@org}%
    \tud@geometry{#1}{newgeometry}%
    \tud@cmd@restore{Gm@restore@org}%
  }
  \apptocmd{\Gm@changelayout}{%
    \ifboolexpr{bool {@tud@x@geometry@enabled} and bool {@atdocument}}{%
      \tud@cdgeometry@process%
    }{}%
  }{}{\tud@patch@wrn{Gm@changelayout}}%
  \renewcommand*\restoregeometry[1][]{%
    \IfArgIsEmpty{#1}{}{%
      \tud@cmd@store{TUD@SpecialOptionAtDocument}%
      \let\TUD@SpecialOptionAtDocument\@gobble%
      \TUDoption{cdgeometry}{#1}%
      \tud@cmd@restore{TUD@SpecialOptionAtDocument}%
    }%
    \ifnum\tud@cdgeometry@num=\@ne\relax
      \tud@loadgeometry{init@custom}%
    \else%
      \tud@loadgeometry{init@typearea}%
    \fi%
    \tud@AfterChangingArea%
  }%
  \newcommand*\tud@cdgeometry@hmargin{}%
  \newcommand*\tud@cdgeometry@vmargin{}%
  \newcommand*\tud@cdgeometry@tudmargin{}%
  \tud@if@v@lower{2.03}{\newcommand*\tud@cdgeometry@ddcmargin{}}{}%
  \renewcommand*\tud@cdgeometry@process{%
      \tud@AfterChangingArea%
  }%
  \renewcommand*\tud@cdgeometry@@process{%
    \csuse{@ta@usegeometryfalse}%
    \tud@cdgeometry@set%
    \ifnum\tud@cdgeometry@num<\tw@\relax% false/custom
      \ifcase\tud@cdgeometry@num\relax%
        \ifGm@layout%
          \tud@skip@store{paperheight}%
          \tud@skip@store{paperwidth}%
          \setlength\paperheight{\tud@len@layoutheight}%
          \setlength\paperwidth{\tud@len@layoutwidth}%
        \fi%
        \tud@cmd@store{activateareas}%
        \tud@cmd@store{tud@AfterChangingArea}%
        \let\activateareas\relax%
        \let\tud@AfterChangingArea\relax%
        \recalctypearea%
        \ifGm@layout%
          \tud@skip@restore{paperheight}%
          \tud@skip@restore{paperwidth}%
        \fi%
        \tud@cmd@restore{activateareas}%
        \tud@cmd@restore{tud@AfterChangingArea}%
        \edef\tud@cdgeometry@hmargin{%
          left=\the\dimexpr\oddsidemargin+1in-\ta@bcor\relax,%
          textwidth=\the\textwidth,%
          \tud@cdgeometry@mpincl,%
          marginparwidth=\the\marginparwidth,%
          marginparsep=\the\marginparsep,%
          \if@reversemargin%
            reversemarginpar=true,%
          \else%
            reversemarginpar=false,%
          \fi%
          bindingoffset=\the\ta@bcor%
        }%
        \edef\tud@cdgeometry@vmargin{%
          \if@hincl%
            includehead=true,%
            top=\the\dimexpr\topmargin+1in\relax,%
          \else%
            includehead=false,%
            top=\the\dimexpr\topmargin%
              +\headheight+\headsep+1in\relax,%
          \fi%
          headheight=\the\headheight,%
          headsep=\the\headsep,%
          textheight=\the\textheight,%
          \tud@cdgeometry@fincl,%
          footskip=\the\footskip%
        }%
      \else% custom
        \ifGm@pass\else%
          \edef\tud@cdgeometry@hmargin{%
            left=\Gm@lmargin,%
            right=\Gm@rmargin,%
            \ifGm@includemp%
              includemp=true,%
            \else%
              includemp=false,%
            \fi%
            marginparwidth=\the\marginparwidth,%
            marginparsep=\the\marginparsep,%
            \if@reversemargin%
              reversemarginpar=true,%
            \else%
              reversemarginpar=false,%
            \fi%
            bindingoffset=\the\Gm@bindingoffset%
          }%
          \edef\tud@cdgeometry@vmargin{%
            \ifGm@includehead%
              includehead=true,%
              top=\the\dimexpr\topmargin+1in\relax,%
            \else%
              includehead=false,%
              top=\the\dimexpr\topmargin%
                +\headheight+\headsep+1in\relax,%
            \fi%
            headheight=\the\headheight,%
            headsep=\the\headsep,%
            textheight=\the\textheight,%
            \ifGm@includefoot%
              includefoot=true,%
            \else%
              includefoot=false,%
            \fi%
            footskip=\the\footskip%
          }%
        \fi%
      \fi%
      \setlength\tud@len@areadiff{%
        \dimexpr\tud@len@topmargin+\tud@len@barheight+\tud@len@headsep%
          -\topmargin-\headheight-\headsep-1in\relax%
      }%
      \ifdim\tud@len@areadiff<\z@\relax%
        \addtolength\tud@len@headsep{-\tud@len@areadiff}%
        \setlength\@tempdima{\z@}%
      \else%
        \setlength\@tempdima{\tud@len@areadiff}%
      \fi%
      \edef\tud@cdgeometry@tudmargin{%
        ignorehead=true,%
        top=\the\dimexpr\tud@len@topmargin+\tud@len@barheight%
          +\tud@len@headsep\relax,%
        headheight=\the\dimexpr\tud@len@topmargin+\tud@len@barheight%
          -\tud@len@logoy\relax,%
        headsep=\the\tud@len@headsep,%
        textheight=\the\dimexpr\textheight-\@tempdima\relax%
      }%
      \tud@if@v@lower{2.03}{%
        \setlength\tud@len@ddcdiff{%
          \dimexpr.6\tud@len@topmargin-\footskip+\tud@len@headsep%
            +\footheight-1.25\baselineskip\relax%
        }%
        \edef\tud@cdgeometry@ddcmargin{%
          textheight=\the\dimexpr\textheight-\tud@len@areadiff%
            -\tud@len@ddcdiff\relax,%
          footskip=\the\dimexpr\footskip+\tud@len@ddcdiff\relax%
        }%
      }{}%
      \ifdim\dimexpr\tud@dim@extrabottommargin\relax=\z@\relax\else%
        \ClassWarning{\TUD@Class@Name}{%
          Option `extrabottommargin' is ineffective when\MessageBreak%
          package typearea or custom layout is used\MessageBreak%
          (`cdgeometry=false/custom')%
        }%
      \fi%
    \else%  true/symmetric/twoside
      \ifcase\tud@cdgeometry@num\relax\or\or%  true
        \setlength\@tempdima{\tud@len@widemargin}%
        \if@reversemargin%
          \setlength\@tempdimc{\tud@len@widemargin}%
        \else%
          \setlength\@tempdimc{\tud@len@slimmargin}%
        \fi%
      \or% symmetric
        \setlength\@tempdima{.5\tud@len@both}%
        \setlength\@tempdimc{.5\tud@len@both}%
      \or% twoside
        \if@twoside%
          \setlength\@tempdima{.4\tud@len@both}%
        \else%
          \setlength\@tempdima{.5\tud@len@both}%
        \fi%
        \setlength\@tempdimc{.5\tud@len@both}%
        \if@twoside%
          \if@reversemargin%
            \setlength\@tempdimc{.4\tud@len@both}%
          \else%
            \setlength\@tempdimc{.6\tud@len@both}%
          \fi%
        \fi%
      \fi%
      \addtolength\@tempdimc{-\headsep}%
      \setlength\@tempdimb{%
        \dimexpr\tud@len@layoutwidth-\tud@len@both-\ta@bcor\relax%
      }%
      \if@mincl%
        \addtolength\@tempdimb{-\@tempdimc}%
      \fi%
      \edef\tud@cdgeometry@hmargin{%
        left=\the\@tempdima,%
        textwidth=\the\@tempdimb,%
        \tud@cdgeometry@mpincl,%
        marginparwidth=\the\@tempdimc,%
        marginparsep=\the\dimexpr.5\headsep\relax,%
        \if@reversemargin%
          reversemarginpar=true,%
        \else%
          reversemarginpar=false,%
        \fi%
        bindingoffset=\the\ta@bcor%
      }%
      \if@twoside%
        \ifcase\tud@cdgeometry@num\relax\or\or% true
          \appto\tud@cdgeometry@hmargin{,asymmetric}%
        \else% symmetric/twoside
          \appto\tud@cdgeometry@hmargin{,twoside}%
        \fi%
      \fi%
      \if@twocolumn%
        \appto\tud@cdgeometry@hmargin{,twocolumn}%
      \fi%
      \tud@if@v@lower{2.03}{%
        \edef\tud@cdgeometry@vmargin{%
          \tud@cdgeometry@hincl,%
          top=\the\dimexpr.5\tud@len@both\relax,%
          headheight=\the\headheight,%
          headsep=\the\tud@len@headsep,%
          bottom=\the\dimexpr.5\tud@len@both+\tud@dim@extrabottommargin\relax,%
          \tud@cdgeometry@fincl,%
          footskip=\the\dimexpr\tud@len@headsep+\footheight%
            -1.25\baselineskip\relax%
        }%
      }{%
        \edef\tud@cdgeometry@vmargin{%
          \tud@cdgeometry@hincl,%
          top=\the\tud@len@slimmargin,%
          headheight=\the\headheight,%
          headsep=\the\headsep,%
          bottom=\the\dimexpr\tud@len@widemargin%
            +\tud@dim@extrabottommargin\relax,%
          \tud@cdgeometry@fincl,%
          footskip=\the\dimexpr\tud@len@footsep+\footheight\relax%
        }%
      }%
      \edef\tud@cdgeometry@tudmargin{%
        ignorehead=true,%
        top=\the\dimexpr\tud@len@topmargin+\tud@len@barheight%
          +\tud@len@headsep\relax,%
        headheight=\the\dimexpr\tud@len@topmargin+\tud@len@barheight%
          -\tud@len@logoy\relax,%
        headsep=\the\tud@len@headsep%
      }%
      \setlength\tud@len@areadiff{%
        \dimexpr\tud@len@topmargin+\tud@len@barheight+\tud@len@headsep%
          -\tud@len@slimmargin\relax%
      }%
      \tud@if@v@lower{2.03}{%
        \setlength\tud@len@areadiff{%
          \dimexpr\tud@len@topmargin+\tud@len@barheight+\tud@len@headsep%
            -.5\tud@len@both\relax%
        }%
        \setlength\tud@len@ddcdiff{.6\tud@len@topmargin}%
        \edef\tud@cdgeometry@ddcmargin{%
          \if@fincl%
            bottom=\the\dimexpr.5\tud@len@both+\tud@dim@extrabottommargin%
              +\tud@len@ddcdiff+\tud@len@headsep+\footheight%
              -1.25\baselineskip\relax,%
          \else%
            bottom=\the\dimexpr.5\tud@len@both+\tud@dim@extrabottommargin%
              +\tud@len@ddcdiff\relax,%
          \fi%
          footskip=\the\dimexpr\tud@len@headsep+\footheight%
            -1.25\baselineskip+\tud@len@ddcdiff\relax,%
        }%
      }{}%
    \fi%
    \ifdim\tud@len@areadiff<\z@\relax\setlength\tud@len@areadiff{\z@}\fi%
    \global\tud@len@areadiff=\tud@len@areadiff%
    \if@tud@cdgeometry@adjust%
      \setlength\tud@len@areaheadvskip{.3\tud@len@topmargin}%
    \else%
      \setlength\tud@len@areaheadvskip{.6\tud@len@topmargin}%
    \fi%
    \global\tud@len@areaheadvskip=\tud@len@areaheadvskip%
    \tud@if@v@lower{2.03}{%
      \ifdim\tud@len@ddcdiff<\z@\relax\setlength\tud@len@ddcdiff{\z@}\fi%
      \global\tud@len@ddcdiff=\tud@len@ddcdiff%
    }{}%
    \tud@cdgeometry@@@process%
  }%
  \newcommand*\tud@cdgeometry@@@process{%
    \eappto\tud@cdgeometry@hmargin{,layouthoffset=\the\Gm@layouthoffset}%
    \eappto\tud@cdgeometry@vmargin{,layoutvoffset=\the\Gm@layoutvoffset}%
    \tud@if@v@lower{2.03}{%
      \edef\@tempa{%
        \tud@cdgeometry@hmargin,%
        \tud@cdgeometry@vmargin,%
        \tud@cdgeometry@tudmargin,%
        \tud@cdgeometry@ddcmargin,%
        ignorehead,ignorefoot%
      }%
      \tud@setgeometry{\@tempa}%
      \tud@savegeometry{tudareaddc}%
    }{}%
    \edef\@tempa{%
      \tud@cdgeometry@hmargin,%
      \tud@cdgeometry@vmargin,%
      \tud@cdgeometry@tudmargin%
    }%
    \tud@setgeometry{\@tempa}%
    \tud@savegeometry{tudarea}%
    \edef\@tempa{%
      \tud@cdgeometry@hmargin,%
      \tud@cdgeometry@vmargin%
    }%
    \tud@setgeometry{\@tempa}%
    \tud@savegeometry{stdarea}%
    \if@atdocument%
      \ifstr{\tud@currentgeometry}{stdarea}{}{%
        \expandafter\tud@loadgeometry\expandafter{\tud@currentgeometry}%
      }%
    \fi%
  }%
  \newcommand*\tud@cdgeometry@hincl{%
    \if@hincl%
      includehead=true%
    \else%
      includehead=false%
    \fi%
  }%
  \newcommand*\tud@cdgeometry@fincl{%
    \if@fincl%
      includefoot=true%
    \else%
      includefoot=false%
    \fi%
  }%
  \newcommand*\tud@cdgeometry@mpincl{%
    \if@mincl%
      includemp=true%
    \else%
      includemp=false%
    \fi%
  }%
}
\newcommand*\tud@currentgeometry{}
\newcommand*\tud@BeforeSelectAnyPageStyle[1]{%
  \ifstr{#1}{\GetRealPageStyle{#1}}{%
    \tud@if@tudheadings{#1}{%
      \tud@if@v@lower{2.03}{%
        \tud@ddc@check%
        \ifcase\@tempb\relax% \tud@ddc@foot@num=false
          \ifstr{\tud@currentgeometry}{tudarea}{}{%
            \tud@loadgeometry{tudarea}%
            \gdef\tud@currentgeometry{tudarea}%
          }%
        \else% \tud@ddc@foot@num!=false
          \ifstr{\tud@currentgeometry}{tudareaddc}{}{%
            \tud@loadgeometry{tudareaddc}%
            \gdef\tud@currentgeometry{tudareaddc}%
          }%
        \fi%
      }{%
        \ifstr{\tud@currentgeometry}{tudarea}{}{%
          \tud@loadgeometry{tudarea}%
          \gdef\tud@currentgeometry{tudarea}%
        }%
      }%
      \setlength\tud@len@areavskip{\z@}%
      \tud@font@koma@set{pagefoot}{\usekomafont{tudheadings}}%
      \tud@font@koma@set{pagenumber}{\usekomafont{tudheadings}}%
    }{%
      \ifstr{\tud@currentgeometry}{stdarea}{}{%
        \tud@loadgeometry{stdarea}%
        \gdef\tud@currentgeometry{stdarea}%
      }%
      \setlength\tud@len@areavskip{\tud@len@areadiff}%
      \ifnum\tud@cdgeometry@num>\@ne\relax% true/symmetric/twoside
        \if@hincl%
          \addtolength\tud@len@areavskip{%
            \dimexpr-\headheight-\tud@len@headsep\relax%
          }%
        \fi%
      \fi%
      \tud@font@koma@unset{pagefoot}%
      \tud@font@koma@unset{pagenumber}%
    }%
    \global\tud@len@areavskip=\tud@len@areavskip%
  }{}%
}
\newcommand*\tud@AfterChangingArea{%
  \tud@cdgeometry@@process%
  \KOMAoptions{pagesize=\@pagesizelast}%
  \global\@tud@mainlogo@settrue%
  \gdef\tud@currentgeometry{}%
  \expandafter\pagestyle\expandafter{\currentpagestyle}%
}
\newcommand*\tud@cdgeometry@init{%
  \AtEndPreamble{%
    \if@tud@x@standalone@crop%
      \pagestyle{empty}%
      \let\tud@AfterChangingArea\relax%
      \let\tud@cdgeometry@process\relax%
    \else%
      \csuse{@ta@usegeometryfalse}%
      \def\tud@reserved##1{%
        \tud@setgeometry{%
          \tud@cdgeometry@mpincl,%
          \if@reversemargin%
            reversemarginpar=true,%
          \else%
            reversemarginpar=false,%
          \fi%
          bindingoffset=\the\ta@bcor,%
          \tud@cdgeometry@hincl,%
          \tud@cdgeometry@fincl,%
          \tud@x@geometry@init,%
          driver=none%
        }%
        \addtolength\oddsidemargin{-\Gm@layouthoffset}%
        \addtolength\evensidemargin{-\Gm@layouthoffset}%
        \addtolength\topmargin{-\Gm@layoutvoffset}%
        \tud@savegeometry{init@##1}%
      }%
      \begingroup%
        \let\scr@grouplevel@test\@gobble%
        \setlength\paperheight{\Gm@layoutheight}%
        \setlength\paperwidth{\Gm@layoutwidth}%
        \let\activateareas\relax%
        \tud@x@ta@warnings@off%
        \KOMAoptionOf[\def\@tempa]{typearea.\scr@pkgextension}{DIV}%
        \def\@tempb{{0}}%
        \ifx\@tempa\@tempb\relax%
          \KOMAoptionOf[\def\@tempa]{typearea.\scr@pkgextension}{paper}%
          \@for\@tempb:=\@tempa\do{%
            \@tempswatrue%
            \ifx\@tempb\defaultpapersize\relax%
              \@tempswafalse%
            \fi%
          }%
          \if@tempswa%
            \KOMAoptions{DIV=11}%
          \fi%
        \fi%
        \recalctypearea%
        \tud@x@ta@warnings@on%
        \edef\tud@x@geometry@init{%
          left=\the\dimexpr\oddsidemargin+1in-\ta@bcor\relax,%
          textwidth=\the\textwidth,%
          marginparwidth=\the\marginparwidth,%
          marginparsep=\the\marginparsep,%
          bindingoffset=\the\ta@bcor,%
          \if@hincl%
            top=\the\dimexpr\topmargin+1in\relax,%
          \else%
            top=\the\dimexpr\topmargin%
              +\headheight+\headsep+1in\relax,%
          \fi%
          headheight=\the\headheight,%
          headsep=\the\headsep,%
          textheight=\the\textheight,%
          footskip=\the\footskip%
        }%
        \tud@reserved{typearea}%
        \global\let\Gm@restore@@init@typearea\Gm@restore@@init@typearea%
      \endgroup%
      \tud@reserved{custom}%
      \AfterCalculatingTypearea{\tud@AfterChangingArea}%
      \AfterSettingArea{\tud@AfterChangingArea}%
      \ifundef{\AfterRestoreareas}{}{%
        \AfterRestoreareas{\tud@AfterChangingArea}%
      }%
      \BeforeSelectAnyPageStyle{\tud@BeforeSelectAnyPageStyle{##1}}%
      \tud@cdgeometry@process%
    \fi%
    \let\tud@cdgeometry@init\relax%
  }%
}
\AfterPackage!{scrlayer-scrpage}{\tud@cdgeometry@init}
\TUD@UnwindPackage{geometry}{%
  \newif\ifGm@layout%
  \newif\ifGm@showcrop%
  \newif\ifGm@pass%
  \let\Gm@layoutheight\paperheight%
  \let\Gm@layoutwidth\paperwidth%
  \let\Gm@layouthoffset\z@%
  \let\Gm@layoutvoffset\z@%
  \renewcommand*\tud@cdgeometry@@process{\tud@cdgeometry@set}%
  \let\tud@BeforeSelectAnyPageStyle\@gobble%
  \providecommand*\tud@setgeometry[1]{}%
  \providecommand*\tud@savegeometry[1]{}%
}
\patchcmd{\cleardoubleoddpageusingstyle}{\pagestyle}{%
  \let\tud@BeforeSelectAnyPageStyle\@gobble\pagestyle%
}{}{\tud@patch@wrn{cleardoubleoddpageusingstyle}}
\patchcmd{\cleardoubleevenpageusingstyle}{\pagestyle}{%
  \let\tud@BeforeSelectAnyPageStyle\@gobble\pagestyle%
}{}{\tud@patch@wrn{cleardoubleevenpageusingstyle}}
\patchcmd{\cleardoublepageusingstyle}{\pagestyle}{%
  \let\tud@BeforeSelectAnyPageStyle\@gobble\pagestyle%
}{}{\tud@patch@wrn{cleardoublepageusingstyle}}
\tud@if@v@lower{2.03}{%
  \newcommand*\tud@ddc@enlargepage[1][]{%
    \tud@if@tudheadings{#1}{%
      \ifstr{\tud@currentgeometry}{tudareaddc}{}{%
        \tud@ddc@check%
        \ifcase\@tempb\relax\else% \tud@ddc@foot@num!=false
          \enlargethispage{-\tud@len@ddcdiff}%
        \fi%
      }%
    }{}%
  }%
}{}
%%% From File: tudscr-pagestyle.dtx
\if@tud@x@standalone@crop
  \PreventPackageFromLoading{scrlayer-scrpage}%
\else
  \AtEndPreamble{\RequirePackage{scrlayer-scrpage}[2013/12/14]}%
\fi
\AfterPackage{scrlayer-scrpage}{%
  \DeclareNewLayer[%
    background,headsep,%
    addhoffset=\dimexpr\tud@len@logox-\tud@len@widemargin\relax,%
    addwidth=\dimexpr-\tud@len@logox+\tud@len@widemargin\relax,%
    voffset=\tud@len@logoy,%
    addvoffset=\tud@len@layoutvoffset,%
    contents={%
      \tud@mainlogo@set%
      \tud@headlogo@option@set%
      \tud@mainlogo@use\hfill\tud@headlogo@use%
    },%
  ]{tudheadings.head.content}%
  \DeclareNewLayer[%
    background,%
    width=\dimexpr\tud@len@layoutwidth+\tud@dim@bleedmargin*2\relax,%
    addhoffset=\dimexpr\tud@len@layouthoffset-\tud@dim@bleedmargin\relax,%
    height=\dimexpr\tud@len@topmargin+\tud@dim@bleedmargin\relax,%
    addvoffset=\dimexpr\tud@len@layoutvoffset-\tud@dim@bleedmargin\relax,%
    contents={%
      \ifnum\tud@head@bar@num>\tw@\relax% cdhead=color
        \color{HKS41}%
        \rule{\layerwidth}{\layerheight}%
      \fi%
    },%
  ]{tudheadings.head.back}%
  \DeclareNewLayer[%
    background,%
    width=\dimexpr\tud@len@layoutwidth+\tud@dim@bleedmargin*2\relax,%
    addhoffset=\dimexpr\tud@len@layouthoffset-\tud@dim@bleedmargin\relax,%
    height=\tud@len@barheight,%
    voffset=\tud@len@topmargin,%
    addvoffset=\tud@len@layoutvoffset,%
    contents={%
      \ifnum\tud@head@bar@num>\@ne\relax% cdhead=barcolor/color
        \color{HKS41!60}%
        \setlength{\@tempdima}{\dimexpr\ht\strutbox-\tud@len@barheight\relax}%
        \ifdim\@tempdima<\z@\relax\setlength\@tempdima{\z@}\fi%
        \raisebox{\@tempdima}{\rule{\layerwidth}{\layerheight}}%
      \fi%
    },%
  ]{tudheadings.head.bar}%
  \DeclareNewLayer[%
    background,headsep,%
    voffset=\dimexpr\tud@len@topmargin+\tud@len@line\relax,%
    addvoffset=\tud@len@layoutvoffset,%
    contents={%
      \tud@head@font@set%
      \tud@head@text@set%
      \tud@head@text@box%
    },%
  ]{tudheadings.head.text}%
  \DeclareNewLayer[%
    background,headsep,%
    voffset=\dimexpr\tud@len@topmargin-.5\tud@len@line\relax,%
    addvoffset=\tud@len@layoutvoffset,%
    contents={%
      \ifnum\tud@head@bar@num<\tw@\relax% cdhead=nocolor/litecolor
        \if@tud@head@widebar\else\tud@head@rule{\layerwidth}\fi%
      \fi%
    },%
  ]{tudheadings.head.upline}%
  \DeclareNewLayer[%
    background,headsep,%
    voffset=\dimexpr\tud@len@topmargin+\tud@len@barheight%
      -.5\tud@len@line\relax,%
    addvoffset=\tud@len@layoutvoffset,%
    contents={%
      \ifnum\tud@head@bar@num<\tw@\relax% cdhead=nocolor/litecolor
        \if@tud@head@widebar\else\tud@head@rule{\layerwidth}\fi%
      \fi%
    },%
  ]{tudheadings.head.lowline}%
  \DeclareNewLayer[%
    background,%
    width=\dimexpr\tud@len@layoutwidth+\tud@dim@bleedmargin*2\relax,%
    addhoffset=\dimexpr\tud@len@layouthoffset-\tud@dim@bleedmargin\relax,%
    voffset=\dimexpr\tud@len@topmargin-.5\tud@len@line\relax,%
    addvoffset=\tud@len@layoutvoffset,%
    contents={%
      \ifnum\tud@head@bar@num<\tw@\relax% cdhead=nocolor/litecolor
        \if@tud@head@widebar\tud@head@rule{\layerwidth}\fi%
      \fi%
    },%
  ]{tudheadings.head.uplinewide}%
  \DeclareNewLayer[%
    background,%
    width=\dimexpr\tud@len@layoutwidth+\tud@dim@bleedmargin*2\relax,%
    addhoffset=\dimexpr\tud@len@layouthoffset-\tud@dim@bleedmargin\relax,%
    voffset=\dimexpr\tud@len@topmargin+\tud@len@barheight%
      -.5\tud@len@line\relax,%
    addvoffset=\tud@len@layoutvoffset,%
    contents={%
      \ifnum\tud@head@bar@num<\tw@\relax% cdhead=nocolor/litecolor
        \if@tud@head@widebar\tud@head@rule{\layerwidth}\fi%
      \fi%
    },%
  ]{tudheadings.head.lowlinewide}%
  \DeclareNewLayer[%
    foreground,headsep,%
    addvoffset=.5\tud@len@headsep,%
    height=\baselineskip,%
    contents={\if@tud@head@date\hfill\tud@date@print\fi},%
  ]{tudheadings.head.date}%
  \DeclareNewLayer[%
    background,foot,%
    width=\dimexpr\tud@len@layoutwidth+\tud@dim@bleedmargin*2\relax,%
    hoffset=\dimexpr\tud@len@layouthoffset-\tud@dim@bleedmargin\relax,%
    height=\dimexpr\tud@len@layoutheight-\layeryoffset%
      +\tud@len@layoutvoffset+\tud@dim@bleedmargin\relax,%
    addvoffset=-\dp\strutbox,%
    contents={%
      \if@tud@foot@colored%
        \let\@tempc\relax%
        \ifdefvoid{\tud@pagecolor}{%
          \ifcase\tud@head@bar@num\relax\or% cdhead=litecolor
            \def\@tempc{\color{HKS41!60}}%
          \or% cdhead=barcolor
            \def\@tempc{\color{HKS41!60}}%
          \or% cdhead=color
            \def\@tempc{\color{HKS41}}%
          \fi%
        }{%
          \def\@tempc{\color{HKS41}}%
          \ifstr{\tud@pagecolor}{HKS41}{\def\@tempc{\color{HKS41!60}}}{}%
        }%
        \ifx\@tempc\relax\else%
          \@tempc\rule{\layerwidth}{\layerheight}%
        \fi%
      \fi%
    },%
  ]{tudheadings.foot.back}%
  \tud@if@v@lower{2.03}{%
    \ModifyLayer[%
      addvoffset=-\tud@len@ddcdiff+\ht\strutbox,%
      contents={%
        \if@tud@foot@colored%
          \let\@tempc\relax%
          \ifdefvoid{\tud@pagecolor}{%
            \ifcase\tud@head@bar@num\relax\or\or% cdhead=barcolor
              \def\@tempc{\color{HKS41!60}}%
            \or% cdhead=color
              \def\@tempc{\color{HKS41}}%
            \fi%
          }{%
            \def\@tempc{\color{HKS41}}%
            \ifstr{\tud@pagecolor}{HKS41}{\def\@tempc{\color{HKS41!60}}}{}%
          }%
          \ifx\@tempc\relax\else%
            \tud@ddc@check%
            \ifcase\@tempb\relax% \tud@ddc@foot@num=false
              \vbox to \layerheight{%
                \vfil\@tempc%
                \rule{\layerwidth}{%
                  \dimexpr\layerheight-\tud@len@ddcdiff+\ht\strutbox\relax%
                }%
              }%
            \else% \tud@ddc@foot@num!=false
              \@tempc\rule{\layerwidth}{\layerheight}%
            \fi%
          \fi%
        \fi%
      },%
    ]{tudheadings.foot.back}%
  }{}%
  \DeclareNewLayer[%
    background,foot,%
    height=\dimexpr\tud@len@layoutheight-\layeryoffset%
      +\tud@len@layoutvoffset\relax,%
    contents={%
      \TUD@deprecated@lengthcs[%
        \global\@tud@footlogo@option@settrue%
      ]{footlogoheight}%
      \setlength\@tempdima{\dimexpr\layerheight-\dp\strutbox\relax}%
      \tud@footlogo@cmd@use{\@tempdima}{\layerwidth}%
      \tud@footlogo@ddc@use{\@tempdima}{\layerwidth}%
      \tud@footcontent@use{\@tempdima}{\layerwidth}%
    },%
  ]{tudheadings.foot.content}%
  \tud@if@v@lower{2.03}{%
    \ModifyLayer[%
      addvoffset=-\tud@len@ddcdiff+\ht\strutbox,%
      contents={%
        \TUD@deprecated@lengthcs[%
          \global\@tud@footlogo@option@settrue%
        ]{footlogoheight}%
        \setlength\@tempdima{\dimexpr\layerheight-\dp\strutbox\relax}%
        \tud@ddc@check%
        \ifcase\@tempb\relax% \tud@ddc@foot@num=false
          \addtolength\@tempdima{\dimexpr\ht\strutbox-\tud@len@ddcdiff\relax}%
          \vskip\dimexpr\tud@len@ddcdiff-\ht\strutbox-\baselineskip\relax%
        \fi%
        \tud@footlogo@cmd@use{\@tempdima}{\layerwidth}%
        \tud@footlogo@ddc@use{\@tempdima}{\layerwidth}%
        \tud@footcontent@use{\@tempdima}{\layerwidth}%
      },%
    ]{tudheadings.foot.content}%
  }{}%
  \DeclareNewLayer[%
    background,%
  ]{tudheadings.last}%
  \DeclareNewPageStyleByLayers[%
    onselect=\tud@ps@onselect,onbackground=\tud@ps@onbackground%
  ]{tudheadings}{%
    tudheadings.head.back,%
    tudheadings.head.content,%
    tudheadings.head.bar,%
    tudheadings.head.text,%
    tudheadings.head.upline,%
    tudheadings.head.lowline,%
    tudheadings.head.uplinewide,%
    tudheadings.head.lowlinewide,%
    tudheadings.head.date,%
    tudheadings.foot.back,%
    tudheadings.foot.content,%
    tudheadings.last,%
    scrheadings.foot.odd,%
    scrheadings.foot.even,%
    scrheadings.foot.oneside,%
    scrheadings.foot.above.line,%
    scrheadings.foot.below.line%
  }%
  \DeclareNewPageStyleAlias{tud}{tudheadings}%
  \DeclareNewPageStyleAlias{tudscr}{tudheadings}%
  \DeclareNewPageStyleAlias{tudscrheadings}{tudheadings}%
  \DeclareNewPageStyleByLayers[%
    onselect=\tud@ps@onselect,onbackground=\tud@ps@onbackground%
  ]{plain.tudheadings}{%
    tudheadings.head.back,%
    tudheadings.head.content,%
    tudheadings.head.bar,%
    tudheadings.head.text,%
    tudheadings.head.upline,%
    tudheadings.head.lowline,%
    tudheadings.head.uplinewide,%
    tudheadings.head.lowlinewide,%
    tudheadings.head.date,%
    tudheadings.foot.back,%
    tudheadings.foot.content,%
    tudheadings.last,%
    plain.scrheadings.foot.odd,%
    plain.scrheadings.foot.even,%
    plain.scrheadings.foot.oneside,%
    plain.scrheadings.foot.above.line,%
    plain.scrheadings.foot.below.line%
  }%
  \DeclareNewPageStyleAlias{plain.tudscrheadings}{plain.tudheadings}%
  \DeclareNewPageStyleAlias{tudplain}{plain.tudheadings}%
  \DeclareNewPageStyleAlias{tudscrplain}{plain.tudheadings}%
  \DeclareNewPageStyleAlias{tudheadingsplain}{plain.tudheadings}%
  \DeclareNewPageStyleAlias{tudscrheadingsplain}{plain.tudheadings}%
  \DeclareNewPageStyleByLayers[%
    onselect=\tud@ps@onselect,onbackground=\tud@ps@onbackground%
  ]{empty.tudheadings}{%
    tudheadings.head.back,%
    tudheadings.head.content,%
    tudheadings.head.bar,%
    tudheadings.head.text,%
    tudheadings.head.upline,%
    tudheadings.head.lowline,%
    tudheadings.head.uplinewide,%
    tudheadings.head.lowlinewide,%
    tudheadings.head.date,%
    tudheadings.foot.back,%
    tudheadings.foot.content,%
    tudheadings.last%
  }%
  \DeclareNewPageStyleAlias{empty.tudscrheadings}{empty.tudheadings}%
  \DeclareNewPageStyleAlias{tudempty}{empty.tudheadings}%
  \DeclareNewPageStyleAlias{tudscrempty}{empty.tudheadings}%
  \DeclareNewPageStyleAlias{tudheadingsempty}{empty.tudheadings}%
  \DeclareNewPageStyleAlias{tudscrheadingsempty}{empty.tudheadings}%
  \DeclareNewLayer[%
    background,%
    area=%
      {\dimexpr\tud@len@layouthoffset-\tud@dim@bleedmargin\relax}%
      {\dimexpr\tud@len@layoutvoffset-\tud@dim@bleedmargin\relax}%
      {\dimexpr\tud@len@layoutwidth+\tud@dim@bleedmargin*2\relax}%
      {\dimexpr\tud@len@layoutheight+\tud@dim@bleedmargin*2\relax}%
    ,%
    contents={%
      \ifdefvoid{\tud@pagecolor}{}{%
        \color{\tud@pagecolor}%
        \rule{\layerwidth}{\layerheight}%
      }%
    },%
  ]{tudheadings.pagecolor}%
  \AddLayersToPageStyle{@everystyle@}{tudheadings.pagecolor}%
}
\newcommand*\tud@ps@list{}
\listadd\tud@ps@list{tudheadings}
\listadd\tud@ps@list{plain.tudheadings}
\listadd\tud@ps@list{empty.tudheadings}
\newcommand*\tud@if@tudheadings[3]{%
  \xifinlist{\GetRealPageStyle{#1}}{\tud@ps@list}{#2}{#3}%
}
\patchcmd{\thispagestyle}{\gdef\@specialstyle{#1}}{%
  \xdef\@specialstyle{\GetRealPageStyle{#1}}%
}{}{\tud@patch@wrn{thispagestyle}}
\newcommand*\tud@pagestyle{}
\let\tud@pagestyle\pagestyle
\pretocmd{\tud@pagestyle}{%
  \tud@BeforeSelectAnyPageStyle{#1}%
  \edef\currentpagestyle{#1}%
}{}{\tud@patch@wrn{pagestyle}}
\tud@cmd@store{pagestyle}
\renewcommand*\pagestyle[1]{\AfterPackage!{scrlayer-scrpage}{\pagestyle{#1}}}
\BeforePackage{scrlayer-scrpage}{%
  \tud@cmd@restore{pagestyle}%
  \undef\tud@pagestyle%
}
\TUD@UnwindPackage{scrlayer-scrpage}{%
  \ifcsundef{if@chapter}{%
    \newif\if@chapter%
    \ifcsundef{chapter}{\@chapterfalse}{\@chaptertrue}%
  }{}%
  \cslet{ps@tudheadings}{\ps@headings}%
  \cslet{ps@plain.tudheadings}{\ps@plain}%
  \cslet{ps@empty.tudheadings}{\ps@empty}%
  \providecommand*\currentpagestyle{plain}%
  \providecommand*\BeforeSelectAnyPageStyle[1]{}%
  \providecommand*\GetRealPageStyle[1]{#1}%
  \let\pagestyle\tud@pagestyle%
  \undef\tud@pagestyle%
  \tud@cdgeometry@init%
}
\newcommand*\tud@ps@onselect{%
  \DeclarePageStyleAlias{plain}{plain.tudheadings}%
  \DeclarePageStyleAlias{headings}{tudheadings}%
  \def\sls@currentheadings{tudheadings}%
  \def\sls@currentplain{plain.tudheadings}%
}
\newcommand*\tud@head@logocolor{black}
\newcommand*\tud@head@fontcolor{}
\newcommand*\tud@foot@logocolor{black}
\newcommand*\tud@foot@fontcolor{}
\newcommand*\tud@ps@onbackground{%
  \ifdefvoid{\tud@pagecolor}{%
    \ifcase\tud@head@bar@num\relax% cdhead=nocolor
      \renewcommand*\tud@head@logocolor{black}%
      \renewcommand*\tud@head@fontcolor{}%
    \or% cdhead=litecolor
      \renewcommand*\tud@head@logocolor{HKS41}%
      \renewcommand*\tud@head@fontcolor{HKS41}%
    \or% cdhead=barcolor
      \renewcommand*\tud@head@logocolor{HKS41}%
      \renewcommand*\tud@head@fontcolor{white}%
    \or% cdhead=color
      \renewcommand*\tud@head@logocolor{white}%
      \renewcommand*\tud@head@fontcolor{white}%
    \fi%
    \ifcase\tud@head@bar@num\relax% cdhead=nocolor
      \renewcommand*\tud@foot@logocolor{black}%
      \renewcommand*\tud@foot@fontcolor{}%
      \if@tud@foot@colored%
        \ClassWarning{\TUD@Class@Name}{%
          It isn't possible to use a colored foot together\MessageBreak%
          with a non-colored head (`cdhead=nocolor')%
        }%
      \fi%
    \else% cdhead=*color
      \if@tud@foot@colored%
        \renewcommand*\tud@foot@logocolor{white}%
        \renewcommand*\tud@foot@fontcolor{white}%
      \else%
        \renewcommand*\tud@foot@logocolor{HKS41}%
        \renewcommand*\tud@foot@fontcolor{HKS41}%
      \fi%
    \fi%
  }{%
    \ifstr{\tud@pagecolor}{HKS41}{%
      \renewcommand*\tud@head@logocolor{white}%
      \renewcommand*\tud@head@fontcolor{white}%
      \renewcommand*\tud@foot@logocolor{white}%
        \renewcommand*\tud@foot@fontcolor{white}%
      \bool@std@lock{@tud@head@widebar}{true}%
    }{%
      \renewcommand*\tud@head@logocolor{HKS41}%
      \renewcommand*\tud@head@fontcolor{HKS41}%
      \ifcase\tud@head@bar@num\relax\or\or\or% cdhead=color
        \renewcommand*\tud@head@logocolor{white}%
        \renewcommand*\tud@head@fontcolor{white}%
      \fi%
      \if@tud@foot@colored%
        \renewcommand*\tud@foot@logocolor{white}%
        \renewcommand*\tud@foot@fontcolor{white}%
      \else%
        \renewcommand*\tud@foot@logocolor{HKS41}%
        \renewcommand*\tud@foot@fontcolor{HKS41}%
      \fi%
      \bool@std@lock{@tud@head@widebar}{true}%
    }%
  }%
  \let\tud@len@line\tud@len@thinline%
  \ifstr{\tud@head@fontcolor}{white}{\let\tud@len@line\tud@len@heavyline}{}%
  \global\let\tud@foot@fontcolor\tud@foot@fontcolor%
}
\newcommand*\tud@head@fontsize{}
\newcommand*\tud@head@font@light{}
\newcommand*\tud@head@font@bold{}
\newcommand*\tud@head@font@@bold{}
\newcommand*\tud@head@font@set{%
  \ifcase\tud@head@font@num\relax% false
    \ifnum\tud@cdfont@num>\z@\relax% true/heavy
      \if@tud@head@font@set%
        \ClassWarning{\TUD@Class@Name}{%
          It isn't possible to use `cdhead=false'\MessageBreak%
          together with `cdfont=true'%
        }%
      \fi%
      \TUDoptions{cdhead=true}%
    \fi%
  \fi%
  \if@tud@head@font@set%
    \DeclareFixedFont{\tud@head@font@light}{\encodingdefault}%
      {\sfdefault}{\mddefault}{\updefault}{\tud@head@fontsize}%
    \DeclareFixedFont{\tud@head@font@bold}{\encodingdefault}%
      {\sfdefault}{\bfdefault}{\updefault}{\tud@head@fontsize}%
    \protected\gdef\tud@head@font@@bold{%
      \usefont{\encodingdefault}{\sfdefault}{\bfdefault}{\updefault}%
    }%
    \ifcase\tud@head@font@num\relax\else% true/heavy
      \if@tud@univers%
        \ifcase\tud@head@font@num\relax\or% true
          \DeclareFixedFont{\tud@head@font@light}{\encodingdefault}%
            {\tud@univers}{l}{n}{\tud@head@fontsize}%
        \or% heavy
          \DeclareFixedFont{\tud@head@font@light}{\encodingdefault}%
            {\tud@univers}{m}{n}{\tud@head@fontsize}%
        \fi%
        \DeclareFixedFont{\tud@head@font@bold}{\encodingdefault}%
          {\tud@univers}{b}{n}{\tud@head@fontsize}%
        \protected\gdef\tud@head@font@@bold{%
          \usefont{\encodingdefault}{\tud@univers}{b}{n}%
        }%
      \fi%
    \fi%
    \global\@tud@head@font@setfalse%
    \global\@tud@head@text@settrue%
  \fi%
}
\newcommand*\tud@head@text@line{}
\newcommand*\tud@head@text@list{}
\newcommand*\tud@head@text@delimiter{}
\newcommand*\tud@head@text@buffer{}
\newcommand*\tud@head@text@add[3][{, }]{%
  \ifxblank{#3}{}{%
    \edef\tud@head@text@delimiter{\expandonce\tud@head@text@buffer}%
    \def\tud@head@text@buffer{#1}%
    \edef\@tempa{%
      \expandonce\tud@head@text@line%
      \expandonce\tud@head@text@delimiter%
      \etex@unexpanded{#2#3}%
    }%
    \settowidth\@tempdima{\@tempa}%
    \ifdim\@tempdima>\textwidth\relax%
      \listeadd\tud@head@text@list{\expandonce\tud@head@text@line}%
      \protected@edef\tud@head@text@line{#2#3}%
    \else%
      \edef\tud@head@text@line{\expandonce\@tempa}%
    \fi%
  }%
}
\newif\if@tud@head@text@set
\newcommand*\tud@head@text@wrn[1]{}
\newcommand*\tud@head@text@set{%
  \if@tud@head@text@set%
    \def\tud@head@text@line{}%
    \def\tud@head@text@list{}%
    \def\tud@head@text@buffer{}%
    \tud@head@text@add[\enskip]{\tud@head@font@bold}{\@faculty}%
    \tud@head@text@add{\tud@head@font@light}{\@department}%
    \tud@head@text@add{\tud@head@font@light}{\@institute}%
    \tud@head@text@add{\tud@head@font@light}{\@chair}%
    \listeadd\tud@head@text@list{\expandonce\tud@head@text@line}%
    \ifxblank{\@extraheadline}{}{%
      \listadd\tud@head@text@list{\tud@head@font@light\@extraheadline}%
    }%
    \gdef\tud@head@text@wrn##1{%
      \ClassWarning{\TUD@Class@Name}{%
        The given entries for the headline\MessageBreak%
        (faculty, institute etc.) are ##1\MessageBreak%
        too wide for the textwidth%
      }%
    }%
  \fi%
}
\newcommand*\tud@head@text@box{%
  \ifx\@faculty\@empty%
    \ClassWarningNoLine{\TUD@Class@Name}{No `\string\faculty' given}%
    \faculty{}%
  \fi%
  \def\@tempb{\tud@color{\tud@head@fontcolor}}%
  \def\@tempc{\depth+\tud@len@heavyline}%
  \def\@tempa##1{%
    \settowidth\@tempdima{##1}%
    \ifdim\@tempdima>\textwidth\relax%
      \tud@head@text@wrn{\the\dimexpr\@tempdima-\textwidth\relax}%
      \ifdim\dimexpr\@tempdima-\textwidth\relax>\hfuzz\relax%
        \hfuzz=\dimexpr\@tempdima-\textwidth\relax%
      \fi%
    \fi%
    \@tempb%
    \tud@head@text@write[\@tempc]{##1}%
    \def\@tempb{\newline}%
    \def\@tempc{\z@}%
    \ifnum\tud@head@bar@num>\@ne\relax% cdhead=barcolor/color
      \ifdefvoid{\tud@pagecolor}{\color{HKS41}}{%
        \ifstr{\tud@pagecolor}{HKS41}{\color{white}}{\color{HKS41}}%
      }%
    \fi%
  }%
  \vbox{%
    \let\@raggedtwoe@everyselectfont\relax%
    \setlength\spaceskip{\z@}%
    \selectfont%
    \offinterlineskip%
    \forlistloop\@tempa{\tud@head@text@list}%
  }%
  \global\let\tud@head@text@wrn\@gobble%
}
\newcommand*\tud@head@text@write[2][\z@]{%
  \raisebox{\dimexpr(\tud@len@barheight+2\tud@len@line-\totalheight)/2\relax}[%
    \dimexpr\tud@len@barheight-\depth\relax%
  ][\dimexpr#1\relax]{#2\vphantom{gjpqy\"A\"O\"U}}%
}
\newcommand*\tud@head@rule[1]{%
  \tud@color{\tud@head@fontcolor}%
  \rule[\ht\strutbox]{#1}{\tud@len@line}%
}
\newcommand*\tud@newlayerbox[1]{%
  \expandafter\newsavebox\csname tud@layer@#1\endcsname%
}
\newcommand*\tud@savelayerbox[1]{%
  \global\expandafter\sbox\csname tud@layer@#1\endcsname%
}
\newcommand*\tud@uselayerbox[1]{%
  \expandafter\usebox\csname tud@layer@#1\endcsname%
}
\newcommand*\tud@vlayerbox[3]{%
  \begingroup%
    \setbox\z@\vbox{#2}%
    \setlength\@tempdima{\dimexpr\ht\z@+\dp\z@-#1\relax}%
    \ifdim\@tempdima>\z@\relax%
      \ClassWarning{\TUD@Class@Name}{%
        #3\MessageBreak%
        The maximum height is exceeded by \the\@tempdima\MessageBreak%
      }%
    \fi%
  \endgroup%
  \vbox to #1{#2}%
}
\tud@newlayerbox{main@black}
\tud@newlayerbox{main@HKS41}
\tud@newlayerbox{main@white}
\newlength\tud@len@mainlogoheight
\newcommand*\tud@mainlogo@wrn[1]{}
\newif\if@tud@mainlogo@set
\newcommand*\tud@mainlogo@set{%
  \if@tud@mainlogo@set%
    \def\@tempa{\includegraphics[keepaspectratio,width=\tud@len@logowidth]}%
    \tud@savelayerbox{main@black}{\@tempa{TUD-black}}%
    \tud@savelayerbox{main@HKS41}{\@tempa{TUD-blue}}%
    \tud@savelayerbox{main@white}{\@tempa{TUD-white}}%
    \settoheight\tud@len@mainlogoheight{\tud@uselayerbox{main@black}}%
    \global\tud@len@mainlogoheight=\tud@len@mainlogoheight%
    \gdef\tud@mainlogo@wrn##1{%
      \ifdim##1<\ta@bcor\relax%
        \ClassWarning{\TUD@Class@Name}{%
          The selected page layout means that the\MessageBreak%
          logo of TUD extends beyond the printing area.\MessageBreak%
          The inner margin is smaller than BCOR\MessageBreak%
          (`BCOR=\the\ta@bcor', inner margin is \the##1)\MessageBreak%
          Maybe you should decrease the current value\MessageBreak%
          of DIV (`DIV=\the\ta@div')%
        }%
        \global\let\tud@mainlogo@wrn\@gobble%
      \fi%
    }%
    \tud@headlogo@set%
    \@tud@footlogo@option@settrue%
    \tud@footlogo@option@set%
    \global\@tud@mainlogo@setfalse%
  \fi%
}
\newcommand*\tud@mainlogo@use{%
  \tud@mainlogo@wrn{%
    \dimexpr\oddsidemargin+1in+\tud@len@logox-\tud@len@widemargin\relax%
  }%
  \tud@uselayerbox{main@\tud@head@logocolor}%
}
\tud@newlayerbox{head@black}
\tud@newlayerbox{head@HKS41}
\tud@newlayerbox{head@white}
\tud@newlayerbox{head@option}
\newcommand*\tud@headlogo@filename{}
\newcommand*\tud@headlogo@fileoptions{}
\newcommand*\tud@headlogo@wrn{}
\newcommand*\headlogo[2][]{%
  \tud@comp@clearpage%
  \renewcommand*\tud@headlogo@filename{#2}%
  \renewcommand*\tud@headlogo@fileoptions{#1}%
  \global\@tud@headlogo@option@settrue%
  \global\@tud@footlogo@option@settrue%
  \gdef\tud@headlogo@wrn{%
    \ClassWarning{\TUD@Class@Name}{%
      Secondary logo `\string\headlogo{\tud@headlogo@filename}'\MessageBreak%
      is overwritten with DDC logo. Maybe you should\MessageBreak%
      use `ddcfoot' or better `ddc' instead of `ddchead'%
    }%
    \global\let\tud@headlogo@wrn\relax%
  }%
  \tud@comp@resetpagestyle%
}
\newcommand*\tud@headlogo@set{%
  \def\@tempa{%
    \includegraphics[keepaspectratio,totalheight=\tud@len@mainlogoheight]%
  }%
  \tud@savelayerbox{head@black}{\@tempa{DDC-24}}%
  \tud@savelayerbox{head@HKS41}{\@tempa{DDC-27}}%
  \tud@savelayerbox{head@white}{\@tempa{DDC-30}}%
  \tud@headlogo@option@set%
}
\newcommand*\tud@headlogo@option@set{%
  \if@tud@headlogo@option@set%
    \def\@tempc##1##2{%
      \tud@savelayerbox{head@option}{%
        \includegraphics[%
          keepaspectratio,totalheight=\tud@len@mainlogoheight,##2%
        ]{##1}%
      }%
    }%
    \tud@savelayerbox{head@option}{}%
    \tud@ddc@check%
    \ifcase\@tempa\relax% \tud@ddc@head@num=false
      \ifdefvoid{\tud@headlogo@filename}{}{%
        \protected@edef\tud@headlogo@filename{%
          \expandafter\trim@spaces\expandafter{\tud@headlogo@filename}%
        }%
        \protected@edef\@tempb{%
          \noexpand\@tempc{\tud@headlogo@filename}{\tud@headlogo@fileoptions}%
        }%
        \@tempb%
      }%
    \or\or% \tud@ddc@head@num=color
      \@tempc{DDC-03}{}%
    \or% \tud@ddc@head@num=colorblack
      \@tempc{DDC-09}{}%
    \or% \tud@ddc@head@num=gray
      \@tempc{DDC-21}{}%
    \or% \tud@ddc@head@num=black
      \@tempc{DDC-24}{}%
    \or% \tud@ddc@head@num=blue
      \@tempc{DDC-27}{}%
    \or% \tud@ddc@head@num=white
      \@tempc{DDC-30}{}%
    \fi%
    \global\@tud@headlogo@option@setfalse%
  \fi%
}
\newcommand*\tud@headlogo@use{%
  \tud@vlayerbox{\tud@len@mainlogoheight}{%
    \vss%
    \hbox{%
      \tud@ddc@check%
      \ifnum\@tempa=\@ne\relax% \tud@ddc@head@num=true
        \tud@uselayerbox{head@\tud@head@logocolor}%
      \else%
        \tud@uselayerbox{head@option}%
      \fi%
    }%
    \vss%
  }{%
    The given `\string\headlogo{\tud@headlogo@filename}' is too large.%
  }%
  \ifdefvoid{\tud@headlogo@filename}{}{%
    \tud@ddc@check%
    \ifnum\@tempa>\z@\relax\tud@headlogo@wrn\fi%
  }%
}
\AtEndOfClass{%
  \ifdefvoid{\tud@dim@footlogoheight}{%
    \tud@if@v@lower{2.03}{%
      \def\tud@dim@footlogoheight{.6\tud@len@topmargin}%
    }{%
      \def\tud@dim@footlogoheight{\tud@len@mainlogoheight}%
    }%
  }{}%
}
\tud@newlayerbox{foot@black}
\tud@newlayerbox{foot@HKS41}
\tud@newlayerbox{foot@white}
\tud@newlayerbox{foot@option}
\newcommand*\tud@footlogo@ddc@set[2]{%
  \tud@savelayerbox{foot@#1}{%
    \includegraphics[keepaspectratio,totalheight=\tud@dim@footlogoheight]{#2}%
  }%
}
\newcommand*\tud@footlogo@option@set{%
  \if@tud@footlogo@option@set%
    \tud@footlogo@ddc@set{black}{DDC-22}%
    \tud@footlogo@ddc@set{HKS41}{DDC-25}%
    \tud@footlogo@ddc@set{white}{DDC-28}%
    \tud@ddc@check%
    \ifcase\@tempb\relax\or\or% \tud@ddc@foot@num=color
      \tud@footlogo@ddc@set{option}{DDC-01}%
    \or% \tud@ddc@foot@num=colorblack
      \tud@footlogo@ddc@set{option}{DDC-07}%
    \or% \tud@ddc@foot@num=gray
      \tud@footlogo@ddc@set{option}{DDC-19}%
    \or% \tud@ddc@foot@num=black
      \tud@footlogo@ddc@set{option}{DDC-22}%
    \or% \tud@ddc@foot@num=blue
      \tud@footlogo@ddc@set{option}{DDC-25}%
    \or% \tud@ddc@foot@num=white
      \tud@footlogo@ddc@set{option}{DDC-28}%
    \fi%
    \global\@tud@footlogo@option@setfalse%
  \fi%
}
\newcommand*\tud@footlogo@ddc@use[2]{%
  \tud@ddc@check%
  \ifcase\@tempb\relax\else% \tud@ddc@foot@num=!false
    \tud@footlogo@option@set%
    \setbox\z@\hbox{%
      \tud@vlayerbox{#1}{%
        \vss%
        \hbox to #2{%
          \hss%
          \ifcase\@tempb\relax\or% \tud@ddc@foot@num=true
            \tud@uselayerbox{foot@\tud@foot@logocolor}%
          \else%
            \tud@uselayerbox{foot@option}%
          \fi%
        }%
        \vss\vss%
      }{%
        You should reduce `footlogoheight', because it is\MessageBreak
        too high (\the\dimexpr\tud@dim@footlogoheight\relax).%
        \ifnum\tud@cdgeometry@num>\@ne% true/symmetric/twoside
          \MessageBreak%
          Alternatively you can enlarge the bottom margin\MessageBreak%
          by using option `extrabottommargin'.%
        \fi%
      }%
    }%
    \usebox\z@\hspace*{-\wd\z@}%
  \fi%
}
\tud@newlayerbox{foot@cmd}
\newcommand*\footlogosep{\hfill}
\newcommand*\tud@footlogo@filenames{}
\newcommand*\tud@footlogo@fileoptions{}
\newcommand*\footlogo[2][]{%
  \tud@comp@clearpage%
  \renewcommand*\tud@footlogo@filenames{#2}%
  \renewcommand*\tud@footlogo@fileoptions{#1}%
  \global\@tud@footlogo@cmd@settrue%
  \tud@comp@resetpagestyle%
}
\newif\if@tud@footlogo@cmd@set
\newcommand*\tud@footlogo@cmd@set[2]{%
  \if@tud@footlogo@cmd@set%
    \tud@savelayerbox{foot@cmd}{%
      \hbox to #2{%
        \let\@tempa\relax%
        \@for\@tempb:=\tud@footlogo@filenames\do{%
          \edef\@tempb{\expandafter\trim@spaces\expandafter{\@tempb}}%
          \@tempa%
          \ifx\@tempb\@empty\else%
            \expandafter\tud@footlogo@cmd@@set\expandafter{\@tempb}{#1}%
          \fi%
          \let\@tempa\footlogosep%
        }%
        \hss%
      }%
    }%
    \global\@tud@footlogo@cmd@setfalse%
  \fi%
}
\newcommand*\tud@footlogo@cmd@@set[2]{%
  \begingroup%
    \def\@tempa{}%
    \def\@tempb{}%
    \@tempswatrue%
    \def\do##1{%
      \if@tempswa%
        \def\@tempa{##1}%
        \@tempswafalse%
      \else%
        \expandafter\def\expandafter\@tempb\expandafter{\@tempb,##1}%
      \fi%
    }%
    \let\@tempc\relax%
    \DeclareListParser{\@tempc}{:}%
    \@tempc{#1}%
    \preto\tud@footlogo@fileoptions{%
      keepaspectratio,totalheight=\tud@dim@footlogoheight,%
    }%
    \appto\tud@footlogo@fileoptions{\@tempb}%
    \protected@edef\@tempc{%
      \noexpand\includegraphics[\tud@footlogo@fileoptions]{\@tempa}%
    }%
    \tud@vlayerbox{#2}{\vss\hbox{\@tempc}\vss\vss}{%
      The given `\string\footlogo{\@tempa}' is too large.%
    }%
  \endgroup%
}
\newcommand*\tud@footlogo@cmd@use[2]{%
  \tud@footlogo@option@set%
  \tud@footlogo@cmd@set{#1}{#2}%
  \setbox\z@\hbox{\tud@uselayerbox{foot@cmd}}%
  \usebox\z@\hspace*{-\wd\z@}%
}
\newkomafont{tudheadings}{\tud@color{\tud@foot@fontcolor}}
\newcommand*\tud@footcontent@fontface{}
\newcommand*\tud@footcontent@left{}
\newcommand*\tud@footcontent@right{\@nil}
\newcommand*\footcontent{%
  \kernel@ifstar{%
    \renewcommand*\tud@footcontent@fontface{\usekomafont{tudheadings}}%
    \tud@footcontent@do%
  }{%
    \renewcommand*\tud@footcontent@fontface{%
      \usekomafont{tudheadings}%
      \setlength\@tempdima{\tud@head@fontsize\p@}%
      \fontsize{\tud@head@fontsize}{1.25\@tempdima}%
      \selectfont%
    }%
    \tud@footcontent@do%
  }%
}
\newcommand*\tud@footcontent@do[2][]{%
  \kernel@ifnextchar[%]
    {\tud@footcontent@@do{#1}{#2}}%
    {\tud@footcontent@@do{#1}{#2}[\@nil]}%
}
\newcommand*\tud@footcontent@@do{}
\def\tud@footcontent@@do#1#2[#3]{%
  \appto\tud@footcontent@fontface{#1\selectfont}%
  \if\detokenize{*#2}\relax\else%
    \renewcommand*\tud@footcontent@left{#2}%
  \fi%
  \if\detokenize{*#3}\relax\else%
    \renewcommand*\tud@footcontent@right{#3}%
  \fi%
}
\newcommand*\tud@newline@poster{}
\newcommand*\tud@footcontent@@left[1]{%
  \ifxblank{#1}{}{{\tud@head@font@@bold#1\newline}}%
  Technische Universit\"at Dresden%
  \tud@foot@line@write{faculty}%
  \tud@foot@line@write{department}%
  \tud@foot@line@write{institute}%
  \tud@foot@line@write{chair}%
  \tud@foot@line@write{professor}%
}
\newcommand*\tud@footcontent@@right[2]{%
  \def\tud@newline@poster{%
    \ifx\@authormore\@empty\else\newline\@authormore\fi%
    \ifx\@course\@empty%
      \ifx\@discipline\@empty\else\newline\@discipline\fi%
    \else%
      \newline\@course%
      \ifx\@discipline\@empty\else%
        \nobreakspace(\@discipline)%
      \fi%
    \fi%
    \ifx\@office\@empty\else\newline\@office\fi%
    \ifx\@telephone\@empty\else\newline\@telephone\fi%
    \ifx\@telefax\@empty\else\newline\@telefax\fi%
    \ifx\@emailaddress\@empty\else\newline\@emailaddress\fi%
  }%
  \ifpatchable{\@author}{\@latex@warning@no@line}{%
    \let\@tempa\@empty%
  }{%
    \let\@tempa\@author%
  }%
  \ifx\@tempa\@empty\else%
    \ifxblank{#1}{}{{\tud@head@font@@bold#1\newline}}%
    \renewcommand*\tud@split@author@do[2]{%
      \tud@multiple@fields@store{@author}{##1}%
      \tud@multiple@fields@preset{@author}{*}{##1}%
      \ignorespaces##1\tud@newline@poster%
      \tud@multiple@fields@restore{@author}%
      \tud@multiple@@@split{##2}{\newline}%
    }%
    \noindent\tud@multiple@split{@author}%
    \tud@multiple@fields@restore{@author}%
    \tud@newline@poster%
    \ifx\@contactperson\@empty\else\newline\fi%
  \fi%
  \def\tud@newline@poster{%
    \ifx\@office\@empty\else\newline\@office\fi%
    \ifx\@telephone\@empty\else\newline\@telephone\fi%
    \ifx\@telefax\@empty\else\newline\@telefax\fi%
    \ifx\@emailaddress\@empty\else\newline\@emailaddress\fi%
  }%
  \ifx\@contactperson\@empty\else%
    \ifxblank{#2}{}{{\tud@head@font@@bold#2\newline}}%
    \renewcommand*\tud@split@contactperson@do[2]{%
      \tud@multiple@fields@store{@contactperson}{##1}%
      \tud@multiple@fields@preset{@contactperson}{*}{##1}%
      \ignorespaces##1\tud@newline@poster%
      \tud@multiple@fields@restore{@contactperson}%
      \tud@multiple@@@split{##2}{\newline}%
    }%
    \noindent\tud@multiple@split{@contactperson}%
    \tud@multiple@fields@restore{@contactperson}%
    \tud@newline@poster%
  \fi%
  \ifx\@webpage\@empty\else\newline\@webpage\fi%
}
\footcontent{%
  \tud@footcontent@@left{\contactname}%
}[%
  \tud@footcontent@@right{\authorname}{\contactpersonname}%
]
\newcommand*\tud@footcontent@use[2]{%
  \@tempswafalse%
  \ifx\tud@footcontent@left\@empty\relax%
    \def\@tempa{\@nil}%
    \ifx\@tempa\tud@footcontent@right\relax\else%
      \ifx\tud@footcontent@right\@empty\relax\else%
        \@tempswatrue%
      \fi%
    \fi%
  \else%
    \@tempswatrue%
  \fi%
  \if@tempswa%
    \tud@ddc@check%
    \ifcase\@tempb\relax%
      \setlength\@tempdimc{\z@}%
    \else%
      \settowidth\@tempdimc{\tud@uselayerbox{foot@black}}%
      \addtolength\@tempdimc{\columnsep}%
    \fi%
    \tud@vlayerbox{#1}{%
      \linespread{1}%
      \vss%
      \hbox to #2{%
        \tud@footcontent@fontface%
        \def\@tempa{\@nil}%
        \ifx\@tempa\tud@footcontent@right\relax%
          \vtop{%
            \hsize=\dimexpr#2-\@tempdimc\relax%
            \strut\ignorespaces\tud@footcontent@left\strut%
          }%
        \else%
          \vtop{%
            \hsize=\dimexpr(#2-\columnsep)/2\relax%
            \strut\ignorespaces\tud@footcontent@left\strut%
          }%
          \hspace{\columnsep}%
          \vtop{%
            \hsize=\dimexpr(#2-\columnsep)/2-\@tempdimc\relax%
            \strut\ignorespaces\tud@footcontent@right\strut%
          }%
        \fi%
        \hss%
      }%
      \vss\vss%
    }{%
      The content for the footer (`\string\footcontent')\MessageBreak%
      is too high. You should either reduce the content\MessageBreak%
      or lower the fontsize via the optional argument.%
      \ifnum\tud@cdgeometry@num>\@ne% true/symmetric/twoside
        \MessageBreak%
        Alternatively you can enlarge the bottom margin\MessageBreak%
        by using option `extrabottommargin'.%
      \fi%
    }%
  \else%
    \hbox to #2{}%
  \fi%
}
\AtBeginDocument{%
  \tud@if@v@lower{2.04}{%
    \renewcommand*\tud@comp@clearpage{%
      \if@tud@ddc@internal\else%
        \tud@if@tudheadings{\currentpagestyle}{\clearpage}{}%
      \fi%
    }%
    \renewcommand*\tud@comp@resetpagestyle{%
      \if@tud@ddc@internal\else%
        \tud@if@tudheadings{\currentpagestyle}{%
          \expandafter\pagestyle\expandafter{\currentpagestyle}%
        }{}%
      \fi%
    }%
  }{}%
}
\newcommand*\tud@ddc@check{%
  \let\@tempa\tud@ddc@head@num%
  \let\@tempb\tud@ddc@foot@num%
  \if@tud@ddc@auto%
    \ifdefvoid{\tud@headlogo@filename}{%
      \let\@tempa\tud@ddc@auto@num%
      \let\@tempb\z@%
    }{%
      \let\@tempa\z@%
      \let\@tempb\tud@ddc@auto@num%
    }%
  \fi%
  \tud@if@v@lower{2.03}{%
    \ifnum\@tempb=\z@\relax%
      \ifdefvoid{\tud@footlogo@filenames}{}{\let\@tempb\m@ne}%
    \fi%
  }{}%
}
\newif\if@tud@parameter@ps@font@set
\newcommand*\TUD@parameter@ps@def[1]{%
  \TUD@parameter@def{cdfont}[true]{%
    \TUDoption{cdfont}{#1}%
    \@tud@parameter@ps@font@settrue%
  }%
  \TUD@parameter@def{cdhead}[true]{\TUDoption{cdhead}{#1}}%
  \TUD@parameter@def{cdfoot}[true]{\TUDoption{cdfoot}{#1}}%
  \TUD@parameter@def{headlogo}{\headlogo{#1}}%
  \TUD@parameter@def{footlogo}{\footlogo{#1}}%
  \TUD@parameter@def{ddc}[true]{\TUDoption{ddc}{#1}}%
  \TUD@parameter@def{ddchead}[true]{\TUDoption{ddchead}{#1}}%
  \TUD@parameter@def{ddcfoot}[true]{\TUDoption{ddcfoot}{#1}}%
  \TUD@parameter@def{cdfonts}[true]{%
    \TUDoption{cdfonts}{#1}%
    \@tud@parameter@ps@font@settrue%
  }%
  \TUD@parameter@def{tudfonts}[true]{%
    \TUDoption{tudfonts}{#1}%
    \@tud@parameter@ps@font@settrue%
  }%
  \TUD@parameter@def{barfont}[true]{\TUDoption{barfont}{#1}}%
  \TUD@parameter@def{widehead}[true]{\TUDoption{widehead}{#1}}%
  \TUD@parameter@def{tudfoot}[true]{\TUDoption{tudfoot}{#1}}%
  \TUD@parameter@let{logo}{headlogo}%
}
\PreventPackageFromLoading[%
  \ClassWarning{\TUD@Class@Name}{%
    The package `fancyhdr' must not be used with a\MessageBreak%
    TUD-Script class. You should make use of the\MessageBreak%
    capabilities of package `scrlayer-scrpage' instead%
  }%
]{fancyhdr}
%%% From File: tudscr-layout.dtx
\newcommand*\tud@x@scr@headings@current{}
\newcommand*\tud@sec@fontsize{}
\newcommand*\tud@x@scr@headings@set[1][]{%
  \def\@tempa##1##2##3{%
    \ifstr{##1}{\tud@x@scr@headings@current}{}{%
      \renewcommand*\tud@x@scr@headings@current{##1}%
      \renewcommand*\tud@sec@fontsize{##2}%
      #1%
    }%
  }%
  \KOMAoptionOf[\def\@tempb]{\KOMAClassFileName}{headings}%
  \@for\@tempc:=\@tempb\do{%
    \ifstr{standardclasses}{\@tempc}{\@tempa{standardclasses}{\Huge}{\LARGE}}{%
    \ifstr{big}{\@tempc}{\@tempa{big}{\Huge}{\LARGE}}{%
    \ifstr{normal}{\@tempc}{\@tempa{normal}{\huge}{\Large}}{%
    \ifstr{small}{\@tempc}{\@tempa{small}{\LARGE}{\Large}}{}}}}%
  }%
}
\AtEndPreamble{\tud@x@scr@headings@set}
\newcommand*\tud@x@scr@headings@reset{%
  \tud@layout@process%
  \tud@x@scr@headings@set[%
    \ifcase\tud@layout@part@num\relax\else% !false
      \tud@font@koma@reset{part}%
      \tud@font@koma@reset{partnumber}%
    \fi%
    \ifcase\tud@layout@section@num\relax\else% !false
      \tud@font@koma@reset{section}%
      \tud@font@koma@reset{subsection}%
      \tud@font@koma@reset{subsubsection}%
    \fi%
  ]%
}
\newcommand*\tud@title@fontcolor{}
\newcommand*\tud@part@fontcolor{}
\newcommand*\tud@section@fontcolor{}
\providecommand*\raggedtitle{\tud@raggedright}
\newcommand*\tud@layout@process{%
  \ifcase\tud@layout@title@num\relax% false
    \renewcommand*\titlepagestyle{empty}%
    \tud@font@koma@unset{titlehead}%
    \tud@font@koma@unset{title}%
    \tud@font@koma@unset{subtitle}%
    \tud@font@koma@unset{subject}%
  \else% !false
    \renewcommand*\titlepagestyle{empty.tudheadings}%
    \tud@font@koma@set{titlehead}{\usekomafont{titlepage}}%
    \tud@font@koma@set{title}{%
      \raggedtitle%
      \usekomafont{disposition}%
      \tud@sec@fontface%
      \tud@sec@fontsize%
      \tud@color{\tud@title@fontcolor}%
    }%
    \tud@font@koma@set{subtitle}{%
      \raggedtitle%
      \ifstr{\mddefault}{l}{%
        \tud@sec@fontface[\fontseries{m}]%
      }{%
        \tud@sec@fontface[\fontseries{bx}]%
      }%
      \usesizeofkomafont{section}%
      \tud@color{\tud@title@fontcolor}%
    }%
    \tud@font@koma@set{subject}{%
      \sffamily%
      \bfseries%
      \tud@color{\tud@title@fontcolor}%
    }%
  \fi%
  \ifcase\tud@layout@part@num\relax% false
    \tud@cmd@restore{partheadstartvskip}%
    \ifcsdef{scr@v@3.18}{%
      \tud@cmd@restore{scr@@startpart}%
    }{%
      \tud@cmd@restore{@part}%
    }%
    \tud@sectioning@reset[addpart]{part}%
    \tud@font@koma@unset{partnumber}%
    \tud@cmd@restore{raggedpart}%
  \else% !false
    \tud@cmd@store{partheadstartvskip}%
    \let\partheadstartvskip\tud@partheadstartvskip%
    \ifcsdef{scr@v@3.18}{%
      \tud@cmd@store{scr@@startpart}%
      \let\scr@@startpart\tud@@startpart%
    }{%
      \tud@cmd@store{@part}%
      \let\@part\tud@@part%
    }%
      \tud@sectioning@set{part}{%
        \tud@sec@fontface%
        \tud@color{\tud@part@fontcolor}%
      }%
      \tud@font@koma@set{partnumber}{%
        \tud@sec@fontface%
        \tud@color{\tud@part@fontcolor}%
      }%
    \tud@cmd@store{raggedpart}%
    \renewcommand*\raggedpart{\tud@raggedright}%
  \fi%
  \ifcase\tud@layout@section@num\relax% false
    \tud@sectioning@reset[addsec]{section}%
    \tud@sectioning@reset{subsection}%
    \tud@sectioning@reset{subsubsection}%
    \tud@sectioning@reset{minisec}%
    \tud@sectioning@reset{paragraph}%
    \tud@sectioning@reset{subparagraph}%
    \tud@cmd@restore{raggedsection}%
  \else% !false
    \renewcommand*\tud@section@fontcolor{}%
    \ifcase\tud@layout@section@num\relax\or\else% *color
      \renewcommand*\tud@section@fontcolor{HKS41}%
    \fi%
    \tud@sectioning@set{section}{%
      \tud@sec@fontface%
      \ifstr{\tud@pagecolor}{HKS41}{}{\tud@color{\tud@section@fontcolor}}%
    }%
    \tud@sectioning@set{subsection}{%
      \tud@sec@fontface%
      \ifstr{\tud@pagecolor}{HKS41}{}{\tud@color{\tud@section@fontcolor}}%
    }%
    \tud@sectioning@set{subsubsection}{%
      \tud@sec@fontface%
      \ifstr{\tud@pagecolor}{HKS41}{}{\tud@color{\tud@section@fontcolor}}%
    }%
    \tud@sectioning@set{minisec}{%
      \tud@sec@fontface%
      \ifstr{\tud@pagecolor}{HKS41}{}{\tud@color{\tud@section@fontcolor}}%
    }%
    \tud@sectioning@set{paragraph}{%
      \ifstr{\tud@pagecolor}{HKS41}{}{\tud@color{\tud@section@fontcolor}}%
    }%
    \tud@sectioning@set{subparagraph}{%
      \ifstr{\tud@pagecolor}{HKS41}{}{\tud@color{\tud@section@fontcolor}}%
    }%
    \tud@cmd@store{raggedsection}%
    \renewcommand*\raggedsection{\tud@raggedright}%
  \fi%
  \ifcase\tud@cd@num\relax% false
    \pagestyle{empty}%
    \color{black}%
  \else% !false
    \pagestyle{empty.tudheadings}%
    \ifcase\tud@cd@num\relax\or% true
      \cs@std@lock{tud@head@bar@num}{0}%
      \bool@std@lock{@tud@foot@colored}{false}%
      \color{black}%
    \or% litecolor
      \cs@std@lock{tud@head@bar@num}{1}%
      \bool@std@lock{@tud@foot@colored}{false}%
      \color{HKS41}%
    \or% barcolor
      \cs@std@lock{tud@head@bar@num}{2}%
      \bool@std@lock{@tud@foot@colored}{false}%
      \color{HKS41}%
    \else% bicolor/color/full
      \cs@std@lock{tud@head@bar@num}{3}%
      \bool@std@lock{@tud@foot@colored}{true}%
      \color{HKS41}%
    \fi%
  \fi%
}
\newcommand*\tud@layout@specialpage@set[1]{%
  \tud@font@koma@set{footnote}{%
    \edef\@tempa{%
      \noexpand\tud@color{%
        \expandafter\noexpand\csname tud@#1@fontcolor\endcsname%
      }%
    }\@tempa%
  }%
  \tud@cmd@store{footnoterule}%
  \let\footnoterule\relax%
}
\newcommand*\tud@partheadstartvskip{}
\let\tud@partheadstartvskip\partheadstartvskip
\pretocmd{\tud@partheadstartvskip}{%
  \renewcommand*\tud@part@fontcolor{}% false/true
  \ifcase\tud@layout@part@num\relax\or\else% *color
    \renewcommand*\tud@part@fontcolor{HKS41}%
  \fi%
}{}{\tud@patch@wrn{tud@partheadstartvskip}}
\ifcsdef{scr@v@3.18}{\@tempswatrue}{\@tempswafalse}
\if@tempswa
  \newcommand*\tud@@startpart{}%
  \let\tud@@startpart\scr@@startpart%
  \ifcsdef{scr@v@3.21}{\@tempswatrue}{\@tempswafalse}%
  \if@tempswa%
    \patchcmd{\tud@@startpart}{%
      \usekomafont{#1prefix}{\nobreak\@nameuse{#1format}}%
    }{%
      \usekomafont{#1prefix}{\nobreak\tud@makeuppercase{\@nameuse{#1format}}}%
    }{}{\tud@patch@wrn{scr@@startpart}}%
  \else%
    \patchcmd{\tud@@startpart}{%
      \usekomafont{#1prefix}{\@nameuse{#1format}}%
    }{%
      \usekomafont{#1prefix}{\tud@makeuppercase{\@nameuse{#1format}}}%
    }{}{\tud@patch@wrn{scr@@startpart}}%
  \fi%
\else
  \newcommand*\tud@@part{}%
  \let\tud@@part\@part%
  \patchcmd{\tud@@part}{\size@partnumber{\partformat}}{%
    \size@partnumber{\tud@makeuppercase{\partformat}}%
  }{}{\tud@patch@wrn{@part}}%
\fi
\newcommand*\tud@part{}
\newcommand*\tud@spart{}
\newcommand*\tud@section{}
\newcommand*\tud@ssection{}
\newcommand*\tud@subsection{}
\newcommand*\tud@ssubsection{}
\newcommand*\tud@subsubsection{}
\newcommand*\tud@ssubsubsection{}
\newcommand*\tud@sectioning@set[2]{%
  \tud@cmd@store{#1}%
  \ifstr{#1}{minisec}{%
    \renewcommand\minisec[1]{\@@tud@minisec{\tud@makeuppercase{##1}}}%
  }{%
    \tud@sectioning@case{#1}%
  }%
  \tud@font@koma@set{#1}{#2}%
}
\newcommand*\tud@sectioning@case[1]{%
  \csedef{#1}{%
    \noexpand\SecDef%
    \expandafter\expandafter\expandafter\noexpand%
      \expandafter\csname tud@#1\endcsname%
    \expandafter\expandafter\expandafter\noexpand%
      \expandafter\csname tud@s#1\endcsname%
  }%
  \csedef{tud@#1}[##1]##2{%
    \expandafter\expandafter\expandafter\noexpand%
      \expandafter\csname @@tud@#1\endcsname%
      [{##1}]{\noexpand\tud@sectioning@uppercase{##2}}%
  }%
  \csedef{tud@s#1}##1{%
    \expandafter\expandafter\expandafter\noexpand%
      \expandafter\csname @@tud@#1\endcsname*%
      {\noexpand\tud@sectioning@uppercase{##1}}%
  }%
}
\newcommand*\tud@sectioning@reset[2][]{%
  \tud@cmd@restore{#2}%
  \ifblank{#1}{}{\tud@cmd@restore{#1}}%
  \tud@font@koma@unset{#2}%
}
\robustify{\footnote}
\newcommand*\tud@sectioning@uppercase[1]{%
  \begingroup%
    \if@tud@symbolheadings%
      \let\c@footnote\c@symbolheadings%
      \renewcommand*\thefootnote{\fnsymbol{symbolheadings}}%
    \fi%
    \tud@makeuppercase{#1}%
  \endgroup%
}
%%% From File: tudscr-title.dtx
\newkomafont{titlepage}{%
  \usekomafont{subject}%
  \mdseries%
  \large%
  \tud@raggedright%
}
\robustify{\thanks}
\robustify{\footnotemark}
\newcommand*\tud@title@pagenumber{}
\let\tud@title@pagenumber\relax
\newcommand*\tud@maketitle[1][]{%
  \begingroup%
    \TUD@parameter@set{title}{#1}%
    \ifcase\tud@layout@title@num\relax% false
      \ifx\tud@title@pagenumber\relax\gdef\tud@title@pagenumber{1}\fi%
      \tud@cmd@use{maketitle}[\tud@title@pagenumber]%
      \tud@if@tudheadings{\currentpagestyle}{%
        \ifstr{\titlepagestyle}{empty}{\thispagestyle{empty.tudheadings}}{}%
      }{}%
    \else% !false
      \if@tud@parameter@ps@font@set\else%
        \TUDoptions{cdfont=true}%
      \fi%
        \tud@make@titlehead%
    \fi%
  \endgroup%
  \setcounter{footnote}{0}%
  \global\let\and\relax%
}
\patchcmd{\titlepage}{\thispagestyle{empty}}{%
  \tud@if@tudheadings{\currentpagestyle}{%
    \thispagestyle{empty.tudheadings}%
  }{%
    \thispagestyle{empty}%
  }%
}{}{\tud@patch@wrn{titlepage}}
\tud@cmd@store{maketitle}
\let\maketitle\tud@maketitle
\TUD@parameter@family{title}{%
  \TUD@parameter@def{cdtitle}[true]{\TUDoption{cdtitle}{#1}}%
  \TUD@parameter@let{cd}{cdtitle}%
  \TUD@parameter@def{pagenumber}{\def\tud@title@pagenumber{#1}}%
  \TUD@parameter@ps@def{#1}%
  \TUD@parameter@handler@value{pagenumber}%
}
\newcommand*\tud@make@titlehead{%
  \renewcommand*\tud@title@fontcolor{}%
  \ifcase\tud@layout@title@num\relax\or\else% *color
    \ifstr{\tud@pagecolor}{HKS41}{}{\renewcommand*\tud@title@fontcolor{HKS41}}%
  \fi%
  \par%
  \ifx\tud@title@pagenumber\relax\else%
    \ifnum\tud@title@pagenumber=\@ne\relax\else%
      \ClassWarning{\TUD@Class@Name}{%
        Optional argument of \string\maketitle\space ignored\MessageBreak%
        at notitlepage-mode%
      }%
    \fi%
  \fi%
  \begingroup%
    \let\titlepage@restore\relax%
    \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
    \let\@oldmakefnmark\@makefnmark%
    \renewcommand*\@makefnmark{\rlap\@oldmakefnmark}%
    \next@tdpage%
    \@tempswafalse%
    \if@twocolumn\ifnum\col@number>\@ne\relax%
      \@tempswatrue%
    \fi\fi%
    \if@tempswa%
      \ifx\@extratitle\@empty\else%
        \twocolumn[\@makeextratitle]\next@tdpage%
      \fi%
      \twocolumn[\tud@make@@titlehead]%
    \else%
      \ifx\@extratitle\@empty\else%
        \@makeextratitle\next@tdpage%
      \fi%
      \tud@make@@titlehead%
    \fi%
    \ifx\titlepagestyle\@empty\else\thispagestyle{\titlepagestyle}\fi%
    \@thanks%
  \endgroup%
}
\newcommand*\tud@make@@titlehead{%
  \global\@topnum=\z@%
  \vspace*{\dimexpr\tud@len@areavskip-\baselineskip\relax}%
  \setparsizes{\z@}{\z@}{\z@\@plus1fil}\par@updaterelative%
  \begingroup%
    \usekomafont{titlepage}%
    \tud@x@hyperref@realfootnotes%
    \setlength\@tempdima{\z@}%
    \ifx\@titlehead\@empty\else%
      \sbox\z@{\vbox{%
        \begin{minipage}[t]{\textwidth}%
          {\usekomafont{titlehead}{\@titlehead\par\null}}%
        \end{minipage}\newline\null%
      }}%
      \addtolength\@tempdima{\dimexpr\ht\z@+\dp\z@\relax}%
    \fi%
    \ifx\@subject\@empty\else%
      \sbox\@ne{\vbox{{\usekomafont{subject}{\@subject\par\null}}}}%
      \addtolength\@tempdima{\dimexpr\ht\@ne+\dp\@ne+\p@\relax}%
    \fi%
    \ifx\@titlehead\@empty\else\usebox\z@\par\fi%
    \ifx\@subject\@empty\else\usebox\@ne\par\fi%
    {\usekomafont{title}{\tud@title@uppercase{\@title}\par}}%
    \ifx\@subtitle\@empty\else%
      \vskip 1ex\@plus.5ex\@minus.5ex%
      {\usekomafont{subtitle}{\tud@title@uppercase{\@subtitle}\par}}%
    \fi%
    \vskip 2ex\@plus1ex\@minus1ex%
    \ifnum\col@number>\@ne\relax%
      \ifdefvoid{\multicolsep}{}{%
        \ifisskip{\multicolsep}{\vspace{-\multicolsep}}{}%
      }%
    \fi%
    \tud@if@v@lower{2.03}{\tud@ddc@enlargepage[\titlepagestyle]}{}%
  \endgroup%
}
\newcommand*\tud@title@uppercase[1]{%
  \let\@tempa\relax%
  \begingroup%
    \let\\\newline%
    \def\thanks##1{\gdef\@tempa{##1}}%
    \let\footnote\thanks%
    \sbox\z@{#1}%
    \let\thanks\@gobble%
    \let\footnote\@gobble%
    \tud@makeuppercase{#1}%
  \endgroup%
  \ifx\@tempa\relax\else\thanks\@tempa\fi%
}
\newcommand\maketitleonecolumn[2][]{%
  \if@twocolumn%
      \tud@title@twocolumn{\tud@maketitle[#1]{#2}}%
  \else%
    \ClassError{\TUD@Class@Name}{%
      `\string\maketitleonecolumn' can only be used in twocolumn mode%
    }{}%
  \fi%
}
\newsavebox\tud@title@box
\newcommand\tud@title@twocolumn[1]{%
  \onecolumn%
  \begingroup%
    \let\clearpage\relax%
    \let\newpage\relax%
    \global\setbox\tud@title@box\vbox{%
      \vspace*{.9\baselineskip}#1\bigskip%
    }%
  \endgroup%
  \setlength\@tempdima{\textheight}%
  \tud@if@v@lower{2.03}{%
    \tud@ddc@check%
    \ifcase\@tempb\relax\else% \tud@ddc@foot@num!=false
      \setlength\@tempdima{\dimexpr\textheight-\tud@len@ddcdiff\relax}%
      \@tempswatrue%
    \fi%
  }{}%
  \ifdim\ht\tud@title@box>\@tempdima\relax%
    \@whiledim\ht\tud@title@box>\@tempdima\do{%
      \splittopskip\topskip%
      \splitmaxdepth\maxdepth%
      \vsplit\tud@title@box to \@tempdima%
      \clearpage%
      \setlength\@tempdima{\textheight}%
      \tud@if@v@lower{2.03}{\@tempswafalse}{}%
    }%
  \else%
    \setbox\tud@title@box\vbox{#1\bigskip}%
  \fi%
  \twocolumn[\unvbox\tud@title@box]%
  \tud@if@v@lower{2.03}{%
    \if@tempswa%
      \ClassWarning{\TUD@Class@Name}{%
        You are using a two-column title along with\MessageBreak%
        the DDC-logo. Unfortunately in this case, the\MessageBreak%
        type area has to be adjusted manually. Please\MessageBreak%
        use `\string\enlargethispage{-\the\tud@len@ddcdiff}'\MessageBreak%
        in both columns after the title%
      }%
    \fi%
  }{}%
}
%%% From File: tudscr-frontmatter.dtx
\newcommand*\tud@fm@check[2]{%
  \global\let\tud@fm@set\tud@fm@first%
  #2%
}
\newcommand\tud@fm@set[1]{}
\newcommand\tud@fm@first[1]{%
  \global\let\tud@fm@set\tud@fm@next%
}
\newcommand\tud@fm@next[1]{%
  \if@twocolumn%
    \par%
  \else%
      \ifnum\csuse{tud@#1@level@num}=\z@\relax%
        \ifundef{\main@language}{}{\vspace*{-\baselineskip}}%
      \fi%
  \fi%
}
\newcommand*\tud@fm@body@start[3]{%
  \begingroup%
    \TUD@parameter@set{#1}{#2}%
    \tud@fm@set{#1}%
    \if@twocolumn\else\if@titlepage\else\relax%
      \ifnum\csuse{tud@#1@level@num}<\tw@\relax% false/true
        \begin{\tud@quoting}%
      \fi%
    \fi\fi%
    \ifnum\tud@x@multicol@num>\@ne\relax%
      \vspace{-\multicolsep}%
      \begin{multicols}{\tud@x@multicol@num}[{\tud@fm@head{#1}{#3}}]%
    \else%
      \tud@fm@head{#1}{#3}%
    \fi%
}
\newcommand*\tud@fm@body@end[1]{%
    \ifnum\tud@x@multicol@num>\@ne\relax%
      \end{multicols}%
      \vspace{-\multicolsep}%
    \else%
      \par%
    \fi%
    \if@twocolumn\else\if@titlepage\else\relax%
      \ifnum\csuse{tud@#1@level@num}<\tw@\relax% false/true
        \end{\tud@quoting}\par%
      \fi%
    \fi\fi%
  \endgroup%
}
\newcommand*\tud@fm@head[2]{%
  \ifcase\csuse{tud@#1@level@num}\relax% false
    \if@titlepage\endgraf\fi%
    \csuse{phantomsection}%
    \ifstr{\@currenvir}{\tud@quoting}{}{%
      \if@twocolumn%
        \vskip\dimexpr\smallskipamount-\parskip\relax%
      \else%
        \vskip\dimexpr\bigskipamount-\parskip\relax%
      \fi%
    }%
  \or% true
    \if@titlepage\endgraf\fi%
    \csuse{phantomsection}%
    \@afterindentfalse%
    \ifstr{\@currenvir}{\tud@quoting}{}{%
      \vskip\dimexpr\bigskipamount-\parskip\relax%
    }%
    \begingroup%
      \noindent\centering%
      \normalfont\sectfont\nobreak#2%
      \@endparpenalty\@M%
      \endgraf%
    \endgroup%
    \nopagebreak%
    \vskip\dimexpr\medskipamount-\parskip\relax%
    \@afterheading%
  \or% section
    \section*{#2}%
  \fi%
}
\newcommand*\tud@quoting{quotation}
\AfterPackage{quoting}{\renewcommand*\tud@quoting{quoting}}
\csundef{abstract}
\csundef{endabstract}
\NewEnviron{abstract}[1][]{%
  \TUD@parameter@set{abstract}{#1}%
  \tud@x@multicol@check%
  \renewcommand*\nextabstract[1][]{%
    \tud@fm@body@end{abstract}%
    \tud@fm@body@start{abstract}{##1}{\abstractname}%
  }%
  \tud@fm@check{abstract}{%
    \tud@fm@body@start{abstract}{#1}{\abstractname}%
      \BODY%
    \tud@fm@body@end{abstract}%
  }%
}[%
    \ifnum\tud@abstract@level@num=\tw@\relax%
      \vskip\dimexpr\bigskipamount-\parskip\relax%
    \fi%
]
\TUD@parameter@family{abstract}{%
  \TUD@parameter@def{language}{\selectlanguage{#1}}%
  \TUD@parameter@def{columns}{\cs@std@lock{tud@x@multicol@num}{#1}}%
  \TUD@parameter@def{abstract}{\TUDoption{abstract}{#1}}%
  \TUD@parameter@let{option}{abstract}%
  \TUD@parameter@handler@default{}%
}
\newcommand*\nextabstract[1][]{%
  \ClassError{\TUD@Class@Name}{Incorrect usage of `\string\nextabstract'}{%
    The command `\string\nextabstract' can only be used within\MessageBreak%
    the environment `abstract'.%
  }%
}
%%% From File: tudscr-comp.dtx
\newcommand*\TUD@deprecated@cs[2]{%
  \AtBeginDocument{%
    \ifcsundef{#1}{%
      \expandafter\newrobustcmd\csname #1\endcsname{%
        \ClassWarning{\TUD@Class@Name}{%
          The command `\@backslashchar#1' is deprecated\MessageBreak%
          It's recommended to use `\@backslashchar#2' instead%
        }%
        \csletcs{#1}{#2}%
        \csuse{#2}%
      }%
    }{}%
  }%
}
\newcommand*\TUD@deprecated@lengthcs[2][]{%
  \ifdim\csuse{#2}<\maxdimen\relax%
    \ClassWarning{\TUD@Class@Name}{%
      Using the length `\@backslashchar#2' is deprecated.\MessageBreak%
      You should use option `#2' instead%
    }%
    \csxdef{tud@dim@#2}{\the\csuse{#2}}%
    \expandafter\setlength\csname #2\endcsname{\maxdimen}%
    \global\csuse{#2}=\csuse{#2}%
    #1%
  \fi%
}
\newlength\footlogoheight
\setlength\footlogoheight{\maxdimen}
\TUD@deprecated@cs{professorship}{chair}
\TUD@deprecated@cs{location}{place}
\TUD@deprecated@cs{logofile}{headlogo}
\TUD@deprecated@cs{logofilename}{headlogo}
\AfterPackage{tudscrsupervisor}{%
  \TUD@deprecated@cs{startdate}{issuedate}%
  \TUD@deprecated@cs{finaldate}{duedate}%
  \TUD@deprecated@cs{maturitydate}{duedate}%
}
\AtEndOfClass%
{%
  \tud@if@v@lower{2.04}{\TUDoptions{relspacing=false}}{}%
}
%%% From File: tudscr-misc.dtx
\newcommand*\tud@atdocument@hook{}
\let\tud@atdocument@hook\relax
\AtBeginDocument{%
  \renewcommand*\TUD@SpecialOptionAtDocument[1]{%
    \ifx\tud@atdocument@hook\relax%
      \gdef\tud@atdocument@hook{\global\let\tud@atdocument@hook\relax}%
      \AtEndOfFamilyOptions{%
        \tud@atdocument@hook%
        \tud@atdocument@process%
      }%
    \fi%
    \gappto\tud@atdocument@hook{\global\booltrue{@#1}}%
  }%
}
\newif\if@tud@font@set
\newif\if@tud@font@math@set
\newif\if@tud@font@skip@set
\newif\if@tud@x@scr@headings@reset
\newif\if@tud@layout@process
\newif\if@tud@cdgeometry@process
\newif\if@tud@cdgeometry@@process
\newcommand*\tud@atdocument@process{%
  \if@tud@font@set%
    \tud@font@set%
    \global\@tud@font@setfalse%
    \global\@tud@font@math@setfalse%
    \global\@tud@font@skip@setfalse%
    \global\@tud@layout@processfalse%
  \fi%
  \if@tud@font@math@set%
    \tud@font@math@set%
    \global\@tud@font@math@setfalse%
  \fi%
  \if@tud@font@skip@set%
    \tud@font@skip@set%
    \global\@tud@font@skip@setfalse%
  \fi%
  \if@tud@x@scr@headings@reset%
    \tud@x@scr@headings@reset%
    \global\@tud@x@scr@headings@resetfalse%
    \global\@tud@layout@processfalse%
  \fi%
  \if@tud@layout@process%
    \tud@layout@process%
    \global\@tud@layout@processfalse%
  \fi%
  \if@tud@cdgeometry@process%
    \tud@cdgeometry@process%
    \global\@tud@cdgeometry@processfalse%
    \global\@tud@cdgeometry@@processfalse%
  \fi%
  \if@tud@cdgeometry@@process%
    \tud@cdgeometry@@process%
    \global\@tud@cdgeometry@@processfalse%
  \fi%
}
\newcommand*\tudbookmark[1][]{\@gobbletwo}
\newcommand*\tud@x@hyperref@realfootnotes{}
\AfterPackage{hyperref}{%
  \renewcommand*\tudbookmark[3][]{%
    \relax%
    \if@tud@bookmarks%
      \phantomsection%
      \ifblank{#1}{\pdfbookmark{#2}{#3}}{\pdfbookmark[#1]{#2}{#3}}%
    \fi%
  }%
  \renewcommand*\tud@x@hyperref@realfootnotes{%
    \let\Hy@saved@footnotemark\@footnotemark%
    \let\Hy@saved@footnotetext\@footnotetext%
    \let\@footnotemark\H@@footnotemark%
    \let\@footnotetext\H@@footnotetext%
  }%
  \pdfstringdefDisableCommands{\let\NoCaseChange\@firstofone}%
}
\newcommand*\tud@x@bookmark@startatroot{\relax}
\AfterPackage{bookmark}{%
  \renewcommand*\tud@x@bookmark@startatroot{%
    \if@tud@bookmarks\bookmarksetup{startatroot}\fi%
  }%
}
\pretocmd{\tud@make@titlehead}{%
  \tud@x@bookmark@startatroot%
  \tudbookmark[%
  1%
  ]{\titlename}{title}%
}{}{\tud@patch@wrn{tud@make@titlehead}}
\pretocmd{\@maketitle}{%
  \tud@x@bookmark@startatroot%
  \tudbookmark[%
  1%
  ]{\titlename}{title}%
}{}{\tud@patch@wrn{@maketitle}}
\BeforeTOCHead[toc]{%
  \tud@x@bookmark@startatroot%
  \let\@tempc\relax%
  \iftocfeature{toc}{totoc}{}{%
    \if@tud@bookmarks%
      \setuptoc{toc}{totoc}%
      \tud@cmd@store{addtocontents}%
      \def\@tempc{%
        \unsettoc{toc}{totoc}%
        \tud@cmd@restore{addtocontents}%
      }%
      \let\addtocontents\@gobbletwo%
    \fi%
  }%
}
\AfterTOCHead[toc]{\@tempc}
\BeforeTOCHead[lof]{\tud@x@bookmark@startatroot}
\BeforeTOCHead[lot]{\tud@x@bookmark@startatroot}
\BeforePackage{tocloft}{%
  \ClassWarningNoLine{\TUD@Class@Name}{%
    It is absolutely not recommended to use package\MessageBreak%
    `tocloft'. Loading the package will certainly lead\MessageBreak%
    to problems with table of contents and any list of\MessageBreak%
    floats. You should use the appropriate options of\MessageBreak%
    the KOMA-Script classes%
  }%
}
\CheckCommand*\@uclcnotmath[4]{%
  \begingroup
    #1%
    \def\({$}\let\)\(%
    \def\NoCaseChange##1{\noexpand\NoCaseChange{\noexpand##1}}%
    \@nonchangecase\label
    \@nonchangecase\ref
    \@nonchangecase\ensuremath
    \def\cite##1##{\toks@{\noexpand\cite##1}\@citex}%
    \def\@citex##1{\NoCaseChange{\the\toks@{##1}}}%
    \def\reserved@a##1##2{\let#2\reserved@a}%
    \expandafter\reserved@a\@uclclist\reserved@b{\reserved@b\@gobble}%
    \protected@edef\reserved@a{%
      \endgroup
      \noexpand\@skipmath#3#4$\valign$%
    }%
  \reserved@a%
}
\newcommand*\tud@x@textcase@uclcnotmath{%
  \def\footnote##1##{\toks@{\noexpand\footnote##1}\@footnote}%
  \def\@footnote##1{\NoCaseChange{\the\toks@{##1}}}%
  \def\@mkboth##1##2{\NoCaseChange{\@mkboth{##1}{##2}}}%
}
\patchcmd{\@uclcnotmath}{\@nonchangecase\ensuremath}{%
  \@nonchangecase\ensuremath\tud@x@textcase@uclcnotmath%
}{}{\tud@patch@wrn{@uclcnotmath}}
\endinput
%%
%% End of file `tudscrposter.cls'.
