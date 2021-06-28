%% This is file `ijsra.cls',
%%
%% LaTeX Class for ``International Journal of Student Research in Archaeology''.
%%
%% Copyright (C) 2016,2017-
%% Lukas C. Bossert
%%
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.

\listfiles
\NeedsTeXFormat{LaTeX2e}[1999/12/01]

\ProvidesClass{ijsra}
\RequirePackage{ifxetex,ifluatex,ifpdf,ifvtex}
\RequirePackage{xkeyval,etoolbox}

\def\IJSRAversion{1.1}
\def\IJSRAversiondate{2017/07/24}

\newbool{issue}
\newbool{nobib}

\boolfalse{nobib}
\boolfalse{issue}



\newcommand*\IJSRAmonth{{\scshape proof}}
\newcommand*\IJSRAyear{{\scshape proof}}% \edef\issueyear{\the\year}
\newcommand*\IJSRAvolume{{\scshape proof}}
\newcommand*\IJSRAnumber{{\scshape proof}}
\newcommand*\IJSRAtitlefigure{{\color{mygold}\rule{\linewidth}{410pt}}}
\newcommand*\IJSRAidentifier{\jobname}
\newcommand*\yearnumber{\IJSRAyear\,|\,\IJSRAnumber}


\DeclareOptionX{draft}{\PassOptionsToClass{\CurrentOption}{scrbook}}
\DeclareOptionX{month}{\def\IJSRAmonth{#1}}
\DeclareOptionX{year}{\def\IJSRAyear{#1}}
\DeclareOptionX{completeissue}{\booltrue{issue}}
\DeclareOptionX{volume}{\def\IJSRAvolume{Vol.\addspace #1}}
\DeclareOptionX{number}{\def\IJSRAnumber{#1}}
\DeclareOptionX{titlefigure}{\def\IJSRAtitlefigure{\includegraphics[width=\linewidth]{figures/#1}}}
\DeclareOptionX*{\OptionNotUsed}
\ProcessOptionsX\relax


\RequirePackage{scrhack}% Andere Pakete KOMA-Script-freundlich machen


\LoadClass[%
	parskip=half,
	twoside=true,				% onesite or twoside printing
	open=any,					% doublepage cleaning ends up right side
	chapterprefix=false,		% prefix for chapter marks (Löscht "Kapitel" bei Kapitel)
	headings=optiontohead, 	% \chapter[tocentry={}]{}
	fontsize=11pt,				% font size
	titlepage=on,				% own page for each title page
	captions=tableabove,		% display table captions above the float env
	numbers=noenddot,
]{scrbook}%	
								
\RequirePackage{filecontents}
\RequirePackage{fontspec}
%\RequirePackage[osf]{libertine}
% \RequirePackage{unicode-math}
\setsansfont{Libertinus Sans}
\setmainfont[Numbers = {Monospaced, OldStyle}]{Libertinus Serif}
\defaultfontfeatures[AnonymousPro]
  {
    Extension      = .ttf                       ,
    BoldFont       = AnonymousPro-Bold          ,
    ItalicFont     = AnonymousPro-BoldItalic    ,
    BoldItalicFont = AnonymousPro-Italic        ,
    UprightFont    = AnonymousPro-Regular       ,
  }
\setmonofont[Scale= MatchLowercase]{AnonymousPro}

\RequirePackage[french, ngerman, spanish, italian, main=english]{babel}
\RequirePackage[%
,protrusion=true
,expansion=true
,verbose=true
,final=true
,letterspace=100
,babel=true
]{microtype}
\RequirePackage{colortbl}
\RequirePackage{abbrevs}
\RequirePackage[shortlabels]{enumitem}

\RequirePackage{alertmessage}
\RequirePackage{marginnote}
\RequirePackage{lettrine} % The lettrine is the first enlarged letter at the beginning of the text
\LettrineTextFont{\itshape}
\setcounter{DefaultLines}{3}
\renewcommand{\LettrineTextFont}{\normalfont}%für zweite Klammer
\renewcommand{\LettrineFontHook}{\normalfont}
\RequirePackage{paralist} % Used for the compactitem environment which makes bullet points with less space between them
\RequirePackage{currfile}
\RequirePackage{enumerate}
\RequirePackage{currfile-abspath}

\RequirePackage[
detect-all, %Zahlen werden in der aktuellen Schrift angezeigt
	exponent-to-prefix  		= true,
	round-mode          		= places, 
	group-minimum-digits 	= 4, 
	group-separator		={,},		% für "12.345" statt "12 345"
	range-phrase 			= {$\times$},%
	zero-decimal-to-integer 	= true,	%aus "2.0" wird "2"
	range-units			=single, 	% --> 2 x 2 m, - auskommentieren für 2 m x 2 m
	]{siunitx} 
\RequirePackage[					% advanced quotes
	strict=true,					
	style=english,					
]{csquotes}

\renewcommand*{\mkccitation}[1]{ (#1)}
\renewcommand*{\mkcitation}[1]{ (#1)}

\renewenvironment{quote}
  {%\small
	\list{}{\rightmargin=0em \leftmargin=2em}%
   \item\relax}
  {\endlist}
\newenvironment{IJSRAquote}[1]%
{\begin{quote}
\alertwarning{\sffamily THIS FEATURE IS DEPRECATED!\newline
Use \textbackslash blockcquote or \textbackslash foreignblockcquote. \newline
See the documentation online.}
}
	{\end{quote}}	

%-------------------------------------------
	
\RequirePackage[					%% use  for bibliography
	backend=biber,
	style=ijsra,
	]{biblatex}
\addbibresource{\jobname.bib}


\RequirePackage{etoolbox}
\RequirePackage{graphicx}
\graphicspath{{figures/}}
\RequirePackage{wrapfig} % Paket zur Positionierung einbinden
\RequirePackage{booktabs}%für schönere Tabellen
\RequirePackage{multirow}
\RequirePackage{xspace}
\RequirePackage{xcolor}
\RequirePackage{hologo}
\RequirePackage{url}
\urlstyle{same}
\definecolor{myblue}{rgb}{0,0,51}
\definecolor{mygold}{RGB}{204,153,51}
\definecolor{mybluetitle}{RGB}{28,40,65} % HEX 1c2841

\definecolor{codeblue}{RGB}{0,65,137}
\definecolor{codegreen}{RGB}{147,193,26}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

\RequirePackage{pdfpages}



\newcommand\submission{}
\newcommand\acceptance{}


%-----------------------------------------
\RequirePackage[					% page layout modifications
	paper=a4paper,				% 	- use A4 paper size
	head=4\baselineskip,			% 	- no header
	foot =4\baselineskip,
	bindingoffset=0.5cm,			% 	- binding correction
	top=3cm,						% 	- total body: top margin
	left=2cm,						% 	- total body: left margin (odd pages)
	right=5cm,					% 	- total body: right margin (odd pages)
	bottom=5cm,					% 	- total body: bottom margin
	marginparwidth=4cm,			% 	- width for side note
]{geometry}
\RequirePackage{multicol} % Used for the two-column layout of the document
\RequirePackage[%
	%hang, 
	small,
	labelfont=bf,
	up,
	singlelinecheck=off,
	justification=raggedright,
	textfont=it,
	up,
	]{caption} % Custom captions under/above floats in tables or figures
\RequirePackage{subcaption}
\RequirePackage{setspace}			% for line spacing, e.g. \onehalfspacing
\RequirePackage{booktabs} % Horizontal rules in tables
\RequirePackage{nth}
\RequirePackage[content={Figure omitted due to faster compiling.}]{draftfigure}

	
\RequirePackage{chngcntr} %Voraussetzung fuer Fussnoten durch alle Kapitel durchnummerieren
\RequirePackage{listings}
\AtBeginDocument{\counterwithin{lstlisting}{chapter}}

\counterwithout{footnote}{chapter} %Fussnoten durch alle Kapitel durchnummerieren
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

%-------------------------------------------
\newcommand*{\ijsradate}[1]{\expandafter\@ijsradate#1\@nil} 
\newcommand*{\@ijsradate}{} 
\def\@ijsradate#1-#2-#3\@nil{\begingroup
	\year=#1\relax 
	\month=#2\relax 
	\day=#3\relax 
	% \DayName{#1}{#2}{#3}, % 
  \today%
	\endgroup} 
	
\RequirePackage[ 
	headsepline, 
	draft=false,
	]{scrlayer-scrpage} 
\pagestyle{scrheadings}
\clearscrheadfoot
\addtokomafont{pageheadfoot}{\normalfont\sffamily\footnotesize}

\lohead{\ifdefempty{\shorttitle}{}{\shorttitle%\ \ifdefempty{\ppages}{}{$\bullet$ \ppages}
}}
\rehead{\shortauthor}
\rohead{\textbf{\thepage}}
\lehead{\textbf{\thepage}}
\refoot{International Journal of Student Research in Archaeology}
\lofoot{\yearnumber}
\automark[subsection]{section}  


\newpairofpagestyles[scrheadings]{ijsrachapter}{\clearscrheadfoot
\chead{International Journal of Student Research in Archaeology | IJSRA\hfill\yearnumber\\ 
  \ifdefempty{\submission}{}{submission: \ijsradate{\submission}}
  \ifdefempty{\acceptance}{}{| acceptance: \ijsradate{\acceptance}}
  \hfill pp.\,\ppages%
\marginnote{\vspace{-5em}\includegraphics[width=\linewidth]{ijsra_logo}}}
}



\newpairofpagestyles[scrheadings]{part}{\clearscrheadfoot}
\renewcommand\partpagestyle{part}
\renewcommand\chapterpagestyle{ijsrachapter}


%-----------------------------
\setkomafont{partnumber}{\normalfont\Huge}
\setkomafont{part}{\normalfont\scshape\Huge}
\setkomafont{chapter}{\normalfont\LARGE}%\uppercase
\setkomafont{section}{\normalfont\Large}%\uppercase
\setkomafont{subsection}{\normalfont}%\uppercase
\setkomafont{subsubsection}{\normalfont}%\uppercase
\setkomafont{paragraph}{\normalfont\scshape}%\uppercase
\addtokomafont{descriptionlabel}{\normalfont\sffamily}%\textsf\large}%\uppercase
\addtokomafont{sectioning}{\linespread{1}\selectfont} %einfacher Zeilenabstand in Überschriften
\addtokomafont{headsepline}{\color{mygold}}
\addtokomafont{labelinglabel}{\sffamily\bfseries}

\setfootnoterule{0pt}

\addtolength{\skip\footins}{.5\baselineskip} % Abstand Text <->
\KOMAoptions{headsepline=3pt}

\clubpenalty=10000				% prevent single lines at the beginning of a paragraph (Schusterjungen)
\widowpenalty=10000				% prevent single lines at the end of a paragraph (Hurenkinder)
\displaywidowpenalty=10000		%
%-----------------------------------------
\RequirePackage[%
	marginal,
	ragged,%
	hang, %
	bottom%
	]{footmisc} %Fussnoten
\raggedbottom

\deffootnote{0em}{1em}{{\sffamily\textbf\thefootnotemark}\ }%Ausgabe der Fußnotenziffer in normal
%--------------------------------------
\robustify{\DateMark} % after having loaded abbrevs


\ifstr{\KOMAScriptVersion}{2015/07/02 v3.18 KOMA-Script}{%
  \ifx\par@update\default@par@update\else
    \AtBeginDocument{\par@updaterelative}%
  \fi
}{}

\renewcommand{\marginfont}{\noindent\rule{0pt}{0.7\baselineskip}\color{mygold}\small\sffamily}
%\RequirePackage{marginfix}
%\appto\quote{\normalsize\singlespacing}
%-----------------------------------------
\newcommand\ppages{\pagerange{firstpage\IJSRAidentifier}{lastpage\IJSRAidentifier}}
\newcommand\shorttitle{}
\newcommand\maintitle{}
\newcommand\maintitletoc{\let\\ \relax\maintitle}
\newcommand\shortauthor{}
\newcommand\cmail{}
\newcommand\affiliation{}
\newcommand\thanknote{}




\def\keywords{}
\def\keywordname{Keywords}

\newcommand\mypagesize{\newgeometry{%
		bindingoffset=0.5cm,			% 	- binding correction
		top=3cm,							% 	- total body: top margin
		left=2cm,							% 	- total body: left margin (odd pages)
		right=2cm,							% 	- total body: right margin (odd pages)
    marginparwidth=0cm,			% 	- width for side note
    marginparsep=0cm,				% 	- space between notes and body text (content)
		bottom=2cm,						% 	- total body: bottom margin
	}}
\newcommand\mypartstyle[1]{
\mypagesize
\part{#1}
\restoregeometry}


\newcommand\pcref[1]{\parentext{\cref{#1}}}

\newcommand{\IJSRAsection}[1]{%
	\marginnote{#1}\pdfbookmark[1]{#1}{#1\IJSRAidentifier}%
}
\newcommand{\IJSRAsubsection}[1]{%
	\marginnote{#1}\pdfbookmark[2]{#1}{#1\IJSRAidentifier}%
}
 \let\ijsrasection\IJSRAsection
 \let\ijsrasubsection\IJSRAsubsection
%

\newcommand\authorone{}
\newcommand\authortwo{}
\newcommand\authorthree{}
\newcommand\authorfour{}
\newcommand\authorfive{}

\newcommand\affilone{}
\newcommand\affiltwo{}
\newcommand\affilthree{}
\newcommand\affilfour{}
\newcommand\affilfive{}

\newcommand\affiloneauthor{}
\newcommand\affiltwoauthor{}
\newcommand\affilthreeauthor{}
\newcommand\affilfourauthor{}
\newcommand\affilfiveauthor{}

\newcommand\bioone{}
\newcommand\biotwo{}
\newcommand\biothree{}
\newcommand\biofour{}
\newcommand\biofive{}

\newcommand\abstract{}
\undef\abstract{}

\def\submission{}
\def\acceptance{}

\undef\authorone{}
\undef\authortwo{}
\undef\authorthree{}
\undef\authorfour{}
\undef\authorfive{}

\undef\affilone{}
\undef\affiltwo{}
\undef\affilthree{}
\undef\affilfour{}
\undef\affilfive{}

\undef\affiloneauthor{}
\undef\affiltwoauthor{}
\undef\affilthreeauthor{}
\undef\affilfourauthor{}
\undef\affilfiveauthor{}

\undef\bioone{}
\undef\biotwo{}
\undef\biothree{}
\undef\biofour{}
\undef\biofive{}

\def\shortauthor{%
	\ifdef{\authorone}{\authorone}{}%
	\ifdef{\authortwo}{, \authortwo}{}%
	\ifdef{\authorthree}{, \authorthree}{}%
	\ifdef{\authorfour}{, \authorfour}{}%
	\ifdef{\authorfive}{, \authorfive}{}
}
	
	
	
	
	

\newenvironment{IJSRAabstract}
{\list{}{\rightmargin\leftmargin}%
\item \footnotesize\sffamily\textbf\keywordname :  \keywords\\
	\itshape
	\noindent\item\relax
	}
{\endlist}

\newcommand{\IJSRAseparator}{%
	\begin{center}
	* * *
	\end{center}}

\newcommand\email{{\normalfont\href{mailto:\cmail}{\cmail}}}

\newbool{@page}
\newcommand{\pagerange}[2]{%pp.~
	\edef\tempa{\getpagerefnumber{#1}\booltrue{@page}}%
	\edef\tempb{\getpagerefnumber{#2}}%
	\ifboolexpr{bool{@page}}{}{\tempa--\tempb}}
	%\ifdefequal{\tempa}{\tempb}{}{


\providecommand\IJSRAopening{%
\ifbool{issue}{}{\begin{document}}
	\begin{refsection}
	\setcounter{footnote}{0}
	\setcounter{table}{0}
	\setcounter{figure}{0}
	\renewcommand*{\thefootnote}{\fnsymbol{footnote}}
	\phantomsection
	\pagestyle{ijsrachapter}
	\chapter*{\maintitle}
	% \vspace*{2em}
%   {\LARGE\sffamily\maintitle}\\[-.3em]
 \ifbool{issue}{%
% \pdfbookmark[1]{\shortauthor | \shorttitle}{\shortauthor}
 \addcontentsline{toc}{chapter}{\normalfont\shortauthor\protect\newline\emph{\maintitletoc}}}{}
 \begin{center}
	{\Large\scshape%
	\authorone\ifdef{\bioone}{{\footnote[1]{\bioone}}}{}%
	\ifdef{\authortwo}{, \authortwo\ifdef{\biotwo}{{\footnote[2]{\biotwo}}}{}}{}%
	\ifdef{\authorthree}{, \authorthree\ifdef{\biothree}{{\footnote[3]{\biothree}}}{}}{}%
	\ifdef{\authorfour}{, \authorfour\ifdef{\biofour}{{\footnote[4]{\biofour}}}{}}{}%
	\ifdef{\authorfive}{, \authorfive\ifdef{\biofive}{{\footnote[5]{\biofive}}}{}}{}%
    }%
	\\[1em]
	\email
	\ifdef{\affilone}{\\ \textsuperscript{\ifdef{\affiloneauthor}{$\affiloneauthor$}{}}\affilone}{}%
	\ifdef{\affiltwo}{\\ \ifdef{\affiltwoauthor}{\textsuperscript{$\affiltwoauthor$}}{}\affiltwo}{}%
	\ifdef{\affilthree}{\\ \ifdef{\affilthreeauthor}{\textsuperscript{$\affilthreeauthor$}}{}\affilthree}{}%	
	\ifdef{\affilfour}{\\ \ifdef{\affilfourauthor}{\textsuperscript{$\affilfourauthor$}}{}\affilfour}{}%
	\ifdef{\affilfive}{\\ \ifdef{\affilfiveauthor}{\textsuperscript{$\affilfiveauthor$}}{}\affilfive}{}%
\end{center}
	\vspace{3em}
	\pagestyle{scrheadings}	
	\setcounter{footnote}{0}
	\renewcommand*{\thefootnote}{\arabic{footnote}}
	\label{firstpage\IJSRAidentifier}

\ifdef\abstract{%
\begin{IJSRAabstract}
\abstract
\end{IJSRAabstract}
}{}
}

	
\providecommand\IJSRAclosing{%
\ifbool{nobib}{}{\IJSRAseparator\vspace*{-3em}
	\printbibliography[heading=subbibliography]}
	\end{refsection}
	\label{lastpage\IJSRAidentifier}
\undef\authorone{}
\undef\authortwo{}
\undef\authorthree{}
\undef\authorfour{}
\undef\authorfive{}

\undef\affilone{}
\undef\affiltwo{}
\undef\affilthree{}
\undef\affilfour{}
\undef\affilfive{}

\undef\affiloneauthor{}
\undef\affiltwoauthor{}
\undef\affilthreeauthor{}
\undef\affilfourauthor{}
\undef\affilfiveauthor{}

\undef\abstract{}

\def\submission{}
\def\acceptance{}

\undef\bioone{}
\undef\biotwo{}
\undef\biothree{}
\undef\biofour{}
\undef\biofive{}
\ifbool{issue}{}{\end{document}}}

\def\Put(#1,#2)#3{\makebox(0,0){\put(#1,#2){#3}}}

\def\IJSRAtitlepage{%
\pdfbookmark[1]{Titlepage}{title}
\definecolor{mybluetitle}{RGB}{28,40,65} % HEX 1c2841
\newgeometry{%
	head=0cm,			% 	- no header
	foot =0cm,
	bindingoffset=0cm,			% 	- binding correction
	top=0cm,						% 	- total body: top margin
	left=0cm,						% 	- total body: left margin (odd pages)
	right=0cm,					% 	- total body: right margin (odd pages)
	bottom=0cm,					% 	- total body: bottom margin
	marginparwidth=0cm,			% 	- width for side note
}
\thispagestyle{empty}
\pagecolor{mybluetitle}
\Put(0,-.85\textheight+5.3cm){\IJSRAtitlefigure}\\
\Put(0,-.85\textheight+6cm){\color{mygold}\rule{1.5\linewidth}{5pt}}
\Put(.5\linewidth-3.5cm,-.85\textheight){\includegraphics[width=7cm]{ijsra_logo.png}}\\

\vspace{.6\linewidth}
\begin{center}\color{white}
\fontsize{40}{40}\selectfont
International Journal of \\ 
Student Research in \\ 
Archaeology

\vfill
\fontsize{15}{15}\selectfont
ISSN: 2398-2012\\
Issue \IJSRAnumber\,|\,\IJSRAmonth\ \IJSRAyear

\vspace{2em}
{ijsra.org}
\end{center}
\clearpage\restoregeometry\pagecolor{white}}


 \DeclareCaptionFormat{listing}{#1#2#3}
 \captionsetup[lstlisting]{format=listing,%
 			 singlelinecheck=false, 
 			 margin=0pt, 
 			 font={sf},
 			 size=footnotesize}
 


\renewcommand{\lstlistingname}{Example}%rename caption
\renewcommand{\lstlistlistingname}{List of examples}%rename caption


\lstdefinestyle{code}{%
	language=[LaTeX]TeX,
    backgroundcolor=\color{backcolour},   
    commentstyle=\color{codegreen},
    keywordstyle=\color{codeblue},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    escapeinside={*@}{@*},          % if you want to add LaTeX within your code
    texcsstyle=*\color{codeblue},
    morekeywords={cites, parencites, parencite, textcite, textcites, citeauthor, citetitle,@String,
    						@Article, @Book,@Collection,@Proceedings,@Reference,@Thesis,
    						@Inproceedings,@Talk,@Review,@Inreference,@Incollection,
    						},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,   
    numberbychapter=false,   
    captionpos=b,                    
    keepspaces=true,               
	%framexleftmargin=5mm, 
	%frame=shadowbox,
	rulesepcolor=\color{codeblue},
    numbers=left,                    
    numbersep=5pt,            
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2,
    literate=
            *{\{}{{{\color{codegreen}{\{}}}}{1}
            {\}}{{{\color{codegreen}{\}}}}}{1}
            {[}{{{\color{codegreen}{[}}}}{1}
            {]}{{{\color{codegreen}{]}}}}{1},
}


\lstset{style=code}
%\lstMakeShortInline[style=code]|
%


%------------------------------------

\RequirePackage{hyperref} % For hyperlinks in the PDF
\hypersetup{					% setup the hyperref-package options
	unicode,
	colorlinks   = true, %Colours links instead of ugly boxes
	urlcolor     =  myblue, %Colour for external hyperlinks
	linkcolor    = myblue, %Colour of internal links
	citecolor   = mygold, %Colour of citations
	linktoc=page,
	pdfborder={0 0 0},			% 	-
	breaklinks=true,			% 	- allow line break inside links
	% bookmarksnumbered=true,		%
	 bookmarksopenlevel=2,
	% bookmarksopen=false,		%
	% bookmarks=true,
	final=true	% = true, only with web-Documents!!
}
\RequirePackage{bookmark}
\RequirePackage{cleveref}


\endinput