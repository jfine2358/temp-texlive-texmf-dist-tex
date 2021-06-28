%%
%% This is file `uantwerpenexam.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% uantwerpendocs.dtx  (with options: `ex')
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
\ProvidesClass{uantwerpenexam}
    [2021/03/23 v3.2 .dtx skeleton file]
\def\fileversion{3.2}
\def\filedate{2021/03/23}
\newif\if@examiner
\DeclareOption{examiner}{\@examinertrue}
\ExecuteOptions{a4paper,twoside,10pt}
\ProcessOptions
\LoadClassWithOptions{article}
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
\newcommand{\@shorttitle}{}
\newcommand{\shorttitle}[1]{%
  \renewcommand\@shorttitle{#1}
}
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
\newcommand{\@coursecodei}{}
\newcommand{\@coursei}{}
\newcommand{\course}[2]{
  \renewcommand{\@coursecodei}{#1}
  \renewcommand{\@coursei}{#2}
}
\newcommand{\@academicyear}{XXX-YYYY}
\newcommand{\academicyear}[1]{\renewcommand{\@academicyear}{#1}}
\newcommand{\logo}[1]{\renewcommand{\@logo}{#1}}
\newcommand{\@exampart}{}
\newcommand{\exampart}[1]{\renewcommand{\@exampart}{#1}}
\newcommand{\@examgroupnumber}{}
\newcommand{\examgroupnumber}[1]{\renewcommand{\@examgroupnumber}{#1}}
\newcommand{\@examdate}{TBD}
\newcommand{\examdate}[1]{\renewcommand{\@examdate}{#1}}
\newcommand{\@examlength}{TBD}
\newcommand{\examlength}[1]{\renewcommand{\@examlength}{#1}}
\newcommand{\@tstart}{TBD}
\newcommand{\tstart}[1]{\renewcommand{\@tstart}{#1}}
\newcommand{\@tend}{TBD}
\newcommand{\tend}[1]{\renewcommand{\@tend}{#1}}
\newcommand{\@rooms}{TBD}
\newcommand{\rooms}[1]{\renewcommand{\@rooms}{#1}}
\newcommand{\@extrainfo}{}
\newcommand\extrainfo[2][separatepage]{
  \ifthenelse{\equal{#1}{separatepage}}{
    % then
    \renewcommand{\@extrainfo}{\clearpage #2 \clearpage}
  }
  {
    % else
    \ifthenelse{\equal{#1}{firstpage}}
    {
      \renewcommand{\@extrainfo}{#2}
    }
    {
      \errmessage{Error: '\extrainfo' - first (optional) argument can
        only be 'separatepage' or 'firstpage'}
    }
  }
}
\newcommand{\@studentnr}{0}
\newcommand{\studentnr}[1]{\renewcommand{\@studentnr}{#1}}
\lhead[]{}
\chead[]{}
\if@examiner
\rhead[\small EXAMINER VERSION]{\small EXAMINER VERSION}
\AddToShipoutPicture{
  \put(60,40){\rotatebox{60}{\textcolor{watermark}{
        \fontfamily{phv}\fontsize{105}{130}\fontseries{m}\fontshape{n}%
        \selectfont Examiner Version}}}}
\else
\rhead[\small Student nr. \@studentnr]{\small Student nr. \@studentnr}
\fi
\lfoot[\small \@shorttitle]{\small \@shorttitle}
\cfoot[\small \thepage/\pageref{lastpage}]{\small\thepage/\pageref{lastpage}}
\rfoot[\small Groep \@examgroupnumber{} ---
\@academicyear]{\small Groep \@examgroupnumber{} --- \@academicyear}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{1pt}
\renewcommand\maketitle{%
  \pagestyle{fancy}
  \AddToShipoutPicture*{%
    \put(0,0){%
      \begin{tikzpicture}[remember picture,overlay]
        \node at (current page.center) {
          \begin{tikzpicture}
            \clip (0,0) rectangle (21,29.7);
            \draw
            ( 3,9.7) -- ( 3,23.7)
            ( 0,23.7) -- +(21,0)
            ( 3,20.8) -- +(21,0)
            ( 3,18.8) -- +(21,0)
            ( 3,16.8) -- +(21,0)
            (14,9.7) -- (14,13.7)
            ( 3,13.7) -- +(21,0)
            ( 3,11.7) -- +(21,0)
            ( 0,9.7) -- +(21,0);

            \draw[ultra thick]
            ( 3,16.8) +(0,-0.5) -- +(0,0) -- +(0.5,0)
            ( 3,13.7) +(0,+0.5) -- +(0,0) -- +(0.5,0)
            (21,16.8) +(0,-0.5) -- +(0,0) -- +(-0.5,0)
            (21,13.7) +(0,+0.5) -- +(0,0) -- +(-0.5,0);

            \foreach \nn in {0,1,...,7} {
              \draw (16.5,13.9) ++({0.5*\nn},0) rectangle +(0.5,0.8);
            }

            \foreach \nn in {0,1,...,33} {
              \draw (3.5,15.3) ++({0.5*\nn},0) rectangle +(0.5,0.8);
            }
            \foreach \nn in {0,1,...,23} {
              \draw (3.5,13.9) ++({0.5*\nn},0) rectangle +(0.5,0.8);
            }

            \path
            (3,25.2) node[anchor=north west] {
              \parbox{14cm}{
                \fontfamily{phv}\fontsize{12}{15}\fontseries{b}\selectfont
                \@faculty\\
                \fontfamily{phv}\fontsize{11}{14}\fontseries{m}\selectfont
                \@programmet \@programmec\
                \ifx\@programmeq\@emptymacro\else--- \@programmeq\fi
              }
            }
            (3.3,23) node[anchor=north west] {
              \parbox{16cm}{
                \fontfamily{phv}\fontsize{18}{22}\fontseries{b}
                \fontshape{n}\selectfont
                \raggedright \@coursei{}
                \ifx\@exampart\@emptymacro
                \else --- \@exampart\fi
                \fontfamily{phv}\fontsize{12}{18}\fontseries{m}
                \fontshape{n}\selectfont\\
                Reeks \@examgroupnumber{} \hfill \@examdate{} }
            }
            (3.3,20.1) node[anchor=north west] {
              \parbox{14cm}{
                \fontfamily{phv}\fontsize{12}{15}\fontseries{m}\selectfont
                \@coursecodei
              }
            }
            (3.3,18.6) node[anchor=north west] {
              \parbox{14cm}{
                \fontfamily{phv}\fontsize{12}{18}\fontseries{m}
                \fontshape{n}\selectfont
                \raggedright \ifdef{\dateenglish}{Professor(s) --- }
                {}Titularis(sen):\\
                \fontfamily{phv}\fontsize{14}{20}\fontseries{m}
                \fontshape{n}\selectfont
                \raggedright \@author{}
              }
            }
            (3.3,16.7) node[anchor=north west] {
              \parbox{10cm}{
                \fontfamily{phv}\fontsize{12}{15}\fontseries{m}
                \fontshape{n}\selectfont
                \raggedright \ifdef{\dateenglish}{Last name
                  --- }{}
                Naam:}
            }
            (3.3,15.25) node[anchor=north west] {
              \parbox{10cm}{
                \fontfamily{phv}\fontsize{12}{15}\fontseries{m}
                \fontshape{n}\selectfont
                \raggedright \ifdef{\dateenglish}{First name
                  --- }{}
                Voornaam:}
            }
            (16.3,15.25) node[anchor=north west] {
              \parbox{5cm}{
                \fontfamily{phv}\fontsize{12}{15}\fontseries{m}
                \fontshape{n}\selectfont
                \raggedright \ifdef{\dateenglish}{Docket No. --- }
                {}Rolnr.:}
            }

            (3.3,11.5) node[anchor=north west] {
              \parbox{14cm}{
                \fontfamily{phv}\fontsize{12}{21}\fontseries{m}
                \fontshape{n}\selectfont
                \raggedright \ifdef{\dateenglish}{Exam duration --- }
                {}Duur van het examen: \@examlength\\
              }
            }
            (14.3,11.5) node[anchor=north west] {
              \parbox{5cm}{
                \fontfamily{phv}\fontsize{12}{15}\fontseries{m}
                \fontshape{n}\selectfont
                \raggedright \ifdef{\dateenglish}{Start --- }
                {}Begin: \@tstart \\[1ex]
                \raggedright \ifdef{\dateenglish}{End --- }
                {}Einde~: \@tend
              }
            }
            (3.3,13.5) node[anchor=north west] {
              \parbox{14cm}{
                \fontfamily{phv}\fontsize{12}{21}\fontseries{m}
                \fontshape{n}\selectfont
                \raggedright \ifdef{\dateenglish}{Room --- }
                {}Lokaal: \@rooms

              }
            }
            (3,27.7) node[anchor=north west] {
              \includegraphics[width=7cm]{\@logo}
            };
          \end{tikzpicture}
        };
      \end{tikzpicture}
    }
  }
  \vspace*{17cm}
  \ifx\@qrtitle\@emptymacro
  \else
  \@extrainfo
  \fi
}
\newcounter{question}
\setcounter{question}{0}
\renewcommand\thequestion{\@arabic\c@question}
\newcommand{\question}[1]{
  \stepcounter{question}
  \thequestion.~#1%
}
\newcommand{\questionweight}[1]{%
  \hspace{\fill}
  \begin{tabular}{|c|}
    \hline
    \small \weightname: #1\\
    \hline
  \end{tabular}\\
}
\newcommand{\engdut}[2]{%
  \begin{tabular}{ccc}%
    \selectlanguage{english}%
    \begin{minipage}[t]{0.45\textwidth}%
      #1
    \end{minipage}%
    &~~~&
    \selectlanguage{dutch}%
    \begin{minipage}[t]{0.45\textwidth}%
      #2
    \end{minipage}%
  \end{tabular}
  \selectlanguage{english}%
}
\newcommand\@mcsymbol{\square}
\newcommand\setmcsymbol[1]{\renewcommand\@mcsymbol{#1}}
\newcommand\mc[1]{%
  \hfill\break\qquad\begin{tabular}{cc}
    $\@mcsymbol$
    &
    \begin{minipage}[t]{0.9\textwidth}%
      #1
    \end{minipage}%
  \end{tabular}
}
\newcommand{\engdutmc}[2]{%
  \hfill\break\begin{tabular}{cccc}
    $\@mcsymbol$
    &
    \selectlanguage{english}%
    \begin{minipage}[t]{0.42\textwidth}%
      #1
    \end{minipage}%
    &---&
    \selectlanguage{dutch}%
    \begin{minipage}[t]{0.42\textwidth}%
        #2
    \end{minipage}%
  \end{tabular}
  \selectlanguage{english}%
}
\newcommand\insertsolutionspagepartial[1]{
  ~\relax
  \AddToShipoutPicture*{%
    \put(0,0){%
      \begin{tikzpicture}
        \clip (0,0) rectangle (21,#1);
        \draw[densely dotted, step=0.5cm,black!20] (0.999,1.499) grid (2,2.5);
        \draw[densely dotted, step=0.5cm,black!20] (18.999,1.499) grid (20,2.5);

        \draw[densely dotted, step=0.5cm,black!20] (0.999,2.499) grid (20,27);
        \draw[densely dotted, step=0.5cm,black!20] (0.999,27) grid (16,28);
        \draw[densely dotted, step=0.5cm,black!20] (19.499,27) grid (20,28);
        \draw[densely dotted, step=0.5cm,black!20] (0.99,27.999) grid
        (20,28.5);
        \draw[ultra thick] (1,#1) -- (20,#1);
      \end{tikzpicture}
    }
  }%
  \clearpage
  \relax
}
\newcommand\insertsolutionspage[1]{
  \clearpage
  \AddToShipoutPicture*{%
    \put(0,0){%
      \begin{tikzpicture}
        \clip (0,0) rectangle (21,29.5);
        \draw[densely dotted, step=0.5cm,black!20] (0.999,1.499) grid (2,2.5);
        \draw[densely dotted, step=0.5cm,black!20] (18.999,1.499) grid (20,2.5);

        \draw[densely dotted, step=0.5cm,black!20] (0.999,2.499) grid (20,28);
        \draw[densely dotted, step=0.5cm,black!20] (0.999,28) grid (16,28.5);
        \draw[densely dotted, step=0.5cm,black!20] (19.499,28) grid (20,28.5);
      \end{tikzpicture}
    }
    \put(120,150){\rotatebox{60}{\textcolor{watermark}{
          \fontfamily{phv}\fontsize{105}{130}\fontseries{m}\fontshape{n}\selectfont
        #1}
      }
    }
  }%
  ~\relax
}
\AtEndDocument{
  \label{lastpage}
}
\endinput
%%
%% End of file `uantwerpenexam.cls'.
