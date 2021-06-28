%%
%% This is file `colorist/colorbook.cls',
%% generated with the docstrip utility.

%% Copyright (C) 2021 by Jinwen XU
%% 
%% This is part of the colorist class series.
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
\ProvidesClass{colorbook}
    [2021/03/15 A colorful book style]
\def\colorclass@baseclass{book}
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{
    family = @colorclass,
    prefix = @colorclass@,
}
\DeclareBoolOption[false]{draft}
\DeclareBoolOption[false]{fast}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{\colorclass@baseclass}}
\ProcessKeyvalOptions*\relax
\LoadClass{\colorclass@baseclass}
\if@colorclass@draft
    \@colorclass@fasttrue
\fi

%%================================
%% Page layout
%%================================
\RequirePackage[heightrounded]{geometry}
\geometry{
    % papersize={8in,11in},
    a4paper,
    total={47em,70em},
    hmarginratio=1:1,
    vmarginratio=1:1,
    footnotesep=2em plus 2pt minus 2pt,
}

\RequirePackage{indentfirst}

\if@colorclass@fast
    \PassOptionsToPackage{fast}{colorist}
\fi
\RequirePackage{colorist}

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

\if@colorclass@fast
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
%% End of file `colorist/colorbook.cls'.
