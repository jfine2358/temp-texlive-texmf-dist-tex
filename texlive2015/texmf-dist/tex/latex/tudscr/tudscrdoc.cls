%%
%% This is file `tudscrdoc.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% tudscr-version.dtx  (with options: `class,doc')
%% tudscr-doc.dtx  (with options: `class,doc')
%% tudscr-misc.dtx  (with options: `class,doc')
%% 
%% ============================================================================
%% 
%%  TUD-KOMA-Script
%%  Copyright (c) Falk Hanisch <tudscr@gmail.com>, 2012-2015
%% 
%% ============================================================================
%% 
%%  This work may be distributed and/or modified under the conditions of the
%%  LaTeX Project Public License, version 1.3c of the license. The latest
%%  version of this license is in http://www.latex-project.org/lppl.txt and
%%  version 1.3c or later is part of all distributions of LaTeX 2005/12/01
%%  or later and of this work. This work has the LPPL maintenance status
%%  "author-maintained". The current maintainer and author of this work
%%  is Falk Hanisch.
%% 
%% ----------------------------------------------------------------------------
%% 
%%  Dieses Werk darf nach den Bedingungen der LaTeX Project Public Lizenz
%%  in der Version 1.3c, verteilt und/oder veraendert werden. Die aktuelle
%%  Version dieser Lizenz ist http://www.latex-project.org/lppl.txt und
%%  Version 1.3c oder spaeter ist Teil aller Verteilungen von LaTeX 2005/12/01
%%  oder spaeter und dieses Werks. Dieses Werk hat den LPPL-Verwaltungs-Status
%%  "author-maintained", wird somit allein durch den Autor verwaltet. Der
%%  aktuelle Verwalter und Autor dieses Werkes ist Falk Hanisch.
%% 
%% ============================================================================
%% 
%%% From File: tudscr-version.dtx
\begingroup%
  \catcode`\@11\relax%
  \ifx\TUDVersion\undefined%
    \newcommand*\@TUDVersion[1]{\gdef\TUDVersion{#1}}%
  \else%
    \newcommand*\@TUDVersion[1]{%
      \def\@tempa{#1}%
      \ifx\TUDVersion\@tempa\else%
        \@latex@warning@no@line{%
          \noexpand\TUDVersion\space is `\TUDVersion',\MessageBreak%
          but `#1' was expected!\MessageBreak%
          You should not use classes, packages or files from\MessageBreak%
          different TUD-KOMA-Script-Bundle versions%
        }%
      \fi%
    }%
  \fi%
  \@TUDVersion{2015/02/15 v2.03 TUD-KOMA-Script}%
\endgroup%
\providecommand*\tudscrmail{tudscr@gmail.com}
\newcommand*\cls@name{doc}
\newcommand*\scrcls@name{scrdoc}
\newcommand*\tudcls@name{tudscrdoc}
\@ifundefined{TUDScript}{%
  \DeclareRobustCommand{\TUDScript}{%
    \ifdin{TUD-KOMA-SCRIPT}{%
      \textsf{T\kern.05em U\kern.05em D\kern.1em-\kern.1em}\KOMAScript%
    }\csname xspace\endcsname%
  }%
}{}
%%% From File: tudscr-doc.dtx
\NeedsTeXFormat{LaTeX2e}[2011/06/27]
\ProvidesClass{tudscrdoc}[%
  2015/02/15 v2.03 TUD-KOMA-Script
  class
  (source code documentation based on scrdoc)%
]
\LoadClassWithOptions{scrdoc}
\setlength\marginparwidth{140pt}
\setlength\marginparsep{8pt}
\setlength\oddsidemargin{\dimexpr\marginparwidth+\marginparsep-1in\relax}
\setlength\textwidth{%
  \dimexpr\paperwidth-1in-\oddsidemargin-2\marginparsep\relax%
}
\setlength\topmargin{-1in}
\setlength\headheight{0pt}
\setlength\headsep{30pt}
\setlength\footskip{1.5\headsep}
\setlength\textheight{\dimexpr\paperheight-2\headsep-\footskip\relax}
\RequirePackage{dox}[2010/12/16]
\def\generalname{Allgemeines}
\title{%
  \texttt{\filename}\thanks{%
    Dies ist Version \fileversion\ von Datei \texttt{\filename}.%
  }%
}
\author{Falk Hanisch\thanks{\tudscrmail}}
\date{\filedate}
\DoNotIndex{\",\\,,\if,\@}
\doxitem[idxtype=Option]{Option}{option}{Optionen}
\doxitem[idxtype=Parameter]{Parameter}{parameter}{Parameter}
\doxitem[idxtype=Seitenstil]{Pagestyle}{pagestyle}{Seitenstile}
\doxitem[idxtype=Layer]{Layer}{layer}{Layer (Seitenstilebenen)}
\doxitem[macrolike,idxtype=L\noexpand\"ange]{Length}{length}{L\noexpand\"angen}
\doxitem[idxtype=Z\noexpand\"ahler]{Counter}{counter}{Z\noexpand\"ahler}
\doxitem[idxtype=Farbe]{Color}{color}{Farben}
\doxitem[macrolike,idxtype=Lok.]{Locale}{locale}{Lokalisierungsvariablen}
\doxitem[macrolike,idxtype=Feld]{Field}{field}{Eingabefelder}
\DeclareRobustCommand*{\cls}[1]{\mbox{\textsf{\textbf{#1}}}}
\DeclareRobustCommand*{\pkg}[1]{\mbox{\textsf{\textbf{#1}}}}
\DeclareRobustCommand*{\opt}[1]{\mbox{\texttt{#1}}}
\DeclareRobustCommand*{\val}[1]{\mbox{\texttt{#1}}}
\DeclareRobustCommand*{\pgs}[1]{\mbox{\texttt{#1}}}
\DeclareRobustCommand*{\env}[1]{\mbox{\texttt{#1}}}
\newcommand*\ToDo[2][]{%
  \@ifnextchar[
    {\@ToDo{#2}}{\@ToDo{#2}[]}
}
\newcommand*\@ToDo{}
\newcommand*\@@ToDo{}%
\def\@ToDo#1[#2]{%
  \ifdefined\tudfinalflag\else%
    \def\@@ToDo{\ifstr{#2}{}{ToDo}{ToDo: #2}}%
    \endgraf%
    \hfuzz0.8pt%
    \leavevmode\marginpar{\raggedleft\fbox{\@@ToDo\strut}}%
    \fbox{\parbox{\dimexpr\textwidth-2\fboxsep\relax}{#1\strut}}%
    \endgraf%
  \fi%
}%
\DeclareOption{final}{\let\tudfinalflag\relax}
\ProcessOptions\relax
\AfterPackage{hyperref}{%
  \pdfstringdefDisableCommands{\def\TUDScript{TUD-KOMA-Script}}%
}
\AfterPackage{babel}{%
  \AfterPackage*{inputenc}{\RequirePackage{csquotes}[2011/10/22]}%
}
\AtBeginDocument{%
  \providecommand*\url[1]{\texttt{#1}}%
  \providecommand*\texorpdfstring[2]{#1}%
  \@ifpackageloaded{babel}{}{%
    \ClassWarning{\tudcls@name}{Package `babel' not loaded}%
    \let\selectlanguage\@gobble%
    \let\glqq\relax%
    \let\grqq\relax%
  }%
  \@ifpackageloaded{csquotes}{}{%
    \ClassWarning{\tudcls@name}{Package `csquotes' not loaded}%
    \providecommand\enquote[1]{\glqg#1\grqq{}}%
  }%
  \providecommand*\ifdin[2]{#2}%
}
\AtBeginDocument{%
  \@ifundefined{tud@cdfont}{\def\tud@cdfont{0}}{}%
  \ifnum\tud@cdfont>\z@\relax%
    \RequirePackage{mweights}[2013/07/21]%
    \def\mddefault{m}%
    \def\mdseries@tt{m}%
    \renewcommand*\@pnumwidth{1.7em}%
  \else%
    \RequirePackage{lmodern}[2009/10/30]%
  \fi%
}%
%%% From File: tudscr-misc.dtx
\RequirePackage{xspace}[2009/10/20]
\xspaceaddexceptions{"=}
\newcommand*\vTUDScript{}
\AtBeginDocument{%
  \def\@tempb#1 #2 #3\relax#4\relax{\def\vTUDScript{#2}}%
  \edef\@tempa{\TUDVersion}%
  \expandafter\@tempb\@tempa\relax? ? \relax\relax%
}
\newcommand*\vKOMAScript{v3.12\xspace}
\RequirePackage{scrhack}[2014/02/27]
\newcommand*\CD{Corporate Design\xspace}
\newcommand*\CDs{Corporate Designs\xspace}
\newcommand*\TUD{Technische Universit\"at Dresden\xspace}
\newcommand*\TnUD{Technischen Universit\"at Dresden\xspace}
\newcommand*\DDC{%
  \mbox{D\kern.05em R\kern.05em E\kern.05em S\kern.05em D\kern.05em E\kern.05em
  N\kern.1em-\kern.1em concept}\xspace%
}
\AfterPackage*{babel}{%
  \@expandtwoargs\in@{,english,}{,\bbl@loaded,}%
  \ifin@%
    \renewcommand*\CD{\foreignlanguage{english}{Corporate Design}\xspace}
    \renewcommand*\CDs{\foreignlanguage{english}{Corporate Designs}\xspace}
  \fi
}
\endinput
%%
%% End of file `tudscrdoc.cls'.
