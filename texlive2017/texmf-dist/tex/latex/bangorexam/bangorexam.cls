%%
%% This is file `bangorexam.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% bangorexam.dtx  (with options: `bangorexam.cls,package')
%% 
%%  bangorexam.dtx
%%  Copyright 2016 Cameron Gray/Bangor University <c.gray@bangor.ac.uk>
%% 
%%  This work may be distributed and/or modified under the
%%  conditions of the LaTeX Project Public License, either version 1.3
%%  of this license of (at your option) any later version.
%%  The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%%  and version 1.3 or later is part of all distributions of LaTeX
%%  version 2005/12/01 or later.
%% 
%%  This work has the LPPL maintenance status `maintained'.
%% 
%%  The Current Maintainer of this work is Cameron Gray <c.gray@bangor.ac.uk>.
%% 
%%  This work consists of the files bangorexam.dtx and bangorexam.ins and the derived
%%  file bangorexam.cls.
%% 
%% \CharacterTable
%%  {Upper-case\A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case\a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits\0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \! Double quote  \" Hash (number) \#
%%   Dollar\$ Percent   \% Ampersand \&
%%   Acute accent  \' Left paren\( Right paren   \)
%%   Asterisk  \* Plus  \+ Comma \,
%%   Minus \- Point \. Solidus   \/
%%   Colon \: Semicolon \; Less than \<
%%   Equals\= Greater than  \> Question mark \?
%%   Commercial at \@ Left bracket  \[ Backslash \\
%%   Right bracket \] Circumflex\^ Underscore\_
%%   Grave accent  \` Left brace\{ Vertical bar  \|
%%   Right brace   \} Tilde \~}
\def\version{1.2.0 }

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{bangorexam}[2017/03/14 \version C. Gray]


\RequirePackage[dvipsnames]{xcolor}
\RequirePackage[T1]{fontenc}
\RequirePackage[UKenglish]{babel}
\RequirePackage[UKenglish]{isodate}
\RequirePackage[utf8]{inputenc}

\RequirePackage{array}
\RequirePackage{color}
\RequirePackage{etoolbox}
\RequirePackage{graphicx}
\RequirePackage{letltxmacro}
\RequirePackage{newpxtext,newpxmath}
\RequirePackage{totcount}
\RequirePackage{xstring}

\RequirePackage{courier}


\newcommand{\engATypeText}{Answer {\bf Section A} (compulsory) and {\bf any two} questions from {\bf Section B}.}%
\newcommand{\welATypeText}{Atebwch {\bf Adran A} (gorfodol) ac {\bf unrhyw ddau} gwestiwn o {\bf Adran B}.}%
\newcommand{\engBTypeText}{Answer \textbf{two} out of four questions.}%
\newcommand{\welBTypeText}{Atebwch \textbf{ddau} o'r pedwar cwestiwn.}%
\newcommand{\engCTypeText}{Answer all questions.}%
\newcommand{\welCTypeText}{Atebwch bob cwstiwn.}%
\newcommand{\sectionAHeader}{\textbf{SECTION A} --- Answer \textbf{ALL} questions (Total marks \total{sectiona})}%
\newcommand{\sectionBHeader}{\textbf{SECTION B} --- Answer any \textbf{TWO} questions (\total{sectionb} marks each)}%
\newcommand{\sectionAOnlyHeader}{Answer \textbf{ALL} questions (Total marks \total{sectiona})}%


\DeclareOption{welsh}{%
\newcommand{\welsh}{true}%
\renewcommand{\sectionAHeader}{\textbf{ADRAN A} --- Atebwch BOB cwestiwn (Cyfanswm marciau \total{sectiona})}%
\renewcommand{\sectionBHeader}{\textbf{ADRAN B} --- Atebwch unrhyw DDAU chwestiwn (\total{sectionb} marc yr un)}%
\renewcommand{\sectionAOnlyHeader}{Atebwch \textbf{BOB} cwestiwn (Cyfanswm marciau \total{sectiona})}%
}%
\newcommand{\engTypeText}{}
\newcommand{\welTypeText}{}
\DeclareOption{ab}{%
\newcommand{\examtype}{ab}%
\renewcommand{\engTypeText}{\engATypeText}%
\renewcommand{\welTypeText}{\welATypeText}%
}%
\DeclareOption{aonly}{%
\newcommand{\examtype}{aonly}%
\renewcommand{\engTypeText}{\engCTypeText}%
\renewcommand{\welTypeText}{\welCTypeText}%
\renewcommand{\sectionAHeader}{\sectionAOnlyHeader}
}%
\DeclareOption{twofour}{%
\newcommand{\examtype}{twofour}%
\renewcommand{\engTypeText}{\engBTypeText}%
\renewcommand{\welTypeText}{\welBTypeText}%
}%
\DeclareOption{answers}{\PassOptionsToClass{\CurrentOption}{exam}}%
\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{exam}}%
\ProcessOptions\relax%

\ifx\examtype\undefined%
\ClassError{bangorexam}{An exam type option has not been defined; use ab, aonly, or twofour in the class options.}%
\fi%

\LoadClass[a4paper,twoside,11pt,addpoints]{exam}%

\setlength{\parindent}{0mm}%
\setlength{\parskip}{1ex plus 0.5ex minus 0.2ex}%

\pagestyle{headandfoot}%
\coverfooter{}{}{\iflastpage{}{/ troi drosodd\\/ turn over}{}}%
\footer{}{\thepage}{\oddeven{\iflastpage{}{/ troi drosodd\\/ turn over}}}{}%

\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}

\SolutionEmphasis{\color{red}}
\CorrectChoiceEmphasis{\bfseries\color{red}}

\newcounter{tmp}
\newtotcounter{all}
\newtotcounter{tf}
\newtotcounter{sectiona}
\newtotcounter{sectionb}
\newcounter{lq}
\newcounter{lqp}
\setcounter{lq}{-1}

\newcommand{\school}[2] {%
\def \engSchool {\expandafter\MakeUppercase\expandafter{#1}}%
\def \welSchool {\expandafter\MakeUppercase\expandafter{#2}}%
}%
\newcommand{\module}[2]{%
\StrSubstitute{#1}{-}{}[\mTmp]%
\def \moduleCode {\expandafter\MakeUppercase\expandafter{\mTmp}}%
\def \moduleName {#2}%
}%
\newcommand{\examperiod}[1]{%
\setcounter{tmp}{\the\year}%
\ifnum \the\month>8%
\stepcounter{tmp}%
\newcommand{\examYear}{\arabic{tmp}}%
\else%
\newcommand{\examYear}{\arabic{tmp}}%
\fi%
\newcommand{\welSemesterText}{Arholiadau Diwedd Semester\ \welSemester}%
\newcommand{\engSemesterText}{End of Semester \engSemester\ Examinations}%
\ifthenelse{\equal{#1}{s1}}{%
\def \welSemester {Un}%
\def \engSemester {One}%
\def \welExamMonth {IONAWR}%
\def \engExamMonth {JANUARY}%
}{}%
\ifthenelse{\equal{#1}{s2}}{%
\def \welSemester {Dau}%
\def \engSemester {Two}%
\def \welExamMonth {MAI}%
\def \engExamMonth {MAY}%
}{}%
\ifthenelse{\equal{#1}{resit}}{%
\renewcommand{\welSemesterText}{Arholiadau Atodol}%
\renewcommand{\engSemesterText}{Supplementary Examination}%
\def \welExamMonth {AWST}%
\def \engExamMonth {AUGUST}%
}{}%
}

\newcommand{\timeallowed}[1]{%
\def \timeAllowed {#1}%
}

\newcommand{\guidance}[1]{%
\def \guidance@a {#1}%
\def \guidance@b {#1}%
}

\newcommand{\guidancea}[1]{%
\def \guidance@a {#1}%
}

\newcommand{\guidanceb}[1]{%
\def \guidance@b {#1}%
}


\renewcommand{\maketitle}{%
\ifx\timeAllowed\undefined%
\ClassError{bangorexam}{The time allowed for this exam has not been defined (missing timealllowed?)}%
\fi%
\ifx\engExamMonth\undefined%
\ClassError{bangorexam}{The exam period for this exam has not been set (missing examperiod?)}%
\fi%
\ifx\moduleCode\undefined%
\ClassError{bangorexam}{The module details for this exam have not been specified (missing module?)}%
\fi%
\ifx\welSchool\undefined%
\ClassError{bangorexam}{The academic school setting this exam has not been defined (missing school?)}%
\fi%

\begin{center}
\bfseries
\huge
PRIFYSGOL\\
\large\mbox{}\\
\huge
BANGOR\\
\large\mbox{}\\
\huge
UNIVERSITY

\vfill
\Large
\welSchool \\
\engSchool
\end{center}
\medskip
\large
\begin{tabular}{C{0.5\textwidth}C{0.5\textwidth}}
{\bf \welSemesterText\par\welExamMonth\ \examYear}\par\vspace*{\bigskipamount}
Amser a ganiateir:~\timeAllowed~awr &%
{\bf \engSemesterText\par\engExamMonth\ \examYear}\par\vspace*{\bigskipamount}
Time allowed:~\timeAllowed~hours
\end{tabular}

\vspace*{20mm}
\LARGE
\begin{center}
{\bf \moduleCode\\
\mbox{}\\
\moduleName}

\vfill
\large
{\welTypeText} \\
{\engTypeText} \\
\

\medskip
{\bf Total marks \total{all}\\
     Cyfanswm Marciau \total{all}}
\vfill
\end{center}
}
\AtBeginDocument{
\begin{coverpages}
\setlength{\hoffset}{0mm}
\setlength{\marginparwidth}{0pt}
\maketitle
\end{coverpages}
\setcounter{page}{2}
\pointsinrightmargin
\ifthenelse{\equal{\examtype}{twofour}}{
\clearpage
{%
\LARGE
\textbf{\moduleCode: \quad \moduleName}

\vspace*{8mm}
\large
\ifcsdef{guidance@a}{\normalsize\par\guidance@a}{}%
}
\vspace*{8mm}
}{}%
\ifthenelse{\equal{\examtype}{aonly}}{\sectiona}{}%
}

\newcounter{seca}
\newcounter{secb}
\newcommand{\inDoc}{none}%
\newcommand{\sectiona} {%
\ifthenelse{\equal{\examtype}{twofour}}{\ClassError{bangorexam}{Section A defined in a 'two from four' exam.}\relax}{}%
\ifnumcomp{\value{seca}}{>}{0}
{
\ClassError{bangorexam}{There is already a Section A in this exam.}\relax%
}
{
\stepcounter{seca}\relax%
}
\renewcommand{\inDoc}{secA}%
\clearpage
{%
\LARGE
\textbf{\moduleCode: \quad \moduleName}

\vspace*{8mm}
\large
\sectionAHeader
\ifcsdef{guidance@a}{\normalsize\par\guidance@a}{}%
}
\vspace*{8mm}
}

\newcommand{\sectionb}{%
\ifthenelse{\equal{\examtype}{twofour}}{\ClassError{bangorexam}{Section B defined in a 'two from four' exam.}\relax}{}
\ifthenelse{\equal{\examtype}{aonly}}{\ClassError{bangorexam}{Section B defined in an 'A only' exam.}\relax}{}
\ifnumcomp{\value{secb}}{>}{0}
{
\ClassError{bangorexam}{There is already a Section B in this exam.}\relax%
}
{
\stepcounter{secb}\relax%
}
\renewcommand{\inDoc}{secB}
\clearpage
{%
\large
\sectionBHeader
\ifcsdef{guidance@b}{\normalsize\par\guidance@b}{}%
}
\vspace*{8mm}
}

\renewcommand{\questionshook}{%
\setlength{\itemsep}{14pt}%
    \edef\mytemp{{\inDoc}}%
    \expandafter\ifstrequal\mytemp{secB}{\addtocounter{question}{100}}{}%
}

\renewcommand{\thequestion}{%
    \edef\mytemp{{\inDoc}}%
    \setcounter{tmp}{0}%
    \addtocounter{tmp}{\value{question}}%
    \expandafter\ifstrequal\mytemp{secB}{\addtocounter{tmp}{-100}\arabic{tmp}}{\arabic{question}}%
}

\newcommand{\be@adduppoints}[1]{%
\def\temp{#1}\ifx\temp\empty%
        \def\temp{0}%
    \fi%
    \ifnumcomp{\value{question}}{=}{\value{lq}}
     {% Same question
     \addtocounter{lqp}{\temp}%
     }
     {% Moved onto next question
     \be@addpoints{\value{lqp}}%
     \setcounter{lq}{\value{question}}%
     \setcounter{lqp}{0}%
     \addtocounter{lqp}{\temp}%
     }%
}

\let\oldendq\endquestions%
\renewcommand{\endquestions}{%
    \addtocounter{question}{-1}%
    \be@adduppoints{0}%
}

\newcommand{\be@addpoints}[1]{%
\edef\mytemp{{\inDoc}}%
\expandafter\ifstrequal\mytemp{secA}%
        {%
            \addtocounter{sectiona}{#1}%
            \addtocounter{all}{#1}%
        }%
        {}%
    \expandafter\ifstrequal\mytemp{secB}%
        {%
            \ifnumcomp{\value{sectionb}}{=}{0}%
                {%
                    \addtocounter{sectionb}{#1}%
                    \addtocounter{all}{#1}%
                    \addtocounter{all}{#1}}%
                {}%
            \ifnumcomp{\value{sectionb}}{=}{#1}%
                {}%
                {%
                 \setcounter{tmp}{0}%
     \addtocounter{tmp}{\value{question}}%
     \addtocounter{tmp}{-100}
                    \ClassError{bangorexam}{Section B question \arabic{tmp} does not have an equal number of points (Existing Section B question worth \arabic{sectionb}).}\relax%
                }%
        }%
        {}%
     \edef\mytemp{{\examtype}}%
     \expandafter\ifstrequal\mytemp{twofour}%
{%
            \ifnumcomp{\value{tf}}{=}{0}%
                {%
                    \addtocounter{tf}{#1}%
                    \addtocounter{all}{#1}%
                    \addtocounter{all}{#1}}%
                {}%
            \ifnumcomp{\value{tf}}{=}{#1}%
                {}%
                {%
                    \ClassError{bangorexam}{Question \arabic{question} does not have an equal number of points (Existing question(s) worth \arabic{tf}).}\relax%
                }%
        }%
        {}%
}

\newcommand{\patchqnumaddpoints}{%
\be@adduppoints{\@points}%
}
\pointformat{[\thepoints]}
\pointname{\null\patchqnumaddpoints}
\newcommand{\pointsdec}[1]{%
\pointname{#1}\patchqnumaddpoints
}


\let\horizontalchoices\oneparchoices
\let\endhorizontalchoices\endoneparchoices
\let\horizontalcheckboxes\oneparcheckboxes
\let\endhorizontalcheckboxes\endoneparcheckboxes


\AfterEndDocument{%
\edef\mytemp{{\examtype}}%
    \expandafter\ifstrequal\mytemp{twofour}%
    {%
        \edef\mytmp{\numquestions}%
\expandafter\ifstrequal\mytmp{4}%
{\relax}%
{%
\ClassError{bangorexam}{There is/are only (\numquestions) question(s) defined, there should be four.}\relax%
}%
    }{%
        \ifnumcomp{\value{seca}}{=}{0}%
            {%
\ClassError{bangorexam}{There is no Section A defined in this exam.}\relax%
}%
            {\relax}%
        \expandafter\ifstrequal\mytemp{ab}
     {%
        \ifnumcomp{\value{secb}}{=}{0}%
            {%
\ClassError{bangorexam}{There is no Section B defined in this exam.}\relax%
}%
            {\relax}%
    }{}%
    }%
}

\endinput
%%
%% End of file `bangorexam.cls'.
