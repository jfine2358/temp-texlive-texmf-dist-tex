%%
%% Copyright (C) 2019  by Matea Milin
%%
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.3 of this license or (at your option) any later
%% version. The latest version of this license is in:
%%
%% http://www.latex-project.org/lppl.txt
%%
%% and version 1.3 or later is part of all distributions of
%% LaTeX version 2005/12/01 or later.
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unizg_klasa}[2019/04/03]
\LoadClass[12pt]{article}
\usepackage[english]{babel}
\RequirePackage{graphicx} %za ubacivanje slika

\RequirePackage[nottoc,numbib]{tocbibind}%za spajanje literature i sadržaja i dodavanje broja na sadržaj
\renewcommand\refname\MakeUppercase

\RequirePackage{caption}%za uredivanje captiona
\captionsetup{labelsep=period} %dodavanje točke Slika 1.
\RequirePackage{hyperref}%prikazuje url kao link 
\urlstyle{same}%naredba da koristi isti font kao u dokumentu a ne monospace
\RequirePackage{subcaption}%za podopis slike

\RequirePackage{titlesec}%za uredivanje naslova i naslovnih
  
\RequirePackage{upgreek}%za olakšano upisivanje grčkih znakova, broj pi
\setlength\parindent{0pt}%naredba za brisanje uvlaka koje dolaze s klasom article





%definiranje margina
\RequirePackage{geometry}
 \geometry{
 a4paper,
 left=35mm,
 right=25mm,
 top=25mm,
 bottom=35mm,
}



%---definiranje tokena---------------
\newtoks\imestudenta 
\newtoks\sveuciliste
\newtoks\fakultet
\newtoks\rad
\newtoks\naslovrada
\newtoks\grad
\newtoks\mentor
\newtoks\logo


%------definiranje kako title page izgleda---
\renewcommand{\titlepage}{
    \centering
    \thispagestyle{empty}
    \fontsize{24}{36}
    }
 
 


%--def oblikovanja naslova------------
\newcommand{\ime}[1]{
    {\Large{#1}}
}

\newcommand{\uni}[1]{ 
    {\huge{#1}}
}




 
%----def prve naslovne stranice
\newcommand{\prvanaslovna}{
    \begin{titlepage}
\uni{\the\sveuciliste}
\\
\uni{\the\fakultet}

\vspace{4cm}
\ime{\the\imestudenta}

\vspace{4cm}
\uni{\the\naslovrada}     

\vspace{36pt}
\ime{\the\rad}
\vfill
{\the\grad}, \the\year. 
\end{titlepage}
    
}
 

%----def druge naslovne stranice----
\newcommand{\druganaslovna}{
    \begin{titlepage}
    

{\the\logo}
\\
\vspace{2.5cm}
\ime{\the\imestudenta}
\\
\vspace{3cm}
\uni{\the\naslovrada}     
\\
\vspace{24pt}
\ime{\the\rad}
\vfill
Mentor:
\hfill
Student:
\\
{\the\mentor} 
\hfill
{\the\imestudenta}
\vspace{24pt}
\\
{\the\grad}, \the\year. 

\end{titlepage}
}
 
 
%------------------------------------------------


\titleformat*{\section}{\LARGE\bfseries}
\renewcommand
{\@seccntformat}[1]
{\csname the#1\endcsname.\enskip} %DODAVANJE TOČKE na sectione i malog razmaka(enskip) između točke i riječi

\titleformat*{\subsection}{\large}
\titleformat*{\subsubsection}{\large}

\renewcommand{\baselinestretch}{1.5}%--------prored



%----------- def numeriranja na desnu stranu--------
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\renewcommand\headrulewidth{0pt} % nema linije u headeru
\fancyhead{} %prazan header 
\fancyfoot{} % prazan footer
\fancyfoot[R]{\thepage} % broj na desnoj strani


