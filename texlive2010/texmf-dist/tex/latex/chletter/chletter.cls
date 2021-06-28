%%
%% This is file `chletter.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% chletter.dtx  (with options: `chletter')
%% 
%% Copyright 2008 Boris Oriet
%% The licence is LPPL.
%% 
\NeedsTeXFormat{LaTeX2e}[1996/06/01]
\ProvidesClass{chletter}[2008/07/29 v1.0 Swiss Letter document class]
\newcommand\@ptsize{}
\DeclareOption{a4paper}{\paperheight297mm\paperwidth210mm}
\DeclareOption{a5paper}{\paperheight210mm\paperwidth148mm}
\DeclareOption{b5paper}{\paperheight250mm\paperwidth176mm}
\DeclareOption{letterpaper}{\paperheight11in\paperwidth8.5in}
\DeclareOption{legalpaper}{\paperheight14in\paperwidth8.5in}
\DeclareOption{executivepaper}{\paperheight10.5in\paperwidth7.25in}
\DeclareOption{landscape}
 {\@tempdima\paperheight
  \paperheight\paperwidth
  \paperwidth\@tempdima}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{oneside}{\@twosidefalse\@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue\@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5\p@}}
\DeclareOption{final}{\setlength\overfullrule{0\p@}}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\ExecuteOptions{a4paper,11pt,oneside,onecolumn,final}
\ProcessOptions
\input{size1\@ptsize.clo}
\parskip9\p@\parindent18\p@
\newdimen\letterskip\newdimen\letterindent
\brokenpenalty10000
\topmargin\z@\topskip12\p@\headheight12\p@\headsep24\p@
\footskip36\p@\footnotesep12\p@\skip\footins18\p@
\textwidth\paperwidth\addtolength\textwidth{-180\p@}
\textheight\paperheight\addtolength\textheight{-216\p@}
\oddsidemargin36\p@\evensidemargin0\p@
\marginparwidth48\p@\marginparsep12\p@\marginparpush6\p@
\newdimen\addressmargin\addressmargin246\p@
\newdimen\longindentation\newdimen\indentedwidth
\newdimen\fromtop\fromtop\z@\addtolength\fromtop{-\headheight}
\addtolength\fromtop{-\headsep}\addtolength\fromtop{-\baselineskip}
\newdimen\fromheight\fromheight60\p@\newdimen\toheight\toheight96\p@
\newdimen\sigspace\sigspace6\bigskipamount
\def\ps@plain
 {\let\@oddhead\@empty
  \def\@oddfoot
  {\footnotesize{\hfil\pagename~\thepage}}
  \let\@evenhead\@oddhead\let\@evenfoot\@oddfoot}
\def\ps@headings
 {\def\@oddhead
  {\footnotesize{\hspace*{-\oddsidemargin}\headtoname~\toname\hfil\pagename~\thepage}}
  \def\@oddfoot
  {\footnotesize{\hspace*{-\oddsidemargin}\leftmark\hfil\rightmark}}
  \let\@evenhead\@oddhead\let\@evenfoot\@oddfoot}
\def\ps@myheadings
 {\def\@oddhead
  {\footnotesize{\hspace*{-\oddsidemargin}\leftmark\hfil\rightmark}}
  \def\@oddfoot
  {\footnotesize{\hfil\pagename~\thepage}}
  \let\@evenhead\@oddhead\let\@evenfoot\@oddfoot}
\def\ps@firstpage
 {\let\@oddhead\@empty
  \def\@oddfoot
  {\footnotesize{\hspace*{-\oddsidemargin}\leftmark\hfil\rightmark}}
  \let\@evenhead\@oddhead\let\@evenfoot\@oddfoot}
\newcommand*{\name}[1]{\def\fromname{#1}}\name{}
\newcommand*{\signature}[1]{\def\fromsig{#1}}\signature{}
\newcommand*{\address}[1]{\def\fromaddress{#1}}\address{}
\newcommand*{\location}[1]{\def\fromlocation{#1}}\location{}
\newcommand*{\telephone}[1]{\def\telephonenum{#1}}\telephone{}
\newcommand*{\return}[1]{\def\returnaddress{#1}}\return{}
\def\toname{}\def\toaddress{}\def\fromstreet{}\def\fromplace{}
\newcommand*{\ccname}{cc}\newcommand*{\enclname}{encl}
\newcommand*{\pagename}{Page}\newcommand*{\headtoname}{To}
\newcommand*{\today}
 {\ifcase\month\or January\or February\or March\or April\or May\or June\or
   July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\newcommand*{\maketitle}[1][p]
 {\vspace*{-\parskip}\ifx n#1\vspace*{\fromheight}\else\ifx r#1\vspace*{\fromheight}%
  \else\noindent\hspace{-\oddsidemargin}\parbox[t][\fromheight]{\addressmargin}
     {\ifx\ch@aut\@author
      \else\leavevmode\@author\\\fi
      \ifx\@empty\fromlocation
      \else\fromlocation\\\fi
      \ifx\@empty\fromaddress
      \else\fromaddress\par\medskip\fi
      \ifx\@empty\telephonenum
      \else{\footnotesize\telephonenum\par\medskip}\fi}%
      \parbox[t]{\indentedwidth}{~\\\@date}\par\vspace*{-\parskip}\fi\fi
    \noindent\hspace{\longindentation}\parbox[t][\toheight]{\indentedwidth}
   {\ifx p#1\else\ifx n#1\else{\footnotesize\returnaddress\par\medskip}\fi\fi
    \leavevmode\toname\\\toaddress\\}\vspace*{-\parskip}\par}
\newcommand{\opening}[2][n]
 {\ifx i#1\parindent\letterindent\else\parindent\z@\fi\par\noindent#2\par\medskip}
\newcommand{\closing}[2][n]
 {\ifx i#1\parindent\letterindent\else\parindent\z@\fi\par\medskip
  #2\par\vspace*{.5\sigspace}
  \noindent\hspace\longindentation
  \ifx\@empty\fromsig
    \ifx\@empty\fromname\@author\else\fromname\fi
  \else\fromsig\fi
  \par\vspace*{.5\sigspace}}
\newcommand*{\longindent}[1]
 {\par\noindent\hspace{\longindentation}\parbox[t]{\indentedwidth}{#1}\par\smallskip}
\newcommand*{\conc}[2][r]{\ch@pul[#1]{\textbf{#2}}\par\bigskip}
\newcommand*{\ps}[2][r]{\ch@put[#1]{#2}{\ignorespaces}}
\newcommand*{\cc}[2][r]{\ch@put[#1]{\emph{\ccname}}{#2}\par\medskip}
\newcommand*{\encl}[2][r]{\ch@put[#1]{\emph{\enclname}}{#2}\par\medskip}
\newcommand*{\subsubsection}[2][r]{\par\ch@pul[#1]{\textbf{#2}}\par}
\newcommand*{\subsection}[2][r]{\smallskip\subsubsection[#1]{#2}}
\newcommand*{\section}[2][r]{\medskip\subsubsection[#1]{#2}}
\newcommand*{\subparagraph}[1]{\par\textbf{#1}~}
\newcommand*{\paragraph}[1]{\par\noindent\textbf{#1}~}
\newcommand*{\makelabels}[1][r]{\let\ch@lab#1}
\newenvironment*{letter}[2][p]
 {\ch@pfr{\fromaddress}\ch@pto{#2}
  \letterindent\parindent\parindent\z@\letterskip\parskip
  \longindentation\addressmargin\addtolength\longindentation{-\oddsidemargin}
  \indentedwidth\textwidth\addtolength\indentedwidth{-\longindentation}
  \newpage\c@page\@ne\c@footnote\z@\pagestyle{plain}\thispagestyle{empty}
  \vspace*{\fromtop}\maketitle[#1]}
 {\vfil\pagebreak
  \if f\ch@lab
  \else\newpage\thispagestyle{empty}\vspace*{\fromtop}\maketitle[\ch@lab]\fi}
\leftmargini\parindent\leftmargin\leftmargini
\leftmarginii\leftmargini\leftmarginiii\leftmargini\leftmarginiv\leftmargini
\labelsep.25\parindent\labelwidth.75\parindent
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
 {\list{}{\labelwidth\z@\itemindent-\leftmargin
    \let\makelabel\descriptionlabel}}{\endlist}
\newcommand*{\descriptionlabel}[1]
 {\hspace\labelsep\textbf{#1}}
\newenvironment{verse}
 {\let\\=\@centercr
  \list{}{\itemsep\z@\itemindent-\parindent
    \listparindent\itemindent\rightmargin\leftmargin
    \addtolength\leftmargin\parindent}
    \item[]}{\endlist}
\newenvironment{quotation}
 {\list{}{\listparindent\parindent
    \itemindent\listparindent\rightmargin\leftmargin}
    \item[]}{\endlist}
\newenvironment{quote}
 {\list{}{\rightmargin\leftmargin}
   \item[]}{\endlist}
\arraycolsep5\p@\tabcolsep6\p@
\arrayrulewidth.4\p@\doublerulesep2\p@
\tabbingsep\labelsep
\skip\@mpfootins=\skip\footins
\fboxsep3\p@\fboxrule.4\p@
\renewcommand\theequation{\@arabic\c@equation}
\renewcommand\footnoterule
 {\kern-3\p@\hrule\@width.4\columnwidth\kern2.6\p@}
\newcommand\@makefntext[1]
 {\noindent\hb@xt@\z@{\hss\@makefnmark}#1}
\columnsep10\p@\columnseprule0\p@
\pagenumbering{arabic}
\raggedbottom\onecolumn
\newcommand\ch@pfr[1]
 {\expandafter\ch@cut#1\\\@empty
  \ifx\ch@sec\@empty\else\expandafter\ch@cut#1\@empty\fi
  \let\fromstreet\ch@fir\let\fromplace\ch@sec
  \ifx\@empty\returnaddress
    \ifx\@empty\fromname
      \ifx\@author\ch@aut\def\returnaddress{\fromstreet, \fromplace}
      \else\def\returnaddress{\@author, \fromstreet, \fromplace}\fi
    \else\def\returnaddress{\fromname, \fromstreet, \fromplace}\fi\fi}
\newcommand\ch@pto[1]
 {\expandafter\ch@cut#1\\\@empty
   \ifx\ch@sec\@empty\else\expandafter\ch@cut#1\@empty\fi
   \let\toname\ch@fir\let\toaddress\ch@sec}
\def\ch@cut#1\\#2\@empty{\def\ch@fir{#1}\def\ch@sec{#2}}
\newcommand{\ch@put}[3][r]
 {\par\noindent\hspace{-\oddsidemargin}\makebox[\oddsidemargin][#1]{#2~}#3}
\newcommand{\ch@pul}[2][r]
 {\noindent\ifx l#1\hspace{-\oddsidemargin}\fi#2}
\let\ch@lab=f\let\ch@aut=\@author
\def\@startlabels{}\let\@mlabel=\@gobbletwo
\endinput
%%
%% End of file `chletter.cls'.
