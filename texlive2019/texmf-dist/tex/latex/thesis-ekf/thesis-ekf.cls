%%
%% This is file `thesis-ekf.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ./thesis-ekf.dtx  (with options: `class')
%% This is a generated file.
%% Copyright (C) 2014-2018 by Tibor Tomacs
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
\ProvidesClass{thesis-ekf}[2018/11/27 v2.3 Thesis class for Eszterhazy Karoly University (Eger, Hungary)]

\RequirePackage{kvoptions,etoolbox,ifpdf,setspace,graphicx}
\SetupKeyvalOptions{family=ekf,prefix=ekf@}
\DeclareVoidOption{twoside}{\PassOptionsToClass{twoside}{report}}
\DeclareVoidOption{colorlinks}{\PassOptionsToPackage{colorlinks}{hyperref}}
\DeclareBoolOption{logodown}
\DeclareBoolOption{tocnopagenum}
\DeclareBoolOption[true]{centeredchapter}
\DeclareStringOption[12pt]{fontsize}
\DeclareStringOption[10mm]{institutesep}
\DeclareStringOption[0mm]{logosep}
\DeclareStringOption[\stretch{1.5}]{titlesep}
\DeclareStringOption[15mm]{authorsep}
\DeclareStringOption[10mm]{xmargin}
\DeclareStringOption[1mm]{captionsep}
\DeclareStringOption[\large\normalfont\scshape]{institutefont}
\DeclareStringOption[\large\normalfont\scshape]{logofont}
\DeclareStringOption[\Huge\normalfont\sffamily\bfseries]{titlefont}
\DeclareStringOption[\large\normalfont]{authorfont}
\DeclareStringOption[\large\normalfont\bfseries]{captionfont}
\DeclareStringOption[\large\normalfont\scshape]{cityfont}
\ProcessKeyvalOptions{ekf}
\InputIfFileExists{thesis-ekf.cfg}{}{}

\def\ekf@ten{10pt}
\def\ekf@eleven{11pt}
\def\ekf@twelve{12pt}

\ifx\ekf@fontsize\ekf@ten\else
\ifx\ekf@fontsize\ekf@eleven\else
\ifx\ekf@fontsize\ekf@twelve\else
\ClassWarning{thesis-ekf}{Unused option: fontsize=\ekf@fontsize. Use fontsize=10pt, fontsize=11pt or fontsize=12pt!}
\def\ekf@fontsize{12pt}
\fi\fi\fi

\PassOptionsToClass{\ekf@fontsize}{report}
\LoadClass{report}

\RequirePackage[unicode,linktocpage,allcolors=blue,pdfstartview=FitH,bookmarksnumbered,pdfborder={0 0 0}]{hyperref}
\RequirePackage[a4paper,top=25mm,bottom=25mm,inner=30mm,outer=25mm]{geometry}

\onehalfspacing

\AfterEndPreamble{

\ifekf@tocnopagenum
  \hypersetup{pageanchor=false}
  \let\ekf@tableofcontents\tableofcontents
  \def\tableofcontents{%
     \global\let\ekf@thepage\thepage%
     \global\let\thepage\empty%
     \ekf@tableofcontents%
     \clearpage%
     \global\c@page\@ne%
     \global\let\thepage\ekf@thepage%
     \hypersetup{pageanchor}}
\fi

\ifekf@centeredchapter
  \let\ekf@makechapterhead\@makechapterhead
  \let\ekf@makeschapterhead\@makeschapterhead
  \let\ekf@raggedright\raggedright
  \def\@makechapterhead#1{
    \let\raggedright\centering
    \ekf@makechapterhead{#1}
    \let\raggedright\ekf@raggedright}
  \def\@makeschapterhead#1{
    \let\raggedright\centering
    \ekf@makeschapterhead{#1}
    \let\raggedright\ekf@raggedright}
\fi

\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}

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
\renewcommand*\l@subsection{\@dottedtocline{2}{4.3em}{3.2em}}

\if@ekf@nochanged@authorcaption@%
    \@ifundefined{l@magyar}{}{%
    \iflanguage{magyar}{\gdef\ekf@authorcaption{K\'{e}sz\'{\i}tette}}{}}\fi

\if@ekf@nochanged@supervisorcaption@%
    \@ifundefined{l@magyar}{}{%
    \iflanguage{magyar}{\gdef\ekf@supervisorcaption{T\'{e}mavezet\H{o}}}{}}\fi

\if@ekf@nochanged@logo@%
    \@ifundefined{l@magyar}{}{%
    \iflanguage{magyar}{\if@ekf@exists@logo@hu@\gdef\ekf@logo{\includegraphics{eszterhazy-logo-hu}}\fi}{}}\fi

}

\newif\if@ekf@nochanged@logo@\@ekf@nochanged@logo@true
\def\logo#1{\@ekf@nochanged@logo@false\gdef\ekf@logo{#1}}
\def\ekf@logo{}
\newif\if@ekf@exists@logo@en@
\ifpdf\IfFileExists{eszterhazy-logo-en.pdf}{\@ekf@exists@logo@en@true}{}
    \else\IfFileExists{eszterhazy-logo-en.eps}{\@ekf@exists@logo@en@true}{}\fi
\newif\if@ekf@exists@logo@hu@
\ifpdf\IfFileExists{eszterhazy-logo-hu.pdf}{\@ekf@exists@logo@hu@true}{}
    \else\IfFileExists{eszterhazy-logo-hu.eps}{\@ekf@exists@logo@hu@true}{}\fi
\if@ekf@exists@logo@en@\def\ekf@logo{\includegraphics{eszterhazy-logo-en}}\fi
\def\ekf@logo@{\ifx\ekf@logo\@empty%
    \ClassWarning{thesis-ekf}{There isn't logo!}%
    \else\ekf@logo\fi}

\def\institute#1{\gdef\ekf@institute{#1}}
\institute{}
\def\ekf@institute@{\ifx\ekf@institute\@empty%
    \ClassWarning{thesis-ekf}{There isn't institute!}%
    \else\ekf@institute\fi}

\def\title#1{\gdef\ekf@title{#1}}
\title{}
\def\ekf@title@{\ifx\ekf@title\@empty
    \ClassWarning{thesis-ekf}{There isn't title!}~%
    \else\ekf@title\fi}

\def\author#1{\gdef\ekf@author{#1}}
\author{}
\def\ekf@author@{\ifx\ekf@author\@empty
    \ClassWarning{thesis-ekf}{There isn't author!}~%
    \else\ekf@author\fi}

\newif\if@ekf@nochanged@authorcaption@\@ekf@nochanged@authorcaption@true
\def\authorcaption#1{\@ekf@nochanged@authorcaption@false\gdef\ekf@authorcaption{#1}}
\def\ekf@authorcaption{Author}
\def\ekf@authorcaption@{\ifx\ekf@author\@empty~%
    \else
    \ifx\ekf@authorcaption\@empty
    \ClassWarning{thesis-ekf}{There isn't authorcaption!}~%
    \else\ekf@authorcaption\fi\fi}

\def\supervisor#1{\gdef\ekf@supervisor{#1}}
\supervisor{}
\def\ekf@supervisor@{\ifx\ekf@supervisor\@empty
    \ClassWarning{thesis-ekf}{There isn't supervisor!}~%
    \else\ekf@supervisor\fi}

\newif\if@ekf@nochanged@supervisorcaption@\@ekf@nochanged@supervisorcaption@true
\def\supervisorcaption#1{\@ekf@nochanged@supervisorcaption@false\gdef\ekf@supervisorcaption{#1}}
\def\ekf@supervisorcaption{Supervisor}
\def\ekf@supervisorcaption@{\ifx\ekf@supervisor\@empty~%
    \else
    \ifx\ekf@supervisorcaption\@empty
    \ClassWarning{thesis-ekf}{There isn't supervisorcaption!}~%
    \else\ekf@supervisorcaption\fi\fi}

\def\city#1{\gdef\ekf@city{#1}}
\city{}
\def\ekf@city@{\ekf@city\ifx\ekf@city\@empty%
    \ClassWarning{thesis-ekf}{There isn't city!}\fi}

\def\date#1{\gdef\ekf@date{#1}}
\date{\number\year}
\def\ekf@date@{\ekf@date\ifx\ekf@date\@empty%
    \ClassWarning{thesis-ekf}{There isn't date!}\fi}

\def\ekf@sep{,~}
\def\ekf@sep@{\ifx\ekf@city\@empty\else\ifx\ekf@date\@empty\else\ekf@sep\fi\fi}

\def\maketitle{
\thispagestyle{empty}
{\centering
\ifekf@logodown
{\ekf@institutefont\ekf@institute@\ifx\ekf@institute\@empty\else\\
\vspace{\ekf@institutesep}\fi}
{\ekf@logofont\ekf@logo@\ifx\ekf@logo\@empty~\\\else\\\fi}
\else
{\ekf@logofont\ekf@logo@\ifx\ekf@logo\@empty\else\\\vspace{\ekf@logosep}\fi}
{\ekf@institutefont\ekf@institute@\ifx\ekf@institute\@empty~\\\else\\\fi}
\fi
\vfill{\ekf@titlefont\ekf@title@\\}\vspace{\ekf@titlesep}
{\ekf@authorfont
\begin{tabular}[t]{@{\hspace{\ekf@xmargin}}l@{}}
{\ekf@captionfont\ekf@authorcaption@}\\[\ekf@captionsep]
\ekf@author@
\end{tabular}
\hfill
\begin{tabular}[t]{@{}l@{\hspace{\ekf@xmargin}}}
{\ekf@captionfont\ekf@supervisorcaption@}\\[\ekf@captionsep]
\ekf@supervisor@
\end{tabular}}
\par\vspace{\ekf@authorsep}
{\ekf@cityfont\ekf@city@\ekf@sep@\ekf@date@\par}
}
\newpage
\if@twoside\thispagestyle{empty}\hbox{}\newpage\fi}

\endinput
%%
%% End of file `thesis-ekf.cls'.