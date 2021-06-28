%%
%% This is file `ryethesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ryethesis.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2009 by Jason V. Lassaline <jvl@ryerson.ca>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{ryethesis}
    [2010/06/18 v1.2 Ryerson University thesis class definition]

\RequirePackage{xcolor}
\RequirePackage{ifthen}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{vmargin}
\newboolean{@ryedraft} \setboolean{@ryedraft}{false} % not draft == final
\newboolean{@ryelistoftables} \setboolean{@ryelistoftables}{true}
\newboolean{@ryelistofplates} \setboolean{@ryelistofplates}{false}
\newboolean{@ryelistoffigures} \setboolean{@ryelistoffigures}{true}
\newboolean{@ryelistofillustrations} \setboolean{@ryelistofillustrations}{false}
\newboolean{@ryelistofappendices} \setboolean{@ryelistofappendices}{true}
\newboolean{@ryenomenclature} \setboolean{@ryenomenclature}{false}
\newboolean{@ryeglossary} \setboolean{@ryeglossary}{false}
\newboolean{@ryeindex} \setboolean{@ryeindex}{false}

\DeclareOption*{%
 \PassOptionsToClass{\CurrentOption}{book}
}


\DeclareOption{draft}{
   \typeout{Ryerson-Thesis Class Option: `draft'}
   \ExecuteOptions{10pt,oneside}
   \PassOptionsToClass{draft}{book}
   \setboolean{@ryedraft}{true}
}

\DeclareOption{final}{
   \typeout{Ryerson-Thesis Class Option: `final'}
   \ExecuteOptions{10pt,twoside}
   \PassOptionsToClass{final}{book}
   \setboolean{@ryedraft}{false}
}

\DeclareOption{lof}{
    \typeout{Ryerson-Thesis Class Option: `lof' Enabling List of Figures}
    \setboolean{@ryelistoffigures}{true}
}

\DeclareOption{nolof}{
    \typeout{Ryerson-Thesis Class Option: `nolof' Disabling List of Figures}
    \setboolean{@ryelistoffigures}{false}
}

\DeclareOption{lop}{
    \typeout{Ryerson-Thesis Class Option: `lop' Enabling List of Plates}
    \setboolean{@ryelistofplates}{true}
}

\DeclareOption{nolop}{
    \typeout{Ryerson-Thesis Class Option: `nolop' Disabling List of Plates}
    \setboolean{@ryelistofplates}{false}
}

\DeclareOption{loi}{
    \typeout{Ryerson-Thesis Class Option: `loi' Enabling List of Illustrations}
    \setboolean{@ryelistofillustrations}{true}
}

\DeclareOption{noloi}{
    \typeout{Ryerson-Thesis Class Option: `noloi' Disabling List of Illustrations}
    \setboolean{@ryelistofillustrations}{false}
}

\DeclareOption{lot}{
    \typeout{Ryerson-Thesis Class Option: `lot' Enabling List of Tables}
    \setboolean{@ryelistoftables}{true}
}

\DeclareOption{nolot}{
    \typeout{Ryerson-Thesis Class Option: `nolot' Disabling List of Tables}
    \setboolean{@ryelistoftables}{false}
}

\DeclareOption{loa}{
    \typeout{Ryerson-Thesis Class Option: `loa' Enabling List of Appendices}
    \setboolean{@ryelistofappendices}{true}
}

\DeclareOption{noloa}{
    \typeout{Ryerson-Thesis Class Option: `noloa' Disabling List of Appendices}
    \setboolean{@ryelistofappendices}{false}
}

\DeclareOption{los}{
     \typeout{Ryerson-Thesis Class Option: `los' Enabling Nomenclature}
     \typeout{*********************************************************************}
     \typeout{}
     \typeout{ Use: makeindex filename.nlo -s nomencl.ist -o filename.nls }
     \typeout{         where filename is the root file name of the TeX source file.}
     \typeout{}
     \typeout{*********************************************************************}
     \setboolean{@ryenomenclature}{true}
}

\DeclareOption{nolos}{
     \typeout{Ryerson-Thesis Class Option: `nolos' Disabling Nomenclature}
     \setboolean{@ryenomenclature}{false}
}

\DeclareOption{glossary}{
    \typeout{Ryerson-Thesis Class Option: `glossary' Enabling Glossary}
     \typeout{*********************************************************************}
     \typeout{}
     \typeout{ Use: makeglossaries filename }
     \typeout{         where filename is the root file name of the TeX source file.}
     \typeout{}
     \typeout{*********************************************************************}
   \setboolean{@ryeglossary}{true}
}

\DeclareOption{noglossary}{
     \typeout{Ryerson-Thesis Class Option: `noglossary' Disabling Glossary}
     \setboolean{@ryeglossary}{false}
}

\DeclareOption{index}{
    \typeout{Ryerson-Thesis Class Option: `index' Enabling Index}
     \typeout{*********************************************************************}
     \typeout{}
     \typeout{ Use: makeindex filename }
     \typeout{         where filename is the root file name of the TeX source file.}
     \typeout{}
     \typeout{*********************************************************************}
   \setboolean{@ryeindex}{true}
}

\DeclareOption{noindex}{
     \typeout{Ryerson-Thesis Class Option: `noindex' Disabling Index}
     \setboolean{@ryeindex}{false}
}

\ExecuteOptions{letterpaper,10pt}
\ProcessOptions\relax

\LoadClass{book}

\setpapersize{USletter}
\setmargrb{1.25in}{1in}{1in}{1in}


\newcommand{\clearemptydoublepage}{\newpage{\pagestyle{empty}\cleardoublepage}}

\newif\if@ryethesismatchtoc \@ryethesismatchtocfalse
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \@ryethesismatchtocfalse
 \pagenumbering{roman}
  \pagestyle{plain}
  \maketitle
  \clearemptydoublepage
  \ryethesis@insertdeclaration
  \ryethesis@insertabstract
  \ryethesis@insertacknowledgements
  \ryethesis@insertdedication
  \ryethesis@inserttoc
  \ryethesis@insertlot
  \ryethesis@insertlop
  \ryethesis@insertlof
  \ryethesis@insertloi
  \ryethesis@insertloa
  \ryethesis@insertnom
  % Each of the above \ryethesis@insert commands apply a \clearemptydoublepage
  \newpage
  \pagenumbering{arabic}
  \pagestyle{fancy}
}

\renewcommand\mainmatter{%
  \clearemptydoublepage
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{fancy}
}
\renewcommand\backmatter{%
 \clearemptydoublepage
 \ifthenelse{\boolean{@ryelistofappendices}}{\@ryethesismatchtoctrue}{\@ryethesismatchtocfalse}
 \ryethesis@insertappendix
 \@ryethesismatchtocfalse
 \ryethesis@insertreferences
  \ryethesis@insertglossary
  \ryethesis@insertindex
}
\fancyhead{} % Clear all header fields
\fancyhead[LE,RO]{\slshape \rightmark}
\fancyhead[LO,RE]{\slshape \leftmark}
\fancyfoot{} % Clear all footer fields
\fancyfoot[C]{\thepage}


\global\def\ryethesis@documentType{thesis} % Alternate forms include 'dissertation' or 'project'
\global\def\ryethesis@degree{}
\global\def\ryethesis@prevDegreeA{}
\global\def\ryethesis@prevDegreeB{}
\global\def\ryethesis@prevDegreeC{}
\global\def\ryethesis@prevDegreeD{}
\global\def\ryethesis@prevLocationA{}
\global\def\ryethesis@prevLocationB{}
\global\def\ryethesis@prevLocationC{}
\global\def\ryethesis@prevLocationD{}
\global\def\ryethesis@prevYearA{}
\global\def\ryethesis@prevYearB{}
\global\def\ryethesis@prevYearC{}
\global\def\ryethesis@prevYearD{}
\global\def\ryethesis@program{}
\global\def\ryethesis@degreeyear{}
\global\def\ryethesis@partnerUniv{}
\global\def\ryethesis@theabstract{}
\global\def\ryethesis@theacknowledgements{}
\global\def\ryethesis@thededication{}
\global\def\ryethesis@listofbibfiles{}
\global\def\ryethesis@theappendices{}


\newcommand{\documenttype}[1]{\ifx\empty#1\else\gdef\ryethesis@documentType{#1}\fi}
\newcommand{\thesis}{\documenttype{thesis}}
\newcommand{\dissertation}{\documenttype{dissertation}}
\newcommand{\project}{\documenttype{project}}

\newcommand{\degreeName}[1]{\gdef\ryethesis@degree{#1}}
\newcommand{\degreeYear}[1]{\gdef\ryethesis@degreeYear{#1}}
\newcommand{\program}[1]{\gdef\ryethesis@program{#1}}

\newcommand{\prevDegreeA}[3]{%
\gdef\ryethesis@prevDegreeA{#1}\gdef\ryethesis@prevLocationA{#2}\gdef\ryethesis@prevYearA{#3}}
\newcommand{\prevDegreeB}[3]{%
\gdef\ryethesis@prevDegreeB{#1}\gdef\ryethesis@prevLocationB{#2}\gdef\ryethesis@prevYearB{#3}}
\newcommand{\prevDegreeC}[3]{%
\gdef\ryethesis@prevDegreeC{#1}\gdef\ryethesis@prevLocationC{#2}\gdef\ryethesis@prevYearC{#3}}
\newcommand{\prevDegreeD}[3]{%
\gdef\ryethesis@prevDegreeD{#1}\gdef\ryethesis@prevLocationD{#2}\gdef\ryethesis@prevYearD{#3}}

\newcommand{\partnerUniversity}[1]{\gdef\ryethesis@partnerUniv{#1}}

\renewcommand{\maketitle}
{\begin{titlepage}
 %% Set the line spacing to 1 for the title page.
   \begin{spacing}{2}
   \begin{large}
  \begin{center}
    \vfill
     {\LARGE\textsc{\@title}}\\
     \vfill%\vspace{2\baselineskip}
      by \\
     \vfill%\vspace{\baselineskip}
      {\@author}\\
      {\ifx\empty\ryethesis@prevDegreeA\else{\ryethesis@prevDegreeA, \ryethesis@prevLocationA, \ryethesis@prevYearA}\\\fi}
      {\ifx\empty\ryethesis@prevDegreeB\else{\ryethesis@prevDegreeB, \ryethesis@prevLocationB, \ryethesis@prevYearB}\\\fi}
      {\ifx\empty\ryethesis@prevDegreeC\else{\ryethesis@prevDegreeC, \ryethesis@prevLocationC, \ryethesis@prevYearC}\\\fi}
      {\ifx\empty\ryethesis@prevDegreeD\else{\ryethesis@prevDegreeD, \ryethesis@prevLocationD, \ryethesis@prevYearD}\\\fi}
     \vfill%\vspace{3\baselineskip}
     {A \ryethesis@documentType}\\
      {presented to Ryerson University}\\
      {\ifx\empty\ryethesis@partnerUniv\else{and \ryethesis@partnerUniv}\\\fi}
     \vspace{\baselineskip}
    {in partial fulfillment of the}\\
      {requirements for the degree of}\\
      {\ryethesis@degree}\\
      {in the Program of}\\
      {\ryethesis@program}\\
     \vfill
     {Toronto, Ontario, Canada, \ryethesis@degreeYear}\\
      {\copyright\@author~\ryethesis@degreeYear}\\
 \end{center}
 \end{large}
  \end{spacing}
  \end{titlepage}
}

\newcommand{\declaration}{% Author declaration and release per SGS policy Sept. 2009.
 \begin{flushleft}
  I hereby declare that I am the sole author of this \ryethesis@documentType{}.\\
  \vspace{\baselineskip}
  I authorize Ryerson University to lend this \ryethesis@documentType{} to other institutions or individuals for the purpose of scholarly research.\\
  \vspace{0.75in}
  \hrule
  \vspace{0.75in}
  I further authorize Ryerson University to reproduce this \ryethesis@documentType{}  by photocopying or by other means, in total or in part, at the request of other institutions or individuals for the purpose of scholarly research.\\
  \vspace{0.75in}
  \hrule
\end{flushleft}
}
\newcommand{\ryethesis@insertdeclaration}{%
\ifthenelse{\boolean{@ryedraft}}
{}
{\declaration\clearemptydoublepage}
}

\newcommand{\abstract}[1]{\ifx\empty#1\else\gdef\ryethesis@theabstract{#1}\fi}
\newcommand{\ryethesis@insertabstract}{%
\begin{spacing}{2}
\begin{center}
\normalsize
\@title\\
\ryethesis@degree{} \ryethesis@degreeYear\\
\@author\\
\ryethesis@program\\
Ryerson University{\ifx\empty\ryethesis@partnerUniv\else{ and \ryethesis@partnerUniv}\fi}\\
\end{center}
{\ifx\empty\ryethesis@theabstract{\begin{center}\textit{Abstract goes here!}\end{center}}\else\ryethesis@theabstract\fi}
\end{spacing}
\clearemptydoublepage
}


\newcommand{\acknowledgements}[1]{\ifx\empty#1\else\gdef\ryethesis@theacknowledgements{#1}\fi}

\newcommand{\ryethesis@insertacknowledgements}{%
\ifx\empty\ryethesis@theacknowledgements\else{
\begin{center}
\section*{Acknowledgements}
\end{center}
\ryethesis@theacknowledgements
\clearemptydoublepage
}\fi
}

\newcommand{\dedication}[1]{\ifx\empty#1\else\gdef\ryethesis@thededication{#1}\fi}

\newcommand{\ryethesis@insertdedication}{%
\ifx\empty\ryethesis@thededication\else{
\begin{center}
\section*{Dedication}
\end{center}
\ryethesis@thededication
\clearemptydoublepage
}\fi
}


\newcommand{\includelistoftables}{\setboolean{@ryelistoftables}{true}}
\newcommand{\nolistoftables}{\setboolean{@ryelistoftables}{false}}
\newcommand{\includelistoffigures}{\setboolean{@ryelistoffigures}{true}}
\newcommand{\nolistoffigures}{\setboolean{@ryelistoffigures}{false}}
\newcommand{\includelistofplates}{\setboolean{@ryelistofplates}{true}}
\newcommand{\nolistofplates}{\setboolean{@ryelistofplates}{false}}
\newcommand{\includelistofillustrations}{\setboolean{@ryelistofillustrations}{true}}
\newcommand{\nolistofillustrations}{\setboolean{@ryelistofillustrations}{false}}
\newcommand{\includelistofappendices}{\setboolean{@ryelistofappendices}{true}}
\newcommand{\nolistofappendices}{\setboolean{@ryelistofappendices}{false}}
\newcommand{\includenomenclature}{\setboolean{@ryenomenclature}{true}}
\newcommand{\nonomenclature}{\setboolean{@ryenomenclature}{false}}
\newcommand{\includeindex}{\setboolean{@ryeindex}{true}}
\newcommand{\noindex}{\setboolean{@ryeindex}{false}}
\newcommand{\includeglossary}{\setboolean{@ryeglossary}{true}}
\newcommand{\noglossary}{\setboolean{@ryeglossary}{false}}

\newcommand{\ryethesis@inserttoc}{
\tableofcontents
\clearemptydoublepage
}

\newcommand{\ryethesis@insertlot}{
\ifthenelse{\boolean{@ryelistoftables}}{\listoftables\clearemptydoublepage}{}
}

\ifthenelse{\boolean{@ryelistofplates}}
{\RequirePackage{float}\newfloat{plate}{h}{lop}}{}

\newcommand{\ryethesis@insertlop}{
\ifthenelse{\boolean{@ryelistofplates}}{\listof{plate}{List of Plates}}{}
}

\newcommand{\ryethesis@insertlof}{
\ifthenelse{\boolean{@ryelistoftables}}{\listoffigures\clearemptydoublepage}{}
}

\ifthenelse{\boolean{@ryelistofillustrations}}
{\RequirePackage{float}\newfloat{illustration}{h}{loi}}{}

\newcommand{\ryethesis@insertloi}{
\ifthenelse{\boolean{@ryelistofillustrations}}{\listof{illustration}{List of Illustrations}}{}
}

\ifthenelse{\boolean{@ryelistofappendices}}
{
\newcommand{\nohyphens}{\hyphenpenalty=10000\exhyphenpenalty=10000\relax}
\newcommand{\listofappendices}{\chapter*{List of Appendices}\@starttoc{toa}}
}
{}

\newcommand{\ryethesis@insertloa}{%
\ifthenelse{\boolean{@ryelistofappendices}}{\listofappendices\clearemptydoublepage}{}
}

\renewcommand{\appendix}[1]{\ifx\empty#1\else\gdef\ryethesis@theappendices{#1}\fi}

\def\addcontentsline#1#2#3{%
\if@ryethesismatchtoc%
{\ifthenelse{\equal{#1}{toc}}%
{\addtocontents{toa}{\protect\contentsline{#2}{#3}{\thepage}}}%
{\addtocontents{#1}{\protect\contentsline{#2}{#3}{\thepage}}}}
\else%
\addtocontents{#1}{\protect\contentsline{#2}{#3}{\thepage}}%
\fi
}

\newcommand{\ryethesis@insertappendix}{%
\ifx\empty\ryethesis@theappendices\else{
\renewcommand{\thechapter}{\Alph{chapter}}
\renewcommand{\chaptername}{Appendix}
\setcounter{chapter}{0}
\ryethesis@theappendices
\clearemptydoublepage
}\fi
}
\ifthenelse{\boolean{@ryeglossary}}{\RequirePackage{glossaries}\makeglossaries%
  %Glossaries prints a confusing warning
  \global\let\warn@noprintglossary\relax
}{}

\ifthenelse{\boolean{@ryeindex}}{\RequirePackage{makeidx}\makeindex}{}

\ifthenelse{\boolean{@ryenomenclature}}{%
\RequirePackage{nomencl}
\renewcommand{\nomname}{List of Symbols}
\makenomenclature
}{}

\newcommand{\ryethesis@insertnom}{%
\ifthenelse{\boolean{@ryenomenclature}}{\printnomenclature\clearemptydoublepage}{}
}

\newcommand{\ryethesis@insertreferences}{%
\ifx\emtpy\ryethesis@listofbibfiles\else\bibliography{\ryethesis@listofbibfiles}\addcontentsline{toc}{chapter}{\bibname}\clearemptydoublepage\fi
}

\newcommand{\ryethesis@insertglossary}{%
\ifthenelse{\boolean{@ryeglossary}}
{\printglossaries%glossaries.sty prints a false warning.
\global\let\warn@noprintglossary\relax%
\addcontentsline{toc}{chapter}{Glossary}\clearemptydoublepage}
{}
}

\newcommand{\ryethesis@insertindex}{%
\ifthenelse{\boolean{@ryeindex}}{\printindex\addcontentsline{toc}{chapter}{Index}\clearemptydoublepage}{}
}


\newcommand{\addtoreferences}[1]{%
\ifx\empty\ryethesis@listofbibfiles\edef\ryethesis@listofbibfiles{#1}\else\edef\ryethesis@listofbibfiles{#1,\ryethesis@listofbibfiles}\fi
}

\newcommand{\usebibliography}{\renewcommand{\bibname}{Bibliography}}
\newcommand{\usereferences}{\renewcommand{\bibname}{References}}
\newcommand{\useendnotes}{\renewcommand{\bibname}{End Notes}}


\AtEndOfClass{
\ifthenelse{\boolean{@ryedraft}}
{% Draft mode uses double spacing
\doublespacing}
{% Final mode uses 1.5 spacing as specified in SGS policy Sept. 2009.
\onehalfspacing}
\usereferences
}
\AtBeginDocument{\frontmatter\mainmatter}
\AtEndDocument{\backmatter}
\endinput
%%
%% End of file `ryethesis.cls'.
