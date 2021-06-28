%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	Copyright of Matthias Bartelt, Benjamin Unger and Dominik Kern                                   %
%	email: dominik.kern@mb.tu-chemnitz.de                                                            %
%	This work may be distributed and/or modified under the                                           %
% 	conditions of the LaTeX Project Public License version 1.3c                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                                  %
%                     identification                                                               %
%                                                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gammas}[2019/02/11 v1.0 class definition for GAMM Archiv for Students]
\LoadClass[11pt, twoside, numbers=noenddot]{scrartcl}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                                  %
%                     packages loaded by default                                                   %
%                                                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% language and font packages
\RequirePackage[latin1,utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern} \normalfont %to load T1lmr.fd 
\DeclareFontShape{T1}{lmr}{bx}{sc} { <-> ssub * cmr/bx/sc }{}
\RequirePackage{fourier}
\RequirePackage[english]{babel}
\RequirePackage{microtype} 	% for improved spacing
\RequirePackage{anyfontsize}

% math packages and symbols
\RequirePackage{amssymb}
\RequirePackage[intlimits]{amsmath}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage{mathrsfs}

% graphics/color packages
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\definecolor{GAMMgreen}{RGB}{14,123,44}
\RequirePackage{tikz} 
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.10}

% layout/formatting packages
\RequirePackage{geometry}
\geometry{a4paper, left=5cm, right=1.5cm, top=2cm, bottom=2.5cm, headheight=3cm}
\RequirePackage[automark,draft=false]{scrlayer-scrpage}	% for headers and footers
\RequirePackage{booktabs}	% for nice tables
\RequirePackage{enumitem}
\setitemize{parsep=0pt,itemsep=0pt}
\setenumerate{parsep=0pt,itemsep=0pt}
\setdescription{parsep=0pt,itemsep=0pt,labelindent=1em,font=\textit}
\RequirePackage{lastpage}

% Packages for units
\RequirePackage[binary-units=true]{siunitx}
\sisetup{%
	list-units = brackets,
	range-units = brackets,
	range-phrase = {-},
	per-mode=symbol
}  

% Packages for reviewing purposes
\RequirePackage[left,pagewise,switch]{lineno}

% Program codes and algorithms
\RequirePackage{listings}

% packages for conditional options
\RequirePackage{ifthen}

% linking packages
\RequirePackage[colorlinks,linkcolor=GAMMgreen,citecolor=GAMMgreen,urlcolor=black]{hyperref}
\RequirePackage[nameinlink]{cleveref}
\RequirePackage[babel]{csquotes}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                                  %
%                     fix for linenumbers with ams environments                                    %
%                                                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% from http://phaseportrait.blogspot.de/2007/08/lineno-and-amsmath-compatibility.html
\newcommand*\patchAmsMathEnvironmentForLineno[1]{%
  \expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
  \expandafter\let\csname oldend#1\expandafter\endcsname\csname end#1\endcsname
  \renewenvironment{#1}%
     {\linenomath\csname old#1\endcsname}%
     {\csname oldend#1\endcsname\endlinenomath}}% 
\newcommand*\patchBothAmsMathEnvironmentsForLineno[1]{%
  \patchAmsMathEnvironmentForLineno{#1}%
  \patchAmsMathEnvironmentForLineno{#1*}}%
\AtBeginDocument{%
\patchBothAmsMathEnvironmentsForLineno{equation}%
\patchBothAmsMathEnvironmentsForLineno{align}%
\patchBothAmsMathEnvironmentsForLineno{flalign}%
\patchBothAmsMathEnvironmentsForLineno{alignat}%
\patchBothAmsMathEnvironmentsForLineno{gather}%
\patchBothAmsMathEnvironmentsForLineno{multline}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                                  %
%                     settings for the listing package                                             %
%                                                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{lstbackground}{RGB}{235,235,235}
\definecolor{lstcommand}{RGB}{0,100,0}
\AtBeginDocument{%
	\lstset{%
		basicstyle = \ttfamily\fontsize{9.5pt}{9.5pt}\selectfont,
		morecomment = [s][\color{green}]{\#},
		keywordstyle = \color{blue}\bfseries,			% Schluesselwoerte (if,int,...)
		commentstyle = \color{lstcommand}\emph,			% Kommentare
		stringstyle = \color{red},						% Strings
		%captionpos = bottom (b),						% Beschriftung bottom (b)
		backgroundcolor = \color{lstbackground},
		frame = tblr,									% Rahmen top (t),
		numberstyle = \tiny,
		stepnumber = 1,									% Schritweite
		numbersep = 5pt,
		breaklines = true,								% automatischer Zeilenumbruch
		tabsize = 3,
		showstringspaces = false,
		escapeinside = {(*@}{@*)},
		comment=[l]{\*},								% Einleitendes zeichen fuer Kommentare
	}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                                  %
%                     compression of the bibliography                                              %
%                                                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument{
	\let\oldbibliography\thebibliography
		\renewcommand{\thebibliography}[1]{%
		\footnotesize
		\oldbibliography{#1}%
		\setlength{\itemsep}{0pt}%
	}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                                  %
%                     definitions of global variables                                              %
%            the definition with 'def' is a little bit tricky                                      %
%            but this is necessary                                                                 %
%            the small name is the command for the tex-file with one argument                      %
%            the capital name after the next 'def' is the argument defined in the tex-file         %
%            the last 'def' is the default ( simple empty )                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\gammauthora#1{\def\GAMMAUTHORA{#1}} \def\GAMMAUTHORA{}
\def\gammauthorb#1{\def\GAMMAUTHORB{#1}} \def\GAMMAUTHORB{}
\def\gammauthorc#1{\def\GAMMAUTHORC{#1}} \def\GAMMAUTHORC{}
\def\gammauthord#1{\def\GAMMAUTHORD{#1}} \def\GAMMAUTHORD{}
\def\gammauthore#1{\def\GAMMAUTHORE{#1}} \def\GAMMAUTHORE{}
\def\gammauthorf#1{\def\GAMMAUTHORF{#1}} \def\GAMMAUTHORF{}

\def\gammaddressa#1{\def\GAMMADDRESSA{#1}} \def\GAMMADDRESSA{}
\def\gammaddressb#1{\def\GAMMADDRESSB{#1}} \def\GAMMADDRESSB{}
\def\gammaddressc#1{\def\GAMMADDRESSC{#1}} \def\GAMMADDRESSC{}
\def\gammaddressd#1{\def\GAMMADDRESSD{#1}} \def\GAMMADDRESSD{}
\def\gammaddresse#1{\def\GAMMADDRESSE{#1}} \def\GAMMADDRESSE{}
\def\gammaddressf#1{\def\GAMMADDRESSF{#1}} \def\GAMMADDRESSF{}

\newcommand{\inst}[1]{\textsuperscript{\textit{#1}}}
\newcommand{\corauth}{\textsuperscript{,$\star$}}


\def\gammauthorhead#1{\def\GAMMAUTHORHEAD{#1}} \def\GAMMAUTHORHEAD{}
\def\gammcorrespondence#1{\def\GAMMCORRESPONDENCE{#1}} \def\GAMMCORRESPONDENCE{}
\def\gammsupervisor#1{\def\GAMMSUPERVISOR{#1}} \def\GAMMSUPERVISOR{}
\def\gammotherpublication#1{\def\GAMMOTHERPUBLICATION{#1}} \def\GAMMOTHERPUBLICATION{}

\def\gammbibfilename#1{\def\GAMMBIBFILENAME{#1}} \def\GAMMBIBFILENAME{mybibfile}
\def\gammloadoptbiber#1{\def\GAMMLOADOPTBIBER{#1}} \def\GAMMLOADOPTBIBER{}
\def\gammbiberopt#1{\def\GAMMBIBEROPT{#1}} \def\GAMMBIBEROPT{}
\def\gammloadoptbibtex#1{\def\GAMMLOADOPTBIBTEX{#1}} \def\GAMMLOADOPTBIBTEX{}
\def\gammfinalmode#1{\def\GAMMFINALMODE{#1}} \def\GAMMFINALMODE{}
\def\gammtwocolumnmode#1{\def\GAMMTWOCOLUMNMODE{#1}} \def\GAMMTWOCOLUMNMODE{}

% definition for title this option must be set
\newcommand*{\gammtitle}[1]{\def\gammtitle{#1}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                                  %
%                     definitions of global environments                                           %
%                                                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{gammabstract}{\indent\textbf{Abstract:}\begin{itshape}}{\end{itshape}\par}
\newenvironment{gammkeywords}{\indent\textbf{Keywords:}}{\par}
\newenvironment{gammacknowledgement}{\bigskip\indent\textbf{Acknowledgements:}}{\par}
\newenvironment{gammacode}{\bigskip\indent\textbf{Code Availability:}}{\par}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                                  %
%                     definitions of the documentclass options                                     %
%                                                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@productionMode{false}
\def\@biber{false}
\def\@biberBackref{false}
\def\@bibtex{false}
\def\@twocolumn{true}


% bibtex vs biber
\gammloadoptbiber{true} % default, will be deleted for usebibtex
\DeclareOption{usebiber}{
	\def\@biber{true}
	\gammloadoptbiber{true} % evaluation happens after arguments are passed (near eof)
}
% if bibtex is set biber will be deleted
\DeclareOption{usebibtex}{
	\def\@bibtex{true}
	\gammloadoptbibtex{true} % evaluation happens after arguments are passed (near eof)
	\gammloadoptbiber{} % evaluation happens after arguments are passed (near eof)
}


% option correction more space around the the text 
% this does not scale the text it changes the papersize 
% this options sets also the backref option for biblatex
% and the linenumbers will be shown
% In additions, it marks badboxes
\gammbiberopt{true}
\gammfinalmode{} % evaluation happens after arguments are passed (near eof)
\overfullrule=5pt
\AtBeginDocument{%
	\linenumbers%
	\switchlinenumbers
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                                  %
%                    pass options to class                                                         %
%                  - now auxilary macros (gammloadoptbiber, gammfinalmode) can be evaluated        %
%                                                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                                  %
%                     definitions of the title page                                                %
%                                                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\gammasHeader}{%
	\begin{center}%
			\ifthenelse{\equal{\@productionMode}{true}}{%
				% logo GAMMAS
				\parbox{2.5cm}{\includegraphics[width=\linewidth]{\gammalogo}}
				\hfill
				% title of the journal			
				\parbox{10cm}{%
					\centering \textbf{International Association}\\
					\textbf{of Applied Mathematics and Mechanics}\\
					\textbf{-- Archive for Students --}%
				}
				% logo GAMM juniors
				\hfill
				\parbox{2.5cm}{\includegraphics[width=\linewidth]{\gjlogo}}
				% set correct page number
				\setcounter{page}{\@gammpagenum}
			}{}
			\vspace*{3em}
			
			\begin{minipage}{.75\textwidth}%
				\begin{center}%
					{\LARGE \textbf{\gammtitle{}}\par}%
					\vspace{1cm}%
					\GAMMAUTHORA{}%
					\ifx\GAMMAUTHORB\empty%
					\else%
						, \GAMMAUTHORB{}%
					\fi%
					\ifx\GAMMAUTHORC\empty% 
					\else%
						, \GAMMAUTHORC{}%
					\fi%
					\ifx\GAMMAUTHORD\empty% 
					\else%
						, \GAMMAUTHORD{}%
					\fi%
					\ifx\GAMMAUTHORE\empty% 
					\else%
						, \GAMMAUTHORE{}%
					\fi%
					\ifx\GAMMAUTHORF\empty% 
					\else%
						, \GAMMAUTHORF{}%
					\fi%
					\\\vspace{0.5cm}\par%
					\ifx\GAMMADDRESSA\empty% 
					\else%
						$^a$ \GAMMADDRESSA{}\\%
					\fi%
					\ifx\GAMMADDRESSB\empty% 
					\else%
						$^b$ \GAMMADDRESSB{}\\%
					\fi%
					\ifx\GAMMADDRESSC\empty% 
					\else%
						$^c$ \GAMMADDRESSC{}\\%
					\fi%
					\ifx\GAMMADDRESSD\empty% 
					\else%
						$^d$ \GAMMADDRESSD{}\\%
					\fi%
					\ifx\GAMMADDRESSE\empty% 
					\else%
						$^e$ \GAMMADDRESSE{}\\%
					\fi%
					\ifx\GAMMADDRESSF\empty% 
					\else%
						$^f$ \GAMMADDRESSF{}\\%
					\fi%
					\vspace{0.5cm}\par%
					\ifthenelse{\equal{\@productionMode}{true}}{%
					received \@receiveddate, accepted \@accepteddate, published \@publisheddate \par%
					}{}
				\end{center}%
				\rule{0.5\textwidth}{.4pt}\par%
				{\footnotesize * corresponding author: \GAMMCORRESPONDENCE}\par%
				\ifx\GAMMSUPERVISOR\empty% 
					\else%
						{\footnotesize supervisor: \GAMMSUPERVISOR}\par%
					\fi%
				\ifx\GAMMOTHERPUBLICATION\empty% 
					\else%
						{\footnotesize \GAMMOTHERPUBLICATION}\par%
					\fi%
			\end{minipage}%
			%\vspace{\baselineskip}%
		\end{center}%
		\rule{1\textwidth}{.4pt}\par%
		\vspace{1cm}%
}

\newcommand{\makegammhead}{%
	\setlength{\columnsep}{15pt}
	\ifthenelse{\equal{\@twocolumn}{true}}{%
		\twocolumn[\gammasHeader]
	}{%
		\gammasHeader
	}
	\thispagestyle{scrplain}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                                  %
%                     redefine maketitle to show the new gammhead                                  %
%                                                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
	\def\@maketitle{%
		\makegammhead
	}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                                  %
%                     set geometry of the manuscript                                               %
%                                                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifx\GAMMFINALMODE\empty% if final mode off
	\geometry{paperheight=35.7cm, paperwidth=27cm, left=4.5cm, right=4.5cm, top=5cm, bottom=5.5cm, headheight=6cm}
\else%
	\geometry{paperheight=29.7cm, paperwidth=21cm, left=1.5cm, right=1.5cm, top=2cm, bottom=2.5cm, headheight=3cm}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                                  %
%                     definitions of header and footer                                             %
%                                                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{scrheadings}
\renewcommand*{\titlepagestyle}{scrplain}
\clearscrheadfoot

\makeatletter
	\ihead[\href{http://www.gammas.gamm-juniors.de}{\texttt{www.gammas.gamm-juniors.de}}]{\today}
	\chead{\GAMMAUTHORHEAD{}}
	\ohead[\today]{\thepage}
	\ifoot[Preprint submitted to GAMM archive for students]{Preprint submitted to GAMMAS}
\makeatother

\AtBeginDocument{\pagestyle{scrheadings}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                                  %
%                    conditions for biber and bibtex                                               %
%                                                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifx\GAMMLOADOPTBIBER\empty%
\else% for biber
	\emergencystretch=1em
	\RequirePackage[style=numeric, backend=biber,url=false, isbn=true, bibencoding=utf8]{biblatex}	%  block=ragged
	\newcommand{\setbib}[1]{\printbibliography}
	\newcommand{\setbiber}[1]{\bibliography{#1}}
	\ifx\GAMMBIBEROPT\empty%
	\else%
		\ExecuteBibliographyOptions{%
			backref = true,%
			backrefstyle=all+%
		}%
	\fi%
\fi

\ifx\GAMMLOADOPTBIBTEX\empty%
\else% for bibtex
	\RequirePackage[numbers,sort]{natbib}
	\newcommand{\setbib}[1]{\bibliographystyle{gammas}\begingroup \hbadness 10000\relax\bibliography{#1}\endgroup}%
	\newcommand{\setbiber}[1]{}%
\fi%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                                  %
%                    end                                                                           %
%                                                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\endinput