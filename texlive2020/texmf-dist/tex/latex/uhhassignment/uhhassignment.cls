%%
%% This is file `uhhassignment.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% uhhassignment.dtx  (with options: `class')
%% 
%% Copyright (C) 2017 by Kim Wittenburg
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.3 of this license or (at your option) any later
%% version.  The latest version of this license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of
%% LaTeX version 2005/12/01 or later.

\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{uhhassignment}[2017/04/22 v1.0 The UHH-Assignment Class]



\newif\ifuhhassignment@numberedsheets
\DeclareOption{unnumberedsheets}{
    \uhhassignment@numberedsheetsfalse
}

\DeclareOption{numberedsheets}{
    \uhhassignment@numberedsheetstrue
}

\newif\ifuhhassignment@repeatauthor
\uhhassignment@repeatauthorfalse
\DeclareOption{repeatauthor}{
    \uhhassignment@repeatauthortrue
}

\newif\ifuhhassignment@shorttitle
\DeclareOption{shorttitle}{
    \uhhassignment@shorttitletrue
}

\DeclareOption{longtitle}{
    \uhhassignment@shorttitlefalse
}

\newif\ifuhhassignment@shortheader
\DeclareOption{shortheader}{
    \uhhassignment@shortheadertrue
}

\DeclareOption{longheader}{
    \uhhassignment@shortheaderfalse
}

\ExecuteOptions{longtitle,longheader,numberedsheets}

\ProcessOptions\relax
\LoadClassWithOptions{scrartcl}

%%%%%%%% Dependencies %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%\fi

\RequirePackage[utf8]{inputenc} % UTF-8 Encoding
\RequirePackage{cmap} % Special Characters
\RequirePackage[T1]{fontenc} % Font Encoding
\RequirePackage[ngerman]{babel} % German Language
\RequirePackage{etoolbox} % Programming
\RequirePackage{calc} % Calculations

\RequirePackage[a4paper,
                left=25mm,
                right=25mm,
                top=20mm,
                bottom=50mm]{geometry} % Page Margins

\RequirePackage[headsepline]{scrlayer-scrpage} % Header and Footer
\RequirePackage{lastpage} % Page Numbers

\RequirePackage{amsmath} % Maths
\RequirePackage{amssymb} % Maths
\RequirePackage{amsthm} % Beweise
\RequirePackage{enumitem} % Customizable Enumerations

\RequirePackage{xcolor} % Colors
\RequirePackage{framed} % Colored Boxes
\RequirePackage[colorlinks,linkcolor=black]{hyperref} % References
\RequirePackage{lmodern} % Better Font

%%%%%%%%%% Constants %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%\fi


\def\uhhassignment@sheetid{Aufgabenblatt}
\def\uhhassignment@groupid{Übungsgruppe}

%%%%%%% Custom Commands %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%\fi

\newcommand{\university}[2][]{
    \ifstrempty{#1}{
        \gdef\@shortuniversity{#2}
    }{
        \gdef\@shortuniversity{#1}
    }
    \gdef\@university{#2}
}

\newcommand{\course}[2][]{
    \ifstrempty{#1}{
        \gdef\@shortcourse{#2}
    }{
        \gdef\@shortcourse{#1}
    }
    \gdef\@course{#2}
}

\newcommand{\teacher}[1]{
    \gdef\@teacher{#1}
}

\newcommand{\group}[1]{
    \gdef\@group{#1}
}

\newcommand{\sheetno}[1]{
    \gdef\@sheetno{#1}
}

\newcommand{\id}[1]{\\\ttfamily\footnotesize(#1)}

\renewcommand{\author}[2][]{
    \ifstrempty{#1}{
        \gdef\@shortauthor{#2}
    }{
        \gdef\@shortauthor{#1}
    }
    \gdef\@author{#2}
}

\university[Uni Hamburg]{Universität Hamburg}
\def\@course{
    \ClassWarning{uhhassignment}{No \protect\course\space given}
}
\let\@shortcourse\@course
\group{}
\def\@teacher{
    \ClassWarning{uhhassignment}{No \protect\teacher\space given}
}
\let\@shortteacher\@teacher
\def\@sheetno{
    \ClassWarning{uhhassignment}{No \protect\sheetno\space given}
}
\def\@shortauthor{
    \ClassWarning{uhhassignment}{No short \protect\author\space given}
}
\title{}



\newcommand{\todomark}{%
    \colorbox{purple}{%
        \textnormal\ttfamily\bfseries\color{white}%
        TODO%
    }%
}

\newcommand{\todo}[1][]{%
    \ifstrempty{#1}{%
        \def\todotext{Todo}%
    }{%
        \def\todotext{Todo: #1}%
    }%
    \todomark%
    {%
        \marginpar{%
            \raggedright\normalfont\sffamily\scriptsize\todotext%
        }%
    }%
}


\setcounter{secnumdepth}{0}

\newcounter{task}
\newcommand{\task}[2][]{%
    \ifstrempty{#1}{%
        \stepcounter{task}%
    }{%
        \setcounter{task}{#1}%
    }%
    \ifstrempty{#2}{%
        \section{Aufgabe \arabic{task}}%
    }{%
        \section{Aufgabe \arabic{task}: #2}%
    }%
}

\newcounter{subtask}[task]
\newcommand{\subtask}[2][]{%
    \ifstrempty{#1}{%
        \stepcounter{subtask}%
    }{%
        \setcounter{subtask}{#1}%
    }%
    \ifstrempty{#2}{%
        \subsection{Teilaufgabe \arabic{task}.\arabic{subtask}}%
    }{%
        \subsection{\arabic{task}.\arabic{subtask}. #2}%
    }%
}

\newcounter{subsubtask}[subtask]
\newcommand{\subsubtask}[2][]{%
    \ifstrempty{#1}{%
        \stepcounter{subsubtask}%
    }{%
        \setcounter{subsubtask}{#1}%
    }%
    \ifstrempty{#2}{%
        \subsection{\arabic{task}.\arabic{subtask}.\arabic{subsubtask}}
    }{%
        \subsubsection{\arabic{task}.\arabic{subtask}.\arabic{subsubtask}. #2}%
    }%
}

%%%%%%%%% Page Setup %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%\fi


\setlength{\headheight}{50pt}
\pagestyle{scrheadings}
\clearpairofpagestyles

\ifuhhassignment@shortheader
    \ifuhhassignment@numberedsheets
        \ihead{\textbf{\@shortcourse}\\\uhhassignment@sheetid{} \@sheetno}
    \else
        \ihead{\textbf{\@shortcourse}}
    \fi
    \ohead{\textbf{\@shortuniversity}\\\@date}
\else
    \ifuhhassignment@numberedsheets
        \ihead{\textbf{\@course}\\\uhhassignment@sheetid{} \@sheetno}
    \else
        \ihead{\textbf{\@course}}
    \fi
    \ohead{\textbf{\@university}\\\@date}
\fi

\setkomafont{pagefoot}{\textnormal}
\ifuhhassignment@repeatauthor
    \ifoot[\@shortauthor]{\@shortauthor}
    \ofoot[Seite \pagemark{} von \pageref{LastPage}]{Seite \pagemark{} von \pageref{LastPage}}
\else
    \cfoot[Seite \pagemark{} von \pageref{LastPage}]{Seite \pagemark{} von \pageref{LastPage}}
\fi

\newpagestyle{firstpage}[]{%
    \ihead{}
    \cfoot{\pagemark{}}
}

%%%%%%%%%%% Layout %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%\fi


\setlength{\parskip}{5pt}

\setkomafont{section}{\normalfont\bfseries\LARGE}
\setkomafont{subsection}{\normalfont\bfseries\Large}
\setkomafont{subsubsection}{\normalfont\bfseries\large}
\RedeclareSectionCommands[afterskip=.25\baselineskip]{section}
\RedeclareSectionCommands[
    beforeskip=0.5\baselineskip,
    afterskip=.125\baselineskip]{subsection}

\renewcommand*{\maketitle}{%
    \thispagestyle{plain}%

    \newif\ifextended
    \extendedtrue

    \ifuhhassignment@shorttitle
        \let\university\@shortuniversity
        \let\course\@shortcourse
    \else
        \let\university\@university
        \let\course\@course
    \fi

    \ifdefempty{\@title}{%
        \ifdefempty{\@group}{%
            \def\metaleft{\@teacher}%
            \def\metaright{\@date}%
            \def\titleright{}%
            \extendedfalse
        }{%
            \def\metaleft{\uhhassignment@sheetid{} \@group}%
            \def\metaright{\@teacher}%
            \def\titleright{\@date}%
        }%
        \def\titleleft{}%
        \ifuhhassignment@numberedsheets
            \def\title{\uhhassignment@sheetid{} \@sheetno}%
        \else
            % Title remains user-specified
        \fi
    }{%
        \ifdefempty{\@group}{%
            \def\metaleft{}%
            \def\metaright{\@teacher}%
        }{%
            \def\metaleft{\uhhassignment@groupid{} \@group}%
            \def\metaright{\@teacher}%
        }%
        \ifuhhassignment@numberedsheets
            \def\titleleft{\uhhassignment@sheetid{} \@sheetno}%
        \else
            \def\titleleft{}
        \fi
        \def\titleright{\@date}%
        \def\title{\@title}%
    }%


    \begingroup% Heading Group
        \usekomafont{pageheadfoot}%
        \usekomafont{pagehead}%
        \setlength{\parskip}{0pt}%

        \textbf{\course} \hfill \textbf{\university}\par%

        \begin{minipage}[t]{\widthof{\metaleft}}%
            \metaleft%
        \end{minipage}%
        \hfill%
        \begin{minipage}[t]{\widthof{\metaright}}%
            \raggedleft%
            \metaright%
        \end{minipage}%
    \endgroup%

    \ifextended%
        \vspace{\baselineskip}%
    \fi%

    \begingroup% Secondary Title Groupt
        \Large\bfseries\titleleft\hfill\titleright%
    \endgroup%

    \begingroup% Title Group
        \begin{center}%
            \Huge\textsc{\title}%
        \end{center}%
    \endgroup%

    \begingroup% Author Group
        \setlength{\baselineskip}{2.75\baselineskip}%
        \vspace{-\baselineskip}%
        \begin{center}%
            \begin{tabular}[t]{c}%
                \@author%
            \end{tabular}%
        \end{center}%
    \endgroup%
}

\endinput
%%
%% End of file `uhhassignment.cls'.
