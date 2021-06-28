\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elpres}[2021/02/28 class for plain electronic presentations]
%
% 2004/06/19 v0.1  - initial version
%
% 2004/08/29 v0.2  - Page number: now `footnotesize' instead of `normalsize',
%                  - Left and right margins changed
%                  - `cenumerate' and `cdescription' environments
%                    added
%
% 2005/08/12 v0.3  - Options for selection of fonts added
%
% 2018/01/20 v0.4  - Lists environments `citemize', `cenumerate', 
%                    `cdescription modified
%                  - aspect ratio may be selected: 4x3 (default) 16x9, 
%                    16x10: i.e. support for widescreen monitors added 
%                  - documentation updated 
%
% 2018/01/24 v0.4a - documentation completed
%
% 2020/07/12 v0.5  - class option `navisymb' added; elpres now also requires
%                    the hyperref and xcolor packages. New commands:
%                    `auvimm', `fromlinktext' `totargettext'.
%                    new class option `nofonts' for use with lualatex.
%                  - documentation updated
%
% 2020/08/15 v0.6  - command `slidetitlecolor' added, color scheme files
%                    added, most parts of the documentation rewritten
%
% 2021/02/20 v0.7  - command `pagenrconst' added, parts of the documentation 
%                    (manual) rewritten
%
% 2021/02/28 v0.8  - bug in elpres...scheme.sty files fixed, manual updated
%
%
% Options: select fonts
\newcommand{\fontna}{initialisiert}
\DeclareOption{nofonts}{%
  \renewcommand{\fontna}{withoutfont}%
}
\DeclareOption{tmrfont}{%
  \renewcommand{\familydefault}{\rmdefault}%
  \renewcommand{\fontna}{tmrfo}%
}
\DeclareOption{helvetfont}{%
  \renewcommand{\familydefault}{\sfdefault}%
  \renewcommand{\fontna}{helvetfo}%
}
\DeclareOption{cmfont}{%
  \renewcommand{\familydefault}{\rmdefault}%
  \renewcommand{\fontna}{cmfo}%
}
\DeclareOption{sansfont}{%
  \renewcommand{\familydefault}{\sfdefault}%
  \renewcommand{\fontna}{sansfo}
}

% Options: screen formats
\newcommand{\screenformat}{scr4x3}

\DeclareOption{4x3}{%
  \renewcommand{\screenformat}{scr4x3}%
}

\DeclareOption{16x9}{%
  \renewcommand{\screenformat}{scr16x9}%
}

\DeclareOption{16x10}{%
  \renewcommand{\screenformat}{scr16x10}%
}


% Option: navigation symbols
\newcommand{\navigation}{withoutnavigationsymb}
\DeclareOption{navisymb}{%
  \renewcommand{\navigation}{withnavi}%
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{ifthen}
\RequirePackageWithOptions{xcolor}
\RequirePackage{graphicx}

\ifthenelse{\equal{\screenformat}{scr4x3}}{%
  \RequirePackage[foot=10.2pt,head=0pt,%
  paperwidth=128mm,paperheight=96mm,%
  left=5mm,top=5mm,right=7mm,bottom=8mm]{geometry}%
}{}

\ifthenelse{\equal{\screenformat}{scr16x9}}{%
  \RequirePackage[foot=10.2pt,head=0pt,%
  paperwidth=176mm,paperheight=99mm,%
  left=5mm,top=5mm,right=7mm,bottom=8mm]{geometry}%
}{}

\ifthenelse{\equal{\screenformat}{scr16x10}}{%
  \RequirePackage[foot=10.2pt,head=0pt,%
  paperwidth=160mm,paperheight=100mm,%
  left=5mm,top=5mm,right=7mm,bottom=8mm]{geometry}%
}{}


\RequirePackage[hyperfootnotes=false]{hyperref}
\RequirePackage{fancyhdr}

\renewcommand{\headrulewidth}{0mm}

\renewcommand{\maketitle}%
  {\ClassError{elpres}{Caution: ``maketitle'' command not supported}%
  {Please use ``titlepage'' environment instead}%
}


\fancypagestyle{pres}{%
\fancyhf{}%
\rfoot{\footnotesize \thepage}%
}

\renewcommand{\rhead}{\ClassError{elpres}{Caution: 
    command ``rhead'' not supported}}
\renewcommand{\chead}{\ClassError{elpres}{Caution: 
    command ``chead'' not supported}}
\renewcommand{\lhead}{\ClassError{elpres}{Caution: 
    command ``lhead'' not supported}}
\renewcommand{\fancyhead}{\ClassError{elpres}{Caution: 
    ``fancyhead'' not supported}}

\pagestyle{pres}

%% menu for navigation symbols
\ifthenelse{\equal{\navigation}{withnavi}}{%
\hypersetup{menubordercolor=white}%
\rfoot{% 
  \scriptsize%
     \providecolor{epnavigationmenucolor}{rgb}{0.6,0.6,0.6}
     \textcolor{epnavigationmenucolor}{%
     \Acrobatmenu{FirstPage}{$\ll$}\hspace{0.5em}%
     \Acrobatmenu{PrevPage}{$<$}\hspace{0.5em}%
     \Acrobatmenu{NextPage}{$>$}\hspace{0.5em}%
     \Acrobatmenu{LastPage}{$\gg$}\hspace{0.5em}%
     \Acrobatmenu{GoBack}{$\leftarrow$}\hspace{0.5em}%
     \Acrobatmenu{GoForward}{$\rightarrow$}\hspace{0.5em}%
     \Acrobatmenu{GoToPage}{[n]}\hspace{1.2em}%
   }\footnotesize \thepage}%
}{}%

\newcommand{\distance}[1]{\vspace*{\stretch{#1}}}
\newcommand{\abstand}[1]{\vspace*{\stretch{#1}}}

\setlength{\parskip}{0.6ex}
\setlength{\parindent}{0mm}

%% plain slide -- heading line

\providecommand{\sli@tico}{black}

\providecommand{\slidetitlecolor}[1]{%
  \renewcommand{\sli@tico}{#1}%
}

\newenvironment{psli}[1][]%
{{\raggedright \large\bfseries \textcolor{\sli@tico}{#1}\par}%
  \par\vspace*{\stretch{1}}}%
   {\par\vspace*{\stretch{1}}\newpage}
   
%% raw slide -- no heading
\newenvironment{rsli}{}{\newpage}%

%% compressed itemize
\newenvironment{citemize}%
  { \vspace{-0.7ex}%
    \begin{itemize}%
    \setlength{\itemsep}{0ex}%
    \setlength{\parskip}{0.1ex}%
    \setlength{\parsep}{0ex}%
    }%
  {\end{itemize}%
   \vspace{-0.7ex}}%

%% compressed enumerate
\newenvironment{cenumerate}%
  { \vspace{-0.7ex}%
    \begin{enumerate}%
    \setlength{\itemsep}{0ex}%
    \setlength{\parskip}{0.1ex}%
    \setlength{\parsep}{0ex}%
    }%
  {\end{enumerate}%
   \vspace{-0.7ex}}%

%% compressed description
\newenvironment{cdescription}%
  { \vspace{-0.7ex}
    \begin{description}%
    \setlength{\itemsep}{0ex}%
    \setlength{\parskip}{0.1ex}%
    \setlength{\parsep}{0ex}%
    }%
  {\end{description}%
   \vspace{-0.7ex}}%

 \ifthenelse{\equal{\fontna}{tmrfo}}%
 {\RequirePackage{mathptmx}%
   \RequirePackage{courier}}{}
 
 \ifthenelse{\equal{\fontna}{helvetfo}}%
 {\RequirePackage[scaled=0.92]{helvet}%
   \RequirePackage{courier}}{}
 
 \ifthenelse{\equal{\fontna}{initialisiert}}{\renewcommand{\familydefault}%
   {\sfdefault}}{}

 \ifthenelse{\equal{\fontna}{withoutfont}}{}{}

\newcommand{\auvimm}[2]{\href{#2}{#1}}

\newcommand{\fromlinktext}[2]{\hyperlink{#2}{#1}}
\newcommand{\totargettext}[2]{\hypertarget{#2}{#1}}

\newcommand{\pagenrconst}{\addtocounter{page}{-1}}

%% (External): Default colors for defined slide elements, they are modified in
%% style files -- these color names may be used externally by authors of 
%% presentations

% (External): normal text color
\definecolor{eptextcolor}{rgb}{0,0,0}
\color{eptextcolor}
% (External): highlighted text
\definecolor{ephighlightcolor}{rgb}{0.6,0.1,0.1}
% (External): may be used on the title page
\definecolor{eptitlecolor}{rgb}{0.6,0.1,0.1}

% vim: syntax=tex tw=2048 ai
