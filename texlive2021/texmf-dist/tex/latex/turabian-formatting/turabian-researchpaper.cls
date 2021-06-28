% Turabian Formatting for LaTeX
%
% Based on Kate L. Turabian's "A Manual for Writers of Research Papers, Theses, 
% and Dissertations," 9th edition.
%
% ==============================
% Copyright 2013-2021 Omar Abdool
%
% This work may be distributed and/or modified under the conditions of the LaTeX
% Project Public License (LPPL), either version 1.3 of this license or (at your
% option) any later version.
%
% The latest version of this license is in:
%	http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX version
% 2005/12/01 or later.
%
% LPPL Maintenance Status: maintained (by Omar Abdool)
%
% This work consists of the files: turabian-formatting.sty,
% turabian-researchpaper.cls, turabian-thesis.cls, turabian-formatting-doc.tex,
% and turabian-formatting-doc.pdf (in addition to the README file).
%
% ==============================
%
%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{turabian-researchpaper}[2021/03/20 Turabian Research Paper]


% Default point size
\def\@@ptsize{12pt}


% Document class options: handling

\DeclareOption{noraggedright}{%
	\PassOptionsToPackage{\CurrentOption}{turabian-formatting}}

\DeclareOption{authordate}{%
	\PassOptionsToPackage{\CurrentOption}{turabian-formatting}}

\DeclareOption{noadjustbib}{%
	\PassOptionsToPackage{\CurrentOption}{turabian-formatting}}

\DeclareOption{endnotes}{%
	\PassOptionsToPackage{\CurrentOption}{turabian-formatting}}

\DeclareOption{twocolumn}{%
	\ClassWarningNoLine{turabian-researchpaper}{The '\CurrentOption' option is not supported}
	\OptionNotUsed}

\DeclareOption{10pt}{\def\@@ptsize{10pt}}

\DeclareOption{11pt}{\def\@@ptsize{11pt}}

\DeclareOption{12pt}{\def\@@ptsize{12pt}}

\DeclareOption{emptymargins}{%
	\ClassWarningNoLine{turabian-researchpaper}{The '\CurrentOption' option is no longer available}
	\OptionNotUsed}

\DeclareOption{endnotesonly}{%
	\ClassWarningNoLine{turabian-researchpaper}{The '\CurrentOption' option is no longer available. Consider using the 'endnotes' option instead}
	\OptionNotUsed}

\DeclareOption{raggedright}{%
	\ClassWarningNoLine{turabian-researchpaper}{The '\CurrentOption' option has been deprecated.}
	\OptionNotUsed}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax


% Load "article" document class with options
\LoadClass[titlepage,oneside,onecolumn,\@@ptsize]{article}


% Load turabian-formatting package
\RequirePackage{turabian-formatting}


% Sections: \section* adjustment to space after heading
\newif\if@adjustssect\@adjustssecttrue
\newlength\tf@ssectafterskip

% Sections: command to disable differentiate and reformat \section*
\gdef\noadjustssect{\@adjustssectionfalse}

% Sections: \section* heading formatting hook
\def\tf@ssectformat#1{#1}

% Sections: redefine \@startsection to support \if@adjustssect and \tf@ssectformat
\def\@startsection#1#2#3#4#5#6{%
	\if@noskipsec \leavevmode \fi
	\par
	\@tempskipa #4\relax
	\@afterindenttrue
	\ifdim \@tempskipa <\z@
		\@tempskipa -\@tempskipa \@afterindentfalse
	\fi
	\if@nobreak \everypar{} \else
		\addpenalty\@secpenalty\addvspace\@tempskipa
	\fi
	\setlength\tf@ssectafterskip{#5}
	\ifnum #2 =1
		\if@adjustssect \setlength\tf@ssectafterskip{2\tf@singlelineskip} \fi
	\fi
	\@ifstar
		{\@ssect{#3}{#4}{\tf@ssectafterskip}{\tf@ssectformat{#6}}}%
		{\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}


% Part: formatting (unsupported)
\def\tf@partformat{\normalfont\bfseries\centering}

\def\@part[#1]#2{%
	\@afterindenttrue
	\ifnum \c@secnumdepth >\m@ne
		\refstepcounter{part}%
		\addcontentsline{toc}{part}{\protect{\partname\space\thepart}}%
	\else
		\addcontentsline{toc}{part}{#1}%
	\fi
	\markboth{}{}%
	\begingroup
		\setlength\parskip{\tf@singlelineskip}
		\singlespacing
		\interlinepenalty \@M 
		\tf@partformat{%
			\ifnum \c@secnumdepth >\m@ne
				\partname\nobreakspace\thepart\relax\@@par
			\fi%
			#2\@@par}%
	\endgroup
	\vskip 2\tf@singlelineskip
	\@afterheading}

\def\@spart#1{%
   \@afterindenttrue
	{	\singlespacing
		\interlinepenalty \@M
		\tf@partformat{#1\@@par}}%
	\vskip 2\tf@singlelineskip
	\@afterheading}


% Title page: commands for use with \maketitle
\newcommand{\subtitle}[1]{\gdef\tf@subtitle{#1}}
\subtitle{}

\newcommand{\tf@subtitlesep}{\ifdefempty{\tf@subtitle}{}{:}}

\newcommand{\submissioninfo}[1]{\gdef\tf@submissioninfo{#1}}
\submissioninfo{}

\newcommand{\course}[1]{\gdef\tf@course{#1}}
\course{}

% Title page: command for emptying/completing \maketitle
\newcommand{\tf@emptymaketitle}{%
	\global\let\thanks\relax
	\global\let\maketitle\relax

	\global\let\@thanks\@empty
	\global\let\@author\@empty
	\global\let\@date\@empty
	\global\let\@title\@empty
	\global\let\tf@subtitle\@empty
	\global\let\tf@submissioninfo\@empty
	\global\let\tf@course\@empty

	\global\let\title\relax
	\global\let\author\relax
	\global\let\date\relax
	\global\let\subtitle\relax
	\global\let\submissioninfo\relax
	\global\let\course\relax}

% Title page: renew \maketitle command research paper
\if@titlepage
	% Formatting for titlepage option
	\renewcommand{\maketitle}{%
		\begin{titlepage}%
			\def\tf@thefnpunct{\,\,}
			\renewcommand*{\thefootnote}{\fnsymbol{footnote}}
			\let\footnoterule\relax
			\normalfont\normalsize\centering\singlespacing
			\parskip=1\baselineskip
			\vspace*{-2\baselineskip}
			\vspace*{0.333\paperheight}
			\vspace*{-1in}
			{	\bfseries\@title\tf@subtitlesep\par%
				\tf@subtitle\par}%
			\vspace*{2.35in}
			\@author\@thanks\par
			\tf@course\par
			\tf@submissioninfo\par
			\@date\par
			\parskip=\z@
		\end{titlepage}%
		% if not endnotes, reset footnote counter
		\if@endnotesformat \else \setcounter{footnote}{0} \fi
		\tf@emptymaketitle
		\cleardoublepage}
\else
	% Formatting for notitlepage option
	\renewcommand{\maketitle}{%
		\thispagestyle{plain}
		{	\renewcommand*{\thefootnote}{\fnsymbol{footnote}}
			\normalfont\normalsize\centering\singlespacing
			\parskip=1\baselineskip
			\vspace*{0.5in}
			\vspace*{-1.5\baselineskip}
			{	\bfseries\@title\tf@subtitlesep\par%
				\tf@subtitle\par}%
			\vspace*{1\baselineskip}
			\@author\@thanks\par
			\tf@course\par
			\tf@submissioninfo\par
			\@date\par
			\vspace*{0.5in}
			\vspace*{-1\baselineskip}}
		% if not endnotes, reset footnote counter
		\if@endnotesformat \else \setcounter{footnote}{0} \fi
		\tf@emptymaketitle}
\fi


% Table of Contents, List of Figures, and List of Tables: item number alignment

\def\@tocrmarg{0.75in}
\def\@pnumwidth{3.5ex}


% Table of Contents: formatting
\setcounter{tocdepth}{1}

\renewcommand*{\l@part}[2]{%
	\ifnum \c@tocdepth >-2\relax
		\addpenalty{-\@highpenalty}%
		\vskip 2\tf@singlelineskip %
		\setlength\@tempdima{0.5in}%
		{	\parindent \z@ \rightskip \z@
			\parfillskip -\rightskip
			\leavevmode
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			\bfseries #1\nobreak\hfil \nobreak\par}
		\if@compatibility
			\global\@nobreaktrue
			\everypar{\global\@nobreakfalse\everypar{}}%
		\fi
	\fi}

\renewcommand*{\l@section}[2]{%
	\ifnum \c@tocdepth >\z@
		\addpenalty\@secpenalty
		\vskip \tf@singlelineskip
		\setlength\@tempdima{\z@}%
		\begingroup
			\parindent \z@ \rightskip \@tocrmarg
			\parfillskip -\rightskip
			\leavevmode
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			#1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
		\endgroup
	\fi}

\renewcommand*{\l@subsection}{%
	\ifnum \c@tocdepth >1 \vskip \tf@singlelineskip \fi
	\@dottedtocline{2}{0.5in}{\z@}}

\renewcommand*{\l@subsubsection}{%
	\ifnum \c@tocdepth >2 \vskip \tf@singlelineskip \fi
	\@dottedtocline{3}{1.0in}{\z@}}


% List of Figures: formatting
\renewcommand*\l@figure{
	\vskip \tf@singlelineskip
	\@dottedtocline{1}{1em}{0.5in}}


% List of Tables: formatting
\def\l@table{\l@figure}


% Abstract: formatting
\renewenvironment{abstract}%
	{%
		\clearpage
		\section*{\abstractname}
	}%
	{\clearpage}


% Appendixes: adjust formatting of section headings
\def\tf@appendixsecfrmt{%
	\def\thesection{\@Alph\c@section}
	\protect\def\tf@makesectionhead##1##2##3##4##5{%
		\vskip -\tf@singlelineskip\relax
		\ifnum ##2 =1
			\begingroup
				\singlespacing
				\interlinepenalty \@M
				##4{\appendixname\space\thesection\relax\@@par ##5\@@par}%
				\vskip \tf@singlelineskip
			\endgroup
		\else
			\begingroup
				\singlespacing
				##4{%
					\@hangfrom{\hskip ##3\relax\@svsec}%
					\interlinepenalty \@M ##5\@@par}%
			\endgroup
		\fi}
	\def\tf@tocline##1##2{%
		\ifnum ##2 =1
			\protect{\appendixname\space\thesection.\quad}
		\else
			\protect{\csname the##1\endcsname\quad}
		\fi}}

% Appendixes: make environment
\newenvironment{appendixes}%
	{%
		\setcounter{secnumdepth}{1}
		\setcounter{section}{0}
		\setcounter{subsection}{0}
		\tf@appendixsecfrmt%
	}%
	{%
		\setcounter{secnumdepth}{0}%
		\setcounter{section}{0}%
		\setcounter{subsection}{0}%
	}%

% Appendixes: remove \appendix command
\def\appendix{\@empty}


% Endnotes: Notes heading formatted as \section*
\if@endnotesformat
	\def\enoteheading{%
		\section*{\notesname}%
		\markboth{}{}%
		\addcontentsline{toc}{section}{\notesname}}
\fi


