%%
%% This is file `ulthese.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ulthese.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2012 Universite Laval
%% 
%% This file may be distributed and/or modified under the conditions
%% of the LaTeX Project Public License, either version 1.3c of this
%% license or (at your option) any later version. The latest version
%% of this license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2006/05/20 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Universite Laval
%% <ulthese-dev@bibl.ulaval.ca>.
%% 
%% This work consists of the files ulthese.dtx and ulthese.ins and the
%% derived files listed in the README file.
%% 
\NeedsTeXFormat{LaTeX2e}[2009/09/24]
\ProvidesClass{ulthese}%
  [2013/01/16 v2.1 Classe pour les theses et memoires de l'Universite Laval]
\RequirePackage{ifthen}
\newboolean{UL@natbib}
\setboolean{UL@natbib}{true}
\DeclareOption{nonatbib}{\setboolean{UL@natbib}{false}}
\newcommand*{\UL@ptsize}{}
\DeclareOption{10pt}{%
  \PassOptionsToClass{10pt}{memoir}
  \renewcommand*{\UL@ptsize}{10}}
\DeclareOption{11pt}{%
  \PassOptionsToClass{11pt}{memoir}
  \renewcommand*{\UL@ptsize}{11}}
\DeclareOption{12pt}{%
  \PassOptionsToClass{12pt}{memoir}
  \renewcommand*{\UL@ptsize}{12}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ExecuteOptions{11pt,letterpaper}
\ProcessOptions
\LoadClass[twoside,openright]{memoir}
\RequirePackage[T1]{fontenc}
\ifthenelse{\boolean{UL@natbib}}{\RequirePackage{natbib}}{}
\RequirePackage{babel}
\RequirePackage[autolanguage]{numprint}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{textcomp}
\definecolor{ULlinkcolor}{rgb}{0,0,0.3}
\setlrmarginsandblock{35mm}{25mm}{*}
\setulmarginsandblock{25mm}{25mm}{*}
\checkandfixthelayout[nearest]
\setlength{\footskip}{\lowermargin}
\addtolength{\footskip}{-10mm}
\OnehalfSpacing
\setlength{\parskip}{0.5\baselineskip}
\setlength{\parindent}{0em}
\renewcommand{\tocheadstart}{\SingleSpacing\chapterheadstart}
\renewcommand{\lotheadstart}{\SingleSpacing\chapterheadstart}
\renewcommand{\lofheadstart}{\SingleSpacing\chapterheadstart}
\makepagestyle{ul}
  \makeevenfoot{ul}{\thepage}{}{}
  \makeoddfoot{ul}{}{}{\thepage}
\aliaspagestyle{plain}{ul}
\pagestyle{ul}
\newcommand*{\UL@phvfamily}{\fontfamily{phv}\selectfont}
\ifnum\UL@ptsize=10\relax
  \newcommand*{\UL@fonttitle}{\normalfont\huge\bfseries\UL@phvfamily}
  \newcommand*{\UL@fontsubtitle}{\normalfont\LARGE\bfseries\UL@phvfamily}
  \newcommand*{\UL@fontauthor}{\normalfont\Large\bfseries\UL@phvfamily}
  \newcommand*{\UL@fontprogram}{\UL@fontauthor}
  \newcommand*{\UL@fontbase}{\normalfont\Large\UL@phvfamily}
\fi
\ifnum\UL@ptsize=11\relax
  \newcommand*{\UL@fonttitle}{\normalfont\LARGE\bfseries\UL@phvfamily}
  \newcommand*{\UL@fontsubtitle}{\normalfont\Large\bfseries\UL@phvfamily}
  \newcommand*{\UL@fontauthor}{\normalfont\large\bfseries\UL@phvfamily}
  \newcommand*{\UL@fontprogram}{\UL@fontauthor}
  \newcommand*{\UL@fontbase}{\normalfont\large\UL@phvfamily}
\fi
\ifnum\UL@ptsize=12\relax
  \newcommand*{\UL@fonttitle}{\normalfont\Large\bfseries\UL@phvfamily}
  \newcommand*{\UL@fontsubtitle}{\normalfont\large\bfseries\UL@phvfamily}
  \newcommand*{\UL@fontauthor}{\normalfont\normalsize\bfseries\UL@phvfamily}
  \newcommand*{\UL@fontprogram}{\UL@fontauthor}
  \newcommand*{\UL@fontbase}{\normalfont\normalsize\UL@phvfamily}
\fi
\newboolean{UL@hassubtitle}
\newboolean{UL@isprogmasc}
\newcommand{\UL@maintitle}{}
\newcommand{\UL@subtitle}{}
\newcommand*{\UL@author}{}
\newcommand*{\UL@program}{}
\newcommand*{\UL@year}{}
\newcommand*{\UL@typeofdoc}{}
\newcommand*{\UL@degree}{}
\newcommand*{\UL@nameother}{}
\newcommand*{\UL@degreeother}{}
\newcommand*{\UL@facUL}{}
\newcommand*{\UL@facother}{}
\newcommand*{\UL@extensionat}{}
\newcommand*{\UL@extensionloc}{}
\newcommand{\titre}[1]{\renewcommand{\UL@maintitle}{#1}}
\newcommand{\soustitre}[1]{%
  \setboolean{UL@hassubtitle}{true}
  \renewcommand{\UL@subtitle}{#1}}
\newcommand*{\auteur}[1]{\renewcommand*{\UL@author}{#1}}
\newcommand*{\annee}[1]{\renewcommand*{\UL@year}{#1}}
\newcommand*{\programme}[1]{\renewcommand*{\UL@program}{#1}}
\newcommand*{\LLD}{%
  \newcommand*{\UL@typenum}{0}
  \setboolean{UL@isprogmasc}{true}
  \renewcommand*{\UL@typeofdoc}{Th\`ese}
  \renewcommand*{\UL@degree}{Docteur en droit (L.L.D.)}}
\newcommand*{\DPsy}{%
  \newcommand*{\UL@typenum}{0}
  \setboolean{UL@isprogmasc}{true}
  \renewcommand*{\UL@typeofdoc}{Th\`ese}
  \renewcommand*{\UL@degree}{Docteur en psychologie (D.Psy.)}}
\newcommand*{\DThP}{%
  \newcommand*{\UL@typenum}{0}
  \setboolean{UL@isprogmasc}{true}
  \renewcommand*{\UL@typeofdoc}{Th\`ese}
  \renewcommand*{\UL@degree}{Docteur en th\'eologie pratique (D.Th.P.)}}
\newcommand*{\PhD}{%
  \newcommand*{\UL@typenum}{0}
  \setboolean{UL@isprogmasc}{true}
  \renewcommand*{\UL@typeofdoc}{Th\`ese}
  \renewcommand*{\UL@degree}{Philosophi{\ae} doctor (Ph.D.)}}
\newcommand*{\LLM}{%
  \newcommand*{\UL@typenum}{0}
  \setboolean{UL@isprogmasc}{false}
  \renewcommand*{\UL@typeofdoc}{M\'emoire}
  \renewcommand*{\UL@degree}{Ma\^itre en droit (L.L.M.)}}
\newcommand*{\MA}{%
  \newcommand*{\UL@typenum}{0}
  \setboolean{UL@isprogmasc}{false}
  \renewcommand*{\UL@typeofdoc}{M\'emoire}
  \renewcommand*{\UL@degree}{Ma\^itre \`es arts (M.A.)}}
\newcommand*{\MMus}{%
  \newcommand*{\UL@typenum}{0}
  \setboolean{UL@isprogmasc}{false}
  \renewcommand*{\UL@typeofdoc}{M\'emoire}
  \renewcommand*{\UL@degree}{Ma\^itre en musique (M.Mus.)}}
\newcommand*{\MSc}{%
  \newcommand*{\UL@typenum}{0}
  \setboolean{UL@isprogmasc}{false}
  \renewcommand*{\UL@typeofdoc}{M\'emoire}
  \renewcommand*{\UL@degree}{Ma\^itre \`es sciences (M.Sc.)}}
\newcommand*{\MServSoc}{%
  \newcommand*{\UL@typenum}{0}
  \setboolean{UL@isprogmasc}{false}
  \renewcommand*{\UL@typeofdoc}{M\'emoire}
  \renewcommand*{\UL@degree}{Ma\^itre en service social (M.Serv.Soc.)}}
\newcommand*{\MScGeogr}{%
  \newcommand*{\UL@typenum}{0}
  \setboolean{UL@isprogmasc}{false}
  \renewcommand*{\UL@typeofdoc}{M\'emoire}
  \renewcommand*{\UL@degree}{Ma\^itre en sciences géographiques (M.Sc.G\'eogr.)}}
\newcommand*{\MATDR}{%
  \newcommand*{\UL@typenum}{0}
  \setboolean{UL@isprogmasc}{false}
  \renewcommand*{\UL@typeofdoc}{M\'emoire}
  \renewcommand*{\UL@degree}{Ma\^itre en am\'enagement du territoire et d\'eveloppement r\'egional (M.ATDR)}}
\newcommand*{\multifacultaire}{\renewcommand*{\UL@typenum}{1}}
\newcommand*{\cotutelle}{%
  \renewcommand*{\UL@typenum}{2}
  \edef\UL@typeofdoc{\UL@typeofdoc\ en cotutelle}}
\newcommand*{\univcotutelle}[1]{\renewcommand*{\UL@nameother}{#1}}
\newcommand*{\gradecotutelle}[1]{\renewcommand*{\UL@degreeother}{#1}}
\newcommand*{\extensionUdeS}{%
  \renewcommand*{\UL@typenum}{3}
  \renewcommand*{\UL@extensionat}{Universit\'e de Sherbrooke}
  \renewcommand*{\UL@extensionloc}{Sherbrooke, Qu\'ebec}}
\newcommand*{\extensionUQO}{%
  \renewcommand*{\UL@typenum}{3}
  \renewcommand*{\UL@extensionat}{Universit\'e du Qu\'ebec en Outaouais}
  \renewcommand*{\UL@extensionloc}{Gatineau, Qu\'ebec}}
\newcommand*{\extensionUQAC}{%
  \renewcommand*{\UL@typenum}{3}
  \renewcommand*{\UL@extensionat}{Universit\'e du Qu\'ebec \`a Chicoutimi}
  \renewcommand*{\UL@extensionloc}{Chicoutimi, Qu\'ebec}}
\newcommand{\faculteUL}[1]{\renewcommand*{\UL@facUL}{#1}}
\newcommand*{\faculteUdeS}[1]{\renewcommand*{\UL@facother}{#1}}
\newcommand*{\faculteUQO}[1]{\renewcommand*{\UL@facother}{#1}}
\newcommand*{\faculteUQAC}[1]{\renewcommand*{\UL@facother}{#1}}
\newsavebox{\UL@titlebox}
\newsavebox{\UL@subtitlebox}
\newlength{\UL@titleboxtotht}
\newlength{\UL@subtitleboxtotht}
\newcommand{\UL@measuretitle}{%
  \setbox\UL@titlebox=\vbox{%
    \centering\UL@fonttitle\UL@maintitle}
  \setlength{\UL@titleboxtotht}{%
    \dimexpr\ht\UL@titlebox+\dp\UL@titlebox}
  \ifthenelse{\boolean{UL@hassubtitle}}{%
    \setbox\UL@subtitlebox=\vbox{%
      \centering\vspace*{0.5\baselineskip}\UL@fontsubtitle\UL@subtitle}
    \setlength{\UL@subtitleboxtotht}{%
      \dimexpr\ht\UL@subtitlebox+\dp\UL@subtitlebox}}{}}
\newcommand{\UL@docid}{%
  {\UL@fontprogram\UL@typeofdoc\par
  \ifnum\UL@typenum=2 \UL@program\par \fi}}
\newcommand{\UL@details}{%
  \ifcase\UL@typenum\relax% 0 standard
    \vspace{96pt}
    {\UL@fontprogram\UL@program}\par
    \UL@degree\par
    \vspace{112pt}
    Qu\'ebec, Canada\par
  \or%                      1 multifacultaire
    \vspace{96pt}
    {\UL@fontprogram\UL@program}\par
    \UL@degree\par
    \vspace{36pt}
    \UL@facUL\par
    \vspace{48pt}
    Qu\'ebec, Canada\par
  \or%                      2 cotutelle
    \vspace{72pt}
    Universit\'e Laval\par Qu\'ebec, Canada\par
    \UL@degree\par
    \vspace{\baselineskip} et\par \vspace{\baselineskip}
    \UL@nameother\par
    \UL@degreeother\par
  \or%                      3 extension
    \vspace{48pt}
    {\UL@fontprogram\UL@program\ de l'Universit\'e Laval\par
      \ifthenelse{\boolean{UL@isprogmasc}}{offert}{offerte}
      en extension \`a l'\UL@extensionat}\par
    \vspace{36pt}
    \UL@degree\par
    \vspace{36pt}
    \UL@facother\par \UL@extensionat\par \UL@extensionloc\par
    \vspace{\baselineskip}
    \UL@facUL\par Universit\'e Laval\par Qu\'ebec, Canada\par
  \fi}
\newlength{\UL@docidspacing}
\setlength{\UL@docidspacing}{82pt}
\newlength{\UL@authorspacing}
\setlength{\UL@authorspacing}{72pt}
\newcommand{\pagetitre}{{%
    \clearpage
    \thispagestyle{empty}
    \SingleSpacing\setlength{\parskip}{0pt}
    \centering
    \UL@fontbase
    \UL@measuretitle
    \addtolength{\UL@docidspacing}{-\UL@titleboxtotht}
    \addtolength{\UL@docidspacing}{-\UL@subtitleboxtotht}
    \ifdim\UL@docidspacing<\baselineskip\relax
      \setlength{\UL@docidspacing}{\baselineskip}
      \addtolength{\UL@authorspacing}{-\baselineskip}
    \fi
    \ifnum\UL@typenum>1\relax
      \vspace*{0pt}\par
    \else
      \includegraphics[height=40px,keepaspectratio=true]{ul_p}\par
    \fi
    \vspace{82pt}
    \box\UL@titlebox
    \box\UL@subtitlebox
    \vspace{\UL@docidspacing}
    \UL@docid
    \vspace{\UL@authorspacing}
    {\UL@fontauthor\UL@author}\par
    \UL@details
    \vfill
    {\textcopyright} \UL@author, \UL@year\par
    \cleardoublepage}}
\addto\captionsfrench{\renewcommand{\listfigurename}{Liste des figures}}
\newcommand{\dedicace}[1]{{%
    \clearpage
    \pagestyle{empty}
    \setlength{\beforeepigraphskip}{10\baselineskip}
    \setlength{\epigraphrule}{0pt}
    \epigraphtextposition{flushright}
    \mbox{}\epigraph{\itshape #1}{}}}
\newcommand{\epigraphe}[2]{{%
    \clearpage
    \pagestyle{empty}
    \setlength{\beforeepigraphskip}{10\baselineskip}
    \mbox{}\epigraph{#1}{#2}}}
\renewenvironment{quote}{%
  \list{}{\rightmargin 10mm \leftmargin 10mm}%
  \item[]}{\endlist}
\renewenvironment{quotation}{%
  \list{}{%
    \SingleSpacing
    \listparindent 0em
    \itemindent    \listparindent
    \leftmargin    10mm
    \rightmargin   \leftmargin
    \parsep        6\p@ \@plus\p@}%
  \item[]}{\endlist}
\setsecnumdepth{subsection}
\endinput
%%
%% End of file `ulthese.cls'.
