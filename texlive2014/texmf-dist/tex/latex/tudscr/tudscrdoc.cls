%%
%% This is file `tudscrdoc.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% tudscr-doc.dtx 
%% 
%% ======================================================================
%% 
%% Das Corporate Design der TU Dresden auf Basis der KOMA-Script-Klassen
%% 
%% ======================================================================
%% This work may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, version 1.3c of the license.
%% The latest version of this license is in
%%     http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later and of this work.
%% This work has the LPPL maintenance status "author-maintained".
%% The current maintainer and author of this work is Falk Hanisch.
%% ----------------------------------------------------------------------
%% Dieses Werk darf nach den Bedingungen der LaTeX Project Public Lizenz,
%% Version 1.3c, verteilt und/oder veraendert werden.
%% Die neuste Version dieser Lizenz ist
%%     http://www.latex-project.org/lppl.txt
%% und Version 1.3c ist Teil aller Verteilungen von LaTeX
%% Version 2005/12/01 oder spaeter und dieses Werks.
%% Dieses Werk hat den LPPL-Verwaltungs-Status "author-maintained"
%% (allein durch den Autor verwaltet).
%% Der aktuelle Verwalter und Autor dieses Werkes ist Falk Hanisch.
%% ======================================================================
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tudscrdoc}%
  [2014/04/24 v1.00 (documentation class for the tudscr-bundle based on scrdoc)]
\LoadClassWithOptions{scrdoc}
\setlength{\marginparwidth}{140pt}
\setlength{\marginparsep}{8pt}
\setlength{\oddsidemargin}{\dimexpr\marginparwidth+\marginparsep-1in}
\setlength{\textwidth}{\dimexpr\paperwidth-1in-\oddsidemargin-2\marginparsep}
\setlength{\topmargin}{-1in}
\setlength{\headheight}{0pt}
\setlength{\headsep}{30pt}
\setlength{\footskip}{\headsep}
\setlength{\textheight}{\dimexpr\paperheight-3\footskip}
\RequirePackage[latin1]{inputenc}
\RequirePackage{dox}
\RequirePackage[ngerman=ngerman-x-latest]{hyphsubst}
\RequirePackage[english,ngerman]{babel}
\RequirePackage{hologo}
\RequirePackage{xspace}
\def\filemail{tudscr@gmail.com}
\title{\texttt{\filename}%
  \footnote{Dies ist Version \fileversion\ von Datei \texttt{\filename}.}}
\author{Falk Hanisch\footnote{\filemail}}
\date{\filedate}
\DoNotIndex{\",\if,\tudpage,\endtudpage,\tud@pagestyle}
\doxitem[idxtype=Option]{Option}{option}{Optionen}
\doxitem[idxtype=Parameter]{Parameter}{parameter}{Parameter}
\doxitem[macrolike,idxtype=L\"ange]{Length}{length}{L\"angen}
\doxitem[idxtype=Farbe]{Color}{color}{Farben}
\doxitem[macrolike,idxtype=Lok.]{Locale}{locale}{Lokalisierungsvariablen}
\doxitem[macrolike,idxtype=Feld]{Field}{field}{Eingabefelder}
\DeclareRobustCommand*{\cls}[1]{\mbox{\textsf{#1}}}
\DeclareRobustCommand*{\pkg}[1]{\mbox{\textsf{#1}}}
\DeclareRobustCommand*{\opt}[1]{\mbox{\texttt{#1}}}
\DeclareRobustCommand*{\env}[1]{\mbox{\texttt{#1}}}
\DeclareRobustCommand*{\cmd}[1]{\mbox{\cs{#1}}}
\DeclareRobustCommand\TUDScript{%
  \textsf{T\kern.05em U\kern.05em D\kern.1em-\kern.1em}\KOMAScript%
}
\newif\if@tud@doc@final
\DeclareOption{final}{\@tud@doc@finaltrue}
\ProcessOptions\relax
\AtBeginDocument{
  \providecommand\todo[2][]{%
    \if@tud@doc@final\else
      \def\todo@mark{\ifstr{#1}{}{ToDo}{#1}}%
      \endgraf%
      \hfuzz0.8pt%
      \leavevmode\marginpar{\raggedleft\fbox{\todo@mark\strut}}%
      \fbox{\parbox{\dimexpr\textwidth-2\fboxsep}{#2\strut}}%
    \fi%
  }
  \let\ToDo\todo
  \providecommand*\CD{\foreignlanguage{english}{Corporate Design}\xspace}
  \providecommand*\CDs{\foreignlanguage{english}{Corporate Designs}\xspace}
  \providecommand*\KOMAScript{KOMA-Script\xspace}
  \providecommand*\url[1]{\texttt{#1}}
  \providecommand*\texorpdfstring[2]{#1}
}
\endinput
%%
%% End of file `tudscrdoc.cls'.