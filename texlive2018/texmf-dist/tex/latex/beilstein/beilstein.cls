%%
%% This is file `beilstein.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% beilstein.dtx  (with options: `class')
%% ----------------------------------------------------------------
%% beilstein -- Support for submissions to the ``Beilstein Journal
%% of Nanotechnology'' published by the Beilstein-Institut
%% for the Advancement of Chemical Sciences
%% Version:     1.4
%% E-mail:      journals-support@beilstein-institut.de
%% License:     Released under the LaTeX Project Public License v1.3c or later
%% See          http://www.latex-project.org/lppl.txt
%% ----------------------------------------------------------------
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{beilstein}
[2018/01/29 v1.4 Template for submissions to the ``Beilstein Journal %
   of Nanotechnology'' (BJNANO)]
\RequirePackage{xkeyval}
\RequirePackage{ifthen}
\newif\iflangamerican
\DeclareOptionX<beilstein>{american}{%
   \langamericantrue%
}%
\DeclareOptionX<beilstein>{british}{%
   \langamericanfalse%
}
\DeclareOptionX<beilstein>{english}{%
   \langamericanfalse%
}
\DeclareOptionX<beilstein>{latin1}{\def\beilstein@inputenc{latin1}}
\DeclareOptionX<beilstein>{utf8}{\def\beilstein@inputenc{utf8}}
\DeclareOptionX<beilstein>{applemac}{\def\beilstein@inputenc{applemac}}
\ExecuteOptionsX<beilstein>{american,latin1}
\newcommand*\beilstein@manuscript{fullresearchpaper}
\define@cmdkey{beilstein}[beilstein@]{manuscript}{}
\define@boolkey{beilstein}[beilstein@]{sectionnumbering}[true]{}
\define@boolkey{beilstein}[beilstein@]{fnpara}[true]{}
\ProcessOptionsX*<beilstein>
\newcommand*\beilstein@manuscript@fullresearchpaper{fullresearchpaper}
\newcommand*\beilstein@manuscript@commentary{commentary}
\newcommand*\beilstein@manuscript@bookreport{bookreport}
\newcommand*\beilstein@manuscript@review{review}
\newcommand*\beilstein@manuscript@letter{letter}
\newcommand*\beilstein@manuscript@suppinfo{suppinfo}
\newcommand*\beilstein@type@list{fullresearchpaper,commentary,%
bookreport,review,letter,suppinfo}
\newcommand*\beilstein@type@default{fullresearchpaper}
\newcommand*\beilstein@type@check{%
  \@tempswafalse
  \@for\@tempa:=\beilstein@type@list\do{%
    \ifx\@tempa\beilstein@manuscript
      \expandafter\@tempswatrue
    \fi
  }%
  \if@tempswa\else
    \ClassWarningNoLine{beilstein}{%
      Invalid manuscript type \beilstein@manuscript:\MessageBreak
      changed to default type \beilstein@type@default
    }%
    \let\beilstein@manuscript\beilstein@type@default
  \fi
}
\LoadClass[12pt,a4paper,oneside,onecolumn,titlepage]{article}
\iflangamerican
   \RequirePackage[american]{babel}%
   \ClassInfo{beilstein}{Language has been set to American English}%
\else%
   \RequirePackage[british]{babel}%
   \ClassInfo{beilstein}{Language has been set to British English}%
\fi%
\RequirePackage[\beilstein@inputenc]{inputenc}
\ClassInfo{beilstein}{Input encoding has been set to \beilstein@inputenc}\RequirePackage{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{mathptmx}
\RequirePackage[scaled=0.91]{helvet}
\RequirePackage{courier}
\RequirePackage{textcomp}
\RequirePackage[%
   textheight=23cm,%
   textwidth=16.8cm,%
   ignoreheadfoot]{geometry}
\usepackage[doublespacing]{setspace}
\pagestyle{plain}
\beilstein@type@check%
\ifthenelse{\equal{\beilstein@manuscript}{\beilstein@manuscript@suppinfo}}%
   {\RequirePackage[newcommands]{ragged2e}}%
   {\RequirePackage[document,newcommands]{ragged2e}}%
\setlength{\parindent}{0pt}
\newcommand{\setdisplaywidth}{%
   \ifthenelse{\boolean{widetext}}%
      {\makeatletter%
       \setlength{\mathindent}{0cm}%
       \makeatother}%
      {\makeatletter%
       \setlength{\mathindent}{1.6cm}%
       \makeatother}%
}%
\newboolean{widetext}
\newenvironment{widetext}%
   {\setboolean{widetext}{true}}%
   {\setboolean{widetext}{false}}
\RequirePackage[mathlines]{lineno}
\ifthenelse{\equal{\beilstein@manuscript}{\beilstein@manuscript@suppinfo}}%
   {\nolinenumbers}%
   {\linenumbers}%
\newcommand*\patchAmsMathEnvironmentForLineno[1]{%
  \expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
  \expandafter\let\csname oldend#1\expandafter\endcsname\csname end#1\endcsname
  \renewenvironment{#1}%
     {\linenomath\setdisplaywidth\csname old#1\endcsname}%
     {\csname oldend#1\endcsname\endlinenomath}}%
\newcommand*\patchBothAmsMathEnvironmentsForLineno[1]{%
  \patchAmsMathEnvironmentForLineno{#1}%
  \patchAmsMathEnvironmentForLineno{#1*}}%
\AtBeginDocument{%
   \patchBothAmsMathEnvironmentsForLineno{equation}%
   \patchBothAmsMathEnvironmentsForLineno{align}%
   \patchBothAmsMathEnvironmentsForLineno{flalign}%
   \patchBothAmsMathEnvironmentsForLineno{alignat}%
   \patchBothAmsMathEnvironmentsForLineno{gather}%
   \patchBothAmsMathEnvironmentsForLineno{multline}%
}%
\ifbeilstein@sectionnumbering%
   \setcounter{secnumdepth}{3}
   \ClassInfo{beilstein}{Section numbering turned on}
\else%
   \setcounter{secnumdepth}{-2}
   \ClassInfo{beilstein}{Section numbering turned off}
\fi%
\renewcommand\Large{\fontsize{16pt}{22pt}\selectfont}
\renewcommand\section{%
\@startsection{section}{1}{\z@}%
{-2ex}%
{1ex}%
{\normalfont\Large\bfseries}}
\renewcommand\subsection{%
\@startsection{subsection}{2}{\z@}%
  {-2ex}%
  {1ex}%
  {\normalfont\large\bfseries}}
\renewcommand\subsubsection{%
\@startsection{subsubsection}{3}{\z@}%
  {-2ex}%
  {1ex}%
  {\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{%
   \ClassError{beilstein}{The sectioning command \string\paragraph\space
   \MessageBreak is not supported by the beilstein class}{You can only use \string\section\space \string\subsection\space and \string\subsubsection}%
   \@gobble}
\renewcommand\subparagraph{
   \ClassError{beilstein}{The sectioning command \string\paragraph\space
   \MessageBreak is not supported by the beilstein class}{You can only use \string\section\space \string\subsection\space and \string\subsubsection}}
\RequirePackage[intlimits,sumlimits,namelimits,fleqn]{amsmath}
\setlength{\mathindent}{1.6cm}%
\RequirePackage{amssymb}
\DeclareFontFamily{U}{eur}{\skewchar\font'177}
\DeclareFontShape{U}{eur}{m}{n}{%
  <-6> eurm5 <6-8> eurm7 <8-> eurm10}{}
\DeclareFontShape{U}{eur}{b}{n}{%
  <-6> eurb5 <6-8> eurb7 <8-> eurb10}{}
\DeclareSymbolFont{ugrf@m}{U}{eur}{m}{n}
\SetSymbolFont{ugrf@m}{bold}{U}{eur}{b}{n}
\let\uppi\@undefined
\DeclareMathSymbol{\upalpha}{\mathord}{ugrf@m}{"0B}
\DeclareMathSymbol{\upbeta}{\mathord}{ugrf@m}{"0C}
\DeclareMathSymbol{\upgamma}{\mathord}{ugrf@m}{"0D}
\DeclareMathSymbol{\updelta}{\mathord}{ugrf@m}{"0E}
\DeclareMathSymbol{\upepsilon}{\mathord}{ugrf@m}{"0F}
\DeclareMathSymbol{\upzeta}{\mathord}{ugrf@m}{"10}
\DeclareMathSymbol{\upeta}{\mathord}{ugrf@m}{"11}
\DeclareMathSymbol{\uptheta}{\mathord}{ugrf@m}{"12}
\DeclareMathSymbol{\upiota}{\mathord}{ugrf@m}{"13}
\DeclareMathSymbol{\upkappa}{\mathord}{ugrf@m}{"14}
\DeclareMathSymbol{\uplambda}{\mathord}{ugrf@m}{"15}
\DeclareMathSymbol{\upmu}{\mathord}{ugrf@m}{"16}
\DeclareMathSymbol{\upnu}{\mathord}{ugrf@m}{"17}
\DeclareMathSymbol{\upxi}{\mathord}{ugrf@m}{"18}
\DeclareMathSymbol{\uppi}{\mathord}{ugrf@m}{"19}
\DeclareMathSymbol{\uprho}{\mathord}{ugrf@m}{"1A}
\DeclareMathSymbol{\upsigma}{\mathord}{ugrf@m}{"1B}
\DeclareMathSymbol{\uptau}{\mathord}{ugrf@m}{"1C}
\DeclareMathSymbol{\upupsilon}{\mathord}{ugrf@m}{"1D}
\DeclareMathSymbol{\upphi}{\mathord}{ugrf@m}{"1E}
\DeclareMathSymbol{\upchi}{\mathord}{ugrf@m}{"1F}
\DeclareMathSymbol{\uppsi}{\mathord}{ugrf@m}{"20}
\DeclareMathSymbol{\upomega}{\mathord}{ugrf@m}{"21}
\DeclareMathSymbol{\upvarepsilon}{\mathord}{ugrf@m}{"22}
\DeclareMathSymbol{\upvartheta}{\mathord}{ugrf@m}{"23}
\DeclareMathSymbol{\upvarpi}{\mathord}{ugrf@m}{"24}
\let\upvarrho\uprho
\let\upvarsigma\upsigma
\DeclareMathSymbol{\upvarphi}{\mathord}{ugrf@m}{"27}
\DeclareMathSymbol{\Upgamma}{\mathord}{ugrf@m}{"00}
\DeclareMathSymbol{\Updelta}{\mathord}{ugrf@m}{"01}
\DeclareMathSymbol{\Uptheta}{\mathord}{ugrf@m}{"02}
\DeclareMathSymbol{\Uplambda}{\mathord}{ugrf@m}{"03}
\DeclareMathSymbol{\Upxi}{\mathord}{ugrf@m}{"04}
\DeclareMathSymbol{\Uppi}{\mathord}{ugrf@m}{"05}
\DeclareMathSymbol{\Upsigma}{\mathord}{ugrf@m}{"06}
\DeclareMathSymbol{\Upupsilon}{\mathord}{ugrf@m}{"07}
\DeclareMathSymbol{\Upphi}{\mathord}{ugrf@m}{"08}
\DeclareMathSymbol{\Uppsi}{\mathord}{ugrf@m}{"09}
\DeclareMathSymbol{\Upomega}{\mathord}{ugrf@m}{"0A}
\RequirePackage{multicol}
\newcommand*\patchAmsMathEnvironmentForOnecolumn[1]{%
  \expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
  \expandafter\let\csname oldend#1\expandafter\endcsname\csname end#1\endcsname
  \renewenvironment{#1}%
     {\csname old#1\endcsname}%
     {\csname oldend#1\endcsname}}%
\newcommand*\patchBothAmsMathEnvironmentsForOnecolumn[1]{%
  \patchAmsMathEnvironmentForOnecolumn{#1}%
  \patchAmsMathEnvironmentForOnecolumn{#1*}}%
\def\testbx{bx}
\AtBeginDocument{%
   \@ifundefined{chem}{%
      \DeclareRobustCommand*{\chem}[1]{\ensuremath{%
         \ifx\testbx\f@series\mathbf{#1}\else\mathrm{#1}\fi}}}%
      {}
   \@ifundefined{unit}{%
      \DeclareRobustCommand*{\unit}[1]{%
         \ensuremath{\def\mu{\mbox{\textmu}}\def~{\,}%
         \unskip~%
         \ifx\testbx\f@series\mathbf{#1}\else\mathrm{#1}\fi}}}%
      {}
   \@ifundefined{degree}{%
      \newcommand*{\degree}{\ensuremath{{}^{\circ}}}}%
      {}
   \@ifundefined{celsius}{%
      \newcommand*{\celsius}{\degree\kern-\scriptspace C}}%
      {}
   \@ifundefined{angstrom}{%
      \newcommand*{\angstrom}{\AA}}%
      {}
   \@ifundefined{permil}{%
      \newcommand*{\permil}{\textperthousand}}%
      {}
   \@ifundefined{percent}{%
      \newcommand*{\percent}{\%}}%
      {}
}%
\AtBeginDocument{%
   \@ifpackageloaded{bpchem}{}{%
      \DeclareRobustCommand{\allowhyphens}{\penalty\@M \hskip\z@skip}
      \DeclareRobustCommand{\BreakHyph}{\penalty\@M -\allowhyphens}
      \DeclareRobustCommand{\MultiBreak}%
         {\penalty\@M\discretionary{-}{}{\kern.03em}%
          \allowhyphens}
      \DeclareRobustCommand{\DoIUPAC}[1]{%
         #1\endgroup}
      \def\Prep{%
         \let\-=\BreakHyph%
         \let\|=\MultiBreak%
         \DoIUPAC%
      }
      \DeclareRobustCommand*{\IUPAC}{%
         \begingroup\ignorespaces%
         \Prep}%
      \expandafter\DeclareRobustCommand\expandafter\|\expandafter{\|}
   }%
   \DeclareRobustCommand{\-}{%
      \discretionary{%
         \char \ifnum\hyphenchar\font<\z@
            \defaulthyphenchar
         \else
            \hyphenchar\font
         \fi%
      }{}{}%
   }%
}%
\newcommand{\fnpara}{\setboolean{beilstein@fnpara}{true}}
\newcommand{\fnnormal}{\setboolean{beilstein@fnpara}{false}}
\newskip\footglue
\newcommand{\testfnpara}{
   \ifbeilstein@fnpara%
      \renewcommand\@mpfootnotetext[1]{%
        \global\setbox\@mpfootins\vbox{%
          \unvbox\@mpfootins
          \reset@font\footnotesize
          \hsize\columnwidth
          \@parboxrestore
          \protected@edef\@currentlabel
               {\csname p@mpfootnote\endcsname\@thefnmark}%
          \color@begingroup
          \setbox0=\hbox{%
            \@makefntext{%
              \rule\z@\footnotesep\ignorespaces##1\@finalstrut\strutbox
              \penalty -10
              \hskip\footglue
            }%
          }%
          \dp0=0pt \ht0=\fudgefactor\wd0 \box0
          \color@endgroup}}
      \footglue=1em plus.3em minus.3em
      \def\endminipage{%
          \par
          \unskip
          \ifvoid\@mpfootins\else
            \vskip\skip\@mpfootins
            \normalcolor
            \footnoterule
            \mpmakefootnoteparagraph
          \fi
          \global\@minipagefalse %% added 24 May 89
        \color@endgroup
        \egroup
        \expandafter\@iiiparbox\@mpargs{\unvbox\@tempboxa}}
      \def\@makecol{%
         \ifvoid\footins
           \setbox\@outputbox\box\@cclv
         \else
           \setbox\@outputbox\vbox{%
             \boxmaxdepth \@maxdepth
             \unvbox \@cclv
             \vskip \skip\footins
             \color@begingroup
               \normalcolor
               \footnoterule
               \makefootnoteparagraph
             \color@endgroup
             }%
         \fi%
         \xdef\@freelist{\@freelist\@midlist}%
         \global\let\@midlist\@empty
         \@combinefloats
         \ifvbox\@kludgeins
           \@makespecialcolbox
         \else
           \setbox\@outputbox\vbox to\@colht{%
             \@texttop
             \dimen@ \dp\@outputbox
             \unvbox \@outputbox
             \vskip -\dimen@
             \@textbottom
             }%
         \fi%
         \global\maxdepth\@maxdepth
      }%
      {\catcode`p=12 \catcode`t=12 \gdef\@ennumber##1pt {##1} }
      {\footnotesize \newdimen\footnotebaselineskip
        \global
        \footnotebaselineskip=\normalbaselineskip}
      \dimen0=\footnotebaselineskip \multiply\dimen0 by 1024
      \divide \dimen0 by \columnwidth \multiply\dimen0 by 64
      \xdef\fudgefactor{\expandafter0.2441}%%\@ennumber\the\dimen0 }
      \def\makefootnoteparagraph{\unvbox\footins \makehboxofhboxes
        \setbox0=\hbox{\unhbox0 \removehboxes}
          \hsize\columnwidth
          \@parboxrestore
          \baselineskip=\footnotebaselineskip
          \noindent
        \rule{\z@}{\footnotesep}%
        \unhbox0\par}
      \def\mpmakefootnoteparagraph{\unvbox\@mpfootins \makehboxofhboxes
        \setbox0=\hbox{\unhbox0 \removehboxes}
          \hsize\columnwidth
          \@parboxrestore
          \baselineskip=\footnotebaselineskip
          \noindent
        \rule{\z@}{\footnotesep}%
        \unhbox0\par}
      \def\makehboxofhboxes{\setbox0=\hbox{}
        \loop\setbox2=\lastbox \ifhbox2 \setbox0=\hbox{\box2\unhbox0}\repeat}
      \def\removehboxes{\setbox0=\lastbox
        \ifhbox0{\removehboxes}\unhbox0 \fi}%
      \ClassInfo{beilstein}{Footnotes are set to paragraph mode.}
   \fi%
}%
\RequirePackage{float}
\let\belowcaptionskip\abovecaptionskip
\renewcommand\floatc@plain[2]{{\bfseries #1:} #2\par}
\floatstyle{plaintop}
\restylefloat{table}
\floatstyle{plain}
\restylefloat{figure}
\RequirePackage{flafter}
\renewcommand*{\fps@figure}{htb}
\renewcommand*{\fps@table}{htb}
\def\FloatBarrier{\par\begingroup \let\@elt\relax
 \edef\@tempa{\@botlist\@deferlist\@dbldeferlist}%
 \ifx\@tempa\@empty%
 \else
    \ifx\@fltovf\relax % my indicator of recursion
       \if@firstcolumn%
         \clearpage
       \else %
         \null\newpage\FloatBarrier
       \fi
    \else%
       \newpage \let\@fltovf\relax%
       \FloatBarrier % recurse once only
 \fi\fi \endgroup
 \suppressfloats[t]}
\newfloat{scheme}{htb}{los}
\floatname{scheme}{Scheme}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\newenvironment{sglcoltabular}[1]{\begin{tabular*}{8.2cm}{#1}}%
{\end{tabular*}}
\newenvironment{dblcoltabular}[1]{\begin{tabular*}{16.8cm}{#1}}%
{\end{tabular*}}
\newenvironment{sglcoltabularx}[1]{\tabularx{8.2cm}{#1}}{\endtabularx}
\newenvironment{dblcoltabularx}[1]{\tabularx{16.8cm}{#1}}{\endtabularx}
\newcommand{\sglcolfigure}[1]%
{\includegraphics[width=8.2cm,keepaspectratio]{#1}}
\newcommand{\dblcolfigure}[1]%
{\includegraphics[width=16.8cm,keepaspectratio]{#1}}
\newcommand{\sglcolscheme}[1]%
{\includegraphics[width=8.2cm,keepaspectratio]{#1}}
\newcommand{\dblcolscheme}[1]%
{\includegraphics[width=16.8cm,keepaspectratio]{#1}}
\RequirePackage{etoolbox}%
\AtEndPreamble{%
   \IfFileExists{cleveref.sty}{%
     \RequirePackage{cleveref}[2009/12/11]
   }{\ClassInfo{beilstein}{Package ``cleveref'' was not found and %
     \MessageBreak therefore has not been loaded.}}
   \@ifpackageloaded{cleveref}{%
    \crefname{figure}{Figure}{Figures}
    \crefname{table}{Table}{Tables}
    \crefname{scheme}{Scheme}{Schemes}
    \crefformat{scheme}{Scheme~#2#1#3}
    \Crefformat{scheme}{Scheme~#2#1#3}
    \crefname{suppinfo}{Supporting Information File}{Supporting
   Information Files}
   \crefformat{suppinfo}{Supporting Information File~#2#1#3}
    \Crefformat{suppinfo}{Supporting Information File~#2#1#3}
   }{\newcommand{\cref}[1]%
      {\ClassError{beilstein}{Macro \string\cref\space has not been
       defined\MessageBreak since the cleveref package could not be
       loaded}{Please install the package cleveref first}
      }%
   }%
}%
\RequirePackage[sort&compress,numbers]{natbib}
\renewcommand{\bibnumfmt}[1]{#1.\ }
\bibliographystyle{bjnano}
\def\NAT@spacechar{}%
\def\NAT@citexnum[#1][#2]#3{%
  \NAT@reset@parser
  \NAT@sort@cites{#3}%
  \NAT@reset@citea
  \@cite{\def\NAT@num{-1}\let\NAT@last@yr\relax\let\NAT@nm\@empty
    \@for\@citeb:=\NAT@cite@list\do
    {\@safe@activestrue
     \edef\@citeb{\expandafter\@firstofone\@citeb\@empty}%
     \@safe@activesfalse
     \@ifundefined{b@\@citeb\@extra@b@citeb}{%
       {\reset@font\bfseries?}
        \NAT@citeundefined\PackageWarning{natbib}%
       {Citation `\@citeb' on page \thepage \space undefined}}%
     {\let\NAT@last@num\NAT@num\let\NAT@last@nm\NAT@nm
      \NAT@parse{\@citeb}%
      \ifNAT@longnames\@ifundefined{bv@\@citeb\@extra@b@citeb}{%
        \let\NAT@name=\NAT@all@names
        \global\@namedef{bv@\@citeb\@extra@b@citeb}{}}{}%
      \fi
      \ifNAT@full\let\NAT@nm\NAT@all@names\else
        \let\NAT@nm\NAT@name\fi
      \ifNAT@swa
       \@ifnum{\NAT@ctype>\@ne}{%
        \@citea
        \NAT@hyper@{\@ifnum{\NAT@ctype=\tw@}{\NAT@test{\NAT@ctype}}{\NAT@alias}}%
       }{%
        \@ifnum{\NAT@cmprs>\z@}{%
         \NAT@ifcat@num\NAT@num
          {\let\NAT@nm=\NAT@num}%
          {\def\NAT@nm{-2}}%
         \NAT@ifcat@num\NAT@last@num
          {\@tempcnta=\NAT@last@num\relax}%
          {\@tempcnta\m@ne}%
         \@ifnum{\NAT@nm=\@tempcnta}{%
          \@ifnum{\NAT@merge>\@ne}{}{\NAT@last@yr@mbox}%
         }{%
           \advance\@tempcnta by\@ne
           \@ifnum{\NAT@nm=\@tempcnta}{%
             \ifx\NAT@last@yr\relax
               \def@NAT@last@yr{\@citea}%
             \else
               \def@NAT@last@yr{-\NAT@penalty}%
             \fi
           }{%
             \NAT@last@yr@mbox
           }%
         }%
        }{%
         \@tempswatrue
         \@ifnum{\NAT@merge>\@ne}{\@ifnum{\NAT@last@num=\NAT@num\relax}{\@tempswafalse}{}}{}%
         \if@tempswa\NAT@citea@mbox\fi
        }%
       }%
       \NAT@def@citea
      \else
        \ifcase\NAT@ctype
          \ifx\NAT@last@nm\NAT@nm \NAT@yrsep\NAT@penalty\NAT@space\else
            \@citea \NAT@test{\@ne}\NAT@spacechar\NAT@mbox{\NAT@super@kern\NAT@@open}%
          \fi
          \if*#1*\else#1\NAT@spacechar\fi
          \NAT@mbox{\NAT@hyper@{{\citenumfont{\NAT@num}}}}%
          \NAT@def@citea@box
        \or
          \NAT@hyper@citea@space{\NAT@test{\NAT@ctype}}%
        \or
          \NAT@hyper@citea@space{\NAT@test{\NAT@ctype}}%
        \or
          \NAT@hyper@citea@space\NAT@alias
        \fi
      \fi
     }%
    }%
      \@ifnum{\NAT@cmprs>\z@}{\NAT@last@yr}{}%
      \ifNAT@swa\else
        \@ifnum{\NAT@ctype=\z@}{%
          \if*#2*\else\NAT@cmt#2\fi
        }{}%
        \NAT@mbox{\NAT@@close}%
      \fi
  }{#1}{#2}%
}%
\newboolean{nobreakdashused}
\newcommand{\mynobreakdash}{%
   \ifthenelse{\boolean{nobreakdashused}}
      {}
      {\nobreakdash--%
       \setboolean{nobreakdashused}{true}%
      }}%
\RequirePackage{url}
\urlstyle{same}
\newcounter{c@totalcites}
\newcounter{c@floatcites}
\AtBeginDocument{\setcounter{c@floatcites}{\value{c@totalcites}}}
\def\floatcites{}
\let\ORIG@bibliography\bibliography
\renewcommand\bibliography{%
   \FloatBarrier%
   \@ifundefined{NAT@num}{\gdef\NAT@num{0}}{}%
   \ifx\NAT@num\@empty\gdef\NAT@num{0}\fi%
\immediate\write\@auxout{%
        \string\setcounter{\string c@totalcites}{\NAT@num}}%
\floatcites%
\setlength{\bibsep}{0pt}%
\ORIG@bibliography}
\renewenvironment{thebibliography}[1]
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
      \clubpenalty10000
      \@clubpenalty \clubpenalty
      \widowpenalty10000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\DeclareRobustCommand\authors{}
\def\authorsep{}
\DeclareRobustCommand\temp@author{}
\DeclareRobustCommand\temp@superscripts{}
\def\emails{}
\def\emailsep{}
\newcommand{\oneORnone}{1}
\newcommand{\firstoptarg}{}
\newcommand{\temp@firstoptarg}{}
\newcounter{c@author}
\newcounter{c@totauthor}
\newcounter{c@totalauthors}
\newboolean{corauth}
\setboolean{corauth}{false}
\newboolean{extraaffil}
\setboolean{extraaffil}{false}
\def\author{\@ifstar{\@ifnextchar[{\@@corauth}{\@corauth}}%
{\@ifnextchar[{\@@author}{\@author}}}
\def\@author#1{%
   \stepcounter{c@totalauthors}%
   \g@addto@macro\authors{%
    \ifnum\value{c@totauthor}>1%
     \unskip,\space%
    \fi%
    \temp@author\unskip\temp@superscripts\unskip%
    \stepcounter{c@totauthor}%
    \stepcounter{c@author}%
    \renewcommand{\temp@author}{%
      \upshape#1\unskip}%
   \renewcommand{\temp@superscripts}{\empty}%
   \setboolean{extraaffil}{false}%
   }%
}%
\def\@@author[#1]{%
   \stepcounter{c@totalauthors}%
   \g@addto@macro\authors{\renewcommand\temp@firstoptarg{#1}}%
   \@ifnextchar[{\@@@author}{\@@@@author}
}%
\def\@@@@author#1{%
    \stepcounter{c@totalauthors}%
    \g@addto@macro\authors{%
    \ifnum\value{c@totauthor}>1%
     \unskip,\space%
    \fi%
    \temp@author\unskip\temp@superscripts\unskip%
    \stepcounter{c@totauthor}%
    \let\firstoptarg\temp@firstoptarg
    \renewcommand{\temp@author}{%
        \ifthenelse{\equal{\firstoptarg}{1}}%
            {\upshape#1\unskip\textsuperscript{%
                \oneORnone}}%
            {\upshape#1\unskip\textsuperscript{%
                \firstoptarg}}\unskip%
    }%
    \renewcommand{\temp@superscripts}{\empty}%
    \setboolean{extraaffil}{true}
   }}%
\def\@@@author[#1]#2{%
   \stepcounter{c@totalauthors}%
    \g@addto@macro\authors{%
    \ifnum\value{c@totauthor}>1%
     \unskip,\space%
    \fi%
    \temp@author\unskip\temp@superscripts\unskip%
    \stepcounter{c@totauthor}%
    \let\firstoptarg\temp@firstoptarg
    \renewcommand{\temp@author}{%
        \ifthenelse{\equal{\firstoptarg}{1}}%
            {\upshape#2\unskip\textsuperscript{%
                \oneORnone}}%
            {\ifthenelse{\equal{\firstoptarg}{}}%
               {\upshape#2\unskip}%
               {\upshape#2\unskip\textsuperscript{%
                \firstoptarg}}\unskip}%
    }%
    \renewcommand{\temp@superscripts}{\empty}%
    \ifthenelse{\equal{\firstoptarg}{}}%
      {\setboolean{extraaffil}{false}}%
      {\setboolean{extraaffil}{true}}%
    \g@addto@macro\emails{\normalsize%
   \emailsep#2 - #1%
   \def\emailsep{;\space}}
   }%
}%
\def\@corauth#1#2{%
   \setboolean{corauth}{true}%
   \stepcounter{c@totalauthors}%
   \g@addto@macro\authors{\normalsize%
    \ifnum\value{c@totauthor}>1%
     \unskip,\space%
    \fi%
    \temp@author\unskip%
    \temp@superscripts\unskip%
    \stepcounter{c@totauthor}%
    \stepcounter{c@author}%
    \renewcommand{\temp@author}{%
     \upshape#1\unskip\textsuperscript{%
            $\ast$}\unskip%
        }%
        \renewcommand{\temp@superscripts}{\empty}%
        \setboolean{extraaffil}{false}%
   }%
\g@addto@macro\emails{\normalsize%
\emailsep#1 - #2%
\def\emailsep{;\space}}
}%
\def\@@corauth[#1]#2#3{
    \setboolean{corauth}{true}%
    \stepcounter{c@totalauthors}
    \g@addto@macro\authors{\normalsize%
    \ifnum\value{c@totauthor}>1%
     \unskip,\space%
    \fi%
    \temp@author\unskip\temp@superscripts\unskip%
    \stepcounter{c@totauthor}%
    \renewcommand{\temp@author}{%
      \ifthenelse{\equal{#1}{1}}%
        {\upshape#2\unskip\textsuperscript{%
            $\ast$\oneORnone}}%
        {\upshape#2\unskip\textsuperscript{%
            $\ast$#1}}%
    }%
    \renewcommand{\temp@superscripts}{\empty}%
    \setboolean{extraaffil}{true}%
}%
\g@addto@macro\emails{\normalsize%
   \emailsep#2 - #3%
   \def\emailsep{;\space}}%
}%
\def\affiliations{}
\newcounter{c@affiliation}
\newcounter{c@totaffiliation}
\newcounter{c@superscripts}
\newcommand\temp@affil{\par\vskip2ex Address:\space}
\newcommand\affiliation[2][]{
   \stepcounter{c@totaffiliation}
   \ifthenelse{\value{c@totaffiliation}>1}%
      {\renewcommand{\oneORnone}{1}}{}%
   \g@addto@macro\authors{%
      \ifthenelse{\equal{\temp@superscripts}{\empty}\AND\NOT\boolean{extraaffil}}{%
         \stepcounter{c@superscripts}%
         \renewcommand{\temp@superscripts}{\unskip%
            %\ifthenelse{\value{c@totaffiliation}>1}{}{}%
               {\textsuperscript{\arabic{c@superscripts}}\unskip}%
               %{\textsuperscript{\oneORnone}\unskip}%
         }
      }{\g@addto@macro\temp@superscripts{%
         \protect\stepcounter{c@superscripts}%
         \unskip\textsuperscript{,\,\arabic{c@superscripts}}\unskip}%
      }%
   }%
   \g@addto@macro\affiliations{%
    \ifnum\value{c@affiliation}>1%
     \unskip;\space%
    \fi%
    \temp@affil%
    \stepcounter{c@affiliation}%
    \renewcommand{\temp@affil}%
         {\ifthenelse{\value{c@affiliation}=1}%
            {\ifthenelse{\value{c@totauthor}=1}%
               {#2}%
               {\textsuperscript{\oneORnone}#2}}%
            {\ifthenelse{\value{c@totauthor}=1}%
               {#2}%
               {\textsuperscript{\arabic{c@affiliation}}#2}}%
         }%
   }%
}%
\ifthenelse{\equal{\beilstein@manuscript}{\beilstein@manuscript@suppinfo}}%
   {\long\def\maketitle{%
      \thispagestyle{empty}
      \begin{center}
         \Large\bfseries
         {Supporting Information}\\
         \textmd{for}\\
         \@title\par\vspace{\baselineskip}%
      \end{center}
      \normalsize
      \authors%
      \ifthenelse{\value{c@totauthor}>1}%
         {\unskip\space and\space\temp@author\temp@superscripts}%
         {\ifthenelse{\boolean{corauth}}%
            {\temp@author}%
            {\temp@author\textsuperscript{$\ast$}}%
         }%
      \par\vskip2ex%
      \ifthenelse{\boolean{corauth}}%
         {}%
         {\ifthenelse{\value{c@totauthor}>1}%
            {\ClassError{beilstein}{At least one corresponding author has to be given.\MessageBreak Please use \string\author*\space for that}%
               {Please use at least one \string\author* command to set information %
                  about the corresponding author.\MessageBreak Have a look at the %
                  documentation for more details}%
            }%
            {\ifthenelse{\equal{\emails}{}}%
               {\ClassError{beilstein}{The author has been made corresponding author.\MessageBreak Therefore please provide an email address for the author}%
                  {Use the second optional argument for that or use \string\author* instead}}{}%
            }%
         }%
      \ifthenelse{\value{c@totaffiliation}>1}%
         {\affiliations\unskip\space and\space\temp@affil}%
         {\affiliations\temp@affil}%
      \par\vskip3ex
      \normalsize Email:\space\emails\par\vskip2ex
      \textsuperscript{$\ast$}\space{\small Corresponding author}%
      \par\vfill%
      \begin{center}
         \Large\bfseries\@suppinfotitle%
      \end{center}
      \clearpage%
      }%
   }%
   {%
      \long\def\maketitle{%
         {\Large\bfseries\@title}\par\vskip2ex
         \normalsize
         \authors%
         \ifthenelse{\value{c@totauthor}>1}%
            {\unskip\space and\space\temp@author\temp@superscripts}%
            {\ifthenelse{\boolean{corauth}}%
               {\temp@author}%
               {\temp@author\textsuperscript{$\ast$}}%
            }%
         \par\vskip2ex%
         \ifthenelse{\boolean{corauth}}{}%
            {\ifthenelse{\value{c@totauthor}>1}%
               {\ClassError{beilstein}{At least one corresponding author has to be given.\MessageBreak Please use \string\author*\space for that}%
                  {Please use at least one \string\author* command to set information %
                     about the corresponding author.\MessageBreak Have a look at the %
                     documentation for more details}%
               }%
               {\ifthenelse{\equal{\emails}{}}%
                  {\ClassError{beilstein}{The author has been made corresponding author.\MessageBreak Therefore please provide an email address for the author}%
                  {Use the second optional argument for that or use \string\author* instead}}{}%
               }%
            }%
         \ifthenelse{\value{c@totaffiliation}>1}%
            {\affiliations\unskip\space and\space\temp@affil}%
            {\affiliations\temp@affil}%
         \par\vskip3ex
         \normalsize Email:\space\emails\par\vskip2ex
         \textsuperscript{$\ast$}\space{\small Corresponding author}%
         \par\vskip3ex
      }%
   }%
\newcommand{\@suppinfotitle}{}%
\newcommand{\sititle}[1]{\renewcommand{\@suppinfotitle}{#1}}%
\let\@RIGtitle\title
\newcommand{\@@title}[2][]{\sititle{#1}\@RIGtitle{#2}}%
\long\def\title{\@ifnextchar[{\@@title}{\@RIGtitle}}%
%%%\beilstein@type@check
\ifthenelse{\not\equal{\beilstein@manuscript}{\beilstein@manuscript@bookreport}%
   \and\not\equal{\beilstein@manuscript}{\beilstein@manuscript@suppinfo}}%
   {%
      \renewenvironment{abstract}{\textbf{\large\abstractname}\\[2ex]}{\\[2ex]}%
      \newcommand*{\background}{\textbf{Background:\ }}
      \newcommand*{\results}{\\\textbf{Results:\ }}
      \newcommand*{\conclusion}{\\\textbf{Conclusion:\ }}%
   }%
   {%
      \renewenvironment{abstract}{\ClassWarning{beilstein}{An abstract %
         should not be part of the chosen document type \beilstein@manuscript}}{}%
      \newcommand*{\background}{\relax}%
      \newcommand*{\results}{\relax}%
      \newcommand*{\conclusion}{\relax}%
   }%
\ifthenelse{\not\equal{\beilstein@manuscript}{\beilstein@manuscript@commentary}%
\and\not\equal{\beilstein@manuscript}{\beilstein@manuscript@bookreport}%
\and\not\equal{\beilstein@manuscript}{\beilstein@manuscript@suppinfo}}%
   {\newcommand{\keywords}[1]{\textbf{\large Keywords}\\*#1}}%
   {\newcommand{\keywords}[1]{%
         \ClassWarning{beilstein}{Keywords should not be part of the
            chosen document type \beilstein@manuscript}}}
\newenvironment{acknowledgements}{\par\textbf{\large Acknowledgements\\*}}{}
\newenvironment{suppinfo}%
   {\FloatBarrier%
    \par\vskip2ex%
    \textbf{\large Supporting Information\\*}}{}
\newcounter{suppinfo}
\newcommand{\sifile}[4][]{%
   \par
\refstepcounter{suppinfo}%
Supporting Information File \arabic{suppinfo}:\\*
File Name: \url{#2}\\
File Format: #3\\
Title: #4\\
\ifthenelse{\equal{#1}{}}{}{Description: #1}\vspace{1ex}}
\newcommand*{\CN}[1]{\textbf{#1}}
\renewcommand\@makefntext[1]%
    {\noindent\makebox[.5em][l]{\@makefnmark\,}#1}
\renewcommand{\footnoterule}{}
\let\ORIGfootnote\footnote
\newcommand{\errorfootnote}[2]{\ClassError{beilstein}{Footnotes are not
allowed throughout the document}%
{Avoid footnotes and give those information in the main text}}
\let\footnote\errorfootnote
\renewenvironment{table}%
   {\@nameuse{fst@table}%
    \@float@setevery{table}\@float{table}
    \testfnpara%
    \begin{minipage}{\linewidth}%
    \renewcommand\footnote[2][]{\protect\ORIGfootnote{##2}}}
   {\end{minipage}%
    \float@end%
    \gdef\footnote{\errorfootnote\@gobble}}
\let\ORIGlongtable\longtable
\let\ORIGendlongtable\endlongtable
\newcommand{\longtablefootnote}{}
\newcounter{myfootnote}
\newboolean{firstfootnote}
\renewcommand\longtable{%
   \renewcommand{\longtablefootnote}{}
   \setcounter{footnote}{0}
   \setcounter{myfootnote}{0}
   \setboolean{firstfootnote}{true}
   \renewcommand\thefootnote{\alph{footnote}}
   \renewcommand\themyfootnote{\alph{myfootnote}}
   \renewcommand\footnote[2][]{%
      \footnotemark%
      \g@addto@macro{\longtablefootnote}{%
         \stepcounter{myfootnote}
         \ifthenelse{\boolean{firstfootnote}}%
            {\setboolean{firstfootnote}{false}}%
            {\ifbeilstein@fnpara
               \quad
             \else
               \newline
             \fi
            }%
         \textsuperscript{\scriptsize\themyfootnote}%
         \footnotesize ##2\normalsize}}%
   \ORIGlongtable}
\renewcommand\endlongtable{%
   \ORIGendlongtable%
   \longtablefootnote
   \gdef\footnote{\errorfootnote\@gobble}}
\renewcommand{\thanks}[1]{\ClassError{beilstein}{\string\thanks\space %
   has been deactivated.\MessageBreak %
   Please use the commands of the beilstein class instead}%
   {The class defines commands to set the titlepage\MessageBreak %
   properly. Have a look at the documentation for more details}}
\renewcommand{\and}{\ClassError{beilstein}{\string\and\space has been deactivated.\MessageBreak %
   Please use the commands of the beilstein class instead}{The class %
   defines commands to set the titlepage\MessageBreak properly. Have a %
   look at the documentation for more details}}
\let\ORIGfigure\figure
\let\ORIGscheme\scheme
\let\ORIGtable\table
\renewcommand{\figure}{\par\ORIGfigure\par}
\renewcommand{\scheme}{\par\ORIGscheme\par}
\renewcommand{\table}{\par\ORIGtable\par}
\ifthenelse{\equal{\beilstein@manuscript}{\beilstein@manuscript@suppinfo}}%
   {%
      \renewcommand{\thepage}{S\arabic{page}}%
      \renewcommand{\thefigure}{S\arabic{figure}}%
      \renewcommand{\thetable}{S\arabic{table}}%
      \renewcommand{\thescheme}{S\arabic{scheme}}%
      \renewcommand{\theequation}{S\arabic{equation}}%
   }{}%
\reversemarginpar
\tolerance 1414
\hbadness 1414
\emergencystretch 1.5em
\hfuzz 0.3pt
\clubpenalty=5000
\widowpenalty=10000
\vfuzz \hfuzz
%% 
%% Originally developed by Martin Sievers (info@schoenerpublizieren.de)
%% Copyright (C) 2009-2018 by Beilstein-Institut for the Advancement of Chemical Sciences (Beilstein)
%% 
%% Part of this bundle is derived from cite.sty, to which the
%% following license applies:
%%   Copyright (C) 1989-2003 by Donald Arseneau
%%   These macros may be freely transmitted, reproduced, or
%%   modified provided that this notice is left intact.
%% 
%% It may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License (LPPL), either version 1.3c of
%% this license or (at your option) any later version.  The latest
%% version of this license is in the file:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% This work has the LPPL maintenancce status "author-maintained".
%% 
%% This work consists of the files beilstein.dtx,
%%                                 CHANGELOG.md,
%%                                 README.md
%%           and the derived files beilstein.pdf,
%%                                 beilstein.cls,
%%                                 beilstein.ins,
%%                                 bjnano.bst,
%%                                 beilstein-template.tex,
%%                                 beilstein-template.bib.
%%           Some graphic files for the documentation and template are also added:
%%                                 bjnano_logo.pdf
%%                                 scheme1.pdf
%%                                 scheme2.pdf
%%                                 figure1.pdf
%%
%% End of file `beilstein.cls'.
