%%
%% This is file `njurepo.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% njurepo.dtx  (with options: `cls')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2019 by Zangwei Zheng <zhengzangw@gmail.com>
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 

  % \input{parts/examples/appendix01}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{njurepo}[2019/01/25 1.0.0 Nanjing University Report Template]
\hyphenation{NJU-repo}
\def\njurepo{\textsc{NJU}\-\textsc{repo}}
\def\thuthesis{\textsc{Thu}\-\textsc{Thesis}}
\def\version{1.1.2}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=nju,
    prefix=nju@,
    setkeys=\kvsetkeys
}
\DeclareStringOption[chinese]{language}[chinese]
\DeclareStringOption[any]{open}[any]
\DeclareBoolOption{wide}
\DeclareBoolOption{color}
\DeclareBoolOption{draft}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}

\ProcessKeyvalOptions*
\newcommand\nju@validate@key[1]{%
  \@ifundefined{nju@\csname nju@#1\endcsname true}{%
    \ClassError{njurepo}{Invalid value '\csname nju#1\endcsname'}{}
    }{%
      \csname nju@\csname nju@#1\endcsname true\endcsname
    }
}
\newif\ifnju@chinese
\newif\ifnju@english
\nju@validate@key{language}
\newif\ifnju@any
\newif\ifnju@right
\nju@validate@key{open}
\LoadClass[a4paper,openany,UTF8,zihao=-4,scheme=plain]{ctexbook}
\RequirePackage{etoolbox}
\RequirePackage{ifxetex}
\RequirePackage{xparse}
\RequirePackage{graphicx}
\graphicspath{{resources/}}
\graphicspath{{resources/logo/}}
\RequirePackage[labelformat=simple]{subcaption}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage{tikz}
\usetikzlibrary{decorations.pathmorphing,graphs,calc}
\RequirePackage{dirtree}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{tabularx}
\RequirePackage{diagbox}
\RequirePackage{makecell}
\RequirePackage{float}
\RequirePackage{CJKfntef}
\RequirePackage{amsmath}
\RequirePackage[amsmath, thmmarks, hyperref]{ntheorem}
\RequirePackage{physics}
\RequirePackage{bbding,stmaryrd}
\RequirePackage[sort&compress]{natbib}
\RequirePackage{hyperref}
\ifxetex
  \hypersetup{%
    CJKbookmarks=true}
\else
  \hypersetup{%
    unicode=true,
    CJKbookmarks=false}
\fi
\hypersetup{%
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=1,
  breaklinks=true,
  colorlinks=false,
  plainpages=false,
  pdfborder=0 0 0} 
\urlstyle{same}
\def\UrlBreaks{%
  \do\/%
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l%
     \do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z%
  \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L%
     \do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z%
  \do0\do1\do2\do3\do4\do5\do6\do7\do8\do9\do=\do/\do.\do:%
  \do\*\do\-\do\~\do\'\do\"\do\-}
\Urlmuskip=0mu plus 0.1mu
\RequirePackage{fancyhdr}
\RequirePackage{notoccite} 
\RequirePackage{geometry}
\ifnju@wide
\geometry{
    a4paper, %210*297mm
    hcentering,
    ignoreall,
    nomarginpar,
    left=10mm,
    headheight=5mm,
    headsep=5mm,
    textheight=237mm,
    bottom=29mm,
    footskip=6mm
}\else
\geometry{
    a4paper, %210*297mm
    hcentering,
    ignoreall,
    nomarginpar,
    left=30mm,
    headheight=5mm,
    headsep=5mm,
    textheight=237mm,
    bottom=29mm,
    footskip=6mm
}
\fi
\let\nju@cleardoublepage\cleardoublepage
\newcommand{\nju@clearemptydoublepage}{%
  \clearpage{\pagestyle{nju@empty}\nju@cleardoublepage}}
\let\cleardoublepage\nju@clearemptydoublepage
\renewcommand\frontmatter{%
    \ifnju@right\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \pagenumbering{Roman}
    \pagestyle{nju@empty}}
\renewcommand\mainmatter{%
    \ifnju@right\cleardoublepage\else\clearpage\fi
    \@mainmattertrue
    \pagenumbering{arabic}
    \pagestyle{nju@headings}}
\renewcommand\backmatter{%
    \ifnju@right\cleardoublepage\else\clearpage\fi
    \@mainmattertrue}
\newcommand\nju@fontset{\csname g__ctex_fontset_tl\endcsname}
\ifthenelse{\equal{\nju@fontset}{fandol}}{
  \setmainfont[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]{texgyretermes}
  \setsansfont[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]{texgyreheros}
  \setmonofont[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
    Scale          = MatchLowercase,
  ]{texgyrecursor}
}{
  \setmainfont{Times New Roman}
  \setsansfont{Arial}
  \ifthenelse{\equal{\nju@fontset}{mac}}{
    \setmonofont[Scale=MatchLowercase]{Menlo}
  }{
    \setmonofont[Scale=MatchLowercase]{Courier New}
  }
}
\RequirePackage{unicode-math}
\unimathsetup{
  math-style = ISO,
  bold-style = ISO,
  nabla      = upright,
  partial    = upright,
}
\IfFontExistsTF{STIX2Math.otf}{
  \setmathfont[StylisticSet=8]{STIX2Math.otf}
  \setmathfont[range={scr,bfscr},StylisticSet=1]{STIX2Math.otf}
  \IfFontExistsTF{XITSMath-Regular.otf}{
    \setmathfont[range={\partial,\lbrace,\rbrace}]{XITSMath-Regular.otf}
  }{
    \setmathfont[range={\partial,\lbrace,\rbrace}]{xits-math.otf}
  }
}{
  \setmathfont[
    Extension    = .otf,
    BoldFont     = *bold,
    StylisticSet = 8,
  ]{xits-math}
  \setmathfont[range={cal,bfcal},StylisticSet=1]{xits-math.otf}
}
\ifnju@chinese
  \def\mathellipsis{\cdots}
\fi
\protected\def\le{\leqslant}
\protected\def\ge{\geqslant}
\AtBeginDocument{%
  \renewcommand\leq{\leqslant}%
  \renewcommand\geq{\geqslant}%
}
\removenolimits{%
  \int\iint\iiint\iiiint\oint\oiint\oiiint
  \intclockwise\varointclockwise\ointctrclockwise\sumint
  \intbar\intBar\fint\cirfnint\awint\rppolint
  \scpolint\npolint\pointint\sqint\intlarhk\intx
  \intcap\intcup\upint\lowint
}
\AtBeginDocument{%
  \renewcommand{\Re}{\operatorname{Re}}%
  \renewcommand{\Im}{\operatorname{Im}}%
  \renewcommand\nabla{\mbfnabla}%
}
\newcommand\bm{\symbf}
\renewcommand\boldsymbol{\symbf}
\newcommand\square{\mdlgwhtsquare}
\allowdisplaybreaks[4]
\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter-\fi\@arabic\c@equation}
\def\make@df@tag{\@ifstar\nju@make@df@tag@@\make@df@tag@@@}
\def\nju@make@df@tag@@#1{\gdef\df@tag{\nju@maketag{#1}\def\@currentlabel{#1}}}
\def\nju@maketag#1{\maketag@@@{(\ignorespaces #1\unskip\@@italiccorr)}}
\def\tagform@#1{\maketag@@@{(\ignorespaces #1\unskip\@@italiccorr)\equcaption{#1}}}
\renewcommand{\eqref}[1]{\textup{(\ref{#1})}}
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{20bp}%
  \abovedisplayskip=12bp \@plus 2bp \@minus 2bp
  \abovedisplayshortskip=12bp \@plus 2bp \@minus 2bp
  \belowdisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\abovedisplayshortskip}
\def\nju@def@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][1.3]{%
    \fontsize{#2}{##1\dimexpr #2}\selectfont}}
\nju@def@fontsize{chuhao}{42bp}
\nju@def@fontsize{xiaochu}{36bp}
\nju@def@fontsize{yihao}{26bp}
\nju@def@fontsize{xiaoyi}{24bp}
\nju@def@fontsize{erhao}{22bp}
\nju@def@fontsize{xiaoer}{18bp}
\nju@def@fontsize{sanhao}{16bp}
\nju@def@fontsize{xiaosan}{15bp}
\nju@def@fontsize{sihao}{14bp}
\nju@def@fontsize{banxiaosi}{13bp}
\nju@def@fontsize{xiaosi}{12bp}
\nju@def@fontsize{dawu}{11bp}
\nju@def@fontsize{wuhao}{10.5bp}
\nju@def@fontsize{xiaowu}{9bp}
\nju@def@fontsize{liuhao}{7.5bp}
\nju@def@fontsize{xiaoliu}{6.5bp}
\nju@def@fontsize{qihao}{5.5bp}
\nju@def@fontsize{bahao}{5bp}
\newcommand\nju@setchinese{%
  \xeCJKResetPunctClass
}
\newcommand\nju@setenglish{%
  \xeCJKDeclareCharClass{HalfLeft}{"2018, "201C}%
  \xeCJKDeclareCharClass{HalfRight}{
    "00B7, "2019, "201D, "2013, "2014, "2025, "2026, "2E3A,
  }%
}
\newcommand\nju@setdefaultlanguage{%
  \ifnju@chinese
    \nju@setchinese
  \else
    \nju@setenglish
  \fi
}
\fancypagestyle{nju@empty}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}}
\fancypagestyle{nju@plain}{%
  \fancyhead{}
  \fancyfoot[C]{\xiaowu\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}}
\fancypagestyle{nju@headings}{%
  \fancyhead{}
  \fancyhead[C]{\wuhao\normalfont\leftmark}
  \fancyfoot{}
  \fancyfoot[C]{\wuhao\thepage}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0pt}}
\ctexset{%
  punct=quanjiao,
  space=auto,
  autoindent=true}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{environ}
\setlist{nosep}
\ifthenelse{\equal{\nju@fontset}{mac}}{
  \newfontfamily\nju@circlefont{Songti SC Light}
}{
  \ifthenelse{\equal{\nju@fontset}{windows}}{
    \newfontfamily\nju@circlefont{SimSun}
  }{
    \IfFontExistsTF{XITS-Regular.otf}{
      \newfontfamily\nju@circlefont{XITS-Regular.otf}
    }{
      \newfontfamily\nju@circlefont{xits-regular.otf}
    }
  }
}
\def\nju@textcircled#1{%
  \ifnum\value{#1} >9%
    \ClassError{njurepo}%
      {Too many footnotes in this page.}{Keep footnote less than 10.}%
  \fi
  {\nju@circlefont\symbol{\numexpr\value{#1}+"245F\relax}}%
}
\renewcommand{\thefootnote}{\nju@textcircled{footnote}}
\renewcommand{\thempfootnote}{\nju@textcircled{mpfootnote}}
\def\footnoterule{\vskip-3\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip2.6\p@}
\let\nju@footnotesize\footnotesize
\renewcommand\footnotesize{\nju@footnotesize\xiaowu[1.5]}
\let\nju@makefnmark\@makefnmark
\def\nju@@makefnmark{\hbox{{\normalfont\@thefnmark}}}
\pretocmd{\@makefntext}{\let\@makefnmark\nju@@makefnmark}{}{}
\apptocmd{\@makefntext}{\let\@makefnmark\nju@makefnmark}{}{}
\theorembodyfont{\normalfont}
\theoremheaderfont{\normalfont\heiti}
\theoremsymbol{\ensuremath{\square}}
\newtheorem*{proof}{证明}
\theoremsymbol{}
\theoremseparator{：}
\ifnju@chinese
  \theoremstyle{plain}
  \newcommand\nju@assumption@name{假设}
  \newcommand\nju@definition@name{定义}
  \newcommand\nju@proposition@name{命题}
  \newcommand\nju@lemma@name{引理}
  \newcommand\nju@theorem@name{定理}
  \newcommand\nju@axiom@name{公理}
  \newcommand\nju@corollary@name{推论}
  \newcommand\nju@exercise@name{练习}
  \newcommand\nju@example@name{例}
  \newcommand\nju@remark@name{注释}
  \newcommand\nju@conjecture@name{猜想}
  \theoremstyle{break}
  \newcommand\nju@problem@name{问题}
  \newcommand\nju@solution@name{解}
\else
  \theoremstyle{plain}
  \newcommand\nju@assumption@name{Assumption}
  \newcommand\nju@definition@name{Definition}
  \newcommand\nju@proposition@name{Proposition}
  \newcommand\nju@lemma@name{Lemma}
  \newcommand\nju@theorem@name{Theorem}
  \newcommand\nju@axiom@name{Axiom}
  \newcommand\nju@corollary@name{Corollary}
  \newcommand\nju@exercise@name{Exercise}
  \newcommand\nju@example@name{Example}
  \newcommand\nju@remark@name{Remark}
  \newcommand\nju@conjecture@name{Conjecture}
  \theoremstyle{break}
  \newcommand\nju@problem@name{Problem}
  \newcommand\nju@solution@name{Solution}
\fi
\theoremheaderfont{\bfseries}
\newtheorem{assumption}{\nju@assumption@name}[section]
\newtheorem{definition}{\nju@definition@name}[section]
\newtheorem{proposition}{\nju@proposition@name}[section]
\newtheorem{lemma}{\nju@lemma@name}[section]
\newtheorem{theorem}{\nju@theorem@name}[section]
\newtheorem{axiom}{\nju@axiom@name}[section]
\newtheorem{corollary}{\nju@corollary@name}[section]
\newtheorem{exercise}{\nju@exercise@name}[section]
\newtheorem{example}{\nju@example@name}[section]
\newtheorem{remark}{\nju@remark@name}[section]
\newtheorem{problem}{\nju@problem@name}[section]
\newtheorem{conjecture}{\nju@conjecture@name}[section]
\newtheorem{solution}{\nju@solution@name}[section]

\ifnju@chinese
\newcommand{\promisewords}{请独立完成作业，不得抄袭。\\若参考了其它资料，请给出引用。\\鼓励讨论，但需独立书写解题过程。}
\else
\newcommand{\promisewords}{I promise this work is done on my own with no plagiarism.}
\fi
\newcommand{\Hrule}{\noindent\rule{\linewidth}{0.5mm}}

\theorempostwork{\vspace{-0.5cm}\Hrule}
\newtheorem*{csolution}{\PencilRightDown\nju@solution@name}
\newtheorem*{nsolution}{\PencilRightDown\nju@solution@name}
\RequirePackage[listings]{tcolorbox}
\newtcolorbox{ps@problem}[1]{fonttitle=\bfseries,title=#1,before skip=0.5cm, after skip=-0.5cm}
\newenvironment{cproblem}[1][]{
    \begin{ps@problem}{\Checkmark\ \nju@problem@name\ #1}
}{
    \end{ps@problem}
}
\theoremstyle{plain}
\newtheorem*{nproblem}{\Checkmark\nju@problem@name}[section]
\setlength{\floatsep}{20bp \@plus4pt \@minus1pt}
\setlength{\intextsep}{20bp \@plus4pt \@minus2pt}
\setlength{\textfloatsep}{20bp \@plus4pt \@minus2pt}
\setlength{\@fptop}{0bp \@plus1.0fil}
\setlength{\@fpsep}{12bp \@plus2.0fil}
\setlength{\@fpbot}{0bp \@plus1.0fil}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\let\old@tabular\@tabular
\def\nju@tabular{\dawu[1.5]\old@tabular}
\DeclareCaptionLabelFormat{nju}{{\dawu[1.5]\normalfont #1~#2}}
\DeclareCaptionLabelSeparator{nju}{\hspace{1em}}
\DeclareCaptionFont{nju}{\dawu[1.5]}
\captionsetup{labelformat=nju,labelsep=nju,font=nju,skip=6bp}
\captionsetup[table]{position=top}
\captionsetup[figure]{position=bottom}
\captionsetup[sub]{font=nju}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\renewcommand{\thesubtable}{(\alph{subtable})}
\let\nju@LT@array\LT@array
\def\LT@array{\dawu[1.5]\nju@LT@array} % set default font size
\def\hlinewd#1{%
  \noalign{\ifnum0=`}\fi\hrule \@height #1 \futurelet
    \reserved@a\@xhline}
\ifnju@chinese
  \ctexset{%
    chapter/name={第,章},
    appendixname=附录,
    contentsname={目\hspace{\ccwd}录},
    listfigurename=插图索引,
    listtablename=表格索引,
    figurename=图,
    tablename=表,
    bibname=参考文献,
    indexname=索引,
  }
  \newcommand\listequationname{公式索引}
  \newcommand\equationname{公式}
\else
  \newcommand\listequationname{List of Equations}
  \newcommand\equationname{Equation}
\fi
\newcommand{\cabstractname}{摘\hspace{\ccwd}要}
\newcommand{\eabstractname}{Abstract}
\let\CJK@todaysave=\today
\def\CJK@todaysmall@short{\the\year 年 \the\month 月}
\def\CJK@todaysmall{\the\year 年 \the\month 月 \the\day 日}
\def\CJK@todaybig@short{\zhdigits{\the\year}年\zhnumber{\the\month}月}
\def\CJK@todaybig{\zhdigits{\the\year}年\zhnumber{\the\month}月\zhnumber{\the\day}日}
\def\CJK@today{\CJK@todaysmall}
\renewcommand\today{\CJK@today}
\newcommand\CJKtoday[1][1]{%
  \ifcase#1\def\CJK@today{\CJK@todaysave}
    \or\def\CJK@today{\CJK@todaysmall}
    \or\def\CJK@today{\CJK@todaybig}
  \fi}
\AtBeginDocument{%
  \pagestyle{nju@empty}
  \renewcommand{\chaptermark}[1]{\@mkboth{\CTEXthechapter\hskip\ccwd#1}{}}}
\newcommand\nju@chapter@titleformat[1]{%
    \ifthenelse%
      {\equal{#1}{\eabstractname}}%
      {\bfseries #1}%
      {#1}%
  }
\ctexset{%
  chapter={
    afterindent=true,
    pagestyle={nju@headings},
    beforeskip={9bp},
    aftername=\hskip\ccwd,
    afterskip={24bp},
    format={\centering\sffamily\sanhao[1]},
    nameformat=\relax,
    numberformat=\relax,
    titleformat=\nju@chapter@titleformat,
    lofskip=0pt,
    lotskip=0pt,
  },
  section={
    afterindent=true,
    beforeskip={24bp\@plus 1ex \@minus .2ex},
    afterskip={6bp\@plus .2ex},
    format={\sffamily\sihao[1.429]},
  },
  subsection={
    afterindent=true,
    beforeskip={16bp\@plus 1ex \@minus .2ex},
    afterskip={6bp \@plus .2ex},
    format={\sffamily\banxiaosi[1.538]},
    numberformat={\sffamily\banxiaosi[1.538]},
  },
  subsubsection={
    afterindent=true,
    beforeskip={16bp\@plus 1ex \@minus .2ex},
    afterskip={6bp \@plus .2ex},
    format={\sffamily\xiaosi[1.667]},
  },
  paragraph/afterindent=true,
  subparagraph/afterindent=true}
\newcounter{nju@bookmark}
\NewDocumentCommand\nju@chapter{s o m o}{
  \IfBooleanF{#1}{%
    \ClassError{njurepo}{You have to use the star form: \string\nju@chapter*}{}
  }%
  \ifnju@right\cleardoublepage\else\clearpage\fi\phantomsection%
  \IfValueTF{#2}{%
    \ifthenelse{\equal{#2}{}}{%
      \addtocounter{nju@bookmark}\@ne
      \pdfbookmark[0]{#3}{njuchapter.\thenju@bookmark}
    }{%
      \addcontentsline{toc}{chapter}{#3}
    }
  }{%
    \addcontentsline{toc}{chapter}{#3}
  }%
  \ctexset{chapter/beforeskip=25bp}
  \chapter*{#3}%
  \ctexset{chapter/beforeskip=15bp}
  \IfValueTF{#4}{%
    \ifthenelse{\equal{#4}{}}
    {\@mkboth{}{}}
    {\@mkboth{#4}{#4}}
  }{%
    \@mkboth{#3}{#3}
  }
}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\renewcommand\tableofcontents{%
  \nju@chapter*[]{\contentsname}
  \xiaosi[1.65]\@starttoc{toc}\normalsize}
\def\@pnumwidth{2em}
\def\@tocrmarg{\@pnumwidth}
\def\@dotsep{1}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 4bp \@plus\p@
    \setlength\@tempdima{4em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      {#1}%
      \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill%
      \nobreak{#2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

\patchcmd{\@dottedtocline}{\hb@xt@\@pnumwidth}{\hbox}{}{}
\renewcommand*\l@section{%
  \@dottedtocline{1}{\ccwd}{2.1em}}
\renewcommand*\l@subsection{%
  \@dottedtocline{2}{2\ccwd}{3em}}
\renewcommand*\l@subsubsection{%
  \@dottedtocline{3}{3.5em}{3.8em}}
\def\nju@def@term#1{%
  \define@key{nju}{#1}{\csname #1\endcsname{##1}}
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname nju@#1\endcsname{##1}}
  \csname #1\endcsname{}}
\nju@def@term{ctitle}
\nju@def@term{csubtitle}
\nju@def@term{csubsubtitle}
\nju@def@term{etitle}
\nju@def@term{esubtitle}
\nju@def@term{esubsubtitle}
\nju@def@term{cauthor}
\nju@def@term{csupervisor}
\nju@def@term{cassosupervisor}
\nju@def@term{ccosupervisor}
\nju@def@term{eauthor}
\nju@def@term{esupervisor}
\nju@def@term{eassosupervisor}
\nju@def@term{ecosupervisor}
\nju@def@term{cdegree}
\nju@def@term{edegree}
\nju@def@term{cdepartment}
\nju@def@term{edepartment}
\nju@def@term{cmajor}
\nju@def@term{emajor}
\nju@def@term{cdate}
\nju@def@term{edate}
\nju@def@term{stdid}
\nju@def@term{mail}
\cdate{\CJK@todaybig@short}
\edate{\ifcase \month \or January\or February\or March\or April\or May%
       \or June\or July \or August\or September\or October\or November
       \or December\fi\unskip,\ \ \the\year}
\newcommand{\nju@@cabstract}[1]{\long\gdef\nju@cabstract{#1}}
\newenvironment{cabstract}{\Collect@Body\nju@@cabstract}{}
\newcommand{\nju@@eabstract}[1]{\long\gdef\nju@eabstract{#1}}
\newenvironment{eabstract}{\Collect@Body\nju@@eabstract}{}
\def\nju@parse@keywords#1{
  \define@key{nju}{#1}{\csname #1\endcsname{##1}}
  \expandafter\gdef\csname nju@#1\endcsname{}
  \expandafter\gdef\csname #1\endcsname##1{
    \@for\reserved@a:=##1\do{
      \expandafter\ifx\csname nju@#1\endcsname\@empty\else
        \expandafter\g@addto@macro\csname nju@#1\endcsname{%
          \ignorespaces\csname nju@#1@separator\endcsname}
      \fi
      \expandafter\expandafter\expandafter\g@addto@macro%
        \expandafter\csname nju@#1\expandafter\endcsname\expandafter{\reserved@a}}}}
\nju@parse@keywords{ckeywords}
\nju@parse@keywords{ekeywords}
\def\njusetup{\kvsetkeys{nju}}
\def\nju@ckeywords@separator{；}
\def\nju@ekeywords@separator{;}
\def\nju@catalog@number@title{分类号}
\def\nju@id@title{编号}
\def\nju@title@sep{：}
\def\nju@schoolname{南京大学}
\def\nju@author@title{姓名}
\def\nju@department@title{系别}
\def\nju@major@title{专业}
\def\nju@supervisor@title{指导教师}
\def\nju@assosuper@title{辅导教师}
\def\nju@studentid@title{学号}
\def\nju@date@title{日期}
\def\nju@mail@title{邮箱}
\newcommand{\nju@ckeywords@title}{关键词：}
\def\nju@title@pre{}

\def\nju@eng@title@sep{:}
\def\nju@eng@author@title{Name}
\def\nju@eng@studentid@title{StdID}
\def\nju@eng@date@title{Date}
\def\nju@eng@mail@title{E-mail}
\renewcommand{\maketitle}{
  \nju@setup@pdfinfo
  \begin{center} {\LARGE \ifnju@chinese\nju@ctitle\else\nju@etitle\fi}
  \end{center}
  \hspace*{\fill}
  \ifnju@chinese
    \nju@author@title\nju@title@sep\CJKunderline{\nju@cauthor}
  \else
    \nju@eng@author@title\nju@eng@title@sep\underline{\nju@eauthor}
  \fi
  \hspace*{\fill}
  \ifx\nju@stdid\@empty\relax
  \else
    \ifnju@chinese
      \nju@studentid@title\nju@title@sep\CJKunderline{\nju@stdid}
    \else
      \nju@eng@studentid@title\nju@eng@title@sep\underline{\nju@stdid}
    \fi
  \fi
  \hspace*{\fill}
  \ifnju@chinese
    \nju@date@title\nju@title@sep\CJKunderline{\today}
  \else
    \nju@eng@date@title\nju@eng@title@sep\CJKunderline{\nju@edate}
  \fi
  \hspace*{\fill}\\
}
\newcommand{\maketitlepage}{
  \nju@setup@pdfinfo
  \begin{titlepage}
    \begin{center}
    \ifx\nju@esubsubtitle\@empty\relax  {\LARGE\sffamily\scshape\ifnju@chinese\nju@csubsubtitle\else\nju@esubsubtitle\fi\ }\\[1.5cm]
    \else
    {\LARGE\sffamily\scshape \ifnju@chinese\nju@csubsubtitle\else\nju@esubsubtitle\fi}\\[1.5cm]
    \fi
{\Large\sffamily\scshape \ifnju@chinese\nju@csubtitle\else\nju@esubtitle\fi}\\
    \rule{\linewidth}{0.5mm} \\[0.4cm]
{\huge\sffamily\bfseries \ifnju@chinese\nju@ctitle\else\nju@etitle\fi}\\
\rule{\linewidth}{0.5mm} \\[1.5cm]

\begin{center}
\begin{tabular}{@{\hspace{0.5cm}}l@{\hspace{0.5cm}}l}
\nju@eauthor & \nju@stdid\\
\end{tabular}
\end{center}
\vfill
{\large \nju@edate}
    \end{center}
    \ifnju@right\cleardoublepage\else\clearpage\fi
  \end{titlepage}
}
\newcommand\nju@underline[2][6em]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}
\newlength{\nju@title@width}
\ifxetex % todo: ugly codes
  \newcommand{\nju@put@title}[2][\nju@title@width]{%
  \begin{CJKfilltwosides}[b]{#1}#2\end{CJKfilltwosides}}
\else
  \newcommand{\nju@put@title}[2][\nju@title@width]{%
  \begin{CJKfilltwosides}{#1}#2\end{CJKfilltwosides}}
\fi
\newcommand{\nju@first@titlepage}{
  \begin{center}
    \vspace*{-1.6cm}
    \parbox[b][2.4cm][t]{\textwidth}{%
      \rule{1cm}{0cm}}
      \vskip0.65cm
      {\includegraphics[width=0.3\textwidth]{njuname0.pdf}}
      \par\vskip1.5cm
      {\xiaochu\heiti\ziju{0.5}\textbf\nju@csubtitle}
      \vskip2.2cm\hskip0.8cm
      \noindent\heiti\xiaoer\nju@title@pre
      \parbox[t]{12cm}{%
      \ignorespaces\yihao[1.51]%
      \renewcommand{\CJKunderlinebasesep}{0.25cm}%
      \renewcommand{\ULthickness}{1.3pt}%
      \ifxetex
        \xeCJKsetup{underline/format=\color{black}}%
      \else
        \def\CJKunderlinecolor{\color{black}}%
      \fi
      \centering\CJKunderline*{\nju@ctitle}

    }%
      \vskip1.3cm
      \vskip0.75cm
      \ifx\nju@cassosupervisor\@empty%
        \def\nju@tempa{7.15cm}
      \else%
        \def\nju@tempa{8.15cm}
      \fi%
      \parbox[t][\nju@tempa][t]{\textwidth}{%
        {\fangsong\sanhao[1.95]%
         \hspace*{1.9cm}
         \setlength{\nju@title@width}{4em}
         \setlength{\extrarowheight}{6pt}
         \ifxetex % todo: ugly codes
           \begin{tabular}{p{\nju@title@width}@{}l@{\extracolsep{8pt}}l}
         \else
           \begin{tabular}{p{\nju@title@width}l@{}l}
         \fi
             \nju@put@title{\nju@department@title} & \nju@title@sep
               & \nju@cdepartment\\
             \nju@put@title{\nju@major@title}      & \nju@title@sep
               & \nju@cmajor\\
             \nju@put@title{\nju@author@title}     & \nju@title@sep
               & \nju@cauthor \\
             \nju@put@title{\nju@supervisor@title} & \nju@title@sep
               & \nju@csupervisor\\
             \ifx\nju@cassosupervisor\@empty\else%
               \nju@put@title{\nju@assosuper@title} & \nju@title@sep
               & \nju@cassosupervisor\\
             \fi
           \end{tabular}
        }}
     \begin{center}
       {\vskip-1.0cm\xiaosi
         \songti\nju@cdate}
     \end{center}
    \end{center}} % end of titlepage
\newcommand{\nju@engcover}{%
  \begin{center}
    \vspace*{-5pt}
    \parbox[t][5.2cm][t]{\paperwidth-7.2cm}{
      \renewcommand{\baselinestretch}{1.5}
      \begin{center}
        \erhao[1.1]\bfseries\sffamily\nju@etitle%
      \end{center}}
    \parbox[t][][b]{\paperwidth-7.2cm}{
      \renewcommand{\baselinestretch}{1.3}
      \begin{center}
        \sanhao\sffamily by\\[3bp]
        \bfseries\nju@eauthor%
        \ifx\nju@emajor\empty\relax\else
          \\(~\nju@emajor~)%
        \fi
      \end{center}}
    \par\vspace{0.9cm}
    \parbox[t][2.1cm][t]{\paperwidth-7.2cm}{
      \renewcommand{\baselinestretch}{1.2}
      \xiaosan\centering
      \begin{tabular}{rl}
        Supervisor : & \nju@esupervisor\\
        \ifx\nju@eassosupervisor\@empty
          \else Associate Supervisor : & \nju@eassosupervisor\\\fi
        \ifx\nju@ecosupervisor\@empty
          \else Cooperate Supervisor : & \nju@ecosupervisor\\\fi
      \end{tabular}}
    \parbox[t][2cm][b]{\paperwidth-7.2cm}{
    \begin{center}
      \sanhao\bfseries\sffamily\nju@edate
    \end{center}}
  \end{center}}
\def\makecover{%
  \nju@setup@pdfinfo\nju@makecover}
\def\nju@setup@pdfinfo{%
  \ifnju@chinese
    \hypersetup{
      pdftitle    = \nju@ctitle,
      pdfauthor   = \nju@cauthor,
      pdfsubject  = \nju@cdegree,
      pdfkeywords = \nju@ckeywords,
    }%
  \else
    \hypersetup{
      pdftitle    = \nju@etitle,
      pdfauthor   = \nju@eauthor,
      pdfsubject  = \nju@edegree,
      pdfkeywords = \nju@ekeywords,
    }%
  \fi
  \hypersetup{
    pdfcreator={\njurepo-v\version}}}
\NewDocumentCommand{\nju@makecover}{o}{
  \phantomsection
  \pdfbookmark[-1]{\nju@ctitle}{ctitle}
  \normalsize%
  \begin{titlepage}
    \ifnju@chinese
      \nju@first@titlepage
    \else
      \nju@engcover
    \fi
    \ifnju@right\cleardoublepage\else\clearpage\fi
  \end{titlepage}
}
\newcommand{\makeabstract}{
  \normalsize
  \nju@makeabstract
  \let\@tabular\nju@tabular
}
\newbox\nju@kw
\newcommand\nju@put@keywords[2]{%
  \begingroup
    \setbox\nju@kw=\hbox{#1}
    \indent%
    \box\nju@kw#2\par
  \endgroup}
\newcommand{\nju@makeabstract}{%
  \clearpage
  \pagestyle{nju@plain}
  \pagenumbering{Roman}
  \ifnju@chinese
    \nju@setchinese
    \nju@chapter*[]{\cabstractname} % no tocline
    \nju@cabstract
    \vskip12bp
    \nju@put@keywords{\textbf\nju@ckeywords@title}{\nju@ckeywords}
  \else
  \nju@setenglish
    \nju@chapter*[]{\eabstractname} % no tocline
    \nju@eabstract
    \vskip12bp
    \nju@put@keywords{%
      \textbf{Key Words:\enskip}}{\nju@ekeywords}%
  \fi
  \nju@setdefaultlanguage
}
\ifnju@chinese
  \newcommand\nju@denotation@name{主要符号对照表}
\else
  \newcommand\nju@denotation@name{Nomenclature}
\fi
\newenvironment{denotation}[1][2.5cm]{%
  \nju@chapter*[]{\nju@denotation@name} % no tocline
  \vskip-30bp\xiaosi[1.6]\begin{nju@denotation}[labelwidth=#1]
}{%
  \end{nju@denotation}
}
\newlist{nju@denotation}{description}{1}
\setlist[nju@denotation]{%
  nosep,
  font=\normalfont,
  align=left,
  leftmargin=!, % sum of the following 3 lengths
  labelindent=0pt,
  labelwidth=2.5cm,
  labelsep*=0.5cm,
  itemindent=0pt,
}
\ifnju@chinese
  \newcommand\nju@ack@name{致\hspace{\ccwd}谢}
\else
  \newcommand\nju@ack@name{Acknowledgments}
\fi
\newcommand\nju@declarename{声\hspace{\ccwd}明}
\newcommand{\nju@declaretext}{本人郑重声明：所呈交的学位论文，是本人在导师指导下
  ，独立进行研究工作所取得的成果。尽我所知，除文中已经注明引用的内容外，本学位论
  文的研究成果不包含任何他人享有著作权的内容。对本论文所涉及的研究工作做出贡献的
  其他个人和集体，均已在文中以明确方式标明。}
\newcommand{\nju@signature}{签\hspace{1em}名：}
\newcommand{\nju@backdate}{日\hspace{1em}期：}
\NewDocumentEnvironment{acknowledgement}{o}{%
    \nju@chapter*{\nju@ack@name}
  }
  {
    \ifnju@english\relax\else%
      \IfNoValueTF{#1}{%
        \nju@chapter*{\nju@declarename}
        \par{\xiaosi\parindent2em\nju@declaretext}\vskip2cm
        {\xiaosi\hfill\nju@signature\nju@underline[2.5cm]\relax%
         \nju@backdate\nju@underline[2.5cm]\relax}%
      }{%
        \includepdf[pagecommand={\thispagestyle{nju@empty}%
          \phantomsection\addcontentsline{toc}{chapter}{\nju@declarename}%
        }]{#1}%
      }%
    \fi
  }
\def\nju@starttoc#1{% #1: float type, prepend type name in \listof*** entry.
  \let\oldnumberline\numberline
  \def\numberline##1{\oldnumberline{\csname #1name\endcsname\hskip.4em ##1}}
  \@starttoc{\csname ext@#1\endcsname}
  \let\numberline\oldnumberline}
\def\nju@listof#1{% #1: float type
  \@ifstar
    {\nju@chapter*[]{\csname list#1name\endcsname}\nju@starttoc{#1}}
    {\nju@chapter*{\csname list#1name\endcsname}\nju@starttoc{#1}}}
\renewcommand\listoffigures{\nju@listof{figure}}
\renewcommand*\l@figure{\addvspace{6bp}\@dottedtocline{1}{0em}{4em}}
\renewcommand\listoftables{\nju@listof{table}}
\let\l@table\l@figure
\def\ext@equation{loe}
\def\equcaption#1{%
  \addcontentsline{\ext@equation}{equation}%
                  {\protect\numberline{#1}}}
\newcommand\listofequations{\nju@listof{equation}}
\let\l@equation\l@figure
\newcommand\bibstyle@inline{\bibpunct{[}{]}{,}{n}{,}{,}}
\DeclareRobustCommand\inlinecite{\@inlinecite}
\def\@inlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
\let\onlinecite\inlinecite
\renewcommand\bibsection{\nju@chapter*{\bibname}}
\renewcommand\bibfont{\wuhao[1.5]}
\setlength\bibhang{2\ccwd}
\addtolength{\bibsep}{-0.7em}
\setlength{\labelsep}{0.4em}
\def\@biblabel#1{[#1]\hfill}
\expandafter\newcommand\csname bibstyle@numeric\endcsname{%
  \bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\expandafter\newcommand\csname bibstyle@author-year\endcsname{%
  \bibpunct{(}{)}{;}{a}{,}{,}}
\patchcmd\NAT@citexnum{%
  \@ifnum{\NAT@ctype=\z@}{%
    \if*#2*\else\NAT@cmt#2\fi
  }{}%
  \NAT@mbox{\NAT@@close}%
}{%
  \NAT@mbox{\NAT@@close}%
  \@ifnum{\NAT@ctype=\z@}{%
    \if*#2*\else\textsuperscript{#2}\fi
  }{}%
}{}{}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa
  \if*#2*\else#2\NAT@spacechar\fi
\unskip\kern\p@\textsuperscript{\NAT@@open#1\NAT@@close\if*#3*\else#3\fi}%
   \else #1\fi\endgroup}
\patchcmd{\NAT@citex}{%
  \if*#2*\else\NAT@cmt#2\fi
  \if\relax\NAT@date\relax\else\NAT@@close\fi
}{%
  \if\relax\NAT@date\relax\else\NAT@@close\fi
  \if*#2*\else\textsuperscript{#2}\fi
}{}{}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa
  \if*#2*\else#2\NAT@spacechar\fi
\unskip\kern\p@\textsuperscript{\NAT@@open#1\NAT@@close\if*#3*\else#3\fi}%
   \else #1\fi\endgroup}
\patchcmd{\NAT@citexnum}{%
  \ifx\NAT@last@yr\relax
    \def@NAT@last@yr{\@citea}%
  \else
    \def@NAT@last@yr{--\NAT@penalty}%
  \fi
}{%
  \def@NAT@last@yr{-\NAT@penalty}%
}{}{}
\let\nju@appendix\appendix
\renewenvironment{appendix}{%
  \let\title\nju@appendix@title
  \nju@appendix}{%
  \let\title\@gobble}
\let\title\@gobble
\newcommand{\nju@appendix@title}[1]{%
  \begin{center}
    \xiaosi[1.667] #1
  \end{center}}
\newlist{translationbib}{enumerate}{1}
\setlist[translationbib]{label=[\arabic*],align=left,nosep,itemsep=6bp,
  leftmargin=10mm,labelsep=!,before=\vspace{0.5\baselineskip}\wuhao[1.3]}
\RequirePackage{xcolor}
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
\newcommand{\red}[1]{\textcolor{red}{#1}}
\newcommand{\redoverlay}[2]{\textcolor<#2>{red}{#1}}
\newcommand{\green}[1]{\textcolor{green}{#1}}
\newcommand{\greenoverlay}[2]{\textcolor<#2>{green}{#1}}
\newcommand{\blue}[1]{\textcolor{blue}{#1}}
\newcommand{\blueoverlay}[2]{\textcolor<#2>{blue}{#1}}
\newcommand{\purple}[1]{\textcolor{purple}{#1}}
\newcommand{\cyan}[1]{\textcolor{cyan}{#1}}
\newcommand{\teal}[1]{\textcolor{teal}{#1}}
\newcommand{\magenta}[1]{{\color{magenta}#1}}
\newcommand{\note}[2][Note]{{%
  \color{magenta}{\bfseries #1}\emph{#2}}}
\RequirePackage{verbatim}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\newcommand{\pseduo}[2]{
\begin{algorithm}
\caption{\textsc{#1}}
\label{alg:#1}
\begin{algorithmic}[1]
#2
\end{algorithmic}
\end{algorithm}
}
\RequirePackage{listings}
\lstdefinestyle{lstStyleBase}{%
   basicstyle=\small\ttfamily,
   aboveskip=\medskipamount,
   belowskip=\medskipamount,
   lineskip=0pt,
   boxpos=c,
   showlines=false,
   extendedchars=true,
   upquote=true,
   tabsize=2,
   showtabs=false,
   showspaces=false,
   showstringspaces=false,
   numbers=none,
   linewidth=\linewidth,
   xleftmargin=4pt,
   xrightmargin=0pt,
   resetmargins=false,
   breaklines=true,
   breakatwhitespace=false,
   breakindent=0pt,
   breakautoindent=true,
   columns=flexible,
   keepspaces=true,
   gobble=2,
   framesep=3pt,
   rulesep=1pt,
   framerule=1pt,
   backgroundcolor=\color{gray!5},
   stringstyle=\color{green!40!black!100},
   keywordstyle=\bfseries\color{blue!50!black},
   commentstyle=\slshape\color{black!60}
}

\newtcblisting{commandshell}{colback=black,colupper=white,colframe=yellow!75!black, listing only,listing options={style=tcblatex,language=sh},
every listing line={\textcolor{red}{\small\ttfamily\bfseries \$>}}}

\lstdefinestyle{lstStyleShell}{%
   style=lstStyleBase,
   frame=l,
   rulecolor=\color{purple},
   language=bash}

\lstdefinestyle{lstStyleLaTeX}{%
   style=lstStyleBase,
   frame=l,
   rulecolor=\color{violet},
   language=[LaTeX]TeX}

\lstdefinestyle{lstStylecdisplay}{%
  style=lstStyleBase,
  frame=tb,
  rulecolor=\color{cyan},
  keywordstyle=\color{magenta}\bfseries\ttfamily,
  commentstyle=\color{codegreen}\ttfamily,
stringstyle=\color{codepurple}\ttfamily\sffamily,
backgroundcolor=\color{backcolour},
captionpos=b,
numbers=left,
numberstyle=\footnotesize\color{codegray},
stepnumber=1,
  numbersep=5pt,
  language=C
}

\lstdefinestyle{lstStylecpseudo}{%
  style=lstStyleBase,
  frame=none,
  keywordstyle=\color{magenta}\bfseries\ttfamily,
  commentstyle=\color{codegreen}\ttfamily,
stringstyle=\color{codepurple}\ttfamily\sffamily,
captionpos=b,
numbers=left,
numberstyle=\footnotesize\color{codegray},
stepnumber=1,
  numbersep=5pt,
  language=C
}

\lstdefinestyle{lstStylecplus}{%
  style=lstStyleBase,
  frame=l,
  rulecolor=\color{blue},
  language=C++
}

\lstdefinestyle{lstStyleverilog}{%
  style=lstStyleBase,
  frame=l,
  rulecolor=\color{brown},
  language=verilog
}

\lstdefinestyle{lstStylepython}{%
  style=lstStyleBase,
  frame=l,
  rulecolor=\color{pink},
  language=python
}

\lstnewenvironment{code}{\lstset{style=lstStyleBase}}{}
\lstnewenvironment{latex}{\lstset{style=lstStyleLaTeX}}{}
\lstnewenvironment{shell}{\lstset{style=lstStyleShell}}{}
\lstnewenvironment{cdisplay}{\lstset{style=lstStylecdisplay}}{}
\lstnewenvironment{cplus}{\lstset{style=lstStylecplus}}{}
\lstnewenvironment{verilog}{\lstset{style=lstStyleverilog}}{}
\lstnewenvironment{python}{\lstset{style=lstStylepython}}{}
\lstnewenvironment{cpseudo}{\lstset{style=lstStylecpseudo}}{}
\newcommand{\figoptadd}[2]{
\begin{figure}[H]
\centering
\includegraphics[#1]{figs/#2}
\end{figure}
}

%%%%%%%%%%%%%%%%%%%%
\newcommand{\figoptaddcap}[3]{
\begin{figure}[H]
\centering
\includegraphics[#1]{figs/#2}
\caption{#3}
\label{fig:#2}
\end{figure}
}
%%%%%%%%%%%%%%%%%%%
\newcommand{\tabncc}[3]{
\begin{table}[H]
\centering
\begin{tabular}{|*{#1}{c|}}
\toprule
#2\\
\bottomrule
\end{tabular}
\caption{#3}
\label{form:#3}
\end{table}}
%%%%%%%%%%%%%%%%%%%
\newcommand{\tabnc}[2]{
\begin{table}[H]
\centering
\begin{tabular}{|*{#1}{c|}}
\toprule
#2\\
\bottomrule
\end{tabular}
\end{table}}
\newcommand{\tnl}{\tabularnewline\midrule}
\def\cmd#1{\cs{\expandafter\cmd@to@cs\string#1}}
\def\cmd@to@cs#1#2{\char\number`#2\relax}
\DeclareRobustCommand\cs[1]{\texttt{\char`\\#1}}
\newcommand*{\meta}[1]{{%
  \ensuremath{\langle}\rmfamily\itshape#1\/\ensuremath{\rangle}}}
\providecommand\marg[1]{%
  {\ttfamily\char`\{}\meta{#1}{\ttfamily\char`\}}}
\providecommand\oarg[1]{%
  {\ttfamily[}\meta{#1}{\ttfamily]}}
\providecommand\parg[1]{%
  {\ttfamily(}\meta{#1}{\ttfamily)}}
\providecommand\pkg[1]{{\sffamily#1}}
\RequirePackage{watermark}
\ifnju@draft
\AtEndOfClass{
\watermark{%
\parbox[b][\paperheight]{\paperwidth}{%
\vfill
\centering%
\begin{tikzpicture}[remember picture,overlay]
\node [rotate=45,scale=10] at ($(current page.center) +(-1cm,1cm)$)
{\textcolor[gray]{0.8}{DRAFT}};
\node [rotate=45,scale=3] at ($(current page.center) +(1cm,-1cm)$)
{\textcolor[gray]{0.75}{Compile time: \the\year - \the\month - \the\day}};
\end{tikzpicture}%
\vfill
}
  }
}
\fi
\renewcommand{\thesection}{\arabic{section}}
\newcommand{\nchapter}[1]{
  {\let\clearpage\relax\par\vspace{1cm} \chapter*{\LARGE#1}}
}
\newcommand*{\rom}[1]{\expandafter\@slowromancap\romannumeral #1@}

\newcommand{\blankpage}{
\clearpage
\begin{titlepage}
\null\vfil
\begin{center}
\textit{This page intentionally left blank.}
\end{center}
\end{titlepage}
}
\newcommand{\rmnum}[1]{\romannumeral #1}
\newcommand{\Rmnum}[1]{\expandafter\@slowromancap\romannumeral #1@}
\AtEndOfClass{\sloppy}
\endinput
%%
%% End of file `njurepo.cls'.
