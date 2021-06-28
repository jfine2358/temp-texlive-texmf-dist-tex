%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  This file provides the asmejour class for formatting papers in a layout similar to ASME Journal papers.
%%  
%%  The asmejour.cls file should be used with the files asmejour.bst (for citations) and asmejour-template.tex.
%%
%%
%%  This file's version and date are:
		\def\versionno{1.15}
		\def\versiondate{2021/02/01\space}
%%
%%  Author: John H. Lienhard V
%%          Department of Mechanical Engineering
%%          Massachusetts Institute of Technology
%%          Cambridge, MA 02139-4307 USA
%%
%%  This class was designed to approach the following aims:
%%
%%          1. Match ASME's current layout and font specifications
%%          2. With amsejour.bst, match ASME's reference formats and support DOI & URL fields
%%          3. Provide hyperref compatibility for hyperlinks, pdf bookmarks, and metadata
%%          4. Support citations, footnotes, and bold face math in section headings
%%			5. Provide optional line numbers for editing and review
%%			6. Support balancing height of columns on the last page
%%			7. Support the archival PDF/A standards 1b, 2b, 2u, 3b, and 3u
%%			8. Provide copyright notices for government employees and government contractors
%%		    9. Enable various math and text features from the newtxmath, mathalfa, and newtxtext packages
%%		   10. Support inclusion of passages in languages other than English
%%
%%  This class is compatible with either pdfLaTeX or LuaLaTeX. All packages required by the class 
%%  are in standard distributions, such as TeXLive, and are also available at CTAN (https://ctan.org/). 
%%
%%  The title block is set by specific commands that are described in the asmejour-template.tex file.
%%
%%  The \section[]{} command's optional argument has been changed to better support pdf bookmarks, and
%%  \section*[]{} is similarly modified.
%%
%%  The class defines abstract environment (with optional keywords) and a nomenclature environment.   
%%  (LaTeX must be run twice to align the columns in the nomenclature list).
%% 
 %=========================================================
%%
%% LICENSE:
%%
%% Copyright (c) 2021 John H. Lienhard
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

\RequirePackage{xparse}%    \entry{} command uses deprecated g argument; will drop this eventually
\RequirePackage{etoolbox}%  dropped xpatch 28/02/20
\RequirePackage{ifthen}
\RequirePackage{iftex}%     check whether pdftex or another engine is used

%%%%%%%%%%%%%% Options for the class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{kvoptions}% this package calls kvsetkeys
\SetupKeyvalOptions{
  family=asmejour,
  prefix=asmejour@,
  family=pdfaopt,
  prefix=pdafopt@,
  setkeys=\kvsetkeys,
}

%% for mathalfa, so we may pass options in this format: mathalfa=cal=euler, mathalfa=frak=boondox
\define@key{asmejour}{mathalfa}{%
      \PassOptionsToPackage{#1}{mathalfa}%
}

%% set key [nodefaultsups] to obtain newtx superiors font for footnotes.
\newboolean{DefaultSups}\setboolean{DefaultSups}{true}
\define@key{asmejour}{nodefaultsups}[false]{%
      \setboolean{DefaultSups}{#1}
}

%% set barcolor= to a color name defined by xcolor package
\newcommand\@ColorName{black} % default
\define@key{asmejour}{barcolor}[Goldenrod3]{%
      \renewcommand\@ColorName{#1}
}

%% the key main= passes the choice of main language to babel

\newif\ifaj@mainset\aj@mainsetfalse
\define@key{asmejour}{main}[english]{%
	  \PassOptionsToPackage{main=#1,#1}{babel}% added #1 resolves conflicts between certain .ldf files under "main=".
	  \aj@mainsettrue
	  \ifthenelse{\equal{#1}{english}}{%
			\PassOptionsToPackage{pdflang=en}{hyperref}}{%
		  	\ClassWarningNoLine{asmejour}{Selecting #1 as the primary language}%
	  }%
}

%% only main= is actually needed, but keeping these three legacy commands for backward compatibility
\define@key{asmejour}{lang}[english]{%  deprecated option
	  \PassOptionsToPackage{main=#1,#1}{babel}%
      \PassOptionsToPackage{pdflang=en}{hyperref}
	  \aj@mainsettrue%
	  \ifthenelse{\equal{#1}{english}}{%
			\relax}{%
		  	\ClassWarningNoLine{asmeconf}{Selecting #1 as the primary language}%
	  }%
}
\define@key{asmejour}{lang-second}[english]{%  deprecated option
      \PassOptionsToPackage{#1}{babel}%
}
\define@key{asmejour}{lang-third}[english]{%  deprecated option
      \PassOptionsToPackage{#1}{babel}%
}

%% if main language was not chosen explicitly, default to English
\ifaj@mainset\relax\else
	\PassOptionsToPackage{main=english}{babel}%
	\PassOptionsToPackage{pdflang=en}{hyperref}
	%\ClassWarningNoLine{asmejour}{Selecting English as the primary language, since main= not set}%
\fi

\ProcessKeyvalOptions{asmejour}

%% Turn off these keys now that we're done with them
\def\@KeyFamily{asmejour}
\NewDocumentCommand\aj@DisableOption{m}{%
  \DisableKeyvalOption[%
    action=ignore,%
    class=asmejour%
  ]{#1}{\@KeyFamily}%
}
\NewDocumentCommand\@DisableKeys{>{\SplitList{;}}m}{\ProcessList{#1}{\aj@DisableOption}}
\@DisableKeys{nodefaultsups;mathalfa;barcolor;main;lang;lang-second;lang-third}


%%%%%%%   PDF/A Compliance Options  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\ifaj@setpdfa\aj@setpdfafalse
\newif\ifaj@pdfaone\aj@pdfaonefalse

\ifpdftex %% PDF/A compliance has only been configured for pdflatex
%
%%% set key [pdfa] to activate pdf/a compliance (default is pdf/A-3u)
	\define@key{pdfaopt}{pdf-a}[true]{%
      \aj@setpdfatrue
      \PassOptionsToPackage{pdfa,pdfapart=3,pdfaconformance=u}{hyperref}%
}
%%% to select part 1, 2 or 3 
	\define@key{pdfaopt}{pdfapart}[3]{%
      \PassOptionsToPackage{pdfapart=#1}{hyperref}%
	  \ifthenelse{\equal{#1}{1}}{\aj@pdfaonetrue}{\relax}%
}
%% to select conformance b or u.  NB: a is not possible with pdfLaTeX, and u is not possible with 1.
	\define@key{pdfaopt}{pdfaconformance}[u]{%
      \PassOptionsToPackage{pdfaconformance=#1}{hyperref}%
}
	\ProcessKeyvalOptions{pdfaopt}
\else
	\ifaj@pdfaone\ClassWarningNoLine{asmejour}{PDF/A compliance option requires pdfLaTeX engine}\fi%
\fi

%% Done with these keys, so we can now disable them
\def\@KeyFamily{pdfaopt}
\@DisableKeys{pdf-a;pdfapart;pdfaconformance}

%%%%%%%%%%  Further class options   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Option to obtain line numbers [lineno] 
\newif\ifaj@lineno\aj@linenofalse
\DeclareOption{lineno}{\aj@linenotrue}

%%% Option to balance column height on last page [balance] 
\newif\ifaj@balance\aj@balancefalse
\DeclareOption{balance}{\aj@balancetrue}

%% Option to omit lists of figures and tables
\newif\ifaj@lists\aj@liststrue
\DeclareOption{nolists}{\aj@listsfalse}

%% Option to omit ASME footer
\DeclareOption{nofoot}{%
   \AtBeginDocument{\pagestyle{plain}%
     \fancypagestyle{title}{%
     \fancyhf{}
     \fancyfoot[CE,CO]{\thepage}
     }
   }
}
%% Option to omit ASME copyright
\DeclareOption{nocopyright}{%
   \AtBeginDocument{\fancypagestyle{title}{%
      \fancyhf{}
      \fancyfoot[RO]{\large\sffamily \@PreprintStringR\space\space\bfseries/\space\space\@PaperNumber\thepage} 
      \fancyfoot[LO]{\large\bfseries\sffamily Journal of \@JourName} 
      \fancyfoot[CO]{}
      }
    }   
}

%% Option for copyright notice if all authors are government employees [govt]
\newif\ifaj@govt\aj@govtfalse
\DeclareOption{govt}{\aj@govttrue}

%% Option for copyright notice if some (not all) authors are government employees [govtsome]
\newif\ifaj@govtsome\aj@govtsomefalse
\DeclareOption{govtsome}{\aj@govtsometrue}

%% Option for government contractor copyright notice [contractor]
\newif\ifaj@contractor\aj@contractorfalse
\DeclareOption{contractor}{\aj@contractortrue}

%% Option for slightly larger small capitals font [largesc], corrected 29 Jan 2021
\DeclareOption{largesc}{\PassOptionsToPackage{largesc=true}{newtxtext}}% largesc is a boolean key in newtxtext

%% ASME word separation is greater than newtxtext defaults so change these parameters.
\PassOptionsToPackage{spacing=0.3em, stretch=0.18em, shrink=0.10em}{newtxtext}% increased shrink from 0.08, 30 Jan 21

%% Option not to use latex default superscripts, instead using the newtxtext superiors font [nodefaultsups]
\ifthenelse{\boolean{DefaultSups}}{\PassOptionsToPackage{defaultsups}{newtxtext}}{\relax}

%% Disable newtxtext osf option, which is not appropriate for documents in this class
\DeclareOption{osf}{%
	\PassOptionsToPackage{lining}{newtxtext}%
}

%% Option to hyphenate the typewriter font [hyphenate]
\DeclareOption{hyphenate}{%
	\PassOptionsToPackage{hyphenate}{inconsolata}%
	\ClassWarningNoLine{asmejour}{Allowing hyphenation of typewriter font}%
}
%% Option to enforce monospacing of words the typewriter font [mono]
\DeclareOption{mono}{%
	\PassOptionsToPackage{mono}{inconsolata}%
}
%% Option for unslashed zero typewriter font [var0].
\DeclareOption{var0}{%
	\PassOptionsToPackage{var0}{inconsolata}% var0 is a key via xkeyval in inconsolata
}

%% Suppress warnings about mathalfa keys as unused global options
\DeclareOption*{}

\ProcessOptions \relax

%%%%%%%%%%%%  Page size, bibliography, graphics, color, etc. %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[paperheight=285.7mm, paperwidth=215.900mm, left=21.100mm, right=21.100mm, top=15.9mm, bottom = 24mm, footskip=8mm]{geometry}
\setlength\columnsep{4.5mm}
\setlength\parindent{3.5mm}
%% ASME's pdf pages are 11.25 in. tall, not 11.00 in.

\RequirePackage[sort&compress,numbers]{natbib} 
\AtBeginDocument{\def\NAT@space{\relax}}%   ASME puts no space between numerical references (4/5/20)
\setlength\bibsep{0pt plus 1pt minus 0pt}%  ASME keeps this tight
\renewcommand*{\bibfont}{\footnotesize}

\RequirePackage{graphicx} 
\ifpdf\def\MyColorOption{fixpdftex}\else\ifluatex\def\MyColorOption{luatex}\else\def\MyColorOption{}\fi\fi
\RequirePackage[hyperref,\MyColorOption,dvipsnames,svgnames,x11names]{xcolor}

% Nice solution from DPC to prevent aux file errors when switching from pdflatex to lualatex
\ifx\directlua\undefined
	\AtBeginDocument{\immediate\write\@auxout{\detokenize{%
	 \ifx\directlua\undefined\else\endinput\fi}}}
\fi

%%%%%%%%%%%%%  Table related   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{array} 

\RequirePackage{dcolumn}%  column alignment on decimal places
\newcolumntype{d}[1]{D{.}{.}{#1}}

%% make \hline in tables heavier than default 0.4pt
\setlength\arrayrulewidth{.5\p@}

\RequirePackage{booktabs}
\renewcommand*{\toprule}{\specialrule{0.5pt}{0pt}{\doublerulesep}\specialrule{0.5pt}{0pt}{3pt}}
\renewcommand*{\midrule}{\specialrule{0.5pt}{2pt}{3pt}}
\renewcommand*{\bottomrule}{\specialrule{0.5pt}{1pt}{\doublerulesep}\specialrule{0.5pt}{0pt}{0pt}}

%%%%%%%%%%%%%  Font related   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifpdftex
	\ifaj@setpdfa
		\pdfminorversion=4  % for pdf/a-1 need version 4, not 7
	\else
  		\pdfminorversion=7  % this selection is not required
	\fi
	\RequirePackage[T1]{fontenc}
  	\RequirePackage[utf8]{inputenc}% for backward compatibility with pre-2018 LaTeX distributions
\else
	\relax % will lose some accented characters this way... better to use fontspec... if the systems fonts exist...
\fi

\RequirePackage{mathtools}% loads and extends amsmath
\RequirePackage[]{babel}

\RequirePackage[]{newtxtext} 
\RequirePackage[varl,varqu]{inconsolata}% sans typewriter font; restored varl, varqu 2020/08/10 
\RequirePackage[]{newtxmath}

%% override \textsu if using default superiors
\ifthenelse{\boolean{DefaultSups}}{\let\textsu\textsuperscript}{\relax}
  
\RequirePackage[]{mathalfa}% load optional fonts for Calligraphy, Script, etc. 

\RequirePackage{bm}%  load after all math for expanded access to bold math

%% In addition to the word spacing options declared in line 235...
%% Relative to size9.clo: leading reduced to 10 pt; displayskips made greater
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@ixpt{10\p@}%               % <== was \@xipt
   \abovedisplayskip 10\p@ \@plus5\p@ \@minus4\p@%      % <== was 8\p@ 4,4...
   \abovedisplayshortskip 3\p@ \@plus1\p@ \@minus1\p@%  % <== was \z@ \@plus3\p@ (3pt stretch)
   \belowdisplayshortskip 10\p@ \@plus5\p@ \@minus4\p@% % <== was 5\p@ 3, 3
   \belowdisplayskip \abovedisplayskip%
   \let\@listi\@listI}
\normalsize

%% The article class calls \sloppy in two-column mode (\tolerance 9999, \emergencystretch 3em)
%% These adjustments affect line breaking; the values below are intended to produce
%% fewer lines with large spaces, without creating the problems of using \fussy in two-column mode.
\tolerance 2500
\emergencystretch 3em 

\setlength{\jot}{10pt}% <== default is 3pt

%% multline has an "extra line" above it, so subtract from \abovedisplayskip to remove imbalance
\BeforeBeginEnvironment{multline}{\addtolength\abovedisplayskip{-7pt}}
\AfterEndEnvironment{multline}{\addtolength\abovedisplayskip{+7pt}}

\allowdisplaybreaks   % ASME allows these breaks


%% This provides sans serif italic and sans serif bold italic math.
%% It's intended for use in the figure and table captions.
%% Fonts are from newtxsf package.
\DeclareMathVersion{sansbold}
\SetSymbolFont{letters}{sansbold}{OML}{ntxsfmi}{b}{it}
\SetSymbolFont{lettersA}{sansbold}{U}{ntxsfmia}{b}{it}
\SetSymbolFont{symbols}{sansbold}{LMS}{ntxsy}{b}{n}
\SetSymbolFont{largesymbols}{sansbold}{LMX}{ntxexx}{b}{n}%  added 26 Jan 2021
\SetSymbolFont{largesymbolsTXA}{sansbold}{U}{ntxexa}{b}{n}% added 26 Jan 2021
\SetSymbolFont{operators}{sansbold}{\encodingdefault}{\sfdefault}{\bfdefault}{n}
\SetMathAlphabet{\mathsf}{sansbold}{\encodingdefault}{\sfdefault}{b}{n}% \mathsf is upright

%% These lines are to provide math accents for the sans and sansbold math versions.  
%% The accents from ntxsfmi work normally with regular times fonts. Added 27 Jan 2021
\DeclareSymbolFont{lettersAB}{U}{ntxsfmia}{m}{it}
\SetSymbolFont{lettersAB}{normal}{U}{ntxsfmia}{m}{it}
\SetSymbolFont{lettersAB}{bold}{U}{ntxsfmia}{b}{it}
\SetSymbolFont{lettersAB}{sansbold}{U}{ntxsfmia}{b}{it}
\DeclareFontSubstitution{U}{ntxsfmia}{m}{it}
%
\DeclareMathAccent{\grave}{\mathord}{lettersAB}{254}
\DeclareMathAccent{\acute}{\mathord}{lettersAB}{255}
\DeclareMathAccent{\check}{\mathord}{lettersAB}{186}
\DeclareMathAccent{\breve}{\mathord}{lettersAB}{187}
\DeclareMathAccent{\bar}{\mathord}{lettersAB}{221}
\DeclareMathAccent{\mathring}{\mathord}{lettersAB}{222}
\DeclareMathAccent{\hat}{\mathord}{lettersAB}{223}
\DeclareMathAccent{\dot}{\mathord}{lettersAB}{224}
\DeclareMathAccent{\tilde}{\mathord}{lettersAB}{219}

%%% sans math version, potential value with PGFPlots, and provisionally called in subfigure captions.
%%% this is experimental, still needs stress testing. 30/01/2021
\DeclareMathVersion{sans}
\SetSymbolFont{letters}{sans}{OML}{ntxsfmi}{m}{it}
\SetSymbolFont{lettersA}{sans}{U}{ntxsfmia}{m}{it}
\SetSymbolFont{lettersAB}{sans}{U}{ntxsfmia}{m}{it}
\SetSymbolFont{symbols}{sans}{LMS}{ntxsy}{m}{n}
\SetSymbolFont{largesymbols}{sans}{LMX}{ntxexx}{m}{n}
\SetSymbolFont{largesymbolsTXA}{sans}{U}{ntxexa}{m}{n}
\SetSymbolFont{operators}{sans}{\encodingdefault}{\sfdefault}{m}{n}
\SetMathAlphabet{\mathsf}{sans}{\encodingdefault}{\sfdefault}{m}{n}

%% TeX Gyre Heros Condensed is qhvc (regular is qhv). 
\newcommand*{\CondSans}{\selectfont\fontfamily{qhvc}\selectfont} 
\renewcommand\huge{\@setfontsize\huge{14}{14}}        %... for author names only
\newcommand*{\CondSansBold}{\renewcommand\bfdefault{b}\selectfont\fontfamily{qhvc}\selectfont\bfseries} 
\renewcommand\Huge{\@setfontsize\Huge{26.5}{26.5}}    %... for title font only
  
\RequirePackage{metalogo,hologo}% Access to various LaTeX logos (for use in the documentation)

%%%%%%%%%%%%%%%%%  Equation and Line Numbering  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ASME puts equation tags in blue
\patchcmd{\tagform@}{(\ignorespaces#1\unskip\@@italiccorr)}{\color{blue}(\ignorespaces#1\unskip\@@italiccorr)}{}{}

%% Ensure that the current font is used for equation tags, not \normalfont as set by amsmath
\def\maketag@@@#1{\hbox{\m@th#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifaj@lineno
    \RequirePackage[switch,mathlines]{lineno}%
    \renewcommand{\linenumberfont}{\normalfont\footnotesize\color{red}}% 
    \AtBeginDocument{\linenumbers}%
    \ifaj@balance
    	\ClassWarningNoLine{asmejour}{Package lineno loaded, so final column balancing will be disabled}%
	\fi
    %%% Allow line numbering in AMS math environments.
    %%% postdisplaypenalty adjusted to avoid extra line number at end, see discussion here: https://tex.stackexchange.com/a/461192/ 
    %%% multline has some problem that puts an extra line number above it.
    %%% Requires xparse and etoolbox
    \NewDocumentCommand{\aj@losepostpenalty}{}{\patchcmd{\linenomathWithnumbers}{\advance\postdisplaypenalty\linenopenalty}{}{}{}}%
%    
    \NewDocumentCommand{\aj@FixAMSMath}{m}{%
    	\AtBeginEnvironment{#1}{\aj@losepostpenalty\linenomath}%
    	\AtEndEnvironment{#1}{\endlinenomath}%
    	\AtBeginEnvironment{#1*}{\aj@losepostpenalty\linenomath}%
    	\AtEndEnvironment{#1*}{\endlinenomath}%
    }%
%
    \NewDocumentCommand{\aj@FixAll}{>{\SplitList{;}}m}{\ProcessList{#1}{\aj@FixAMSMath}}%
    \aj@FixAll{align;alignat;gather;flalign;multline}%
%
\else
    \ProvideDocumentEnvironment{linenomath}{}{}{}%
    \ifaj@balance                %    balancing through flushend can produce weird errors
    	\RequirePackage{flushend}%    flushend package is NOT compatible with lineno
    	\AtEndDocument{\flushcolsend}%
		\ClassWarningNoLine{asmejour}{Calling flushend package to balance column height on last page}%
    \fi%
\fi

\providecommand{\@LN@col}[1]{\relax}% avoid errors in the aux file when lineno is dropped
\providecommand{\@LN}[2]{\relax}

%% ASME page proofs seem to align the number at top of the line, rather than bottom as done here.

%%%%%%%%%%%%%%%%%  Footer Set Up  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%  footer text names  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\JourName}[1]{\gdef\@JourName{#1}}
\providecommand\@JourName{\hbox{ }}

\NewDocumentCommand{\PaperYear}{m}{%
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
	\ifx R#2{\gdef\@PreprintStringR{#1}}\fi
	\ifx L#2{\gdef\@PreprintStringL{#1}}\fi
	}
}

\newcommand{\PaperNumber}[1]{\gdef\@PaperNumber{#1-}}
\providecommand\@PaperNumber{\relax}

%%%%%%  Fancyhdr  %%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{fancyhdr}
\pagestyle{fancy}

\fancyhf{}% clear all header and footer fields
\renewcommand{\headrulewidth}{0pt} 
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[RE]{\large\bfseries\sffamily Transactions of the ASME} 
\fancyfoot[LO]{\large\bfseries\sffamily Journal of \@JourName} 
\fancyfoot[RO]{\large\sffamily \@PreprintStringR\space\space\bfseries/\space\space\@PaperNumber\thepage}
\fancyfoot[LE]{\large\sffamily {\bfseries \@PaperNumber\thepage\space\space/}\space\space\@PreprintStringL\ }

\fancypagestyle{title}{%
    \fancyhf{}% clear all header and footer fields
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \fancyfoot[RO]{\large\sffamily \@PreprintStringR\space\space\bfseries/\space\space\@PaperNumber\thepage} 
    \fancyfoot[LO]{\large\bfseries\sffamily Journal of \@JourName} 
    \fancyfoot[CO]{\large\bfseries\sffamily Copyright \textcopyright\ \@PaperYear\ by ASME}
}

%%%%%% Footnotes %%%%%%%%%%%%%%%%%%%%%%%%%%%

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
  \noindent\makebox[4mm][r]{\@makefnmark}\hyphenpenalty=300\exhyphenpenalty=300 #1}% <== suppress hyphenation
  
%% Produces an unmarked footnote about the revision date. 
%% This command is invoked by \date as part of \MakeTitlePage below.
%% Text can be anything given as the argument to \date{..}.
\NewDocumentCommand{\revfootnote}{m}{\begin{NoHyper}\gdef\@thefnmark{}\@footnotetext{\hspace{-3pt}#1}\end{NoHyper}} 

%% The above has been offset per style and modified to eliminate missing anchor warning from hyperref that following causes
%%\def\revfootnote{\gdef\@thefnmark{}\@footnotetext}


%% include a comma for sequential footnotes
\newcommand\nextToken\relax

\let\oldfootnote\footnote
\renewcommand\footnote[1]{%
    \oldfootnote{#1}\futurelet\nextToken\isOtherfnote}
    
\newcommand\isOtherfnote{%
    \ifx\footnote\nextToken\textsu{\mdseries,}%
    \fi%
}

%%%%%%%%%  Caption Related  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\addto{\captionsenglish}{%
  \renewcommand{\figurename}{Fig.}  
  \renewcommand{\tablename}{Table}  
}

\RequirePackage[labelfont={sf,bf},hypcap=false]{caption}
\RequirePackage[hypcap=false,list=true]{subcaption}

\DeclareCaptionTextFormat{boldmath}{\mathversion{sansbold}#1}
\DeclareCaptionTextFormat{sansmath}{\mathversion{sans}#1}% strictly speaking, this is unnecessary.

\captionsetup[figure]{labelfont={sf,bf},textfont={sf,bf},textformat=boldmath,labelsep=quad}
\captionsetup[table]{labelfont={sf,bf},textfont={sf,bf},textformat=boldmath,labelsep=quad,skip=0.5\baselineskip} 

%% 30 January 2021. ASME only labels subfigures with a sans serif, italic (a), (b),... no caption text, no bold face.
\captionsetup[subfigure]{labelfont={sf},textfont={sf},textformat=sansmath,labelformat=simple}% default: =parens
\renewcommand\thesubfigure{(\textit{\alph{subfigure}})}

\captionsetup[subtable]{labelfont={sf},textfont={sf},textformat=sansmath,labelformat=simple} 
\renewcommand\thesubtable{(\textit{\alph{subtable}})}


%%%%%%%%%%%%  Section Headings  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

%% Special handling of the appendices            
%% Assumes that appendices are the last technical content in paper

\providecommand{\appendicesname}{Appendices}
 
\RenewDocumentCommand{\appendix}{}{%
    \pdfbookmark[1]{\appendicesname}{appendices}
    \setcounter{section}{0}
    \renewcommand\thesection{\Alph{section}}
    \setcounter{equation}{0}
    \renewcommand\theequation{\Alph{section}\arabic{equation}}
    \titleformat{\section}[block]{\mathversion{bold}\bfseries\large\raggedright}{\appendixname\ \thesection:}{0.5em}{}[\setcounter{equation}{0}]
}

%% natbib's \bibsection controls section heading for References.


%%%%%%%%%%%%%%%%%  List environments  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{enumitem}

\setlist[enumerate,1]{label = (\arabic*), ref = (\arabic*),labelindent=3mm, leftmargin=*,noitemsep}
%% I have no examples of sublists...


%%%%%%%%%%%%%%%%%  Hyperref  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifaj@setpdfa
%
	%%% to assist with unicode glyph mapping, following M. Sharpe's recommendation in newtx documentation.
	\pdfgentounicode=1  							%% enable CMaps
	\input glyphtounicode.tex 						%% lists of mappings
	\InputIfFileExists{glyphtounicode-cmr.tex}{}{} 	%% additional mappings
	\InputIfFileExists{glyphtounicode-ntx.tex}{}{} 	%% additional mappings
%
%%% a fairly generic RGB color profile, aimed at on-screen rendering (not print production)
\immediate\pdfobj stream attr{/N 3} file{sRGB.icc}
\pdfcatalog{%
  /OutputIntents [
    <<
      /Type /OutputIntent
      /S /GTS_PDFA1
      /DestOutputProfile \the\pdflastobj\space 0 R
      /OutputConditionIdentifier (sRGB)
      /Info (sRGB)
    >>
  ]
}
\fi

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
	pdfpagelayout=SinglePage, %TwoPageRight,% changed 12/08/2020
	pdfauthor={},   % <=== add in .tex file
	pdfdisplaydoctitle=true%
	]{hyperref}
	
\urlstyle{same}                % don't switch to typewriter font
\RequirePackage{doi}           % supports nasty characters in some doi's
\renewcommand{\doitext}{doi:~} % change the default, {doi:}, to this for ASME specification
\RequirePackage{bookmark}	   % improves handling of pdf bookmarks

%%%%%% Adjustments to accommodate hyperref bookmarks %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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


%%%%%%%%%%%%%  Define some section and other names for special environments  %%%%%%%

\providecommand{\nomname}{Nomenclature}  
\providecommand{\keywordname}{Keywords}
\providecommand{\CAwords}{Corresponding Author.}

%%%%%%%%%%%%%  Nomenclature Environment   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Nomenclature environment in ASME Journal Style.
%% Run twice to get proper label width.
%% Set first optional argument (a dimension) to override automatic label width (e.g., if one label too wide)
%% Second argument can be used to rename the section, e.g., to List of Symbols.

\newlength\widest
\newlength\@widest
\newlength\nomenwidth
\newlength\savitemsep

%% If the second argument of \entry is omitted, a bold section heading is produced, e.g. \entry{Greek Letters}
\NewDocumentCommand{\entry}{m g}{%
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

%% A separate command command for nomenclature subheadings (xparse "g" argument used in \entry is deprecated)
\NewDocumentCommand\EntryHeading{m}{%
             \itemsep12\p@ plus 4\p@ minus 4\p@% \bigskip
             \goodbreak\item[\bfseries#1\hfill]\itemsep3\p@ plus 1\p@ minus 1\p@\@itempenalty=1000%
}

\RequirePackage{totcount}
\newtotcounter{savedlength}
% a total counter for saving the value of \nomenwidth

\AtBeginDocument{\setlength{\nomenwidth}{\totvalue{savedlength}sp}}
% value is the length in scaled points (sp)

\NewDocumentEnvironment{nomenclature}{O{\nomenwidth} O{\nomname}}{%
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
       
%%%%%%%%%%%%%%%%  List of figures and list of tables  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ASME requires these lists for production. 
\ifaj@lists
    \AtEndDocument{%
	    \clearpage
		\twocolumn[%
		\begin{@twocolumnfalse}
			\listoffigures
			\listoftables
		\end{@twocolumnfalse} 
		]%
	}%
\else
    \ClassWarningNoLine{asmejour}{Omitting lists of figures and tables}%
\fi

%%%%%%%%%%%%%%%%  Author/Title/Abstract block  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xcoffins}

\NewCoffin{\authorblock}
\NewCoffin{\ruleblock}
\NewCoffin{\Abstract}
\NewCoffin{\Title}

\NewCoffin{\firstrowauthorblock}
\SetHorizontalCoffin\firstrowauthorblock{}

\newlength{\coffinsep}%%% space between coffins
\setlength{\coffinsep}{4.5mm}

\newcounter{authorno}
\setcounter{authorno}{0}

%%%%%%

\newlength{\rulecofheight}
\newlength{\Titleheight}

\NewDocumentCommand\SetAuthorBlock{m m}{%
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


\NewDocumentCommand\SetTitle{m}{%
   \SetVerticalCoffin{\Title}{114mm}{%
   	  \vspace*{0.5mm}% <== ASME doesn't align bar and text
   	  \noindent\Huge\CondSansBold\raggedright%
   	  #1%
   	  \par
   }
}

\providecommand{\@keywords}{\relax}
\NewDocumentCommand{\keywords}{m}{% changed to remove g option, 30/01/21
	\long\def\@keywords{\par\vskip\baselineskip\noindent{\keywordname:} #1}%
}

\NewDocumentCommand\@SetAbstract{+m}{% add + to enable blank lines, etc.  31/01/2021
   \SetVerticalCoffin{\Abstract}{114mm}{%
      \noindent\itshape%
      #1
      \@keywords\par% 
      \vspace*{4mm}% <== at bottom of abstract to extend rule
    }
}

\NewDocumentCommand{\@ConstructAuthorBlock}{}{%
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
%% Corresponding author gets footnote #1 and subsequent notes are 2, 3, ....
%% ASME apparently does not recognize joint first authors...so I have not coded that functionality

%% Flag for corresponding author (only one expected, although this code supports more than one)
\newif\ifaj@CA\aj@CAfalse

\newcommand{\CAemail}[1]{\gdef\@CAemail{#1}}% legacy code, drop eventually

%% ASME prefers email to be in address block, not CA footnote; removed option 30/01/21
\NewDocumentCommand{\CorrespondingAuthor}{}{%
	\global\aj@CAtrue%
    \gdef\@CAsep{\relax}% legacy code, drop eventually
	\gdef\@CAemail{\relax}% legacy code, drop eventually
	\def\@makefnmark{\hbox{\@textsuperscript{\sffamily\@thefnmark}}}%
	\footnotemark%
	\addtocounter{footnote}{-1}% in case of more than one CA
}

%%%%%%%%%%

\newlength{\@AbstractSep}%% <== separation of author/abstract coffin from main two-column text.
\setlength{\@AbstractSep}{12.5mm}
\NewDocumentCommand\AbstractSep{m}{\setlength{\@AbstractSep}{#1}}

\NewDocumentCommand{\MakeTitlePage}{}{%
    \thispagestyle{title}%
    \twocolumn[
      	\begin{@twocolumnfalse}
    	\@ConstructAuthorBlock
      	\vspace*{\@AbstractSep} 
      	\end{@twocolumnfalse} 
    ]
    \ifaj@CA 
    	\addtocounter{footnote}{1}
    	\footnotetext{\CAwords\@CAsep \@CAemail}% includes legacy code, remove \@CA commands eventually
    \fi
    \ifaj@Date\revfootnote{\@Date}\else\relax\fi
    \ifaj@contractor\revfootnote{The United States Government retains, and by accepting the article for publication, the publisher acknowledges that the United States Government retains, a non-exclusive, paid-up, irrevocable, worldwide license to publish or reproduce the published form of this work, or allow others to do so, for United States Government purposes.}%
    \fi
    \ifaj@govt\revfootnote{This material is declared a work of the U.S. Government and is not subject to copyright protection in the United States. Approved for public release; distribution is unlimited.}%
    \fi
    \ifaj@govtsome\revfootnote{This work was authored in part by a U.\ S.\ Government employee in the scope of his/her employment. ASME disclaims all interest in the U.\ S.\ Government's contribution.}%
    \fi
}

%%%%%%%%%%

%% Provide compatibility with titling commands from standard LaTeX article class

\RenewDocumentCommand{\maketitle}{}{\MakeTitlePage}
\RenewDocumentCommand{\title}{}{\SetTitle}

\RenewDocumentEnvironment{abstract}{+b}{\gdef\tmp{\@SetAbstract{#1}}\aftergroup\tmp}{\ignorespaces} 
%% Thanks to DPC for the suggestion of \gdef\tmp{...

%% Put date as an unnumbered footnote at bottom of first column
\newif\ifaj@Date\aj@Datetrue% If true, print a date.

\ExplSyntaxOn
\RenewDocumentCommand{\date}{m}
  {%
    \tl_if_empty:nTF {#1}{\global\aj@Datefalse}{\gdef\@Date{#1}}%
  }
\providecommand\@Date{\today}
\ExplSyntaxOff

\RenewDocumentCommand{\thanks}{m}{\relax}%% disabling this standard command, as it is inconsistent with this format

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput
%%
%% End of file `asmejour.cls'.

