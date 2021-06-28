%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  This file provides the asmejour class for formatting papers in a layout similar to 
%%  ASME Journal papers.
%%
%%  The asmejour.cls file should be used with the files asmejour.bst (for citations) and asmejour-template.tex.
%%
%%
%%  This file is version 1.11 dated 2020/02/29.
		\def\versionno{1.11}
		\def\versiondate{2020/02/29\space}
%%
%%  Author: John H. Lienhard V
%%          Department of Mechanical Engineering
%%          Massachusetts Institute of Technology
%%          Cambridge, MA 02139-4307 USA
%%
%%  This class is compatible with either pdfLaTeX or LuaLaTeX. The class calls a number of packages,
%%  many of which are part of the standard LaTeX distribution, and all of which are in TeXLive and
%%  CTAN (https://ctan.org/). 
%%
%%  The Times/Helvetica style fonts are from Michael Sharpe's excellent newtxtext and newtxmath packages.
%%  This class is not designed for unicode-math or fontspec.
%%
%%  Options for the class are described on lines 63-173. 
%%
%%  The class defines an environment for nomenclature. LaTeX must be run twice to align those columns.
%% 
%%  The title block is set by a specific group of commands which are described in the asmejour-template.tex file.
%% 
%%  The \section[]{} command's optional argument is changed to provide pdf bookmarks when necessary.
%%
 %=========================================================
%%
%% LICENSE:
%%
%% Copyright (c) 2020 John H. Lienhard
%%
%% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and 
%% associated documentation files (the "Software"), to deal in the Software without restriction, 
%% including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
%% and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, 
%% subject to the following conditions:
%%
%% The above copyright notice and this permission notice shall be included in all copies or 
%% substantial portions of the Software.
%%
%% The software is provided "as is", without warranty of any kind, express or implied, including but 
%% not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. 
%% in no event shall the authors or copyright holders be liable for any claim, damages or other liability, 
%% whether in an action of contract, tort or otherwise, arising from, out of or in connection with the 
%% software or the use or other dealings in the software.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{asmejour}[\versiondate asmejour paper format]

\LoadClass[twoside,9pt,twocolumn]{extarticle}

%%%%%%%%%%%%%% Options for the class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{ifthen}

\newboolean{DefaultSups}
\setboolean{DefaultSups}{true}

\newboolean{lineno}
\setboolean{lineno}{false}

\newboolean{balance}
\setboolean{balance}{false}

\newboolean{lists}
\setboolean{lists}{true}

\RequirePackage{kvoptions}
%\RequirePackage{kvsetkeys} %<== this package is called by kvoptions
\SetupKeyvalOptions{
  family=asmejour,
  prefix=asmejour@,
  setkeys=\kvsetkeys,
}

%%% for mathalfa, so we may pass options in this format:  mathalfa=cal=euler, mathalfa=frak=boondox
\define@key{asmejour}{mathalfa}{%
      \PassOptionsToPackage{#1}{mathalfa}%
}

%%% set key [nodefaultsups] to obtain newtx superiors font for footnotes.
\define@key{asmejour}{nodefaultsups}[false]{%
      \setboolean{DefaultSups}{#1}
}

%%% set barcolor= to a value defined by xcolor package
\newcommand\@ColorName{black} % default
\define@key{asmejour}{barcolor}[Red4]{%
      \renewcommand\@ColorName{#1}
}

%%% set key [lineno] to obtain linenumbers.
\define@key{asmejour}{lineno}[true]{%
      \setboolean{lineno}{#1}
}

%%% set key [balance] to activate final column balancing.
\define@key{asmejour}{balance}[true]{%
      \setboolean{balance}{#1}
}

%%% set key [lang,lang-second,lang-third] to pass languages to babel.

%% In case language options are dropped during editing, include this. Subsequent choice of lang= will override it.
\PassOptionsToPackage{english}{babel}

\define@key{asmejour}{lang}[english]{%
      \PassOptionsToPackage{main=#1}{babel}%
}
\define@key{asmejour}{lang-second}[english]{%
      \PassOptionsToPackage{#1}{babel}%
}
\define@key{asmejour}{lang-third}[english]{%
      \PassOptionsToPackage{#1}{babel}%
}

%%% set key [nolists] to suppress lists of figures and tables
\define@key{asmejour}{nolists}[false]{%
      \setboolean{lists}{#1}
}

\ProcessKeyvalOptions*

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% option to omit ASME footer
\DeclareOption{nofoot}{%
   \AtBeginDocument{\pagestyle{plain}%
     \fancypagestyle{title}{%
     \fancyhf{}
     \fancyfoot[CE,CO]{\thepage}
     }
   }
}

%% option to omit ASME copyright
\DeclareOption{nocopyright}{%
   \AtBeginDocument{\fancypagestyle{title}{%
      \fancyhf{}
      \fancyfoot[RO]{\large\sffamily \@PreprintStringR\space\space\bfseries/\space\space\@PaperNumber\thepage} 
      \fancyfoot[LO]{\large\bfseries\sffamily Journal of \@JourName} 
      \fancyfoot[CO]{}
      }
    }   
}

%% Access many options from newtxmath. See newtxmath documentation for details.
\DeclareOption{upint,smallerops,varvw,varg,slantedGreek,frenchmath,varbb,cmbraces}{\PassOptionsToPackage{}{newtxmath}}

%% Option for slightly larger small capitals font [largesc] or to loosen word spacing [looser]
\DeclareOption{largesc}{\PassOptionsToPackage{}{newtxtext}}

%% ASME word separation is greater than newtxtext defaults so change these parameters.
\PassOptionsToPackage{spacing=0.3em, stretch=0.18em, shrink=0.08em}{newtxtext}

%% Option not to use latex default superscripts, instead using the newtxtext superiors font [nodefaultsups]
\ifthenelse{\boolean{DefaultSups}}{\PassOptionsToPackage{defaultsups}{newtxtext}}{\relax}

%% Option to hyphenate the typewriter font [hyphenate]
\DeclareOption{hyphenate}{%
	\PassOptionsToPackage{hyphenate}{inconsolata}%
	\ClassWarningNoLine{asmejour}{Allowing hyphenation of typewriter font}%
}

%% Suppress warnings about mathalfa keys as unused global options
\DeclareOption*{}

\ProcessOptions \relax

%%%%%%%%%%%%% end options %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[paperheight=285.7mm, paperwidth=215.900mm, left=21.100mm, right=21.100mm, top=15.9mm, bottom = 24mm, footskip=8mm]{geometry}
\setlength\columnsep{4.5mm}
\setlength\parindent{3.5mm}
% ASME's pdf pages are 11.25 in. tall, not 11.00 in.

\RequirePackage[sort&compress,numbers]{natbib} 
\setlength\bibsep{0pt plus 1pt minus 0pt} % ASME keeps this tight
\renewcommand*{\bibfont}{\footnotesize}

\RequirePackage{graphicx} 
\RequirePackage[hyperref,fixpdftex,dvipsnames,svgnames,x11names]{xcolor}
\RequirePackage{xparse} 
\RequirePackage{metalogo,hologo} % Access various LaTeX logos if needed

%%%%%%%%%%%%%%%%  Table related   %%%%%%%%

\RequirePackage{array} 

\RequirePackage{dcolumn} %% alignment on decimal places
\newcolumntype{d}[1]{D{.}{.}{#1}}

%% make \hline in tables heavier than default 0.4pt
\setlength\arrayrulewidth{.5\p@}

\RequirePackage{booktabs}
\renewcommand*{\toprule}{\specialrule{0.5pt}{0pt}{\doublerulesep}\specialrule{0.5pt}{0pt}{3pt}}
\renewcommand*{\midrule}{\specialrule{0.5pt}{2pt}{3pt}}
\renewcommand*{\bottomrule}{\specialrule{0.5pt}{1pt}{\doublerulesep}\specialrule{0.5pt}{0pt}{0pt}}

%%%%%%%%  FONT related  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[T1]{fontenc}

\RequirePackage{iftex} % check whether pdftex or another engine is used
\ifpdftex
  \pdfminorversion=7 % This selection is not required.
  \RequirePackage[utf8]{inputenc} % for backward compatibility with pre-2018 distributions
\else
  \relax
\fi

\RequirePackage{mathtools} % extends amsmath
\RequirePackage[]{babel}
\RequirePackage[]{newtxtext} 
\RequirePackage[varqu,varl]{inconsolata} % sans typewriter font
\RequirePackage[]{newtxmath}

%% override \textsu if using default superiors
\ifthenelse{\boolean{DefaultSups}}{\let\textsu\textsuperscript}{\relax}
  
\RequirePackage[]{mathalfa} % load optional fonts for Calligraphy, Script, etc. 

\RequirePackage{bm} % load after all math to give access to bold math

%% In addition to the word spacing options declared in line 163...
%% Relative to size9.clo: leading reduced to 10 pt; displayskips made greater
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@ixpt{10\p@}%               % <== was \@xipt
   \abovedisplayskip 10\p@ \@plus5\p@ \@minus4\p@%      % <== was 8\p@ 4,4...
   \abovedisplayshortskip 3\p@ \@plus1\p@ \@minus1\p@%  % <== was \z@ \@plus3\p@ (3pt stretch)
   \belowdisplayshortskip 10\p@ \@plus5\p@ \@minus4\p@% % <== was 5\p@ 3, 3
   \belowdisplayskip \abovedisplayskip%
   \let\@listi\@listI}
\normalsize

% The article class calls \sloppy in two-column mode (\tolerance 9999, \emergencystretch 3em)
% These adjustments affect line breaking; the values below are intended to produce
% fewer lines with large spaces, without creating the problems of using \fussy in two-column mode.
\tolerance 2500
\emergencystretch 3em 


\setlength{\jot}{10pt} %<== default is 3pt

\allowdisplaybreaks % ASME allows these breaks


%% This provides sans serif italic and sans serif bold italic math.
%% It's intended only for use in the figure and table captions.
%% Fonts are from newtxsf package.
\DeclareMathVersion{sansbold}
\SetMathAlphabet{\mathsf}{sansbold}{\encodingdefault}{\sfdefault}{b}{n}
\SetSymbolFont{letters}{sansbold}{OML}{ntxsfmi}{b}{it}
\SetSymbolFont{lettersA}{sansbold}{U}{ntxsfmia}{b}{it}
\SetSymbolFont{symbols}{sansbold}{LMS}{ntxsy}{b}{n}
\SetSymbolFont{operators}{sansbold}{\encodingdefault}{\sfdefault}{\bfdefault}{n}

%% Text Gyre Heros Condensed is qhvc (regular is qhv). 
\newcommand*{\CondSans}{\selectfont\fontfamily{qhvc}\selectfont} 
\renewcommand\huge{\@setfontsize\huge{14}{14}}        %... for author names only
\newcommand*{\CondSansBold}{\renewcommand\bfdefault{b}\selectfont\fontfamily{qhvc}\selectfont\bfseries} 
\renewcommand\Huge{\@setfontsize\Huge{26.5}{26.5}}    %... for title font only

\addto{\captionsenglish}{%
  \renewcommand{\figurename}{Fig.}  
  \renewcommand{\tablename}{Table}  
}
  \providecommand{\nomname}{Nomenclature}  
  \providecommand{\keywordname}{Keywords}
  \providecommand{\appendicesname}{Appendices}
  \providecommand{\CAwords}{Corresponding Author}

%%%%%%%%%%%%%%%%%  EQUATION AND LINE NUMBERING  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ASME puts equation tags in blue
\RequirePackage{etoolbox} % dropped xpatch 28/02/20
\patchcmd{\tagform@}{(\ignorespaces#1\unskip\@@italiccorr)}{\color{blue}(\ignorespaces#1\unskip\@@italiccorr)}{}{}

%% Ensure that the current font is used for equation tags, not \normalfont as set by amsmath
\def\maketag@@@#1{\hbox{\m@th#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifthenelse{\boolean{lineno}}{%
    \RequirePackage[switch,mathlines]{lineno}    
    \renewcommand{\linenumberfont}{\normalfont\footnotesize\color{red}} 
    \AtBeginDocument{\linenumbers}
    \ClassWarningNoLine{asmejour}{Package lineno loaded, so final column balancing is disabled}
%%% Allow line numbering in AMS math environments.
%%% postdisplaypenalty adjusted to avoid extra line number at end, see discussion here: https://tex.stackexchange.com/a/461192/ 
%%% multline has some problem that puts an extra line number above it.
%%% Requires xparse and etoolbox
\NewDocumentCommand{\losepostpenalty}{}{\patchcmd{\linenomathWithnumbers}{\advance\postdisplaypenalty\linenopenalty}{}{}{}}

\NewDocumentCommand{\FixAMSMath}{m}{%
	\AtBeginEnvironment{#1}{\losepostpenalty\linenomath}%
	\AtEndEnvironment{#1}{\endlinenomath}%
	\AtBeginEnvironment{#1*}{\losepostpenalty\linenomath}%
	\AtEndEnvironment{#1*}{\endlinenomath}%
}

\NewDocumentCommand{\FixAll}{>{\SplitList{;}}m}{\ProcessList{#1}{\FixAMSMath}}
\FixAll{align;alignat;gather;flalign;multline}

    }{%
    \ProvideDocumentEnvironment{linenomath}{}{}{}
    \ifthenelse{\boolean{balance}}{% balancing through flushend can produce weird errors
    \RequirePackage{flushend}      % flushend package is NOT compatible with lineno
    \AtEndDocument{\flushcolsend} 
    }{\relax}
}
\providecommand{\@LN@col}[1]{\relax}
\providecommand{\@LN}[2]{\relax}
%% ASME page proofs seem to align the number at top of the line, rather than bottom as done here.


%%%%%%%%%%%%%%%%%  FOOTER SET UP  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%  footer text names  %%%%%%%%%%%%%%%

\newcommand{\JourName}[1]{\gdef\@JourName{#1}}
\providecommand\@JourName{\hbox{ }}

\DeclareDocumentCommand{\PaperYear}{G{\the\year}}{%
      \gdef\@PaperYear{#1}%
      }
\providecommand\@PaperYear{\the\year}

\def\@PreprintStringL{PREPRINT FOR REVIEW}
\def\@PreprintStringR{PREPRINT FOR REVIEW}

\NewDocumentCommand{\PreprintString}{m o}{%
    \IfNoValueTF{#2}{%
		\gdef\@PreprintStringL{#1}%
		\gdef\@PreprintStringR{#1}%
	}{%
	\ifx R#2{\gdef\@PreprintStringR{#1}}\else\relax\fi
	\ifx L#2{\gdef\@PreprintStringL{#1}}\else\relax\fi
	}
}

\newcommand{\PaperNumber}[1]{\gdef\@PaperNumber{#1-}}
\providecommand\@PaperNumber{\relax}

%%%%%%

\RequirePackage{fancyhdr}
\pagestyle{fancy}

\fancyhf{} % clear all header and footer fields
\renewcommand{\headrulewidth}{0pt} 
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[RE]{\large\bfseries\sffamily Transactions of the ASME} 
\fancyfoot[LO]{\large\bfseries\sffamily Journal of \@JourName} 
\fancyfoot[RO]{\large\sffamily \@PreprintStringR\space\space\bfseries/\space\space\@PaperNumber\thepage}
\fancyfoot[LE]{\large\sffamily {\bfseries \@PaperNumber\thepage\space\space/}\space\space\@PreprintStringL\ }


\fancypagestyle{title}{%
\fancyhf{} % clear all header and footer fields
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[RO]{\large\sffamily \@PreprintStringR\space\space\bfseries/\space\space\@PaperNumber\thepage} 
\fancyfoot[LO]{\large\bfseries\sffamily Journal of \@JourName} 
\fancyfoot[CO]{\large\bfseries\sffamily Copyright \textcopyright\ \@PaperYear\ by ASME}
}


%%%%%% Footnotes %%%%%%%

\RequirePackage{fnpos}
\makeFNbottom
\makeFNbelow

\setlength{\skip\footins}{12pt plus 2pt minus 1pt}

\renewcommand{\footnoterule}{%
  \kern -3pt
  \hrule width 0.5in height 0.5pt
  \kern 2pt
}

%% reduce indentation of footnotes
\renewcommand\@makefntext[1]{%
  \noindent\makebox[4mm][r]{\@makefnmark}\hyphenpenalty=300\exhyphenpenalty=300 #1} %<== suppress hyphenation
  
%% Produces an unmarked footnote about the revision date. 
%% This command is invoked by \date as part of \MakeTitlePage below.
%% Text can be anything given as the argument to \date{..}.
\NewDocumentCommand{\revfootnote}{m}{\begin{NoHyper}\gdef\@thefnmark{}\@footnotetext{#1}\end{NoHyper}} 

% Previous is modified to eliminate missing anchor warning from hyperref that following would cause
%\def\revfootnote{\gdef\@thefnmark{}\@footnotetext}


%% include a comma for sequential footnotes
\newcommand\nextToken\relax

\let\oldfootnote\footnote
\renewcommand\footnote[1]{%
    \oldfootnote{#1}\futurelet\nextToken\isOtherfnote}
    
\newcommand\isOtherfnote{%
    \ifx\footnote\nextToken\textsu{\mdseries,}%
    \fi%
}


%%%%%%%%%  CAPTION RELATED  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[labelfont={sf,bf},hypcap=false]{caption}
\RequirePackage[hypcap=false,list=true]{subcaption}

\DeclareCaptionTextFormat{boldmath}{\mathversion{sansbold}#1}

\captionsetup[figure]{labelfont={sf,bf},textfont={sf,bf},textformat=boldmath,labelsep=quad}
\captionsetup[table]{labelfont={sf,bf},textfont={sf,bf},textformat=boldmath,labelsep=quad,skip=0.5\baselineskip} 


%%%%%%%%%%%%  SECTION HEADINGS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% wish to accommodate hyperref

\RequirePackage[raggedright,indentafter]{titlesec}

\titleformat{\section}{\mathversion{bold}\bfseries\large\raggedright}{\thesection}{1em}{}
\titleformat{\subsection}[runin]{\mathversion{bold}\bfseries}{\thesubsection}{1em}{}[.]
\titleformat{\subsubsection}[runin]{\itshape}{\thesubsubsection}{1em}{}[.]

\titlespacing\section{0pt}{14pt plus 3pt minus 2pt}{3pt plus 2pt minus 1pt} 
\titlespacing{\subsection}{\parindent}{12pt plus 3pt minus 2pt}{0.5em}
\titlespacing{\subsubsection}{\parindent}{12pt plus 3pt minus 2pt}{0.5em}

%% ASME style does not seem to go lower than third level heading, so ...
%% ....putting \paragraph into \subsubsection settings.
\titleformat{\paragraph}[runin]{\itshape}{\thesubsubsection}{0.5em}{}[.]
\titlespacing{\paragraph}{\parindent}{14pt plus 3pt minus 2pt}{0.5em}

%%  Special handling of the appendices            
%%  Assumes that appendices are the last technical content in paper 
\RenewDocumentCommand{\appendix}{}{%
    \pdfbookmark[1]{\appendicesname}{appendices}
    \setcounter{section}{0}
    \renewcommand\thesection{\Alph{section}}
    \setcounter{equation}{0}
    \renewcommand\theequation{\Alph{section}\arabic{equation}}
    \titleformat{\section}[block]{\mathversion{bold}\bfseries\large\raggedright}{\appendixname\ \thesection:}{0.5em}{}[\setcounter{equation}{0}]
}

% natbib's \bibsection controls section heading for References.


%%%%%%%%%%%%%%%%%  List environments  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{enumitem}

\setlist[enumerate,1]{label = (\arabic*), ref = (\arabic*),labelindent=3mm, leftmargin=*,noitemsep}
%% I have no examples of sublists...

%%%%%%%%%%%%%%%%%  Hyperref  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{hyperxmp} %% to fix transfer of metadata to Acrobat pdf 

\RequirePackage[%
    unicode,        % Unicode encoded PDF strings
    psdextra,       % additional support for math in pdf bookmarks
	pdfborder={0 0 0},% 
	bookmarks=true, %
	bookmarksnumbered=true,%
	bookmarksopen=true,%
	bookmarksopenlevel=1,%
	colorlinks=true,%
	linkcolor=blue, %
	citecolor=blue, % 
	urlcolor=blue,  % 
	breaklinks=true,%
	pdftitle={},    % <=== add in .tex file
	pdfkeywords={}, % <=== add in .tex file
	pdfnewwindow=true,%
	pdfpagelayout=TwoPageRight,%
	pdfauthor={},   % <=== add in .tex file
	pdfdisplaydoctitle=true%
	]{hyperref}
	
\urlstyle{same} % don't switch to typewriter font

\RequirePackage{doi}           % supports nasty characters in some doi's
\renewcommand{\doitext}{doi:~} % change the default, {doi:}, to this for ASME specification


%% Since \bm is useful in headings, this fix will reduce frequency with which
%% alternate pdfstrings must be given in section command as \section[pdfstring]{texstring}
\pdfstringdefDisableCommands{%
    \def\bm#1#{\relax}%
}

%% Let's disable \( and \) in pdf bookmarks, 28/2/20
\pdfstringdefDisableCommands{%
    \def\({\relax}%
    \def\){\relax}%
}

%% Let's just remove citations from pdf bookmarks
\pdfstringdefDisableCommands{%
    \def\cite{\@gobble}%
}

%% Ensure that tag color does not follow \eqref into bookmarks, 28/2/20
\pdfstringdefDisableCommands{%
    \def\eqref#1{(\ref{#1})}%
}

%% Let's make sure footnotes in section headings don't break pdf bookmarks.
\robustify{\footnote}
\pdfstringdefDisableCommands{%
    \def\footnote#1{}%
}

%%% Create an optional argument for unnumbered sections and set pdf bookmark (thru \addcontentsline).
%%% The optional argument will manually set the pdf bookmark for that section; can be used to avoid hyperref 
%%%     errors when macros are in section titles.
%%% There should not be errors for $$, \cite, \ref, \label, \footnote, or \bm with current construction.
\let\svsection\section
\RenewDocumentCommand{\section}{s o m}{%
	    \IfBooleanTF {#1}
		{\svsection*{#3}\phantomsection%
					{\IfNoValueTF {#2}
					{\addcontentsline{toc}{section}{#3}}
					{\addcontentsline{toc}{section}{#2}}% remove trailing space 28/2/20
					}%
		}
		{\IfNoValueTF {#2}
			{\svsection{#3}}
			{\svsection[#2]{#3}}%
		}%
}


%%%%%%%%%%%%%  define Nomenclature environment  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Nomenclature environment in ASME Journal Style
%% Run twice to get proper label width.
%% Set first optional argument (a dimension) to override automatic label width (e.g., if one label is excessive)
%% Second argument can be used to rename the section, e.g., to List of Symbols.
%%

\newlength\widest
\newlength\@widest
\newlength\nomenwidth
\newlength\savitemsep

%% If the second argument of \entry is omitted, a bold section heading is produced, e.g. \entry{Greek Letters}
\DeclareDocumentCommand{\entry}{m g}{%
 \IfNoValueTF{#2}{%
             \itemsep12\p@ plus 4\p@ minus 4\p@% \bigskip
             \goodbreak\item[\bfseries#1\hfill]\itemsep3\p@ plus 1\p@ minus 1\p@\@itempenalty=1000%
			 }{%
             \item[\hfill#1${} = {}$]#2%
			 \@itempenalty=-\@lowpenalty%
             \setlength\itemsep\savitemsep%
             \settowidth\@widest{#1${} = {}$}%
             \ifdim\@widest>\widest \global\setlength\widest\@widest\fi%
             }
}

\RequirePackage{totcount}
\newtotcounter{savedlength}
% a total counter for saving the value of \nomenwidth

\AtBeginDocument{\setlength{\nomenwidth}{\totvalue{savedlength}sp}}
% value is the length in scaled points (sp)

\DeclareDocumentEnvironment{nomenclature}{O{\nomenwidth} O{\nomname}}{%
       \setlength{\widest}{0em}
        \section*{#2}
        \raggedright
        \begin{list}{}{%
             \setlength{\topsep}{0pt}
             \setlength{\partopsep}{0pt}
             \setlength{\itemsep}{0pt}
             \setlength{\parsep}{\itemsep}
             \setlength{\labelsep}{0em}
             \setlength{\labelwidth}{#1}
             \setlength{\leftmargin}{\labelwidth}
             \addtolength{\leftmargin}{\labelsep}
			 \setlength\savitemsep\itemsep
         }%
   }{%
   \setcounter{savedlength}{\widest}%
   \end{list}%
} 
       
%%%%%%%%%%%%%%%% List of figures and list of tables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifthenelse{\boolean{lists}}{% ASME requires these lists for production. 
    \AtEndDocument{%
	    \clearpage
		\twocolumn[%
		\begin{@twocolumnfalse}
			\listoffigures
			\listoftables
		\end{@twocolumnfalse} 
		]%
    }
    }{%
    \ClassWarningNoLine{asmejour}{Omitting lists of figures and tables}%
}

%%%%%%%%%%%%%%%%  Author/Title/Abstract block  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\papertitle}[1]{\gdef\@papertitle{#1}}
\providecommand\@papertitle{\hbox{ }}

\newcommand{\PaperTitle}{%
\par\vspace*{6mm}%
\parbox{\linewidth}{\centering{\bfseries\Large%
\MakeTextUppercase{\@papertitle}%
\thispagestyle{title}\par}  %% <=== \par gets the font leading to stick.
     }%
}

%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xcoffins}

\NewCoffin{\authorblock}
\NewCoffin{\ruleblock}
\NewCoffin{\Abstract}
\NewCoffin{\Title}

\NewCoffin{\firstrowauthorblock}
\SetHorizontalCoffin\firstrowauthorblock{}

\newlength{\coffinsep} %%% space between coffins
\setlength{\coffinsep}{4.5mm}

\newcounter{authorno}
\setcounter{authorno}{0}

%%%%%%

\newlength{\rulecofheight}
\newlength{\Titleheight}

\DeclareDocumentCommand\SetAuthorBlock{m m}{%
   \addtocounter{authorno}{1}%
   \SetVerticalCoffin{\authorblock}{48.2mm}{%
   \raggedleft\sffamily%
   {\huge\CondSansBold\ignorespaces#1\ignorespaces}\\
   \CondSans#2%
}
\ifnum\value{authorno}=1
    \JoinCoffins\firstrowauthorblock\authorblock
     \setlength{\rulecofheight}{\CoffinTotalHeight\firstrowauthorblock} 
  \else
    \JoinCoffins\firstrowauthorblock[hc,b]\authorblock[hc,t](0pt,-\coffinsep)
     \setlength{\rulecofheight}{\CoffinTotalHeight\firstrowauthorblock}
\fi     
}


\DeclareDocumentCommand\SetTitle{m}{%
   \SetVerticalCoffin{\Title}{114mm}{%
   \vspace*{0.5mm}% <== ASME doesn't align bar and text
   \noindent\Huge\CondSansBold\raggedright%
   #1%
   \par
   }
}

\providecommand{\@keywords}{\relax}
\DeclareDocumentCommand{\keywords}{g}{%
 \IfNoValueTF{#1}{%
             \relax}{%
             \long\def\@keywords{\par\vskip\baselineskip\noindent{\keywordname:} #1}%
             }
}

\DeclareDocumentCommand\SetAbstract{m}{%
   \SetVerticalCoffin{\Abstract}{114mm}{%
   \noindent\itshape%
   #1
   \@keywords\par% 
   \vspace*{4mm}% <== at bottom of abstract to extend rule
}
}

\DeclareDocumentCommand{\ConstructAuthorBlock}{}{%
\JoinCoffins\Title[l,b]\Abstract[l,t](0pt,-1.5\coffinsep)
\setlength{\Titleheight}{\CoffinTotalHeight\Title}
\ifdim\Titleheight>\rulecofheight
  \setlength{\rulecofheight}{\Titleheight}
\else
  \addtolength{\rulecofheight}{7.0mm} 
\fi
\SetHorizontalCoffin \ruleblock {\color{\@ColorName}\rule{2.1mm}{\rulecofheight}}
\JoinCoffins\firstrowauthorblock[vc,r]\ruleblock[vc,l](\coffinsep,0pt)
\JoinCoffins\firstrowauthorblock[vc,r]\Title[vc,l](\coffinsep,0pt)
\centerline{\TypesetCoffin\firstrowauthorblock} %% in this instance, \centerline is better than \centering
}   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Corresponding author gets footnote #1 and subsequent notes are 2, 3, ....
%%% ASME apparently does not recognize joint first authors...so I have not coded that functionality

%%%% Flag for corresponding author (just one expected, although this code supports more than one)
%%%% for more than one CA, if including email addresses in the footnote, place them in final the command
\newif\ifCA\CAfalse
\newcommand{\CAemail}[1]{\gdef\@CAemail{#1}}


% Allow for NO email address to be given by omitting second argument
% ASME prefers email to be in address block, not CA footnote, although code can support the latter.
\DeclareDocumentCommand{\CorrespondingAuthor}{g}{%
\global\CAtrue%
 \IfNoValueTF{#1}{%
         \gdef\@CAsep{\relax}%
         \gdef\@CAemail{\relax}%
         }{%
         \gdef\@CAsep{:\space}%
         \gdef\@CAemail{#1}%
         }%
\def\@makefnmark{\hbox{\@textsuperscript{\sffamily\@thefnmark}}}%
\footnotemark%
\addtocounter{footnote}{-1} % in case of more than one CA
}


%%%%%%%%%%

\DeclareDocumentCommand{\MakeTitlePage}{}{%
\thispagestyle{title}%
\twocolumn[
  \begin{@twocolumnfalse}
\ConstructAuthorBlock
  \vspace*{12.5mm}
  \end{@twocolumnfalse} 
]
\ifCA 
 \addtocounter{footnote}{1}
 \footnotetext{\CAwords\@CAsep \@CAemail}
\fi
\ifDate\revfootnote{\@Date} \else\relax \fi
}

%%%%%%%%%%

%% Provide compatibility with titling commands from standard LaTeX article class

\RenewDocumentCommand{\maketitle}{}{\MakeTitlePage}
\RenewDocumentCommand{\title}{}{\SetTitle}

\RenewDocumentEnvironment{abstract}{+b}{\gdef\tmp{\SetAbstract{#1}}\aftergroup\tmp}{} 
%% Thanks to DPC for the suggestion of \gdef\tmp{...

%% Put date as an unnumbered footnote at bottom of first column
\newif\ifDate\Datetrue % If true, print a date.

\ExplSyntaxOn
\RenewDocumentCommand{\date}{m}
  {%
    \tl_if_empty:nTF {#1}{\global\Datefalse}{\gdef\@Date{#1}}%
  }
\providecommand\@Date{\today}
\ExplSyntaxOff

\RenewDocumentCommand{\thanks}{m}{\relax} %% disabling this standard command, as it is inconsistent with the format

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput
%%
%% End of file `asmejour.cls'.

