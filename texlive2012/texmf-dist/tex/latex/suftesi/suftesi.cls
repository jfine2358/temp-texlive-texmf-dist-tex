%%
%% This is file `suftesi.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% suftesi.dtx  (with options: `class')
%% 
%%  Copyright 2009-2012 by Ivan Valbusa
%% 
%%  This program is provided under the terms of the
%%  LaTeX Project Public License distributed from CTAN
%%  archives in directory macros/latex/base/lppl.txt.
%% 
%%  Author: Ivan Valbusa
%%          ivan dot valbusa at univr dot it
%% 
%%  This work has the LPPL maintenance status "author-maintained".
%% 
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{suftesi}
    [2012/04/22 v0.9 A class for typesetting theses, books and articles]
\newif\ifsuftesi@centertitle
\newif\ifsuftesi@sctitles
\newif\ifsuftesi@artemisia
\newif\ifsuftesi@porson
\newif\ifsuftesi@defaultfont
\newif\ifsuftesi@defaultgreek
\newif\ifsuftesi@centerheadings
\newif\ifsuftesi@sufplain
\newif\ifsuftesi@bozza
\newif\ifsuftesi@article
\newif\ifsuftesi@authortitle
\newif\ifsuftesi@nofront
\newif\ifsuftesi@periodical
\newif\ifsuftesi@compact
\newif\ifsuftesi@supercompact
\newif\ifsuftesi@elements
\newif\ifsuftesi@sufelements
\newif\ifsuftesi@nocrop
\newif\ifsuftesi@nomarginpar
\newif\ifsuftesi@dottedtoc
\newif\ifsuftesi@raggedtoc
\DeclareOption{centertitle}{\suftesi@centertitletrue}
\DeclareOption{sctitles}{\suftesi@sctitlestrue}
\DeclareOption{disablefront}{\suftesi@nofronttrue}
\DeclareOption{defaultfont}{\suftesi@defaultfonttrue\suftesi@defaultgreektrue}
\DeclareOption{artemisia}{\suftesi@artemisiatrue\suftesi@porsonfalse
\suftesi@defaultgreekfalse}
\DeclareOption{porson}{\suftesi@porsontrue\suftesi@artemisiafalse
\suftesi@defaultgreekfalse}
\DeclareOption{defaultgreek}{\suftesi@defaultgreektrue
\suftesi@artemisiafalse\suftesi@porsonfalse}
\DeclareOption{centerheadings}{\suftesi@centerheadingstrue}
\DeclareOption{sufplain}{\suftesi@sufplaintrue}
\DeclareOption{bozza}{\suftesi@bozzatrue}
\DeclareOption{periodical}{\suftesi@periodicaltrue\suftesi@compacttrue}
\DeclareOption{compact}{\suftesi@compacttrue}
\DeclareOption{supercompact}{\suftesi@supercompacttrue}
\DeclareOption{elements}{\suftesi@elementstrue\suftesi@sufelementstrue
\suftesi@supercompactfalse\suftesi@compactfalse}
\DeclareOption{sufelements}{\suftesi@sufelementstrue\suftesi@sctitlestrue}
\DeclareOption{nocrop}{\suftesi@nocroptrue}
\DeclareOption{nomarginpar}{\suftesi@nomarginpartrue}
\DeclareOption{article}{\suftesi@articletrue}
\DeclareOption{authortitle}{\suftesi@authortitletrue}
\DeclareOption{dottedtoc}{\suftesi@dottedtoctrue}
\DeclareOption{raggedtoc}{\suftesi@raggedtoctrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{artemisia}
\ProcessOptions
\relax
\LoadClass[a4paper]{book}
\RequirePackage{color}
    \definecolor{sufred}{rgb}{0.5,0,0}
    \definecolor{sufgray}{rgb}{0.5,0.5,0.5}
\RequirePackage{ifxetex,ifluatex}
\ifxetex\relax
  \else
    \RequirePackage{microtype}
    \fi
\RequirePackage{textcase}
\RequirePackage{multicol}
\RequirePackage{emptypage}
\RequirePackage{mparhack}
\ifxetex
   \relax
      \else
\RequirePackage[LGR,T1]{fontenc}
\AtBeginDocument{\fontencoding{T1}\selectfont}
\ifsuftesi@defaultfont
  \relax
    \else
\RequirePackage[osf,sc]{mathpazo}
\RequirePackage[scaled=0.8]{beramono}
   \linespread{1.05}
    \renewcommand{\sfdefault}{iwona}
  \fi
\ifsuftesi@artemisia
\def\suftesi@greekfamily{artemisiaeuler}
    \fi
\ifsuftesi@defaultgreek
\def\suftesi@greekfamily{cmr}
    \fi
\ifsuftesi@porson
\sbox\z@{\fontsize{10}{10}\normalfont A}
\sbox\tw@{\font\temp=gporsonrg6a at 10pt \temp A}
\dimen@=
\dimexpr(0.001\dimexpr\numexpr(\dimexpr(1000\ht\z@)/\ht\tw@)\p@)
\edef\art@scale{\strip@pt\dimen@}
\DeclareFontFamily{LGR}{porson}{}
\DeclareFontShape{LGR}{porson}{m}{n}{<-> s * [\art@scale] gporsonrg6a}{}
\DeclareFontShape{LGR}{porson}{m}{it}{<-> ssub * porson/m/n}{}
\DeclareFontShape{LGR}{porson}{b}{n}{<-> ssub * porson/m/n}{}
\DeclareFontShape{LGR}{porson}{b}{it}{<-> ssub * porson/m/n}{}
\DeclareFontShape{LGR}{porson}{m}{sl}{<-> ssub * porson/m/n}{}
\DeclareFontShape{LGR}{porson}{b}{sl}{<-> ssub * porson/m/n}{}
\DeclareFontShape{LGR}{porson}{m}{sc}{<-> ssub * porson/m/n}{}
\DeclareFontShape{LGR}{porson}{bx}{n}{<-> ssub * porson/m/n}{}
\DeclareFontShape{LGR}{porson}{bx}{it}{<-> ssub * porson/m/n}{}
\DeclareFontShape{LGR}{porson}{bx}{sl}{<-> ssub * porson/m/n}{}
      \def\suftesi@greekfamily{porson}
   \fi
\AtBeginDocument{
  \DeclareRobustCommand{\greektext}{%
    \fontencoding{LGR}\fontfamily{\suftesi@greekfamily}\selectfont
    \def\encodingdefault{LGR}}}
\fi
\RequirePackage{geometry}
  \parindent1em
\ifcase\@ptsize\relax
\geometry{%
  textwidth=312pt,
  textheight=624pt}\or
\geometry{%
  textwidth=324pt,
  textheight=648pt}\or
\geometry{%
  textwidth=324pt,
  textheight=648pt}
  \fi
\geometry{%
  marginparsep=12pt,
  includehead,
  hmarginratio=1:2,
  vmarginratio=1:2,
  heightrounded,
  marginparwidth=82pt}
\ifsuftesi@nocrop
     \relax
       \else
          \RequirePackage[a4,cam,center]{crop}
\fi
\ifsuftesi@periodical
    \geometry{
    textheight=16.5cm,
    textwidth=11cm,
    paperwidth=17cm,
    paperheight=24cm,
    hmarginratio=2:3,
    vmarginratio=2:3,
    includefoot,
    includehead,
    heightrounded,
    marginparwidth=70pt,
    marginparsep=10pt}
\else
\ifsuftesi@compact
    \geometry{
    textheight=16.5cm,
    textwidth=11cm,
    paperwidth=16cm,
    paperheight=24cm,
    hmarginratio=2:3,
    vmarginratio=2:3,
    includefoot,
    includehead,
    heightrounded,
    marginparwidth=65pt,
    marginparsep=10pt}
\else
\ifsuftesi@supercompact
    \geometry{
    textheight=15cm,
    textwidth=10cm,
    paperwidth=14cm,
    paperheight=21cm,
    hmarginratio=2:3,
    vmarginratio=2:3,
    includefoot,
    includehead,
    heightrounded,
    marginparwidth=50pt,
    marginparsep=9pt}
\else
\ifsuftesi@elements
    \geometry{%
    textwidth=251pt,
    textheight=502pt,
    marginparwidth=60pt,
    marginparsep=18pt,
    paperwidth=378pt,
    paperheight=654pt,
    heightrounded,
    outer=91.2pt,
    top=64pt}
   \else
  \fi
 \fi
\fi
\fi
 \if@twoside
   \relax
     \else
   \geometry{hmarginratio=1:1}
\fi
\RequirePackage{titlesec}
    \newlength{\sectionsep}
    \setlength{\sectionsep}{\dimexpr(\baselineskip) plus 1pt minus 1pt}
\ifsuftesi@supercompact
  \DeclareRobustCommand{\sufchaptersize}{\large}
    \else
      \ifsuftesi@compact
       \DeclareRobustCommand{\sufchaptersize}{\Large}
         \else
           \DeclareRobustCommand{\sufchaptersize}{\Large}
     \fi
\fi
\ifxetex
  \DeclareRobustCommand{\suftesi@titlesmallcaps}[1]{%
    \addfontfeature{LetterSpace=6}\scshape\MakeTextLowercase{#1}}
  \DeclareRobustCommand{\suftesi@headingsmallcaps}[1]{%
    \addfontfeature{LetterSpace=6}\scshape\MakeTextLowercase{#1}}
    \newcommand{\chapnumfont}[1]{%
      \def\@chapnumfont{\fontspec{#1}}}
      \chapnumfont{Palatino}
\else
  \DeclareRobustCommand{\suftesi@titlesmallcaps}[1]{%
    \scshape\MakeTextLowercase{\textls[110]{#1}}}%
  \DeclareRobustCommand{\suftesi@headingsmallcaps}[1]{%
    \scshape\MakeTextLowercase{\textls[110]{#1}}}%
  \newcommand{\chapnumfont}[1]{%
    \def\@chapnumfont{\fontfamily{#1}}}
    \chapnumfont{pplj}
\fi
\ifsuftesi@article
\titleclass{\part}{straight}
\titleformat{\part}[hang]
  {\large}
  {\ifsuftesi@sctitles\scshape\else\fi\partname~\thepart}
  {.5em}
  {\ifsuftesi@sctitles\expandafter\suftesi@titlesmallcaps\else\fi}
  \titlespacing*{\part}{0ex}{2\sectionsep}{2\sectionsep}[0ex]
\else
\titleformat{\part}[display]
  {\LARGE\filcenter}
  {\sufchaptersize\ifsuftesi@sctitles\scshape\else\fi\partname~\thepart}
  {3ex}
  {\sufchaptersize\ifsuftesi@sctitles\expandafter\suftesi@titlesmallcaps\else\fi}
\fi
\ifsuftesi@sufelements
   \titleformat{\chapter}[block]
     {}%
     {\begin{picture}(0,0)
     \setlength{\unitlength}{1pt}
     \@chapnumfont%
     \ifsuftesi@elements
       \fontsize{64}{64}\selectfont%
       \put(0,-73){%
       \hskip\dimexpr(\textwidth+\marginparsep)\textcolor{sufgray}{\thechapter}}%
     \else
       \fontsize{95}{95}\selectfont%
       \put(0,-83){\hskip\dimexpr(\textwidth+\marginparsep)%
       \textcolor{sufgray}{\thechapter}}%
     \fi
   \end{picture}}%
  {0pt}
  {\suftesi@titlesmallcaps}
  [\rule{\textwidth}{.1pt}]
\else
\ifsuftesi@centertitle
  \titleformat{\chapter}[display]
    {\filcenter}
    {\sufchaptersize\thechapter}
    {3ex}
    {\sufchaptersize\ifsuftesi@sctitles\expandafter\suftesi@titlesmallcaps\else\fi}
\else
  \titleformat{\chapter}[hang]
    {\filright}
    {\sufchaptersize\thechapter.}
    {3ex}
    {\sufchaptersize\ifsuftesi@sctitles\expandafter\suftesi@titlesmallcaps\else\fi}
  \fi
\fi
\ifsuftesi@compact
  \titlespacing*{\chapter}{0em}{0ex}{18ex}
    \else
      \ifsuftesi@supercompact
        \titlespacing*{\chapter}{0em}{0ex}{18ex}
         \else
           \ifsuftesi@elements
             \titlespacing*{\chapter}{0em}{-45pt}{10pt}[0em]
               \else
                 \ifsuftesi@sufelements
                \titlespacing*{\chapter}{0em}{6ex}{10pt}[0em]
              \else
            \titlespacing*{\chapter}{0em}{6ex}{18ex}
         \fi
      \fi
   \fi
\fi
\ifsuftesi@elements
\titleformat{\section}[hang]
  {\raggedright}
  {\textnormal\thesection}
  {1em}
  {\small\suftesi@titlesmallcaps}
\titlespacing*{\section}{0em}{\baselineskip}{\baselineskip}[0em]
\titleformat{\subsection}[block]
  {\filright\normalsize\itshape}
  {\textnormal\thesubsection}
  {1em}
  {}
\titlespacing*{\subsection}{0em}{\baselineskip}{\baselineskip}[0em]
\titleformat{\subsubsection}[block]
  {\filright\normalsize\itshape}
  {\textnormal\thesubsubsection}
  {1em}
  {}
\titlespacing*{\subsubsection}{0em}{\baselineskip}{\baselineskip}[0em]
\else
\ifsuftesi@article
  \renewcommand\thesection      {\@arabic\c@section}
  \renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
  \renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
  \renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
  \renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\else
\fi
\titleformat{\section}[hang]
  {\filright}
  {\thesection}
  {.5em}
  {\unskip\ifsuftesi@sctitles\expandafter\suftesi@titlesmallcaps\else\itshape\fi}
\titlespacing*{\section}{0ex}{\sectionsep}{\sectionsep}[0ex]
\titleformat{\subsection}[hang]
  {}
  {\textnormal\thesubsection}
  {.5em}
  {\itshape}
\titlespacing*{\subsection}{\parindent}{\sectionsep}{\sectionsep}[0ex]
\titleformat{\subsubsection}[hang]
  {}
  {\textnormal\thesubsubsection}
  {.5em}
  {\itshape}
\titlespacing*{\subsubsection}{\parindent}{\baselineskip}{\baselineskip}[0ex]
\fi
\titleformat{\paragraph}[runin]
  {}
  {\theparagraph}
  {.5em}
  {\itshape}
  [{.}\hspace*{1em}]
\titlespacing*{\paragraph}{\parindent}{.5\sectionsep}{.5\sectionsep}
\titleformat{\subparagraph}[runin]
  {}
  {\thesubparagraph}
  {.5em}
  {}
  [{.}\hspace*{1em}]
\titlespacing*{\subparagraph}{\parindent}{.5\sectionsep}{.5\sectionsep}
\ifsuftesi@article %ARTICLE
\AtBeginDocument{%
\@ifpackageloaded{biblatex}{%
  \defbibheading{bibliography}[\refname]{%
    \section*{#1}%
    \markboth{#1}{#1}}
  \defbibheading{shorthands}[\losname]{%
    \section*{#1}%
    \markboth{#1}{#1}}
  \defbibheading{bibintoc}[\refname]{%
    \section*{#1}%
    \addcontentsline{toc}{section}{#1}%
    \markboth{#1}{#1}}
  \defbibheading{losintoc}[\losname]{%
    \section*{#1}%
    \addcontentsline{toc}{section}{#1}%
    \markboth{#1}{#1}}
  \defbibheading{bibnumbered}[\refname]{%
    \section{#1}%
    \if@twoside\markright{#1}\fi}
  \defbibheading{losnumbered}[\losname]{%
    \section{#1}%
    \if@twoside\markright{#1}\fi}
  \defbibheading{subbibliography}[\refname]{%
    \subsection*{#1}}
  \defbibheading{subbibintoc}[\refname]{%
    \subsection*{#1}%
    \addcontentsline{toc}{subsection}{#1}}
  \defbibheading{subbibnumbered}[\refname]{%
    \subsection{#1}}}%
    {\relax}%
}%
\else %BOOK
\AtBeginDocument{%
\@ifpackageloaded{biblatex}{%
  \defbibheading{bibliography}[\bibname]{%
    \chapter*{#1}%
    \markboth{#1}{#1}}
  \defbibheading{shorthands}[\losname]{%
    \chapter*{#1}%
    \markboth{#1}{#1}}
  \defbibheading{bibintoc}[\bibname]{%
    \chapter*{#1}%
    \addcontentsline{toc}{chapter}{#1}%
    \markboth{#1}{#1}}
  \defbibheading{losintoc}[\losname]{%
    \chapter*{#1}%
    \addcontentsline{toc}{chapter}{#1}%
    \markboth{#1}{#1}}
  \defbibheading{bibnumbered}[\bibname]{%
    \chapter{#1}%
    \if@twoside\markright{#1}\fi}
  \defbibheading{losnumbered}[\losname]{%
    \chapter{#1}%
    \if@twoside\markright{#1}\fi}
  \defbibheading{subbibliography}[\refname]{%
    \section*{#1}%
    \if@twoside\markright{#1}\fi}
  \defbibheading{subbibintoc}[\refname]{%
    \section*{#1}%
    \addcontentsline{toc}{section}{#1}%
    \if@twoside\markright{#1}\fi}
  \defbibheading{subbibnumbered}[\refname]{%
    \section{#1}}}
    {\relax}%
}%
\fi
\RequirePackage{titletoc}
\ifsuftesi@dottedtoc
   \newcommand{\suftesi@titlerule}{\titlerule*{\footnotesize .\ }}
    \newcommand{\suftesi@chaptitlerule}{\titlerule*{}}
      \else
\ifsuftesi@raggedtoc
    \newcommand{\suftesi@titlerule}{\hspace{1.5em}}
    \newcommand{\suftesi@chaptitlerule}{\hspace{1.5em}}
    \else
    \newcommand{\suftesi@titlerule}{\titlerule*{}}
    \newcommand{\suftesi@chaptitlerule}{\titlerule*{}}
    \fi
\fi
\ifsuftesi@article
\renewcommand\tableofcontents{%
\thispagestyle{empty}
    \section*{\contentsname
        \@mkboth{\contentsname}{\contentsname}}%
    \@starttoc{toc}%
    \vspace{2ex}%
    }
\renewcommand\listoffigures{%
    \section*{\listfigurename}%
      \@mkboth{\listfigurename}%
              {\listfigurename}%
    \@starttoc{lof}%
    \vspace{2ex}%
    }
\renewcommand\listoftables{%
    \section*{\listtablename}%
      \@mkboth{%
          \listtablename}%
         {\listtablename}%
    \@starttoc{lot}%
    \vspace{2ex}%
    }
\else
\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{\contentsname}{\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
 \fi
\titlecontents{part}
  [0em]
  {\addvspace{3ex}\partname~}
  {\thecontentslabel\hspace*{1em}}
  {}
  {}
  [\addvspace{1ex}]
\titlecontents{chapter}
  [0em]
  {\addvspace{2ex}}
  {\thecontentslabel\hspace*{1em}}
  {}
  {\suftesi@chaptitlerule\contentspage}
  [\addvspace{1ex}]
\titlecontents{section}
  [1.5em]
  {}
  {\thecontentslabel\hspace*{1em}}
  {}
  {\ifsuftesi@article\suftesi@chaptitlerule%
       \else\suftesi@titlerule\fi\contentspage}
\titlecontents{subsection}
  [3em]
  {}
  {\thecontentslabel\hspace*{1em}}
  {}
  {\suftesi@titlerule\contentspage}
\titlecontents{subsubsection}
  [4.5em]
  {}
  {\thecontentslabel\hspace*{1em}}
  {}
  {\suftesi@titlerule\contentspage}
\titlecontents{paragraph}
  [6em]
  {}
  {\thecontentslabel\hspace*{1em}}
  {}
  {\suftesi@titlerule\contentspage}
\titlecontents{subparagraph}
  [7.5em]
  {}
  {\thecontentslabel\hspace*{1em}}
  {}
  {\suftesi@titlerule\contentspage}
\titlecontents{figure}
  [0em]
  {}
  {\thecontentslabel\hspace*{1em}}
  {}
  {\suftesi@titlerule\contentspage}
\titlecontents{table}
  [0em]
  {}
  {\thecontentslabel\hspace*{1em}}
  {}
  {\suftesi@titlerule\contentspage}
\ifsuftesi@article
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}
\else
\fi
    \renewcommand*{\title}[2][]{\gdef\@headtitle{#1}\gdef\@title{#2}}
    \edef\title{\noexpand\@dblarg
  \expandafter\noexpand\csname\string\title\endcsname}
    \def\@headtitle{--missing title--%
        \protect\ClassWarningNoLine{suftesi}{%
            No \string\title\space given \MessageBreak%
            See the class documentation for explanation}}
    \def\@title{--missing title--%
        \protect\ClassWarningNoLine{suftesi}{%
            No \string\title\space given\MessageBreak%
            See the class documentation for explanation}}
    \def\@author{--missing author--%
        \protect\ClassWarningNoLine{suftesi}{%
            No \string\author\space given\MessageBreak%
            See the class documentation for explanation}}
\let\standardtitle\maketitle
\if@titlepage% titlepage
  \renewcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\sufchaptersize\color{sufred}\sffamily\ifsuftesi@sctitles%
    \suftesi@titlesmallcaps{\@title}\else\@title\fi \par}%
    \vskip 3em%
    {\small\lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\small\@date\par}%
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
     \global\let\@date\@empty
  \global\let\date\relax
  \global\let\and\relax
}
\else
\renewcommand\maketitle{\par
   \begingroup
     \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
     \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
     \long\def\@makefntext##1{\parindent 1em\noindent
             \hb@xt@1.8em{%
                 \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
     \if@twocolumn
       \ifnum \col@number=\@ne
         \@maketitle
       \else
         \twocolumn[\@maketitle]%
       \fi
     \else
       \newpage
       \global\@topnum\z@   % Prevents figures from going at top of page.
       \@maketitle
     \fi
     \thispagestyle{plain}\@thanks
   \endgroup
   \setcounter{footnote}{0}%
   \global\let\thanks\relax
   \global\let\maketitle\relax
   \global\let\@maketitle\relax
   \global\let\@thanks\@empty
   \global\let\@date\@empty
   \global\let\date\relax
   \global\let\and\relax}
     \def\@maketitle{%
   \newpage
   \null
   \vskip 2em%
   \begin{center}%
   \let \footnote \thanks
     {\sufchaptersize\color{sufred}\sffamily\ifsuftesi@sctitles%
     \suftesi@titlesmallcaps{\@title}\else\@title\fi\par}%
     \vskip 1.5em%
     {\small\lineskip .5em%
       \begin{tabular}[t]{c}%
        \@author\par
       \end{tabular}\par}%
     \vskip 1em%
     {\small\@date\par}%
   \end{center}%
   \par
   \vskip 1.5em}
\fi
\AtBeginDocument{%
\@ifpackageloaded{frontespizio}{%
      \ifsuftesi@periodical
          \Margini{1cm}{7cm}{5cm}{1cm}%
          \Rientro{1cm}%
        \else
      \ifsuftesi@compact
          \Margini{1cm}{7cm}{6cm}{1cm}%
          \Rientro{1cm}%
        \else
          \ifsuftesi@supercompact
          \Margini{1cm}{10cm}{8cm}{1cm}%
          \Rientro{1cm}%
        \else
     \fi
  \fi
\fi
  }%
{\relax}}
\renewenvironment{theindex}
    {\setlength\columnseprule{0pt}
    \setlength\columnsep{35pt}%
    \cleardoublepage
    \@makeschapterhead{\indexname}%
      \begin{multicols}{2}
        \markboth{\indexname}{\indexname}%
        \raggedright\small
        \setlength\parindent{0pt}%
        \setlength\parskip{0pt plus 0.3pt}%
        \thispagestyle{plain}\let\item\@idxitem}
   {\end{multicols}}
\renewcommand\@idxitem{\par\hangindent 15\p@}
\newcommand{\appendicesname}[1]{\def\suff@appendices{#1}}
    \appendicesname{Appendici}
    \newcommand{\appendixpage}{\@appendixpage}
\def\@appendixpage{%
  \@mainmattertrue
    \titlecontents{part}
      [0em]
      {\addvspace{3ex}}
      {}
      {}
      {}
      [\addvspace{1ex}]
\let\contentspage\relax
    \cleardoublepage
       \thispagestyle{empty}
         \addcontentsline{toc}{part}{\suff@appendices}
     \begingroup
       \centering
          \null\vfil
        {\LARGE\suff@appendices\par}
          \vfil
   \endgroup
    \cleardoublepage
\titlecontents{part}
   [0em]
  {\addvspace{3ex}\partname~}
  {\thecontentslabel\hspace*{1em}}
  {}
  {}
  [\addvspace{1ex}]
}
\ifsuftesi@sufelements
\renewcommand\appendix{\par
    \setcounter{chapter}{0}%
    \setcounter{section}{0}%
    \gdef\@chapapp{\appendixname}%
    \gdef\thechapter{\@Alph\c@chapter}
    \titleformat{\chapter}[block]
      {\vskip-22pt}%
      {\small\suftesi@titlesmallcaps{\appendixname}~\Alph{chapter}:\hskip.5em}
      {0pt}
      {\small\suftesi@titlesmallcaps}
      [\rule{\textwidth}{.4pt}]
  \titlespacing*{\chapter}{0em}{10pt}{10pt}[0em]
  \titlecontents{chapter}[1em]
    {\filright\hskip.5em}
    {\suftesi@titlesmallcaps{\appendixname~\thecontentslabel:}\hskip1em}
    {}
    {\contentspage\vspace{5pt}}}
    \else
      \ifsuftesi@article
          \renewcommand\appendix{\par
              \setcounter{section}{0}%
              \setcounter{subsection}{0}%
              \gdef\thesection{\@Alph\c@section}}
   \else
         \renewcommand\appendix{\par
             \setcounter{chapter}{0}%
             \setcounter{section}{0}%
             \gdef\@chapapp{\appendixname}%
             \gdef\thechapter{\@Alph\c@chapter}}
    \fi
\fi
\RequirePackage{fancyhdr}
  \pagestyle{fancy}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footnoterule}{}
\ifsuftesi@elements%
   \renewcommand{\chaptermark}[1]{\markboth{#1}{#1}}
   \renewcommand{\sectionmark}[1]{\markright{#1}}
 \fancypagestyle{elements}{%
   \fancyhf{}
   \fancyfoot[LE,RO]{\thepage}
   \fancyhead[RO]{%
    \begin{picture}(0,0)
      \setlength{\unitlength}{1pt}
        \put(0,-104){%
          \hskip\marginparsep
          \parbox[t]{\marginparwidth}{\itshape\raggedright\leftmark}}%
    \end{picture}}
   \fancyhead[LE]{%
     \begin{picture}(0,0)
       \setlength{\unitlength}{1pt}
         \put(0,-104){%
          \hskip-\dimexpr(\marginparwidth+\marginparsep)
          \parbox[t]{\marginparwidth}{\itshape\raggedleft\rightmark}}%
     \end{picture}}%
  }%
\else
 \renewcommand{\chaptermark}[1]{\markboth{\chaptertitlename\ \thechapter}{#1}}
 \renewcommand{\sectionmark}[1]{}
\fi
\fancypagestyle{plain}{%
 \fancyhf{}
 \fancyfoot[C]{}
 \renewcommand{\headrulewidth}{0pt}
 \renewcommand{\footrulewidth}{0pt}}
\fancypagestyle{sufplain}{%
 \fancyhf{}%
 \fancyfoot[RE,LO]{\ifsuftesi@bozza \footnotesize Version of \today\else\fi}
 \fancyfoot[C]{\footnotesize\sufthepage}}
\fancypagestyle{centerheadings}{%
  \fancyhf{}%
  \fancyfoot[RE,LO]{\ifsuftesi@bozza \footnotesize Version of \today\else\fi}
  \fancyhead[CO]{\footnotesize\xheadbreakfalse\suf@rightmark}
  \fancyhead[CE]{\footnotesize\xheadbreakfalse%
   \ifsuftesi@article
     \ifsuftesi@authortitle
       \suf@leftmark
         \else
           \suf@rightmark
         \fi
     \else
       \suf@leftmark
     \fi}
  \fancyfoot[C]{\footnotesize\sufthepage}%
  }%
\fancypagestyle{sufdefault}{%
  \fancyhf{}%
  \fancyfoot[RE,LO]{\ifsuftesi@bozza \footnotesize Version of \today\else\fi}
  \fancyhead[LE,RO]{\footnotesize\sufthepage}
  \fancyhead[LO]{\footnotesize\xheadbreakfalse\suf@rightmark}
  \fancyhead[RE]{\footnotesize\xheadbreakfalse%
   \ifsuftesi@article
     \ifsuftesi@authortitle
       \suf@leftmark
         \else
           \suf@rightmark
          \fi
     \else
       \suf@leftmark
     \fi}
  }%
\ifsuftesi@article
    \renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
      \else
    \fi
\ifsuftesi@sctitles
  \ifsuftesi@authortitle
    \def\suf@rightmark{\suftesi@headingsmallcaps{\@headtitle}}
      \else
    \def\suf@rightmark{\suftesi@headingsmallcaps{\rightmark}}
  \fi
\else
  \ifsuftesi@authortitle
    \def\suf@rightmark{\nouppercase{\@headtitle}}
      \else
        \def\suf@rightmark{\nouppercase{\rightmark}}
     \fi
\fi
\ifsuftesi@sctitles
  \ifsuftesi@authortitle
    \def\suf@leftmark{\suftesi@headingsmallcaps{\@author}}
      \else
        \def\suf@leftmark{\suftesi@headingsmallcaps{\suf@leftrightmark}}
     \fi
\else
\ifsuftesi@authortitle
  \def\suf@leftmark{\nouppercase{\@author}}
    \else
      \def\suf@leftmark{\nouppercase{\suf@leftrightmark}}
  \fi
\fi
\ifsuftesi@sctitles
  \def\sufthepage{\suftesi@headingsmallcaps{\thepage}}
    \else
      \def\sufthepage{\thepage}
\fi
\def\suf@leftrightmark{%
 \if@mainmatter\leftmark\else\rightmark\fi}
\pagestyle{sufdefault}
  \ifsuftesi@centerheadings\pagestyle{centerheadings}\else\fi
  \ifsuftesi@sufplain\pagestyle{sufplain}\else\fi
  \ifsuftesi@elements\pagestyle{elements}\else\fi
\RequirePackage{caption}
\ifsuftesi@elements
  \captionsetup{labelsep=period,font={small,sf},singlelinecheck=false}
\else
  \captionsetup{labelsep=period,font=small,singlelinecheck=false}
\fi
\RequirePackage{epigraph}
\ifsuftesi@elements
  \relax
    \else
      \ifsuftesi@sufelements
        \relax
      \else
    \setlength{\beforeepigraphskip}{-3\baselineskip}
    \setlength{\afterepigraphskip}{2\baselineskip}
    \setlength{\epigraphrule}{0pt}
    \renewcommand{\textflush}{flushepinormal}
    \renewcommand{\sourceflush}{flushepinormal}
    \renewcommand{\epigraphsize}{\footnotesize}
  \fi
\fi
\RequirePackage{enumitem}
    \setlist{labelsep=0.6em,noitemsep,font=\normalfont}
    \setdescription{font=\normalfont\itshape,noitemsep}
\ifsuftesi@compact
    \setenumerate[1]{leftmargin=1em,label=\arabic*}
    \setenumerate[2]{leftmargin= 1.5em,label=\arabic*}
    \setenumerate[3]{leftmargin= 1.5em,label=\arabic*}
    \setitemize[1]{leftmargin=1em}
    \setitemize[2]{leftmargin=1.5em}
    \setitemize[3]{leftmargin=1.5em}
 \else
    \ifsuftesi@supercompact
    \setenumerate[1]{leftmargin=1em,label=\arabic*}
    \setenumerate[2]{leftmargin= 1.5em,label=\arabic*}
    \setenumerate[3]{leftmargin= 1.5em,label=\arabic*}
    \setitemize[1]{leftmargin=1em}
    \setitemize[2]{leftmargin=1.5em}
    \setitemize[3]{leftmargin=1.5em}
 \else
    \setenumerate[1]{leftmargin=0pt,label=\arabic*}
    \setenumerate[2]{leftmargin= 1.3em,label=\arabic*}
    \setenumerate[3]{leftmargin= 1.3em,label=\arabic*}
    \setitemize[1]{leftmargin=0pt}
    \setitemize[2]{leftmargin=1.3em}
    \setitemize[3]{leftmargin=1.3em}
   \fi
\fi
\renewcommand\labelitemii{\normalfont \textendash}
\renewenvironment{quotation}
               {\list{}{\listparindent\parindent%
                        \itemindent    \listparindent
                        \rightmargin   \parindent
                        \leftmargin     \parindent
                        \parsep        \z@ \@plus\p@}%
               \item\relax\footnotesize\noindent\ignorespaces}
               {\endlist}
\renewenvironment{quote}
               {\list{}{\rightmargin \parindent
                         \leftmargin    \parindent}%
                \item\relax\footnotesize}
               {\endlist}
\renewenvironment{verse}
               {\let\\\@centercr
                \list{}{\footnotesize%
                    \itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\renewcommand\@makefntext{%
  \hskip-2.5em\makebox[2em][r]{\@thefnmark}\hskip.5em}
\def\sufmpsetup@setup{%thanks to Lorenzo Pantieri and Enrico Gregorio
    \itshape\footnotesize%
    \parindent=0pt \lineskip=0pt \lineskiplimit=0pt %
    \tolerance=2000 \hyphenpenalty=300 \exhyphenpenalty=300%
    \doublehyphendemerits=100000%
    \finalhyphendemerits=\doublehyphendemerits}
\long\def\@xmpar[#1]#2{%
    \@savemarbox\@marbox{\sufmpsetup@setup\raggedleft\hspace{0pt}#1}%
    \@savemarbox\@currbox{\sufmpsetup@setup\raggedright\hspace{0pt}#2}%
    \@xympar}
\long\def\@ympar#1{%
    \@savemarbox\@marbox{\sufmpsetup@setup\raggedleft\hspace{0pt}#1}%
    \global\setbox\@currbox\copy\@marbox \@xympar}
\ifsuftesi@nomarginpar
    \renewcommand\marginpar[2][]{}
     \else
  \fi
\if@titlepage
  \newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
         \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{abstract}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \small
        \begin{center}%
          {\abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi
\newcommand\abstractname{Abstract}
\edef\sufengine{%
  \ifxetex
  \noexpand\XeLaTeX
  \else
      \ifluatex
        Lua\noexpand\LaTeX
      \else
       \noexpand\LaTeX
      \fi
  \fi}
\newcommand{\colophon}[3][]{%
  \thispagestyle{empty}
  \null
    \vfill
     \def\next{#2}
         \ifx\next\@empty\else
            \noindent Copyright \copyright{} \the\year~#2\\[1ex]
          All rights reserved
        \fi
  \vfill
  {\small\noindent This work has been typeset with \sufengine{}%
     \def\next{#1}
        \ifx\next\@empty\else on #1
      \fi using the \textsf{suftesi} class by
      Ivan Valbusa\index{Valbusa, Ivan}. #3\par}
      \cleardoublepage}
\newcommand{\bookcolophon}[2]{%
  \thispagestyle{empty}
  \null
    \vfill
            \noindent #1
  \vfill
  {\small\noindent #2\par}
      \cleardoublepage}
\newcommand{\artcolophon}[1]{%
\thispagestyle{empty}
  \null
    \vfill
  {\small\noindent #1\par}}
\newcommand{\finalcolophon}[1]{%
\thispagestyle{empty}
  \null\vspace*{\stretch{1}}
  \begin{center}
  \begin{minipage}{.5\textwidth}
  \centering\small #1
  \end{minipage}
  \end{center}
    \vspace*{\stretch{6}}
  }
\def\chapterintro{
  \@ifstar{\@tempswafalse\@chapterintro}{\@tempswatrue\@chapterintro}}
\def\@chapterintro{\phantomsection
  \if@tempswa\section*{\suffchapterintroname}\fi
  \addcontentsline{toc}{section}{\suffchapterintroname}}
\newcommand{\chapterintroname}[1]{\def\suffchapterintroname{#1}}
\chapterintroname{Introduzione}
\newif\ifheadbreak\headbreakfalse
  \DeclareRobustCommand{\headbreak}
    {\ifheadbreak\\\else\fi}
\newif\ifxheadbreak\xheadbreaktrue
  \DeclareRobustCommand{\xheadbreak}
    {\ifxheadbreak\\\else\fi}
\let\origtableofcontents\tableofcontents
  \renewcommand{\tableofcontents}{%
    \begingroup\headbreaktrue\xheadbreakfalse%
  \origtableofcontents\endgroup}
\renewcommand\frontmatter{\cleardoublepage\@mainmatterfalse}
\renewcommand\mainmatter{\cleardoublepage\@mainmattertrue}
\newenvironment{bibliografia}{%
  \ifsuftesi@article
    \section*{\refname}
     \addcontentsline{toc}{section}{\refname}
  \else
  \chapter{\bibname}%
  \fi
      \normalfont \list{}{%
      \setlength{\itemindent}{-\parindent}
      \setlength{\leftmargin}{\parindent}
      \setlength{\labelwidth}{\leftmargin}
      \setlength{\parsep}{\parskip}
      \let\makelabel}}
  {\endlist}
\newcommand{\losname}{Sigle}
\newcommand{\itlabel}[1]{\itshape\hbox to 6em{#1}}
\newenvironment{sigle}{%
  \chapter{\losname}
    \normalfont \list{}{%
      \setlength{\labelsep}{0.5em}
      \setlength{\itemindent}{0pt}
      \setlength{\leftmargin}{6em}
      \setlength{\labelwidth}{\leftmargin}
      \setlength{\listparindent}{\parindent}
      \setlength{\parsep}{\parskip}
      \let\makelabel\itlabel}}
  {\endlist}
\let\hemph\emph
\frenchspacing
\endinput
%%
%% End of file `suftesi.cls'.