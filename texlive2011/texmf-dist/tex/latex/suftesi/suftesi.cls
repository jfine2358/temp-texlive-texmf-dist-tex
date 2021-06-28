%%
%% This is file `suftesi.cls',
%%
%%  Copyright (C) 2010 Ivan Valbusa
%% 
%%  This program is provided under the terms of the
%%  LaTeX Project Public License distributed from CTAN
%%  archives in directory macros/latex/base/lppl.txt.
%% 
%%  Author: Ivan Valbusa
%%          ivan dot valbusa at univr dot it
%% 
%%  This work has the LPPL maintenance status "author-maintained".
%% 
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{suftesi}
		[2010/09/17 v. 0.4
		Classe per tesi di laurea e di dottorato delle facolta' umanistiche]
%****************************************
%  declare options
%****************************************
\newif\ifsuftesi@centertitle
\newif\ifsuftesi@sctitles
\newif\ifsuftesi@artemisia 
\newif\ifsuftesi@porson 
\newif\ifsuftesi@defaultfont 
\newif\ifsuftesi@defaultgreek
\newif\ifsuftesi@plain
\newif\ifsuftesi@bozza
\newif\ifsuftesi@nofront
\DeclareOption{centertitle}{\suftesi@centertitletrue}
\DeclareOption{sctitles}{\suftesi@sctitlestrue}
\DeclareOption{disablefront}{\suftesi@nofronttrue}
\DeclareOption{defaultfont}{\suftesi@defaultfonttrue\suftesi@defaultgreektrue}
\DeclareOption{artemisia}{\suftesi@artemisiatrue\suftesi@porsonfalse	\suftesi@defaultgreekfalse} 
\DeclareOption{porson}{\suftesi@porsontrue\suftesi@artemisiafalse
	\suftesi@defaultgreekfalse} 
\DeclareOption{defaultgreek}{\suftesi@defaultgreektrue
	\suftesi@artemisiafalse\suftesi@porsonfalse} 
\DeclareOption{plain}{\suftesi@plaintrue} 
\DeclareOption{bozza}{\suftesi@bozzatrue} 
%****************************************
%  execute and process options
%****************************************
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{artemisia} 
\ProcessOptions
\relax
%****************************************
% load class
%****************************************
\LoadClass[a4paper]{book}
%****************************************
% 		PACKAGES
%****************************************
\RequirePackage{ifxetex,ifluatex,metalogo} %ifpdf
\RequirePackage{microtype}
\RequirePackage{textcase}
\RequirePackage{multicol}
\RequirePackage{emptypage}
\RequirePackage[bottom]{footmisc}
\RequirePackage{mparhack}
\RequirePackage{caption}
	\captionsetup{labelsep=period,font=small}
%	epigraphs
\RequirePackage{epigraph}                       
	\setlength{\beforeepigraphskip}{-3\baselineskip} 
	\setlength{\afterepigraphskip}{2\baselineskip}   
	\setlength{\epigraphrule}{0pt}                
	\renewcommand{\textflush}{flushepinormal}        
	\renewcommand{\sourceflush}{flushepinormal}      
	\renewcommand{\epigraphsize}{\footnotesize}  
\RequirePackage{enumitem}
\setlist{labelsep=0.6em,itemsep=0.2ex,font=\normalfont}
\setdescription{font=\normalfont\sffamily,itemsep=0.2ex}
\setenumerate[1]{leftmargin=0pt,label=\arabic*}
\setenumerate[2]{leftmargin= 1.3em,label=\arabic*}
\setenumerate[3]{leftmargin= 1.3em,label=\arabic*}
\setitemize[1]{leftmargin=0pt}
\setitemize[2]{leftmargin=1.3em}
\setitemize[3]{leftmargin=1.3em}
%%****************************************
%% 		GREEK FONT
%%****************************************
% thanks to Enrico Gregorio
\ifxetex
   \relax
      \else
\RequirePackage[LGR,T1]{fontenc}
\AtBeginDocument{\fontencoding{T1}\selectfont}
\ifsuftesi@defaultfont
  \relax
    \else
\RequirePackage[osf,sc]{mathpazo}
\RequirePackage[scaled=0.8]{beramono}
   \linespread{1.05}
    \renewcommand{\sfdefault}{iwona}
  \fi
\ifsuftesi@artemisia
	\def\suftesi@greekfamily{artemisiaeuler}
    \fi
\ifsuftesi@defaultgreek
	\def\suftesi@greekfamily{cmr}
    \fi
\ifsuftesi@porson
	\sbox\z@{\fontsize{10}{10}\normalfont A} 
	\sbox\tw@{\font\temp=gporsonrg6a at 10pt \temp A} 
	\dimen@= 
	\dimexpr(0.001\dimexpr\numexpr(\dimexpr(1000\ht\z@)/\ht\tw@)\p@) 
	\edef\art@scale{\strip@pt\dimen@} 
	\DeclareFontFamily{LGR}{porson}{} 
	\DeclareFontShape{LGR}{porson}{m}{n}{<-> s * [\art@scale] gporsonrg6a}{} 
	\DeclareFontShape{LGR}{porson}{m}{it}{<-> ssub * porson/m/n}{} 
	\DeclareFontShape{LGR}{porson}{b}{n}{<-> ssub * porson/m/n}{} 
	\DeclareFontShape{LGR}{porson}{b}{it}{<-> ssub * porson/m/n}{} 
	\DeclareFontShape{LGR}{porson}{m}{sl}{<-> ssub * porson/m/n}{} 
	\DeclareFontShape{LGR}{porson}{b}{sl}{<-> ssub * porson/m/n}{} 
	\DeclareFontShape{LGR}{porson}{m}{sc}{<-> ssub * porson/m/n}{} 
	\DeclareFontShape{LGR}{porson}{bx}{n}{<-> ssub * porson/m/n}{} 
	\DeclareFontShape{LGR}{porson}{bx}{it}{<-> ssub * porson/m/n}{} 
	\DeclareFontShape{LGR}{porson}{bx}{sl}{<-> ssub * porson/m/n}{} 
      \def\suftesi@greekfamily{porson}
   \fi
\AtBeginDocument{
  \DeclareRobustCommand{\greektext}{%
    \fontencoding{LGR}\fontfamily{\suftesi@greekfamily}\selectfont
    \def\encodingdefault{LGR}}}
\fi
%****************************************
%		LAYOUT
%****************************************
\RequirePackage{geometry}
\ifcase\@ptsize\relax
	\geometry{%
	  textwidth=312pt,
	  textheight=624pt}\or
	\geometry{%
	  textwidth=324pt,
	  textheight=648pt}\or
	\geometry{%
	  textwidth=336pt,
	  textheight=672pt}
	  \fi
	\geometry{%
	  marginparsep=12pt,
	  includehead,
	  hmarginratio=1:2,
	  vmarginratio=1:2,
	  heightrounded,
	  marginparwidth=82pt,
	  }	  
  \parindent1em
%****************************************
%		TITLES
%****************************************
\RequirePackage{titlesec}
\RequirePackage{titletoc}
    \microtypesetup{expansion=false}%
    \DeclareRobustCommand{\spacedallcaps}[1]%
    {\textls[160]{\MakeTextUppercase{#1}}}%
\titleformat{\part}[display]
	  {\LARGE\filcenter}
	  {\partname~\Roman{part}}
	  {3ex}
	  {\LARGE}
\ifsuftesi@centertitle
	\titleformat{\chapter}[display]
		  {\filcenter}
		  {\LARGE\thechapter}
		  {3ex}
		  {\LARGE\ifsuftesi@sctitles\scshape\else\fi}
    \else
	\titleformat{\chapter}[hang]
		  {\filright}
		  {\LARGE\thechapter.}
		  {3ex}
		  {\LARGE\ifsuftesi@sctitles\scshape\else\fi}
\fi
\titlespacing*{\chapter}{0em}{6ex}{18ex}
\titleformat{\section}[hang]
	  {\raggedright}
	  {\thesection}
	  {.5em}
	  {\ifsuftesi@sctitles\scshape\else\itshape\fi}
\titlespacing*{\section}{0ex}{\baselineskip}{\baselineskip}[0ex]	  
\titleformat{\subsection}[hang]
	  {\raggedright}
	  {\textnormal\thesubsection}
	  {.5em}
	  {\ifsuftesi@sctitles\itshape\else\fi}
\titlespacing*{\subsection}{0ex}{\baselineskip}{\baselineskip}[0ex]
\titleformat{\subsubsection}[hang]
	  {\raggedright}
	  {\textnormal\thesubsubsection}
	  {.5em}
	  {}
\titlespacing*{\subsubsection}{0ex}{\baselineskip}{\baselineskip}[0ex]	  
\titleformat{\paragraph}[runin]
	  {\itshape}
	  {}
	  {}
	  {}
	  [\hspace*{1em}]
\titlespacing*{\paragraph}{\parindent}{.5\baselineskip}{.5\baselineskip}
\titleformat{\subparagraph}[runin]
	  {}
	  {}
	  {}
	  {}
	  [.\hspace*{1em}]
\titlespacing*{\subparagraph}{\parindent}{.5\baselineskip}{.5\baselineskip}
%****************************************
%		TOC, LOF, LOT
%****************************************
% table of contents
\titlecontents{part}                                                  
	[0em]                                                                    
	{\addvspace{3ex}\partname~}                                                 
	{\thecontentslabel\hspace*{1em}}                                                    
	{}                                                                      
	{}
	[\addvspace{1ex}]
\titlecontents{chapter}                                                  
	[0em]                                                                    
	{\addvspace{2ex}}                                                 
	{\thecontentslabel\hspace*{1em}}                                                    
	{}                                                                       
	{\titlerule*{}\contentspage}
	[\addvspace{1ex}]
\titlecontents{section}
	[1.5em]
	{} 
	{\thecontentslabel\hspace*{1em}}
	{} 
	{\titlerule*{}\contentspage}
\titlecontents{subsection}
	[3em]
	{} 
	{\thecontentslabel\hspace*{1em}}
	{} 
	{\titlerule*{}\contentspage}
\titlecontents{subsubsection}
	[4.5em]
	{} 
	{\thecontentslabel\hspace*{1em}}
	{} 
	{\titlerule*{}\contentspage}	
% list of figures
\titlecontents{figure}
	[1.5em]
	{} 
	{\thecontentslabel\hspace*{1em}}
	{} 
	{\titlerule*{}\contentspage}
% list of tables
\titlecontents{table}
	[1.5em]
	{} 
	{\thecontentslabel\hspace*{1em}}
	{} 
	{\titlerule*{}\contentspage}
%  appendix
\newcommand{\appendicesname}[1]{\def\suff@appendices{#1}}
\appendicesname{Appendici}
\def\@appendixpage{%
\titlecontents{chapter}                                                  
	[0em]                                                                    
	{\addvspace{2ex}}                                                 
	{\thecontentslabel\hspace*{1em}}                                                    
	{}                                                                       
	{}
	[\addvspace{1ex}]
\let\contentspage\relax
    \cleardoublepage
       \thispagestyle{empty}
         \addcontentsline{toc}{chapter}{\suff@appendices}
	  \begingroup
	    \centering
	       \null\vfil
		  {\LARGE\suff@appendices\par}
	       \vfil
	\endgroup
    \cleardoublepage
    \titlecontents{chapter}                                                  
	[0em]                                                                    
	{\addvspace{2ex}}                                                 
	{\thecontentslabel\hspace*{1em}}                                                    
	{}                                                                       
	{\titlerule*{}\contentspage}
	[\addvspace{1ex}]}
\renewcommand\appendix{\par
	\@appendixpage
	  \setcounter{chapter}{0}%
	  \setcounter{section}{0}%
	  \gdef\@chapapp{\appendixname}%
	  \gdef\thechapter{\@Alph\c@chapter}%
	  \@mainmattertrue}
%****************************************
% 		HEADINGS
%****************************************
\RequirePackage{fancyhdr}
	\fancypagestyle{plain}{%
	  \fancyhf{}
	  \fancyfoot[C]{}
	  \renewcommand{\headrulewidth}{0pt}
	  \renewcommand{\footrulewidth}{0pt}}	
    \pagestyle{fancy} 
	  \renewcommand{\chaptermark}[1]% 
	  {\markboth{\chaptertitlename~\thechapter}{#1}} 
	  \renewcommand{\sectionmark}[1]{} 
	  \renewcommand{\headrulewidth}{0pt} 
\ifsuftesi@plain
	\fancyhf{} 
	\fancyhead[CO]{\ifsuftesi@sctitles\scshape\else\fi\footnotesize\xheadbreakfalse\nouppercase\rightmark} 
	\fancyhead[CE]{\ifsuftesi@sctitles\scshape\else\fi\footnotesize\xheadbreakfalse\nouppercase\ivanleftmark} 
	\fancyfoot[RE,LO]{\ifsuftesi@bozza \footnotesize Versione del \today\else\fi}
\fancyfoot[C]{\ifsuftesi@sctitles\scshape\else\fi\footnotesize\thepage}
	\def\ivanleftmark{\if@mainmatter\leftmark\else\rightmark\fi} 
\else
    \fancyhf{} 
	\fancyfoot[RE,LO]{\ifsuftesi@bozza \footnotesize Versione del \today\else\fi}
	\fancyhead[LE,RO]{\ifsuftesi@sctitles\scshape\else\fi\footnotesize\thepage} 
\fancyhead[LO]{\ifsuftesi@sctitles\scshape\else\fi\footnotesize\xheadbreakfalse\nouppercase\rightmark}
	\fancyhead[RE]{\ifsuftesi@sctitles\scshape\else\fi\footnotesize\nouppercase\ivanleftmark} 
	\def\ivanleftmark{\if@mainmatter\leftmark\else\rightmark\fi} 
\fi
\renewcommand{\footnoterule}{}
%****************************************
%		TITLE PAGE
%****************************************
\def\suftesi@fronterror{%
	\ClassError{suftesi}{Package 'frontespizio' not loaded.\MessageBreak
		Load the package to get the 'suftesi' title page\MessageBreak
		or set the class option 'disablefront'}
		{Package 'frontespizio' not installed.\MessageBreak
		Install the package to get the suftesi titlepage\MessageBreak
		or set the class option 'disablefront'} \@@end}	
\def\suftesi@logoerror{%
	\ClassError{suftesi}{Missing \protect\Logo!!!\MessageBreak
		Insert \protect\Logo{} to get the 'suftesi' title page\MessageBreak
		or set the class option 'disablefront'}
		{Missing \protect\Logo!!!\MessageBreak
		Insert \protect\Logo{} to get the 'suftesi' title page\MessageBreak
		or set the class option 'disablefront'} \@@end}	
\AtBeginDocument{%
\ifsuftesi@nofront
  \relax
     \else
     \@ifpackageloaded{frontespizio}
     	{}
	{\suftesi@fronterror}
	\front@write{
	\Margini {95pt}{126pt}{140pt}{95pt}
	\usepackage[svgnames]{xcolor}
	\renewcommand{\frontinstitutionfont}{\normalfont}
	\renewcommand{\frontdivisionfont}{\large}
	\renewcommand{\frontpretitlefont}{\normalsize\sffamily}
	\renewcommand{\fronttitlefont}{\huge\sffamily}
	\renewcommand{\frontsubtitlefont}{\normalsize\sffamily}
	\renewcommand{\frontnamesfont}{\normalfont}
	\renewcommand{\frontfixednamesfont}{\normalsize\sffamily}
	\renewcommand{\frontfootfont}{\normalfont}
	\parindent0pt
\makeatletter
     \def\preparefrontpage{%
\titlepage\front@font

\moveright.28\textwidth\vbox to \textheight{

   \moveleft.28\textwidth\hbox to \textwidth{%
   \begin{minipage}{.2\textwidth}
	\if\@front@{logo}
	{\includegraphics[height=\textwidth]{\front@logo}}
	\fi 
	\end{minipage}%
	\hskip.08\textwidth
\begin{minipage}{.72\textwidth}
{\frontinstitutionfont%
				\if\@front@{inst}
				  \front@instit
				\else
				 Universit\`a degli Studi di \front@univ
				\fi\par}

	{\frontdivisionfont
	\if\@front@{multiple}
	  \front@multiple
	\else
	  \if\@front@{division}
	   {\front@division}
	  \else
	   {\front@thefacoldip}
	    di
	   {\front@facoldip}
	  \fi
	\fi\par}

	{\frontinstitutionfont
	\vskip1ex	
	  \hrule	
	\vskip1.2ex
	\if\@front@{school}
	  \front@school
	\else
	  Corso di \front@cl
	\fi
	\par}
	\end{minipage}
	}

	\vspace{\stretch{5}}

% titoletto
\if\@front@{titoletto}

{\frontpretitlefont\front@titoletto\par}
\fi

	\vspace{\stretch{2}}

% titolo e sottotitolo
{\fronttitlefont\color{Maroon}\front@title\par}
\if\@front@{sottotit}
\vspace{4ex}
{\frontsubtitlefont\front@subtitle\par}
\fi

\vspace{\stretch{3}}

% makecandidates
\def\front@makecandidates{%
  \begin{tabular}[t]{@{}l}
  \relax\ifnum\front@candcount<1
    \PackageWarningNoLine{frontespizio}{Missing candidate name}%
  \else
    \frontfixednamesfont
    \ifnum\front@candcount=1
      \front@thecandidate
    \else
      \front@thecandidates
    \fi
    \front@punct\\
    \the\front@candtoks
  \fi
  \end{tabular}
}
\def\front@makeadvisors{%
  \unless\ifdefined\front@noadvisor
    \begin{tabular}[t]{@{}l}
    \relax
    \ifcase\front@relcount
      \PackageWarningNoLine{frontespizio}{Missing advisor name}%
    \or
      \frontfixednamesfont\front@theadvisor\front@punct
    \else
      \frontfixednamesfont\front@theadvisors\front@punct
    \fi
    \the\front@reltoks
    \if\@front@{correl}
      \\[\frontrelcorrelsep]
      \ifcase\front@correlcount\or
        \frontfixednamesfont\front@thecoadvisor\front@punct
      \else
        \frontfixednamesfont\front@thecoadvisors\front@punct
      \fi
    \the\front@correltoks
    \fi
    \end{tabular}
  \fi}
  
  	\vspace{\stretch{1}}

\parindent\z@
\frontnamesfont
\ifdefined\front@swapnames% relatori candidati

     \front@makeadvisors

\vspace{3ex}

     \front@makecandidates

\else% candidati relatori

    \front@makecandidates

\vspace{3ex}

  \front@makeadvisors
 \fi
\par
\vfill

\ifdefined\front@signatures\vskip\frontadjustforsignatures\fi
\unless\ifdefined\front@norules\fi

\vspace{\stretch{5}}

{\frontfootfont%
 \if\@front@{foot}
   \front@foot
 \else
Anno Accademico \front@anno
 \fi
 \par}
}
\endtitlepage}

\makeatother
}
\fi
}
%****************************************
% 		PAGE NUMBERS
%****************************************
\renewcommand\frontmatter{\cleardoublepage\@mainmatterfalse} 
\renewcommand\mainmatter{\cleardoublepage\@mainmattertrue} 
%****************************************
%		FOOTNOTES
%****************************************
\renewcommand\@makefntext{\hskip-2.5em\makebox[2em][r]{\@thefnmark}\hskip.5em}
%****************************************
%		MARGINAL NOTES
%****************************************
% thanks to Lorenzo Pantieri and Enrico Gregorio
\def\graffito@setup{%
   \itshape\footnotesize%
   \parindent=0pt \lineskip=0pt \lineskiplimit=0pt %
   \tolerance=2000 \hyphenpenalty=300 \exhyphenpenalty=300%
   \doublehyphendemerits=100000%
   \finalhyphendemerits=\doublehyphendemerits}
 \DeclareRobustCommand{\marginnote}{}
 \let\marginnote\marginpar
  \DeclareRobustCommand{\graffito}[1]{\marginnote%
 [\graffito@setup\raggedleft\hspace{0pt}{#1}]%
 {\graffito@setup\raggedright\hspace{0pt}{#1}}}
\let\marginpar\graffito
%***************************************
%		COLOPHON
%****************************************
\edef\compilatore{% 
  \ifxetex 
  \noexpand\XeLaTeX 
  \else 
      \ifluatex 
        Lua\noexpand\LaTeX 
      \else 
       \noexpand\LaTeX 
      \fi 
  \fi}
\newcommand{\colophon}[3][]{%
	\thispagestyle{empty}
	\null
	  \vfill
	   \def\next{#2}
	       \ifx\next\@empty\else
	          \noindent Copyright \copyright{} \the\year~#2\\[1ex]
	        Tutti i diritti sono riservati.
	      \fi
	\vfill	
    \section*{Colophon}
	{\small Questo lavoro \`e stato realizzato con \compilatore{}%
	   \def\next{#1}
	      \ifx\next\@empty\else su #1 
	    \fi usando la classe \textsf{suftesi} di 
	    Ivan Valbusa\index{Valbusa, Ivan}. #3\par}}
%****************************************
%		INDEX OF NAMES
%****************************************
\renewenvironment{theindex}
{\renewcommand{\indexname}{Indice dei nomi}
\setlength\columnseprule{0pt}\setlength\columnsep{35pt}%
\cleardoublepage
     \@makeschapterhead{\indexname}%
     \begin{multicols}{2}
    \markboth{\indexname}{\indexname}%
    \raggedright\small
    \setlength\parindent{0pt}%
    \setlength\parskip{0pt plus 0.3pt}%
    \thispagestyle{plain}\let\item\@idxitem}
     {\end{multicols}}
\renewcommand\@idxitem{\par\hangindent 15\p@}
%****************************************
%		BIBLIOGRAPHY
%****************************************
\newenvironment{bibliografia}{%
\chapter{\bibname}%
\normalfont \list{}{%
%\setlength{\labelsep}{0.5em}
\setlength{\itemindent}{-\parindent}
\setlength{\leftmargin}{\parindent}
\setlength{\labelwidth}{\leftmargin}
%\addtolength{\labelwidth}{-\labelsep}
%\setlength{\listparindent}{\parindent}
\setlength{\parsep}{\parskip}
%\setlength{\itemsep}{0em}
\let\makelabel}}{\endlist}
%****************************************
%		SHORTHANDS
%****************************************
\newcommand{\losname}{Sigle}
%	elenchi
\newcommand{\itlabel}[1]{\itshape\hbox to 6em{#1}}
\newenvironment{sigle}{%
	\chapter{\losname}
	\normalfont \list{}{%
	\setlength{\labelsep}{0.5em}
	\setlength{\itemindent}{0pt}
	\setlength{\leftmargin}{6em}
	\setlength{\labelwidth}{\leftmargin}
	%\addtolength{\labelwidth}{-\labelsep}
	\setlength{\listparindent}{\parindent}
	\setlength{\parsep}{\parskip}
	%\setlength{\itemsep}{0em}
	\let\makelabel\itlabel}}{\endlist}
%*************************************************************
% 		ENVIRONMENTS AND COMMANDS
%*************************************************************
% environments
\renewcommand\labelitemii{\normalfont \textendash}
\renewenvironment{quotation}
               {\list{}{\listparindent\parindent%
                        \itemindent    \listparindent
                        \rightmargin   \parindent
                        \leftmargin     \parindent
                        \parsep        \z@ \@plus\p@}%
               \item\relax\footnotesize\noindent\ignorespaces}
               {\endlist}
\renewenvironment{quote}
               {\list{}{\rightmargin \parindent
                         \leftmargin    \parindent}%
                \item\relax\footnotesize}
               {\endlist}
\renewenvironment{verse}
               {\let\\\@centercr
                \list{}{\footnotesize%
                		\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}	
%	commands
\def\chapterintro{
  \@ifstar{\@tempswafalse\@chapterintro}{\@tempswatrue\@chapterintro}}
\def\@chapterintro{\phantomsection
  \if@tempswa\section*{\suffchapterintroname}\fi
  \addcontentsline{toc}{section}{\suffchapterintroname}}
\newcommand{\chapterintroname}[1]{\def\suffchapterintroname{#1}}
\chapterintroname{Introduzione}
\newcommand{\hemph}[1]{\penalty10000\hskip0pt\emph{#1}}
%	spezza nel toc ma non nel testo e testatina
\newif\ifheadbreak\headbreakfalse  
\DeclareRobustCommand{\headbreak}  
{\ifheadbreak\\\else \fi}
\newif\ifxheadbreak\xheadbreaktrue
%	spezza nel testo e testatina ma non nel toc
\DeclareRobustCommand{\xheadbreak} 
{\ifxheadbreak\\\else \fi}
\let\origtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{\begingroup\headbreaktrue\xheadbreakfalse
\origtableofcontents\endgroup}


\frenchspacing
\hfuzz=1pt 



\endinput


