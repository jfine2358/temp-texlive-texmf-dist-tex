%%
%% This is file `tikzposter.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% tikzposter.dtx  (with options: `tikzposter.cls')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2012 by Pascal Richter and Richard Barnard
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.2 of this license or (at your option) any later
%% version. The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of
%% LaTeX version 2012/09/01 or later.
%% 



\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tikzposter}[2012/09/01 v1.0 LaTeX document class for Posters]

 % Loading Packages
\usepackage{xkeyval}
\usepackage{calc}
\usepackage{ifthen}
\usepackage{ae}
\usepackage{xstring}
\usepackage{etoolbox}
\usepackage{tikz}
    \usetikzlibrary{shapes,decorations,shadows,backgrounds,calc,fadings}
    \usepgflibrary{arrows}

 % Parameter
\def\@institute{~}
\newif\ifTP@showlatexaffectionproof
\newdimen\TP@innermargin
\newdimen\TP@visibletextwidth
\newdimen\TP@visibletextheight
\newif\ifTP@IsBlockWithTitle
\newif\ifTP@hugefontsize
 % Title parameter
\newdimen\TP@titleinnersep
\newdimen\TP@titletoblockverticalspace
\newdimen\TP@titlewidth
\def\TP@titleleftfig{}
\def\TP@titlerightfig{}
\newdimen\TP@titleleftfigheight{}
\newdimen\TP@titlerightfigheight{}
\newdimen\TP@titleleftfigwidth{}
\newdimen\TP@titlerightfigwidth{}
\newif\ifTP@titleHasLeftFig
\newif\ifTP@titleHasRightFig
\newif\ifTP@titleIsEmbedded
\newif\ifTP@titleIsSeparated
 % Block parameter
\newdimen\TP@blockverticalspace
\newdimen\TP@blocktop
\newdimen\TP@blockbottom
\newdimen\TP@blockcenter
\newdimen\TP@blockwidth
\newif\ifTP@blockHasVariableWidth
\newdimen\TP@blockbodyinnersep
\newbox\TP@blockbodybox
\newbox\TP@blocktitlebox
\newdimen\TP@blocktitleinnersep
\newdimen\TP@blocktitleheight
\newdimen\TP@blocktitletobodydist
\def\TP@blocktitleratio{}
\newdimen\TP@blocktitlewidth
\newdimen\TP@blocktitlemaxwidth
\newif\ifTP@blocktitleLeft
\newif\ifTP@blocktitleCenter
\newif\ifTP@blocktitleRight
 % Column parameter
\newif\ifTP@columnEnvironment
\newif\ifTP@subcolumnEnvironment
\newdimen\TP@colspace
\newdimen\TP@coltop
\newdimen\TP@colbottom
\newdimen\TP@colcenter
\newdimen\colwidth
\newdimen\TP@subcolspace
\newdimen\TP@subcoltop
\newdimen\TP@subcolbottom
\newdimen\TP@subcolcenter
\newdimen\subcolwidth

 % Declaring options
\DeclareOptionX{12pt}{\TP@hugefontsizefalse \PassOptionsToClass{\CurrentOption}{extarticle}}
\DeclareOptionX{14pt}{\TP@hugefontsizefalse \PassOptionsToClass{\CurrentOption}{extarticle}}
\DeclareOptionX{17pt}{\TP@hugefontsizefalse \PassOptionsToClass{\CurrentOption}{extarticle}}
\DeclareOptionX{20pt}{\TP@hugefontsizefalse \PassOptionsToClass{\CurrentOption}{extarticle}}
\DeclareOptionX{25pt}{\TP@hugefontsizetrue}
\DeclareOptionX{fleqn}{\PassOptionsToClass{\CurrentOption}{extarticle}}
\DeclareOptionX{leqno} {\PassOptionsToClass{\CurrentOption}{extarticle}}
\DeclareOptionX{a0paper}{\PassOptionsToPackage{\CurrentOption}{geometry}}
\DeclareOptionX{a1paper}{\PassOptionsToPackage{\CurrentOption}{geometry}}
\DeclareOptionX{a2paper}{\PassOptionsToPackage{\CurrentOption}{geometry}}
\DeclareOptionX{landscape}{\PassOptionsToPackage{\CurrentOption}{geometry}}
\DeclareOptionX{portrait}{\PassOptionsToPackage{\CurrentOption}{geometry}}
\DeclareOptionX{margin}[20mm]{\PassOptionsToPackage{margin=#1}{geometry}}
\DeclareOptionX{innermargin}{\TP@innermargin=#1}
\DeclareOptionX{titleinnersep}{\TP@titleinnersep=#1}
\DeclareOptionX{titletoblockverticalspace}{\TP@titletoblockverticalspace=#1}
\DeclareOptionX{blocktitleinnersep}{\TP@blocktitleinnersep=#1}
\DeclareOptionX{blocktitlewidthratio}{\def\TP@blocktitleratio{#1}}
\DeclareOptionX{blocktitlemaxwidth}{\TP@blocktitlemaxwidth=#1}
\DeclareOptionX{blockbodyinnersep}{\TP@blockbodyinnersep=#1}
\DeclareOptionX{blockverticalspace}{\TP@blockverticalspace=#1}
\DeclareOptionX{colspace}{\TP@colspace=#1}
\DeclareOptionX{subcolspace}{\TP@subcolspace=#1}
\DeclareOptionX*{{\PackageWarning{tikzposter}{Unknown Option \CurrentOption.}}}

 % Executing options
\ExecuteOptionsX{
    25pt,
    a0paper,
    portrait,
    margin=20mm,
    innermargin=15mm,
    titleinnersep=8mm,
    titletoblockverticalspace=20mm,
    blocktitleinnersep=8mm,
    blocktitlewidthratio=0.8,
    blocktitlemaxwidth=25cm,
    blockbodyinnersep=8mm,
    blockverticalspace=15mm,
    colspace=15mm,
    subcolspace=8mm
}
\ProcessOptionsX \relax
\LoadClass{extarticle}
\RequirePackage{geometry}
\ifTP@hugefontsize
    \input{a0size.sty}
    \renewcommand{\tiny}{\fontsize{12}{14}\selectfont}
    \renewcommand{\scriptsize}{\fontsize{14.4}{18}\selectfont}
    \renewcommand{\footnotesize}{\fontsize{17.28}{22}\selectfont}
    \renewcommand{\small}{\fontsize{20.74}{25}\selectfont}
    \renewcommand{\normalsize}{\fontsize{24.88}{30}\selectfont}
    \renewcommand{\large}{\fontsize{29.86}{37}\selectfont}
    \renewcommand{\Large}{\fontsize{35.83}{45}\selectfont}
    \renewcommand{\LARGE}{\fontsize{43}{54}\selectfont}
    \renewcommand{\huge}{\fontsize{51.6}{64}\selectfont}
    \renewcommand{\Huge}{\fontsize{61.92}{77}\selectfont}
\fi
\normalsize
\pagestyle{empty}
\setlength{\TP@visibletextwidth}{\textwidth-2\TP@innermargin}
\setlength{\TP@visibletextheight}{\textheight-2\TP@innermargin}

 % Color themes
\input{tikzposter-colorthemes}
\gdef\usecolortheme#1{
    \ifcsname TP@colortheme#1\endcsname
        \csname TP@colortheme#1\endcsname % call macro
    \else
        \IfFileExists{#1.tex}{
            \input{#1.tex} % load tex file
        }{ \PackageWarning{tikzposter}{Unknown colortheme `#1'.} }
    \fi
}

 % TikZ layout styles
\input{tikzposter-layoutstyles}
\tikzstyle{TP@tikzstylebackground} = [inner sep=0pt, line width=0pt, color=framecolor, shading=axis,
    top color=backgroundcolortop, bottom color=backgroundcolorbottom, middle color=backgroundcolormiddle]

 % Macro to set TikZ layout style
\gdef\settitlebodystyle#1{
    \pgfkeys@ifcsname pgfk@/tikz/TP@tikzstyle#1/.@cmd\endcsname
        \tikzstyle{TP@tikzstyletitlebody}=[TP@tikzstyle#1]
    \else
        \tikzstyle{TP@tikzstyletitlebody}=[#1]
    \fi
}
\gdef\setblocktitlestyle#1{
    \pgfkeys@ifcsname pgfk@/tikz/TP@tikzstyle#1/.@cmd\endcsname
        \tikzstyle{TP@tikzstyleblocktitle}=[TP@tikzstyle#1]
    \else
        \tikzstyle{TP@tikzstyleblocktitle}=[#1]
    \fi
}
\gdef\setblockbodystyle#1{
    \pgfkeys@ifcsname pgfk@/tikz/TP@tikzstyle#1/.@cmd\endcsname
        \tikzstyle{TP@tikzstyleblockbody}=[TP@tikzstyle#1]
    \else
        \tikzstyle{TP@tikzstyleblockbody}=[#1]
    \fi
}

 % Title layout
\gdef\institute#1{\gdef\@institute{#1}}
\gdef\tikzposterlatexaffectionproofon{\TP@showlatexaffectionprooftrue}
\gdef\tikzposterlatexaffectionproofoff{\TP@showlatexaffectionprooffalse}
\gdef\maketitle{
    \vbox{
        \centering
        \color{titlefgcolor}
        {\bfseries \Huge \sc \@title}
        \\[1em]   {\huge \@author}
        \\[1em]   {\LARGE \@institute}
    } \normalsize
}

 % Default document settings
\TP@colorthemedefault
\TP@showlatexaffectionprooftrue
\settitlebodystyle{rounded}
\setblocktitlestyle{rounded}
\setblockbodystyle{rounded}

 % Document environment
\AtBeginDocument{%
    \begin{center}
    \begin{tikzpicture}
        \shadedraw[TP@tikzstylebackground] (-0.5\textwidth, -0.5\textheight) rectangle (0.5\textwidth, 0.5\textheight);
}

\AtEndDocument{%
        \ifTP@showlatexaffectionproof
            \node[anchor=south east] at (0.5\textwidth, -0.5\textheight){\footnotesize \LaTeX~TikZposter class};
        \fi
    \end{tikzpicture}
    \end{center}
}

 % Columns environment
\newenvironment{columns}{
    \TP@columnEnvironmenttrue
    \setlength{\TP@colcenter}{-0.5\TP@visibletextwidth-\TP@colspace-\TP@blockbodyinnersep}
    \global\TP@colcenter=\TP@colcenter
    \global\TP@coltop=\TP@blocktop
    \global\TP@colbottom=\TP@blocktop
    \colwidth=0pt
}{
    \TP@columnEnvironmentfalse
    \global\TP@blocktop=\TP@colbottom
}

 % Column
\gdef\column#1{  % #1: relative width
    \ifTP@columnEnvironment
        \normalsize
        \setlength{\TP@blocktop}{\TP@coltop}
        \setlength{\TP@colcenter}{\TP@colcenter+0.5\colwidth+\TP@blockbodyinnersep+\TP@colspace+\TP@blockbodyinnersep}
        \setlength{\colwidth}{#1\TP@visibletextwidth+#1\TP@colspace-\TP@colspace-2\TP@blockbodyinnersep}
        \setlength{\TP@colcenter}{\TP@colcenter+0.5\colwidth}
    \fi
}

 % Subcolumns environment
\newenvironment{subcolumns}{
    \ifTP@columnEnvironment
        \TP@subcolumnEnvironmenttrue
        \setlength{\TP@subcolcenter}{\TP@colcenter-0.5\colwidth-\TP@blockbodyinnersep-\TP@subcolspace-\TP@blockbodyinnersep}
        \global\TP@subcolcenter=\TP@subcolcenter
        \global\TP@subcoltop=\TP@blocktop
        \global\TP@subcolbottom=\TP@blocktop
        \subcolwidth=0pt
    \fi
}{
    \TP@subcolumnEnvironmentfalse
    \global\TP@blocktop=\TP@subcolbottom
}

 % Subcolumn
\gdef\subcolumn#1{  % #1: relative width
    \ifTP@subcolumnEnvironment
        \normalsize
        \setlength{\TP@blocktop}{\TP@subcoltop}
        \setlength{\TP@subcolcenter}{\TP@subcolcenter+0.5\subcolwidth+\TP@blockbodyinnersep+\TP@subcolspace+\TP@blockbodyinnersep}
        \setlength{\subcolwidth}{#1\colwidth+#1\TP@blockbodyinnersep+#1\TP@blockbodyinnersep
            +#1\TP@subcolspace-\TP@subcolspace-2\TP@blockbodyinnersep}
        \setlength{\TP@subcolcenter}{\TP@subcolcenter+0.5\subcolwidth}
    \fi
}

\define@key{titleblock}{left fig}{\IfFileExists{#1}{ \TP@titleHasLeftFigtrue \def\TP@titleleftfig{#1}}{\TP@titleHasLeftFigfalse}}
\define@key{titleblock}{left fig height}{\setlength\TP@titleleftfigheight{#1}}
\define@key{titleblock}{right fig}{\IfFileExists{#1}{ \TP@titleHasRightFigtrue \def\TP@titlerightfig{#1}}{\TP@titleHasRightFigfalse}}
\define@key{titleblock}{right fig height}{\setlength\TP@titlerightfigheight{#1}}
\define@boolkey{titleblock}{embedded}[true]{\ifKV@titleblock@embedded \TP@titleIsEmbeddedtrue \else \TP@titleIsEmbeddedfalse \fi}
\define@boolkey{titleblock}{separated}[true]{\ifKV@titleblock@separated \TP@titleIsSeparatedtrue \else \TP@titleIsSeparatedfalse \fi}
\presetkeys{titleblock}{left fig=, left fig height=10em, right fig=, right fig height=10em, embedded=false, separated=false}{}

\newcommand\titleblock[1][]{
    \normalsize
    \setkeys{titleblock}{#1}  % #1: keys
    % Set title width
    \ifTP@titleIsEmbedded
        \setlength\TP@titlewidth{\textwidth-2\TP@titleinnersep}
    \else
        \setlength\TP@titlewidth{\TP@visibletextwidth-2\TP@titleinnersep}
        % Draw non-embedded background
        \shadedraw [TP@tikzstylebackground] (-0.5\textwidth, -0.5\textheight) rectangle (0.5\textwidth, 0.5\textheight);
    \fi
    % Set left figure width
    \ifTP@titleHasLeftFig
        \settowidth{\TP@titleleftfigwidth}{\includegraphics[height=\TP@titleleftfigheight]{\TP@titleleftfig}}
    \else
        \TP@titleleftfigwidth=0pt
    \fi
    % Set right figure width
    \ifTP@titleHasRightFig
        \settowidth{\TP@titlerightfigwidth}{\includegraphics[height=\TP@titlerightfigheight]{\TP@titlerightfig}}
    \else
        \TP@titlerightfigwidth=0pt
    \fi
    % Title node
    \ifthenelse{\boolean{TP@titleIsEmbedded}}{
    \node[draw, inner sep=\TP@titleinnersep, line width=0pt, anchor=north, color=framecolor,
        minimum width=\TP@visibletextwidth-2\TP@titleinnersep, shading=axis,
        top color=embeddedtitlebgcolortop, bottom color=embeddedtitlebgcolorbottom]
        (title) at (0, 0.5\textheight)
    }{
        \node[TP@tikzstyletitlebody, inner sep=\TP@titleinnersep, anchor=north, color=framecolor,
            shading=axis, top color=titlebgcolortop, bottom color=titlebgcolorbottom]
            (title) at (0, 0.5\TP@visibletextheight)
    }
    % Content of the node
    {
        \begin{minipage}{\TP@titlewidth}
            % Left logo
            \ifTP@titleHasLeftFig
                \begin{minipage}{\TP@titleleftfigwidth}
                    \includegraphics[height=\TP@titleleftfigheight]{\TP@titleleftfig}
                \end{minipage}%
            \fi
            % Make non-separated title
            \begin{minipage}{\TP@titlewidth-\TP@titleleftfigwidth-\TP@titlerightfigwidth}
                \centering \ifTP@titleIsSeparated ~ \else  \maketitle  \fi
            \end{minipage}%
            % Right logo
            \ifTP@titleHasRightFig
                \begin{minipage}{\TP@titlerightfigwidth}
                    \includegraphics[height=\TP@titlerightfigheight]{\TP@titlerightfig}
                \end{minipage}%
            \fi
        \end{minipage}%
    };
    % Draw embedded background
    \ifTP@titleIsEmbedded
        \draw let \p1 = (title.south) in node {\global\TP@blockbottom=\y1};
        \shadedraw [TP@tikzstylebackground] (-0.5\textwidth, -0.5\textheight) rectangle (0.5\textwidth, \TP@blockbottom);
    \fi
    % Make separated title
    \ifTP@titleIsSeparated
        \node[anchor=north] (title) at ($(title.south)-(0em,2em)$){
            \begin{minipage}{\TP@visibletextwidth}
                \maketitle
            \end{minipage}};%
    \fi
    % Set parameter
    \draw let \p1 = (title.south) in node {
        \setlength{\TP@blocktop}{\y1-\TP@titletoblockverticalspace}
        \global\TP@blocktop=\TP@blocktop
    };
}

 % Block
\define@boolkey{block}{l}[true]{\ifKV@block@l \TP@blocktitleLefttrue \TP@blocktitleCenterfalse \TP@blocktitleRightfalse \fi}
\define@boolkey{block}{c}[true]{\ifKV@block@c \TP@blocktitleLeftfalse \TP@blocktitleCentertrue \TP@blocktitleRightfalse \fi}
\define@boolkey{block}{r}[true]{\ifKV@block@r \TP@blocktitleLeftfalse \TP@blocktitleCenterfalse \TP@blocktitleRighttrue \fi}
\define@key{block}{width}{\TP@blockHasVariableWidthtrue \setlength{\TP@blockwidth}{#1}}
\presetkeys{block}{}{}

\newcommand\block[3][]{  % #1 keys   #2 title   #3 text
    % Reset parameter
    \normalsize
    \TP@blockHasVariableWidthfalse
    \TP@blocktitleLeftfalse
    \TP@blocktitleCentertrue
    \TP@blocktitleRightfalse
    % Set block width and center
    \ifTP@subcolumnEnvironment
        \TP@blockwidth=\subcolwidth
        \TP@blockcenter=\TP@subcolcenter
    \else
        \ifTP@columnEnvironment
            \TP@blockwidth=\colwidth
            \TP@blockcenter=\TP@colcenter
        \else
            \setlength\TP@blockwidth{\TP@visibletextwidth-2\TP@blockbodyinnersep}
            \TP@blockcenter=0pt
        \fi
    \fi
    % Set block width and title alignment
    \setkeys{block}{#1}
    % Check if block title is given and set height of title
    \ifstrempty{#2}{
     \TP@IsBlockWithTitlefalse
     \setlength{\TP@blocktitleheight}{0pt}
    }{
     \TP@IsBlockWithTitletrue
     \setlength\TP@blocktitlewidth{\minof{\TP@blockwidth*\real{\TP@blocktitleratio}}{\TP@blocktitlemaxwidth}}
        \setbox\TP@blocktitlebox=\hbox{
            \pgfinterruptpicture
            \parbox{\TP@blocktitlewidth}{ \bf \LARGE \centering #2}
            \endpgfinterruptpicture}
         \TP@blocktitleheight=\ht\TP@blocktitlebox
         \advance\TP@blocktitleheight by \dp\TP@blocktitlebox
         \addtolength{\TP@blocktitleheight}{2\TP@blocktitleinnersep}
    }
    % Block body
    \setbox\TP@blockbodybox=\hbox{
 \begin{pgfinterruptpicture}
 \begin{minipage}{\TP@blockwidth}
\large \color{blockbodyfgcolor}#3
\end{minipage}
\end{pgfinterruptpicture}
}
    \node[TP@tikzstyleblockbody, text width=\TP@blockwidth, inner sep=\TP@blockbodyinnersep, anchor=north,
        color=framecolor, fill=blockbodybgcolor]  (block)
        at (\TP@blockcenter,  \TP@blocktop-0.5\TP@blocktitleheight)%
    {
        \setlength{\TP@blocktitletobodydist}{0.5\TP@blocktitleheight}
        \vskip\TP@blocktitletobodydist
        {\large \color{blockbodyfgcolor}#3}
        \normalsize
    };
    % Block title (if it is given)
    \ifTP@IsBlockWithTitle
        % Set title alignment
        \ifTP@blocktitleLeft
            \node[TP@tikzstyleblocktitle, inner sep=\TP@blocktitleinnersep, color=framecolor, fill=blocktitlebgcolor, text=blocktitlefgcolor]
                at ($(block.north)+(-\TP@blockwidth/2+\TP@blocktitlewidth/2+2em,0)$) {\box\TP@blocktitlebox \normalsize};
        \fi
        \ifTP@blocktitleCenter
            \node[TP@tikzstyleblocktitle, inner sep=\TP@blocktitleinnersep, color=framecolor, fill=blocktitlebgcolor, text=blocktitlefgcolor]
                at (block.north) {\box\TP@blocktitlebox \normalsize};
        \fi
        \ifTP@blocktitleRight
            \node[TP@tikzstyleblocktitle, inner sep=\TP@blocktitleinnersep, color=framecolor, fill=blocktitlebgcolor, text=blocktitlefgcolor]
                at ($(block.north)+(\TP@blockwidth/2-\TP@blocktitlewidth/2-2em,0)$) {\box\TP@blocktitlebox \normalsize};
        \fi
    \fi
    % Set parameter
    \draw let \p1 = (block.south) in node {
        \setlength{\TP@blocktop}{\y1-\TP@blockverticalspace}
        \global\TP@blocktop=\TP@blocktop
    };
    \ifTP@subcolumnEnvironment
        \setlength{\TP@subcolbottom}{\minof{\TP@subcolbottom}{\TP@blocktop}}
        \global\TP@subcolbottom=\TP@subcolbottom
    \else
        \ifTP@columnEnvironment
            \setlength{\TP@colbottom}{\minof{\TP@colbottom}{\TP@blocktop}}
            \global\TP@colbottom=\TP@colbottom
        \fi
    \fi
}
\endinput
%%
%% End of file `tikzposter.cls'.
