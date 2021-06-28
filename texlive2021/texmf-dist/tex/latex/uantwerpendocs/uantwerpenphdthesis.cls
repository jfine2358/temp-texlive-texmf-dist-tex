%%
%% This is file `uantwerpenphdthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% uantwerpendocs.dtx  (with options: `pt')
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
\ProvidesClass{uantwerpenphdthesis}
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
\usepackage{ean13isbn}
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
\newcommand{\@subtitle}{~}
\newcommand{\@qrsubtitle}{}
\newcommand{\subtitle}[1]{%
  \renewcommand\@subtitle{#1}
  \ifx\@qrsubtitle\@emptymacro
    \renewcommand\@qrsubtitle{#1}
  \fi
}
\newcommand{\qrsubtitle}[1]{%
  \renewcommand\@qrsubtitle{#1}
}
\newcommand\@affiliation{\errmessage{Please, define the affiliation of
    the author using the \textbackslash{}affiliation command in the
  preamble of your document.}}
\newcommand\affiliation[1]{\renewcommand\@affiliation{#1}}
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
\newcommand{\@jurychairman}{\errmessage{Please define a chairman of the jurya
  using the \textbackslash{}jurychairman command in the preamble of
  your document.}}
\newcommand{\@jurychairmanaff}{}
\newcommand{\jurychairman}[2]{
  \renewcommand{\@jurychairman}{#1}\renewcommand{\@jurychairmanaff}{#2}}
\newcommand{\@jurymemberi}{\errmessage{Please define jury members
    using the \textbackslash{}jurymemberi to vi commands in the
    preamble of your document.}}
\newcommand\@jurymemberiaff{}
\newcommand\@jurymemberii{}
\newcommand\@jurymemberiiaff{}
\newcommand\@jurymemberiii{}
\newcommand\@jurymemberiiiaff{}
\newcommand\@jurymemberiv{}
\newcommand\@jurymemberivaff{}
\newcommand\@jurymemberv{}
\newcommand\@jurymembervaff{}
\newcommand\@jurymembervi{}
\newcommand\@jurymemberviaff{}
\newcommand{\jurymemberi}[2]{
  \renewcommand\@jurymemberi{#1}\renewcommand\@jurymemberiaff{#2}}
\newcommand{\jurymemberii}[2]{
  \renewcommand\@jurymemberii{#1}\renewcommand\@jurymemberiiaff{#2}}
\newcommand{\jurymemberiii}[2]{
  \renewcommand\@jurymemberiii{#1}\renewcommand\@jurymemberiiiaff{#2}}
\newcommand{\jurymemberiv}[2]{
  \renewcommand\@jurymemberiv{#1}\renewcommand\@jurymemberivaff{#2}}
\newcommand{\jurymemberv}[2]{
  \renewcommand\@jurymemberv{#1}\renewcommand\@jurymembervaff{#2}}
\newcommand{\jurymembervi}[2]{
  \renewcommand\@jurymembervi{#1}\renewcommand\@jurymemberviaff{#2}}
\newcommand\@phddegree{\errmessage{Please, specify the offical PhD
    degree description using the \textbackslash{}phddegree macro in
    the preamble of your document.}}
\newcommand\phddegree[1]{\renewcommand\@phddegree{#1}}
\newcommand{\@programmet}{} % type
\newcommand{\@programmec}{} % class
\newcommand{\@programmecqr}{} % class for qr code
\newcommand{\@programmes}{} % class
\newcommand{\@programmeq}{} % qualifier
\newcommand{\programme}[3]{%
    \ifthenelse{\equal{#1}{BA}}%
    {\renewcommand{\@programmet}{Bachelor of Science in de }}{%
    \ifthenelse{\equal{#1}{MA}}%
    {\renewcommand{\@programmet}{Master of Science in de }}{%
    \ifthenelse{\equal{#1}{PHD}}%
    {\renewcommand{\@programmet}{Doctor in de }}{%
    \ifthenelse{\equal{#1}{VP}}%
    {\renewcommand{\@programmet}{Voorbereidingsprogramma in de }}{%
    \ifthenelse{\equal{#1}{SP}}%
    {\renewcommand{\@programmet}{Schakelprogramma in de }}{%
    \ifthenelse{\equal{#1}{FREE}}%
    {}{
    \errmessage{Error in 1st arg of macro programme[3]: invalid
      programme type!}}}}}}}%
    %
    \ifthenelse{\equal{#2}{IW}}%
    {\renewcommand{\@programmec}{industri\"ele wetenschappen}
     \renewcommand{\@programmecqr}{industriële wetenschappen}}{
    \ifthenelse{\equal{#2}{}}%
    {}{
    \errmessage{{Error in 2nd arg of macro programme[3]: invalid
      programme class! }}}}%
    %
    \ifthenelse{\equal{#3}{BK}}%
    {\renewcommand{\@programmeq}{Bouwkunde}}{%
    \ifthenelse{\equal{#3}{CH}}%
    {\renewcommand{\@programmeq}{Chemie}}{%
    \ifthenelse{\equal{#3}{BCH}}%
    {\renewcommand{\@programmeq}{Biochemie}}{%
    \ifthenelse{\equal{#3}{EM}}%
    {\renewcommand{\@programmeq}{Elektromechanica}}{%
    \ifthenelse{\equal{#3}{EI}}%
    {\renewcommand{\@programmeq}{Elektronica-ICT}}{%
    \ifthenelse{\equal{#3}{}}%
    {}{%
    \ifthenelse{\equal{#1}{FREE}}
    {\renewcommand{\@programmeq}{#3}}{
    \errmessage{Error in 3rd arg to macro programme[3]: invalid
      programme qualifier}}}}}}}}%
    %
    \ifthenelse{\equal{#2}{IW}\and\not\equal{#3}{}}
    {\renewcommand{\@programmes}{: }}{}
}
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
\newcommand\@titlepageimage{}
\newcommand\titlepageimage[1]{\renewcommand\@titlepageimage{#1}}
\newcommand{\@isbn}{}
\newcommand{\isbn}[1]{\renewcommand{\@isbn}{#1}}
\newcommand{\@depot}{}
\newcommand{\depot}[1]{\renewcommand{\@depot}{#1}}
\newcommand{\@address}{\errmessage{Please, set your multi-line address
    and contact details using the \textbackslash{}address\{\} command
    in the preamble of your document}}
\newcommand{\address}[1]{\renewcommand{\@address}{#1}}
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

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\if@filled\else
  \raggedright
\fi
\raggedbottom
\onecolumn
\def\@makechapterhead#1{%
  \vspace*{1ex}%
  \begin{flushright}
    \makebox[0pt][l]{\rule[-0.4em]{10cm}{1.8em}}\textcolor{white}
    {\bf\LARGE~\chaptername~}
    \raisebox{-24pt}{
      \begin{tikzpicture}
        \foreach \theta in {0,5,...,355} {
          \node[color=white] at (\theta:0.025)
          {\bf\fontsize{72}{12}\selectfont\thechapter};
        }
        \node[color=uacorpblue] at (0,0)
        {\bf\fontsize{72}{12}\selectfont\thechapter};
      \end{tikzpicture}
    }\hspace*{-8pt}
    \par\nobreak
    \interlinepenalty\@M
    \bf\huge\textcolor{darkgray}{\rule[-0.5ex]{0em}{2.6ex}~#1}
    \par\nobreak
  \end{flushright}
  \rule{\textwidth}{1pt}
  \vspace{5\p@}\par\nobreak
  }
\def\@schapter#1{%
  \@makeschapterhead{#1}%
  \@afterheading
}
\def\@makeschapterhead#1{%
  \vspace*{1ex}%
  \begin{flushright}
    \bf\LARGE\textcolor{darkgray}{\rule[-0.5ex]{0em}{2.6ex}~#1}
  \end{flushright}
  \rule{\textwidth}{1pt}
  \vspace{5\p@}\par
}
\def\appendix{
  \setcounter{chapter}{0}
  \renewcommand*{\thechapter}{\Alph{chapter}}
  \renewcommand\chaptername\appendixname
}
\pgfmathsetmacro{\ua@X}{\paperwidth}
\pgfmathsetmacro{\ua@Y}{\paperheight}
\pgfmathsetmacro{\ua@R}{6*\paperwidth}
\pgfmathsetmacro{\ua@B}{(\ua@X+\ua@Y)/15}
\pgfmathsetmacro{\ua@L}{0.25*\ua@X}
\pgfmathsetmacro{\ua@Z}{0.1*\ua@L}
\pgfmathsetmacro{\ua@H}{0.3*\ua@L}
\pgfmathsetmacro{\ua@h}{0.5*(\ua@B-\ua@H)}
\renewcommand\maketitle{%
  \pagestyle{empty}
  \begin{titlepage}
    \if@titlepagetableonly
    Dit is een doctoraatsthesis van Universiteit Antwerpen.
    \else
    \begin{tikzpicture}[remember picture,overlay]
      \node at (current page.center) {
        \begin{tikzpicture}[inner sep=0pt]
          \clip (0,0) rectangle(\paperwidth,\paperheight);

          \filldraw[uacorpblue]
          (0.5*\ua@X pt,\ua@B+\ua@R pt) circle (\ua@R pt)
          (\ua@X pt, 0.25*\ua@Y+\ua@R pt) circle (\ua@R pt);

          \node[anchor=south east] at (\ua@X-3*\ua@Z pt,\ua@h pt)
          {\includegraphics[width=\ua@L pt]{\@logo}};

          \begin{scope}
            \clip
            (\ua@X pt, 0.25*\ua@Y+\ua@R pt) circle (\ua@R pt)
            (0.375*\ua@X pt,\ua@R+0.666*\ua@Y pt) circle (\ua@R pt);

            \node[anchor=south] at (0.5*\ua@X pt, 2.1*\ua@B pt)
            {\includegraphics[width=\ua@X pt]{\@titlepageimage}};
          \end{scope}

          \filldraw[uacorpbord]
          (0.375*\ua@X pt,\ua@R+0.666*\ua@Y pt) circle (\ua@R pt);

          \filldraw[white]
          (0.1*\ua@X pt,\ua@R+0.666*\ua@Y pt) circle (\ua@R pt);

          \node[anchor=north west,align=left,font=\large]
          at (3*\ua@Z pt, \ua@B - \ua@h pt)
          { \textcolor{uacorpblue}{\textsf{\@defenselocation,
                \@defensedate}} };

          \node[anchor=south west,text width=\textwidth,align=left,font=\large]
          at (3*\ua@Z pt, 1.4*\ua@B pt)
          { \textcolor{white}{\textsf{\@affiliation}} };

          \node[anchor=south east,text width=\textwidth,align=right,font=\large]
          at (\ua@X - 3*\ua@Z pt, 1.4*\ua@B pt)
          { \textcolor{white}{\textsf{
                \supervisorsname\\
                \@supervisori%
                \ifdefvoid{\@supervisorii}{}{\\\@supervisorii}%
                \ifdefvoid{\@supervisoriii}{}{\\\@supervisoriii}%
                \ifdefvoid{\@supervisoriv}{}{\\\@supervisoriv}}}
          };

          \node[anchor=north west,text
          width=\ua@X-6*\ua@Z,align=left,font=\Huge]
          (title)
          at (3*\ua@Z pt,\ua@Y-4*\ua@Z pt)
          { \textsf{\textbf{\@title}} };

          \node[anchor=north west,below=2.5ex of title,
          text width=\ua@X-6*\ua@Z,align=left,font=\large]
          { \textsf{\textbf{\@subtitle}} };

          \node[anchor=north west,text width=\ua@X-6*\ua@Z,align=left]
          at (3*\ua@Z pt,\ua@Y - 12.5*\ua@Z pt)
          { \textsf{\pthesisnamei{} \@phddegree{} \pthesisnameii{}} };

          \node[anchor=north west, text width=\textwidth,align=left,font=\LARGE]
          at (3*\ua@Z pt, \ua@Y-15.5*\ua@Z pt)
          { \textsf{\textbf{\@author}} };
        \end{tikzpicture}
      };
    \end{tikzpicture}
    \fi
  \end{titlepage}%
  \cleardoublepage
  \begin{center}
    \includegraphics[width=\ua@L pt]{\@logo}
    \vfill
    \@faculty\\
    \@programmeq\par
    \vfill
    \Huge\textsf{\@title}\par
    \large\textsf{\@subtitle}\par
    \vfill
    \normalsize\pthesisnamei\\
    \@phddegree\\
    \pthesisnameii\\
    \medskip
    \textbf{\@author}
    \vfill
    \begin{minipage}[b]{0.4\textwidth}
      \@defenselocation, \@defensedate
    \end{minipage}
    \hfill
    \begin{minipage}[b]{0.4\textwidth}
      \flushright
      \supervisorsname\\
      \@supervisori%
      \ifdefvoid{\@supervisorii}{}{\\\@supervisorii}%
      \ifdefvoid{\@supervisoriii}{}{\\\@supervisoriii}%
      \ifdefvoid{\@supervisoriv}{}{\\\@supervisoriv}
    \end{minipage}
  \end{center}
  \clearpage
  \textbf{\juryname}\hfill\par
  \textbf{\jurychairmanname}\hfill\break
  \@jurychairman{}\ifdefvoid{\@jurychairmanaff}{}{, \@jurychairmanaff}\\
  \hfill\break
  \textbf{\supervisorsname}\hfill\break
  \ifdefvoid{\@supervisori}{}{\@supervisori
    \ifdefvoid{\@supervisoriaff}{}{, \@supervisoriaff}\\}
  \ifdefvoid{\@supervisorii}{}{\@supervisorii
    \ifdefvoid{\@supervisoriiaff}{}{, \@supervisoriiaff}\\}
  \ifdefvoid{\@supervisoriii}{}{\@supervisoriii
    \ifdefvoid{\@supervisoriiiaff}{}{, \@supervisoriiiaff}\\}
  \ifdefvoid{\@supervisoriv}{}{\@supervisoriv
    \ifdefvoid{\@supervisorivaff}{}{, \@supervisorivaff}\\}
  \hfill\break
  \textbf{\jurymembersname}\hfill\break
  \ifdefvoid{\@jurymemberi}{}{\@jurymemberi
    \ifdefvoid{\@jurymemberiaff}{}{, \@jurymemberiaff\\}}
  \ifdefvoid{\@jurymemberii}{}{\@jurymemberii
    \ifdefvoid{\@jurymemberiiaff}{}{, \@jurymemberiiaff\\}}
  \ifdefvoid{\@jurymemberiii}{}{\@jurymemberiii
    \ifdefvoid{\@jurymemberiiiaff}{}{, \@jurymemberiiiaff\\}}
  \ifdefvoid{\@jurymemberiv}{}{\@jurymemberiv
    \ifdefvoid{\@jurymemberivaff}{}{, \@jurymemberivaff\\}}
  \ifdefvoid{\@jurymemberv}{}{\@jurymemberv
    \ifdefvoid{\@jurymembervaff}{}{, \@jurymembervaff\\}}
  \ifdefvoid{\@jurymembervi}{}{\@jurymembervi
    \ifdefvoid{\@jurymemberviaff}{}{, \@jurymemberviaff\\}}
  \hfill\break
  \vfill
  \textbf{Contact}\\
  \smallskip
  \@author\\
  \@affiliation\\
  \@address\\
  \vfill
  \copyright{} \@defensedate{} \@author\\
  \arrname.
  \vfill
  \begin{minipage}[b]{.5\linewidth}
    \ifdefempty{\@isbn}{}{ISBN \@isbn}~\\
    \ifdefempty{\@depot}{}{Wettelijk depot \@depot}~\\
  \end{minipage}
  \hfill
  \ifdefempty{\@isbn}{}{
    \begin{minipage}[b]{.5\linewidth}
      \expandafter\EAN \@isbn
    \end{minipage}
  }
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
  \
}
\newcommand\makefinalpage{
  \if@titlepagetableonly
  \else
  \cleardoublepage
  \thispagestyle{empty}
  ~% intentionally blank page
  \clearpage
  \thispagestyle{empty}
  \begin{tikzpicture}[remember picture,overlay]
    \node at (current page.center) {
      \begin{tikzpicture}[inner sep=0pt]
        \clip (0,0) rectangle(\paperwidth,\paperheight);
        \fill[uacorpblue] (0,0) rectangle(\ua@X pt,\ua@Y pt);
        \filldraw [white] (1.2*\ua@X pt,\ua@R+0.125*\ua@Y pt) circle (\ua@R pt);
        \filldraw [uacorpbord] (1.375*\ua@X pt,\ua@R+0.666*\ua@Y pt)
        circle (\ua@R pt);
      \end{tikzpicture}
    };
  \end{tikzpicture}
  \fi
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
%% End of file `uantwerpenphdthesis.cls'.
