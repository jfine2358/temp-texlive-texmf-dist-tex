%%
%% This is file `mla.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% mla.dtx  (with options: `mla')
%% 
%% This is a generated file.
%% 
%% Copyright 2019 Seth Price
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.3 of this license or any later version.
%% The latest version of this license is in:
%% 
%%   https://www.latex-project.org/lppl/lppl-1-3c/
%% 
%% and version 1.3c or later is part of all distributions
%% of LaTeX version 2008/05/04 or later.
%% 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mla}
    [2019/05/29 v0.6 MLA Paper Class]

\LoadClass[letterpaper,12pt]{article}
\newcommand{\mladate}{%
    \the\day\
    \ifcase\the\month
        \or January
        \or February
        \or March
        \or April
        \or May
        \or June
        \or July
        \or September
        \or October
        \or November
        \or December
    \fi
    \the\year
}
\newif\ifMLA@seven
\newif\ifMLA@eight
\newif\ifMLA@eightalt
\newif\ifMLA@microtype
\DeclareOption{mla7}{\MLA@seventrue\MLA@eightfalse\MLA@eightaltfalse}
\DeclareOption{mla8}{\MLA@sevenfalse\MLA@eighttrue\MLA@eightaltfalse}
\DeclareOption{mla8alt}{\MLA@sevenfalse\MLA@eightfalse\MLA@eightalttrue}
\DeclareOption{microtype}{\MLA@microtypetrue}
\DeclareOption*{%
    \ClassWarning{mla}{Unknown option `\CurrentOption'; ignoring}
}
\ExecuteOptions{mla8}
\ProcessOptions\relax
\RequirePackage{caption}
\RequirePackage{enotez}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{float}
\RequirePackage{fullpage}
\RequirePackage{graphicx}
\RequirePackage{ragged2e}
\RequirePackage{newtxtext}
\RequirePackage{titlesec}
\RequirePackage{xstring}
\RequirePackage[american]{babel}
\RequirePackage{csquotes}
\RequirePackage{hanging}
\ifMLA@seven
    \RequirePackage[style=mla,noremoteinfo=false,showmedium=true,
                    backend=biber]{biblatex}
\fi
\ifMLA@eight
    \RequirePackage[style=mla-new,noremoteinfo=false,
                    showmedium=false,backend=biber]{biblatex}
\fi
\ifMLA@eightalt
    \RequirePackage[style=mla,noremoteinfo=false,
                    showmedium=false,backend=biber]{biblatex}
\fi
\ifMLA@microtype
    \RequirePackage{microtype}
\fi
\RequirePackage{hyperref}
\hypersetup{hidelinks,pdfusetitle}
\ifMLA@microtype
    \microtypesetup{activate=false}
\fi
\linespread{1.905}
\hyphenpenalty=10000
\pretolerance=10000
\newlength{\MLA@indent}
\setlength{\MLA@indent}{0.5in}
\setlength{\parindent}{\MLA@indent}
\setlength{\RaggedRightParindent}{\MLA@indent}
\setlength{\parskip}{0em}
\setlength{\topsep}{0em}
\setlength{\partopsep}{0em}
\let\@afterindentfalse\@afterindenttrue
\@afterindenttrue
\widowpenalty=0
\clubpenalty=0
\interlinepenalty=0
\RaggedRight
\renewenvironment{noindent}{%
    \edef\tmpind{\parindent}
    \setlength{\parindent}{0pt}
}{%
    \setlength{\parindent}{\tmpind}
    \undef{\tmpind}
}
\setlength{\textheight}{9in}
\setlength{\textwidth}{6.5in}
\fancypagestyle{norule}{%
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}
\fancyhf{}
\pagestyle{headings}
\pagestyle{norule}
\fancyhead[RO]{{\StrBehind{\@author}{ }[\last]\last} \thepage}
\setlength{\headheight}{18pt}
\setlength{\headsep}{12pt}
\setlength{\voffset}{-34pt}
\newcommand*{\professor}[1]{\gdef\@professor{#1}}
\newcommand*{\course}[1]{\gdef\@course{#1}}
\title{}
\author{}
\professor{}
\course{}
\date{\mladate}
\newcommand{\makemlaheader}{%
    \begin{noindent}
        \@author \\
        \@professor \\
        \@course \\
        \@date \\
        \begin{center}\@title\end{center}
    \end{noindent}
}
\renewcommand{\maketitle}{\makemlaheader}
\AtBeginDocument{\maketitle}
\renewcommand{\thesection}{\@arabic\c@section}
\renewcommand{\thesubsection}{\thesection.\@arabic\c@subsection}
\renewcommand{\thesubsubsection}{\thesubsection.\@arabic\c@subsubsection}
\titleformat*{\section}{\normalsize\sc}
\titleformat*{\subsection}{\normalsize\sc}
\titleformat*{\subsubsection}{\normalsize\sc}
\titlespacing*{\section}{0pt}{0pt}{0pt}
\titlespacing*{\subsection}{0pt}{0pt}{0pt}
\titlespacing*{\subsubsection}{0pt}{0pt}{0pt}
\titlelabel{\thetitle. }
\setlist[itemize]{%
    parsep=0pt,
    itemsep=0pt,
    topsep=0pt,
    leftmargin=\MLA@indent
}
\setlist[enumerate]{%
    parsep=0pt,
    itemsep=0pt,
    topsep=0pt,
    leftmargin=\MLA@indent
}
\renewenvironment{blockquote}{%
    \list{}{\leftmargin \MLA@indent}
    \item[]
    \setlength{\parindent}{\MLA@indent}
    \vspace{-\topsep}
}{%
    \endlist
    \vspace{-\topsep}
}
\setlength{\floatsep}{\baselineskip}
\setlength{\intextsep}{\baselineskip}
\setlength{\textfloatsep}{\baselineskip}
\g@addto@macro\@floatboxreset\centering
\renewcommand{\float@endH}{%
    \vspace{-12pt}
    \@endfloatbox\vskip\intextsep
    \if@flstyle\setbox\@currbox\float@makebox\columnwidth\fi
    \box\@currbox\vskip\intextsep\relax\@doendpe
}
\captionsetup{%
    font={normalfont},
    labelformat=simple,
    labelsep=period,
    position=bottom,
    aboveskip=6pt,
    belowskip=-10pt
}
\captionsetup[figure]{name=Fig.}
\newenvironment{paper}{}{}
\newenvironment{notes}{%
    \newpage
    \begin{noindent}
        \pdfbookmark[0]{Notes}{notes}
        \begin{center}Notes\end{center}
    \end{noindent}
}{}
\newlist{mlanotes}{description}{1}
\setlist[mlanotes]{%
    parsep=0pt,
    itemsep=0pt,
    topsep=0pt,
    leftmargin=\MLA@indent
}
\DeclareInstance{enotez-list}{mla}{list}{%
    heading = {},
    format = \normalsize\normalfont,
    list-type = mlanotes
}
\setenotez{list-name={},list-style=mla,backref}
\newenvironment{workscited}{%
    \newpage
    \begin{noindent}
        \pdfbookmark[0]{Works Cited}{workscited}
        \begin{center}Works Cited\end{center}
    \end{noindent}
    \vspace{-16pt} % XXX to counter unexplained space
}{}
\setlength{\bibhang}{\MLA@indent}
\endinput
%%
%% End of file `mla.cls'.
