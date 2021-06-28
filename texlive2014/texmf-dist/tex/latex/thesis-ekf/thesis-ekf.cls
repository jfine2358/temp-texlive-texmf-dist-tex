%%
%% This is file `thesis-ekf.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ./thesis-ekf.dtx  (with options: `class')
%% This is a generated file.
%% Copyright (C) 2014 Tibor Tomacs
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.2 of this license or (at your option) any later
%% version. The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of
%% LaTeX version 1999/12/01 or later.
%% 

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{thesis-ekf}[2014/05/21 v1.0 class for EKF thesis]
\LoadClass[a4paper,12pt]{report}
\RequirePackage[top=25mm,bottom=25mm,inner=30mm,outer=25mm]{geometry}
\RequirePackage[unicode,linktocpage,linkcolor=blue,citecolor=blue,urlcolor=blue,
pdfstartview=FitH,bookmarksnumbered,pdfborder={0 0 0}]{hyperref}
\linespread{1.24}
\overfullrule10pt
\flushbottom
\widowpenalty=10000
\clubpenalty=10000

\if@twoside
\def\ps@plain{}
\def\@oddfoot{\hbox{}\hfill\normalsize\textnormal\thepage}
\def\@evenfoot{\normalsize\textnormal\thepage}
\def\@aftertitlepage{\thispagestyle{empty}\hbox{}\newpage}
\else
\def\@aftertitlepage{}
\fi

\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.8em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
\renewcommand*\l@section{\@dottedtocline{1}{1.8em}{2.5em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{4.1em}{3.2em}}

\def\logo#1{\def\@logo{#1}}\logo{}
\def\institute#1{\def\@institute{#1}}\institute{}
\def\authorcaption#1{\def\@authorcaption{#1}}\authorcaption{}
\def\supervisorcaption#1{\def\@supervisorcaption{#1}}\supervisorcaption{}
\def\supervisor#1{\def\@supervisor{#1}}\supervisor{}
\def\city#1{\def\@city{#1}}\city{}

\def\maketitle{
\thispagestyle{empty}
\begin{large}
\centering
\if@logono{\scshape\@institute\\}\fi
\if@logoup{\scshape\@logo\\\@institute\\}\fi
\if@logodown{\scshape\@institute\\[10mm]\@logo\\}\fi
\vfill{\Huge\sffamily\bfseries\@title\\}\vspace{\stretch{1.8}}
\begin{tabular}[t]{@{\hspace{10mm}}l@{}}
{\bfseries\@authorcaption}\\[1mm]
\@author
\end{tabular}
\hfill
\begin{tabular}[t]{@{}l@{\hspace{10mm}}}
{\bfseries\@supervisorcaption}\\[1mm]
\@supervisor
\end{tabular}
\par\vspace{15mm}
{\scshape\@city\if\@city\empty\else,~\fi\@date\par}
\end{large}
\newpage\@aftertitlepage}

\newif\if@logono
\newif\if@logoup
\newif\if@logodown

\DeclareOption{nocolorlinks}{\hypersetup{colorlinks=false}}
\DeclareOption{colorlinks}{\hypersetup{colorlinks}}
\DeclareOption{oneside}{\@twosidefalse\@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue\@mparswitchtrue}
\DeclareOption{logono}{\@logonotrue\@logoupfalse\@logodownfalse}
\DeclareOption{logoup}{\@logonofalse\@logouptrue\@logodownfalse}
\DeclareOption{logodown}{\@logonofalse\@logoupfalse\@logodowntrue}
\ExecuteOptions{nocolorlinks,oneside,logoup}
\ProcessOptions
\endinput
%%
%% End of file `thesis-ekf.cls'.
