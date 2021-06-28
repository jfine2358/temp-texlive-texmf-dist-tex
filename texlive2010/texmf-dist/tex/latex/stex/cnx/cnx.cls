%%
%% This is file `cnx.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% cnx.dtx  (with options: `cls')
%% 
\RequirePackage{sref}
\RequirePackage{graphicx}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\ExecuteOptions{letterpaper}
\ProcessOptions
\input{size10.clo}
\pagenumbering{roman}
\omdaddkey{cnxmodule}{name}
\srefaddidkey{cnxmodule}{id}
\newenvironment{cnxmodule}[1][]{\omdsetkeys{cnxmodule}{#1}}{}
\newenvironment{ccontent}{}{}
\newcounter{section}
\srefaddidkey{sectioning}{id}
\newenvironment{csection}[2][]%
{\stepcounter{section}\strut\\[1.5ex]\noindent%
{\Large\bfseries\arabic{section}.~{#2}}\\[1.5ex]
\omdsetkeys{sectioning}{#1}}
{}
\newcounter{subsection}[section]
\newenvironment{csubsection}[2][]
{\refstepcounter{subsection}\strut\\[1ex]\noindent%
{\large\bfseries{\arabic{section}.\arabic{subsection}.~#2\\[1ex]}}%
\omdsetkeys{sectioning}{#1}}%
{}
\newcounter{subsubsection}[subsection]
\newenvironment{csubsubsection}[2][]
{\refstepcounter{subsubsection}\strut\\[.5ex]\noindent
{\bfseries\arabic{section}.\arabic{subsection}.\arabic{subsubsecction}~#2\\[.5ex]}%
\omdsetkeys{sectioning}{#1}}{}
\srefaddidkey{para}{id}
\newenvironment{cpara}[1][]{\omdsetkeys{para}{#1}}{\par}
\srefaddidkey{note}
\omdaddkey{note}{type}
\newenvironment{cnote}[1][]%
{\omdsetkeys{note}{#1}\par\noindent\strut\hfill\begin{minipage}{10cm}{\bfseries\note@type}:~}%
{\end{minipage}\hfill\strut\par}
\srefaddidkey{equation}{id}
\newenvironment{cequation}[1][]%
{\omdsetkeys{equation}{#1}\begin{displaymath}}
{\end{displaymath}}
\srefaddidkey{cquote}
\omdaddkey{cquote}{type}
\omdaddkey{cquote}{src}
\newenvironment{cquote}[1][]{%
\omdsetkeys{cquote}{#1}\begin{center}\begin{minipage}{.8\textwidth}}{\end{minipage}\end{center}}
\newcommand{\litem}[2][]{\item[#1]\label{#2}}
\srefaddidkey{example}
\omdaddkey{example}{name}
\newenvironment{cexample}[1][]{\omdsetkeys{example}{#1}
{\ifx\example@name\@empty\else\noindent\bfseries{\example@name}\fi}}
{}
\newcounter{cexercise}
\srefaddidkey{cexercise}
\omdaddkey{cexercise}{name}
\newenvironment{cexercise}[1][]{\omdsetkeys{cexercise}{#1}
{\ifx\cexercise@name\@empty\else\stepcounter{cexercise}\noindent\bfseries{\cexercise@name~\arabic{cexercise}}\fi}}
{}
\srefaddidkey{cproblem}
\newenvironment{cproblem}[1][]{\omdsetkeys{cproblem}{#1}}{}{}
\srefaddidkey{csolution}
\newenvironment{csolution}[1][]{\omdsetkeys{csolution}{#1}}{\par\noindent\bfseries{Solution}}{}
\srefaddidkey{rule}
\omdaddkey{rule}{name}
\omdaddkey{rule}{type}
\newenvironment{crule}[1][]{\omdsetkeys{rule}{#1}%
{\noindent\bfseries{\rule@type:}\ifx\rule@name\@empty\else~(\rule@name)\fi}}%
{}
\srefaddidkey{statement}
\newenvironment{statement}[1][]{\omdsetkeys{statement}{#1}}{}
\srefaddidkey{proof}
\newenvironment{proof}[1][]{\omdsetkeys{proof}{#1}}{}
\srefaddidkey{definition}
\omdaddkey{definition}{term}
\omdaddkey{definition}{seealso}
\newenvironment{definition}[1][]{\omdsetkeys{definition}{#1}{\noindent\bfseries{Definition:}}}{}
\srefaddidkey{meaning}
\newenvironment{cmeaning}[1][]{\omdsetkeys{meaning}{#1}}{}
\omdaddkey{cnxn}{document}
\omdaddkey{cnxn}{target}
\omdaddkey{cnxn}{strength}
\newcommand{\cnxn}[2][]% keys, link text
{\omdsetkeys{cnxn}{#1}{\underline{#2}}\footnote{{\ttfamily\@ifx\cnxn@document\@empty\cnxn@document\fi\#\cnxn@target}}}
\newcommand\@makefntext[1]{\parindent 1em\noindent\hb@xt@1.8em{\hss\@makefnmark}#1}
\omdaddkey{link}{src}
\newcommand{\link}[2][]{\omdsetkeys{link}{#1}\underline{#2}}
\srefaddidkey{cfigure}
\omdaddkey{cfigure}{type}
\omdaddkey{cfigure}{caption}
\newcounter{figure}
\newcommand{\cfigure}[3][]{% cnx_keys, graphicx_keys, path
\begin{center}%
\includegraphics[#2]{#3}%
\omdsetkeys{cfigure}{#1}\sref@target%
\ifx\cfigure@caption\@empty\else
\par\noindent Figure\refstepcounter{figure} {\arabic{figure}}: \cfigure@caption%
\protected@edef\@currentlabel{\arabic{figure}}%
\sref@label@id{Figure \thefigure}\fi
\end{center}}
\omdaddkey{ccite}{src}
\newcommand{\ccite}[2][]{\omdsetkeys{ccite}{#1}\emph{#2}}
\newcommand{\term}[1]{{\bfseries\underline{#1}}}
\omdaddkey{metadata}{version}
\omdaddkey{metadata}{created}
\omdaddkey{metadata}{revised}
\newsavebox{\metadatabox}
\newenvironment{metadata}[1][]%
{\noindent\hfill\begin{lrbox}{\metadatabox}
\begin{minipage}{.8\textwidth}%
{\Large\bfseries CNX Module: \cnx@name\hfill\strut}\\[2ex]}%
{\end{minipage}\end{lrbox}\fbox{\usebox\metadatabox}\hfill}
\newenvironment{authorlist}{{\bfseries{Authors}:~}}{\\[1ex]}
\newenvironment{maintainerlist}{{\bfseries{Maintainers}:~}}{\\[1ex]}
\srefaddidkey{auth}
\omdaddkey{auth}{honorific}
\omdaddkey{auth}{firstname}
\omdaddkey{auth}{other}
\omdaddkey{auth}{surname}
\omdaddkey{auth}{lineage}
\omdaddkey{auth}{email}
\newcommand{\cnxauthor}[1][]{\omdsetkeys{auth}{#1}\auth@first~\auth@sur,}
\newcommand{\maintainer}[1][]{\omdsetkeys{auth}{#1}\auth@first~\auth@sur,}
\newenvironment{keywordlist}{\bfseries{Keywords}:~}{\\[1ex]}
\newcommand{\keyword}[1]{#1,}
\newenvironment{cnxabstract}%
{\par\noindent\strut\hfill\begin{minipage}{10cm}{\bfseries{Abstract}:~}}%
{\end{minipage}\hfill}
\endinput
%%
%% End of file `cnx.cls'.