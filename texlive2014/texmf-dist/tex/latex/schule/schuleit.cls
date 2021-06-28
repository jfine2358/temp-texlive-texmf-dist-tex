%%
%% This is file `schuleit.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% schule.dtx  (with options: `schuleit.cls,package')
%% Copyright (C)
%% 2010, 2011, 2012, 2013, 2014
%% Johannes Pieper (johannes_pieper@yahoo.de)
%% Johannes Kuhaupt (kujohann@seminar.ham.nw.schule.de)
%% Andre Hilbig (mail@andrehilbig.de)
%% 
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Johannes Pieper.
%% 
%% This work consists of the files schule.dtx and schule.ins, readme
%% and the derived files schule.sty, schulinf.sty, syntaxdi.sty,
%% relaycircuit.sty, schulphy.sty, schulekl.cls, schuleub.cls,
%% schullzk.cls, schuleab.cls, schulein.cls, schuleue.cls, schullsg.cls,
%% schulit.cls, schulekl.sty, schulelzk.sty.
%% 
%% Dies ist der dokumentierte Makrocode zur Erzeugung und Dokumentation
%% des LaTeX-Paket `schule'.
%% 
%% This is the documented Macrocode to build the LaTeX-Package `schule'
%% and its documentation.
%% 
%% Some of the examples in the documentation have different copyright
%% notes.
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{schuleit}[2014/05/04 v1.1 %
                         Vorlage für ein Leitprogramm]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,openany,chapterprefix,bibtotoc,numbers=noendperiod,parskip=half]{scrreprt}
\RequirePackage{schule}
\RequirePackage{mdframed}
\RequirePackage{scrpage2}
\pagestyle{scrheadings}
\clearscrheadfoot
\cfoot[\pagemark]{\pagemark}
\definecolor{chapter}{rgb}{0,0.25,0.56}
\definecolor{section}{rgb}{0.54,0.66,0.83}
\definecolor{LightGrey}{rgb}{0.9,0.9,0.9}

\definecolor{grey1}{rgb}{.1,.1,.1}
\definecolor{grey2}{rgb}{.2,.2,.2}
\definecolor{grey3}{rgb}{.3,.3,.3}
\definecolor{grey4}{rgb}{.4,.4,.4}
\definecolor{grey5}{rgb}{.5,.5,.5}
\definecolor{grey7}{rgb}{.7,.7,.7}
\definecolor{grey8}{rgb}{.8,.8,.8}
\definecolor{grey9}{rgb}{.9,.9,.9}

\newcommand{\uebungBild}{
\begin{tikzpicture}[y=0.80pt, x=0.8pt,yscale=-1, inner sep=0pt, outer sep=0pt]
\path[draw=grey5,fill=grey7,line join=miter,line cap=butt,line width=0.209pt] (12.0208,0.5895) -- (1.3666,3.8375) -- (3.3843,20.6431) -- (20.4113,14.4179) -- cycle;
\path[draw=grey1,fill=grey9,line join=round,line cap=butt,line width=0.209pt] (7.1932,6.1991) -- (15.9622,12.7759) -- (16.8321,11.7667) -- (7.8544,5.3292) -- cycle;
\path[draw=grey1,fill=grey3,line join=round,line cap=butt,line width=0.209pt] (7.8544,5.3292) -- (5.9231,4.7550) -- (7.1932,6.1991) -- cycle;
\end{tikzpicture}
}

\newcommand{\hinweisBild}{
\begin{tikzpicture}[y=0.80pt, x=0.8pt,yscale=-1, inner sep=0pt, outer sep=0pt]
\path[draw=black,fill=grey2,line join=miter,line cap=butt,miter limit=4.00,line width=0.160pt] (6.4521,1.4334) -- (7.4295,0.4560) .. controls (7.9473,0.7196) and (8.1724,0.8553) .. (9.3447,1.4053) .. controls (9.3447,1.4053) and (9.4550,2.1225) .. (9.7278,3.7868) .. controls (9.7547,3.9511) and (10.4938,7.4506) .. (10.4938,7.4506) .. controls (10.4938,7.4506) and (11.0227,10.4067) .. (11.5264,11.8139) .. controls (11.7222,12.3609) and (12.1912,12.8073) .. (12.2925,13.3794) .. controls (12.3294,13.5882) and (12.2747,13.8058) .. (12.2258,14.0122) .. controls (12.1526,14.3214) and (12.0628,14.5394) .. (11.8899,14.9041) .. controls (11.5477,15.6258) and (10.6101,16.3538) .. (10.6271,16.2438);
\path[draw=black,fill=grey8,line join=round,line cap=butt,line width=0.200pt] (5.8974,0.5893) -- (7.4295,0.4519) .. controls (8.0049,6.9583) and (10.9185,15.1671) .. (10.8935,15.6401) .. controls (10.8820,15.8585) and (10.8157,16.1331) .. (10.6271,16.2438) .. controls (10.4156,16.3680) and (10.0239,16.3854) .. (9.8943,16.1772) .. controls (8.7782,14.3840) and (8.5425,12.9279) .. (8.0291,11.2477) .. controls (7.4491,9.3496) and (7.0458,7.3997) .. (6.6635,5.4522) .. controls (6.3474,3.8419) and (5.8974,0.5893) .. (5.8974,0.5893) -- cycle;
\path[draw=black,fill=black,line join=round,line cap=butt,miter limit=4.00,line width=0.160pt] (13.0918,15.9107) -- (13.6664,17.7926) -- (13.0575,20.6334) -- (11.7179,19.3081) -- (13.0918,15.9107);
\path[draw=black,fill=grey4,line join=round,line cap=butt,miter limit=4.00,line width=0.160pt] (13.0918,15.9107) -- (12.1925,18.0424) -- (10.8935,18.0424) -- (12.3258,15.7775) -- cycle;
\path[draw=black,fill=grey8,line join=round,line cap=butt,miter limit=4.00,line width=0.160pt] (10.8935,18.0424) .. controls (10.8935,18.0424) and (11.1714,19.7148) .. (11.1600,19.6412) .. controls (11.0947,19.2217) and (11.1324,20.0124) .. (11.7262,20.8070) .. controls (11.9101,21.0529) and (12.7921,20.8070) .. (12.9586,20.7403) .. controls (13.1251,20.6737) and (12.9586,19.3414) .. (12.9586,19.3414) -- (12.1925,18.0424) -- cycle;
\end{tikzpicture}
}

\addtokomafont{chapter}{\color{chapter}}
\addtokomafont{section}{\color{section}}

\newmdenv[backgroundcolor=LightGrey,linewidth=0pt]{grey@Frame}

\makeatletter% siehe FAQ (aber wirklich nachsehen!)
\newcommand*{\headingpar}{\par\nobreak\@afterheading}
\makeatother% siehe FAQ

\newenvironment{greyFrame}[2]%
{\begin{grey@Frame}#1\raisebox{+0.9ex}{\begin{large}#2\end{large}}\vspace*{-0.2cm}\headingpar}%
{\end{grey@Frame}}

\newcounter{aufgabe}[chapter]
\newenvironment{Aufgabe}
{\stepcounter{aufgabe}\label{aufg\arabic{chapter}\arabic{aufgabe}}
\begin{greyFrame}{\uebungBild{}}{Aufgabe \arabic{chapter}.\arabic{aufgabe}}}
{\end{greyFrame}}

\newcounter{aufgabennr}[chapter]
\newenvironment{Aufgaben}%
{\begin{greyFrame}{\uebungBild{}}{Aufgaben}\headingpar\begin{Form}\headingpar\begin{enumerate}\setcounter{enumi}{\theaufgabennr}\renewcommand{\labelenumi}{\arabic{chapter}.\arabic{enumi}}}%
{\setcounter{aufgabennr}{\theenumi}\end{enumerate}\end{Form}\end{greyFrame}}%

\newenvironment{Hinweis}
{\begin{greyFrame}{\hinweisBild{}}{Hinweis}}
{\end{greyFrame}}

\newcommand{\TextFeld}[1]{\newline\TextField[width=.93\textwidth, height=#1,multiline=true,borderwidth=0]{}}%

\newcounter{loesungnr}
\newcommand{\Loesung}[1]{
\global\expandafter\edef\csname loesungname\theloesungnr\endcsname{\arabic{chapter}.\arabic{enumi}}
\global\expandafter\def\csname loesung\theloesungnr\endcsname{#1}
\addtocounter{loesungnr}{1}
}

\newcounter{zeigenr}%
\newcommand{\loesungzeigen}{
\begin{description}
\whiledo {\value{zeigenr} < \value{loesungnr}}{
\item[\expandafter\csname loesungname\thezeigenr\endcsname]
\expandafter\csname loesung\thezeigenr\endcsname\par%
\stepcounter {zeigenr}
}
\end{description}}

\endinput
%%
%% End of file `schuleit.cls'.
