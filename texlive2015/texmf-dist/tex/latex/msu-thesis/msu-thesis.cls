% MSU Thesis Class
%
% Copyright 2009,2010,2011,2012,2013 by Alan Munn <amunn@msu.edu>
%
% This is a class file for producing dissertations and theses according to the 
% Michigan State University Graduate School Guidelines (2012)
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
%                    
% Use at your own risk! 
% Report bugs/problems/questions to <amunn@msu.edu>
%
\def\msu@version{2.5}
\def\msu@date{2014/08/08}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{msu-thesis}[\msu@date  Michigan State University Thesis Class version \msu@version]
\newif\ifmsu@lscape\msu@lscapefalse
\newif\ifmsu@stupidtoc\msu@stupidtocfalse
\newif\ifmsu@mixedtoc\msu@mixedtocfalse
\newif\ifmsu@plaintoc\msu@plaintoctrue % make this the default to see what the reaction is
\newif\ifmsu@hyperloaded\msu@hyperloadedfalse
\DeclareOption{PhD}{\gdef\@degree{Doctor of Philosophy}\gdef\@diss{DISSERTATION}}
\DeclareOption{MA}{\gdef\@degree{Master of Arts}\gdef\@diss{THESIS}}
\DeclareOption{MS}{\gdef\@degree{Master of Science}\gdef\@diss{THESIS}}
%\DeclareOption{MAT}{\gdef\@degree{Master of Arts for Teachers}\gdef\@diss{THESIS}}
\DeclareOption{MBA}{\gdef\@degree{Master of Business Administration}\gdef\@diss{THESIS}}
\DeclareOption{MFA}{\gdef\@degree{Master of Fine Arts}\gdef\@diss{THESIS}}
\DeclareOption{MIPS}{\gdef\@degree{Master of International Planning Studies}\gdef\@diss{THESIS}}
\DeclareOption{MHRL}{\gdef\@degree{Master of Human Resources and Labor Relations}\gdef\@diss{THESIS}}\DeclareOption{MMus}{\gdef\@degree{Master of Music}\gdef\@diss{THESIS}}
%\DeclareOption{MSN}{\gdef\@degree{Master of Science in Nursing}\gdef\@diss{THESIS}}
\DeclareOption{MPP}{\gdef\@degree{Master of Public Policy}\gdef\@diss{THESIS}}
\DeclareOption{MSW}{\gdef\@degree{Master of Social Work}\gdef\@diss{THESIS}}
\DeclareOption{MURP}{\gdef\@degree{Master in Urban and Regional Planning}\gdef\@diss{THESIS}}
\DeclareOption{lscape}{%
\msu@lscapetrue
\AtEndDocument{\ClassWarningNoLine{msu-thesis}{You have chosen the [lscape] option. You may need to run latex twice to get landscape page numbering to display correctly}}}
\DeclareOption{boldtoc}{\msu@stupidtoctrue\msu@plaintocfalse\msu@mixedtocfalse}
\DeclareOption{plaintoc}{\msu@plaintoctrue\msu@stupidtocfalse\msu@mixedtocfalse}
\DeclareOption{mixedtoc}{\msu@mixedtoctrue\msu@stupidtocfalse\msu@plaintocfalse}
\ExecuteOptions{PhD}
\DeclareOption*{% 
\PassOptionsToClass{\CurrentOption}{memoir}% 
}
\ProcessOptions
\LoadClass[12pt,oneside,letterpaper]{memoir}[2008/05/27]
\RequirePackage{etex}
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
\AtBeginDocument{%
\checkandfixthelayout
% set up subscript sizes so that 10 pt is the smallest
% (MSU Requirement)
\DeclareMathSizes{12}{12}{10}{10}
\DeclareMathSizes{10.95}{10.95}{10}{10}
\DeclareMathSizes{10}{10}{10}{10}
}%

% This stuff is modifications of gb4e for linguistics
\@ifpackageloaded{gb4e}{\input{gb4e-compat.tex}}{\relax}


% set up contents title
% we use a private macro here to avoid problems with babel and
% polyglossia if they are loaded since they redefine the contents title
% 
\newcommand*\msu@contentsname{TABLE OF CONTENTS} 

\newif\ifappendices\appendicesfalse
\newcommand*{\@appendixcover}{\ifappendices{APPENDICES}\else{APPENDIX}\fi}
\newcommand*{\fieldofstudy}[1]{\gdef\@fieldofstudy{#1}} % removed \MakeUppercase 6/5/12
\newcommand{\dedication}[1]{\gdef\@dedication{#1}}
\newcommand*{\degree}[1]{\gdef\@degree{\MakeUppercase{#1}}}

% msuabstract environment (not needed now) but included for backwards 
% compatibility
%
\newenvironment{msuabstract}{\ClassWarning{msu-thesis}{MSU Thesis: The msuabstract environment is deprecated.  Please use the abstract environment}\begin{abstract}}{\end{abstract}}

\newcommand*{\@titleintro}{A~} % this is the beginning to the title page phrase
\newcommand*{\msu@fieldseparator}{\textendash} % this is between the degree name and field of study



% make title 2in from top of page
\setlength{\droptitle}{.25in}

% set up the title page
% Because the title is sent to \MakeUppercase we need to \protect line
% breaks within the title.  This has now been documented in the user docs.
\pretitle{\begin{center}\MakeUppercase}
\posttitle{\\[\baselineskip]\end{center}}
\preauthor{\begin{center}By\\[\baselineskip]}
\postauthor{\end{center}}
\predate{\vfill\begin{center}\@titleintro\@diss\\[\baselineskip]Submitted\\to Michigan State University\\in partial fulfillment of the requirements\\for the degree of\\[\baselineskip]\@fieldofstudy~\msu@fieldseparator~\@degree\\[\baselineskip]}

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
  \l@chapapp{\msu@tocfont{#1}}{#2}{\cftappendixname}} % Format appendix names
\setlength{\cftchapternumwidth}{3em}
\setrmarg{3.5em} % better wrapping of long titles
%\setlength{\cftbeforechapterskip}{1.0em \@plus\p@}

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
% The following left in for backwards compatibility with v. 1.7
% but not mentioned in the documentation

\newcommand{\maketableofcontents}{\tableofcontents*}

% set up footnotes
\footmarkstyle{\normalsize\textsuperscript{#1}} % reset size so that mark is right size
\setlength{\footmarkwidth}{1.8em} 
\setlength{\footmarksep}{-1.8em} 
\setlength{\footparindent}{1em} 
\renewcommand{\foottextfont}{\normalsize} % footnotes will be 12pt
\feetbelowfloat


\renewenvironment{abstract}{%
   \chapter*{\abstractname}
   \thispagestyle{empty}
   \plainbreak{-1.5}
    \begin{center}
    		\MakeUppercase{\thetitle}\plainbreak{1}By\plainbreak{1}\theauthor
 	\end{center}
     \DoubleSpacing
   }{\par}

% \makeabstract command included for backwards compatibility
\newcommand{\makeabstract}{\ClassWarning{msu-thesis}{MSU-Thesis: The \protect\makeabstract\space command is no longer needed.}}

% set up captions
\captionstyle[\centering]{\raggedright}

\pagestyle{plain}

% make the titlepage
\newcommand{\maketitlepage}{%
\pagestyle{empty}\thispagestyle{empty}
\begin{titlingpage}
\maketitle
\end{titlingpage}
\addtocounter{page}{1}}

% make the copyright page
\newcommand*{\makecopyrightpage}{%
\pagestyle{plain}\clearpage\thispagestyle{empty}
\vspace*{7in}
{\raggedleft Copyright by\\\MakeUppercase{\theauthor}\\\thedate\\} % Author now uppercase 6/5/12
\clearpage}

% make the dedication page
\newcommand*{\makededicationpage}{%
\clearpage\pagestyle{plain}
\chapter*{\ }
\vspace{.35\textheight}\begin{center}
\@dedication
\end{center}}

\renewcommand{\mainmatter}{%
  \DoubleSpacing\pagestyle{plain}\@ifstar{\@smemmain}{\@memmain}}



% make the appendices cover page
% Two new commands added \appendix and \appendices
% no longer need to set switch manually
% added 8/7/14

\newcommand*{\@makeappendixcover}{%
\addcontentsline{toc}{chapter}{\@appendixcover}
\ifappendices  
   \settocdepth{chapter}
   \addtocontents{toc}{%
      \setlength{\cftchapterindent}{1.5em}
      \setlength{\cftbeforechapterskip}{0.0em \@plus\p@}
}
\else
   \settocdepth{part}
\fi
\clearpage
\chapter*{\ }
\vspace{.35\textheight}\begin{center}
\bfseries\@appendixcover
\end{center}
\ifmsu@hyperloaded
	\renewcommand{\theHchapter}{A\arabic{chapter}}
\fi
}
\let\orig@appendix\appendix
\let\orig@appendices\appendices
\let\orig@endappendices\endappendices
\renewcommand*{\appendix}{\appendicesfalse\@makeappendixcover\orig@appendix}
\renewcommand*{\appendices}{\appendicestrue\@makeappendixcover\orig@appendix}
\renewcommand*{\endappendices}{}

% make the bibliography page
% Modified 8/7/14 to add the bibliography cover page to the TOC and not the actual bibliography page
% This should also work for biblatex even though memoir doesn't check for it
% but we'll worry about that when someone asks...
\newcommand*{\makebibliographycover}{%
\ifmsu@hyperloaded
	\phantomsection\label{msu@bib}\fi
\settocdepth{chapter}
\addtocontents{toc}{
	  \setlength{\cftchapterindent}{0em}
      \setlength{\cftbeforechapterskip}{1.0em \@plus\p@}
      }
\addcontentsline{toc}{chapter}{BIBLIOGRAPHY} % put the title page in the TOC
\nobibintoc % remove the actual bib first page from the TOC
\clearpage
\chapter*{\ } % this is a hack but it works
\vspace{.35\textheight}\begin{center}
\bfseries\MakeUppercase{\bibname}
\end{center}
}

% Do some stuff at begin document: check for hyperref
% The hyperref code allows hyperref to be used. It is not guaranteed to 
% work and has been lightly tested
% If the thesis office permits them, then I may try to support this more.
% Thanks to Florent Chervet for the code.
\AtBeginDocument{%
\@ifpackageloaded{hyperref}%
{\msu@hyperloadedtrue
	\def\MakeLinkUppercase \hyper@linkstart #1#2#3\hyper@linkend
          {\hyper@linkstart {#1}{#2}{\MakeUppercase{#3}}\hyper@linkend }
\pdfstringdefDisableCommands{\let\MakeUppercase \@firstofone }
\renewcommand*{\l@chapter}[2]{%
   \l@chapapp{\MakeLinkUppercase #1}{#2}{\cftchaptername}} % Format chapter names
\renewcommand*{\l@appendix}[2]{%
  \l@chapapp{\msu@tocfont#1}{#2}{\cftappendixname}}} % Format appendix names (changed 8/7/14)
% if no hyperref
{\relax}}
\endinput