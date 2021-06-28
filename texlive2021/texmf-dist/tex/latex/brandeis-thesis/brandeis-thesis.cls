%%
%% This is file `brandeis-thesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% brandeis-thesis.dtx  (with options: `package')
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from brandeis-thesis.cls.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file brandeis-thesis.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{brandeis-thesis}
    [2020/04/09 v3.1 .dtx brandeis-thesis file]
\LoadClass[12pt]{article}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{csquotes}
\AtBeginEnvironment{quote}{\singlespacing}
\titleformat*{\section}{\normalsize\bfseries}
\titleformat*{\subsection}{\normalsize\bfseries}
\titleformat*{\subsubsection}{\normalsize\bfseries}
\renewcommand\graduationmonth[1]{\def\@graduationmonth{#1}}
\renewcommand\graduationyear[1]{\def\@graduationyear{#1}}
\newcommand\program[1]{\def\@program{#1}}
\newcommand\advisor[1]{\def\@advisor{#1}}
\newcommand\degreetype[1]{\def\@degreetype{#1}}
\addto\captionsenglish{\renewcommand*\contentsname{Table of Contents}}
\renewcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand{\maketitlepage}{
    \pagenumbering{gobble}
    %\newgeometry{top=1.75in}
    \begin{center}
        \@title\\
        \vspace{1em}
        A Master's Thesis\\
        \vspace{1em}
        Presented to\\
        \vspace{1em}
        The Faculty of the Graduate School of Arts and Sciences\\
        Brandeis University\\
        \vspace{1em}
        \@program\\
        \vspace{1em}
        \@advisor, Advisor\\
        \vspace{1em}
        In Partial Fulfillment\\
        of the Requirements for the Degree\\
        Master of \@degreetype\\
        \vspace{1em}
        by\\
        \vspace{1em}
        \@author\\
        \vspace{1em}
        \@graduationmonth\,\@graduationyear
    \end{center}
    \restoregeometry
    \newpage
    \pagenumbering{roman}
    \setcounter{page}{2}
}
\newcommand{\makecopyright}{
    \pagenumbering{gobble}
    \newgeometry{top=6.2in}
    \begin{center}
        Copyright by\\
        \@author{}\\
        \vspace{1em}
        \@graduationyear{}
    \end{center}
    \restoregeometry
    \newpage
    \pagenumbering{roman}
    \setcounter{page}{3}
}
\newenvironment{thesis-abstract}
    {
    %\newgeometry{top=1.4in}
    \begin{center}
        \MakeUppercase{Abstract}\\
        \vspace{1em}
        \@title\\
        \vspace{1em}
        A thesis presented to the Faculty of the\\
        Graduate School of Arts and Sciences of Brandeis University\\
        Waltham, Massachusetts\\
        \vspace{1em}
        By\,\@author\\
        \vspace{2em}
    \end{center}
    \doublespacing
    }
    {
    \restoregeometry
    }
\newcommand{\startbody}{
    \newpage
    \pagenumbering{arabic}
    \doublespacing
}
\endinput
%%
%% End of file `brandeis-thesis.cls'.
