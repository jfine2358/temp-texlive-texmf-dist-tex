%%
%% This is file `minimalist/minimbook.cls',
%% generated with the docstrip utility.

%% Copyright (C) 2021 by Jinwen XU
%% 
%% This is part of the minimalist class series.
%% 
%% This work may be distributed and/or modified under the conditions of the
%% LaTeX Project Public License, either version 1.3c of this license or (at
%% your option) any later version. The latest version of this license is in
%% 
%%     http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3c or later is part of all distributions of LaTeX version
%% 2005/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[2020-10-01]
\ProvidesClass{minimbook}
    [2021/03/15 A simple and clear book style]
\def\minimclass@baseclass{book}
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{
    family = @minimclass,
    prefix = @minimclass@,
}
\DeclareBoolOption[false]{draft}
\DeclareBoolOption[false]{fast}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{\minimclass@baseclass}}
\ProcessKeyvalOptions*\relax
\LoadClass{\minimclass@baseclass}
\if@minimclass@draft
    \@minimclass@fasttrue
\fi

%%================================
%% Page layout
%%================================
\RequirePackage[heightrounded]{geometry}
\geometry{
    papersize={7in,10in},
    total={40em,60em},
    hmarginratio=1:1,
    vmarginratio=1:1,
    footnotesep=2em plus 2pt minus 2pt,
}

\if@minimclass@fast
    \PassOptionsToPackage{fast}{minimalist}
\fi
\RequirePackage{minimalist}
\AtEndPreamble{\RequirePackage{parskip}}

%%================================
%% Fonts
%%================================
\RequirePackage{iftex}
\ifPDFTeX
\RequirePackage[T1]{fontenc}
\RequirePackage{inputenc}
\fi
\RequirePackage{mathpazo}
\RequirePackage{newpxtext}

\RequirePackage[verbose=silent]{microtype}

%%================================
%% Graphics
%%================================
\RequirePackage{graphicx}
\graphicspath{{images/}}
\RequirePackage{wrapfig}
\RequirePackage{caption}

%%================================
%% Index
%%================================
\RequirePackage{imakeidx}
\pretocmd{\printindex}{\LocallyStopLineNumbers}{}{\FAIL}
\apptocmd{\printindex}{\ResumeLineNumbers}{}{\FAIL}

%%================================
%% Draft mark
%%================================
\def\dnfFont{\ttfamily}
\def\needgraphFont{\ttfamily}

\def\dnfTextEN{To be finished here}
\def\needgraphTextEN{A graph is needed here}
\def\dnfTextFR{À terminer ici}
\def\needgraphTextFR{Il manque encore un graphique ici}
\def\dnfTextCN{这里的内容尚未完成}
\def\needgraphTextCN{这里需要一张图片}

\definecolor{dnfColor}{RGB}{21,122,20}
\definecolor{needgraphColor}{RGB}{70,130,180}

\if@minimclass@fast
    \newcommand{\plainBox}[2][-paper]{\textcolor{#1}{%
    \setlength{\fboxsep}{1.5pt}%
    \setlength{\fboxrule}{1.2pt}%
    \fbox{#2}}}
\else
    \PassOptionsToPackage{many}{tcolorbox}
    \RequirePackage{tcolorbox}
    \newtcbox{\plainBox}[1][-paper]{enhanced jigsaw,%
        on line, arc = 1.2pt, outer arc = 1pt,breakable,%
        colframe = #1,colupper=#1,opacityback=0,%
        boxsep = 1pt,boxrule = 1.2pt,%
        left = 1pt, right = 1pt, top = 0pt, bottom = 0pt,%
    }
\fi

\NewDocumentCommand{\dnf}{d<>}{%
    \noindent\plainBox[dnfColor]%
    {\normalfont\dnfFont\bfseries\small%
    \csname dnfText\csname\languagename ABBR\endcsname\endcsname%
    \IfNoValueF{#1}{ : #1}}%
}
\NewDocumentCommand{\needgraph}{d<>}{%
    \par%
    \centerline{\plainBox[needgraphColor]%
    {\normalfont\needgraphFont\bfseries\small%
    \csname needgraphText\csname\languagename ABBR\endcsname\endcsname%
    \IfNoValueF{#1}{ : #1}}}%
    \par%
}

\endinput
%%
%% End of file `minimalist/minimbook.cls'.
