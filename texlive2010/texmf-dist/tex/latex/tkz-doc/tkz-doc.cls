% $Id: tkz-doc.cls  2009-02-22 12h22 alain matthes $
% Copyright (C) 2009 Alain Matthes  
%
% This file may be distributed and/or modified
%
% 1. under the LaTeX Project Public License , either version 1.3
% of this license or (at your option) any later version and/or
% 2. under the GNU Public License.
%
% See the file doc/generic/pgf/licenses/LICENSE for more details.%
% See http://www.latex-project.org/lppl.txt for details.
%
%
% ``tkz-doc'' class for use with the tkz documentation ( AlterMundus Collection ).
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                               %
%     tkz-doc.cls       encodage : utf8                         %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                               %
%           Créé par Alain Matthes le 2009-02-22.               %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Objet :  Classe LaTeX  et Styles pour créer des documentations.
%<----------------------------------------------------------------------------->
%<---------------- Définitions relatives au package --------------------------->
\newcommand*{\PackageName}{tkz-doc}
\newcommand*{\PackageVersion}{0.3 beta}
\newcommand*{\filedate}{2009/02/20}
%<------------------------ Identification Part -------------------------------->
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{\PackageName}%
[\filedate\space Version:\space\PackageVersion\space tkz  documentation class]
%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax
\LoadClass[titlepage,oneside]{scrartcl}
\PassOptionsToPackage{dvipsnames}{xcolor}
\RequirePackage{etex}
\RequirePackage[utf8]{inputenc}
\RequirePackage{xkeyval}[2005/11/25] 
\RequirePackage{framed,eso-pic}
\RequirePackage{amsmath,amssymb}
\RequirePackage{textcomp}
\RequirePackage[upright]{fourier}
\RequirePackage[scaled=0.85]{berasans}
\RequirePackage[scaled=0.85]{beramono}
\RequirePackage[bottom,stable,ragged]{footmisc}
\RequirePackage[automark,nouppercase]{scrpage2}
\pagestyle{scrheadings} 
\clearscrheadings
\clearscrplain
\ohead{\textcolor{Peach}{\pagemark}}
\ihead{\textcolor{Peach}{\headmark}}
\rofoot{\textcolor{Peach}{AlterMundus}} 
\lofoot{\textcolor{Peach}{tkz-tab.sty}}
\automark[subsection]{section}
\setheadsepline{.4pt}[\color{Peach}]
\setfootsepline{.4pt}[\color{Peach}]
\setheadwidth[0pt]{text}
\setfootwidth[0pt]{text}
\renewcommand{\footnoterule}{\vspace*{-3pt}{%
   \color{Peach}\hrule width 2in height 0.4pt}
   \vspace*{2.6pt}}
\deffootnote{1.5em}{1em}{\makebox[1.5em][l]{%
   \thefootnotemark}}
\addtolength{\skip\footins}{\baselineskip}%
%<--------------------–  En-tête et pied de page ------------------------------>
\pagenumbering{arabic}
\newcommand\SectionFontStyle{\sffamily}
\setkomafont{sectioning}{\bfseries\SectionFontStyle}
\setkomafont{pagenumber}{\bfseries\SectionFontStyle}
\setkomafont{pagehead}{\small\sffamily}
\setkomafont{pagefoot}{\small\sffamily}
\setkomafont{descriptionlabel}{\itshape}
\addtokomafont{sectioning}{\color{sectioncolor}}
\renewcommand*{\raggedsection}{\raggedright}
%<----------------------------------------------------------------------------->
\newcounter{cnt}\setcounter{cnt}{1}
\setcounter{secnumdepth}{3}%
\setcounter{tocdepth}{3}
%<--------------------  Éxécution et chargement ------------------------------->
% --------------------–Fin    Taille des fontes ------------------------------->
\RequirePackage{makeidx}
\makeindex
\RequirePackage{calc}
\RequirePackage{tikz}
% We need lots of libraries...
\usetikzlibrary{%
  arrows,%
  calc,%
  fit,%
  patterns,%
  plotmarks,%
  shapes.geometric,%
  shapes.misc,%
  shapes.symbols,%
  shapes.arrows,%
  shapes.callouts,%
  shapes.multipart,%
  automata,%
  backgrounds,%
  chains,%
  topaths,%
  trees,%
  petri,%
  matrix,%
  calendar,%
  folding,%
  fadings,%
  through,%
  positioning,%
  scopes,%
  decorations.fractals,%
  decorations.shapes,%
  decorations.text,%
  decorations.pathmorphing,%
  decorations.pathreplacing,%
  decorations.footprints,%
  decorations.markings,%
  shadows}
\usetikzlibrary{snakes}
\RequirePackage{multido}
\RequirePackage{lscape}
\RequirePackage{graphicx}
\RequirePackage{amsmath, amssymb}
\RequirePackage{array}
\RequirePackage{multicol}
\RequirePackage{multirow} 
\RequirePackage{tabularx,ragged2e}
\RequirePackage{booktabs}
\RequirePackage[bottom,stable,ragged]{footmisc}
\RequirePackage{tkzexample}
\raggedbottom 
\definecolor{sectioncolor}{RGB}{0, 0, 0}
\definecolor{textcolor}{RGB}{0, 0, 0}
\definecolor{shadecolor}{gray}{0.90}
\colorlet{pdflinkcolor}{Peach}
\colorlet{pdfurlcolor}{Peach}
\colorlet{pdffilecolor}{Peach}
\colorlet{stringcolor}{green!40!black!100}
\colorlet{commencolor}{blue!0!black!100}
\RequirePackage[pdftex,%
                colorlinks=true,%
                urlcolor=pdfurlcolor,%
                filecolor=pdffilecolor,%
                linkcolor=pdflinkcolor,%
                breaklinks,%
                linktocpage=true]{hyperref}
\RequirePackage{url}
\def\UrlFont{\small\ttfamily}
%<----------------------------------------------------------------------------->
\newcommand*{\Imacro}[1]{\index{#1_1@\texttt{\textbackslash#1}}}
\newcommand*{\IEnv}[1]{\index{#1_1@\texttt{Environnement #1}}}
\newcommand*{\Iarg}[2]{\index{#1_2@\texttt{\textbackslash#1: arguments}!\texttt{#2}}}
\newcommand*{\IargName}[2]{\tkzname{#2}\index{#1_2@\texttt{\textbackslash#1: arguments}!\texttt{#2}}}
\newcommand*{\IoptName}[2]{\tkzname{#2}\index{#1_3@\texttt{\textbackslash#1: options}!\texttt{#2}}}
\newcommand*{\Iopt}[2]{\index{#1_3@\texttt{\textbackslash#1: options}!\texttt{#2}}}
\newcommand*{\Istyle}[2]{\index{#1_3@\texttt{\textbackslash#1: styles}!\texttt{#2}}}
\newcommand*{\Iaccent}[2]{\index{#1@\texttt{#2}}}
\newcommand*{\addbs}[1]{\texttt{\textbackslash#1}}
\newcommand*{\NameLib}[1]{\index{Ti\emph{k}Z Library !#1@\texttt{#1}}}
\newcommand*{\NameSys}[1]{\index{Système d'exploitation !#1@\texttt{#1}}}
\newcommand*{\NameDist}[1]{\index{Distributions TeX !#1@\texttt{#1}}}
\newcommand*{\NameFonct}[1]{\index{Fonctions !#1@\texttt{#1}}} 
\newcommand*{\NamePack}[1]{\index{Package !#1@\texttt{#1}}}  
%<----------------------------------------------------------------------------->
%<----------------------------------------------------------------------------->

%<------------------------------------  Couverture ---------------------------->
%<------------------------------------  Make Title ---------------------------->
\renewcommand\maketitle{%

\null
\AddToShipoutPicture*{%
\setlength\unitlength{1mm}
\put(0,0){\makebox(0,0)[lb]{\color{Peach!10}\rule{\paperwidth}{\paperheight}}}
\put(0,0){\makebox(0,0)[lb]{\color{Mahogany}\rule{40mm}{\paperheight}}}
\put(22,200){\rotatebox{90}{% 
\makebox(0,0)[r]{\fontsize{60}{60}\color{orange!50!white}%
\bfseries \selectfont{\@title\ \versionofpack}}}}%
\put(2,230){%
        \begin{tikzpicture}
         \draw (0,0)  node[circle,
                           shade,%
                           ball color=orange!50!white,
                           minimum size = 2 cm]{};
         \draw[snake      = expanding waves,%
               color      = orange!50!white,%
               line width = 3pt](0,-1.2)--(0,-4);
        \end{tikzpicture}}
    \put(60,80){%
    \begin{pgfpicture} 
\pgfmathdeclarerandomlist{color}{{Peach}{Orange}{Red}{Brown}} 
\foreach \a in {1,...,5}{% 
  \pgfmathrandominteger{\x}{1}{300} 
  \pgfmathrandominteger{\y}{1}{200} 
  \pgfmathrandominteger{\r}{20}{100} 
  \pgfmathrandominteger{\s}{5}{95} 
  \pgfmathrandominteger{\o}{50}{80}
  \pgfmathrandomitem{\c}{color} 
  \pgfdeclareradialshading{ballshading}{\pgfpoint{-10bp}{10bp}} 
  {color(0bp)=(\c!15!white); color(9bp)=(\c!75!white); 
   color(18bp)=(\c!70!black); color(25bp)=(\c!50!black); color(50bp)=(black)}
  \pgfsetfillopacity{\o/100} 
  \pgfpathcircle{\pgfpoint{+\x pt}{+\y pt}}{+\r pt} 
  \pgfshadepath{ballshading}{\s} 
  \pgfusepath{}
}%
\end{pgfpicture}}
\put(80,250){\makebox(0,0)[l]{%
\skuggadtext{Mahogany}{Peach!30}{\fontsize{50}{60}\selectfont{AlterMundus}}}}%
\put(130,40){\makebox(0,0)[l]{%
\fontsize{17}{21}
\textcolor{Mahogany}{\selectfont{\authorofpack}}}} 
\put(130,30){\makebox(0,0)[l]{%
\textcolor{Mahogany}{\url{http://altermundus.com}}}}}
%<------------------------------- End   Couverture ---------------------------->
\setcounter{footnote}{0}%
}
%<------------------------------- def macro arg opt---------------------------->

\def\cmd#1{\cs{\expandafter\cmd@to@cs\string#1}}
\def\cmd@to@cs#1#2{\char\number`#2\relax}
\DeclareRobustCommand\cs[1]{\texttt{\char`\\#1}}
\providecommand\marg[1]{{\ttfamily\char`\{}\meta{#1}{\ttfamily\char`\}}}
\providecommand\oarg[1]{{\ttfamily[}\meta{#1}{\ttfamily]}}
\providecommand\parg[1]{{\ttfamily(}\meta{#1}{\ttfamily)}}

\newcommand\opt[1]{{\color{black!50!green}#1}}
\newcommand\ooarg[1]{{\ttfamily[}\meta{#1}{\ttfamily]}}  

\DeclareRobustCommand\meta[1]{%
     \ensuremath\langle
     \ifmmode \expandafter \nfss@text \fi
     {%
      \meta@font@select
      \edef\meta@hyphen@restore
        {\hyphenchar\the\font\the\hyphenchar\font}%
      \hyphenchar\font\m@ne
      \language\l@nohyphenation
      #1\/%
      \meta@hyphen@restore
     }\ensuremath\rangle
}
\def\meta@font@select{\itshape}
%
%<----------------------------- NewMacroBox ----------------------------------->
\colorlet{titlecolorbox}{Peach!50}

\newenvironment{NewMacroBox}[2]{%
\def\FrameCommand{\color{black}
{\vrule width 1pt\hspace{3pt}}%
}%
\MakeFramed{\advance\hsize-\width}%
\noindent
\makebox[0pt][l]{%
\hspace{-4pt}%
\setlength{\fboxrule}{1pt}%
\setlength{\fboxsep}{3pt}%
\fcolorbox{black}{titlecolorbox}{%
\rule{6pt}{0pt}%
\makebox[\width+6pt][l]{\tkzcname{#1#2}}%
}%
}\\*[.5\baselineskip]%
\noindent
% \ignorespaces\tkzcname{#1#3}
\Imacro{#1}
\color{black}}{%
\par\noindent%
\makebox[0pt][l]{

\hspace{-6pt}%
\rule{6pt}{1pt}%
\rule{\textwidth}{1pt}%

\hspace{-1pt}%
\rule{1pt}{10pt}%
}%
\endMakeFramed
\noindent
\ignorespacesafterend
\par\medskip
}
%<------------------------- end NewMacroBox ----------------------------------------->
%<----------------------------- NewEnvBox ----------------------------------->
\colorlet{titlecolorbox}{Peach!50}

\newenvironment{NewEnvBox}[1]{%
\gdef\tkzEnvMacro{#1}
\def\FrameCommand{\color{black}
{\vrule width 1pt\hspace{3pt}}%
}%
\MakeFramed{\advance\hsize-\width}%
\noindent
\makebox[0pt][l]{%
\hspace{-4pt}%
\setlength{\fboxrule}{1pt}%
\setlength{\fboxsep}{3pt}%
\fcolorbox{black}{titlecolorbox}{%
\rule{6pt}{0pt}%
\makebox[\width+6pt][l]{%
 \tkzcname{\textcolor{black}{begin}\{\tkzEnvMacro\}}{\oarg{options}}%
 \hspace*{.25cm}\meta{environment contents}\hspace*{.25cm}%
 \tkzcname{\textcolor{black}{end}\{\tkzEnvMacro\}}}%
}%
}\\*[.5\baselineskip]%
\noindent
% \ignorespaces\tkzcname{#1#3}
\IEnv{#1}
\color{black}}{%
\par\noindent%
\makebox[0pt][l]{

\hspace{-6pt}%
\rule{6pt}{1pt}%
\rule{\textwidth}{1pt}%

\hspace{-1pt}%
\rule{1pt}{10pt}%
}%
\endMakeFramed
\noindent
\ignorespacesafterend
\par\medskip
}
%<------------------------- end NewEnvBox ----------------------------------------->
\def\nameoffile#1{\gdef\@nameoffile{#1}}
\def\@nameoffile{\@latex@warning@no@line{No \noexpand\nameoffile given}}
\long\def\defoffile#1{
    \protected@xdef\@defoffile{\@defoffile{#1}}%
}
\let\@defoffile\@empty
\def\nameoffile#1{\gdef\@nameoffile{#1}}
\def\@nameoffile{\@latex@warning@no@line{No \noexpand\nameoffile given}}
\long\def\defoffile#1{\protected@xdef\@defoffile{\@defoffile{#1}}%
}
\let\@defoffile\@empty

\newcommand*{\red}{\color{BrickRed}}
\newcommand*{\blue}{\color{BlueViolet}}
\newcommand*{\BS}{\texttt{\char92}}
\newcommand*{\tkz}{Ti{\em k}Z}
\newcommand*{\orange}{\color{Orange}}
\newcommand*{\blanc}{\color{White}}
\newcommand*{\PGF}{\tkzname{PGF}}      
\newcommand*{\TIKZ}{\tkzname{Ti\emph{k}Z}} 
\newcommand*{\beamer}{\textsc{beamer}}
\newcommand*{\pdf}{\textsc{pdf}}
\newcommand*{\pgfname}{\textsc{pgf}}
\newcommand*{\tikzname}{Ti\emph{k}Z}
\newcommand*{\pstricks}{\textsc{pstricks}}
\newcommand*{\var}[1]{\{\meta{#1}\}}
\newcommand*{\varp}[1]{(\meta{#1})}
\newcommand*{\vara}[1]{\{#1\}}
\providecommand\LaTeX{%
  L\kern-.36em\raise.3ex\hbox{\sc a}\kern-.15em\TeX}
\providecommand\LATEX{\LaTeX}  
\renewcommand\TeX{T\kern-.1667em\lower.5ex\hbox{E}\kern-.125emX%
  \spacefactor1000 }
%<----------------------------- presentation ---------------------------------->
\providecommand\href[2]{\texttt{#1}}

\newcommand\presentation{%
  \thispagestyle{empty}%
  \noindent
  \begin{tikzpicture}
     \draw (0,0)  node[circle,
                       shade,
                       ball color=Peach,minimum size=2cm]{};
     \draw[snake      = expanding waves,%
           color      = Peach,%
           line width = 3pt](1.2,0)--(4,0);
    \end{tikzpicture}\par\vspace{1 cm}
    \noindent
  \newlength{\@lx}\settowidth{\@lx}{\huge AlterMundus}%
  \advance\@lx3em\quad
  \href{http://www.altermundus.com/}{%
    \rotatebox{90}{\hspace*{1.5em}{\huge AlterMundus}}}
  \textcolor{Mahogany}{\rule{2pt}{\@lx}}\quad%
  \begin{minipage}[b]{.90\textwidth}
    {%
    \noindent\hfill
     \raggedleft\Large
     \href{mailto:al.ma@mac.com}{\textcolor{blue}{Alain Matthes}}\par
     \@nameoffile\medskip\par%
     }%
     \emph{\@defoffile}\par
    [\nameofdoc\ \dateofdoc]\par\medskip
  \end{minipage}
}
%<------------------------ end  presentation ---------------------------------->

\newcommand*{\tkzname}[1]{\texttt{#1}}
\newcommand*{\tkzimp}[1]{\textbf{#1}}
\newcommand*{\tkzcname}[1]{\texttt{\textbackslash#1}}   


\definecolor{skugga}{gray}{0.7} 
\newlength{\skuggsep} 
\setlength{\skuggsep}{3pt} 
\newcommand{\skuggadtext}[3]{% 
\makebox[0pt][l]{% 
\rule{\skuggsep}{0pt}% 
\raisebox{-\skuggsep}{\textcolor{#2}{#3}}% 
}% 
\textcolor{#1}{#3}% 
}

%<----------------------------------------------------------------------------->
\endinput
%<----------------------------------------------------------------------------->
% utf8
% pdflatex

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                                                               %
    %          End of file `tkz-doc.cls'.                           %
    %                                                               %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
