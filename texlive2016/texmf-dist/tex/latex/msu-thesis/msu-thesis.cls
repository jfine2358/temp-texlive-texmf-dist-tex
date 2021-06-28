% MSU Thesis Class
%
% Copyright 2009,2010,2011,2012,2013, 2014, 2015, 2016 by Alan Munn <amunn@msu.edu>
%
% This is a class file for producing dissertations and theses according to the 
% Michigan State University Graduate School Guidelines
%
%
% This class may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This package has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this package is Alan Munn.
%
% This package consists of the following source files:  
% 	msu-thesis.cls, gb4e-compat.tex;  
% Documentation files:
%   msu-thesis.tex and msu-thesis.pdf; 
% A template file:
%   MSU-thesis-template.tex
% A test file and test bibliography: 
% 	MSU-thesis-testfile.tex, MSU-thesis-testfile.bib
% It also contains a copy of the LSA Unified Style Sheet for linguistics: 
% 	unified.bst
%
% Version 1.0 2010/04/17 Initial release
% Version 1.1 2010/04/20 Require etex package (fix problem with qtree)
% Version 1.2 2010/07/01 Changed TOC depth to include subsubsections
%						Changed footmarkstyle to make footnote marker correct size
%						Changed section definitions to correct double spacing
% 						problem
% Version 1.3 2010/07/02	Fixed subscript size problem within footnotes
%						Changed TOC to have dotted leaders everywhere
% Version 1.3b 2010/07/02 Now requires at least Memoir v1.618033 [2008/05/27]
% Version 1.4 2010/08/23 Added options for all Masters degrees
% 						Added option [final] to generate additional titlepage
% 						and abstract
% 						Added new command \advisor for advisor name used in
% 						[final] mode
% 						Added new environment {msuabstract} for the abstract text
% 						Added new titling command \makeabstract which produces
% 						the abstracts
% 						Fixed first and additional abstract formatting problem
% 						Added warning about final mode for paper submission only
% 						in anticipation of electronic submission
% Version 1.4b 2010/12/11 Fixed problems with Appendix formatting in the TOC
% Version 1.5 2010/12/12	Removed code to format the second abstract since this
% 						is no longer part of the document with electronic 
% 						submission.  Removed \advisor command and [final] option.
% Version 1.5b 2010/12/13 Fixed margins to new specifications; fixed page numbering 
%						 issue when dedication was missing.
% Version 1.6 2010/12/16 Bug fixes that introduced another bug. Never released.
% Version 1.7 2010/12/16 Fixed page numbering problems with TOC; Fixed abstract
% 						spacing problem; fixed LOF, LOT etc. spacing problem;
% 						by adding command \maketableofcontents; removed
% 						environment msuabstract and \makeabstract (no longer
% 						needed) (still available for backwards compatibility).
% 						Moved samples folder to the doc folder.
% Version 1.8 2010/12/17 Added spacing code for LOF, LOT etc to the
% 						\mem@tableofcontents code. Removed \maketableofcontents
% 						command from documentation as it is no longer needed.
% 						Removed rule between Chapter and Title after irrational
% 						complaints from MSU's Thesis Office. Fixed page numbering
% 						problem when Copyright page was missing. Removed varioref
% 						and afterpage as required packages.
% Version 1.9b 2011/07/22 Made footnotes \normalsize (new requirement)
% Version 2.0 2011/08/24 Added lscape pagestyle for placement of page numbers
%                        on landscape pages.  Implemented as a package option
%                        so that people aren't forced to load lscape or tikz
%                        if they don't need it.  Compatible also with pdflscape
%                        for those using pdflatex; fixed problem with some long 
%                        TOC entries
% Version 2.1 2011/09/04 Added code to make the class compatible with hyperref
%                        This is experimental, and mainly useful for drafts.
% Version 2.1b 2012/05/18 Fixed  bug with redefinition of \contentsname
%                         when babel is loaded.
% Version 2.1c 2012/05/18 Generalized babel bugfix to work with polyglossia
% Version 2.1d 2012/05/27 Removed superfluous title redefinition;
%                         Made title in abstract upper case (bug);
%                         Updated documentation; updated degree list
% Version 2.2 2012/06/07 Made changes to case of copyright page and program name
%						 as per user report.  Who knows if the grad school will
%                        change their mind again.  What kind of people care about this?
%                        Name on copyright page is now upper case;
%                        Program name is now as typed.
%                        Chapter titles now single spaced (bug)
%                        lscape option now requires the pdflscape package, since the thesis
%                        office demands that the physical pages be rotated.
% Version 2.3 2012/12/01 Added "Figure" and "Table" to the LOF and LOT entries per new Grad School
%                        requirements.
% Version 2.4 2014/08/04 Changed format of Title Page as per new Grad School requirements.
%						 Field of study and Degree are now sentence case and on the same line
%						 Added \msu@fieldseparator in case they object to an en-dash. Don't they
%                        have better things to do with their time?
%                        To comply with the new MSWord mimicry, all section elements in the TOC
%                        are bold; this can be turned off with the [noboldtoc] option for a 
%                        prettier, but possibly non-compliant TOC.
%						 Changed capitalization of 'by' to 'By' which makes things so much better...
% Version 2.5 2014/08/08 Fixed problem with bibliography cover page and appendix formatting
%						 Bibliography cover page is now the page that appears in the TOC
%                        Different TOC format for 1 or >1 appendices
%                        User commands simplified: \appendix = 1 appendix; \appendices = >1
%						 Added three TOC options: boldtoc, plaintoc, mixedtoc replacing noboldtoc
%						 Improved hyperref support for Appendices and Bibliography
% Version 2.5b 2015/04/20 Changed spacing between top of page and titles by .06” to appease the 
%						  the Grad School who measure to the tops of letters instead of to baselines.
% Version 2.5c 2015/07/11 Made loading etex conditional due to changes in LaTeX kernel for 2015.
%                         Removed gb4e compatibility code (code remains in the distributed files)
% Version 2.6 2016/05/09  Completely revised the stupid appendix/appendices and bibliography cover page %                         code using memoir internals instead of hacks.
%                         This should fix numbering issues in the TOC w.r.t the cover pages and
%                         also fix bookmarks in the PDF when hyperref is loaded.
%						  Made default caption delimiter a space so that captions in LOT/LOF look better
%                         Removed old commented out code and older backwards compatibility code.
%                  
% Use at your own risk! 
% Report bugs/problems/questions to <amunn@msu.edu>
%
\def\msu@version{2.6}
\def\msu@date{2016/05/09}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{msu-thesis}[\msu@date\space  Michigan State University Thesis Class version \msu@version]
\newif\ifmsu@lscape\msu@lscapefalse
\newif\ifmsu@stupidtoc\msu@stupidtocfalse
\newif\ifmsu@mixedtoc\msu@mixedtocfalse
\newif\ifmsu@plaintoc\msu@plaintoctrue % make this the default to see what the reaction is
\newif\ifmsu@colonintoc\msu@colonintocfalse
\newif\ifmsu@hyperloaded\msu@hyperloadedfalse
\DeclareOption{PhD}{\gdef\msu@degree{Doctor of Philosophy}\gdef\msu@diss{DISSERTATION}}
\DeclareOption{MA}{\gdef\msu@degree{Master of Arts}\gdef\msu@diss{THESIS}}
\DeclareOption{MS}{\gdef\msu@degree{Master of Science}\gdef\msu@diss{THESIS}}
%\DeclareOption{MAT}{\gdef\msu@degree{Master of Arts for Teachers}\gdef\msu@diss{THESIS}}
\DeclareOption{MBA}{\gdef\msu@degree{Master of Business Administration}\gdef\msu@diss{THESIS}}
\DeclareOption{MFA}{\gdef\msu@degree{Master of Fine Arts}\gdef\msu@diss{THESIS}}
\DeclareOption{MIPS}{\gdef\msu@degree{Master of International Planning Studies}\gdef\msu@diss{THESIS}}
\DeclareOption{MHRL}{\gdef\msu@degree{Master of Human Resources and Labor Relations}\gdef\msu@diss{THESIS}}\DeclareOption{MMus}{\gdef\msu@degree{Master of Music}\gdef\msu@diss{THESIS}}
%\DeclareOption{MSN}{\gdef\msu@degree{Master of Science in Nursing}\gdef\msu@diss{THESIS}}
\DeclareOption{MPP}{\gdef\msu@degree{Master of Public Policy}\gdef\msu@diss{THESIS}}
\DeclareOption{MSW}{\gdef\msu@degree{Master of Social Work}\gdef\msu@diss{THESIS}}
\DeclareOption{MURP}{\gdef\msu@degree{Master in Urban and Regional Planning}\gdef\msu@diss{THESIS}}
\DeclareOption{lscape}{%
\msu@lscapetrue
\AtEndDocument{\ClassWarningNoLine{msu-thesis}{You have chosen the [lscape] option. You may need to run latex twice to get landscape page numbering to display correctly}}}
\DeclareOption{boldtoc}{\msu@stupidtoctrue\msu@plaintocfalse\msu@mixedtocfalse}
\DeclareOption{plaintoc}{\msu@plaintoctrue\msu@stupidtocfalse\msu@mixedtocfalse}
\DeclareOption{mixedtoc}{\msu@mixedtoctrue\msu@stupidtocfalse\msu@plaintocfalse}
\ExecuteOptions{PhD}
\DeclareOption*{ 
\PassOptionsToClass{\CurrentOption}{memoir} 
}
\ProcessOptions
\LoadClass[12pt,oneside,letterpaper]{memoir}[2008/05/27]
% Check for older versions of the latex kernel
\ifx\e@alloc\@undefined
   \RequirePackage{etex}
\fi
% set up landscape page numbering
\ifmsu@lscape
  \RequirePackage{pdflscape} % this will cause physical pages to be rotated in the PDF
  \RequirePackage{tikz}
% adjust yshift (in both commands) to meet the thesis office requirements
% positive values will move the number closer to the bottom of the table
% 0 seems to satisfy them, though.
  \makepagestyle{lscape}
  \makeevenfoot{lscape}{}{\tikz[remember picture,overlay]
      \node[outer sep=1cm,above,rotate=90,yshift=0] at (current page.east)
      {\thepage};}{}
  \makeoddfoot{lscape}{}{\tikz[remember picture,overlay]
      \node[outer sep=1cm,above,rotate=90,yshift=0] at (current page.east)
      {\thepage};}{}
\fi     

% set up page for MSU Thesis guidelines
\settypeblocksize{9in}{6.5in}{*}
\setlrmargins{1in}{*}{*}
\setulmargins{1in}{*}{*}
\setheadfoot{\baselineskip}{.5in}

% set up contents title
% we use a private macro here to avoid problems with babel and
% polyglossia if they are loaded since they redefine the contents title
% 
\newcommand*\msu@contentsname{TABLE OF CONTENTS} 
\newcommand*{\fieldofstudy}[1]{\gdef\msu@fieldofstudy{#1}} % removed \MakeUppercase 6/5/12
\newcommand{\dedication}[1]{\gdef\msu@dedication{#1}}
\newcommand*{\msu@titleintro}{A~} % this is the beginning to the title page phrase
\newcommand*{\msu@fieldseparator}{\textendash} % this is between the degree name and field of study

% make title 2in from top of page
% This value is crazy because the grad school doesn’t know how to measure
\setlength{\droptitle}{.425in} 

% set up the title page
% Because the title is set to \MakeUppercase we need to \protect line
% breaks within the title.  This has now been documented in the user docs.
\pretitle{\begin{center}\MakeUppercase}
\posttitle{\\[\baselineskip]\end{center}}
\preauthor{\begin{center}By\\[\baselineskip]}
\postauthor{\end{center}}
\predate{\vfill\begin{center}\msu@titleintro\msu@diss\\[\baselineskip]Submitted\\to Michigan State University\\in partial fulfillment of the requirements\\for the degree of\\[\baselineskip]\msu@fieldofstudy~\msu@fieldseparator~\msu@degree\\[\baselineskip]}

% set up the chapter titles
\chapterstyle{thatcher}
\setlength{\beforechapskip}{0pt}
%\setlength{\afterchapskip}{28pt} % Thesis office didn't like this
\renewcommand*{\chapnamefont}{\centering\bfseries}
\renewcommand*{\chapnumfont}{\bfseries}
\renewcommand*{\chaptitlefont}{\SingleSpacing\bfseries}
\renewcommand*{\printchapternonum}{}
\renewcommand*{\afterchapternum}{}
\renewcommand*{\printchaptername}{%
    \centerline{\chapnumfont{\MakeUppercase\@chapapp\ \thechapter}}}
\renewcommand{\partnamefont}{\centering\bfseries}
\renewcommand{\partnumfont}{\bfseries}
\renewcommand{\parttitlefont}{\SingleSpacing\bfseries}
\renewcommand{\printpartname}{\partnamefont{\MakeUppercase{\partname}}}
\renewcommand{\printparttitle}[1]{\parttitlefont \MakeUppercase#1}


% set up the section styles
\setsecheadstyle{\normalfont\SingleSpacing\large\bfseries}
\setsubsecheadstyle{\normalfont\SingleSpacing\bfseries}
\setsubsubsecheadstyle{\normalfont\SingleSpacing\bfseries}

% set up TOC

\maxtocdepth{subsubsection}
\setsecnumdepth{subsubsection}
\renewcommand*{\printtoctitle}[1]{\centering\bfseries\msu@contentsname}
\renewcommand*{\cftchaptername}{Chapter\space}
\renewcommand*{\cftappendixname}{Appendix\space}
\renewcommand*{\cftchapterdotsep}{\cftdotsep}
\renewcommand*{\cftfigureaftersnum}{\@contdelim} % This uses the same delimiter as in the captions
\renewcommand*{\cfttableaftersnum}{\@contdelim}  % per thesis office punctuation idiocy
\renewcommand*{\cftfigurename}{Figure\space}
\renewcommand*{\cfttablename}{Table\space}

% Stupid option to make the TOC all bold
\ifmsu@stupidtoc
	\def\msu@tocfont{\bfseries}
	\def\msu@chapfont{\bfseries}
\fi
\ifmsu@plaintoc
	\def\msu@tocfont{\normalfont}
	\def\msu@chapfont{\normalfont}
\fi
\ifmsu@mixedtoc
	\def\msu@tocfont{\normalfont}
	\def\msu@chapfont{\bfseries}
\fi

%
% This code from http://tex.stackexchange.com/q/232121/
% Makes appendices formatted as sections not chapters in the TOC
% This is due to MSU idiocy, and also will make the appendix name
% upper case (because of MSU case matching requirements in TOC/chap)
% So the appendices are chapters in the document but formatted as 
% sections in the TOC.  Code needs to be changed back for the bibliography
\cftinsertcode{APP}{
  \setlength\cftchapterindent{\cftsectionindent}
  \setlength\cftbeforechapterskip{0pt}
  \renewcommand\cftchapterfont{\msu@tocfont}
  \renewcommand\cftchapterpagefont{\msu@tocfont}
  \renewcommand*{\cftappendixname}{APPENDIX\space}
}
% This code resets the changes made in the APP code back to normal
% so that the bibliography will appear correctly in the TOC
\cftinsertcode{BIB}{
\setlength{\cftchapterindent}{0em}
\setlength{\cftbeforechapterskip}{1.0em \@plus\p@}
  \renewcommand\cftchapterfont{\msu@chapfont}
  \renewcommand\cftchapterpagefont{\msu@chapfont}
}

% Set up all the font styles for the TOC
\renewcommand*{\cftchapterfont}{\msu@chapfont}
\renewcommand*{\cftchapterpagefont}{\msu@chapfont}
\renewcommand*{\cftsectionfont}{\msu@tocfont}
\renewcommand*{\cftsubsectionfont}{\msu@tocfont}
\renewcommand*{\cftsubsubsectionfont}{\msu@tocfont}
\renewcommand*{\cftsectionpagefont}{\msu@tocfont}
\renewcommand*{\cftsubsectionpagefont}{\msu@tocfont}
\renewcommand*{\cftsubsubsectionpagefont}{\msu@tocfont}

\renewcommand*{\l@chapter}[2]{%
  \renewcommand{\cftchapterpagefont}{\msu@chapfont}
  \l@chapapp{\MakeUppercase{#1}}{#2}{\cftchaptername}} % Format chapter names
\renewcommand*{\l@appendix}[2]{%
 \renewcommand{\cftchapterpagefont}{\msu@tocfont}
  \setlength{\cftchapternumwidth}{2em}
  \l@chapapp{\msu@tocfont\MakeUppercase{#1}}{#2}{\cftappendixname}} % Format appendix names
\setlength{\cftchapternumwidth}{3em}
\setrmarg{3.5em} % better wrapping of long titles

% MSU requires double spacing between entries in the list of tables, figures etc.
% so we add the commands  to change the 'list of'
% spacing after the ToC is formatted. 

\let\oldmem@tableofcontents\mem@tableofcontents
\renewcommand\mem@tableofcontents[1]{%
   \oldmem@tableofcontents{#1}%
   \setlength{\cftbeforechapterskip}{0.0em \@plus\p@}
	\setlength{\cftparskip}{1em}
	\renewcommand*{\insertchapterspace}{}
	\pagestyle{plain}
}

% set up footnotes
\footmarkstyle{\normalsize\textsuperscript{#1}} % reset size so that mark is right size
\setlength{\footmarkwidth}{1.8em} 
\setlength{\footmarksep}{-1.8em} 
\setlength{\footparindent}{1em} 
\renewcommand{\foottextfont}{\normalsize} % footnotes will be 12pt
\feetbelowfloat % footnotes will appear below bottom floats

\renewenvironment{abstract}{%
   \chapter*{\abstractname}
   \thispagestyle{empty}
   \plainbreak{-1.5}
    \begin{center}
    	\MakeUppercase{\thetitle}\plainbreak{1}By\plainbreak{1}\theauthor
 	\end{center}
     \DoubleSpacing
   }{\par}


% set up captions
\captionstyle[\centering]{\raggedright}
% Make the caption delimiter a space instead of colon space so that the 
% contents lists don't look so stupid.  Can be changed if necessary.
\captiondelim{\space}

\pagestyle{plain}

% make the titlepage
\newcommand{\maketitlepage}{%
	\pagestyle{empty}
	\thispagestyle{empty}
	\begin{titlingpage}
		\maketitle
	\end{titlingpage}
	\addtocounter{page}{1}}

% make the copyright page
\newcommand*{\makecopyrightpage}{%
	\pagestyle{plain}
	\clearpage
	\thispagestyle{empty}
	\vspace*{7in}
	{\raggedleft Copyright by\\\MakeUppercase{\theauthor}\\\thedate\\} % Author now uppercase 6/5/12
	\clearpage}

% make the dedication page
\newcommand*{\makededicationpage}{%
	\clearpage
	\pagestyle{plain}
	\chapter*{\ }
	\vspace{.35\textheight}\begin{center}
	\msu@dedication
	\end{center}}

\renewcommand{\mainmatter}{%
  \DoubleSpacing\pagestyle{plain}\@ifstar{\@smemmain}{\@memmain}}

\renewcommand{\beforepartskip}{\vspace*{.35\textheight}}

% This code patches the memoir appendix code to automatically add
% appendix cover pages with the correct label, and getting the stupid
% TOC format that the Grad School requires correct.
% Also, since the Grad School doesn't allow a single appendix to have a letter name
% we remove it for the title, but not for the section headings.
%
\let\orig@appendix\appendix
\let\orig@appendices\appendices
\renewcommand*{\appendix}{
	\renewcommand\appendixpagename{Appendix}
	\renewcommand\appendixtocname{Appendix}
	\appendixpage
	\settocdepth{part}
	\orig@appendix
	\renewcommand\thechapter{}
	\renewcommand\thesection{A.\arabic{section}}}
\renewcommand*{\appendices}{
	\appendixpage
	\cftinserthook{toc}{APP}
	\settocdepth{chapter}
	\orig@appendices}

% make the bibliography page
% new version modeled after memoir code for appendix page
\def\msu@bibpage{%
  \cftinserthook{toc}{BIB}
  \settocdepth{chapter}
  \@setuppart
  \msu@preaddbibpagetotochook
  \msu@addbibheadtotoc
  \msu@postaddbibpagetotochook
  \partmark{\bibpagename}%
  \msu@bibpageinfo{\bibpagename}%
  {\centering
   \interlinepenalty \@M
   \normalfont
   \printparttitle{\bibpagename}\par}%
  \@endpart}
\newcommand\msu@preaddbibpagetotochook{}
\newcommand\msu@postaddbibpagetotochook{}
\newcommand{\msu@bibpageinfo}[1]{}

\def\msu@addbibheadtotoc{%
  \phantomsection\addcontentsline{toc}{chapter}{\bibtocname}}
% Since the bibliography page is the TOC entry we remove the bib in the TOC
% when it's introduced
\nobibintoc
% Modified 8/7/14 to add the bibliography cover page to the TOC and not the actual bibliography page
% This should also work for biblatex even though memoir doesn't check for it
% but we'll worry about that when someone asks...
\let\bibtocname\bibname
\let\bibpagename\bibname
\newcommand*{\makebibliographypage}{\msu@bibpage}
\let\makebibliographycover\makebibliographypage

% Do some stuff at begin document: 
\AtBeginDocument{%
\let\msucaptiondelim\@contdelim
\topskip=0pt % setting this because the Grad School doesn’t know how to measure
\checkandfixthelayout
%
% set up subscript sizes so that 10 pt is the smallest
% (MSU Requirement)
\DeclareMathSizes{12}{12}{10}{10}
\DeclareMathSizes{10.95}{10.95}{10}{10}
\DeclareMathSizes{10}{10}{10}{10}
%
% check for hyperref
% The hyperref code allows hyperref to be used. It is not guaranteed to 
% work and has been lightly tested.
% Thanks to Florent Chervet for the code.
% Added hypersetup to remove borders around links 5/9/16
\@ifpackageloaded{hyperref}%
{\hypersetup{pdfborder= 0 0 0}\msu@hyperloadedtrue
	\def\MakeLinkUppercase \hyper@linkstart #1#2#3\hyper@linkend
          {\hyper@linkstart {#1}{#2}{\MakeUppercase{#3}}\hyper@linkend }
\pdfstringdefDisableCommands{\let\MakeUppercase \@firstofone }
\renewcommand*{\l@chapter}[2]{%
   \l@chapapp{\MakeLinkUppercase #1}{#2}{\cftchaptername}} % Format chapter names
\renewcommand*{\l@appendix}[2]{%
  \l@chapapp{\msu@tocfont#1}{#2}{\cftappendixname}}} % Format appendix names (changed 8/7/14)
% if no hyperref
{\relax}
}
\endinput