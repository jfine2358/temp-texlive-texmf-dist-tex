\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elpres}[2018/01/24 class for plain electronic presentations]
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

% Options: select fonts
\newcommand{\fontna}{initialisiert}
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


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}


\RequirePackage{ifthen}

\ifthenelse{\equal{\screenformat}{scr4x3}}{%
\RequirePackage[foot=10.2pt,head=0pt,paperwidth=128mm,paperheight=96mm,left=5mm,top=5mm,right=7mm,bottom=8mm]{geometry}%
}{}

\ifthenelse{\equal{\screenformat}{scr16x9}}{%
\RequirePackage[foot=10.2pt,head=0pt,paperwidth=176mm,paperheight=99mm,left=5mm,top=5mm,right=7mm,bottom=8mm]{geometry}%
}{}

\ifthenelse{\equal{\screenformat}{scr16x10}}{%
\RequirePackage[foot=10.2pt,head=0pt,paperwidth=160mm,paperheight=100mm,left=5mm,top=5mm,right=7mm,bottom=8mm]{geometry}%
}{}

\RequirePackage{fancyhdr}
\renewcommand{\headrulewidth}{0mm}
%% \pagestyle{fancy}
%% \rfoot{\thepage}
%% \cfoot{}
%% \lfoot{}

\renewcommand{\maketitle}%
  {\ClassError{elpres}{Caution: ``maketitle'' command not supported}%
  {Please use ``titlepage'' environment instead}%
}

\fancypagestyle{pres}{%
\fancyhf{}%
\fancyfoot[RO]{\footnotesize \thepage}%
}

\pagestyle{pres}

\newcommand{\distance}[1]{\vspace*{\stretch{#1}}}
\newcommand{\abstand}[1]{\vspace*{\stretch{#1}}}

\setlength{\parskip}{0.6ex}
\setlength{\parindent}{0mm}

%% plain slide -- heading line
\newenvironment{psli}[1][]%
   {{\raggedright \large\bfseries #1\par}\par\vspace*{\stretch{1}}}%
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

\ifthenelse{\equal{\fontna}{tmrfo}}{\RequirePackage{mathptmx}\RequirePackage{courier}}{}
\ifthenelse{\equal{\fontna}{helvetfo}}{\RequirePackage[scaled=0.92]{helvet}\RequirePackage{courier}}{}
\ifthenelse{\equal{\fontna}{initialisiert}}{\renewcommand{\familydefault}{\sfdefault}}{}

% vim: syntax=tex tw=2048 ai
