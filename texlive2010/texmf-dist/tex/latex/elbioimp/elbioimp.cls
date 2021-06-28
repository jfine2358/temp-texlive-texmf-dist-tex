%%
%% This is file `elbioimp.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% elbioimp.dtx  (with options: `class')
%% This is a generated file.
%% 
%% Copyright (C) 2010 by Dag Langmyhr
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, see
%% http://www.latex-project.org/lppl.txt
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{elbioimp}
    [2010/02/08 v1.0 Document class for Journal of Electrical Bioimpedance]
\DeclareOption*{\ClassWarningNoLine
  {elbioimp}{Class option \CurrentOption
    \space is illegal in this document class}}
\ProcessOptions \relax
\LoadClass[twocolumn]{article}
\RequirePackage{ifthen}
\RequirePackage[T1]{url}
\urlstyle{sf}
\AtBeginDocument{\renewcommand{\maketitle}{%
  \twocolumn[\begin{minipage}{\textwidth}
    \renewcommand{\and}{, }
    \let \thanks = \footnote
    \renewcommand{\footnoterule}{}
    \def \@makefntext ##1{\noindent
      \small \@thefnmark. \it ##1}
    \renewcommand{\thempfootnote}%
      {\arabic{mpfootnote}}
    \parindent = 0pt
    {\huge \@title}\par\vspace{16pt}
    {\large \@author}
  \end{minipage}\par\vspace{14pt}\noindent
  \elb@rule{\textwidth}\vspace{11pt}]}}
\newcommand{\elb@rule}[1]{\rule{#1}{0.6pt}}
\newcommand{\keywords}[1]{\def\elb@keywords{#1}}
\renewenvironment{abstract}
  {\small\noindent
    \textbf{\abstractname}\par\vspace{1pt}
    \noindent\ignorespaces}
  {\par
   \@ifundefined{elb@keywords}{}{%
     \vspace{\baselineskip}\noindent
     \textbf{Keywords:} \elb@keywords\par}
   \vspace{\baselineskip}\noindent
   \elb@rule{\columnwidth}}
\RequirePackage[a4paper,
  margin=1.5cm,top=2.5cm]{geometry}
\setlength{\columnsep}{1cm}
\pretolerance = 1000
\tolerance = 2000   \hbadness = \tolerance
\AtBeginDocument{\pagestyle{empty}}
\RequirePackage{mathptmx}
\renewcommand{\Huge}{\@setfontsize%
  \Huge {20}{22}}
\renewcommand{\huge}{\@setfontsize
  \huge {16}{17.6}}
\renewcommand{\LARGE}{\@setfontsize
  \LARGE {14}{15.4}}
\renewcommand{\Large}{\@setfontsize
  \Large {12}{13.2}}
\renewcommand{\large}{\@setfontsize
  \large {11}{12.1}}
\renewcommand{\normalsize}{%
   \@setfontsize \normalsize {10}{11}
   \abovedisplayskip =
     10pt plus 2pt minus 5pt
   \abovedisplayshortskip =
     0pt plus 3pt
   \belowdisplayshortskip =
     6pt plus 3pt minus 3pt
   \belowdisplayskip = \abovedisplayskip
   \def\@listi{\leftmargin = \leftmargini
     \topsep = 5pt plus 2pt minus 2pt
     \parsep = 3pt plus 1pt minus 1pt
     \itemsep = \topsep}}
\renewcommand{\small}{%
   \@setfontsize \small {9}{9.9}%
   \abovedisplayskip =
     8.5pt plus 3pt minus 4pt
   \abovedisplayshortskip =
     0pt plus 2pt
   \belowdisplayshortskip =
     4pt plus 2pt minus 2pt
   \def\@listi{\leftmargin = \leftmargini
     \topsep = 4pt plus 2pt minus 2pt
     \parsep = 2pt plus 1pt minus 1pt
     \itemsep = \topsep}%
   \belowdisplayskip = \abovedisplayskip}
\renewcommand{\footnotesize}{%
   \@setfontsize \footnotesize {8}{8.8}%
   \abovedisplayskip =
     6pt plus 2pt minus 4pt
   \abovedisplayshortskip =
     0pt plus 1pt
   \belowdisplayshortskip =
     3pt plus 1pt minus 2pt
   \def\@listi{\leftmargin = \leftmargini
     \topsep = 3pt plus 1pt minus 1pt
     \parsep = 1.5pt plus 1pt minus 1pt
     \itemsep = \topsep}%
   \belowdisplayskip = \abovedisplayskip}
\renewcommand{\scriptsize}{\@setfontsize
  \scriptsize {7}{7.7}}
\renewcommand{\tiny}{\@setfontsize
  \tiny {5}{5.5}}
\normalsize
\RequirePackage{type1cm,type1ec}
\DeclareMathSizes{11}{11}{8}{6}
\DeclareMathSizes{14}{14}{11}{8}
\DeclareMathSizes{16}{16}{12}{10}
\DeclareMathSizes{20}{20}{14}{12}
\renewcommand{\section}{\@startsection
  {section}{1}{0pt}%
  {-11pt plus -6pt minus -2pt}%
  {11pt plus 6pt minus 2pt}%
  {\normalfont\normalsize\bf}}
\renewcommand{\subsection}{\@startsection
  {subsection}{2}{0pt}%
  {-11pt plus -6pt minus -2pt}%
  {11pt plus 6pt minus 2pt}%
  {\normalfont\normalsize\it}}
\renewcommand{\subsubsection}{\@startsection
  {subsubsection}{3}{0pt}%
  {-11pt plus -6pt minus -2pt}%
  {11pt plus 6pt minus 2pt}%
  {\normalfont\normalsize\it}}
\renewcommand{\paragraph}{\@startsection
  {paragraph}{4}{0pt}%
  {-11pt plus -6pt minus -2pt}%
  {11pt plus 6pt minus 2pt}%
  {\normalfont\normalsize\it}}
\renewcommand{\subparagraph}{\@startsection
  {subparagraph}{5}{0pt}%
  {-11pt plus -6pt minus -2pt}%
  {11pt plus 6pt minus 2pt}%
  {\normalfont\normalsize\it}}
\setcounter{secnumdepth}{-2}
\RequirePackage[margin=0.5cm,font=footnotesize,
  aboveskip=5pt]{caption}
\DeclareCaptionLabelFormat{fig}
  {\ifthenelse{\equal{#1}%
    {Figure}}{Fig}{Tab}.\,#2}
\captionsetup{labelformat=fig}
\setlength{\floatsep}{6pt plus 3pt}
\setlength{\textfloatsep}{\floatsep}
\bibliographystyle{vancouver}
\renewcommand{\@openbib@code}{\small
  \setlength{\itemsep}{3pt}%
  \setlength{\parsep}{1pt plus 1pt}}
\renewcommand\@biblabel[1]{#1.}
\endinput
%%
%% End of file `elbioimp.cls'.
