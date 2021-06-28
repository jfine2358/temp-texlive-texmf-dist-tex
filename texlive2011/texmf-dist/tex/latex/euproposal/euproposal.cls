%%
%% This is file `euproposal.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% euproposal.dtx  (with options: `cls')
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{euproposal}[2007/06/04 v0.3 EU Proposal]

\newif\ifsubmit\submittrue
\newif\ifpublic\publicfalse
\DeclareOption{eudraft}{\submitfalse\PassOptionsToPackage{draft}{svninfo}}
\DeclareOption{submit}{\submittrue\PassOptionsToPackage{hide}{ed}}
\DeclareOption{public}{\publictrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass[a4paper]{report}
\RequirePackage{textcomp}
\RequirePackage{amssymb}
\RequirePackage{url}
\RequirePackage{lscape}
\RequirePackage{longtable}
\RequirePackage{graphicx}
\RequirePackage{calc}
\RequirePackage{colortbl}
\RequirePackage{xcolor}
\RequirePackage[show]{ed}
\RequirePackage[today,fancyhdr]{svninfo}
\RequirePackage{keyval}
\RequirePackage{array}
\RequirePackage{eurosym}
\RequirePackage{hyperref}
\def\thepart{\Alph{part}}
\setcounter{part}{2}
\def\thechapter{\thepart.\arabic{chapter}}
\def\tableofcontents{%
    \chapter*{\contentsname
        \@mkboth{\MakeUppercase{\contentsname}}%
                {\MakeUppercase{\contentsname}}}%
    \@starttoc{toc}}
\newenvironment{titlepageabstract}
{\begin{center}
  {\LARGE \eu@instrument}\\[.2cm]
  {\large \eu@call}\\[.4cm]
  {\LARGE\bf\eu@title}\\[.3cm]
  {\LARGE Acronym: {\eu@acro}}\\[.2cm]
\end{center}
{\large\bf{Date of Preparation: \today}}\\[1em]
\PartnerTable\\[.5cm]
\begin{large}
  \begin{description}
  \item[Work program topics  addressed:] \eu@topics
  \item[Coordinator:] \euc@name
  \item[e-mail:] {\url{\euc@email}}
  \item[tel/fax:] \euc@telfax
  \item [Proposal Abstract:]\small\sf}
{\end{description}\end{large}\newpage}
\def\ProposalAcronym#1{\def\eu@acro{#1}}
\def\ProposalTitle#1{\def\eu@title{#1}}
\def\ProposalCall#1{\def\eu@call{#1}}
\def\ProposalTopics#1{\def\eu@topics{#1}}
\def\ProposalInstrument#1{\def\eu@instrument{#1}}
\def\ProposalCoordinatorName#1{\def\euc@name{#1}}
\def\ProposalCoordinatorEmail#1{\def\euc@email{#1}}
\def\ProposalCoordinatorTelFax#1{\def\euc@telfax{#1}}
\def\eu@acro{ACRONYM}
\def\eu@title{Proposal Title}
\def\eu@call{ICT Call ?: FP7-???-200?-?}
\def\eu@instrument{Proposal Instrument (e.g. IP)}
\def\eu@topics{???-200?.?.? Topic1, ???-200?.?.? Topic2}
\def\euc@name{Dr. Great Coordinatorn}
\def\euc@email{g.coordinator@jacobs-university.de}
\def\euc@telfax{(+??) ??? ???? ???/-???}
\fancyhead[RE,LO]{\eu@acro}\fancyhead[LE,RO]{page~\thepage~of~\thelastpage}
\pagestyle{fancyplain}
\setcounter{secnumdepth}{3}
\AtEndDocument{%
  \clearpage
  \count@\c@page
  \advance\count@\m@ne
  \edef\@tempa{\the\count@}%
  \ifx\@tempa\thelastpage
  \else
    \ClassWarningNoLine{euproposal}{Last page changed: Rerun LaTeX}%
  \fi
  \immediate\write\@auxout{%
    \gdef\string\thelastpage{\the\count@}}}
\def\thelastpage{??}
\def\eu@write@aux#1#2#3#4{\protected@write\@auxout{}{\string\eu@def{#1}{#2}{#3}{#4}}}
\def\eu@write@delivs#1#2#3#4{\protected@write\@auxout{}{\string\eu@def{#1}{#2}{#3}{#4}}}
\define@key{wg}{id}{\def\wg@id{#1}}
\define@key{wg}{title}{\def\wg@title{#1}}
\define@key{wg}{lead}{\def\wg@lead{#1}}
\define@key{wg}{short}{\def\wg@short{#1}}
\define@key{wp}{id}{\def\wp@id{#1}}
\define@key{wp}{duration}{\def\wp@duration{#1}}
\define@key{wp}{start}{\def\wp@start{#1}}
\define@key{wp}{title}{\def\wp@title{#1}}
\define@key{wp}{type}{\def\wp@type{#1}}
\define@key{wp}{lead}{\def\wp@lead{#1}}
\define@key{wp}{short}{\def\wp@short{#1}}
\newcounter{partner}
\def\wpg@partners{}\def\wp@pms{}\def\wg@pms{}\def\eu@partner@table{}
\def\proposal@partner#1#2#3{% short, long, nationality
\stepcounter{partner}
\newcounter{wg@#1@effort}[wg]
\newcounter{total@#1@effort}
\eu@write@aux{partner}{#1}{number}{\thepartner}
\eu@write@aux{partner}{#1}{short}{#1}
\eu@write@aux{partner}{#1}{long}{#2}
\eu@write@aux{partner}{#1}{nationality}{#3}
\define@key{wp}{#1}{\expandafter\def\csname wp@#1\endcsname{##1}}
\g@addto@macro\eu@partner@table{\euref{partner}{#1}{number} & {\euref{partner}{#1}{short}} & #2 & #3\\\hline}}
\def\ProposalCoordinator#1#2#3{\proposal@partner{#1}{#2 (coordinator)}{#3}
\gdef\eu@partners{#1}
\g@addto@macro\wpg@partners{\euref{partner}{#1}{number}: \euRef{partner}{#1}{short}}
\g@addto@macro\wp@pms{\wp@pm{#1}}\g@addto@macro\wg@pms{\wg@pm{#1}}}
\def\ProposalPartner#1#2#3{\proposal@partner{#1}{#2}{#3}
\g@addto@macro\eu@partners{,#1}
\g@addto@macro\wpg@partners{&\euref{partner}{#1}{number}: \euRef{partner}{#1}{short}}
\g@addto@macro\wp@pms{&\wp@pm{#1}}\g@addto@macro\wg@pms{&\wg@pm{#1}}}
\def\PartnerTable{\begin{tabular}{|l|l|p{11cm}|l|}\hline
\# & Abbr. & Name &  Country\\\hline\hline
\eu@partner@table
\end{tabular}}
\def\wg@label#1{WG {#1}}
\def\wp@label#1{WP {#1}}
\def\wg@mk@title#1{Work Group {#1}}
\def\wp@mk@title#1{Work Package {#1}}
\newcounter{wg}
\newcounter{wp}[wg]
\newcounter{deliv}[wp]
\newcounter{wpgno}
\def\wp@efforts{\@for\@I:=\eu@partners\do{
    \def\@effort{\@ifundefined{wp@\@I}{0}{\csname wp@\@I\endcsname}}
  \addtocounter{wg@\@I @effort}{\@effort}
  \addtocounter{total@\@I @effort}{\@effort}
  \eu@write@aux{\wp@id}{\@I}{effort}{\@effort}}}
\def\wpg@write@md#1{%
\eu@write@aux{#1}{\csname #1@id\endcsname}{label}{\csname #1@label\endcsname\thewg}
\eu@write@aux{#1}{\csname #1@id\endcsname}{number}{\csname the#1\endcsname}
\eu@write@aux{#1}{\csname #1@id\endcsname}{title}{\csname #1@title\endcsname}
\eu@write@aux{#1}{\csname #1@id\endcsname}{lead}{\csname #1@lead\endcsname}
\eu@write@aux{#1}{\csname #1@id\endcsname}{short}{\csname #1@short\endcsname}}
\def\wp@write@md{%
\eu@write@aux{wp}{\wp@id}{duration}{\wp@duration}
\eu@write@aux{wp}{\wp@id}{start}{\wp@start}
\eu@write@aux{wp}{\wp@id}{type}{\wp@type}}
\def\wpg@efforts@line#1{\renewcommand{\tabcolsep}{.2em}
  \begin{tabular}{|*{\thepartner}{c|}}
    \wpg@partners\\\hline
    \csname #1@pms\endcsname\end{tabular}}
\def\update@wps#1{\@ifundefined{wg@wps}{\xdef\wg@wps{#1}}{\xdef\wg@wps{\wg@wps,#1}}}
\def\update@wgs#1{\@ifundefined{eu@wgs}{\xdef\eu@wgs{#1}}{\xdef\eu@wgs{\eu@wgs,#1}}}
\newenvironment{wpd}[1][]
{\setkeys{wp}{#1}\stepcounter{wp}\stepcounter{wpgno}
\wpg@write@md{wp}\wp@write@md\wp@efforts\update@wps{\wp@id}
\xdef\wp@nums{\wp@nums &\thewg.\thewp}
\begin{center}
\begin{tabular}{||p{\textwidth-15pt}||}\hline\hline
  {\large\textbf\wp@mk@title{\thewg.\thewp}}: {\eu@target{wp}{\wp@id}{\wp@title}}\\\hline
  \wpg@efforts@line{wp}\\\hline}
{\end{tabular}\end{center}}
\newenvironment{wgd}[1][]
{\begin{center}
\begin{tabular}{||p{\textwidth-15pt}||}\hline\hline
  {\large\textbf\wg@mk@title\thewg}: {\eu@target{wg}{\wg@id}{\wg@title}}\\\hline
  \wpg@efforts@line{wg}\\\hline}
{\end{tabular}\end{center}}
\newenvironment{workgroup}[1][]
{\setkeys{wg}{#1}\stepcounter{wg}\stepcounter{wpgno}\wpg@write@md{wg}\def\wp@nums{}
\let\wg@wps=\relax\update@wgs{\wg@id}\def\wp@nums{}
\eu@write@aux{wg}{\wg@id}{num}{\thewg}}
{\eu@write@aux{wg}{\wg@id}{wps}{\wg@wps}
 \eu@write@aux{wg}{\wg@id}{wpnums}{\wp@nums}
 \@for\@I:=\eu@partners\do{
    \eu@write@aux{\wg@id}{\@I}{effort}{\csname thewg@\@I @effort\endcsname}}}
\def\p@pm#1{\@ifundefined{wp@#1}{}{\csname wp@#1\endcsname}}
\def\wpg@gray#1{\def\@test{#1}\ifx\@test\wpg@lead\cellcolor{lightgray}{#1}\else{#1}\fi}
\def\wp@pm#1{\wpg@gray{\p@pm{#1}}}
\def\wg@pm#1{\wpg@gray{\euref{\wg@id}{#1}{effort}}}
\def\wpg@pa#1{\wpg@gray{\euRef{partner}{#1}{short}}}
\def\eu@target#1#2#3{\hypertarget{#1@#2@target}{#3}}
\def\eu@def#1#2#3#4{\expandafter\gdef\csname #1@#2@#3\endcsname{#4}}
\def\euref#1#2#3{\@ifundefined{#1@#2@#3}%
{\protect\G@refundefinedtrue\@latex@warning{#3 for #1 #2 undefined}??}%
{\csname #1@#2@#3\endcsname}}%
\def\euref@aux#1#2#3{\@ifundefined{#1@#2@#3}{??}{\csname #1@#2@#3\endcsname}}%
\def\euRef#1#2#3{\@ifundefined{#1@#2@#3}%
{\protect\G@refundefinedtrue\@latex@warning{#3 for #1 #2 undefined}??}%
{\hyperlink{#1@#2@target}{\csname #1@#2@#3\endcsname}}}
\def\eu@lead#1{\@ifundefined{wp@#1@lead}%
{\protect\G@refundefinedtrue\@latex@warning{lead for WP #1 undefined}??}%
{\edef\@partner{\csname wp@#1@lead\endcsname}\euRef{partner}{\@partner}{short}}}
\def\wpline#1{\euRef{wp}{#1}{label} &
              \euref{wp}{#1}{title} &
              \eu@lead{#1} &
              \euref{wp}{#1}{start} &
              \euref{wp}{#1}{duration} &
              \euref{wp}{#1}{type} \\\hline}
\def\wgline#1{\cellcolor{lightgray}{\euRef{wg}{#1}{label}} &
  \multicolumn{5}{c|}{\cellcolor{lightgray}{\euref{wg}{#1}{title}}}  \\\hline}
\newenvironment{wptable}{\begin{footnotesize}\begin{tabular}{|c|l|l|l|l|l|}\hline
  \textbf{WG/WP}&
  \textbf{Title}&
  \textbf{Lead}&
  \textbf{Start}&
  \textbf{Dur.}&
  \textbf{Type}\\\hline\hline}
{\end{tabular}\end{footnotesize}}
\def\wpobjectives{\textbf{Objectives:} }
\def\wpdescription{\textbf{Description of Work:} }
\newenvironment{wpdelivs}{\vspace*{-1em}\begin{description}}
{\end{description}}
\newenvironment{wgdelivs}{\setcounter{deliv}{0}\vspace*{-1em}\begin{description}}
{\end{description}}
\def\lec#1{\strut\hfil\strut\null\nobreak\hfill\hbox{$\leadsto$#1}\par}
\define@key{deliv}{id}{\def\deliv@id{#1}}
\define@key{deliv}{due}{\def\deliv@due{#1}}
\define@key{deliv}{dissem}{\def\deliv@dissem{#1}}
\define@key{deliv}{type}{\def\deliv@type{#1}}
\define@key{deliv}{miles}{\def\deliv@miles{#1}}
\newcommand{\wpg@deliv}[3]{% keys, title, type
\let\deliv@miles=\relax% clean state
\def\@type{#3}\def\@wp{wp}% set up ifx
\def\wpg@id{\csname #3@id\endcsname}
\setkeys{deliv}{#1}\stepcounter{deliv}% set state
\ifx\@type\@wp\def\current@label{D\thewg.\thewp.\thedeliv}
\else\def\current@label{D\thewg.\thedeliv}\fi
\eu@write@aux{deliv}{\wpg@id\deliv@id}{label}{\current@label}
\eu@write@aux{deliv}{\wpg@id\deliv@id}{title}{#2}
\@ifundefined{deliv@due}{}{%
\@for\@I:=\deliv@due\do{\protected@write\wpg@delivs{}{\string\delivrable%
{\@I}% due date
{\current@label}% label
{\@ifundefined{deliv@id}{\protect\G@refundefinedtrue\@latex@warning{key 'id' for Deliv #1
      undefined}??}{\wpg@id:\deliv@id}}% id
{\@ifundefined{deliv@dissem}{\protect\G@refundefinedtrue\@latex@warning{key 'dissem' for
      Deliv #1 undefined}??}{\deliv@dissem}}% dissemination level
{\@ifundefined{deliv@type}{\protect\G@refundefinedtrue\@latex@warning{key 'type' for Deliv
      #1 undefined}??}{\deliv@type}}% type
{#2}}}}%
\item[\current@label: (Month \deliv@due)]\eu@target{deliv}{\wpg@id\deliv@id}{#2}
\@ifundefined{deliv@miles}{}{% print the milestones and update their delivrables
\let\m@sep=\relax% do not print the separator the first time round
\lec{\@for\@I:=\deliv@miles\do{% Iterate over the milestones mentioned
\m@sep\euRef{mile}{\@I}{label}% print the milestone reference
\let\m@sep=,}}%set the separator for the next times
\def\d@sep{,}
 \@for\@I:=\deliv@miles\do{% Iterate over the milestones mentioned
 \expandafter\ifx\csname\@I delivs\endcsname\relax% Check that the miles@delivs is empty
  {\expandafter\xdef\csname\@I delivs\endcsname{\wpg@id\deliv@id}}% if so, skip the separator
   \else\expandafter\xdef\csname\@I delivs\endcsname{\csname\@I delivs\endcsname\d@sep\wpg@id\deliv@id}\fi%if not add it
}
}}
\newcommand{\wgdeliv}[2][]{\wpg@deliv{#1}{#2}{wg}}
\newcommand{\wpdeliv}[2][]{\wpg@deliv{#1}{#2}{wp}}
\newwrite\wpg@delivs
\newenvironment{workplan}%
{\immediate\openout\wpg@delivs=\jobname.delivs\setcounter{wg}{-1}}%
{\closeout\wpg@delivs%
\@for\@I:=\mile@stones\do{\eu@write@aux{mile}{\@I}{delivs}{\csname\@I delivs\endcsname}}
\@for\@I:=\eu@partners\do{
    \eu@write@aux{eu}{\@I}{totaleffort}{\csname thetotal@\@I @effort\endcsname}}
\eu@write@aux{eu}{workplan}{wgs}{\eu@wgs}}
\newcounter{milestone}
\def\milestone#1{\stepcounter{milestone}
\eu@write@aux{mile}{#1}{label}{M\themilestone}
\eu@target{mile}{#1}{M\themilestone}
\@ifundefined{mile@stones}{\gdef\mile@stones{#1}}{\g@addto@macro\mile@stones{,#1}}}
\def\milesfor#1{\edef\@delivs{\euref{mile}{#1}{delivs}}
\let\m@sep=\relax
\@for\@I:=\@delivs\do{\m@sep\ \euRef{deliv}{\@I}{label}\let\m@sep=,}}
\newcommand{\delivrable}[6]{#2&#1&#6&#4&#5\\\hline}%due,label,id,title,type,level
\newenvironment{delivrables}[1]{\begin{longtable}{|l|l|p{#1}|l|l|}\hline
\#&due&title&dissem& type\\\hline\hline}{\\\hline\end{longtable}}
\newcommand{\inputdelivs}[1]{\begin{delivrables}{#1}
\IfFileExists{\jobname.delivrables}%
{\input{\jobname.delivrables}}%
{\input{\jobname.delivs}}
\end{delivrables}}
\def\zero@blank#1{\edef\@test{#1}\def\@zero{0}\ifx\@test\@zero\else#1\fi}
\def\staffefforttable{%
\edef\@wgs{\euref@aux{eu}{workplan}{wgs}}\message{wgs: \@wgs}
{\gdef\staff@efforts{}\def\@zero{0}% initialize
 \let\tabularnewline\relax\let\hline\relax% so they do not bother us
 \@for\@I:=\eu@partners\do{%iterate over partners for the lines
   \xdef\@line{\euref@aux{partner}{\@I}{number}& \euref@aux{partner}{\@I}{short}}% first two columns
   \@for\@J:=\@wgs\do{%iterate over the work groups
     \edef\@wps{\euref@aux{wg}{\@J}{wps}}\message{wps of \@J: \@wps}% define the list of work packages
     \edef\@wgeffort{\euref@aux{\@J}{\@I}{effort}}\message{wgeffort: \@wgeffort}%
     \@for\@K:=\@wps\do{% iterate over wps
       \edef\@wpeffort{\euref@aux\@K\@I{effort}}
       \xdef\@line{\@line&\ifx\@wpeffort\@zero\else\@wpeffort\fi}}
     \xdef\@line{\@line&\ifx\@wgeffort\@zero\else\@wgeffort\fi}}
   \message{line: \@line}
    \xdef\staff@efforts{\staff@efforts\@line&
      \euref@aux{eu}{\@I}{totaleffort}\tabularnewline\hline}}
  \gdef\wpg@nums{} %initialize
  \@for\@I:=\@wgs\do{%iterate over the work groups
    \xdef\wpg@nums{\wpg@nums\euref@aux{wg}{\@I}{wpnums}&T\euref@aux{wg}{\@I}{num}}}}
\message{wpgnums: \wpg@nums}
\begin{tabular}{|l|l|*{\thewpgno}{c|}l|}\hline
\# & Short \wpg@nums & Total \\\hline
\staff@efforts
\end{tabular}}
\newenvironment{partnerdesc}[1]{%number, short, long,
\eu@target{partner}{#1}{}
\section*{\euref{partner}{#1}{number}. #1: {\sc \euref{partner}{#1}{long}}  (\euref{partner}{#1}{nationality})}}
{}
\def\act#1#2{\multicolumn{#1}{l|}{\cellcolor{lightgray}{#2}}}
\def\pause#1{\multicolumn{#1}{l|}{}}
\endinput
%%
%% End of file `euproposal.cls'.
