%%
%% This is file `TOPletter.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% TOPletter.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2015 by Marco Torchiano <marco.torchiano@polito.it>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the Apache License, either version 2.0 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%     http://choosealicense.com/licenses/apache-2.0/
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{TOPletter}
    [2018/07/10 v0.3.0 Corporate Letter PoliTo LaTeX class]
\LoadClass[a4paper,11pt]{article}
\def\topl@language{main=italian,english}
\DeclareOption{italian}{\def\topl@language{main=italian,english}}
\DeclareOption{english}{\def\topl@language{main=english,italian}}
\ProcessOptions\relax
\RequirePackage[a4paper,bottom=8cm,top=2cm,left=2cm,right=2cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage{helvet}
\RequirePackage{changepage}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage[utf8]{inputenc}
\RequirePackage{hyperref}
\RequirePackage[\topl@language]{babel}
\RequirePackage{iflang}
\definecolor{orange}{cmyk}{0,.70,1.00,0} %C0/M70/Y100/K0
\definecolor{blue}{cmyk}{1.00,.80,0,.30} %C100/M80/Y0/K30
\renewcommand*\familydefault{\sfdefault}
\newcommand{\cond}[1]{\fontseries{mc}\selectfont {#1}}
\newcommand{\condb}[1]{\fontseries{bc}\selectfont {#1}}
\newcommand{\orange}[1]{\color{orange}{#1}}
\newcommand{\blue}[1]{\color{blue}{#1}}
\newcommand{\red}[1]{\color{red}{#1}}
\setlength{\headheight}{4.1cm}
\setlength{\footskip}{2cm}
\fancypagestyle{plain}{
\fancyhf{} % empty plus
\fancyhead[LE,LO]{
\makebox[2.15cm]{\includegraphics[width=2cm,height=2cm]{\toplLogo}}
{\color{blue}\rule{0.4pt}{2cm}}
\hspace{1pt}
\parbox[b]{5cm}{
\condb{\fontsize{10.5pt}{10pt}\selectfont
{\blue POLITECNICO\linebreak
   \raisebox{3pt}{DI TORINO}}}\\
{\fontsize{7.5pt}{6pt}\selectfont \cond {\blue{%
\raisebox{-14pt}{\toplTipoStruttura}\\ \toplStruttura{} }}}%
}\\
{\sffamily \small
\vspace{0.8cm}
\hspace{2.5cm}\color{blue}{\cond{\toplRuolo{}}}\\
\hspace{2.5cm}\color{orange}{\condb{\toplNome{}}}}}
\fancyfoot[LE,LO]{\small \cond{\color{blue}{{\bf \toplTipoStruttura \toplStruttura}\\
Politecnico di Torino - Corso Duca degli Abruzzi 24 - 10129 Torino - Italia\\
tel:\toplTelefono{} \ifdefined\toplFax\hspace{4pt} fax:\toplFax\fi} \\
\color{orange}{\href{mailto:\toplEmail}{\toplEmail}\hspace{4pt}%
 \ifdefined\toplHome\href{\toplHome}{\toplHome}%
 \fi \hspace{4pt} \href{http://www.polito.it}{http://www.polito.it}}}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
\pagestyle{plain}
\IfLanguageName{italian}{
\newcommand{\toplTipoStruttura}{Dipartimento di }
\newcommand{\toplDest}{A chi di competenza}
\newcommand{\toplSubjectLabel}{Oggetto}
}{
\newcommand{\toplTipoStruttura}{Department of }
\newcommand{\toplDest}{To whom it may concern}
\newcommand{\toplSubjectLabel}{Subject}
}
\newcommand{\dipartimentoDi}[1]{\def\toplStruttura{#1}}
\newcommand{\struttura}[1]{\def\toplTipoStruttura{#1}}
\newcommand{\ruolo}[1]{\makeatletter\def\toplRuolo{#1}\makeatother}
\newcommand{\nome}[1]{\makeatletter\def\toplNome{#1}\makeatother}
\newcommand{\telefono}[1]{\makeatletter\def\toplTelefono{#1}\makeatother}
\newcommand{\fax}[1]{\makeatletter\def\toplFax{#1}\makeatother}
\newcommand{\email}[1]{\makeatletter\def\toplEmail{#1}\makeatother}
\newcommand{\homepage}[1]{\def\toplHome{#1}}
\newcommand{\soggetto}[1]{\def\toplSubject{#1}}
\newcommand{\esoggetto}[1]{\def\toplSubjectLabel{#1}}
\newcommand{\destinatario}[1]{\def\toplDest{#1}}
\newcommand{\firma}[1]{\def\toplSignature{#1}}
\newcommand{\logo}[1]{\def\toplLogo{#1}}
\newcommand{\luogo}[1]{\def\toplLuogo{#1}}
\newcommand{\data}[1]{\def\toplData{#1}}
\newcommand{\protocollo}[1]{\def\toplProtocollo{#1}}
\def\toplLogo{LogoPolitoBlu.pdf}
\def\toplLuogo{Torino}
\def\toplData{\today}
\AtBeginDocument{
\ifdefined\toplEmail \else
\ClassError{TOPLetter} {Manca l'email}
{L'email deve essere definito con \protect\email{}.}
\fi
\ifdefined\toplTelefono \else
\ClassError{TOPLetter} {Manca il numero di telefono}
{Il numero di telefono deve essere definito con \protect\telefono{}.}
\fi
\ifdefined\toplNome \else
\ClassError{TOPLetter} {Manca il nome}
{Il nome della persona deve essere definito con \protect\nome{}.}
\fi
\ifdefined\toplRuolo \else
\ClassError{TOPLetter} {Manca il ruolo}
{Il ruolo deve essere definito con \protect\ruolo{}.}
\fi
\ifdefined\toplStruttura \else
\ClassError{TOPLetter} {Manca il nome della struttura}
{Il nome della struttura deve essere definito con \protect\struttura{}.}
\fi
\IfFileExists{\toplLogo} {}
{
\ClassError{TOPLetter} {Il file di logo '\toplLogo' non e' stato trovato.}
{Il file deve avere come nome 'PoliLogoBlu.png' oppure essere definito
tramite il comando \protect\logo{}.\MessageBreak
Il file deve essere quadrato e con risoluzione sufficiente,
almeno 400x400 pixel.
}
}
\ifdefined\toplProtocollo
Prot. \toplProtocollo
\vspace{1cm}
\fi
\begin{adjustwidth}{10cm}{}
\toplDest
\end{adjustwidth}
\vspace{1cm}
\ifdefined\toplSubject
\begin{center}
{\Large {\bf \toplSubjectLabel: \toplSubject }}
\end{center}
\fi
}
\AtEndDocument{
\vspace{2cm}
\hspace{.6\textwidth}
\parbox{5cm}{
\centering
\toplLuogo, \toplData\\
\toplNome\\
\ifdefined\toplSignature
\includegraphics[width=4cm]{\toplSignature}
\fi
}
}
%% \iffalse
\endinput
%%
%% End of file `TOPletter.cls'.
