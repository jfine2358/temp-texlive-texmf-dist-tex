\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unitn-bimrep}[2017/09/18 University of Trento Bimonthly Report - Matteo Ragni]

\newif\if@TNbiboption
\@TNbiboptionfalse
\DeclareOption{bib}{\@TNbiboptiontrue}
\ProcessOptions\relax

\LoadClass[a4paper,12pt]{report}

\let\@author\@empty
\let\@title\@empty
\let\@cycle\@empty
\let\@advisor\@empty

\newcounter{TNenvflag}

\RequirePackage[english]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[a4paper,
   top=1cm, 
   bottom=1cm, 
   left=1.4cm, 
   right=1.4cm,
   marginparwidth=0pt,
   headheight=0pt,
   footskip=0pt
   ]{geometry}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{libertine}
\RequirePackage{framed}
\if@TNbiboption
  \RequirePackage[refsection=none,style=ieee,indexing=false]{biblatex}
  \let\TNprintbibliography\printbibliography
  \renewcommand{\printbibliography}{\TNprintbibliography[heading=none]}
\fi

% Page Numbering
\pagenumbering{gobble}

% Command Declarations
\newcommand{\advisor}[1]{\def\@advisor{#1}}
\newcommand{\cycle}[1]{\def\@cycle{#1}}
\newcommand{\@TNhlinenew}{\noindent\makebox[\linewidth]{\rule{\linewidth}{0.4pt}}}
% Variable Checker
\newcommand{\@TNcheckvariables}{%
\ifx\@author\@empty{
  \ClassError{unitn-bimrep}{Report Author is undefined}{Use the \author{...} command to define it}
}\fi
\ifx\@title\@empty{
  \ClassError{unitn-bimrep}{Student Thesis title is undefined}{Use the \title{...} command to define it}
}\fi
\ifx\@advisor\@empty{
  \ClassError{unitn-bimrep}{Student Advisor is undefined}{Use the \advisor{...} command to define it}
}\fi
\ifx\@cycle\@empty{
  \ClassError{unitn-bimrep}{Student Cycle is undefined}{Use the \cycle{...} command to define it}
}\fi}
\newcommand{\@TNcheckenvs}{%
  \ifnum\value{TNenvflag}<1{
    \ClassError{unitn-bimrep}{Missing Research activities Environment}
      {Please define it in \begin{research} ... \end{research}}
  }
  \ifnum\value{TNenvflag}<2{
    \ClassError{unitn-bimrep}{Missing School and Seminars attendance Environment}
      {Please define it in \begin{attendance} ... \end{attendance}}
  }
  \ifnum\value{TNenvflag}<3{
    \ClassError{unitn-bimrep}{Missing Production Environment}
      {Please define it in \begin{production} ... \end{production}}
  }
}

% Environment Checker
% Title Declaration
\renewcommand{\maketitle}{%
\@TNcheckvariables
\begin{centering}
	\begin{tabular}{c}
	\includegraphics[scale=0.5]{unitn-bimrep.jpg} \\
	\textsc{{\bfseries Doctoral School in Materials,}} \\
	\textsc{{\bfseries Mechatronics and Systems Engineering}} \vspace{0.3cm} \\
	BIMONTHLY REPORT. \textit{Send to: {dii.phd@unitn.it}} \vspace{0.3cm} \\
	\textsc{Deadlines}: 22.02, 22.04, 22.06, 22.08, 22.10, 20.12 (every year) \\
	\hspace{\linewidth} \\
	\end{tabular}
\end{centering}
\begin{framed}
\noindent
Student Name: \textbf{\@author} \hfill Cycle/Year: \textbf{\@cycle} \\
Thesis: \textbf{\@title} \\
Supervisor: \textbf{\@advisor} \hfill Date: \textbf{\today}
\end{framed}%
}

% document environment last fixes
\AtBeginDocument{%

\maketitle
\begin{framed}
}
\AtEndDocument{
\ifnum\value{TNenvflag}=10\else{
  \ClassError{unitn-bimrep}
    {One of the required environment is missing.}
    {Please remember that the correct order is 1) Research Activities, 2) School and Seminars, 3) Publications}
}\fi
\end{framed}}

% May be empty itemize environment wrkaround (sorurce: https://tex.stackexchange.com/questions/86547)
\let\@oldnoitemerr\@noitemerr
\newcommand\noitemerroroff{\let\@noitemerr\relax}
\newcommand\noitemerroron{\let\@noitemerr\@oldnoitemerr}
\newenvironment{TN may be empty itemize}
{\itemize\noitemerroroff}
{\enditemize\noitemerroron}
% Research - Bullet list environment
\newenvironment{research}{%
  \ifnum\value{TNenvflag}=0{
    \setcounter{TNenvflag}{1}  
  }\else{
    \ClassError{unitn-bimrep}
      {Reasearch activities already defined}
      {The research environment has already been used. Please use it only once.} 
  }\fi
  {\noindent{\large\textbf{Summary of Research Activity}:}}
  \begin{TN may be empty itemize}
}
{
  \end{TN may be empty itemize}
}
% Research - Empty environment
\newenvironment{research*}{%
  \ifnum\value{TNenvflag}=0{
    \setcounter{TNenvflag}{1}  
  }\else{
    \ClassError{unitn-bimrep}
      {Reasearch activities already defined}
      {The research environment has already been used. Please use it only once.} 
  }\fi
  {\noindent{\large\textbf{Summary of Research Activity}:}} \\
}{}
% School - Bullet list environment
\newenvironment{school}{%
  \ifnum\value{TNenvflag}=5{
    \ClassError{unitn-bimrep}
      {Schools and Seminars activities already defined}
      {The attendance environment has already been used. Please use it only once.} 
  }\else{
    \ifnum\value{TNenvflag}=1{
      \setcounter{TNenvflag}{5}
    }\else{
      \ClassError{unitn-bimrep}
        {Schools and Seminars attendance defined before Research Activities}
        {Please remember that the correct order is 1) Research Activities, 2) School and Seminars, 3) Publications}
    }\fi
  }\fi
  \let\@TNitem\item
  \renewcommand{\item}[3]{\@TNitem \emph{##1}, ##2 (##3)}
  \@TNhlinenew \vspace{0.2cm} {\large \textbf{Attendance at Schools/Classes/Seminars}} (title, length (day/hours), credits):
  \begin{TN may be empty itemize}
}
{
  \end{TN may be empty itemize}
}
% School - Plain environment
\newenvironment{school*}{%
  \ifnum\value{TNenvflag}=5{
    \ClassError{unitn-bimrep}
      {Schools and Seminars activities already defined}
      {The attendance environment has already been used. Please use it only once.} 
  }\else{
    \ifnum\value{TNenvflag}=1{
      \setcounter{TNenvflag}{5}
    }\else{
      \ClassError{unitn-bimrep}
        {Schools and Seminars attendance defined before Research Activities}
        {Please remember that the correct order is 1) Research Activities, 2) School and Seminars, 3) Publications}
    }\fi
  }\fi
  \@TNhlinenew \vspace{0.2cm} {\large \textbf{Attendance at Schools/Classes/Seminars}} (title, length (day/hours), credits): \\
}{}
% Production - Bullet list environment
\newenvironment{production}{%
\ifnum\value{TNenvflag}=10{
    \ClassError{unitn-bimrep}
     {List of new publications and congress participation already defined}
     {The production environment has already been used. Please use it only once.} 
  }\else{
    \ifnum\value{TNenvflag}=5{
      \setcounter{TNenvflag}{10}
    }\else{
      \ClassError{unitn-bimrep}
        {Schools and Seminars attendance defined before Research Activities}
        {Please remember that the correct order is 1) Research Activities, 2) School and Seminars, 3) Publications}
    }\fi
  }\fi
  \let\@TNitem\item
  \renewcommand{\item}[3]{\@TNitem {\small##1}:\\ \emph{##2}\\ {\small##3}}
  \@TNhlinenew \vspace{0.2cm} {\large\textbf{Publications/Congress participation}:}
  \begin{TN may be empty itemize}
}
{
  \end{TN may be empty itemize}
  \vspace{0.2cm}
}
% Production - Plain Environment
\newenvironment{production*}{%
\ifnum\value{TNenvflag}=10{
    \ClassError{unitn-bimrep}
     {List of new publications and congress participation already defined}
     {The production environment has already been used. Please use it only once.} 
  }\else{
    \ifnum\value{TNenvflag}=5{
      \setcounter{TNenvflag}{10}
    }\else{
      \ClassError{unitn-bimrep}
        {Schools and Seminars attendance defined before Research Activities}
        {Please remember that the correct order is 1) Research Activities, 2) School and Seminars, 3) Publications}
    }\fi
  }\fi
  \@TNhlinenew \vspace{0.2cm} {\large\textbf{Publications/Congress participation}:} \\
}
{
  \vspace{0.2cm}
}

