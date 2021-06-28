%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  This file provides the asmeconf class for formatting conference papers according to 
%%  ASME conference requirements as represented on ASME's conference web pages in March 2019.
%%
%%  Please note that ASME's journals follow specifications different from ASME conference papers.
%%
%%  This file is version 1.03 dated 2019/04/06.
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
%%          5. Provide automatic layout of author blocks for up to nine addresses
%%          6. Provide sans serif Greek letters for use in section heading and captions
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
%%  Options for the class are described on lines 74-90. 
%%
%%  The class defines two environments: abstract and nomenclature. The latter has an optional argument to 
%%  control the space between the entries and the definitions.
%%
%%  New commands are described in the asmeconf-template.tex file. The \section[]{} command's optional
%%  argument is changed to better support pdf bookmarks, and \section* is modified similarly.
%%
%%
% =========================================================
%%
%% LICENSE:
%%
%% Copyright (c) 2019 John H. Lienhard
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
\ProvidesClass{asmeconf}[2019/04/04 ASME Conference Paper Format]

\LoadClass[twoside,twocolumn,10pt]{article}
% Two-sided layout not used in ASME's specs, although that's how the papers are printed


%%%%%%%%%%%%%% Options for the class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% option to omit ASME footer
\DeclareOption{nofoot}{%
   \AtBeginDocument{\pagestyle{plain}}%
   }

%% Access many options from newtxmath
%% See newtxmath documentation for details
\DeclareOption{upint,smallerops,varvw,varg,slantedGreek,frenchmath,varbb,cmbraces}{\PassOptionsToPackage{}{newtxmath}}

%% Access many options for mathalpha; defaults are scr=dutchcal,cal=euler
%% See mathalfa documentation for details 
\DeclareOption{scr,cal,frak,bb,scrscaled,calscaled,frakscaled,bbscaled,scaled}{\PassOptionsToPackage{}{mathalfa}}

%% Option for slightly larger small capitals font
\DeclareOption{largesc}{\PassOptionsToPackage{largesc}{newtxtext}}

%% Option not to use latex default superscripts, instead using the newtxtext superiors font [nodefaultsups]
%% The following coding is used because newtxtext cannot process "defaultsups=false"
\newcommand{\ignore}[1]{#1}
\DeclareOption{nodefaultsups}{%
     \renewcommand{\ignore}[1]{}%
     \DeclareOption{supstyle}{}%
}

\ExecuteOptions{scr=dutchcal,cal=euler}
\ProcessOptions\relax

%% now that \ignore is def'd and other options declared, we can deal with newtxtext defaultsups command
\ignore{\DeclareOption{supstyle}{\PassOptionsToPackage{defaultsups}{newtxtext}}}
\ExecuteOptions{supstyle}
\ProcessOptions\relax

%%%%%%%%%%%%% end options %%%%%%%%%%%%%%%%%%%


\RequirePackage[letterpaper, left=0.5in, right=0.5in, top=0.5in, bottom = 1.in, footskip=0.5in]{geometry}
% conforms to ASME required margins
\setlength\parindent{0.25in}
\setlength\columnsep{0.38in}

\RequirePackage[sort&compress,numbers]{natbib} 
\setlength\bibsep{3pt plus 1pt minus 2pt}

\RequirePackage{graphicx} 
\RequirePackage[hyperref,fixpdftex,dvipsnames,svgnames,x11names]{xcolor}
\RequirePackage{xparse} 

%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{booktabs}
\RequirePackage{array} 

\RequirePackage{dcolumn} %%% alignment on decimal places
\newcolumntype{d}[1]{D{.}{.}{#1}}

%%%% FONT related %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{mathtools} % extends amsmath
\RequirePackage[utf8]{inputenc}
\RequirePackage[]{newtxtext}
\RequirePackage[]{newtxmath}
% See package documentation

\RequirePackage[]{mathalfa} % load optional fonts for Calligraphy, Script, etc. 
% See package documentation

\RequirePackage{bm} % load after all math to give access to bold math


%%%% font size selection  %%%%%%%%
%%%% ASME's specs differ from latex standard article-10 class %%%

\renewcommand\LARGE{\@setfontsize\LARGE{15}{18}}    %... default is 17
\renewcommand\Large{\@setfontsize\Large{12}{14.5}}  %... default is 14
\renewcommand\large{\@setfontsize\large{11}{13.6}}  %... default is 12
\renewcommand\normalsize{\@setfontsize\normalsize{10}{12}}
\renewcommand\small{\@setfontsize\small{9}{10.8}}
\renewcommand\footnotesize{\@setfontsize\footnotesize{8}{9.6}}



%%%%%% footer %%%%%%%

\RequirePackage{fancyhdr}
\pagestyle{fancy}

\fancyfoot{}
\fancyfoot[CE,CO]{\thepage}
\fancyfoot[RO,RE]{Copyright~\textcopyright~\the\year\ by ASME}
\fancyhead{}
\renewcommand{\headrulewidth}{0pt} 
\renewcommand{\footrulewidth}{0pt}

%%%%%% foonotes %%%%%%%

\RequirePackage{fnpos}
\makeFNbottom
\makeFNbelow

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

\captionsetup[figure]{name=FIGURE,labelfont={sf,bf,small},textfont={sf,bf,small},labelsep=period}
\captionsetup[table]{name=TABLE,labelfont={sf,bf,small},textfont={sf,bf,small},labelsep=period}

%% This construction avoids a failure of hyperref in relation to uppercase caption
%% Discussion: https://tex.stackexchange.com/questions/375695/maketextuppercase-inside-table-captions
\AtBeginDocument{
   \let\scaption\caption
   \renewcommand*{\caption}[2][\shortcaption]{\def\shortcaption{#2}\scaption[#1]{\MakeTextUppercase{#2}}}%
}


%%%%%%%%%%%%%%%%%% Section headings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% wish to accommodate hyperref

\RequirePackage{textcase} %% Allows uppercase titles and captions without errors from math and citations

\RequirePackage[raggedright,indentafter]{titlesec}

%% ASME specifies 10 pt headings
\titleformat{\section}{\bfseries\sffamily\raggedright}{\thesection :}{0.5em}{\MakeTextUppercase}
\titleformat{name=\section,numberless}{\bfseries\sffamily\raggedright}{}{0em}{\MakeTextUppercase}

\titleformat{\subsection}{\bfseries\sffamily\raggedright}{}{0pt}{\indent}
\titleformat{\subsubsection}[runin]{\bfseries\sffamily}{}{0pt}{\indent}[.\hspace*{0.5em}]

\titlespacing\section{0pt}{12pt plus 4pt minus 2pt}{2pt plus 2pt minus 1pt}
\titlespacing\subsection{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 1pt}
\titlespacing\subsubsection{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 1pt}


%%  Special handling of the appendices            
%%  Assumes that appendices are the last content in paper 
\RenewDocumentCommand{\appendix}{}{%
    \pdfbookmark[0]{Appendices}{appendices}
    \renewcommand\thesection{\Alph{section}}
    \titleformat{\section}{\bfseries\sffamily\raggedright}{APPENDIX \thesection:}{0.5em}{\MakeTextUppercase}
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
	colorlinks=true,%%% <=== set false to get black type, but do so in .tex file
	linkcolor=blue, %
	citecolor=blue, % SeaGreen4,%
	urlcolor=blue,  % Red3,%
	breaklinks=true,%
	pdftitle={},    % <=== add in .tex file
	pdfkeywords={}, % <=== add in .tex file
	pdfnewwindow=true,%
	pdfpagelayout=TwoPageRight,%
	pdfauthor={},   % <=== add in .tex file
	pdfdisplaydoctitle=true%
	]{hyperref}
	
\urlstyle{same}     % don't switch to typewriter font

\RequirePackage{doi}          % provides hyperlinks for doi in bibliography
\renewcommand{\doitext}{DOI } % change the default value, {doi:}, to this per ASME specification


%% Since \bm is useful in headings, this fix will reduce frequency with which
%% alternate pdfstrings must be given in revised section command as \section[pdfstring]{texstring}
\pdfstringdefDisableCommands{%
    \def\bm#1#{\relax}%
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
\pdfstringdefDisableCommands{%
  \def\footnote#1{}%
}


%% Let's also add \footnote to the \TextUppercase exception list, so that footnote text won't be capitalized
%% if given in section headings
\RequirePackage{xpatch}     
\xpatchcmd{\@uclcnotmath}{\@nonchangecase\ref}{\@nonchangecase\ref\@nonchangecase\footnote}{}{}
     

%%% Create an optional argument for unnumbered sections and set pdf bookmark (thru \addcontentsline).
%%% The optional argument will manually set the pdf bookmark for that section; can be used to avoid hyperref 
%%%     errors when macros are in section titles.
%%% There should not be errors for $$, \cite, \ref, \label, \footnote, or \bm with current construction.
\let\svsection\section
\RenewDocumentCommand{\section}{s o m}{%
	    \IfBooleanTF {#1}
		{\svsection*{#3}\phantomsection
					{\IfNoValueTF {#2}
					{\addcontentsline{toc}{section}{#3} }
					{\addcontentsline{toc}{section}{#2} }
					}
		}
		{\IfNoValueTF {#2}
			{\svsection{#3}}
			{\svsection[#2]{#3}}
		}
}


%%%%%%%%%%%%%  Define special environments  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Abstract environment
%% \keywords command should be given someplace before the \end{abstract} command.

\providecommand{\@keywords}{\relax}

\DeclareDocumentCommand{\keywords}{m}{%
 \IfNoValueTF{#1}{%
             \relax}{%
             \long\def\@keywords{\par\medskip\noindent{\bfseries\sffamily Keywords:} #1}%
             }
}

\DeclareDocumentEnvironment{abstract}{}{%
	\section*{Abstract}%
	}
	{\@keywords\bigskip%
}


%% Nomenclature environment.
%% Increase first optional argument to a dimension > 2em if wide entries cause undesired misalignment of columns. 
%% Second argument can be used to rename, e.g., to List of Symbols.
%%
\newcommand\entry[2]{\item[#1\hfill]#2}
\newlength\nomenwidth

\DeclareDocumentEnvironment{nomenclature}{O{2em} O{Nomenclature}}{%
        \setlength\columnsep{2em} 
        \setlength{\nomenwidth}{#1}
        \section*{#2}
        \raggedright
        \begin{list}{}{%
             \setlength{\itemsep}{0pt}
             \setlength{\parsep}{\itemsep}
             \setlength{\labelsep}{1em}%
             \setlength{\labelwidth}{\nomenwidth}%
             \setlength{\leftmargin}{\labelwidth}%
             \addtolength{\leftmargin}{\labelsep}%
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
\vspace*{0.5in}
\parbox{\linewidth}{\raggedleft\bfseries\sffamily\LARGE%
\MakeTextUppercase{\@PaperNo}%
    }%
}

\newcommand{\PaperTitle}[1]{\gdef\@PaperTitle{#1}}
\providecommand\@PaperTitle{\hbox{ }}

\newcommand{\papertitle}{%
\vspace*{0.5in}
\parbox{\linewidth}{\centering{\bfseries\sffamily\large%
\MakeTextUppercase{\@PaperTitle}\par}
     }%
}


%%%%%%%%%%%   Author block  %%%%%%%%%%%%%%%%

\RequirePackage{xcoffins}

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
   \JoinCoffins\firstrowauthorblock[hc,b]\secondrowauthorblock[hc,t](0pt, -2\baselineskip)     
\fi
\ifnum\value{authorno}>6
   \JoinCoffins\firstrowauthorblock[hc,b]\thirdrowauthorblock[hc,t](0pt, -2\baselineskip)  
\fi
\centerline{\TypesetCoffin\firstrowauthorblock} %% in this instance, \centerline is better than \centering
}   

%% To maintain compatibility with newtxtext superiors option, if used, save the definition
\let\savethefootnote\thefootnote

%% Flag for corresponding author (expecting just one, but if two enter both email addresses and flag both authors)

\newif\ifCA\CAfalse
\newcommand{\CAemail}[1]{\gdef\@CAemail{#1}}

\DeclareDocumentCommand{\CorrespondingAuthor}{m m}{%
\global\CAtrue%
\CAemail{#2}%
\renewcommand*{\thefootnote}{\fnsymbol{footnote}}
\ignorespaces#1\ignorespaces\footnotemark[1]%
}

%% Flag for joint first authors (two or more)

\newif\ifJA\JAfalse

\DeclareDocumentCommand{\JointFirstAuthor}{}{%
\global\JAtrue%
\renewcommand*{\thefootnote}{\fnsymbol{footnote}}%
\ignorespaces\footnotemark[2]%
}

%%%% Make the title section

\DeclareDocumentCommand{\MakeTitlePage}{}{%
\twocolumn[
  \begin{@twocolumnfalse}
  \HeaderConfName  
  \paperno 
  \papertitle
  \vspace*{2\baselineskip}
\ConstructAuthorBlock
  \vspace*{3\baselineskip}
  \end{@twocolumnfalse} 
]
\renewcommand*{\thefootnote}{\fnsymbol{footnote}}
\ifJA
  \footnotetext[2]{Joint first authors}
\fi
\ifCA
  \footnotetext[1]{Corresponding author:\space\@CAemail}
\fi
\let\thefootnote\savethefootnote
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Provide sans serif upright Greek letters, following a suggestion
%% to the class author by Michael Sharpe (March 2019).
%% Access sans serif Greek from STIX fonts.
%%
%% These are for use in the sans serif captions and headings if needed.

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

