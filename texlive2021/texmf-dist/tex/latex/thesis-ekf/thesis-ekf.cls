%%
%% This is file `thesis-ekf.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ./thesis-ekf.dtx  (with options: `class')
%% This is a generated file.
%% Copyright (C) 2014-2020 by Tibor Tomacs
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
\ProvidesClass{thesis-ekf}[2020/12/22 v4.1 Thesis class for Eszterhazy Karoly University (Eger, Hungary)]

\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=thesis-ekf,prefix=thesisekf@}
\DeclareVoidOption{twoside}{\PassOptionsToClass{twoside}{report}}
\DeclareVoidOption{colorlinks}{\PassOptionsToPackage{colorlinks}{hyperref}}
\DeclareBoolOption{times}
\DeclareBoolOption{upint}
\DeclareBoolOption{logodown}
\DeclareBoolOption{tocnopagenum}
\DeclareBoolOption{reverseorder}
\DeclareBoolOption[true]{centeredchapter}
\DeclareBoolOption[true]{warning}
\DeclareVoidOption{10pt}{\def\thesisekf@fontsize@{10pt}}
\DeclareVoidOption{11pt}{\def\thesisekf@fontsize@{11pt}}
\DeclareVoidOption{12pt}{\def\thesisekf@fontsize@{12pt}}
\DeclareStringOption{fontsize}
\DeclareStringOption[10mm]{institutesep}
\DeclareStringOption[0mm]{logosep}
\DeclareStringOption[\stretch{1.4}]{titlesep}
\DeclareStringOption[15mm]{authorsep}
\DeclareStringOption[5mm]{hminsep}
\DeclareStringOption[10mm]{authorxmargin}
\DeclareStringOption[0mm]{captionsep}
\DeclareStringOption[2mm]{collcaptionsep}
\DeclareStringOption[left]{authoralign}
\DeclareStringOption[left]{supervisoralign}
\DeclareStringOption[\large\scshape]{institutefont}
\DeclareStringOption[\large\scshape]{logofont}
\DeclareStringOption[\Huge\bfseries]{titlefont}
\DeclareStringOption[\large]{authorfont}
\DeclareStringOption[\large\bfseries]{captionfont}
\DeclareStringOption[\large\scshape]{cityfont}
\DeclareStringOption[\large\scshape]{datefont}
\DeclareStringOption[,~]{datesep}
\def\thesisekf@fontsize@{12pt}
\ProcessKeyvalOptions{thesis-ekf}

\InputIfFileExists{thesis-ekf.cfg}{}{}

\def\thesisekf@ten{10pt}
\def\thesisekf@eleven{11pt}
\def\thesisekf@twelve{12pt}
\ifx\thesisekf@fontsize\thesisekf@ten
    \def\thesisekf@fontsize@{10pt}
\fi
\ifx\thesisekf@fontsize\thesisekf@eleven
    \def\thesisekf@fontsize@{11pt}
\fi
\ifx\thesisekf@fontsize\thesisekf@twelve
    \def\thesisekf@fontsize@{12pt}
\fi

\LoadClass[\thesisekf@fontsize@]{report}
\RequirePackage{iftex}
\ifpdf
    \RequirePackage{cmap}
\fi
\RequirePackage{setspace}
\RequirePackage[unicode,linktocpage,allcolors=blue,pdfstartview=FitH,bookmarksnumbered,pdfborder={0 0 0}]{hyperref}
\RequirePackage[a4paper,top=25mm,bottom=25mm,inner=30mm,outer=25mm]{geometry}
\ifthesisekf@times
    \ifthesisekf@upint
        \PassOptionsToPackage{upint}{newtxmath}
        \PassOptionsToPackage{intlimits}{amsmath}
    \fi
\else
    \RequirePackage{lmodern,fixcmex}
    \ifthesisekf@upint
        \RequirePackage{cmupint}
    \fi
\fi
\RequirePackage{etoolbox,graphicx}

\onehalfspacing

\AtEndPreamble{
\ifthesisekf@times
    \RequirePackage{newtxtext,newtxmath}
\fi
\ifx\thesisekf@fontsize\@empty
\else
    \ifx\thesisekf@fontsize\thesisekf@ten
    \else
        \ifx\thesisekf@fontsize\thesisekf@eleven
        \else
            \ifx\thesisekf@fontsize\thesisekf@twelve
            \else
                \RequirePackage[fontsize=\thesisekf@fontsize]{fontsize}
            \fi
        \fi
    \fi
\fi
\RequirePackage{upquote}
}

\AfterEndPreamble{

\ifthesisekf@tocnopagenum
    \hypersetup{pageanchor=false}
    \let\thesisekf@tableofcontents\tableofcontents
    \def\tableofcontents{%
        \global\let\thesisekf@thepage\thepage%
        \global\let\thepage\empty%
        \thesisekf@tableofcontents%
        \clearpage%
        \global\c@page\@ne%
        \global\let\thepage\thesisekf@thepage%
        \hypersetup{pageanchor}}
\fi

\ifthesisekf@centeredchapter
    \let\thesisekf@makechapterhead\@makechapterhead
    \let\thesisekf@makeschapterhead\@makeschapterhead
    \let\thesisekf@raggedright\raggedright
    \def\@makechapterhead#1{
        \let\raggedright\centering
        \thesisekf@makechapterhead{#1}
        \let\raggedright\thesisekf@raggedright}
    \def\@makeschapterhead#1{
        \let\raggedright\centering
        \thesisekf@makeschapterhead{#1}
        \let\raggedright\thesisekf@raggedright}
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

\if@thesisekf@nochanged@authorcaption@%
    \@ifundefined{l@magyar}{}{%
        \iflanguage{magyar}{\gdef\thesisekf@authorcaption{K\'{e}sz\'{\i}tette}}{}}%
    \@ifundefined{l@ngerman}{}{%
        \iflanguage{ngerman}{\gdef\thesisekf@authorcaption{Autor}}{}}%
    \@ifundefined{l@german}{}{%
        \iflanguage{german}{\gdef\thesisekf@authorcaption{Autor}}{}}%
\fi

\if@thesisekf@nochanged@supervisorcaption@%
    \@ifundefined{l@magyar}{}{%
        \iflanguage{magyar}{\gdef\thesisekf@supervisorcaption{T\'{e}mavezet\H{o}}}{}}%
    \@ifundefined{l@ngerman}{}{%
        \iflanguage{ngerman}{\gdef\thesisekf@supervisorcaption{Betreuer}}{}}%
    \@ifundefined{l@german}{}{%
        \iflanguage{german}{\gdef\thesisekf@supervisorcaption{Betreuer}}{}}%
\fi

\if@thesisekf@nochanged@logo@%
    \@ifundefined{l@magyar}{}{%
        \iflanguage{magyar}{\if@thesisekf@exists@logo@hu@\gdef\thesisekf@logo{\includegraphics{eszterhazy-logo-hu}}\fi}{}}%
    \@ifundefined{l@ngerman}{}{%
        \iflanguage{ngerman}{\if@thesisekf@exists@logo@de@\gdef\thesisekf@logo{\includegraphics{eszterhazy-logo-de}}\fi}{}}%
    \@ifundefined{l@german}{}{%
        \iflanguage{german}{\if@thesisekf@exists@logo@de@\gdef\thesisekf@logo{\includegraphics{eszterhazy-logo-de}}\fi}{}}%
\fi

}

\newif\if@thesisekf@nochanged@logo@
\@thesisekf@nochanged@logo@true
\def\logo#1{\@thesisekf@nochanged@logo@false\gdef\thesisekf@logo{#1}}
\def\thesisekf@logo{}
\newif\if@thesisekf@exists@logo@en@
\ifpdf
    \IfFileExists{eszterhazy-logo-en.pdf}{\@thesisekf@exists@logo@en@true}{}
\else
    \IfFileExists{eszterhazy-logo-en.eps}{\@thesisekf@exists@logo@en@true}{}
\fi
\newif\if@thesisekf@exists@logo@hu@
\ifpdf
    \IfFileExists{eszterhazy-logo-hu.pdf}{\@thesisekf@exists@logo@hu@true}{}
\else
    \IfFileExists{eszterhazy-logo-hu.eps}{\@thesisekf@exists@logo@hu@true}{}
\fi
\newif\if@thesisekf@exists@logo@de@
\ifpdf
    \IfFileExists{eszterhazy-logo-de.pdf}{\@thesisekf@exists@logo@de@true}{}
\else
    \IfFileExists{eszterhazy-logo-de.eps}{\@thesisekf@exists@logo@de@true}{}
\fi
\if@thesisekf@exists@logo@en@
    \def\thesisekf@logo{\includegraphics{eszterhazy-logo-en}}
\fi
\def\thesisekf@logo@{%
    \thesisekf@logo%
    \ifx\thesisekf@logo\@empty%
        \ifthesisekf@warning%
            \ClassWarning{thesis-ekf}{logo is missing}%
        \fi%
    \fi}

\def\institute#1{\gdef\thesisekf@institute{#1}}
\institute{}
\def\thesisekf@institute@{%
    \thesisekf@institute%
    \ifx\thesisekf@institute\@empty%
        \ifthesisekf@warning%
            \ClassWarning{thesis-ekf}{institute is missing}%
        \fi%
    \fi}

\def\title#1{\gdef\thesisekf@title{#1}}
\title{}
\def\thesisekf@title@{%
    \thesisekf@title%
    \ifx\thesisekf@title\@empty%
        \ifthesisekf@warning%
            \ClassWarning{thesis-ekf}{title is missing}%
        \fi%
    \fi}

\def\author#1{\gdef\thesisekf@author{#1}}
\author{}
\def\thesisekf@author@{%
    \ifx\thesisekf@authorcaption\@empty%
    \else%
        \ifx\thesisekf@author\@empty%
            \ifthesisekf@warning%
                \ClassWarning{thesis-ekf}{author is missing}%
            \fi%
        \else%
            \thesisekf@author%
        \fi%
    \fi}

\newif\if@thesisekf@nochanged@authorcaption@
\@thesisekf@nochanged@authorcaption@true
\def\authorcaption#1{%
    \@thesisekf@nochanged@authorcaption@false%
    \gdef\thesisekf@authorcaption{#1}}
\def\thesisekf@authorcaption{Author}
\def\thesisekf@authorcaption@{%
    \ifx\thesisekf@author\@empty%
    \else%
        \ifx\thesisekf@authorcaption\@empty%
            \ifthesisekf@warning%
                \ClassWarning{thesis-ekf}{authorcaption is missing}%
            \fi%
        \else%
            \thesisekf@authorcaption%
        \fi%
    \fi}

\def\supervisor#1{\gdef\thesisekf@supervisor{#1}}
\supervisor{}
\def\thesisekf@supervisor@{%
    \ifx\thesisekf@supervisorcaption\@empty
    \else
        \ifx\thesisekf@supervisor\@empty
            \ifthesisekf@warning
                \ClassWarning{thesis-ekf}{supervisor is missing}
            \fi
        \else
            \thesisekf@supervisor
        \fi
    \fi}

\newif\if@thesisekf@nochanged@supervisorcaption@
\@thesisekf@nochanged@supervisorcaption@true
\def\supervisorcaption#1{%
    \@thesisekf@nochanged@supervisorcaption@false%
    \gdef\thesisekf@supervisorcaption{#1}}
\def\thesisekf@supervisorcaption{Supervisor}
\def\thesisekf@supervisorcaption@{%
    \ifx\thesisekf@supervisor\@empty%
    \else%
        \ifx\thesisekf@supervisorcaption\@empty%
            \ifthesisekf@warning%
                \ClassWarning{thesis-ekf}{supervisorcaption is missing}%
            \fi%
        \else%
            \thesisekf@supervisorcaption%
        \fi%
    \fi}

\def\city#1{\gdef\thesisekf@city{#1}}
\city{}
\def\thesisekf@city@{%
    \thesisekf@city%
    \ifx\thesisekf@city\@empty%
        \ifthesisekf@warning%
            \ClassWarning{thesis-ekf}{city is missing}%
        \fi%
    \fi}

\def\date#1{\gdef\thesisekf@date{#1}}
\date{\number\year}
\def\thesisekf@date@{%
    \thesisekf@date%
    \ifx\thesisekf@date\@empty%
        \ifthesisekf@warning%
            \ClassWarning{thesis-ekf}{date is missing}%
        \fi%
    \fi}

\def\thesisekf@datesep@{%
    \ifx\thesisekf@city\@empty
    \else
        \ifx\thesisekf@date\@empty
        \else
            \thesisekf@datesep
        \fi
    \fi}

\def\thesisekf@box@logo{%
    \ifthesisekf@logodown%
        {\normalfont\normalsize\thesisekf@institutefont\thesisekf@institute@%
         \ifx\thesisekf@institute\@empty%
         \else%
             \\%
             \ifx\thesisekf@logo\@empty%
             \else%
                 \vspace{\thesisekf@institutesep}%
             \fi%
         \fi}%
        {\normalfont\normalsize\thesisekf@logofont\thesisekf@logo@%
         \ifx\thesisekf@logo\@empty%
         \else%
             \\%
         \fi}%
    \else%
        {\normalfont\normalsize\thesisekf@logofont\thesisekf@logo@%
         \ifx\thesisekf@logo\@empty%
         \else%
             \\%
             \ifx\thesisekf@institute\@empty%
             \else%
                 \vspace{\thesisekf@logosep}%
             \fi%
         \fi}%
        {\normalfont\normalsize\thesisekf@institutefont\thesisekf@institute@%
         \ifx\thesisekf@institute\@empty%
         \else%
             \\%
         \fi}%
    \fi%
    \vspace*{\fill}}

\def\thesisekf@box@title{%
    {\normalfont\normalsize\thesisekf@titlefont\thesisekf@title@%
     \ifx\thesisekf@title\@empty%
     \else%
         \par\vspace{\thesisekf@titlesep}%
     \fi}}

\def\thesisekf@align@center{center}
\def\thesisekf@align@left{left}
\def\thesisekf@align@right{right}

\def\thesisekf@box@author{%
    {\normalfont\normalsize\thesisekf@authorfont%
     \ifx\thesisekf@authoralign\thesisekf@align@center%
         \begin{tabular}[t]{@{}c@{}}%
     \fi%
     \ifx\thesisekf@authoralign\thesisekf@align@left%
         \begin{tabular}[t]{@{}l@{}}%
     \fi%
     \ifx\thesisekf@authoralign\thesisekf@align@right%
         \begin{tabular}[t]{@{}r@{}}%
     \fi%
     {\normalfont\normalsize\thesisekf@captionfont\thesisekf@authorcaption@}\\[\thesisekf@captionsep]%
     \thesisekf@author@%
     \end{tabular}}}

\def\thesisekf@box@supervisor{%
    {\normalfont\normalsize\thesisekf@authorfont%
     \ifx\thesisekf@supervisoralign\thesisekf@align@center%
         \begin{tabular}[t]{@{}c@{}}%
     \fi%
     \ifx\thesisekf@supervisoralign\thesisekf@align@left%
         \begin{tabular}[t]{@{}l@{}}%
     \fi%
     \ifx\thesisekf@supervisoralign\thesisekf@align@right%
         \begin{tabular}[t]{@{}r@{}}%
     \fi%
     {\normalfont\normalsize\thesisekf@captionfont\thesisekf@supervisorcaption@}\\[\thesisekf@captionsep]%
     \thesisekf@supervisor@%
     \end{tabular}}}

\def\thesisekf@box@author@supervisor@{%
    \hbox{}\nobreak\hspace*{\thesisekf@authorxmargin}%
    \ifthesisekf@reverseorder%
        \thesisekf@box@supervisor%
        \nobreak\hspace{\thesisekf@hminsep}\hfill%
        \thesisekf@box@author%
    \else%
        \thesisekf@box@author%
        \nobreak\hspace{\thesisekf@hminsep}\hfill%
        \thesisekf@box@supervisor%
    \fi%
    \nobreak\hspace{\thesisekf@authorxmargin}\hbox{}%
    \par\vspace{\thesisekf@authorsep}}

\def\thesisekf@box@author@supervisor{%
    \if\getrefnumber{@thesisekf@collaborator@}%
        \gdef\thesisekf@captionsep{\thesisekf@collcaptionsep}%
    \fi%
    \thesisekf@box@author@supervisor@%
    \gdef\@currentlabel{10}%
    \if@thesisekf@collaborator@%
        \gdef\@currentlabel{11}%
    \fi%
    \label{@thesisekf@collaborator@}}

\def\thesisekf@box@city@date{%
    {\normalfont\normalsize\thesisekf@cityfont\thesisekf@city@\thesisekf@datesep@}%
    {\normalfont\normalsize\thesisekf@datefont\thesisekf@date@}}

\newif\if@thesisekf@collaborator@

\newcommand{\collaborator}[1][]{%
    \global\@thesisekf@collaborator@true%
    \\[\thesisekf@captionsep]
    \def\thesisekf@temp{#1}%
    \ifx\thesisekf@temp\@empty%
    \else%
        {\normalfont\normalsize\thesisekf@captionfont#1}\\[\thesisekf@captionsep]%
    \fi}

\def\maketitle{
    \thispagestyle{empty}
    {\centering
     \thesisekf@box@logo%
     \thesisekf@box@title%
     \thesisekf@box@author@supervisor%
     \thesisekf@box@city@date%
     \par}
    \newpage
    \if@twoside
        \thispagestyle{empty}
        \hbox{}
        \newpage
    \fi}

\endinput
%%
%% End of file `thesis-ekf.cls'.
