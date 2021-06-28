%% This is file `skrapport.cls', generated from `skrapport.tex' (key `class').
%% chscite Skånings rapportklass
%%
%% Copyright (C) 2012 by Simon Sigurdhsson <sigurdhsson@gmail.com>
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%%
%% The Current Maintainer of this work is Simon Sigurdhsson.
%%
%% This work consists of the file skrapport.tex and the
%% derived files skrapport.cls, skrapport-colortheme-default.sty,
%% skrapport-colortheme-unscathed.sty, skrapport-colortheme-violet.sty
%% and skrapport-colortheme-cruelwater.sty.

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{skrapport}%
    [2013/01/09 v0.10a Skånings rapportklass]
\RequirePackage{xparse,xstring}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=skrapport,prefix=skrapport@}
\newcommand\@ptsize{}
\IfFileExists{ifxetex.sty}{%
  \RequirePackage{ifxetex}%
}{%
  \newif\ifxetex\xetexfalse%
}
\DeclareStringOption[a4paper]{paper}
\DeclareVoidOption{a4paper}{\skrapport@SetupPaper}
\DeclareVoidOption{a5paper}{\skrapport@SetupPaper}
\newcommand*{\skrapport@SetupPaper}{\expandafter\@skrapport@SetupPaper\expandafter{\CurrentOption}}
\newcommand*{\@skrapport@SetupPaper}[1]{\setkeys{skrapport}{paper={#1}}}
\DeclareStringOption[11pt]{ptsize}
\DeclareVoidOption{10pt}{\skrapport@SetupPtsize}
\DeclareVoidOption{11pt}{\skrapport@SetupPtsize}
\DeclareVoidOption{12pt}{\skrapport@SetupPtsize}
\newcommand*{\skrapport@SetupPtsize}{\expandafter\@skrapport@SetupPtsize\expandafter{\CurrentOption}}
\newcommand*{\@skrapport@SetupPtsize}[1]{\setkeys{skrapport}{ptsize={#1}}}
\DeclareBoolOption[false]{twocolumn}
\DeclareComplementaryOption{onecolumn}{twocolumn}
\DeclareBoolOption[false]{draft}
\DeclareComplementaryOption{final}{draft}
\DeclareBoolOption[false]{leqno}
\DeclareBoolOption[false]{fleqn}
\DeclareStringOption[rm]{titles}
\DeclareVoidOption{rmtitles}{\skrapport@SetupTitles}
\DeclareVoidOption{bftitles}{\skrapport@SetupTitles}
\DeclareVoidOption{sftitles}{\skrapport@SetupTitles}
\newcommand*{\skrapport@SetupTitles}{\expandafter\@skrapport@SetupTitles\expandafter{\CurrentOption}}
\newcommand*{\@skrapport@SetupTitles}[1]{%
    \IfStrEq{#1}{bftitles}{%
        \setkeys{skrapport}{titles={bf}}%
    }{\IfStrEq{#1}{sftitles}{%
        \setkeys{skrapport}{titles={sf}}%
    }{
        \setkeys{skrapport}{titles={rm}}%
    }}}
\DeclareBoolOption[false]{eng}
\DeclareComplementaryOption{swe}{eng}
\DeclareStringOption[kpfonts]{font}
\DeclareVoidOption{kpfonts}{\skrapport@SetupFont}
\DeclareVoidOption{lmodern}{\skrapport@SetupFont}
\DeclareVoidOption{palatino}{\skrapport@SetupFont}
\DeclareVoidOption{nofont}{\skrapport@SetupFont}
\newcommand*{\skrapport@SetupFont}{\expandafter\@skrapport@SetupFont\expandafter{\CurrentOption}}
\newcommand*{\@skrapport@SetupFont}[1]{\setkeys{skrapport}{font={#1}}}
\DeclareBoolOption[false]{indent}
\DeclareComplementaryOption{noindent}{indent}
\DeclareBoolOption[true]{color}
\DeclareComplementaryOption{nocolor}{color}
\DeclareBoolOption[true]{math}
\DeclareComplementaryOption{nomath}{math}
\ProcessKeyvalOptions*
\IfStrEq{\skrapport@paper}{a4paper}{%
    \RequirePackage[a4paper]{geometry}
    \setlength\paperheight {297mm}
    \setlength\paperwidth  {210mm}
}{\IfStrEq{\skrapport@paper}{a5paper}{%
    \RequirePackage[a5paper]{geometry}
    \setlength\paperheight {210mm}
    \setlength\paperwidth  {148mm}
}{%
    \ClassError{skrapport}{%
        Option `paper' has unknown value `\skrapport@paper'!
    }{}
}}
\IfStrEq{\skrapport@ptsize}{10pt}{%
    \renewcommand\@ptsize{0}
}{%
    \IfStrEq{\skrapport@ptsize}{11pt}{%
        \renewcommand\@ptsize{1}
    }{%
        \IfStrEq{\skrapport@ptsize}{12pt}{%
            \renewcommand\@ptsize{2}
        }{%
            \ClassError{skrapport}{%
                Option `ptsize' has unknown value `\skrapport@ptsize'!
            }{}
        }
    }
}
\ifskrapport@draft
    \setlength\overfullrule{5pt}
\else
    \setlength\overfullrule{0pt}
\fi
\ifskrapport@leqno\input{leqno.clo}\fi
\ifskrapport@fleqn\input{fleqn.clo}\fi
\IfStrEq{\skrapport@titles}{bf}{%
    \let\@titstyle\bfseries%
}{\IfStrEq{\skrapport@titles}{sf}{%
    \let\@titstyle\sffamily\bfseries%
}{%
    \let\@titstyle\relax%
}}
\ifxetex
  \RequirePackage[quiet]{fontspec}
    \DeclareRobustCommand\nobreakspace{\leavevmode\nobreak\space}
\else
  \RequirePackage[T1]{fontenc}
\fi
\ifskrapport@color
    \RequirePackage{etoolbox}
    \RequirePackage{xcolor}
\fi
\IfStrEq{\skrapport@font}{nofont}{}{%
    \IfStrEq{\skrapport@font}{kpfonts}{%
        \RequirePackage[easyscsl,intlimits,sumlimits]{kpfonts}
    }{%
        \IfStrEq{\skrapport@font}{palatino}{%
            \IfFileExists{tgpagella.sty}{%
                \RequirePackage{tgpagella}
            }{%
                \RequirePackage[sc]{mathpazo}
            }
        }{%
            \IfStrEq{\skrapport@font}{lmodern}{%
                \RequirePackage{lmodern}
            }{%
                \ClassError{skrapport}{%
                    Option `font' has unknown value `\skrapport@font'!
                }{}
            }
        }
    }
}
\ifxetex
    \RequirePackage{xkeyval}
    \RequirePackage{polyglossia}
    \ifskrapport@eng
        \setmainlanguage[variant=british]{english}
        \setotherlanguage{swedish}
    \else
        \setmainlanguage{swedish}
        \setotherlanguage[variant=british]{english}
    \fi
\else
    \ifskrapport@eng
        \RequirePackage[swedish,british]{babel}
    \else
        \RequirePackage[british,swedish]{babel}
    \fi
\fi
\ifskrapport@twocolumn
    \RequirePackage{etoolbox}
    \RequirePackage{multicol}
\fi
\RequirePackage{calc}
\AtEndOfClass{
    \RequirePackage{microtype}
    \RequirePackage{icomma}
    \IfStrEq{\skrapport@font}{kpfonts}{}{\RequirePackage[intlimits]{amsmath}}
    \let\Finv\relax
    \let\Game\relax
    \let\beth\relax
    \let\gimel\relax
    \let\daleth\relax
    \IfStrEq{\skrapport@font}{kpfonts}{}{\RequirePackage{amssymb}}
    \IfStrEq{\skrapport@font}{kpfonts}{}{\RequirePackage{textcomp}}
    \ifskrapport@math\IfFileExists{skmath.sty}{\RequirePackage{skmath}}{}\fi
}
\AtBeginDocument{
    \@ifundefined{urlstyle}{}{\urlstyle{same}}
}
\input{size1\@ptsize.clo}
\addtolength\textwidth{0.5\oddsidemargin}
\addtolength\textwidth{0.5\evensidemargin}
\addtolength\oddsidemargin{-0.5\oddsidemargin}
\addtolength\evensidemargin{-0.5\evensidemargin}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\ifskrapport@indent\else
    \setlength\parskip{0.5\baselineskip \@plus 2pt}
    \parindent=\z@
    \setlength\parfillskip{30\p@ \@plus 1fil}
    \def\@listI{\leftmargin\leftmargini
       \topsep\z@ \parsep\parskip \itemsep\z@}
    \let\@listi\@listI
    \@listi
    \def\@listii{\leftmargin\leftmarginii
      \labelwidth\leftmarginii\advance\labelwidth-\labelsep
      \topsep\z@ \parsep\parskip \itemsep\z@}
    \def\@listiii{\leftmargin\leftmarginiii
      \labelwidth\leftmarginiii\advance\labelwidth-\labelsep
      \topsep\z@ \parsep\parskip \itemsep\z@}
    \partopsep=\z@
    \@ifundefined{CheckCommand}{}{%
      \CheckCommand*{\@starttoc}[1]{%
        \begingroup
          \makeatletter
          \@input{\jobname.#1}%
          \if@filesw
            \expandafter\newwrite\csname tf@#1\endcsname
            \immediate\openout \csname tf@#1\endcsname \jobname.#1\relax
          \fi
          \@nobreakfalse
        \endgroup}}
    \renewcommand*{\@starttoc}[1]{%
      \begingroup
        \makeatletter
        \parskip\z@
        \@input{\jobname.#1}%
        \if@filesw
          \expandafter\newwrite\csname tf@#1\endcsname
          \immediate\openout \csname tf@#1\endcsname \jobname.#1\relax
        \fi
        \@nobreakfalse
      \endgroup}
\fi
\frenchspacing
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{1}
\setcounter{totalnumber}{4}
\setcounter{dbltopnumber}{2}
\renewcommand\topfraction{.75}
\renewcommand\bottomfraction{.5}
\renewcommand\textfraction{.25}
\renewcommand\floatpagefraction{.625}
\renewcommand\dbltopfraction{.75}
\renewcommand\dblfloatpagefraction{.625}
\ProvideDocumentCommand\skrapport@email{m}{\texttt{#1}}
\AtBeginDocument{
    \@ifpackageloaded{hyperref}{%
        \DeclareDocumentCommand\skrapport@email{m}{%
            \href{mailto:#1}{\nolinkurl{#1}}%
        }%
    }{}%
}
\def\@author{\relax}
\DeclareDocumentCommand\author{om}{%
    \def\skrapport@tempi{#2\IfNoValueTF{#1}{}{~$\langle$\skrapport@email{#1}$\rangle$}}
    \if\@author\relax
        \xdef\@author{\skrapport@tempi}
    \else
        \expandafter\gdef\expandafter\@author\expandafter{\@author\\[0.5ex]\skrapport@tempi}
    \fi
}
\def\@regarding{\relax}
\newcommand{\regarding}[1]{\gdef\@regarding{#1}}
\def\@copyright{\relax}
\newcommand{\license}[1]{\gdef\@copyright{#1}}
\let\@smallprintstyle\relax
\newcommand\maketitle{\par%
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent%
      \hb@xt@1.8em{\hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \newpage
    \global\@topnum\z@
    \@maketitle
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
}
\def\@maketitle{%
  \newpage
  \null
  \begin{flushleft}%
        \vspace{-\headsep}
    {\small%
      \@smallprintstyle
      \if\@regarding\relax\else\@regarding{, }\fi%
      \@date\par%
    }%
    \vspace{1.5cm}%
    {\Huge\@titstyle\@title\par}%
    \vspace{.125cm}%
    {\Large\@titstyle\@author}%
    \vspace{.75cm}%
  \end{flushleft}%
  \par%
}
\newenvironment{abstract}{\newlength\skrapport@abstract@tw\newlength\skrapport@abstract@aw\settowidth{\skrapport@abstract@tw}{\bfseries\abstractname}\setlength{\skrapport@abstract@aw}{\the\textwidth-\the\skrapport@abstract@tw-1em}\begin{minipage}[t]{\skrapport@abstract@tw}\begin{flushright}\leavevmode\bfseries\abstractname\end{flushright}\end{minipage}\hspace{1em}\begin{minipage}[t]{\skrapport@abstract@aw}}{\end{minipage}}
\newcommand\ps@skrapport@titlepage{\def\@oddhead{}\def\@evenhead{}\def\@oddfoot{\begin{minipage}{\textwidth}\raggedleft\small\par\@smallprintstyle\@copyright\end{minipage}}\let\@evenfoot\@oddfoot}
\newenvironment{titlepage}{\cleardoublepage\setcounter{page}\@ne}{\thispagestyle{skrapport@titlepage}\cleardoublepage\setcounter{page}\@ne}
\setcounter{secnumdepth}{3}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\renewcommand\thesection{\@arabic\c@section}
\renewcommand\thesubsection{\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph{\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph{\theparagraph.\@arabic\c@subparagraph}
\newcommand\section{\@startsection{section}{1}{\z@}%
  {-4ex \@plus 1ex \@minus -1ex}%
  {.5ex \@plus.5ex}%
  {\normalfont\LARGE\@titstyle}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-3ex \@plus 1ex \@minus -1ex}%
  {.25ex \@plus.25ex}%
  {\normalfont\Large\@titstyle}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {-2ex \@plus .5ex \@minus -.5ex}%
  {.125ex \@plus.125ex}%
  {\normalfont\large\@titstyle}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {1ex \@plus .25ex \@minus -.25ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
  {1ex \@plus .25ex \@minus -.25ex}%
  {-1em}%
  {\normalfont\normalsize\itshape}}
\setlength\leftmargini{2em}
\leftmargin\leftmargini
\setlength\leftmarginii{2em}
\setlength\leftmarginiii{1.5em}
\setlength\leftmarginiv{1.5em}
\setlength\leftmarginv{1em}
\setlength\leftmarginvi{1em}
\setlength\labelsep{.5em}
\setlength\labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\textopenbullet}
\newcommand\labelitemiii{\normalfont\bfseries\textendash}
\newcommand\labelitemiv{\textrightarrow}
\newenvironment{description}
  {\list{}{\labelwidth\z@\itemindent-\leftmargin
    \let\makelabel\descriptionlabel}}{\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep\normalfont\bfseries #1}
\newenvironment{quote}{\list{}{\rightmargin\leftmargin}\item\relax\itshape}{\endlist}
\newenvironment{quotation}{\bigskip\begin{quote}}{\end{quote}\bigskip}
\newenvironment{verse}{\begin{quote}}{\end{quote}}
\newcommand\appendix{\par\setcounter{section}{0}\setcounter{subsection}{0}\gdef\thesection{\@Alph\c@section}}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\let\@emstyle\relax
\DeclareRobustCommand\em{%
    \@nomath\em%
    \ifdim \fontdimen\@ne\font >\z@%
        \itshape\bfseries%
    \else%
        \itshape%
    \fi%
    \@emstyle%
}
\renewcommand\footnoterule{%
    \kern-3\p@
    \hrule\@width.4\columnwidth
    \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Innehåll}
\newcommand\refname{Referenser}
\newcommand\figurename{Figur}
\newcommand\tablename{Tabell}
\newcommand\appendixname{Bilaga}
\newcommand\abstractname{Sammanfattning}
\def\today{\year--\month--\day}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins=\skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand\theequation{\@arabic\c@equation}
\newcounter{figure}\renewcommand\thefigure{\@arabic\c@figure}
\def\fps@figure{tb}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}{\@float{figure}}{\end@float}
\newenvironment{figure*}{\@dblfloat{figure}}{\end@dblfloat}
\newcounter{table}\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tb}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}{\@float{table}}{\end@float}
\newenvironment{table*}{\@dblfloat{table}}{\end@dblfloat}
\let\@captionstyle\relax
\newlength\abovecaptionskip\setlength\abovecaptionskip{10\p@}
\newlength\belowcaptionskip\setlength\belowcaptionskip{10\p@}
\long\def\@makecaption#1#2{%
    \vskip\abovecaptionskip
    \sbox\@tempboxa{\small{\bfseries#1:} \itshape#2}%
    \ifdim \wd\@tempboxa >\hsize
        \small{\bfseries\@captionstyle#1:} \itshape#2\par
    \else
        \global \@minipagefalse
        \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
    \fi
    \vskip\belowcaptionskip}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2em}
\newcommand\@dotsep{1.7}
\setcounter{tocdepth}{5}
\newcommand\tableofcontents{%
  \section*{\contentsname
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}
  }%
    \vskip\baselineskip%
  \@starttoc{toc}%
}
\newcommand*\l@section{\@dottedtocline{1}{0em}{1.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{1.3em}{2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.3em}{3.15em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{6.45em}{4.15em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{10.6em}{5.15em}}
\let\l@figure\@empty
\let\l@table\@empty
\newdimen\bibindent
\setlength\bibindent{2em}
\newenvironment{thebibliography}[1]
    {\section*{\refname}%
        \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
        \list{\@biblabel{\@arabic\c@enumiv}}%
            {\settowidth\labelwidth{\@biblabel{#1}}%
                \leftmargin\labelwidth
                \advance\leftmargin\labelsep
                \@openbib@code
                \usecounter{enumiv}%
                \let\p@enumiv\@empty
                \renewcommand\theenumiv{\@arabic\c@enumiv}}%
        \sloppy
        \clubpenalty4000
        \@clubpenalty \clubpenalty
        \widowpenalty4000}%
    {\def\@noitemerr
        {\@latex@warning{Empty ‘thebibliography’ environment}}%
        \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
    {\twocolumn[\section*{\indexname}]%
        \@mkboth{\MakeUppercase\indexname}%
            {\MakeUppercase\indexname}%
        \thispagestyle{plain}\parindent\z@
        \parskip\z@ \@plus .3\p@\relax
        \columnseprule \z@
        \columnsep 35\p@
        \let\item\@idxitem}
    {\onecolumn}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\ifskrapport@twocolumn
    \AtBeginDocument{
        \IfStrEq{\skrapport@paper}{a4paper}
            {\def\@@@lines{40}}{\def\@@@lines{28}}
        \IfStrEq{\skrapport@ptsize}{10pt}{
            \RequirePackage[fontsize=10pt,%
                            baseline=12pt,%
                            lines=\@@@lines]{grid}
        }{
            \IfStrEq{\skrapport@ptsize}{11pt}{
                \RequirePackage[fontsize=11pt,%
                                baseline=13.2pt,%
                                lines=\@@@lines]{grid}
            }{
                \RequirePackage[fontsize=12pt,%
                                baseline=14.4pt,%
                                lines=\@@@lines]{grid}
            }
        }
        \renewenvironment{abstract}{\section*{\abstractname}}{}
        \AfterEndPreamble{\begin{multicols}{2}}
        \AtEndDocument{\end{multicols}}
        \pretocmd{\maketitle}{\end{multicols}}{}{}
        \apptocmd{\maketitle}{\begin{multicols}{2}}{}{}
        \BeforeBeginEnvironment{equation}{\begin{gridenv}}
        \AfterEndEnvironment{equation}{\end{gridenv}}
        \BeforeBeginEnvironment{equation*}{\begin{gridenv}}
        \AfterEndEnvironment{equation*}{\end{gridenv}}
        \BeforeBeginEnvironment{multline}{\begin{gridenv}}
        \AfterEndEnvironment{multline}{\end{gridenv}}
        \BeforeBeginEnvironment{multline*}{\begin{gridenv}}
        \AfterEndEnvironment{multline*}{\end{gridenv}}
        \BeforeBeginEnvironment{gather}{\begin{gridenv}}
        \AfterEndEnvironment{gather}{\end{gridenv}}
        \BeforeBeginEnvironment{gather*}{\begin{gridenv}}
        \AfterEndEnvironment{gather*}{\end{gridenv}}
        \BeforeBeginEnvironment{align}{\begin{gridenv}}
        \AfterEndEnvironment{align}{\end{gridenv}}
        \BeforeBeginEnvironment{align*}{\begin{gridenv}}
        \AfterEndEnvironment{align*}{\end{gridenv}}
        \BeforeBeginEnvironment{flalign}{\begin{gridenv}}
        \AfterEndEnvironment{flalign}{\end{gridenv}}
        \BeforeBeginEnvironment{flalign*}{\begin{gridenv}}
        \AfterEndEnvironment{flalign*}{\end{gridenv}}
        \BeforeBeginEnvironment{alignat}{\begin{gridenv}}
        \AfterEndEnvironment{alignat}{\end{gridenv}}
        \BeforeBeginEnvironment{alignat*}{\begin{gridenv}}
        \AfterEndEnvironment{alignat*}{\end{gridenv}}
        \expandafter\let\expandafter
                    \old@figurest\csname figure*\endcsname
        \expandafter\let\expandafter
                    \old@endfigurest\csname endfigure*\endcsname
        \RenewDocumentEnvironment{figure}{o}{%
            \begin{gridenv}%
            \vspace{\intextsep}%
            \begin{minipage}{\linewidth}%
            \def\@captype{figure}%
        }{%
            \end{minipage}%
            \vspace{\intextsep}%
            \end{gridenv}%
        }
        \RenewDocumentEnvironment{figure*}{o}{\old@figurest}%
                                             {\old@endfigurest}
        \expandafter\let\expandafter
                    \old@tablest\csname table*\endcsname
        \expandafter\let\expandafter
                    \old@endtablest\csname endtable*\endcsname
        \RenewDocumentEnvironment{table}{o}{%
            \begin{gridenv}%
            \vspace{\intextsep}%
            \begin{minipage}{\linewidth}%
            \def\@captype{table}%
            \let\@old@caption\caption%
            \renewcommand{\caption}[1]{%
                \setlength{\@tempdima}{\abovecaptionskip}%
                \setlength{\abovecaptionskip}{\belowcaptionskip}%
                \setlength{\belowcaptionskip}{\@tempdima}%
                \@old@caption{##1}%
                \vspace{\belowcaptionskip}%
            }%
        }{%
            \end{minipage}%
            \vspace{\intextsep}%
            \end{gridenv}%
        }
        \let\oldoldtablest\oldtablest
        \renewcommand{\oldtablest}{%
            \oldoldtablest%
            \let\@old@caption\caption%
            \renewcommand{\caption}[1]{%
                \setlength{\@tempdima}{\abovecaptionskip}%
                \setlength{\abovecaptionskip}{\belowcaptionskip}%
                \setlength{\belowcaptionskip}{\@tempdima}%
                \@old@caption{##1}%
                \vspace{\belowcaptionskip}%
            }%
        }
        \RenewDocumentEnvironment{table*}{o}{\old@tablest}%
                                            {\old@endtablest}
        \newenvironment{onecol}{
            \end{onecol}
            \end{multicols}
            \begingroup
            \def\endonecol{
                \endgroup
                \begin{multicols}{2}
                \let\old@onecol\onecol
                \def\onecol{
                    \let\onecol\old@onecol
                }
                \begin{onecol}
            }
            \def\onecol{}
            \begin{onecol}
        }{}
    }
\fi
\NewDocumentCommand\@comment{m}{%
    {\textbf{Comment:} #1}%
}
\NewDocumentCommand\comment{sm}{%
    \IfBooleanTF{#1}%
        {\colorbox{red!50}{\@comment{#2}}}%
        {\marginpar{\@comment{#2}}}%
}
\ProvideDocumentCommand\com{sm}%
    {\IfBooleanTF{#1}{\comment*{#2}}{\comment{#2}}}
\ProvideDocumentCommand\note{sm}%
    {\IfBooleanTF{#1}{\comment*{#2}}{\comment{#2}}}
\ifskrapport@color
    \apptocmd{\bfseries}{\color{skrapport@boldcolor}}{}{\ClassError{skrapport}{Could not patch \protect\bfseries}{}}
    \apptocmd{\itshape}{\color{skrapport@italiccolor}}{}{\ClassError{skrapport}{Could not patch \protect\itshape}{}}
    \if\@titstyle\relax
        \def\@titstyle{\color{skrapport@titlecolor}}
    \else
        \apptocmd{\@titstyle}{\color{skrapport@titlecolor}}{}{\ClassError{skrapport}{Could not patch \protect\@titstyle}{}}
    \fi
    \def\@smallprintstyle{\color{skrapport@smallprintcolor}}
    \AtBeginDocument{%
        \let\@abstractname\abstractname
        \def\abstractname{\color{skrapport@titlecolor}\@abstractname}
    }
    \apptocmd{\quote}{\color{skrapport@quotecolor}}{}{}
    \def\@captionstyle{\color{skrapport@captioncolor}}
    \def\@emstyle{\color{skrapport@emphcolor}}
    \ifskrapport@twocolumn\AtBeginDocument{%
        \renewcommand\section{\@startsection {section}{1}{\z@}%
            {-.999\baselineskip}{0.001\baselineskip}{\bfseries\mathversion{bold}\color{skrapport@titlecolor}}}
        \renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
            {\baselineskip}{-.35\baselineskip}{\bfseries\color{skrapport@titlecolor}\unskip}}
        \renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
            {\baselineskip}{-.35\baselineskip}{\itshape\color{skrapport@titlecolor}\unskip}}
    }\fi
    \renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
        {1ex \@plus .25ex \@minus -.25ex}{-1em}{\normalfont\normalsize\bfseries\color{skrapport@titlecolor}}}
    \renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
        {1ex \@plus .25ex \@minus -.25ex}{-1em}{\normalfont\normalsize\itshape\color{skrapport@titlecolor}}}
    \AtBeginDocument{\@ifpackageloaded{hyperref}{%
        \hypersetup{%
            citebordercolor=skrapport@citecolor,citecolor=skrapport@citecolor,%
            filebordercolor=skrapport@filecolor,filecolor=skrapport@filecolor,%
            linkbordercolor=skrapport@linkcolor,linkcolor=skrapport@linkcolor,%
            menubordercolor=skrapport@menucolor,menucolor=skrapport@menucolor,%
            urlbordercolor=skrapport@urlcolor,urlcolor=skrapport@urlcolor,%
            runbordercolor=skrapport@runcolor,runcolor=skrapport@runcolor%
        }
    }{}}
    \AtBeginDocument{\color{skrapport@defaultcolor}}
    \newcommand\colortheme[1]{\usepackage{skrapport-colortheme-#1}}
    \colortheme{default}
\fi
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\pagenumbering{arabic}
\raggedbottom
\onecolumn
\endinput

