%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  This file provides the asmeconf class for formatting conference papers according to 
%%  ASME conference requirements as represented on ASME's conference web pages in mid-2019.
%%
%%  Please note that ASME's journals follow specifications different from ASME conference papers.
%%
%%  This file is version 1.17 dated 2020/02/29.
	\def\versionno{1.17}
	\def\versiondate{2020/02/29\space}
%%
%%  Author: John H. Lienhard V
%%          Department of Mechanical Engineering
%%          Massachusetts Institute of Technology
%%          Cambridge, MA 02139-4307 USA
%%
%%  This class was designed to approach the following aims:
%%
%%          1. Match ASME's font specifications and layout
%%          2. With the associated amseconf.bst, match ASME's reference formats
%%          3. Maintain hyperref compatibility for pdf bookmarks and hyperlinks
%%          4. Use the newtxtext and newtxmath font packages, including relevant features
%%          5. Provide automatic layout of author names and addresses
%%          6. Support bold face, sans serif math in headings
%%
%%  This class is compatible with either pdfLaTeX or LuaLaTeX. The class uses a number of packages,
%%  many of which are part of the standard LaTeX distribution, and all of which are in TeXLive and
%%  CTAN (https://ctan.org/). 
%%
%%  The Times/Helvetica style fonts are from Michael Sharpe's excellent newtxtext and newtxmath packages; 
%%          version 1.5 or higher of newtxmath is recommended. 
%%
%%  This class is not designed for unicode-math or fontspec, given that the ASME conference style is
%%  specific with respect to the font selections.
%%
%%  Options for the class are configured on lines 79-169. 
%%
%%  The class defines two environments: abstract and nomenclature. The latter has an optional argument to 
%%  control the space between the entries and the definitions.
%%
%%  New commands are described in the asmeconf-template.tex file. The \section[]{} command's optional
%%  argument is changed to better support pdf bookmarks, and \section* is modified similarly.
%%
%%  Commands for entering conference headers and author names are specific to this class.
%%  See asmeconf-template.tex for details.
%%
%%
% =========================================================
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
%% In no event shall the authors or copyright holders be liable for any claim, damages or other liability, 
%% whether in an action of contract, tort or otherwise, arising from, out of or in connection with the 
%% software or the use or other dealings in the software.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{asmeconf}[\versiondate ASME Conference Paper Format (JHL)]

\LoadClass[twoside,twocolumn,10pt]{article}
% Two-sided layout not used in ASME's specs, although that's how the papers are printed


%%%%%%%%%%%%%% Options for the class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{ifthen}
\newboolean{DefaultSups}
\setboolean{DefaultSups}{true}
\newboolean{Oldauthors}
\setboolean{Oldauthors}{false}
\newboolean{Balance}
\setboolean{Balance}{false}
\newboolean{lineno}
\setboolean{lineno}{false}


\RequirePackage{kvoptions}
%\RequirePackage{kvsetkeys} % already loaded by kvoptions
\SetupKeyvalOptions{
  family=asmeconf,
  prefix=asmeconf@,
  setkeys=\kvsetkeys,
}

%%% for mathalfa, we may now pass options in this format:  mathalfa=cal=euler, mathalfa=frak=boondox
\define@key{asmeconf}{mathalfa}{%
  \PassOptionsToPackage{#1}{mathalfa}%
}

%%% set key [nodefaultsups] to obtain newtx superiors font for footnotes.
\define@key{asmeconf}{nodefaultsups}[false]{%
      \setboolean{DefaultSups}{#1}
}

%%% set key [nodefaultsups] to obtain newtx superiors font for footnotes.
\define@key{asmeconf}{nodefaultsups}[false]{%
      \setboolean{DefaultSups}{#1}
}

%%% set key [balance] to balance column height on last page.
\define@key{asmeconf}{balance}[true]{%
      \setboolean{Balance}{#1}
	  \ClassWarningNoLine{asmeconf}{Loading flushend package to balance column height on last page}%
}

%%% set key [lineno] to obtain linenumbers.
\define@key{asmeconf}{lineno}[true]{%
      \setboolean{lineno}{#1}
}

%%% set key [lang,lang-second,lang-third] to pass languages to babel.

%% In case language options are dropped during editing, include this. Subsequent choice of lang= will override it.
\PassOptionsToPackage{english}{babel}

\define@key{asmeconf}{lang}[english]{%
      \PassOptionsToPackage{main=#1}{babel}%
}
\define@key{asmeconf}{lang-second}[english]{%
      \PassOptionsToPackage{#1}{babel}%
}
\define@key{asmeconf}{lang-third}[english]{%
      \PassOptionsToPackage{#1}{babel}%
}

\ProcessKeyvalOptions*

%% option to have colored hyperlinks
\DeclareOption{colorlinks}{%
	\PassOptionsToPackage{colorlinks=true}{hyperref}%
   }

%% option to omit ASME footer
\DeclareOption{nofoot}{%
   \AtBeginDocument{\pagestyle{plain}}%
   }

%% Access many options from newtxmath. See newtx documentation for details.
\DeclareOption{upint,smallerops,varvw,varg,uprightGreek,slantedGreek,frenchmath,varbb,cmbraces}{\PassOptionsToPackage{}{newtxmath}}

%% Option for slightly larger small capitals font
\DeclareOption{largesc}{\PassOptionsToPackage{largesc}{newtxtext}}

%% Option not to use latex default superscripts, instead using the newtxtext superiors font [nodefaultsups]
\ifthenelse{\boolean{DefaultSups}}{\PassOptionsToPackage{defaultsups}{newtxtext}}{\relax}

%% option to use old authors
\DeclareOption{oldauthors}{%
      \setboolean{Oldauthors}{true}%
	  \ClassWarningNoLine{asmeconf}{Selected option for a grid of author blocks}%
   }

%% Option to hyphenate the typewriter font [hyphenate]
\DeclareOption{hyphenate}{%
	\PassOptionsToPackage{hyphenate}{inconsolata}%
	\ClassWarningNoLine{asmeconf}{Allowing hyphenation of typewriter font}%
}

%% Suppress warnings about mathalfa keys as unused global options
\DeclareOption*{}

\ProcessOptions \relax


%%%%%%%%%%%%% end options %%%%%%%%%%%%%%%%%%%


\RequirePackage[letterpaper, left=0.5in, right=0.5in, top=0.5in, bottom = 1.in, footskip=0.5in]{geometry}
% conforms to ASME required margins
\setlength\parindent{0.25in}
\setlength\columnsep{0.38in}

\RequirePackage[sort&compress,numbers]{natbib} 
\setlength\bibsep{1pt plus 1pt minus 1pt}

\RequirePackage{graphicx} 
\RequirePackage[hyperref,fixpdftex,dvipsnames,svgnames,x11names]{xcolor}
\RequirePackage{xparse} 
\RequirePackage{metalogo,hologo} % Access various LaTeX logos if needed

%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{booktabs}
\RequirePackage{array} 

\RequirePackage{dcolumn} %%% alignment on decimal places 
\newcolumntype{d}[1]{D{.}{.}{#1}} %% conflicts with babel's spanish language option.

%%%% FONT related %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[T1]{fontenc}

\RequirePackage{iftex} % check whether pdfTeX or a different engine is used
\ifpdftex
  \pdfminorversion=7 % This selection is not required.
  \RequirePackage[utf8]{inputenc} % for backward compatibility with pre-2018 distributions
\else
  \relax
\fi

\RequirePackage{mathtools} % loads and extends amsmath

\RequirePackage[]{babel}
\RequirePackage[]{newtxtext}
\RequirePackage[varqu,varl]{inconsolata} % sans typewriter font
\RequirePackage[]{newtxmath}
% See package documentation

%% override \textsu if using default superiors
\ifthenelse{\boolean{DefaultSups}}{\let\textsu\textsuperscript}{\relax}

\RequirePackage[]{mathalfa} % load optional fonts for Calligraphy, Script, Fraktur 
% See mathalfa package documentation for capabilities of this package.
% Option format:  mathalfa=cal=euler (etc.)

\RequirePackage{bm} % load after all math to give access to bold math

%% Ensure that the current font is used for equation tags, not \normalfont as set by amsmath
\def\maketag@@@#1{\hbox{\m@th#1}}

% The article class calls \sloppy in two-column mode (\tolerance 9999, \emergencystretch 3em)
% These adjustments affect line breaking; the values below are intended to produce
% fewer lines with large spaces, without creating the problems of using \fussy in two-column mode.
\tolerance 2500
\emergencystretch 3em 


%%%% font size selection  %%%%%%%%
%%%% ASME's specs differ slightly from latex standard article-10 class %%%

\renewcommand\LARGE{\@setfontsize\LARGE{16}{19.2}}             %{18}{21.6}}  updated 7/7/19 to match new ASME spec.  
                                                               % ...default is 17.28/22 ... used for paper#
\renewcommand\large{\@setfontsize\large{11}{13.6}}             %... default is 12/14    ... used for headings

%\renewcommand\Large{\@setfontsize\Large{14.4}{18}}             % same as default
%\renewcommand\normalsize{\@setfontsize\normalsize{10}{12}}     % same as default
%\renewcommand\small{\@setfontsize\small{9}{11}}                % same as default
%\renewcommand\footnotesize{\@setfontsize\footnotesize{8}{9.5}} % same as default


%% This provides sans serif italic and sans serif bold italic math.
%% It's intended only for use in the figure captions and section headings (recommend \bm{..} elsewhere).
\DeclareMathVersion{sansbold}
\SetSymbolFont{letters}{sansbold}{OML}{ntxsfmi}{b}{it}
\SetSymbolFont{lettersA}{sansbold}{U}{ntxsfmia}{b}{it}
\SetSymbolFont{symbols}{sansbold}{LMS}{ntxsy}{b}{n}
\SetSymbolFont{operators}{sansbold}{\encodingdefault}{\sfdefault}{\bfdefault}{n}
\SetMathAlphabet{\mathsf}{sansbold}{\encodingdefault}{\sfdefault}{b}{it}

%%%%%% footer %%%%%%%

\RequirePackage{fancyhdr}
\pagestyle{fancy}

\fancyfoot{}
\fancyfoot[CE,CO]{\thepage}
\fancyfoot[RO,RE]{Copyright~\textcopyright~\the\year\ by ASME}
\fancyhead{}
\renewcommand{\headrulewidth}{0pt} 
\renewcommand{\footrulewidth}{0pt}

%%%%%% footnotes %%%%%%%

\RequirePackage{fnpos}
\makeFNbottom
\makeFNbelow

\setlength{\skip\footins}{\baselineskip}   % <=== per ASME 1 extra line

\renewcommand{\footnoterule}{%
  \kern -3pt
  \hrule width 0.5in height 0.4pt
  \kern 2pt
}

%% reduce indentation of footnotes
\renewcommand\@makefntext[1]{%
  \noindent\makebox[2ex][r]{\@makefnmark}#1}


%%%%%%%%% CAPTION RELATED %%%%%%%%%%%%%%%%

\RequirePackage[labelfont={sf,bf},hypcap=false]{caption}
\RequirePackage[hypcap=false,list=true]{subcaption}

\DeclareCaptionLabelFormat{uppercase}{\MakeTextUppercase{#1} #2}
\DeclareCaptionTextFormat{boldmath}{\mathversion{sansbold}#1}
\captionsetup[figure]{labelformat=uppercase, labelfont={sf,bf,small},textfont={sf,bf,small},textformat=boldmath, labelsep=colon}
\captionsetup[table]{labelformat=uppercase, labelfont={sf,bf,small},textfont={sf,bf,small},textformat=boldmath, labelsep=colon,skip=0.5\baselineskip} %name=TABLE,

%% This construction avoids a failure of hyperref in relation to uppercase caption
%% Discussion: https://tex.stackexchange.com/questions/375695/maketextuppercase-inside-table-captions
\AtBeginDocument{
   \let\scaption\caption
   \renewcommand*{\caption}[2][\shortcaption]{\def\shortcaption{#2}\scaption[#1]{\MakeTextUppercase{#2}}}%
}

%%%%%% introduce some caption or section names %%%%%%%%%%%
  \providecommand{\nomname}{Nomenclature}  
  \providecommand{\keywordname}{Keywords}
  \providecommand{\appendicesname}{APPENDICES}
  \providecommand{\JAwords}{Joint first authors}
  \providecommand{\CAwords}{Corresponding author}
  
%%%%%%%%%%%%%%%%%% Section headings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% wish to accommodate hyperref

\RequirePackage{textcase} %% Allows uppercase titles and captions without errors from math and citations

\RequirePackage[raggedright,indentafter]{titlesec}

%% ASME specifies 10 pt headings
\titleformat{\section}{\mathversion{sansbold}\bfseries\sffamily\raggedright}{\thesection .}{0.5em}{\MakeTextUppercase}

\titleformat{\subsection}{\mathversion{sansbold}\bfseries\sffamily\raggedright}{\thesubsection}{0.5em}{}
\titleformat{\subsubsection}[runin]{\mathversion{sansbold}\bfseries\sffamily}{\thesubsubsection}{0.5em}{}[.\hspace*{0.5em}]

\titlespacing\section{0pt}{12pt plus 4pt minus 2pt}{1pt plus 1pt minus 1pt} % from 2 pt 2 pt 1 pt, 7/7/19
\titlespacing\subsection{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 1pt}
\titlespacing\subsubsection{\parindent}{6pt plus 3pt minus 2pt}{0pt plus 2pt minus 1pt} % from 12 4 3, 7/7/19


%%  Special handling of the appendices            
%%  Assumes that appendices are the last content in paper 
\RenewDocumentCommand{\appendix}{}{%
    \setcounter{section}{0}
    \pdfbookmark[0]{\appendicesname}{appendices}
    \renewcommand\thesection{\Alph{section}}
    \titleformat{\section}{\mathversion{sansbold}\bfseries\sffamily\raggedright}{\MakeTextUppercase{\appendixname}\ \thesection.}{0.5em}{\MakeTextUppercase}
}

%%%%%%%%%%%%%  hyperref  %%%%%%%%%%%%%%%%%%%

\RequirePackage{hyperxmp} %% to fix transfer of metadata to Acrobat pdf 

\RequirePackage[%
    unicode,        % Unicode encoded PDF strings
    psdextra,       % additional support for math in pdf bookmarks
	pdfborder={0 0 0},% 
	bookmarks=true, %
	bookmarksnumbered=true,%
	bookmarksopen=true,%
	bookmarksopenlevel=1,%
%	colorlinks=true,%%% <=== set true to get colored type, but do so via package options
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
	
\urlstyle{same}     % don't switch to typewriter font

\RequirePackage{doi}          % supports the nasty characters in some doi's
\renewcommand{\doitext}{DOI } % change the default value, {doi:}, to this per ASME specification
\RequirePackage{bookmark}     % improves handling of pdf bookmarks

%% Since \bm may be useful in headings, this fix will reduce frequency with which
%%    alternate pdfstrings must be given in revised section command as \section[pdfstring]{texstring}
\pdfstringdefDisableCommands{%
    \def\bm#1#{\relax}%
}

%% Let's disable \( and \) in pdf bookmarks, 28/2/20
\pdfstringdefDisableCommands{%
    \def\({\relax}%
    \def\){\relax}%
}

%% Let's also make sure \NoCaseChange in section headings won't break pdf bookmarks
\pdfstringdefDisableCommands{%
      \let\NoCaseChange\relax%
}

%% Let's just remove citations from pdf bookmarks
\pdfstringdefDisableCommands{%
    \def\cite{\@gobble}%
}

%% Let's make sure footnotes in section headings don't break pdf bookmarks.
\RequirePackage{etoolbox}
\robustify{\footnote}
% \patchcmd{\section}{\sectionmark}{\let\footnote\@gobble\sectionmark}{}{}  <== not really needed in this context 28/2/20
\pdfstringdefDisableCommands{%
  \def\footnote#1{}%
}

%% Let's also add \footnote to the \TextUppercase exception list, so that footnote text won't be capitalized
%% if given in section headings. Ditto for \eqref
%
\patchcmd{\@uclcnotmath}{\@nonchangecase\ref}{\@nonchangecase\ref\@nonchangecase\footnote}{}{}
\patchcmd{\@uclcnotmath}{\@nonchangecase\ref}{\@nonchangecase\ref\@nonchangecase\eqref}{}{} %% corrected 24 Jan 2020
     

%%% Create an optional argument for unnumbered sections and set pdf bookmark (thru \addcontentsline).
%%% The optional argument will manually set the pdf bookmark for that section; can be used to avoid hyperref 
%%%     errors when macros are in section titles.
%%% There should not be errors for $, \cite, \ref, \eqref, \label, \footnote, \NoCaseChange, or \bm with current constructions.
\let\svsection\section
\RenewDocumentCommand{\section}{s o m}{%
	    \IfBooleanTF {#1}
		{\svsection*{#3}\phantomsection%
					{\IfNoValueTF {#2}
					{\addcontentsline{toc}{section}{#3}}
					{\addcontentsline{toc}{section}{#2}}% removed trailing space 28/2/20
					}%
		}%
		{\IfNoValueTF {#2}
			{\svsection{#3}}
			{\svsection[#2]{#3}}%
		}%
}

%%%%%%%%%%%%%  Line numbering and balancing columns on last page  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifthenelse{\boolean{lineno}}{%
    \RequirePackage[switch,mathlines]{lineno}    
    \renewcommand{\linenumberfont}{\normalfont\footnotesize\color{red}} 
    \AtBeginDocument{\linenumbers}
    \ClassWarningNoLine{asmeconf}{Package lineno loaded, so final column balancing is disabled}
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
    \ifthenelse{\boolean{Balance}}{\RequirePackage{flushend}}{\relax}  % flushend is NOT compatible with lineno
}
\providecommand{\@LN@col}[1]{\relax}
\providecommand{\@LN}[2]{\relax}


%%%%%%%%%%%%%  Define special environments  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Abstract environment
%% \keywords command should be given someplace before the \end{abstract} command.

\providecommand{\@keywords}{\relax}

\DeclareDocumentCommand{\keywords}{m}{%
 \IfNoValueTF{#1}{%
             \relax}{%
             \long\def\@keywords{\par\smallskip\noindent{\bfseries\sffamily \keywordname:} #1}%
             }
}

\DeclareDocumentEnvironment{abstract}{}{%
	\section*{\abstractname}\itshape%
	}
	{\upshape\@keywords%\medskip%
}

%%%%%%%%%%%%   Nomenclature environment  %%%%%%%%%%%%%%%%%%
%%
%% Increase first optional argument to a dimension > 2em if wide entries cause undesired misalignment of columns. 
%% Second argument can be used to rename, e.g., to List of Symbols.
%%

\newlength\nomenwidth
\newlength\savitemsep

%% If second argument of \entry is omitted, will produce an italicized heading (e.g. "Greek letters")
%%
\DeclareDocumentCommand{\entry}{m g}{%
 \IfNoValueTF{#2}{%
 			 \itemsep3\p@ plus 1\p@ minus 1\p@%
             \goodbreak\item[\itshape#1\hfill]\setlength\itemsep\savitemsep\@itempenalty=1000%\nopagebreak% \smallskip
             }{%
             \item[#1\hfill]#2%
             \@itempenalty=-\@lowpenalty%
             }%
}

\DeclareDocumentEnvironment{nomenclature}{O{2em} O{\nomname}}{%
        \setlength\columnsep{2em} 
        \setlength{\nomenwidth}{#1}
        \section*{#2}
        \raggedright
        \begin{list}{}{%
             \setlength{\itemsep}{0pt}%
             \setlength{\parsep}{\itemsep}%
             \setlength{\labelsep}{1em}%
             \setlength{\labelwidth}{\nomenwidth}%
             \setlength{\leftmargin}{\labelwidth}%
             \addtolength{\leftmargin}{\labelsep}%
			 \setlength\savitemsep\itemsep%
        }%
}{\end{list}} 
       

%%%%%%%%%%%%%%%%% Headers and Title %%%%%%%%%%%%%%%%%%%%%

\newcommand{\ConfName}[1]{\long\gdef\@ConfName{#1}}
\providecommand\@ConfName{\hbox{ }}

\newcommand{\ConfAcronym}[1]{\gdef\@ConfAcronym{#1}}
\providecommand\@ConfAcronym{\hbox{ }}

\newcommand{\ConfDate}[1]{\gdef\@ConfDate{#1,\space}}
\providecommand\@ConfDate{\space}

\newcommand{\ConfCity}[1]{\gdef\@ConfCity{#1}}
\providecommand\@ConfCity{\hbox{ }}

\newcommand{\HeaderConfName}{%
\parbox{\linewidth}{\raggedleft\bfseries\sffamily%
\@ConfName\par%
\MakeTextUppercase{\@ConfAcronym}\par
\@ConfDate\@ConfCity%
    }%
}

\newcommand{\PaperNo}[1]{\gdef\@PaperNo{#1}}
\providecommand\@PaperNo{\protect\phantom{NO.}}

\newcommand{\paperno}{%
\vspace*{2\baselineskip}
\parbox{\linewidth}{\raggedleft\bfseries\sffamily\LARGE%
\MakeTextUppercase{\@PaperNo}%
    }%
}

\newcommand{\PaperTitle}[1]{\gdef\@PaperTitle{#1}}
\providecommand\@PaperTitle{\hbox{ }}

\newcommand{\papertitle}{%
\vspace*{3\baselineskip}
\parbox{\linewidth}{\mathversion{sansbold}\centering{\bfseries\sffamily\large%
\MakeTextUppercase{\@PaperTitle}\par} %%% <=== extra \par to make leading stick. See adjustment in \MakeTitle
     }%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%   Author and affiliation block  %%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xcoffins}

%% To maintain compatibility with newtxtext superiors option, if used, save the definition
\let\savethefootnote\thefootnote
\let\savemakefnmark\@makefnmark


%%%% option to retain original grid layout of authors
\ifthenelse{\boolean{Oldauthors}}{%

%%%%%%%%%%%%%%%%%%%%  Old author layout  %%%%%%%%%%%%%%%%%%%%%%%%%

\NewCoffin{\authorblock}

%% Allows for up to nine author groups... if you need more authors, the edits should be obvious
%% You can put multiple authors above a single affiliation to reduce number of author blocks needed.
\NewCoffin{\firstrowauthorblock}
\SetHorizontalCoffin\firstrowauthorblock{}
\NewCoffin{\secondrowauthorblock}
\SetHorizontalCoffin\secondrowauthorblock{}
\NewCoffin{\thirdrowauthorblock}
\SetHorizontalCoffin\thirdrowauthorblock{}

\newcounter{authorno}
\setcounter{authorno}{0}

\newlength{\coffinsep} %% horizontal space between coffins
\setlength{\coffinsep}{0.03\textwidth}

\DeclareDocumentCommand\SetAuthorBlock{m m}{%
   \addtocounter{authorno}{1}%
   \SetVerticalCoffin{\authorblock}{0.3\textwidth}{%
   \centering\sffamily%
   \textbf{\ignorespaces#1\ignorespaces}\\
   #2%
}

\ifnum\value{authorno}=1
     \JoinCoffins\firstrowauthorblock[r,t]\authorblock[l,t]
 \else
    \ifnum\value{authorno}=2
      \JoinCoffins\firstrowauthorblock[r,t]\authorblock[l,t](\coffinsep,0pt)
      \else
      \ifnum\value{authorno}=3
      \JoinCoffins\firstrowauthorblock[r,t]\authorblock[l,t](\coffinsep,0pt)
      \fi
    \fi 
\fi
\ifnum\value{authorno}=4
   \JoinCoffins\secondrowauthorblock[r,t]\authorblock[l,t]
   \else
   \ifnum\value{authorno}=5
        \JoinCoffins\secondrowauthorblock[r,t]\authorblock[l,t](\coffinsep,0pt)
        \else
        \ifnum\value{authorno}=6
           \JoinCoffins\secondrowauthorblock[r,t]\authorblock[l,t](\coffinsep,0pt)
        \fi
    \fi 
\fi
\ifnum\value{authorno}=7
   \JoinCoffins\thirdrowauthorblock[r,t]\authorblock[l,t]	
   \else
   \ifnum\value{authorno}=8
        \JoinCoffins\thirdrowauthorblock[r,t]\authorblock[l,t](\coffinsep,0pt)
        \else
        \ifnum\value{authorno}=9
           \JoinCoffins\thirdrowauthorblock[r,t]\authorblock[l,t](\coffinsep,0pt)
        \fi
    \fi 
\fi
}

\DeclareDocumentCommand{\ConstructAuthorBlock}{}{%
\ifnum\value{authorno}>3
   \JoinCoffins\firstrowauthorblock[hc,b]\secondrowauthorblock[hc,t](0pt, -1.5\baselineskip)     
\fi
\ifnum\value{authorno}>6
   \JoinCoffins\firstrowauthorblock[hc,b]\thirdrowauthorblock[hc,t](0pt, -1.5\baselineskip)  
\fi
\centerline{\TypesetCoffin\firstrowauthorblock} %% in this instance, \centerline is better than \centering
}   

%% Flag for corresponding author (expecting just one, but if two enter both email addresses and flag both authors)
\newif\ifCA\CAfalse

% allow for NO email address to be given by omitting second argument
\DeclareDocumentCommand{\CorrespondingAuthor}{m g}{%
   \global\CAtrue%
   \IfNoValueTF{#2}{%
         \gdef\@CAsep{\relax}%
         \gdef\@CAemail{\relax}%
         }{%
         \gdef\@CAsep{:\space}%
         \gdef\@CAemail{#2}%
         }%
   \renewcommand*{\thefootnote}{\fnsymbol{footnote}}%
   \ignorespaces#1\ignorespaces\footnotemark[1]%
}

%% Flag for joint first authors (two or more)
\newif\ifJA\JAfalse

\DeclareDocumentCommand{\JointFirstAuthor}{}{%
   \global\JAtrue%
   \renewcommand*{\thefootnote}{\fnsymbol{footnote}}%
   \ignorespaces\footnotemark[2]%
}

%%% otherwise use new compact layout of authors
}{%  i.e., this begins "else"

%%%%%%%%%%%%%%%%%%%%%%   New author layout %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NewCoffin{\AuthorBlock}
\NewCoffin{\AffiliationBlock}
\NewCoffin{\AffiliationsBlock}

%% NB: \parbox width to \textwidth (full page) not \linewidth (single column)
\SetHorizontalCoffin\AffiliationsBlock{}
\DeclareDocumentCommand{\SetAuthors}{m}{%
     \SetHorizontalCoffin\AuthorBlock{%
     \parbox{\textwidth}{\centering\sffamily\bfseries\ignorespaces#1\ignorespaces}%
     }
}


\def\@makefnmark{\hbox{\@textsuperscript{\sffamily\@thefnmark}}}%

\DeclareDocumentCommand{\SetAffiliation}{m m}{%
   \SetVerticalCoffin\AffiliationBlock{\textwidth}{%
      \centering\sffamily\footnotemark[#1]#2\ignorespaces%
   }
   \JoinCoffins\AffiliationsBlock[hc,b]\AffiliationBlock[hc,t](0pt,-1pt) 
}


%%% flag for corresponding author (usually just one, although you can have two by putting both email addresses
%%% into field and attaching to both authors -- footnote will only print only the email in the last occurrence)

%% Flag for corresponding author (expecting just one, but if two enter both email addresses and flag both authors)
\newif\ifCA\CAfalse

% allow for NO email address to be given by omitting the argument (g argument is deprecated, seems to have trouble with \IfNoValueTF)     %% corrected spacing error 24 Jan 2020
\DeclareDocumentCommand{\CorrespondingAuthor}{g}{%
   \ignorespaces$\bm{^\ast}$%
   \global\CAtrue%
 %  \IfNoValueTF{#1}{%
   \ifblank{#1}{%
         \gdef\@CAsep{\relax}%
         \gdef\@CAemail{\relax}%
         }{%
         \gdef\@CAsep{:\space}%
         \gdef\@CAemail{#1}%
   }%
}

%%% Flag for joint first authors (two or more)
\newif\ifJA\JAfalse

\DeclareDocumentCommand{\JointFirstAuthor}{}{%
\global\JAtrue%
  $\bm{^\dagger}$%
}

%%% Affiliation mark
\DeclareDocumentCommand{\affil}{m}{%
   {\bfseries\footnotemark[#1]}%
}

%%% to deal with sequential notes as, e.g., "1,*", or "1,2,*" %%%%%%%%%%
\let\oldaffil\affil
\newcommand\nextToken\relax

\renewcommand\affil[1]{%
    \oldaffil{#1}\futurelet\nextToken\isOthernote}

\newcommand\isOthernote{%
    \ifx\CorrespondingAuthor\nextToken\textsuperscript{\sffamily\bfseries,}%
    \else%
        \ifx\JointFirstAuthor\nextToken\textsuperscript{\sffamily\bfseries,}%
        \else
            \ifx\affil\nextToken\textsuperscript{\sffamily\bfseries,}%
            \fi%
        \fi%
    \fi%
    \ignorespaces% 
}

\let\oldCorrespondingAuthor\CorrespondingAuthor
\renewcommand\CorrespondingAuthor[1]{%
    \oldCorrespondingAuthor{#1}\futurelet\nextToken\isOthernote}
    
\let\oldJointFirstAuthor\JointFirstAuthor
\renewcommand\JointFirstAuthor{%
    \oldJointFirstAuthor\futurelet\nextToken\isOthernote}

\let\oldfootnote\footnote
\renewcommand\footnote[1]{%
    \oldfootnote{#1}\futurelet\nextToken\isOtherfnote}
    
\newcommand\isOtherfnote{%
    \ifx\footnote\nextToken\textsu{\mdseries,}%
    \fi%
}

%%%

\DeclareDocumentCommand{\SetAuthorBlock}{}{%
   \let\savethefootnote\thefootnote
   \JoinCoffins\AuthorBlock[hc,b]\AffiliationsBlock[hc,t](0pt,-\baselineskip)
   \centerline{\TypesetCoffin\AuthorBlock}
   \renewcommand*{\thefootnote}{\fnsymbol{footnote}}
   \ifJA
      \footnotetext[2]{\JAwords}
   \fi
   \ifCA
      \footnotetext[1]{\CAwords\@CAsep\@CAemail}
   \fi
   \let\thefootnote\savethefootnote
}

} %% end ifthenelse for Oldauthors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%% Make the title and author section
\DeclareDocumentCommand{\MakeTitlePage}{}{%
\twocolumn[
  \begin{@twocolumnfalse}
  \HeaderConfName  
  \paperno 
  \papertitle
  \vspace*{2\baselineskip}
  \ifthenelse{\boolean{Oldauthors}}{%
     \ConstructAuthorBlock}{%
     \SetAuthorBlock}
  \vspace*{3\baselineskip} 
  \end{@twocolumnfalse} 
]
\let\@makefnmark\savemakefnmark
\renewcommand*{\thefootnote}{\fnsymbol{footnote}}
\ifJA
  \footnotetext[2]{\JAwords}
\fi
\ifCA
  \footnotetext[1]{\CAwords\@CAsep\@CAemail}
\fi
\let\thefootnote\savethefootnote
}

%%%%%%%%%%

%% Provide compatibility with titling commands from standard LaTeX article class

\RenewDocumentCommand{\maketitle}{}{\MakeTitlePage}
\RenewDocumentCommand{\title}{}{\PaperTitle}

\RenewDocumentCommand{\thanks}{m}{\relax} %% disabling this standard command, as it is inconsistent with the format

%% Produces an unmarked footnote about the version date, to replace "date"
%% This is for editing and should note be used in the final draft
\NewDocumentCommand{\versionfootnote}{m}{\begin{NoHyper}\gdef\@thefnmark{}\@footnotetext{#1}\end{NoHyper}} 

\RenewDocumentCommand{\date}{m}{\versionfootnote}   %% in case someone wants to use \date this way.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Provide sans serif upright Greek letters, following a suggestion
%% to the class author by Michael Sharpe (March 2019).
%% Access sans serif Greek from newtxsf implementation of STIX fonts.
%%

\DeclareSymbolFont{lettersAB}{U}{ntxsfmia}{m}{it}
\SetSymbolFont{lettersAB}{bold}{U}{ntxsfmia}{b}{it}
\DeclareFontSubstitution{U}{ntxsfmia}{m}{it}

\DeclareMathSymbol{\Gammaup}{\mathalpha}{lettersAB}{0}
\newcommand*{\sfGamma}{\text{\ensuremath\Gammaup}}

\DeclareMathSymbol{\Deltaup}{\mathalpha}{lettersAB}{1}
\newcommand*{\sfDelta}{\text{\ensuremath\Deltaup}}
\DeclareMathSymbol{\Thetaup}{\mathalpha}{lettersAB}{2}
\newcommand*{\sfTheta}{\text{\ensuremath\Thetaup}}
\DeclareMathSymbol{\Lambdaup}{\mathalpha}{lettersAB}{3}
\newcommand*{\sfLambda}{\text{\ensuremath\Lambdaup}}
\DeclareMathSymbol{\Xiup}{\mathalpha}{lettersAB}{4}
\newcommand*{\sfXi}{\text{\ensuremath\Xiup}}
\DeclareMathSymbol{\Piup}{\mathalpha}{lettersAB}{5}
\newcommand*{\sfPi}{\text{\ensuremath\Piup}}

\DeclareMathSymbol{\Sigmaup}{\mathalpha}{lettersAB}{6}
\newcommand*{\sfSigma}{\text{\ensuremath\Sigmaup}}
\DeclareMathSymbol{\Upsilonup}{\mathalpha}{lettersAB}{7}
\newcommand*{\sfUpsilon}{\text{\ensuremath\Upsilonup}}
\DeclareMathSymbol{\Phiup}{\mathalpha}{lettersAB}{8}
\newcommand*{\sfPhi}{\text{\ensuremath\Phiup}}
\DeclareMathSymbol{\Psiup}{\mathalpha}{lettersAB}{9}
\newcommand*{\sfPsi}{\text{\ensuremath\Psiup}}
\DeclareMathSymbol{\Omegaup}{\mathalpha}{lettersAB}{10}
\newcommand*{\sfOmega}{\text{\ensuremath\Omegaup}}

\DeclareMathSymbol{\alphaup}{\mathalpha}{lettersAB}{11}
\newcommand*{\sfalpha}{\text{\ensuremath\alphaup}}
\DeclareMathSymbol{\betaup}{\mathalpha}{lettersAB}{12}
\newcommand*{\sfbeta}{\text{\ensuremath\betaup}}
\DeclareMathSymbol{\gammaup}{\mathalpha}{lettersAB}{13}
\newcommand*{\sfgamma}{\text{\ensuremath\gammaup}}
\DeclareMathSymbol{\deltaup}{\mathalpha}{lettersAB}{14}
\newcommand*{\sfdelta}{\text{\ensuremath\deltaup}}
\DeclareMathSymbol{\epsilonup}{\mathalpha}{lettersAB}{15}
\newcommand*{\sfepsilon}{\text{\ensuremath\epsilonup}}

\DeclareMathSymbol{\zetaup}{\mathalpha}{lettersAB}{16}
\newcommand*{\sfzeta}{\text{\ensuremath\zetaup}}
\DeclareMathSymbol{\etaup}{\mathalpha}{lettersAB}{17}
\newcommand*{\sfeta}{\text{\ensuremath\etaup}}
\DeclareMathSymbol{\thetaup}{\mathalpha}{lettersAB}{18}
\newcommand*{\sftheta}{\text{\ensuremath\thetaup}}
\DeclareMathSymbol{\iotaup}{\mathalpha}{lettersAB}{19}
\newcommand*{\sfiota}{\text{\ensuremath\iotaup}}
\DeclareMathSymbol{\kappaup}{\mathalpha}{lettersAB}{20}
\newcommand*{\sfkappa}{\text{\ensuremath\kappaup}}

\DeclareMathSymbol{\lambdaup}{\mathalpha}{lettersAB}{21}
\newcommand*{\sflambda}{\text{\ensuremath\lambdaup}}
\DeclareMathSymbol{\muup}{\mathalpha}{lettersAB}{22}
\newcommand*{\sfmu}{\text{\ensuremath\muup}}
\DeclareMathSymbol{\nuup}{\mathalpha}{lettersAB}{23}
\newcommand*{\sfnu}{\text{\ensuremath\nuup}}
\DeclareMathSymbol{\xiup}{\mathalpha}{lettersAB}{24}
\newcommand*{\sfxi}{\text{\ensuremath\xiup}}
\DeclareMathSymbol{\piup}{\mathalpha}{lettersAB}{25}
\newcommand*{\sfpi}{\text{\ensuremath\piup}}

\DeclareMathSymbol{\rhoup}{\mathalpha}{lettersAB}{26}
\newcommand*{\sfrho}{\text{\ensuremath\rhoup}}
\DeclareMathSymbol{\sigmaup}{\mathalpha}{lettersAB}{27}
\newcommand*{\sfsigma}{\text{\ensuremath\sigmaup}}
\DeclareMathSymbol{\tauup}{\mathalpha}{lettersAB}{28}
\newcommand*{\sftau}{\text{\ensuremath\tauup}}
\DeclareMathSymbol{\upsilonup}{\mathalpha}{lettersAB}{29}
\newcommand*{\sfupsilon}{\text{\ensuremath\upsilonup}}
\DeclareMathSymbol{\phiup}{\mathalpha}{lettersAB}{30}
\newcommand*{\sfphi}{\text{\ensuremath\phiup}}

\DeclareMathSymbol{\chiup}{\mathalpha}{lettersAB}{31}
\newcommand*{\sfchi}{\text{\ensuremath\chiup}}
\DeclareMathSymbol{\psiup}{\mathalpha}{lettersAB}{32}
\newcommand*{\sfpsi}{\text{\ensuremath\psiup}}
\DeclareMathSymbol{\omegaup}{\mathalpha}{lettersAB}{33}
\newcommand*{\sfomega}{\text{\ensuremath\omegaup}}

\DeclareMathSymbol{\varepsilonup}{\mathalpha}{lettersAB}{34}
\newcommand*{\sfvarepsilon}{\text{\ensuremath\varepsilonup}}
\DeclareMathSymbol{\varthetaup}{\mathalpha}{lettersAB}{35}
\newcommand*{\sfvartheta}{\text{\ensuremath\varthetaup}}
\DeclareMathSymbol{\varomegaup}{\mathalpha}{lettersAB}{36}
\newcommand*{\sfvaromega}{\text{\ensuremath\varomegaup}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput
%%
%% End of file `asmeconf.cls'.

