%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  This file provides the prtec class for formatting conference papers according to 
%%  the Pacific Rim Thermal Engineering Conference (PRTEC) requirements as of April 2019.
%%
%%  The prtec.cls file should be used with the files prtec.bst (for citations) and prtec-template.tex.
%%
%%
%%  This file is version 1.06 dated 2019/08/20.
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
%%  This class is not designed for unicode-math or fontspec, given that the PRTEC style is specific 
%%  with respect to the font selections.
%%
%%  Options for the class are described on lines 67-98. 
%%
%%  The class defines two environments: abstract and nomenclature. The latter has an optional argument to 
%%  control the space between the entries and the definitions.
%%
%%  New commands are described in the PRTEC-template.tex file. The \section[]{} command's optional
%%  argument is changed to provide pdf bookmarks as needed.
%%
%%
 %=========================================================
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
%% in no event shall the authors or copyright holders be liable for any claim, damages or other liability, 
%% whether in an action of contract, tort or otherwise, arising from, out of or in connection with the 
%% software or the use or other dealings in the software.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{prtec}[2019/08/20 PRTEC paper format]

\LoadClass[twoside,11pt]{article}
% Two-sided layout not used in PRTEC's specs, but is included anyway.


%%%%%%%%%%%%%% Options for the class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{ifthen}
\newboolean{DefaultSups}
\setboolean{DefaultSups}{true}

\RequirePackage{kvoptions}
\RequirePackage{kvsetkeys}
\SetupKeyvalOptions{
  family=prtec,
  prefix=prtec@,
  setkeys=\kvsetkeys,
}

%%% set key nodefaultsups to obtain newtx superiors font for footnotes.
\define@key{prtec}{nodefaultsups}[false]{%
      \setboolean{DefaultSups}{#1}
}

\ProcessKeyvalOptions*


%% option to omit PRTEC footer and header
\DeclareOption{nofoot}{%
   \AtBeginDocument{%
     \fancypagestyle{title}{%
     \fancyhf{} % clear all header and footer fields
     \fancyfoot[CE,CO]{\thepage}
     \renewcommand{\headrulewidth}{0pt}
     \renewcommand{\footrulewidth}{0pt}
     }
   }
}

%% Access many options from newtxmath
%% See newtxmath documentation for details
\DeclareOption{upint,smallerops,varvw,varg,slantedGreek,frenchmath,varbb,cmbraces}{\PassOptionsToPackage{}{newtxmath}}

%% Option for slightly larger small capitals font
\DeclareOption{largesc}{\PassOptionsToPackage{}{newtxtext}}

%% Option not to use latex default superscripts, instead using the newtxtext superiors font [nodefaultsups]
\ifthenelse{\boolean{DefaultSups}}{\PassOptionsToPackage{defaultsups}{newtxtext}}{\relax}

%% Suppress warnings about any omitted keys as unused global options
\DeclareOption*{}

\ProcessOptions \relax

%%%%%%%%%%%%% end options %%%%%%%%%%%%%%%%%%%


\RequirePackage[a4paper, left=20mm, right=20mm, top=20mm, bottom = 20mm, footskip=10mm, includefoot, headsep=2mm]{geometry}
% conforms to PRTEC 19 required margins

\RequirePackage{parskip}

\RequirePackage[sort&compress,numbers]{natbib} 
\setlength\bibsep{1.5pt plus 1pt minus 1pt}
\renewcommand*{\bibfont}{\footnotesize}

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

%% override \textsu if using default superiors
\ifthenelse{\boolean{DefaultSups}}{\let\textsu\textsuperscript}{\relax}

\RequirePackage{bm} % load after all other math packages, to give greater access to bold math


%%%% font size selection  %%%%%%%%

%%%% need to be sure to hit the end of paragraph in font size change to stick in title.

\renewcommand\Large{\@setfontsize\Large{14}{16.8}}  
\renewcommand\large{\@setfontsize\large{12}{14.5}} 
\renewcommand\normalsize{\@setfontsize\normalsize{11}{13.6}}
\renewcommand\small{\@setfontsize\small{10}{12}}
\renewcommand\footnotesize{\@setfontsize\footnotesize{9}{10.8}}


%%%%%% footer %%%%%%%

\RequirePackage{fancyhdr}
\pagestyle{fancy}

\setlength{\headheight}{22.53pt}
\fancyfoot{}
\fancyfoot[CE,CO]{\thepage}
\fancyfoot[RO,LE]{}
\fancyhead{}
\renewcommand{\headrulewidth}{0pt} 
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{title}{%
\fancyhf{} % clear all header and footer fields
\fancyfoot[LO,RE]{Copyright~\textcopyright~\the\year\ The Author(s). Distributed by JSME, KSME, and ASTFE with permission.} 
\fancyfoot[LE,RO]{\thepage}
\fancyhead[LE,RO]{\bfseries\sffamily \HeaderConfName}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}}

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



%%%%%%%%%  CAPTION RELATED  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[labelfont={sf,bf},hypcap=false]{caption}
\RequirePackage[hypcap=false,list=true]{subcaption}

\captionsetup[figure]{name=Fig.,labelfont={bf},textfont={}, labelsep=quad} %textformat=period, 
\captionsetup[table]{name=Table,labelfont={bf},textfont={}, labelsep=quad} %textformat=period, 


%%%%%%%%%%%%%%%%%% Section headings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% wish to accommodate hyperref

\RequirePackage{textcase} %% Allows uppercase titles and captions without errors from math and citations

\RequirePackage[raggedright,indentafter]{titlesec}

% PRTEC specifies 12 pt headings
\titleformat{\section}{\bfseries\mathversion{bold}\large\centering}{\thesection.}{0.5em}{\MakeTextUppercase}
\titleformat{name=\section,numberless}{\bfseries\mathversion{bold}\large\centering}{}{0em}{\MakeTextUppercase}

\titleformat{\subsection}[runin]{\bfseries}{\thesubsection}{0.5em}{\mathversion{bold}\noindent}[\hspace*{0.5em}]
\titleformat{\subsubsection}[runin]{\itshape}{}{0em}{\noindent\underline}[.\hspace*{0.5em}]

\titlespacing\section{0pt}{25pt plus 4pt minus 2pt}{12pt plus 2pt minus 1pt}
\titlespacing\subsection{0pt}{13.6pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}
\titlespacing\subsubsection{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}

%%  Special handling of the appendices            
%%  Assumes that appendices are the last content in the paper 
\RenewDocumentCommand{\appendix}{}{%
    \setcounter{section}{0}
    \pdfbookmark[0]{Appendices}{appendices}
    \renewcommand\thesection{\Alph{section}}
    \titleformat{\section}{\bfseries\mathversion{bold}\large\centering}{APPENDIX \thesection:}{0.5em}{\MakeTextUppercase}
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

\RequirePackage{doi}           % provides hyperlinks for doi in bibliography
\renewcommand{\doitext}{doi:~} % change the default, {doi:}, to this for PRTEC specification


%% Since \bm is useful in headings, this fix will reduce frequency with which
%% alternate pdfstrings must be given in section command as \section[pdfstring]{texstring}
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
             \long\def\@keywords{\par\medskip\noindent{\bfseries\small KEYWORDS: }{\small #1}}%
             }
}

\DeclareDocumentEnvironment{abstract}{}{%
	\section*{Abstract}%
	}
	{\@keywords\bigskip%
}


%%%%%%%%%%%%   Nomenclature environment %%%%%%%%%%%%%%%%%%
%%
%% Increase first optional argument to a dimension > 2em if wide entries cause undesired misalignment of columns. 
%% Second argument can be used to rename, e.g., to List of Symbols.
%% If second argument of \entry is omitted, will produce an italicized heading (e.g. "Greek letters")
%%

\RequirePackage{multicol}
\newlength\nomenwidth


%% If the second argument of \entry is omitted, a bold section heading is produced, e.g. \entry{Greek Letters}
\DeclareDocumentCommand{\entry}{m g}{%
 \IfNoValueTF{#2}{%
             \item[\itshape#1\hfill]\smallskip
             }{%
             \item[#1\hfill]#2%
             }
}


\DeclareDocumentEnvironment{nomenclature}{O{2em} O{Nomenclature}}{%
        \setlength\columnsep{2em} 
        \setlength{\nomenwidth}{#1}
        \section*{#2}
        \begin{multicols}{2}
        \raggedright
        \begin{list}{}{%
             \setlength{\itemsep}{0pt}
             \setlength{\parsep}{\itemsep}
             \setlength{\labelsep}{1em}%
             \setlength{\labelwidth}{\nomenwidth}%
             \setlength{\leftmargin}{\labelwidth}%
             \addtolength{\leftmargin}{\labelsep}%
        }%
}{\end{list}\end{multicols}} 
       

%%%%%%%%%%%%%%%%% Headers and Title %%%%%%%%%%%%%%%%%%%%%

\gdef\@CDsep{\relax}
\newif\ifCD\CDfalse

\newcommand{\confname}[1]{\long\gdef\@ConfName{#1}}
\providecommand\@ConfName{\hbox{ }}

\newcommand{\confdate}[1]{\gdef\@ConfDate{#1}\CDtrue}
\providecommand\@ConfDate{\hbox{ }}

\newcommand{\confcity}[1]{\ifCD\gdef\@CDsep{,\space}\fi \gdef\@ConfCity{#1}}
\providecommand\@ConfCity{\hbox{ }}

\newcommand{\HeaderConfName}{%
\parbox{\linewidth}{\raggedleft\bfseries\sffamily%
\@ConfName\linebreak[4]%\par%
\@ConfDate\@CDsep\@ConfCity%
    }%
}

\newcommand{\paperno}[1]{\gdef\@paperno{#1}}
\providecommand\@paperno{\hbox{ }}

\newcommand{\PaperNo}{%
\vspace*{-4.7mm}%
\parbox{\linewidth}{\raggedleft\bfseries\sffamily\Large%
\MakeTextUppercase{\@paperno}%
    }%
}

\newcommand{\papertitle}[1]{\gdef\@papertitle{#1}}
\providecommand\@papertitle{\hbox{ }}

\newcommand{\PaperTitle}{%
\par\vspace*{6mm}%
\parbox{\linewidth}{\centering{\bfseries\Large%
\MakeTextUppercase{\@papertitle}%
\thispagestyle{title}\par}  %% <=== \par gets the font leading to stick so that lines space properly
     }%
}


%%%%%%%%%%%   Author block  %%%%%%%%%%%%%%%%

\RequirePackage{xcoffins}

\newcounter{authorno}
\setcounter{authorno}{0}

\NewCoffin{\AffiliationBlock}
\NewCoffin{\AuthorBlock}

\NewCoffin{\AffiliationsBlock}
\SetHorizontalCoffin\AffiliationsBlock{}

\DeclareDocumentCommand{\SetAuthors}{m}{%
     \SetHorizontalCoffin\AuthorBlock{%
     \parbox{\linewidth}{\centering\bfseries\ignorespaces#1\ignorespaces}%
     }
}

\DeclareDocumentCommand{\SetAffiliation}{m m}{%
   \SetVerticalCoffin\AffiliationBlock{\textwidth}{%
      \centering\footnotemark[#1]#2\ignorespaces%
   }
   \JoinCoffins\AffiliationsBlock[hc,b]\AffiliationBlock[hc,t](0pt,-3pt)
}

%%% flag for corresponding author (usually just one, although you can have two by putting both email addresses
%%% into field and attaching to both authors -- footnote will only print only the email in the last occurrence)

\newif\ifCA\CAfalse
\newcommand{\CAemail}[1]{\gdef\@CAemail{#1}}

\DeclareDocumentCommand{\CorrespondingAuthor}{m}{%
  \global\CAtrue%
  \CAemail{#1}%
  $^\ast$%
}

%%% flag for joint first authors (two or more)
\newif\ifJA\JAfalse

\DeclareDocumentCommand{\JointFirstAuthor}{}{%
  \global\JAtrue%
  $^\dagger$%
}

%%% Affiliation mark
\DeclareDocumentCommand{\affil}{m}{%
   {\mdseries\footnotemark[#1]}%
}

%%% to deal with sequential notes as, e.g., "1,*", or "1,2,*"
\let\oldaffil\affil
\newcommand\nextToken\relax

\renewcommand\affil[1]{%
    \oldaffil{#1}\futurelet\nextToken\isOthernote}

\newcommand\isOthernote{%
    \ifx\CorrespondingAuthor\nextToken\textsu{\mdseries,}%
    \else%
        \ifx\JointFirstAuthor\nextToken\textsu{\mdseries,}%
        \else
            \ifx\affil\nextToken\textsu{\mdseries,}%
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

\DeclareDocumentCommand{\SetAuthorBlock}{}{%
   \let\savethefootnote\thefootnote
   \JoinCoffins\AuthorBlock[hc,b]\AffiliationsBlock[hc,t](0pt,-\baselineskip)
   \centerline{\TypesetCoffin\AuthorBlock}
   \renewcommand*{\thefootnote}{\fnsymbol{footnote}}
   \ifJA
      \footnotetext[2]{Joint first authors}
   \fi
   \ifCA
      \footnotetext[1]{Corresponding author:\space\@CAemail}
   \fi
   \let\thefootnote\savethefootnote
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%   Make the title section

\DeclareDocumentCommand{\MakeTitlePage}{}{%
  \PaperNo 
  \PaperTitle
  \vspace*{2\baselineskip}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{metalogo,hologo} %% to access various TeX logos for the documentation.

\endinput
%%
%% End of file `prtec.cls'.

