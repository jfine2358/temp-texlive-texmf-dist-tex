%%
%% This is file `uantwerpenletter.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% uantwerpendocs.dtx  (with options: `le')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2013-2019  by Walter Daems <walter.daems@uantwerpen.be>
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
\ProvidesClass{uantwerpenletter}
    [2019/03/27 v2.3 .dtx skeleton file]
\def\fileversion{2.3}
\def\filedate{2019/03/27}
\newif\if@filled
\DeclareOption{filled}{\@filledtrue}
\ExecuteOptions{a4paper,10pt,final,oneside,openright}
\ProcessOptions
\LoadClassWithOptions{letter}
\newcommand\tat{\makeatletter @\makeatother}
\setlength{\parindent}{0pt}
\addtolength{\parskip}{0.75\baselineskip}
\setcounter{secnumdepth}{3}
\RequirePackage[top=1in, bottom=1in, left=1.34in, right=1in]{geometry}
\RequirePackage[normalem]{ulem}
\RequirePackage{atbegshi}
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
\newcommand\logoname{UA_HOR_ENG_CMYK}
\newcommand\footername{4E_PMS302_BR_ENG_RGB}
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
\newcommand\@faculty{< Specify faculty using \textbackslash{}facultyacronym\{ABC\} >}
\newcommand\faccpg{
  \renewcommand\@faculty{Centre Pieter Gillis}}
\newcommand\facfbd{
  \renewcommand\@faculty{
    Faculty of Pharmaceutical, Biomedical and Veterinary Sciences}}
\newcommand\facggw{
  \renewcommand\@faculty{Faculty of Medicine and Health Sciences}}
\newcommand\insiob{
  \renewcommand\@faculty{Insitute of Development Policy}}
\newcommand\insoiw{
  \renewcommand\@faculty{Institute of Educations and Information Sciences}}
\newcommand\asoe{
  \renewcommand\@faculty{Antwerp School of Education}}
\newcommand\faclw{
  \renewcommand\@faculty{Faculty of Arts}}
\newcommand\facow{
  \renewcommand\@faculty{Faculty of Design Sciences}}
\newcommand\facsw{
  \renewcommand\@faculty{Faculty of Social Sciences}}
\newcommand\facrec{
  \renewcommand\@faculty{Faculty of Law}}
\newcommand\factew{
  \renewcommand\@faculty{Faculty of Applied Economics}}
\newcommand\facti{
  \renewcommand\@faculty{Faculty of Applied Engineering}}
\newcommand\facwet{
  \renewcommand\@faculty{Faculty of Science}}
\newcommand\weightname{Weight}
\AtBeginDocument{
  \@ifpackageloaded{babel}{
    \addto\captionsdutch{%
      \renewcommand\uaname{Universiteit Antwerpen}
      \renewcommand\logoname{UA_HOR_NED_CMYK}
      \renewcommand\footername{4E_PMS302_BR_NED_RGB}
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
        \renewcommand\@faculty{Centrum Pieter Gillis}}
      \renewcommand\facfbd{
        \renewcommand\@faculty{
          Faculteit Farmaceutische, Biomedische en Diergeneeskundige
          Wetenschappen}}
      \renewcommand\facggw{
        \renewcommand\@faculty{Faculteit Geneeskunde en
          Gezondheidswetenschappen}}
      \renewcommand\insiob{
        \renewcommand\@faculty{Instituut voor Ontwikkelingsbeleid- en
          beheer}}
      \renewcommand\insoiw{
        \renewcommand\@faculty{Instituut voor Onderwijs- en
          Informatiewetenschappen}}
      \renewcommand\asoe{
        \renewcommand\@faculty{Antwerp School of Education}}
      \renewcommand\faclw{\renewcommand\@faculty{Faculteit
          Letteren en Wijsbegeerte}}
      \renewcommand\facow{
        \renewcommand\@faculty{Faculteit Ontwerpwetenschappen}}
      \renewcommand\facsw{
        \renewcommand\@faculty{Faculteit Sociale Wetenschappen}}
      \renewcommand\facrec{
        \renewcommand\@faculty{Faculteit Rechten}}
      \renewcommand\factew{
        \renewcommand\@faculty{Faculteit Toegepaste Economische
          Wetenschappen}}
      \renewcommand\facti{
        \renewcommand\@faculty{Faculteit Toegepaste
          Ingenieurswetenschappen}}
      \renewcommand\facwet{
        \renewcommand\@faculty{Faculteit Wetenschappen}}
      \renewcommand\weightname{Gewicht}
    }
    \addto\captionsgerman{%
      \renewcommand\uaname{Universit\"at Antwerpen}
      \renewcommand\logoname{UA_HOR_DUI_CMYK}
      \renewcommand\footername{4E_PMS302_BR_NED_RGB}
      \renewcommand\arrname{Alle Rechte vorbehalten}
      \renewcommand\orname{von}
      \renewcommand\domainname{uantwerpen.be}
      \renewcommand\subjectname{Betreff}%
      \renewcommand\datename{Datum}%
      \renewcommand\academicyearname{Akademisches Jahr}
      \renewcommand\masterthesisname{Masterdissertation}
      \renewcommand\bachelorthesisname{Bachelordissertation}
      \renewcommand\supervisorsname{Veranstalter}
      \renewcommand\juryname{Jury}
      \renewcommand\jurymembersname{Mitglieder}
      \renewcommand\jurychairmanname{Vorsitzender}
      \renewcommand\bmthesisname{Dissertation zur Erreichung des
        Grades der}
      \renewcommand\pthesisnamei{Dissertation zur Erreiching des
        Grades der}
      \renewcommand\pthesisnameii{an die \uaname}
      \renewcommand\faccpg{
        \renewcommand\@faculty{Centrum Pieter Gillis}}
      \renewcommand\facfbd{
        \renewcommand\@faculty{
          Faculteit Farmaceutische, Biomedische en Diergeneeskundige
          Wetenschappen}}
      \renewcommand\facggw{
        \renewcommand\@faculty{Faculteit Geneeskunde en
          Gezondheidswetenschappen}}
      \renewcommand\insiob{
        \renewcommand\@faculty{Instituut voor Ontwikkelingsbeleid- en
          beheer}}
      \renewcommand\insoiw{
        \renewcommand\@faculty{Instituut voor Onderwijs- en
          Informatiewetenschappen}}
      \renewcommand\asoe{
        \renewcommand\@faculty{Antwerp School of Education}}
      \renewcommand\faclw{\renewcommand\@faculty{Faculteit
          Letteren en Wijsbegeerte}}
      \renewcommand\facow{
        \renewcommand\@faculty{Faculteit Ontwerpwetenschappen}}
      \renewcommand\facsw{
        \renewcommand\@faculty{Faculteit Sociale Wetenschappen}}
      \renewcommand\facrec{
        \renewcommand\@faculty{Faculteit Rechten}}
      \renewcommand\factew{
        \renewcommand\@faculty{Faculteit Toegepaste Economische
          Wetenschappen}}
      \renewcommand\facti{
        \renewcommand\@faculty{Faculteit Toegepaste
          Ingenieurswetenschappen}}
      \renewcommand\facwet{
        \renewcommand\@faculty{Faculteit Wetenschappen}}
      \renewcommand\weightname{Gewicht}
    }
    \addto\captionsfrench{%
      \renewcommand\uaname{Universit\'e d'Anvers}
      \renewcommand\logoname{UA_HOR_FRA_CMYK}
      \renewcommand\footername{4E_PMS302_BR_ENG_RGB}
      \renewcommand\arrname{Tous les droits sont r\'eserv\'es}
      \renewcommand\orname{de}
      \renewcommand\domainname{uanvers.be}
      \renewcommand\subjectname{Objet}%
      \renewcommand\datename{Date}%
      \renewcommand\academicyearname{Ann\'ee acad\'emique}
      \renewcommand\masterthesisname{Th\`ese de master}
      \renewcommand\bachelorthesisname{Th\`ese de baccalaur\'eat}
      \renewcommand\supervisorsname{Promoteurs}
      \renewcommand\juryname{Jury}
      \renewcommand\jurymembersname{Membres}
      \renewcommand\jurychairmanname{Pr\'esident}
      \renewcommand\bmthesisname{Th\`ese \`a l'atteinte du degr\'e de}
      \renewcommand\pthesisnamei{Th\`ese Doctorale \`a l'atteinte du
        degr\'e de}
      \renewcommand\pthesisnameii{\`a l'\uaname}
      \renewcommand\faccpg{
        \renewcommand\@faculty{Centrum Pieter Gillis}}
      \renewcommand\facfbd{
        \renewcommand\@faculty{
          Faculteit Farmaceutische, Biomedische en Diergeneeskundige
          Wetenschappen}}
      \renewcommand\facggw{
        \renewcommand\@faculty{Faculteit Geneeskunde en
          Gezondheidswetenschappen}}
      \renewcommand\insiob{
        \renewcommand\@faculty{Instituut voor Ontwikkelingsbeleid- en
          beheer}}
      \renewcommand\insoiw{
        \renewcommand\@faculty{Instituut voor Onderwijs- en
          Informatiewetenschappen}}
      \renewcommand\asoe{
        \renewcommand\@faculty{Antwerp School of Education}}
      \renewcommand\faclw{\renewcommand\@faculty{Faculteit
          Letteren en Wijsbegeerte}}
      \renewcommand\facow{
        \renewcommand\@faculty{Faculteit Ontwerpwetenschappen}}
      \renewcommand\facsw{
        \renewcommand\@faculty{Faculteit Sociale Wetenschappen}}
      \renewcommand\facrec{
        \renewcommand\@faculty{Faculteit Rechten}}
      \renewcommand\factew{
        \renewcommand\@faculty{Faculteit Toegepaste Economische
          Wetenschappen}}
      \renewcommand\facti{
        \renewcommand\@faculty{Faculteit Toegepaste
          Ingenieurswetenschappen}}
      \renewcommand\facwet{
        \renewcommand\@faculty{Faculteit Wetenschappen}}
      \renewcommand\weightname{Poids}
    }
    \addto\captionsspanish{%
      \renewcommand\uaname{Universidad de Amberes}
      \renewcommand\logoname{UA_HOR_SPA_CMYK}
      \renewcommand\footername{4E_PMS302_BR_ENG_RGB}
      \renewcommand\arrname{Todos los derechos reservados}
      \renewcommand\orname{de}
      \renewcommand\domainname{uantwerp.be}
      \renewcommand\subjectname{Asunto}%
      \renewcommand\datename{Fecha}%
      \renewcommand\academicyearname{A\~no acad\'emico}
      \renewcommand\masterthesisname{Tesis de maestr\'\i{}a}
      \renewcommand\bachelorthesisname{Tesis de bachiller}
      \renewcommand\supervisorsname{Promotores}
      \renewcommand\juryname{Jurado}
      \renewcommand\jurymembersname{Miembros}
      \renewcommand\jurychairmanname{Presidente}
      \renewcommand\bmthesisname{Disertaci\'on a la consecuci\'on del
        grado de}
      \renewcommand\pthesisnamei{Disertaici\'on a la consecuci\'on del
        grado de}
      \renewcommand\pthesisnameii{a l'\uaname}
      \renewcommand\faccpg{
        \renewcommand\@faculty{Centrum Pieter Gillis}}
      \renewcommand\facfbd{
        \renewcommand\@faculty{
          Faculteit Farmaceutische, Biomedische en Diergeneeskundige
          Wetenschappen}}
      \renewcommand\facggw{
        \renewcommand\@faculty{Faculteit Geneeskunde en
          Gezondheidswetenschappen}}
      \renewcommand\insiob{
        \renewcommand\@faculty{Instituut voor Ontwikkelingsbeleid- en
          beheer}}
      \renewcommand\insoiw{
        \renewcommand\@faculty{Instituut voor Onderwijs- en
          Informatiewetenschappen}}
      \renewcommand\asoe{
        \renewcommand\@faculty{Antwerp School of Education}}
      \renewcommand\faclw{\renewcommand\@faculty{Faculteit
          Letteren en Wijsbegeerte}}
      \renewcommand\facow{
        \renewcommand\@faculty{Faculteit Ontwerpwetenschappen}}
      \renewcommand\facsw{
        \renewcommand\@faculty{Faculteit Sociale Wetenschappen}}
      \renewcommand\facrec{
        \renewcommand\@faculty{Faculteit Rechten}}
      \renewcommand\factew{
        \renewcommand\@faculty{Faculteit Toegepaste Economische
          Wetenschappen}}
      \renewcommand\facti{
        \renewcommand\@faculty{Faculteit Toegepaste
          Ingenieurswetenschappen}}
      \renewcommand\facwet{
        \renewcommand\@faculty{Faculteit Wetenschappen}}
      \renewcommand\weightname{Peso}
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
\newcommand{\@sender}{< Specify sender using
  \textbackslash{}sender\{name\}\{role\} >}
\newcommand{\@senderrole}{~}
\newcommand{\sender}[2]{\renewcommand{\@sender}{#1}\renewcommand{\@senderrole}{#2}}
\newcommand{\@logo}{\logoname}
\newcommand{\logo}[1]{\renewcommand{\@unit}{#1}}
\newcommand{\@unit}{}
\newcommand{\unit}[1]{\renewcommand{\@unit}{#1}}
\newcommand{\@emailuser}{}
\newcommand{\@emaildomain}{}
\newcommand{\email}[2]{\renewcommand{\@emailuser}{#1}\renewcommand{\@emaildomain}{#2}}
\newcommand{\@phone}{}
\newcommand{\phone}[1]{\renewcommand{\@phone}{#1}}
\newcommand{\@fax}{}
\newcommand{\fax}[1]{\renewcommand{\@fax}{#1}}
\newcommand{\@mobile}{}
\newcommand{\mobile}[1]{\renewcommand{\@mobile}{#1}}
\newcommand{\@returnaddress}{<specify return-address using \textbackslash\{single-line-return-address\}>}
\renewcommand{\returnaddress}[1]{\renewcommand{\@returnaddress}{#1}}
\newcommand{\@to}{<Specify addressee using \textbackslash{}to\{name\}>}
\renewcommand{\to}[1]{\renewcommand{\@to}{#1}}
\newcommand{\@toorganization}{<Specify organization using
  \textbackslash{}toorganization\{\}>}
\newcommand{\toorganization}[1]{\renewcommand{\@toorganization}{#1}}
\newcommand{\@toaddress}{<Specify (multiline) destination address\\using \textbackslash{}toaddress\{\}>}
\newcommand{\toaddress}[1]{\renewcommand{\@toaddress}{#1}}
\newcommand{\@subject}{-}
\newcommand*{\subject}[1]{\renewcommand{\@subject}{#1}}
\renewcommand*{\opening}[1]{#1}
\newcommand{\@closing}{<specify a closing formula using \textbackslash{}closing\{\}>}
\renewcommand*{\closing}[1]{\renewcommand{\@closing}{#1}}
\newcommand{\@signature}{\vspace*{8ex}}
\renewcommand*{\signature}[1]{\renewcommand{\@signature}{#1}}
\newcommand{\@carboncopy}{}
\newcommand{\carboncopy}[1]{\renewcommand{\@carboncopy}{#1}}
\newcommand{\@enclosed}{}
\newcommand{\enclosed}[1]{\renewcommand{\@enclosed}{#1}}
\newcommand{\@address}{\errmessage{Please, set your multi-line address
    and contact details using the \textbackslash{}address\{\} command
    in the preamble of your document}}
\renewcommand{\address}[1]{\renewcommand{\@address}{#1}}
\lhead[]{}
\chead[]{}
\rhead[]{}
\lfoot[\small\textcolor{gray}{\@date}]{\textcolor{gray}{\@date}}
\cfoot[]{}
\rfoot[\small\textcolor{gray}{\pagename~\thepage~\orname~\pageref{lastpage}}]{\small\textcolor{gray}{\pagename~\thepage~\orname~\pageref{lastpage}}}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\if@filled\else
  \raggedright
\fi
\raggedbottom
\onecolumn
\newcommand\maketitle{%
  \pagestyle{fancy}
  \thispagestyle{empty}
  \begin{tikzpicture}[overlay,remember picture]
    \path (current page.north west) +(1.8cm,-1.2cm)
    node[anchor=north west] {
      \includegraphics[height=1.1cm]{\@logo}
    };
    \draw (current page.north west)
    +(1cm,-98mm) -- +(1.5cm,-98mm);
    % 90 x 45
    % pos: 20mm van kant, 15mm van onderkant
    \path (current page.north east) +(-100mm,-65mm)
    node[anchor=west,text width=80mm,align=left] {
      \scriptsize\textcolor{gray}{\uline{\@returnaddress}}\\*
      \normalsize\@to\\*
      \@toorganization\\*
      \@toaddress
    };
  \end{tikzpicture}
  \begin{tikzpicture}[overlay,remember picture]
    \path (current page.south west) +(0,-0.7cm)
    node[anchor=south west,inner sep=0pt, outer sep=0pt]
    {\includegraphics{\footername}};
  \end{tikzpicture}
  ~\\[3ex]
  \textcolor{uacorpblue}{\bf \@sender}
  \ifx\@senderrole\@emptymacro\\[1.75ex]\else \\*\@senderrole\\[1.75ex]\fi
  \@faculty
  \ifx\@unit\@emptymacro\else\\* \@unit\fi~\\[1.75ex]
  \@address\\[1.75ex]
  \ifx\@email\@emptymacro\else E \@emailuser\tat{}\@emaildomain\\\fi
  \ifx\@phone\@emptymacro\else T \@phone\\\fi
  \ifx\@fax\@emptymacro\else F \@fax\\\fi
  \ifx\@mobile\@emptymacro\else M \@mobile\\\fi
  ~\\[4ex]
  \begin{tikzpicture}[anchor=north west,align=left,outer sep=0,inner sep=0]
    \path
    (0,0) node { \scriptsize \strut
      \textcolor{gray}{\uppercase\expandafter{\datename} } }
    (4cm,0) node { \scriptsize \strut
      \textcolor{gray}{\uppercase\expandafter{\subjectname} } }
    (0,-2.5ex) node { \strut \@date }
    (4cm,-2.5ex) node[align=left] { \strut \@subject };
  \end{tikzpicture}~\\[4ex]
}
\AtEndDocument{
  \@closing\\*[3ex]\@signature~\\[3ex]
  \@sender
  \ifx\@senderrole\@emptymacro\\[8ex]\else\\*\@senderrole\\[8ex]\fi
  \setlength{\parskip}{0em}
  \ifx\@carboncopy\@emptymacro\else CC: \@carboncopy\\[4ex]\fi
  \ifx\@enclosed\@emptymacro\else ENCL: \@enclosed\fi
  \label{lastpage}
}
\endinput
%%
%% End of file `uantwerpenletter.cls'.
