%%
%% This is file `dfgproposal.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% dfgproposal.dtx  (with options: `cls')
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{dfgproposal}[2009/06/27 v0.6 DFG Proposal]
\newif\ifsubmit\submitfalse
\newif\ifpublic\publicfalse
\newif\ifkeys\keysfalse
\newif\ifwork@areas\work@areastrue
\newif\if@RAM\@RAMtrue
\DeclareOption{submit}{\submittrue}
\DeclareOption{public}{\publictrue\excludecomment{private}}
\DeclareOption{noworkareas}{\work@areasfalse}
\DeclareOption{noRAM}{\@RAMfalse}
\DeclareOption{keys}{\keystrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[a4paper,twoside]{article}
\RequirePackage{dcm}
\RequirePackage{amssymb}
\RequirePackage{url}
\RequirePackage{graphicx}
\RequirePackage{colortbl}
\RequirePackage{xcolor}
\RequirePackage{rotating}
\RequirePackage{fancyhdr}
\RequirePackage{array}
\RequirePackage{xspace}
\RequirePackage{eurosym}
\RequirePackage{comment}
\RequirePackage{tikz}
\RequirePackage{paralist}
\RequirePackage{a4wide}
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage[scaled=.90]{helvet}
\RequirePackage{textcomp}
\RequirePackage[USenglish,ngerman]{babel}
\RequirePackage{biblatex}
\RequirePackage[a4paper=true,bookmarks=true,linkcolor=blue,
 citecolor=blue,urlcolor=blue,colorlinks=true,
 breaklinks=true, bookmarksopen=true]{hyperref}
\ifsubmit
\RequirePackage[hide]{ed}
\RequirePackage[final,today]{svninfo}
\else
\RequirePackage[show]{ed}
\RequirePackage[eso-foot,today]{svninfo}
\fi
\ifpublic\excludecomment{private}\else\includecomment{private}\fi
\setcounter{secnumdepth}{3}
\newif\ifofpage\ofpagefalse
\fancyhead[RE,LO]{\dfg@gen@acronym}
\fancyhead[LE,RO]{page~\thepage\ifofpage~of~\euref@num{prop}{page}{last}\fi}
\pagestyle{fancyplain}
\newif\if@sites\@sitesfalse\let\dfg@gen@sites=\relax
\define@key{dfg@gen}{site}{\@sitestrue\@dmp{site=#1}%
\@ifundefined{dfg@gen@sites}{\xdef\dfg@gen@sites{#1}}{\xdef\dfg@gen@sites{\dfg@gen@sites,#1}}
\define@key{workpackage}{#1RM}{\dfg@def\wp@id{#1}{RM}{##1}}
\if@RAM\define@key{workpackage}{#1RAM}{\dfg@def\wp@id{#1}{RAM}{##1}}\fi}
\define@key{dfg@gen}{PI}{\@dmp{PI=#1}%
\@ifundefined{dfg@gen@PIs}{\xdef\dfg@gen@PIs{#1}}{\xdef\dfg@gen@PIs{\dfg@gen@PIs,#1}}}
\define@key{dfg@gen}{pubspage}{\@ifundefined{dfg@gen@pubspages}%
{\xdef\dfg@gen@pubspages{#1}}{\xdef\dfg@gen@pubspages{\dfg@gen@pubspages,#1}}}
\define@key{dfg@gen}{instrument}{\def\dfg@gen@instrument{#1}\@dmp{inst=#1}}
\define@key{dfg@gen}{title}{\def\dfg@gen@title{#1}}
\define@key{dfg@gen}{thema}{\def\dfg@gen@thema{#1}}
\define@key{dfg@gen}{acronym}{\gdef\dfg@gen@acronym{#1}\@dmp{acro=#1}}
\define@key{dfg@gen}{acrolong}{\def\dfg@gen@acrolong{#1}}
\define@key{dfg@gen}{discipline}{\def\dfg@gen@discipline{#1}}
\define@key{dfg@gen}{areas}{\def\dfg@gen@areas{#1}}
\define@key{dfg@gen}{start}{\def\dfg@gen@start{#1}}
\define@key{dfg@gen}{months}{\def\dfg@gen@months{#1}}
\define@key{dfg@gen}{fundedperiod}{\def\dfg@gen@fundedperiod{#1}}
\define@key{dfg@gen}{reportperiod}{\def\dfg@gen@reportperiod{#1}}
\define@key{dfg@gen}{key}{\@dmp{key=#1}%
\@ifundefined{dfg@gen@keys}{\xdef\dfg@gen@keys{#1}}{\xdef\dfg@gen@keys{\dfg@gen@keys,#1}}}
\def\dfg@gen@acro{ACRONYM}
\def\dfg@gen@months{???}
\def\dfg@gen@title{Proposal Title}
\def\dfg@gen@instrument{Neuantrag auf Sachbeihilfe}
\def\dfg@gen@thema{??? Thema ???}
\long\def\deu#1{#1}
\def\dfg@applicants@table%
{\begin{tabular}{|l|*{\the@PIs}{l|}}\hline
  \dcm@bitabline\dfg@gen@PIs{personaltitle}{ }{name}\\
  \dcm@tabline\dfg@gen@PIs{academictitle}\\
  \dcm@tabline\dfg@gen@PIs{birthdate}\\\hline
  &\multicolumn{\the@PIs}{|l|}{\textbf{Work Address\deu{ (Dienstanschrift)}:}}\\\hline
  \dcm@tabline\dfg@gen@PIs{affiliation}\\
  \dcm@tabline\dfg@gen@PIs{workaddress}\\
  \dcm@atabline\dfg@gen@PIs{Tel: }{worktel}\\
  \dcm@atabline\dfg@gen@PIs{Fax: }{workfax}\\
  \dcm@tabline\dfg@gen@PIs{email}\\\hline
  &\multicolumn{\the@PIs}{|l|}{\textbf{Private Address\deu{ (Privatanschrift)}:}} \\\hline
  \dcm@tabline\dfg@gen@PIs{privaddress}\\
  \dcm@atabline\dfg@gen@PIs{Tel: }{privtel}\\\hline
\end{tabular}}
\def\dfg@applicants{\subsection{Applicants \deu{(Antragsteller)}}
\dfg@applicants@table}
\def\dfg@topic{\deu{\subsection{Topic (Thema)}\dfg@gen@thema}}
\def\dfg@area@field{%
\subsection{Research area and field of work \deu{(Fachgebiet und Arbeitsrichtung)}}
Scientific discipline:  \dfg@gen@discipline\\
Fields of work:  \dfg@gen@areas}
\newenvironment{dfg@titlepage}
{\thispagestyle{empty}\setcounter{page}{0}%
\begin{center}}
{\newcounter{@PIs}\@for\@I:=\dfg@gen@PIs\do{\stepcounter{@PIs}}
  \newcounter{@sites}\@for\@I:=\dfg@gen@sites\do{\stepcounter{@sites}}
\begin{tabular}{c*{\the@PIs}{c}}
\dcm@tabline\dfg@gen@PIs{name}\\
\dcm@tabline\dfg@gen@PIs{affiliation}
\end{tabular}\\[2cm]
\end{center}
\setcounter{tocdepth}{1}\tableofcontents\newpage\setcounter{page}{1}}
\newenvironment{proposal}[1][]
{\ofpagetrue\setkeys{dfg@gen}{#1}
\if@sites\else
\define@key{workpackage}{RM}{\dfg@def{wp}\wp@id{RM}{##1}\@dmp{RM=##1}}
\if@RAM\define@key{workpackage}{RAM}{\dfg@def{wp}\wp@id{RAM}{##1}\@dmp{RAM=##1}}\fi
\fi
\begin{dfg@titlepage}
  {\LARGE \dfg@gen@instrument}\\[.2cm]
  {\LARGE\textbf{\dfg@gen@title}}\\[.3cm]
  {\LARGE Acronym: {\dfg@gen@acronym}}\\[.2cm]
  {\large\today}\\[1em]
\end{dfg@titlepage}
\section{General Information \deu{(Allgemeine Angaben)}}
\dfg@applicants
\dfg@topic
\dfg@area@field
\subsection{Anticipated total duration \deu{(Voraussichtliche
    Gesamtdauer)}}\dfg@gen@months\quad Months
\subsection{Application period \deu{(Antragszeitraum)}}\dfg@gen@start
\selectlanguage{USenglish}}
{\thispagestyle{empty}\signatures
\section{List of Attachments \deu{(Verzeichnis der Anlagen)}}
\begin{itemize}
\@for\@I:=\dfg@gen@PIs\do{%
\item Curriculum Vitae and list of publications for
  \@nameuse{dcm@person@\@I @personaltitle}
  \@nameuse{dcm@person@\@I @name}
 (CD + printed version)}
\item Publications either cited in section~\ref{sec:ourpubs} or occurring in one of the
  curricula vitae (CD only)
\end{itemize}
\dfg@def{prop}{page}{last}{\thepage}\ofpagefalse
\newpage
\printbibliography[heading=warnpubs]}
\defbibheading{warnpubs}{\section*{References}%
  \@ifundefined{dfg@gen@pubspages}
  {\@latex@warning{No publication pages specified;
                   use the pubspage key in the proposal environment!}}
  {Many of the proposers' publications are online at one of the following URIs:
 \@for\@I:=\dfg@gen@pubspages\do{\par\noindent\url{\@I}}}}
\newenvironment{finalreport}[1][]
{\ofpagetrue\setkeys{dfg@gen}{#1}
\begin{dfg@titlepage}
  {\LARGE Final Project Report}\\[.2cm]
  {\LARGE\textbf{\dfg@gen@title}}\\[.3cm]
  {\LARGE Acronym: {\dfg@gen@acronym}}\\[.2cm]
  {\large Reference number(s): \@ifundefined{dfg@gen@keys}{??:???? ?/?}{\dfg@gen@keys}}\\[.2cm]
  {\large\today}\\[1em]
\end{dfg@titlepage}
\section{General Information \deu{(Allgemeine Angaben)}}
\dfg@applicants
\dfg@topic
\subsection{Funding Period \deu{(F\"orderzeitraum)}}\dfg@gen@fundedperiod
\subsection{Report Period \deu{(Berichtszeitraum)}}\dfg@gen@reportperiod
\selectlanguage{USenglish}}
{\dfg@def{prop}{page}{last}{\thepage}\ofpagefalse}
\newenvironment{Summary}{\subsection{Summary \deu{(Zusammenfassung)}}}{}
\newenvironment{Abriss}%
{\selectlanguage{ngerman}\subsection*{Zusammenfassung (dt. Version)}}
{\selectlanguage{USenglish}}
\def\dfg@def#1#2#3#4{%\@dfg@def{#1}{#2}{#3}{#4}%
  \protected@write\@auxout{}{\string\@dfg@def{#1}{#2}{#3}{#4}}}
\ifwork@areas
\define@key{workarea}{id}{\def\wa@id{#1}\@dmp{id=#1}}
\define@key{workarea}{title}{\dfg@def{wa}\wa@id{title}{#1}}
\define@key{workarea}{short}{\dfg@def{wa}\wa@id{short}{#1}}
\fi
\define@key{workpackage}{id}{\def\wp@id{#1}\@dmp{id=#1}}
\define@key{workpackage}{title}{\dfg@def{wp}\wp@id{title}{#1}}
\define@key{workpackage}{lead}{\dfg@def{wp}\wp@id{lead}{#1}\def\wp@lead{#1}\@dmp{lead=#1}}
\define@key{workpackage}{short}{\dfg@def{wp}\wp@id{short}{#1}}
\def\wp@mk@title#1{Work Package {#1}}
\def\wp@label#1{WP{#1}}
\ifwork@areas
\def\wa@label#1{WA{#1}}
\def\wa@mk@title#1{Work Area {#1}}
\fi
\ifwork@areas\newcounter{wa}\newcounter{wp}[wa]\else\newcounter{wp}\fi
\newcounter{allwp}
\def\update@wps#1{\@ifundefined{@wps}{\xdef\@wps{#1}}{\xdef\@wps{\@wps,#1}}}
\def\update@tasks#1{\@ifundefined{@tasks}{\xdef\@tasks{#1}}{\xdef\@tasks{\@tasks,#1}}}
\def\update@deps#1{\@ifundefined{task@deps}{\xdef\task@deps{#1}}{\xdef\task@deps{\task@deps,#1}}}
\ifwork@areas\def\update@was#1{\@ifundefined{@was}{\xdef\@was{#1}}{\xdef\@was{\@was,#1}}}\fi
\newcounter{wp@RM}
\if@RAM\newcounter{wp@RAM}\fi
\newenvironment{workpackage}[1][]%
{\setkeys{workpackage}{#1}\stepcounter{wp}\stepcounter{allwp}%
\let\@tasks=\relax%
\edef\wp@num{\ifwork@areas\thewa.\fi\thewp}%
\dfg@def{wp}\wp@id{label}{\wp@label\wp@num}%
\dfg@def{wp}\wp@id{number}{\thewp}%
\dfg@def{wp}\wp@id{page}{\thepage}%
\update@wps\wp@id%
\edef\wp@num{\ifwork@areas\thewa.\fi\thewp}%
\dfg@def{wp}{\wp@id}{num}{\thewp}%
\if@sites%
{\let\G@refundefinedtrue=\relax\let\@latex@warning=\relax%
\xdef\sites@line{Site}\xdef\efforts@line{Effort}%initialize lines
\setcounter{wp@RM}{0}%
\if@RAM\setcounter{wp@RAM}{0}\fi%
\@for\@site:=\dfg@gen@sites\do{%
\xdef\sites@line{\sites@line&\@site\ifx\@site\wp@lead~(lead)\fi}%
\xdef\efforts@line{\efforts@line&\euref\wp@id\@site{RM}\if@RAM+\euref\wp@id\@site{RAM}\fi}%
\edef\@RM{\euref@num\wp@id\@site{RM}}\addtocounter{wp@RM}{\@RM}%
\if@RAM\edef\@RAM{\euref@num\wp@id\@site{RAM}}\addtocounter{wp@RAM}{\@RAM}\fi}}%
\dfg@def{wp}\wp@id{RM}{\thewp@RM}%
\if@RAM\dfg@def{wp}\wp@id{RAM}{\thewp@RAM}\fi%
\bigskip\noindent\begin{tabular}{|l||l|*{\the@sites}{c|}}\hline%
\textbf{\wp@mk@title{\wp@num}}&\sites@line\\\hline%
\textsf{\dfg@target{wp}{\wp@id}{\euref{wp}\wp@id{title}}} &\efforts@line\\\hline%
\end{tabular}\smallskip\par\noindent\ignorespaces%
\else% if@sites
\subsubsection*{\wp@mk@title{\wp@num}: \dfg@target{wp}{\wp@id}{\euref{wp}\wp@id{title}}
(\euref@safe{wp}\wp@id{RM} RM\if@RAM+\euref{wp}\wp@id{RAM} RAM\fi)}%
\fi}%
{\@ifundefined{@tasks}{}{\dfg@def{\wp@id}{task}{ids}\@tasks}}
\newcounter{dfg@RM}\if@RAM\newcounter{dfg@RAM}\fi
\ifwork@areas
\newcounter{wa@RM}\if@RAM\newcounter{wa@RAM}\fi\newcounter{wa@wps}
\newenvironment{workarea}[1][]
{\setkeys{workarea}{#1}
\let\@wps=\relax
\stepcounter{wa}
\dfg@def{wa}{\wa@id}{label}{\wa@label\thewa}
\dfg@def{wa}{\wa@id}{number}{\thewa}
\dfg@def{wa}{\wa@id}{page}{\thepage}
\update@was{\wa@id}
\dfg@def{wa}{\wa@id}{num}{\thewa}
\setcounter{wa@RM}{0}\if@RAM\setcounter{wa@RAM}{0}\fi\setcounter{wa@wps}{0}
\if@sites
\@for\@site:=\dfg@gen@sites\do{%
\edef\@@wps{\euref@aux\wa@id{wp}{ids}}
\@for\@wp:=\@@wps\do{%
   \edef\@RM{\euref@num\@wp\@site{RM}}
   \if@RAM\edef\@RAM{\euref@num\@wp\@site{RAM}}\fi
   \addtocounter{wa@RM}{\@RM}\addtocounter{dfg@RM}{\@RM}
   \if@RAM\addtocounter{wa@RAM}{\@RAM}\addtocounter{dfg@RAM}{\@RAM}\fi}}
\else
\edef\@@wps{\euref@aux\wa@id{wp}{ids}}
\@for\@wp:=\@@wps\do{%
  \edef\@RM{\euref@num{wp}\@wp{RM}}
 \if@RAM\edef\@RAM{\euref@num{wp}\@wp{RAM}}\fi
  \stepcounter{wa@wps}
  \addtocounter{wa@RM}{\@RM}\addtocounter{dfg@RM}{\@RM}
  \if@RAM\addtocounter{wa@RAM}{\@RAM}\addtocounter{dfg@RAM}{\@RAM}\fi}
\fi
\dfg@def{wa}\wa@id{RM}\thewa@RM
\dfg@def{dfg}{all}{RM}\thedfg@RM
\if@RAM
\dfg@def{wa}\wa@id{RAM}\thewa@RAM
\dfg@def{dfg}{all}{RAM}\thedfg@RAM
\fi
\subsection*{{\wa@mk@title\thewa}: {\dfg@target{wa}\wa@id{\euref{wa}\wa@id{title}}}}}
{\@ifundefined{@wps}{}{\dfg@def\wa@id{wp}{ids}\@wps}\dfg@def\wa@id{wp}{count}\thewa@wps}\fi
\newenvironment{workplan}%
{\ifwork@areas\let\@was=\relax\else\let\@wps=\relax\fi}%
{\@ifundefined{task@deps}{}{\dfg@def{all}{task}{deps}{\task@deps}}
\ifwork@areas
\@ifundefined{@was}{}{\dfg@def{all}{wa}{ids}\@was}
\else
\@ifundefined{@wps}{}{\dfg@def{all}{wp}{ids}\@wps}
\fi
\ifwork@areas\dfg@def{all}{wa}{count}{\thewa}\fi
\ifwork@areas\dfg@def{all}{wp}{count}{\theallwp}\fi}
\def\dfg@target#1#2#3{\hypertarget{#1@#2@target}{#3}}
\newenvironment{tasklist}
{\begin{compactenum}}{\end{compactenum}}
\def\task@label#1{T#1}
\define@key{task}{id}{\def\task@id{#1}\@dmp{id=#1}}
\define@key{task}{start}{\def\task@start{#1}\@dmp{start=#1}}
\define@key{task}{len}{\def\task@len{#1}\@dmp{len=#1}}
\define@key{task}{force}{\def\task@force{#1}\@dmp{f=#1}}
\define@key{task}{requires}{\@requires\task@id{#1}\@dmp{req=#1}}
\define@key{task}{title}{\def\task@title{#1}\@dmp{title=#1}}
\def\task@set#1{\edef\task@id{task\thetask@all}
\def\task@force{1}
\let\task@start=\relax\let\task@len=\relax
\setkeys{task}{#1}}
\newenvironment{task}[1][]
{\@task{#1}\item[\dfg@target{task}{\taskin\task@id\wp@id}{\task@label{\thetask@wp}}]%
\@ifundefined{task@title}{}{\textbf{\task@title}}}
{}
\newcounter{task@all}\newcounter{task@wp}[wp]
\newcount\task@@end
\def\@task#1{\stepcounter{task@all}\stepcounter{task@wp}
  \task@set{#1}
  \@ifundefined{task@start}%
 {\protect\G@refundefinedtrue\@latex@warning{start of task #1 undefined}}%
  {\dfg@def{task}{\taskin\task@id\wp@id}{start}\task@start}
  \@ifundefined{task@len}%
 {\protect\G@refundefinedtrue\@latex@warning{length of task #1 undefined}}%
  {\dfg@def{task}{\taskin\task@id\wp@id}{len}\task@len}
  \dfg@def{task}{\taskin\task@id\wp@id}{force}\task@force
  \dfg@def{task}{\taskin\task@id\wp@id}{label}{\task@label\thetask@wp}%
  \dfg@def{task}{\taskin\task@id\wp@id}{number}{\thetask@wp}%
  \dfg@def{task}{\taskin\task@id\wp@id}{page}{\thepage}%
 \update@tasks{\taskin\task@id\wp@id}}
\def\workphase#1{\@task{#1}}
\def\localtaskref#1{\euRef{task}{\wp@id @#1}{label}}
\def\taskin#1#2{#2@#1}
\def\taskref#1#2{\WPref{#1}\euRef{task}{#1@#2}{label}}
\def\tasktref#1#2{\WPref{#1} (Task \euRef{task}{#1@#2}{number})}
\newcounter{gantt@deps}
\def\@requires#1#2{\stepcounter{gantt@deps}%
\edef\dep@id{taskdep\thegantt@deps}%
\dfg@def{taskdep}\dep@id{from}{\taskin{#1}\wp@id}%
\dfg@def{taskdep}\dep@id{to}{#2}%
\update@deps\dep@id}
\defbibheading{empty}{}
\def\dfgprojpapers#1{%
\subsection{Project-Related List of Publications}\label{sec:ourpubs}
\begin{refsection}
\nocite{#1}
\printbibliography[heading=empty]
\end{refsection}}
\def\@dfg@def#1#2#3#4{\expandafter\gdef\csname #1@#2@#3\endcsname{#4}}
\def\euref#1#2#3{\@ifundefined{#1@#2@#3}%
               {\protect\G@refundefinedtrue\@latex@warning{#3 for #1 #2 undefined}??}%
                {\csname #1@#2@#3\endcsname}}%
\def\euref@aux#1#2#3{\@ifundefined{#1@#2@#3}{??}{\csname #1@#2@#3\endcsname}}%
\def\euref@num#1#2#3{\@ifundefined{#1@#2@#3}{0}{\csname #1@#2@#3\endcsname}}%
\def\euref@safe#1#2#3{\@ifundefined{#1@#2@#3}{}{\csname #1@#2@#3\endcsname}}%
\def\euRef#1#2#3{\@ifundefined{#1@#2@#3}%
{\protect\G@refundefinedtrue\@latex@warning{#3 for #1 #2 undefined}??}%
{\hyperlink{#1@#2@target}{\csname #1@#2@#3\endcsname}}}
\def\WPref#1{\euRef{wp}{#1}{label}}
\def\WPtref#1{\euRef{wp}{#1}{label}: \euRef{wp}{#1}{title}}
\ifwork@areas
\def\WAref#1{\euRef{wa}{#1}{label}}
\def\WAtref#1{\euRef{wa}{#1}{label}: \euRef{wa}{#1}{title}}
\fi
\def\@count #1{\ifcase #1 zero\or one\or two\or three\or four\or five\or six\or seven \or
  eight\or nine\or ten\or eleven \or twelve\else#1\fi}
\def\dfgcount#1#2{\@count{\euref@num{#1}{#2}{count}}}
\def\dfg@lead#1{\@ifundefined{wp@#1@lead}%
{\protect\G@refundefinedtrue\@latex@warning{lead for WP #1 undefined}??}%
{\csname wp@#1@lead\endcsname}}
\def\wa@style#1{\cellcolor{lightgray}{\textbf{#1}}}
\def\wp@style#1{#1}
\if@RAM
\newenvironment{wptable}%
{\begin{tabular}{|l|l|l|l|l|}\hline%
    \textbf{\ifwork@areas{WA/P}\else{WP}\fi}&
    \textbf{Title}&
    \textbf{p.}&
    \textbf{RM} &
    \textbf{RAM}\\\hline\hline}
{\end{tabular}}
\else
\newenvironment{wptable}%
{\begin{tabular}{|l|l|l|l|}\hline%
    \textbf{\ifwork@areas{WA/P}\else{WP}\fi}&
    \textbf{Title}&
    \textbf{p.}&
    \textbf{RM}\\\hline\hline}
{\end{tabular}}
\fi
\define@key{wpfig}{size}{\def\wpfig@size{#1}\@dmp{size=#1}}
\def\@sw#1{\begin{sideways}#1\end{sideways}}
\newcommand{\wpfig}[1][]{\setkeys{wpfig}{#1}
\newcount\@@@RM\if@RAM\newcount\@@@RAM\fi
{\gdef\@wp@lines{}%initialize
\let\tabularnewline\relax\let\hline\relax\let\cellcolor\relax% so they
\let\wa@style\relax\let\wp@style\relax \let\@sw\relax\let\textbf\relax% do not
\let\G@refundefinedtrue=\relax\let\@latex@warning=\relax\let\hyperlink=\relax% bother us
\gdef\wpfig@headline{\textbf{\ifwork@areas{WA/P}\else{WP}\fi}&\textbf{Title}&\textbf{p.}}
\if@sites
\@for\@site:=\dfg@gen@sites\do{\xdef\wpfig@headline{\wpfig@headline&\@sw{\@site\ RM}\if@RAM&\@sw{\@site\ RAM}\fi}}
\else
\xdef\wpfig@headline{\wpfig@headline &\@sw{RM}\if@RAM&\@sw{RAM}\fi}
\fi
\edef\@@was{\euref@safe{all}{wa}{ids}}%
\@for\@@wa:=\@@was\do{% iterate over the work areas
\xdef\@@wa@line{\wa@style{\euRef{wa}\@@wa{label}}&
\wa@style{\@ifundefined{wa@\@@wa @short}{\euref{wa}\@@wa{title}}{\euref{wa}\@@wa{short}}}&
\wa@style{\euref{wa}\@@wa{page}}}
\if@sites
\@for\@site:=\dfg@gen@sites\do{\@@@RM=0\if@RAM\@@@RAM=0\fi
\edef\@@wps{\euref@safe\@@wa{wp}{ids}}%
\@for\@@wp:=\@@wps\do{% compute the WA efforts
\advance\@@@RM by \euref@num\@@wp\@site{RM}%
\if@RAM\advance\@@@RAM by \euref@num\@@wp\@site{RAM}\fi}
\xdef\@@wa@line{\@@wa@line&\wa@style{\the\@@@RM}\if@RAM&\wa@style{\the\@@@RAM}\fi}}
\else
\@@@RM=0\if@RAM\@@@RAM=0\fi
\edef\@@wps{\euref@safe{all}{wp}{ids}}%
\@for\@@wp:=\@@wps\do{% compute the  efforts
\advance\@@@RM by \euref@num{wp}\@@wp{RM}%
\if@RAM\advance\@@@RAM by \euref@num{wp}\@@wp{RAM}\fi}
\xdef\@@wa@line{\@@wa@line&\wa@style{\euref{wa}\@@wa{RM}}
\if@RAM&\wa@style{\euref{wa}\@@wa{RAM}}\fi}%
\fi
\xdef\@wp@lines{\@wp@lines\@@wa@line\tabularnewline\hline}% add the line for the workarea
\edef\@@wps{\euref@safe\@@wa{wp}{ids}}%
\@for\@@wp:=\@@wps\do{% iterate over its work packages
\xdef\@@wp@line{\euRef{wp}\@@wp{label}&
\@ifundefined{wp@\@@wp @short}{\euref{wp}\@@wp{title}}{\euref{wp}\@@wp{short}}&
\euref{wp}\@@wp{page}}
\if@sites
\@for\@site:=\dfg@gen@sites\do{%
\xdef\@@wp@line{\@@wp@line&\wp@style{\euref\@@wp\@site{RM}}\if@RAM&\wp@style{\euref\@@wp\@site{RAM}}\fi}}%
\else
\xdef\@@wp@line{\@@wp@line&\wp@style{\euref{wp}\@@wp{RM}}\if@RAM&\wp@style{\euref{wp}\@@wp{RAM}}\fi}%
\fi
\xdef\@wp@lines{\@wp@lines\@@wp@line\tabularnewline\hline}}}
\gdef\@totals{}
\if@sites
\@for\@site:=\dfg@gen@sites\do{\@@@RM=0\if@RAM\@@@RAM=0\fi
\edef\@@was{\euref@safe{all}{wa}{ids}}%
\@for\@@wa:=\@@was\do{%
\edef\@@wps{\euref@safe\@@wa{wp}{ids}}%
\@for\@@wp:=\@@wps\do{% iterate over the work areas
\advance\@@@RM by \euref@num\@@wp\@site{RM}%
\if@RAM\advance\@@@RAM by \euref@num\@@wp\@site{RAM}\fi}}
\xdef\@totals{\@totals & \textbf{\the\@@@RM}\if@RAM& \textbf{\the\@@@RAM}\fi}}
\else
\@@@RM=0\if@RAM\@@@RAM=0\fi
\edef\@@was{\euref@safe{all}{wa}{ids}}%
\@for\@@wa:=\@@was\do{\edef\@@wps{\euref@safe\@@wa{wp}{ids}}%
\@for\@@wp:=\@@wps\do{% iterate over the work areas
\advance\@@@RM by \euref@num{wp}\@@wp{RM}%
\if@RAM\advance\@@@RAM by \euref@num{wp}\@@wp{RAM}\fi}}
\xdef\@totals{&\the\@@@RM\if@RAM &\the\@@@RAM\fi}
\fi}
\begin{figure}[ht]\centering%
\if@RAM
\begin{tabular}{|l|l|l|*{\the@sites}{|r|r|}}\hline
\else
\begin{tabular}{|l|l|l|*{\the@sites}{|r|}}\hline
\fi
\wpfig@headline\\\hline\hline
\@wp@lines\hline
\multicolumn{3}{|c|}{\textbf{totals}}\@totals\\\hline
\end{tabular}
\caption{Work Areas and Work Packages [R{\if@RAM(A)\fi}M $\widehat=$ Researcher \if@RAM(Assistant)\fi Months]}\label{fig:wplist}
\end{figure}}
\newif\ifgantt@draft
\define@key{gantt}{xscale}{\def\gantt@xscale{#1}}
\define@key{gantt}{yscale}{\def\gantt@yscale{#1}}
\define@key{gantt}{step}{\def\gantt@step{#1}}
\define@key{gantt}{size}{\def\gantt@size{#1}}
\define@key{gantt}{draft}[true]{\gantt@drafttrue}
\newif\ifgantt@RMdisclaimer\gantt@RMdisclaimerfalse
\define@key{gantt}{RMdisclaimer}[true]{\gantt@RMdisclaimertrue}
\def\gantt@set#1{\gantt@draftfalse\def\gantt@xscale{1}\def\gantt@yscale{.35}\def\gantt@step{3}
\setkeys{gantt}{#1}}
\newenvironment{gantt}[1][]
{\gantt@set{#1}
\@ifundefined{gantt@size}{}{\csname\gantt@size\endcsname}
\def\gantt@wps{\euref@num{all}{wp}{count}}
\newdimen\gantt@ymonths
\gantt@ymonths=\gantt@wps cm
\advance\gantt@ymonths by .5cm
\begin{tikzpicture}[xscale=\gantt@xscale,yscale=\gantt@yscale]
\draw[xstep=\gantt@step,gray,very thin] (0,0) grid (\dfg@gen@months,\gantt@wps);
\foreach \x in {0,\gantt@step,...,\dfg@gen@months} \node at (\x,\gantt@ymonths) {\x};}
{\end{tikzpicture}}
\newdimen\gantt@ymid\newdimen\gantt@yinc\newdimen\gantt@xend
\newcommand{\@action}[5]{%\message{@action: id=#1, line=#2, start=#3, dur=#4, int=#5.}
\gantt@ymid=#2 cm\gantt@yinc=\gantt@yscale cm
\gantt@xend=#3 cm\advance\gantt@xend by #4 cm
\advance\gantt@ymid by \gantt@yinc
\fill (#3,#2) rectangle +(#4,#5);
\node (#1@left) at (#3,\gantt@ymid) {};
\node (#1@right) at (\gantt@xend,\gantt@ymid) {};}
\def\@dependency#1#2{\draw[->,line width=2pt,color=red] (#1@right) -- (#2@left);}
\newcommand{\ganttchart}[1][]{\begin{figure}[ht]\centering
\begin{gantt}[#1]
 \newcounter{taskwps}\newcount\@@line
  \edef\@@was{\euref@safe{all}{wa}{ids}}
  \@for\@@wa:=\@@was\do{% iterate over work areas
    \edef\@@wps{\euref@safe\@@wa{wp}{ids}}
    \@for\@@wp:=\@@wps\do{% iterate over work packages
      \stepcounter{taskwps}
     \@@line=\gantt@wps\advance\@@line by -\thetaskwps
      \edef\@@tasks{\euref@safe\@@wp{task}{ids}}
      \node at (-1/\gantt@xscale,\@@line) [above=-2pt] {\euRef{wp}\@@wp{label}};
      \@for\@@task:=\@@tasks\do{% iterate over work phases
      \@action\@@task\@@line
          {\euref@num{task}\@@task{start}}
          {\euref@num{task}\@@task{len}}
          {\euref@num{task}\@@task{force}}}}}
    \edef\@@deps{\euref@safe{all}{task}{deps}}
    \@for\@@dep:=\@@deps\do{\@dependency{\euref@safe{taskdep}\@@dep{from}}{\euref@safe{taskdep}\@@dep{to}}}
 \ifgantt@draft
    \newcounter{gantt@month}
    \newcount\@@e\newdimen\gantt@effort\newdimen\gantt@plus
    \@whilenum\thegantt@month<\dfg@gen@months\do{% step over months
      \gantt@effort=0cm
      \edef\@@was{\euref@safe{all}{wa}{ids}}
      \@for\@@wa:=\@@was\do{% iterate over work areas
        \edef\@@wps{\euref@safe\@@wa{wp}{ids}}
        \@for\@@wp:=\@@wps\do{% iterate over work packages
          \edef\@@tasks{\euref@safe\@@wp{task}{ids}}
          \@for\@@task:=\@@tasks\do{% iterate over work phases
            \@@e=\euref@num{task}\@@task{start}
            \advance\@@e by \euref@num{task}\@@task{len}
            \ifnum\thegantt@month<\euref@num{task}\@@task{start}\else
            \ifnum\thegantt@month<\@@e
            \gantt@plus=\euref@num{task}\@@task{force}cm
            \advance\gantt@effort by \gantt@plus\fi\fi
            \fill  (\thegantt@month,-5) rectangle +(1,\gantt@effort);}}}
     \stepcounter{gantt@month}}\fi
  \end{gantt}
  \ifgantt@RMdisclaimer
  \caption{Overview Work Package Activities}
  \else
  \caption{Overview Work Package Activities \if@RAM(the table only shows efforts
    for the junior researchers (RM))\fi}
  \fi\label{fig:activities}
\end{figure}}
\newcommand{\signatures}{\section{Signatures \deu{(Unterschriften)}}
\qquad\number\day. \number\month. \number\year\\[2ex]
\strut\qquad Date\hfill\@for\@p:=\dfg@gen@PIs\do{%
\dcm@pers@ref\@p{personaltitle}~\dcm@pers@ref\@p{name}\hfill}}
\def\@dmp#1{\ifkeys\marginpar{#1}\fi}
\def\texteuro{\officialeuro\xspace}
\endinput
%%
%% End of file `dfgproposal.cls'.
