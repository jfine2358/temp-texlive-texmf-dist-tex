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
%% Copyright (C) 2013-2018  by Walter Daems <walter.daems@uantwerpen.be>
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
    [2018/03/02 v1.9 .dtx skeleton file]
\def\fileversion{1.9}
\def\filedate{2018/03/02}

\newif\if@examiner
\DeclareOption{examiner}{\@examinertrue}
\ExecuteOptions{a4paper,twoside,10pt}
\ProcessOptions
\LoadClassWithOptions{article}
\setlength{\parindent}{0pt}
\addtolength{\parskip}{0.75\baselineskip}
\setcounter{secnumdepth}{3}
\RequirePackage[top=1in, bottom=1in, left=1in, right=1in]{geometry}
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage{ifmtarg}
\IfFileExists{shellesc.sty}{\RequirePackage{shellesc}}{}
\newcommand{\@emptymacro}{}
\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage{tikz}
\RequirePackage{eso-pic}
\RequirePackage{fancyhdr}
\definecolor{uacorpbord}{cmyk}     {0.00,1.00,0.60,0.37}
\definecolor{uacorpblue}{cmyk}     {1.00,0.25,0.00,0.50}
\definecolor{uacorplightblue}{cmyk}{1.00,0.00,0.08,0.13}
\definecolor{uacorporange}{cmyk}   {0.00,0.32,1.00,0.09}
\definecolor{uaftifresh}{cmyk}     {0.34,1.00,0.00,0.00}
\definecolor{uaftisober}{cmyk}     {0.10,1.00,0.00,0.49}
\definecolor{lightgray}{cmyk}      {0.00,0.00,0.00,0.05}
\definecolor{watermark}{cmyk}      {0.00,0.00,0.00,0.05}
\newcommand{\uaname}{University of Antwerp}
\newcommand{\logoname}{UA_HOR_ENG_CMYK}
\newcommand{\footername}{4E_PMS302_BR_ENG_RGB}
\newcommand{\orname}{of}
\newcommand{\domainname}{uantwerp.be}
\newcommand{\datename}{Date}
\newcommand{\subjectname}{Subject}
\newcommand{\academicyearname}{Academic year}
\newcommand{\masterthesisname}{Master's thesis}
\newcommand{\promotorsname}{Promoters}
\newcommand{\thesisname}{Thesis to obtain the degree of}
\newcommand{\@faculty}{< Specify faculty using \tbs{}facultyacronym\{ABC\} >}
\newcommand{\faccpg}{
  \renewcommand\@faculty{Centre Pieter Gillis}}
\newcommand{\facfbd}{
  \renewcommand\@faculty{
    Faculty of Pharmaceutical, Biomedical and Veterinary Sciences}}
\newcommand{\facggw}{
  \renewcommand\@faculty{Faculty of Medicine and Health Sciences}}
\newcommand{\insiob}{
  \renewcommand\@faculty{Insitute of Development Policy}}
\newcommand{\insoiw}{
  \renewcommand\@faculty{Institute of Educations and Information Sciences}}
\newcommand{\asoe}{
  \renewcommand\@faculty{Antwerp School of Education}}
\newcommand{\faclw}{
  \renewcommand\@faculty{Faculty of Arts}}
\newcommand{\facow}{
  \renewcommand\@faculty{Faculty of Design Sciences}}
\newcommand{\facsw}{
  \renewcommand\@faculty{Faculty of Social Sciences}}
\newcommand{\facrec}{
  \renewcommand\@faculty{Faculty of Law}}
\newcommand{\factew}{
  \renewcommand\@faculty{Faculty of Applied Economics}}
\newcommand{\facti}{
  \renewcommand\@faculty{Faculty of Applied Engineering}}
\newcommand{\facwet}{
  \renewcommand\@faculty{Faculty of Science}}
\newcommand{\weightname}{Weight}
\AtBeginDocument{
  \@ifpackageloaded{babel}{
    \addto\captionsdutch{%
      \renewcommand{\uaname}{Universiteit Antwerpen}
      \renewcommand{\logoname}{UA_HOR_NED_CMYK}
      \renewcommand{\footername}{4E_PMS302_BR_NED_RGB}
      \renewcommand{\orname}{van}
      \renewcommand{\domainname}{uantwerpen.be}
      \renewcommand{\subjectname}{Onderwerp}%
      \renewcommand{\datename}{Datum}%
      \renewcommand{\academicyearname}{Academiejaar}
      \renewcommand{\masterthesisname}{Masterproef}
      \renewcommand{\promotorsname}{Promotoren}
      \renewcommand{\thesisname}{Proefschrift tot het behalen van de
        graad van}
      \renewcommand{\faccpg}{
        \renewcommand\@faculty{Centrum Pieter Gillis}}
      \renewcommand{\facfbd}{
        \renewcommand\@faculty{
          Faculteit Farmaceutische, Biomedische en Diergeneeskundige
          Wetenschappen}}
      \renewcommand{\facggw}{
        \renewcommand\@faculty{Faculteit Geneeskunde en
          Gezondheidswetenschappen}}
      \renewcommand{\insiob}{
        \renewcommand\@faculty{Instituut voor Ontwikkelingsbeleid- en
          beheer}}
      \renewcommand{\insoiw}{
        \renewcommand\@faculty{Instituut voor Onderwijs- en
          Informatiewetenschappen}}
      \renewcommand{\asoe}{
        \renewcommand\@faculty{Antwerp School of Education}}
      \renewcommand{\faclw}{\renewcommand\@faculty{Faculteit
          Letteren en Wijsbegeerte}}
      \renewcommand{\facow}{
        \renewcommand\@faculty{Faculteit Ontwerpwetenschappen}}
      \renewcommand{\facsw}{
        \renewcommand\@faculty{Faculteit Sociale Wetenschappen}}
      \renewcommand{\facrec}{
        \renewcommand\@faculty{Faculteit Rechten}}
      \renewcommand{\factew}{
        \renewcommand\@faculty{Faculteit Toegepaste Economische
          Wetenschappen}}
      \renewcommand{\facti}{
        \renewcommand\@faculty{Faculteit Toegepaste
          Ingenieurswetenschappen}}
      \renewcommand{\facwet}{
        \renewcommand\@faculty{Faculteit Wetenschappen}}
      \renewcommand{\weightname}{Gewicht}
    }
    \addto\captionsgerman{%
      \renewcommand{\uaname}{Universit\"at Antwerpen}
      \renewcommand{\logoname}{UA_HOR_DUI_CMYK}
      \renewcommand{\footername}{4E_PMS302_BR_NED_RGB}
      \renewcommand{\orname}{von}
      \renewcommand{\domainname}{uantwerpen.be}
      \renewcommand{\subjectname}{Betreff}%
      \renewcommand{\datename}{Datum}%
      \renewcommand{\academicyearname}{Akademisches Jahr}
      \renewcommand{\masterthesisname}{Masterdissertation}
      \renewcommand{\promotorsname}{Veranstalter}
      \renewcommand{\thesisname}{Dissertation zur Erreichung des
        Grades der}
      \renewcommand{\faccpg}{
        \renewcommand\@faculty{Centrum Pieter Gillis}}
      \renewcommand{\facfbd}{
        \renewcommand\@faculty{
          Faculteit Farmaceutische, Biomedische en Diergeneeskundige
          Wetenschappen}}
      \renewcommand{\facggw}{
        \renewcommand\@faculty{Faculteit Geneeskunde en
          Gezondheidswetenschappen}}
      \renewcommand{\insiob}{
        \renewcommand\@faculty{Instituut voor Ontwikkelingsbeleid- en
          beheer}}
      \renewcommand{\insoiw}{
        \renewcommand\@faculty{Instituut voor Onderwijs- en
          Informatiewetenschappen}}
      \renewcommand{\asoe}{
        \renewcommand\@faculty{Antwerp School of Education}}
      \renewcommand{\faclw}{\renewcommand\@faculty{Faculteit
          Letteren en Wijsbegeerte}}
      \renewcommand{\facow}{
        \renewcommand\@faculty{Faculteit Ontwerpwetenschappen}}
      \renewcommand{\facsw}{
        \renewcommand\@faculty{Faculteit Sociale Wetenschappen}}
      \renewcommand{\facrec}{
        \renewcommand\@faculty{Faculteit Rechten}}
      \renewcommand{\factew}{
        \renewcommand\@faculty{Faculteit Toegepaste Economische
          Wetenschappen}}
      \renewcommand{\facti}{
        \renewcommand\@faculty{Faculteit Toegepaste
          Ingenieurswetenschappen}}
      \renewcommand{\facwet}{
        \renewcommand\@faculty{Faculteit Wetenschappen}}
      \renewcommand{\weightname}{Gewicht}
    }
    \addto\captionsfrench{%
      \renewcommand{\uaname}{Universit\'e d'Anvers}
      \renewcommand{\logoname}{UA_HOR_FRA_CMYK}
      \renewcommand{\footername}{4E_PMS302_BR_ENG_RGB}
      \renewcommand{\orname}{de}
      \renewcommand{\domainname}{uanvers.be}
      \renewcommand{\subjectname}{Objet}%
      \renewcommand{\datename}{Date}%
      \renewcommand{\academicyearname}{Ann\'ee acad\'emique}
      \renewcommand{\masterthesisname}{Th\`ese de master}
      \renewcommand{\promotorsname}{Promoteurs}
      \renewcommand{\thesisname}{Th\`ese \`a l'atteinte du degr\'e de}
      \renewcommand{\faccpg}{
        \renewcommand\@faculty{Centrum Pieter Gillis}}
      \renewcommand{\facfbd}{
        \renewcommand\@faculty{
          Faculteit Farmaceutische, Biomedische en Diergeneeskundige
          Wetenschappen}}
      \renewcommand{\facggw}{
        \renewcommand\@faculty{Faculteit Geneeskunde en
          Gezondheidswetenschappen}}
      \renewcommand{\insiob}{
        \renewcommand\@faculty{Instituut voor Ontwikkelingsbeleid- en
          beheer}}
      \renewcommand{\insoiw}{
        \renewcommand\@faculty{Instituut voor Onderwijs- en
          Informatiewetenschappen}}
      \renewcommand{\asoe}{
        \renewcommand\@faculty{Antwerp School of Education}}
      \renewcommand{\faclw}{\renewcommand\@faculty{Faculteit
          Letteren en Wijsbegeerte}}
      \renewcommand{\facow}{
        \renewcommand\@faculty{Faculteit Ontwerpwetenschappen}}
      \renewcommand{\facsw}{
        \renewcommand\@faculty{Faculteit Sociale Wetenschappen}}
      \renewcommand{\facrec}{
        \renewcommand\@faculty{Faculteit Rechten}}
      \renewcommand{\factew}{
        \renewcommand\@faculty{Faculteit Toegepaste Economische
          Wetenschappen}}
      \renewcommand{\facti}{
        \renewcommand\@faculty{Faculteit Toegepaste
          Ingenieurswetenschappen}}
      \renewcommand{\facwet}{
        \renewcommand\@faculty{Faculteit Wetenschappen}}
      \renewcommand{\weightname}{Poids}
    }
    \addto\captionsspanish{%
      \renewcommand{\uaname}{Universidad de Amberes}
      \renewcommand{\logoname}{UA_HOR_SPA_CMYK}
      \renewcommand{\footername}{4E_PMS302_BR_ENG_RGB}
      \renewcommand{\orname}{de}
      \renewcommand{\domainname}{uantwerp.be}
      \renewcommand{\subjectname}{Asunto}%
      \renewcommand{\datename}{Fecha}%
      \renewcommand{\academicyearname}{A\~no acad\'emico}
      \renewcommand{\masterthesisname}{Tesis de maestr\'\i{}a}
      \renewcommand{\promotorsname}{Promotores}
      \renewcommand{\thesisname}{Disertaci\'on a la consecuci\'on del
        grado de}
      \renewcommand{\faccpg}{
        \renewcommand\@faculty{Centrum Pieter Gillis}}
      \renewcommand{\facfbd}{
        \renewcommand\@faculty{
          Faculteit Farmaceutische, Biomedische en Diergeneeskundige
          Wetenschappen}}
      \renewcommand{\facggw}{
        \renewcommand\@faculty{Faculteit Geneeskunde en
          Gezondheidswetenschappen}}
      \renewcommand{\insiob}{
        \renewcommand\@faculty{Instituut voor Ontwikkelingsbeleid- en
          beheer}}
      \renewcommand{\insoiw}{
        \renewcommand\@faculty{Instituut voor Onderwijs- en
          Informatiewetenschappen}}
      \renewcommand{\asoe}{
        \renewcommand\@faculty{Antwerp School of Education}}
      \renewcommand{\faclw}{\renewcommand\@faculty{Faculteit
          Letteren en Wijsbegeerte}}
      \renewcommand{\facow}{
        \renewcommand\@faculty{Faculteit Ontwerpwetenschappen}}
      \renewcommand{\facsw}{
        \renewcommand\@faculty{Faculteit Sociale Wetenschappen}}
      \renewcommand{\facrec}{
        \renewcommand\@faculty{Faculteit Rechten}}
      \renewcommand{\factew}{
        \renewcommand\@faculty{Faculteit Toegepaste Economische
          Wetenschappen}}
      \renewcommand{\facti}{
        \renewcommand\@faculty{Faculteit Toegepaste
          Ingenieurswetenschappen}}
      \renewcommand{\facwet}{
        \renewcommand\@faculty{Faculteit Wetenschappen}}
      \renewcommand{\weightname}{Peso}
    }
  }
  {}
}
\newcommand{\@facultyacronym}{}
\newcommand{\facultyacronym}[1]{
  \renewcommand{\@facultyacronym}{#1}
  \AtBeginDocument{
    \ifthenelse{\equal{#1}{CPG}}{\faccpg}{
    \ifthenelse{\equal{#1}{FBD}}{\facfbd}{
    \ifthenelse{\equal{#1}{GGW}}{\facggw}{
    \ifthenelse{\equal{#1}{IOB}}{\insiob}{
    \ifthenelse{\equal{#1}{IOIW}}{\insoiw}{
    \ifthenelse{\equal{#1}{ASoE}}{\asoe}{
    \ifthenelse{\equal{#1}{LW}}{\faclw}{
    \ifthenelse{\equal{#1}{OW}}{\facow}{
    \ifthenelse{\equal{#1}{SW}}{\facsw}{
    \ifthenelse{\equal{#1}{REC}}{\facrec}{
    \ifthenelse{\equal{#1}{TEW}}{\factew}{
    \ifthenelse{\equal{#1}{TI}}{\facti}{
    \ifthenelse{\equal{#1}{WET}}{\facwet}{
      \errmessage{Error: wrong faculty acronym; choose one of CPG, FBD, GGW,
        IOB, IOIW, ASoE, LW, OW, SW, REC, TEW, TI, WET}}}}}}}}}}}}}}}
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
    \ifthenelse{\equal{#1}{VP}}%
    {\renewcommand{\@programmet}{Voorbereidingsprogramma voor Master of Science in de }}{%
    \ifthenelse{\equal{#1}{SP}}%
    {\renewcommand{\@programmet}{Schakelprogramma voor Master of Science in de }}{%
    \ifthenelse{\equal{#1}{FREE}}%
    {}{
    \errmessage{Error in 1st arg of macro programme[3]: invalid
      programme type!}}}}}}%
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
    {\renewcommand{\@programmeq}{bouwkunde}}{%
    \ifthenelse{\equal{#3}{CH}}%
    {\renewcommand{\@programmeq}{chemie}}{%
    \ifthenelse{\equal{#3}{BCH}}%
    {\renewcommand{\@programmeq}{biochemie}}{%
    \ifthenelse{\equal{#3}{EM}}%
    {\renewcommand{\@programmeq}{elektromechanica}}{%
    \ifthenelse{\equal{#3}{EI}}%
    {\renewcommand{\@programmeq}{elektronica-ICT}}{%
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
\newcommand{\@logo}{\logoname}
\newcommand{\logo}[1]{\renewcommand{\@unit}{#1}}
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
\newcommand{\@extrainfo}{TBD}
\newcommand{\extrainfo}[1]{\renewcommand{\@extrainfo}{#1}}
\newcommand{\@studentnr}{0}
\newcommand{\studentnr}[1]{\renewcommand{\@studentnr}{#1}}
\lhead[]{}
\chead[]{}
\if@examiner
\rhead[\small EXAMINER VERSION]{\small EXAMINER VERSION}
\AddToShipoutPicture{
  \put(60,40){\rotatebox{60}{\textcolor{watermark}{
        \fontfamily{phv}\fontsize{105}{130}\fontseries{m}\fontshape{n}\selectfont Examiner Version}}}}
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
            ( 0,23.7) -- (21,23.7)
            ( 3,19.7) -- (21,19.7)
            ( 3,17.7) -- (21,17.7)
            ( 3,15.7) -- (21,15.7)
            (14,11.7) -- (14,15.7)
            ( 3,13.7) -- (21,13.7)
            ( 3,11.7) -- (21,11.7)
            ( 0,9.7) -- (21,9.7);

            \draw[ultra thick]
            ( 3,15.7) +(0,-0.5) -- +(0,0) -- +(0.5,0)
            ( 3,13.7) +(0,+0.5) -- +(0,0) -- +(0.5,0)
            (14,15.7) +(-0.5,0) -- +(0,0) +(0,-0.5) -- +(0,0) --  +(0.5,0)
            (14,13.7) +(-0.5,0) -- +(0,0) +(0,+0.5) -- +(0,0) --  +(0.5,0)
            (21,15.7) +(0,-0.5) -- +(0,0) -- +(-0.5,0)
            (21,13.7) +(0,+0.5) -- +(0,0) -- +(-0.5,0);

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
            (3.3,23.0) node[anchor=north west] {
              \parbox{14cm}{
                \fontfamily{phv}\fontsize{12}{15}\selectfont
                \@academicyear
              }
            }
            (3.3,21.9) node[anchor=north west] {
              \parbox{16cm}{
                \fontfamily{phv}\fontsize{18}{22}\fontseries{b}\fontshape{n}\selectfont
                \raggedright \@coursei --- \@exampart
                \fontfamily{phv}\fontsize{12}{18}\fontseries{m}\fontshape{n}\selectfont\\
                Groep \@examgroupnumber{} \hfill \@examdate{} }
            }
            (3.3,19) node[anchor=north west] {
              \parbox{14cm}{
                \fontfamily{phv}\fontsize{12}{15}\fontseries{m}\selectfont
                \@coursecodei
              }
            }
            (3.3,17.5) node[anchor=north west] {
              \parbox{14cm}{
                \fontfamily{phv}\fontsize{12}{18}\fontseries{m}\fontshape{n}\selectfont
                \raggedright \ifdef{\dateenglish}{Professor(s) --- }{}Titularis(sen):\\
                \fontfamily{phv}\fontsize{14}{20}\fontseries{m}\fontshape{n}\selectfont
                \raggedright \@author{}
              }
            }
            (3.3,15.5) node[anchor=north west] {
              \parbox{10cm}{
                \fontfamily{phv}\fontsize{12}{15}\fontseries{m}\fontshape{n}\selectfont
                \raggedright \ifdef{\dateenglish}{Last name/First name
                  --- }{}
                Naam/Voornaam:}
            }
            (14.3,15.5) node[anchor=north west] {
              \parbox{5cm}{
                \fontfamily{phv}\fontsize{12}{15}\fontseries{m}\fontshape{n}\selectfont
                \raggedright \ifdef{\dateenglish}{Registration No. --- }{}Rolnr.:}
            }
            (3.3,13.5) node[anchor=north west] {
              \parbox{14cm}{
                \fontfamily{phv}\fontsize{12}{21}\fontseries{m}\fontshape{n}\selectfont
                \raggedright \ifdef{\dateenglish}{Exam duration --- }{}Duur van het examen: \@examlength\\
              }
            }
            (14.3,13.5) node[anchor=north west] {
              \parbox{5cm}{
                \fontfamily{phv}\fontsize{12}{15}\fontseries{m}\fontshape{n}\selectfont
                \raggedright \ifdef{\dateenglish}{Start --- }{}Begin: \@tstart \\[1ex]
                \raggedright \ifdef{\dateenglish}{End --- }{}Einde~: \@tend
              }
            }
            (3.3,11.5) node[anchor=north west] {
              \parbox{14cm}{
                \fontfamily{phv}\fontsize{12}{21}\fontseries{m}\fontshape{n}\selectfont
                \raggedright \ifdef{\dateenglish}{Room --- }{}Lokaal: \@rooms

              }
            }
            (2,9.5) node[anchor=north west] {
              \parbox{19cm}{
                \fontfamily{phv}\fontsize{10}{13}\fontseries{m}\fontshape{n}\selectfont
                \ifdef{\dateenglish}{\raggedright Extra information: read the back of this page\\}{}
                \raggedright Extra informatie: zie achterkant
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
  \vspace*{15cm}
  \clearpage
  \@extrainfo
  \clearpage
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
  \begin{tabular}{cc}%
    \selectlanguage{english}%
    \begin{minipage}[t]{0.45\textwidth}%
      #1
    \end{minipage}%
    &
    \selectlanguage{dutch}%
    \begin{minipage}[t]{0.45\textwidth}%
      #2
    \end{minipage}%
  \end{tabular}
  \selectlanguage{english}%
}
\newcommand{\mc}[1]{%
  \qquad\begin{tabular}{cc}
    $\square$
    &
    \begin{minipage}[t]{0.8\textwidth}%
      #1
    \end{minipage}%
  \end{tabular}\\
}
\newcommand{\engdutmc}[2]{%
  \begin{tabular}{cccc}
    $\square$
    &
    \selectlanguage{english}%
    \begin{minipage}[t]{0.4\textwidth}%
      #1
    \end{minipage}%
    &---&
    \selectlanguage{dutch}%
    \begin{minipage}[t]{0.4\textwidth}%
        #2
    \end{minipage}%
  \end{tabular}
  \selectlanguage{english}%
}
\newcommand\insertsolutionspagepartial[1]{
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