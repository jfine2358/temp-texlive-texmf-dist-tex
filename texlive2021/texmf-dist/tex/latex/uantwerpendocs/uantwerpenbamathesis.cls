%%
%% This is file `uantwerpenbamathesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% uantwerpendocs.dtx  (with options: `bmt')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2013-2021  by Walter Daems <walter.daems@uantwerpen.be>
%% 
%% This work may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.3 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of LaTeX version
%% 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Walter Daems.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{uantwerpenbamathesis}
    [2021/03/23 v3.2 .dtx skeleton file]
\def\fileversion{3.2}
\def\filedate{2021/03/23}
\newif\if@titlepagenoartwork
\DeclareOption{titlepagenoartwork}{\@titlepagenoartworktrue}
\newif\if@titlepagetableonly
\DeclareOption{titlepagetableonly}{\@titlepagetableonlytrue}
\newif\if@filled
\DeclareOption{filled}{\@filledtrue}
\ExecuteOptions{a4paper,11pt,final,oneside,openright}
\ProcessOptions\relax
\LoadClassWithOptions{book}
\setlength{\parindent}{0pt}
\addtolength{\parskip}{0.75\baselineskip}
\setcounter{secnumdepth}{3}
\RequirePackage[top=1in, bottom=1in, left=1in, right=1in]{geometry}
\RequirePackage{iftex}
\RequirePackage{xstring}
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\IfFileExists{shellesc.sty}{\RequirePackage{shellesc}}{}
\newcommand{\@emptymacro}{}
\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage{tikz}
\usetikzlibrary{positioning}
\RequirePackage{eso-pic}
\RequirePackage{fancyhdr}
\definecolor{uacorpbord}{cmyk}     {0.00,1.00,0.60,0.37}
\definecolor{uacorpblue}{cmyk}     {1.00,0.25,0.00,0.50}
\definecolor{uacorplightblue}{cmyk}{1.00,0.00,0.08,0.13}
\definecolor{uacorporange}{cmyk}   {0.00,0.32,1.00,0.09}
\definecolor{uaftifresh}{cmyk}     {0.34,1.00,0.00,0.00}
\definecolor{uaftisober}{cmyk}     {0.10,1.00,0.00,0.49}
\definecolor{lightgray}{cmyk}      {0.00,0.00,0.00,0.05}
\definecolor{darkgray}{cmyk}       {0.00,0.00,0.00,0.80}
\definecolor{watermark}{cmyk}      {0.00,0.00,0.00,0.05}
\newcommand\uaname{University of Antwerp}
\newcommand\arrname{All rights reserved}
\newcommand\orname{of}
\newcommand\domainname{uantwerp.be}
\newcommand\datename{Date}
\newcommand\subjectname{Subject}
\newcommand\academicyearname{Academic year}
\newcommand\masterthesisname{Master's thesis}
\newcommand\bachelorthesisname{Bachelor's thesis}
\newcommand\supervisorsname{Supervisors}
\newcommand\juryname{Jury}
\newcommand\jurymembersname{Members}
\newcommand\jurychairmanname{Chairman}
\newcommand\bmthesisname{Thesis to obtain the degree of}
\newcommand\pthesisnamei{Thesis submitted in fulfilment of the
  requirements for the degree of}
\newcommand\pthesisnameii{at University of Antwerp}
\newcommand\@faculty{~}
\newcommand\@logo{Logos/logo-uantwerpen-ua-en-cmyk-pos}
\newcommand\faccpg{
  \renewcommand\@faculty{Centre Pieter Gillis}
  \renewcommand\@logo{Logos/logo-uantwerpen-ua-en-cmyk-pos}}
\newcommand\facfbd{
  \renewcommand\@faculty{Faculty of Pharmaceutical, Biomedical and
    Veterinary Sciences}
  \renewcommand\@logo{Logos/logo-uantwerpen-fbd-en-cmyk-pos}}
\newcommand\facggw{
  \renewcommand\@faculty{Faculty of Medicine and Health Sciences}
  \renewcommand\@logo{Logos/logo-uantwerpen-ggw-en-cmyk-pos}}
\newcommand\insiob{
  \renewcommand\@faculty{Insitute of Development Policy}
  \renewcommand\@logo{Logos/logo-uantwerpen-iob-en-cmyk-pos}}
\newcommand\asoe{
  \renewcommand\@faculty{Antwerp School of Education}
  \renewcommand\@logo{Logos/logo-uantwerpen-ua-en-cmyk-pos}}
\newcommand\faclw{
  \renewcommand\@faculty{Faculty of Arts}
  \renewcommand\@logo{Logos/logo-uantwerpen-lw-en-cmyk-pos}}
\newcommand\facow{
  \renewcommand\@faculty{Faculty of Design Sciences}
  \renewcommand\@logo{Logos/logo-uantwerpen-ow-en-cmyk-pos}}
\newcommand\facsw{
  \renewcommand\@faculty{Faculty of Social Sciences}
  \renewcommand\@logo{Logos/logo-uantwerpen-sw-en-cmyk-pos}}
\newcommand\facre{
  \renewcommand\@faculty{Faculty of Law}
  \renewcommand\@logo{Logos/logo-uantwerpen-re-en-cmyk-pos}}
\newcommand\facbe{
  \renewcommand\@faculty{Faculty of Business and Economics}
  \renewcommand\@logo{Logos/logo-uantwerpen-be-en-cmyk-pos}}
\newcommand\facti{
  \renewcommand\@faculty{Faculty of Applied Engineering}
  \renewcommand\@logo{Logos/logo-uantwerpen-ti-en-cmyk-pos}}
\newcommand\facwe{
  \renewcommand\@faculty{Faculty of Science}
  \renewcommand\@logo{Logos/logo-uantwerpen-we-en-cmyk-pos}}
\newcommand\weightname{Weight}
\AtBeginDocument{
  \@ifpackageloaded{babel}{
    \addto\captionsdutch{%
      \renewcommand\uaname{Universiteit Antwerpen}
      \renewcommand\arrname{Alle rechten voorbehouden}
      \renewcommand\orname{van}
      \renewcommand\domainname{uantwerpen.be}
      \renewcommand\subjectname{Onderwerp}%
      \renewcommand\datename{Datum}%
      \renewcommand\academicyearname{Academiejaar}
      \renewcommand\masterthesisname{Masterproef}
      \renewcommand\bachelorthesisname{Bachelorproef}
      \renewcommand\supervisorsname{Promotoren}
      \renewcommand\juryname{Jury}
      \renewcommand\jurymembersname{Leden}
      \renewcommand\jurychairmanname{Voorzitter}
      \renewcommand\bmthesisname{Proefschrift tot het behalen van de
        graad van}
      \renewcommand\pthesisnamei{Proefschrift voorgelegd tot het
        behalen van de graad van}
      \renewcommand\pthesisnameii{aan de \uaname{} te
        verdedigen door}
      \renewcommand\faccpg{
        \renewcommand\@faculty{Centrum Pieter Gillis}
        \renewcommand\@logo{Logos/logo-uantwerpen-ua-nl-cmyk-pos}}
      \renewcommand\facfbd{
        \renewcommand\@faculty{
          Faculteit Farmaceutische, Biomedische en Diergeneeskundige
          Wetenschappen}
        \renewcommand\@logo{Logos/logo-uantwerpen-fbd-nl-cmyk-pos}}
      \renewcommand\facggw{
        \renewcommand\@faculty{Faculteit Geneeskunde en
          Gezondheidswetenschappen}
        \renewcommand\@logo{Logos/logo-uantwerpen-ggw-nl-cmyk-pos}}
      \renewcommand\insiob{
        \renewcommand\@faculty{Instituut voor Ontwikkelingsbeleid- en
          beheer}
        \renewcommand\@logo{Logos/logo-uantwerpen-iob-nl-cmyk-pos}}
      \renewcommand\asoe{
        \renewcommand\@faculty{Antwerp School of Education}
        \renewcommand\@logo{Logos/logo-uantwerpen-ua-nl-cmyk-pos}}
      \renewcommand\faclw{\renewcommand\@faculty{Faculteit
          Letteren en Wijsbegeerte}
        \renewcommand\@logo{Logos/logo-uantwerpen-lw-nl-cmyk-pos}}
      \renewcommand\facow{
        \renewcommand\@faculty{Faculteit Ontwerpwetenschappen}
        \renewcommand\@logo{Logos/logo-uantwerpen-ow-nl-cmyk-pos}}
      \renewcommand\facsw{
        \renewcommand\@faculty{Faculteit Sociale Wetenschappen}
        \renewcommand\@logo{Logos/logo-uantwerpen-sw-nl-cmyk-pos}}
     \renewcommand\facre{
        \renewcommand\@faculty{Faculteit Rechten}
        \renewcommand\@logo{Logos/logo-uantwerpen-re-nl-cmyk-pos}}
      \renewcommand\facbe{
        \renewcommand\@faculty{Faculteit Bedrijfswetenschappen en Economie}
        \renewcommand\@logo{Logos/logo-uantwerpen-be-nl-cmyk-pos}}
      \renewcommand\facti{
        \renewcommand\@faculty{Faculteit Toegepaste
          Ingenieurswetenschappen}
        \renewcommand\@logo{Logos/logo-uantwerpen-ti-nl-cmyk-pos}}
      \renewcommand\facwe{
        \renewcommand\@faculty{Faculteit Wetenschappen}
        \renewcommand\@logo{Logos/logo-uantwerpen-we-nl-cmyk-pos}}
      \renewcommand\weightname{Gewicht}
    }
  }
  {}
}
\newcommand{\@facultyacronym}{~}
\newcommand{\facultyacronym}[1]{
  \renewcommand{\@facultyacronym}{#1}
  \AtBeginDocument{
    \ifthenelse{\equal{#1}{CPG}}{\faccpg}{
    \ifthenelse{\equal{#1}{FBD}}{\facfbd}{
    \ifthenelse{\equal{#1}{GGW}}{\facggw}{
    \ifthenelse{\equal{#1}{IOB}}{\insiob}{
    \ifthenelse{\equal{#1}{ASoE}}{\asoe}{
    \ifthenelse{\equal{#1}{LW}}{\faclw}{
    \ifthenelse{\equal{#1}{OW}}{\facow}{
    \ifthenelse{\equal{#1}{SW}}{\facsw}{
    \ifthenelse{\equal{#1}{RE}}{\facre}{
    \ifthenelse{\equal{#1}{BE}}{\facbe}{
    \ifthenelse{\equal{#1}{TI}}{\facti}{
    \ifthenelse{\equal{#1}{WE}}{\facwe}{
      \errmessage{Error: wrong faculty acronym; choose one of CPG, FBD, GGW,
        IOB, ASoE, LW, OW, SW, RE, BE, TI, WE}}}}}}}}}}}}}}
}
\newcommand{\@subtitle}{Master's thesis}
\newcommand\@supervisori{\errmessage{Please define a supervisor of
    your thesiswork using the \textbackslash{}supervisori to iv
    commands} in the preamble of your document.}
\newcommand\@supervisoriaff{}
\newcommand\@supervisorii{}
\newcommand\@supervisoriiaff{}
\newcommand\@supervisoriii{}
\newcommand\@supervisoriiiaff{}
\newcommand\@supervisoriv{}
\newcommand\@supervisorivaff{}
\newcommand{\supervisori}[2]{
  \renewcommand\@supervisori{#1}\renewcommand\@supervisoriaff{#2}}
\newcommand{\supervisorii}[2]{
  \renewcommand\@supervisorii{#1}\renewcommand\@supervisoriiaff{#2}}
\newcommand{\supervisoriii}[2]{
  \renewcommand\@supervisoriii{#1}\renewcommand\@supervisoriiiaff{#2}}
\newcommand{\supervisoriv}[2]{
  \renewcommand\@supervisoriv{#1}\renewcommand\@supervisorivaff{#2}}
\newcommand{\@diplomalevel}{ERROR}
\newcommand{\@diploma}{ERROR}
\newcommand{\diploma}[1]{
  \newcommand{\MoS}{Master of Science}
  \newcommand{\MoSIW}{Master of Science in de industri\"ele wetenschappen}
  \newcommand{\BoSIW}{Bachelor of Science in de industri\"ele wetenschappen}
  \newcommand{\MoSTEW}{Master of Science in de toegepaste economische wetenschappen}
  \renewcommand{\@diploma}{
    \ifthenelse{\equal{#1}{BA-IW-BK}}
                          {\BoSIW: bouwkunde}{
    \ifthenelse{\equal{#1}{BA-IW-BCH}}
                          {\BoSIW: biochemie}{
    \ifthenelse{\equal{#1}{BA-IW-CH}}
                          {\BoSIW: chemie}{
    \ifthenelse{\equal{#1}{BA-IW-EI}}
                          {\BoSIW: elektronica-ICT}{
    \ifthenelse{\equal{#1}{BA-IW-EM}}
                          {\BoSIW: elektromechanica}{
    \ifthenelse{\equal{#1}{MA-IW-BK}}
                          {\MoSIW: bouwkunde}{
    \ifthenelse{\equal{#1}{MA-IW-BCH}}
                          {\MoSIW: biochemie}{
    \ifthenelse{\equal{#1}{MA-IW-CH}}
                          {\MoSIW: chemie}{
    \ifthenelse{\equal{#1}{MA-IW-EI}}
                          {\MoSIW: elektronica-ICT}{
    \ifthenelse{\equal{#1}{MA-IW-EI-CPS}}
                          {\MoSIW:\\elektronica-ICT, optie
                            Cyber-Physical Systems}{
    \ifthenelse{\equal{#1}{MA-IW-EI-IOT}}
                          {\MoSIW:\\elektronica-IOT, optie Internet of
                          Things}{
    \ifthenelse{\equal{#1}{MA-IW-EI-DAI}}
                          {\MoSIW:\\elektronica-IOT, optie Distributed
                            Artificial Intelligence}{
    \ifthenelse{\equal{#1}{MA-IW-EM-OE}}
                          {\MoSIW:\\elektromechanica, optie Offshore
                            Engineering}{
    \ifthenelse{\equal{#1}{MA-IW-EM-EN}}
                          {\MoSIW:\\elektromechanica, optie Energie}{
    \ifthenelse{\equal{#1}{MA-IW-EM-OP}}
                          {\MoSIW:\\elektromechanica, optie Ontwerp en
                          Productie}{
    \ifthenelse{\equal{#1}{MA-IW-EM-AU}}
                          {\MoSIW:\\elektromechanica, optie Automatisering}{
    \ifthenelse{\equal{#1}{MA-IW-EM}}
                          {\MoSIW:\\elektromechanica}{
    \ifthenelse{\equal{#1}{MA-BE-HI}}
                          {\MoS handelsingenieur}{
    \ifthenelse{\equal{#1}{MA-BE-HIBI}}
                          {\MoS handelsingenieur in de beleidsinformatica}{
    \ifthenelse{\equal{#1}{MA-BE-EB}}
                          {\MoSTEW: economisch beleid}{
    \ifthenelse{\equal{#1}{MA-BE-BK}}
                          {\MoSTEW: bedrijfskunde}
    {\errmessage{Error in argument to macro diploma: must be one of
        BA-IW-XXX with XXX one of BK, BCH, CH, EI or EM, or MA-IW-XXX
        with XXX one of BK, BCH, CH, EI, EI-CPS, EI-IOT, EI-DAI,
        EM-OE, EM-AU, EM-OP, EM-EN, MA-BE-YYY with YYY one of HI,
        HIBI, EB, BK! <<}}}}}}}}}}}}}}}}}}}}}}
  }
  \newcommand\thesisname{ERROR}
  \IfSubStr{#1}{MA-}{\renewcommand\thesisname{\masterthesisname}}{}
  \IfSubStr{#1}{BA-}{\renewcommand\thesisname{\bachelorthesisname}}{}
}
\newcommand\@defensedate{ERROR}
\newcommand{\defensedate}[1]{\renewcommand\@defensedate{#1}}
\newcommand\@defenselocation{Antwerpen}
\newcommand{\defenselocation}[1]{\renewcommand\@defenselocation{#1}}
\newcommand{\@academicyear}{XXX-YYYY}
\newcommand{\academicyear}[1]{\renewcommand{\@academicyear}{#1}}
\if@twoside
  \lhead[\thepage]{\slshape\rightmark}
  \chead[]{}
  \rhead[\slshape\leftmark]{\thepage}
  \lfoot[]{}
  \cfoot[]{}
  \rfoot[]{}
\else
  \lhead[]{\leftmark}
  \chead[]{}
  \rhead[]{\thepage}
  \lfoot[]{}
  \cfoot[]{}
  \rfoot[]{}
\fi

\pgfmathsetmacro{\ua@Wh}{\paperwidth}
\pgfmathsetmacro{\ua@Xh}{0.2\paperheight}
\pgfmathsetmacro{\ua@Yh}{0.125\paperheight}
\pgfmathsetmacro{\ua@XMYh}{\ua@Xh-\ua@Yh}
\pgfmathsetmacro{\ua@Rh}{0.5*\ua@Wh/\ua@XMYh*\ua@Wh+0.5*\ua@XMYh}
\pgfmathsetmacro{\ua@Qh}{\ua@Rh-\ua@Xh+\paperheight}
\pgfmathsetmacro{\ua@Wba}{0.4*\paperwidth}
\pgfmathsetmacro{\ua@Sba}{0.125*\paperheight}
\pgfmathsetmacro{\ua@XMYba}{0.02\paperheight}
\pgfmathsetmacro{\ua@Rba}{0.5*\ua@Wba/\ua@XMYba*\ua@Wba+0.5*\ua@XMYba}
\pgfmathsetmacro{\ua@Qba}{\ua@Rba+\ua@Sba}
\pgfmathsetmacro{\ua@Wbb}{0.65*\paperwidth}
\pgfmathsetmacro{\ua@Sbb}{0.14*\paperheight}
\pgfmathsetmacro{\ua@XMYbb}{0.06\paperheight}
\pgfmathsetmacro{\ua@Rbb}{0.5*\ua@Wbb/\ua@XMYbb*\ua@Wbb+0.5*\ua@XMYbb}
\pgfmathsetmacro{\ua@Qbb}{\ua@Rbb+\ua@Sbb}
\pgfmathsetmacro{\ua@ll}{0.15*\paperwidth}
\pgfmathsetmacro{\ua@l}{0.4*\paperwidth}
\pgfmathsetmacro{\ua@d}{0.1in}
\pgfmathsetmacro{\ua@rr}{0.85*\paperwidth}
\renewcommand\maketitle{%
  \pagestyle{empty}
  \begin{titlepage}
    \begin{tikzpicture}[remember picture,overlay]
      \node at (current page.center) {
        \begin{tikzpicture}[inner sep=0pt]
          \clip (0,0) rectangle(\paperwidth,\paperheight);
          \if@titlepagenoartwork\else
          \filldraw [lightgray]
          (0.55\paperwidth,\ua@Qba pt) circle (\ua@Rba pt);
          \filldraw [white] (0.35\paperwidth,\ua@Qbb pt) circle (\ua@Rbb pt);
          \filldraw [lightgray] (0,\ua@Qh pt) circle (\ua@Rh pt);
          \path
          (0.95\paperwidth,0.1\paperheight)
          node [anchor=north east] {
            \includegraphics[width=0.25\paperwidth]{\@logo}};
          \fi
          \path
          (\ua@ll pt,0.77\paperheight)
          node [anchor=north west, text width=0.7\paperwidth] {
            \uppercase\expandafter{\uaname}\\~\\
            \academicyearname{} \@academicyear\\~\\
            {\large \@faculty{}}\\~\\
            \thesisname{}\\[0.05\paperheight]
            {\Large \bf \@title{}}}
          (\ua@ll pt,0.55\paperheight)
          node [anchor = north west, text width = 0.7\paperwidth] {
            {\large \bf \@author{}}\\~\\~\\
            \begin{tabular}{@{}p{2.7cm}p{10.8cm}}
              \textbf{\supervisorsname{}:}
              & \@supervisori \\
              & \@supervisorii \\
              & \@supervisoriii \\
              & \@supervisoriv
            \end{tabular}
          }
          (\ua@ll pt,0.3\paperheight)
          node [anchor=north west, text width = 0.7\paperwidth]{%
            \bmthesisname\\
            \@diploma\\
            \@defenselocation, \@defensedate
          };
        \end{tikzpicture}
      };
    \end{tikzpicture}
  \end{titlepage}%
  \clearpage
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \pagestyle{fancy}
  \thispagestyle{empty}
}
\newcommand\makefinalpage{
  \cleardoublepage
  \thispagestyle{empty}
  \begin{tikzpicture}[remember picture,overlay]
    \node at (current page.center) {
      \begin{tikzpicture}[inner sep=0pt]
        \clip (0,0) rectangle(\paperwidth,\paperheight);
        \if@titlepagenoartwork\else
        \filldraw [lightgray] (\paperwidth,\ua@Qh pt) circle (\ua@Rh pt);
        \fi
      \end{tikzpicture}
    };
  \end{tikzpicture}
}
\IfFileExists{varioref.sty}{\RequirePackage{varioref}}{}
\IfFileExists{hyperref.sty}{
    \RequirePackage[backref,hyperindex=true,pagebackref=true]{hyperref}
    \hypersetup{
      breaklinks=true,
      colorlinks=true,
      citecolor=black,
      filecolor=black,
      linkcolor=black,
      pageanchor=true,
      pdfpagemode=UseOutlines,
      urlcolor=black
    }
    \AtBeginDocument{
      \hypersetup{
        pdftitle={\@title},
        pdfsubject={\@subtitle},
        pdfauthor={\@author}
      }
    }
}{}
\endinput
%%
%% End of file `uantwerpenbamathesis.cls'.
