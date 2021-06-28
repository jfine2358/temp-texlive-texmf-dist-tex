%%
%% This is file `mynsfc.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% mynsfc.dtx  (with options: `class')
%% ----------------------------------------------------------------
%% mynsfc --- A XeLaTeX template for writing the main body of NSFC proposals.
%% Author:  Fei Qi
%% E-mail:  fred.qi@ieee.org
%% License: Released under the LaTeX Project Public License v1.3c or later
%% See:     http://www.latex-project.org/lppl.txt
%% ----------------------------------------------------------------
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{mynsfc}
    [2016/07/11 v1.01 A LaTeX class for writing NSFC proposals.]
%% Options
\newif\ifmynsfc@subfig\mynsfc@subfigfalse
\newif\ifmynsfc@arabicpart\mynsfc@arabicpartfalse
\DeclareOption{subfig}{\mynsfc@subfigtrue}
\DeclareOption{arabicpart}{\mynsfc@arabicparttrue}
\ExecuteOptions{}
\ProcessOptions
%% Load default class
\LoadClass[a4paper,fleqn]{article}
%% Load required packages
\RequirePackage{titlesec}
\RequirePackage{marvosym}
\RequirePackage{bm,amsmath,amssymb}
\RequirePackage{paralist}
\RequirePackage{graphicx}
\ifmynsfc@subfig
\RequirePackage[config]{subfig}
\else
\RequirePackage{subcaption}
\fi
\RequirePackage{xcolor}
\RequirePackage{calc}
\RequirePackage{hyperref}
\hypersetup{%
  breaklinks=true,
  colorlinks=true,
  allcolors=black,
  pdfpagelabels}
\urlstyle{same}
%% Load and setup package biblatex
\RequirePackage[backend=biber,
                url=true,
                isbn=false,
                defernumbers=true,
                style=ieee]{biblatex}

\appto{\bibfont}{\wuhao}
\defbibheading{reftype}[\bibname]{\subsection*{#1}}
\defbibheading{cvtype}[\bibname]{\paragraph{#1}}
\defbibfilter{conference}{type=inproceedings or type=incollection}

\RequirePackage{xpatch}% or use http://tex.stackexchange.com/a/40705

\@ifpackagelater{biblatex}{2016/03/01}
{
\newcommand*{\list@bold@authors}{}
\newcommand{\initauthors}[1]{
  \renewcommand*{\list@bold@authors}{}
  \forcsvlist{\listadd\list@bold@authors}{#1}}

\newboolean{bold}
\renewcommand*{\mkbibnamefamily}[1]{\ifthenelse{\boolean{bold}}{\textbf{#1}}{#1}}
\renewcommand*{\mkbibnamegiven}[1]{\ifthenelse{\boolean{bold}}{\textbf{#1}}{#1}}

\newbibmacro*{name:bold}{%
  \setboolean{bold}{false}%
  \def\do##1{\iffieldequalstr{hash}{##1}{\setboolean{bold}{true}\listbreak}{}}%
  \dolistloop{\list@bold@authors}%
}

\xpretobibmacro{name:family}{\begingroup\usebibmacro{name:bold}}{}{}{}{}
\xpretobibmacro{name:given-family}{\begingroup\usebibmacro{name:bold}}{}{}{}{}
\xpretobibmacro{name:family-given}{\begingroup\usebibmacro{name:bold}}{}

\xapptobibmacro{name:family}{\endgroup}{}{}{}{}
\xapptobibmacro{name:given-family}{\endgroup}{}{}{}{}
\xapptobibmacro{name:family-given}{\endgroup}{}{}{}{}
}
{
\newbibmacro*{name:bold}[2]{%
  \def\do##1{\ifstrequal{#1, #2}{##1}{\bfseries\listbreak}{}}%
  \dolistloop{\boldnames}}
\newcommand*{\boldnames}{}

\xpretobibmacro{name:last}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:first-last}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:last-first}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:delim}{\begingroup\normalfont}{}{}

\xapptobibmacro{name:last}{\endgroup}{}{}
\xapptobibmacro{name:first-last}{\endgroup}{}{}
\xapptobibmacro{name:last-first}{\endgroup}{}{}
\xapptobibmacro{name:delim}{\endgroup}{}{}
}
\newcommand{\dummyMacro}{}
%% Setup Chinese fonts with xeCJK
\RequirePackage[AutoFakeBold]{xeCJK}
\def\CJK@null{\kern\CJKnullspace\Unicode{48}{7}\kern\CJKnullspace}
\punctstyle{quanjiao}
\defaultfontfeatures{Mapping=tex-text} % after fontspec
\setCJKmainfont{仿宋_GB2312}
\setCJKsansfont{SimHei}
\setCJKmonofont{仿宋_GB2312}
\setCJKfamilyfont{song}{仿宋_GB2312}
\setCJKfamilyfont{hei}{SimHei}
\setCJKfamilyfont{kai}{KaiTi}
\setmainfont{Times New Roman}
\setmonofont{Courier Std}
\newcommand{\kai}{\CJKfamily{kai}} % 仿宋体
\newcommand{\song}{\CJKfamily{song}} % 宋体
\newcommand{\hei}{\CJKfamily{hei}} % 黑体
\def\kaiti{\kai}
\def\songti{\song}
\def\heiti{\hei}
\newlength\mynsfc@linespace
\newcommand{\mynsfc@choosefont}[2]{%
  \setlength{\mynsfc@linespace}{#2*\real{#1}}%
  \fontsize{#2}{\mynsfc@linespace}\selectfont}
\def\mynsfc@define@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \mynsfc@choosefont{##1}{#2}}}
\mynsfc@define@fontsize{chuhao}{42bp}
\mynsfc@define@fontsize{xiaochu}{36bp}
\mynsfc@define@fontsize{yihao}{26bp}
\mynsfc@define@fontsize{xiaoyi}{24bp}
\mynsfc@define@fontsize{erhao}{22bp}
\mynsfc@define@fontsize{xiaoer}{18bp}
\mynsfc@define@fontsize{sanhao}{16bp}
\mynsfc@define@fontsize{xiaosan}{15bp}
\mynsfc@define@fontsize{sihao}{14bp}
\mynsfc@define@fontsize{banxiaosi}{13bp}
\mynsfc@define@fontsize{xiaosi}{12bp}
\mynsfc@define@fontsize{dawu}{11bp}
\mynsfc@define@fontsize{wuhao}{10.5bp}
\mynsfc@define@fontsize{xiaowu}{9bp}
\mynsfc@define@fontsize{liuhao}{7.5bp}
\mynsfc@define@fontsize{xiaoliu}{6.5bp}
\mynsfc@define@fontsize{qihao}{5.5bp}
\mynsfc@define@fontsize{bahao}{5bp}
\setlength{\textwidth}{\paperwidth}
\setlength{\textheight}{\paperheight}
\setlength\marginparwidth{0mm}
\setlength\marginparsep{0mm}
\addtolength{\textwidth}{-50mm}
\setlength{\oddsidemargin}{0mm}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\headheight}{20pt}
\setlength{\topskip}{0mm}
\setlength{\skip\footins}{15pt}
\setlength{\topmargin}{-15mm}
\setlength{\footskip}{13mm}
\setlength{\headsep}{6mm}
\addtolength{\textheight}{-50mm}
\setlength{\parskip}{0pt \@plus2pt \@minus0pt}
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{20bp}
  \abovedisplayskip=10bp \@plus 2bp \@minus 2bp
  \abovedisplayshortskip=10bp \@plus 2bp \@minus 2bp
  \belowdisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\abovedisplayshortskip}
\def\ps@mynsfc@empty{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty}
\newenvironment{hcomment}{\vskip-3pt\color{gray}}{\vskip6pt}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\renewcommand{\contentsname}{内容目录}
\DeclareCaptionLabelFormat{mynsfc@cap}{{\wuhao#1\rmfamily#2}}
\DeclareCaptionLabelSeparator{mynsfc@sep}{\hspace{1em}}
\DeclareCaptionFont{mynsfc@capfont}{\wuhao}
\captionsetup{labelformat=mynsfc@cap,
              labelsep=mynsfc@sep,
              font=mynsfc@capfont,
              justification=centering}
\newlength\mynsfc@CJK@twochars
\newcommand{\mynsfc@unicode}[2]{\char\numexpr#1*256+#2\relax}
\def\mynsfc@CJK@space{\mynsfc@unicode{48}{7}}
\def\CJKindent{%
  \settowidth\mynsfc@CJK@twochars{\mynsfc@CJK@space\mynsfc@CJK@space}%
  \parindent\mynsfc@CJK@twochars}
\renewcommand{\maketitle}{%
  \begin{center}%
    \heiti\erhao\@title%
  \end{center}}
\ifmynsfc@arabicpart%
\renewcommand{\thepart}{\arabic{part}.}
\titleformat{\part}{\heiti\sanhao}{\thepart}{1ex}{}
\renewcommand{\thesection}{\arabic{section})}
\renewcommand{\thesubsection}{\Alph{subsection})}
\else%
\def\nsfc@CJKnumber#1{\ifcase#1{零}\or%
  {一}\or{二}\or{三}\or{四}\or{五}\or%
  {六}\or{七}\or{八}\or{九}\or{十}\or%
  {十一}\or{十二}\or{十三}\or{十四}\or{十五}\or%
  {十六}\or{十七}\or{十八}\or{十九}\or{二十}\fi}
\renewcommand{\thepart}{（\nsfc@CJKnumber{\c@part}）}
\titleformat{\part}{\heiti\sanhao}{\thepart}{0ex}{}
\renewcommand{\thesection}{\arabic{section}.}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
\fi

\titlespacing{\part}{0ex}{4ex}{2ex}

\@addtoreset{section}{part}
\titleformat{\section}{\heiti\xiaosan}{\thesection}{0.25em}{}
\titlespacing{\section}{0em}{4ex}{2ex}

\titleformat{\subsection}{\hei\sihao}{\thesubsection}{0.25em}{}
\titlespacing{\subsection}{0em}{2ex}{1ex}

\titleformat{\subsubsection}{\heiti\banxiaosi}{\thesubsubsection}{0.25em}{}
\titlespacing{\subsubsection}{0em}{2ex}{1ex}
\let\mynsfc@begindocumenthook\@begindocumenthook
\let\mynsfc@enddocumenthook\@enddocumenthook
\def\AtBeginDocument{\g@addto@macro\mynsfc@begindocumenthook}
\def\AtEndDocument{\g@addto@macro\mynsfc@enddocumenthook}
\def\@begindocumenthook{\mynsfc@begindocumenthook}
\def\@enddocumenthook{\mynsfc@enddocumenthook}
\AtBeginDocument{\ps@mynsfc@empty\CJKindent}
%% 
%% Copyright (C) 2015,2016 by Fei Qi <fred.qi@ieee.org>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License (LPPL), either
%% version 1.3c of this license or (at your option) any later
%% version.  The latest version of this license is in the file:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained" (as per LPPL maintenance status) by
%% Fei Qi.
%% 
%% This work consists of the file mynsfc.dtx and a Makefile.
%% Running "make" generates the derived files README, mynsfc.pdf and mynsfc.cls.
%% Running "make inst" installs the files in the user's TeX tree.
%% Running "make install" installs the files in the local TeX tree.
%% 
%%
%% End of file `mynsfc.cls'.
