%%
%% This is file `lebhart/lebhart.cls',
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
\ProvidesClass{lebhart}
    [2021/03/15 A colorful article style]
\def\colorclass@baseclass{article}
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
\if@colorclass@fast
    \PassOptionsToPackage{polyglossia}{colorist}
\fi
\RequirePackage{colorist}

%%================================
%% Fonts
%%================================
%% Math fonts in fast mode
\if@colorclass@fast
    \RequirePackage{mathpazo}
\fi

%% English fonts
\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage{fontspec}
\IfFontExistsTF{Palatino Linotype}{%
    \setmainfont{Palatino Linotype}
}{
    \setmainfont{texgyrepagella-regular.otf}[
        BoldFont       = texgyrepagella-bold.otf ,
        ItalicFont     = texgyrepagella-italic.otf ,
        BoldItalicFont = texgyrepagella-bolditalic.otf ]
}
    \setsansfont{SourceSansPro-Regular.otf}[
        Scale          = MatchLowercase,
        BoldFont       = SourceSansPro-Bold.otf ,
        ItalicFont     = SourceSansPro-RegularIt.otf ,
        BoldItalicFont = SourceSansPro-BoldIt.otf ]

%% Chinese fonts
\PassOptionsToPackage{fontset=none,scheme=plain}{ctex}
\RequirePackage{ctex}
\IfFontExistsTF{FZYouSongS 507R}{%
    \setCJKmainfont{FZYouSongS 507R}[
        BoldFont       = FZYouSongS 509R ,
        BoldFeatures   = {FakeBold=2} ,
        ItalicFont     = * ,
        BoldItalicFont = FZYouSongS 509R ,
        BoldItalicFeatures = {FakeBold=2} ,
        SmallCapsFont  = * ]
}{
    \setCJKmainfont{FandolSong-Regular.otf}[
        BoldFont       = FandolSong-Bold.otf ,
        ItalicFont     = FandolKai-Regular.otf ,
        BoldItalicFont = FandolKai-Regular.otf ,
        BoldItalicFeatures = {FakeBold=4} ,
        SmallCapsFont  = * ]
}
\IfFontExistsTF{FZYouSongS 507R}{%
    \setCJKmonofont{FZYouSongS 507R}[
        BoldFont       = FZYouSongS 509R ,
        BoldFeatures   = {FakeBold=2} ,
        ItalicFont     = * ,
        BoldItalicFont = FZYouSongS 509R ,
        BoldItalicFeatures = {FakeBold=2} ,
        SmallCapsFont  = * ]
}{
    \setCJKmonofont{FandolFang-Regular.otf}[
        BoldFont       = * ,
        BoldFeatures   = {FakeBold=4} ,
        ItalicFont     = * ,
        BoldItalicFont = * ,
        BoldItalicFeatures = {FakeBold=4} ,
        SmallCapsFont  = * ]
}
\IfFontExistsTF{FZYouHeiS 506L}{%
    \setCJKsansfont{FZYouHeiS 506L}[
        BoldFont       = FZYouHeiS 509R,
        ItalicFont     = * ,
        BoldItalicFont = FZYouHeiS 509R ,
        SmallCapsFont  = * ]
}{
    \setCJKsansfont{FandolHei-Regular.otf}[
        BoldFont       = FandolHei-Bold.otf ,
        ItalicFont     = * ,
        BoldItalicFont = FandolHei-Bold.otf ,
        SmallCapsFont  = * ]
}

%% Math font
\if@colorclass@fast\else
\PassOptionsToPackage
    {warnings-off={mathtools-colon,mathtools-overbracket}}{unicode-math}
\RequirePackage{unicode-math}
\unimathsetup{math-style=ISO}
\setmathfont{Asana-Math.otf}
\IfFontExistsTF{Neo Euler}{%
\setmathfont{Neo Euler} % From https://tex.stackexchange.com/a/425887
    [range={"0000-"0001,"0020-"007E,
            "00A0,"00A7-"00A8,"00AC,"00AF,"00B1,"00B4-"00B5,"00B7,
            "00D7,"00F7,
            "0131,
            "0237,"02C6-"02C7,"02D8-"02DA,"02DC,
            "0300-"030C,"030F,"0311,"0323-"0325,"032E-"0332,"0338,
            "0391-"0393,"0395-"03A1,"03A3-"03A8,"03B1-"03BB,
            "03BD-"03C1,"03C3-"03C9,"03D1,"03D5-"03D6,"03F5,
            "2016,"2018-"2019,"2021,"2026-"202C,"2032-"2037,"2044,
            "2057,"20D6-"20D7,"20DB-"20DD,"20E1,"20EE-"20EF,
            "210B-"210C,"210E-"2113,"2118,"211B-"211C,"2126-"2128,
            "212C-"212D,"2130-"2131,"2133,"2135,"2190-"2199,
            "21A4,"21A6,"21A9-"21AA,"21BC-"21CC,"21D0-"21D5,
            "2200,"2202-"2209,"220B-"220C,"220F-"2213,"2215-"221E,
            "2223,"2225,"2227-"222E,"2234-"2235,"2237-"223D,
            "2240-"224C,"2260-"2269,"226E-"2279,"2282-"228B,"228E,
            "2291-"2292,"2295-"2299,"22A2-"22A5,"22C0-"22C5,
            "22DC-"22DD,"22EF,"22F0-"22F1,
            "2308-"230B,"2320-"2321,"2329-"232A,"239B-"23AE,
            "23DC-"23DF,
            "27E8-"27E9,"27F5-"27FE,"2A0C,"2B1A,
            "1D400-"1D433,"1D49C,"1D49E-"1D49F,"1D4A2,"1D4A5-"1D4A6,
            "1D4A9-"1D4AC,"1D4AE-"1D4B5,"1D4D0-"1D4E9,"1D504-"1D505,
            "1D507-"1D50A,"1D50D-"1D514,"1D516-"1D51C,"1D51E-"1D537,
            "1D56C-"1D59F,"1D6A8-"1D6B8,"1D6BA-"1D6D2,"1D6D4-"1D6DD,
            "1D6DF,"1D6E1,"1D7CE-"1D7D7 }]
}{}
\fi

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
%% End of file `lebhart/lebhart.cls'.
