%%
%% This is file `brandeis-dissertation.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% brandeis-dissertation.dtx  (with options: `package')
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from brandeis-dissertation.cls.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file brandeis-dissertation.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesPackage{brandeis-dissertation}
    [2020/01/21 v3.0 .dtx brandeis-dissertation file]
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
\renewcommand\month[1]{\def\@month{#1}}
\renewcommand\year[1]{\def\@year{#1}}
\newcommand\program[1]{\def\@program{#1}}
\newcommand\advisor[1]{\def\@advisor{#1}}
\newcommand\signoff[2]{\def\@signoff{#1}\def\@signofftitle{#2}}
\newcommand\committeechair[2]{\def\@committeechair{#1}\def\@committeechairdept{#2}}
\newcommand\committeetwo[2]{\def\@committeetwo{#1}\def\@committeetwodept{#2}}
\newcommand\committeethree[2]{\def\@committeethree{#1}\def\@committeethreedept{#2}}
\newcommand\outsidereader[3]{\def\@outsidereader{#1}\def\@outsidereaderdept{#2}\def\@outsidereaderuni{#3}}
\addto\captionsenglish{\renewcommand*\contentsname{Table of Contents}}
\renewcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand{\maketitlepage}{%
    \pagenumbering{gobble}
    %\newgeometry{top=1.75in}
    \begin{center}
        \@title\\
        \vspace{1em}
        A Dissertation\\
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
        Doctor of Philosophy\\
        \vspace{1em}
        by\\
        \@author\\
        \vspace{1em}
        \@month\,\@year
    \end{center}
    \restoregeometry
    \newpage
    \pagenumbering{roman}
    \setcounter{page}{2}
}
\newcommand{\makeapproval}{%
    \pagenumbering{gobble}
    \begin{spacing}{2}
    \noindent
    This dissertation, directed and approved by \@author{}'s Committee, has been\\ accepted and approved by the Faculty of Brandeis University in partial fulfillment of the\\  requirements for the degree of:
    \end{spacing}

    \hspace{3in}\textbf{DOCTOR OF PHILOSOPHY}

    \vspace{3em}

    \hspace{3in}\@signoff, \@signofftitle

\hspace{3in}Graduate School of Arts and Sciences\\
    \vspace{1em}

    \noindent
    Dissertation Committee:

    \noindent
    \@committeechair, \@committeechairdept

    \noindent
    \@committeetwo, \@committeetwodept

    \noindent
    \@committeethree, \@committeethreedept

    \noindent
    \@outsidereader, \@outsidereaderdept, \@outsidereaderuni

    \newpage
    \setcounter{page}{3}
}
\newcommand{\makecopyright}{%
    \pagenumbering{gobble}
    \newgeometry{top=6.2in}
    \begin{center}
        Copyright by\\
        \@author{}\\
        \vspace{1em}
        \@year{}
    \end{center}
    \restoregeometry
    \newpage
    \pagenumbering{roman}
    \setcounter{page}{4}
}

\newenvironment{thesis-abstract}
    {
    %\newgeometry{top=1.4in}
    \addcontentsline{toc}{section}{Abstract}
    \begin{center}
        \MakeUppercase{Abstract}\\
        \vspace{1em}
        \@title\\
        \vspace{1em}
        A dissertation presented to the Faculty of the\\
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
\newcommand{\startbody}{%
    \newpage
    \pagenumbering{arabic}
    \doublespacing
}
\endinput
%%
%% End of file `brandeis-dissertation.cls'.
