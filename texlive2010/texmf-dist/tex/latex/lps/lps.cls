%%
%% This is file `lps.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% lps.dtx  (with options: `class')
%% 
%%  Copyright 2005, 2006 Gustavo Cevolani, Gruppo Utilizzatori Italiani di TeX
%% 
%%  This program is provided under the terms of the
%%  LaTeX Project Public License distributed from CTAN
%%  archives in directory macros/latex/base/lppl.txt.
%% 
%%  Author: Gustavo Cevolani
%%          at g.cevolani@gmail.com
%% 
%%  This work has the LPPL maintenance status "author-maintained".
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{lps}[2006/09/22 v0.5%
                    LaTeX document class for the L&PS journal]
\LoadClass[11pt,twoside,onecolumn]{article}
\RequirePackage{mathptmx}
\RequirePackage{geometry}
\RequirePackage{titletoc}
\RequirePackage{lastpage}
\newcommand{\the@title}%
 {\@latex@warning@no@line{LPS warning: no \noexpand\Title given}}
\newcommand{\Title}[1]{\renewcommand{\the@title}{#1}}
\let\title\Title
\newcommand{\the@author}%
{\@latex@warning@no@line{LPS warning: no \noexpand\Author given}}
\newcommand{\Author}[1]{\renewcommand{\the@author}{#1}}
\let\author\Author
\newcommand{\the@affiliation}%
 {\@latex@warning@no@line{No \noexpand\Affiliation given}}
\newcommand{\Affiliation}[1]{\renewcommand{\the@affiliation}{#1}}
\newcommand{\the@email}%
 {\@latex@warning@no@line{No \noexpand\Email given}}
\newcommand{\Email}[1]{\renewcommand{\the@email}{e-mail: #1}}
\newcommand{\the@volume}{III}
\newcommand{\Volume}[1]{\renewcommand{\the@volume}{#1}}
\newcommand{\the@number}{4}
\newcommand{\Number}[1]{\renewcommand{\the@number}{#1}}
\newcommand{\the@year}{2222}
\newcommand{\Year}[1]{\renewcommand{\the@year}{#1}}
\newcommand{\first@page}{1}
\newcommand{\FirstPage}[1]{\renewcommand{\first@page}{#1}%
                           \setcounter{page}{\first@page}}
\renewcommand{\@maketitle}{\newpage\null\vspace{4mm}
  {\centering
  \let\footnote\thanks
  {\LARGE \the@title}\vskip 10mm
  {\normalsize
    \the@author\\\the@affiliation\\\the@email
    }
    \vskip 10mm}}
\renewcommand{\tableofcontents}{
  \begin{quotation}\small\noindent
    \@starttoc{toc}
  \end{quotation}}
\titlecontents{section}[1.4em]{}%
              {\contentslabel[\bfseries\thecontentslabel ]%
              {1.4em}}{\itshape}{}[]
\newcommand{\the@keywords}%
    {\@latex@warning@no@line{No \noexpand\Keywords given}}
\newcommand{\Keywords}[1]{\renewcommand{\the@keywords}{#1}}
\renewenvironment{abstract}%
      {\setlength{\parskip}{0pt}
       \begin{quotation}\noindent\small%
             \textsc{\MakeLowercase\abstractname}.}%
      {\vskip 1\baselineskip \noindent%
       \textsc{keywords}: \the@keywords%
       \end{quotation}\noindent}
\geometry{paperwidth=155mm,paperheight=230mm}
\geometry{textwidth=122mm,textheight=172.795mm}
\geometry{headsep=10mm,headheight=7mm,footskip=7mm}
\geometry{hcentering,top=33mm}
\newcommand{\ps@lps}{%
 \renewcommand{\@oddhead}%
  {\hfil\small\scshape\MakeLowercase\the@title\hfil}%
 \renewcommand{\@oddfoot}{\hfil\itshape\thepage\hfil}%
 \renewcommand{\@evenhead}%
  {\hfil\small\scshape\MakeLowercase\the@author\hfil}%
 \renewcommand{\@evenfoot}{\hfil\itshape\thepage\hfil}}
\renewcommand{\ps@plain}{%
\renewcommand{\@oddhead}%
 {\hfil\parbox[t]{80mm}{\centering\itshape%
 L\&PS -- Logic \& Philosophy of Science\\%
 Vol. \the@volume, No. \the@number, \the@year, %
 pp. \thepage -\pageref{LastPage}}\hfil}%
\renewcommand{\@oddfoot}{%
 \parbox[t]{80mm}{\footnotesize \copyright\ The Author \the@year\\
 Published by L\&PS -- Logic and Philosophy of Science\\
 http://www.univ.trieste.it/\~{}episteme/ -- ISSN:\thinspace 1826-1043}\hfil}%
\renewcommand{\@evenhead}{}%
\renewcommand{\@evenfoot}{\hfil\itshape\thepage\hfil}}
\renewcommand{\thesection}{\arabic{section}.}
\renewcommand{\section}{\@startsection
    {section}%
    {1}%
    {0mm}%
    {2\baselineskip}%
    {1\baselineskip}%
    {\centering\normalfont\normalsize\bfseries}%
}
\renewcommand{\@makefntext}[1]%
  {\indent\makebox[7mm][r]{\@makefnmark}\hspace{2mm}#1}
\renewcommand{\footnoterule}%
  {\noindent\vspace*{-2pt}\rule{\textwidth}{.4pt}\vspace*{5pt}}
\setlength{\skip\footins}{6mm}
\AtBeginDocument{\pagestyle{lps}}
\endinput
%%
%% End of file `lps.cls'.
