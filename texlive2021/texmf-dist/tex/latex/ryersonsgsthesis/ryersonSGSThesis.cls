%This project is licensed under the Apache License - Version 2.0. See the LICENSE file for details%
\ProvidesClass{ryersonSGSThesis}[2019/02/24 v1.0.3 Ryerson SGS Thesis class, Author - Yasir Shoaib, Apache License - Version 2.0]
\NeedsTeXFormat{LaTeX2e}

\newcommand{\setAuthor}[1]{\author{#1}}
\newcommand{\setTitle}[1]{\title{#1}}

\newcommand{\setThesisDegree}[1]{\def\@thesisDegree{#1}}
\newcommand{\show@thesisDegree}{\@thesisDegree}

\newcommand{\setPastDegreeA}[1]{\def\@pastDegreeA{#1}}
\newcommand{\show@pastDegreeA}{\@pastDegreeA}

\newcommand{\setPastDegreeB}[1]{\def\@pastDegreeB{#1}}
\newcommand{\show@pastDegreeB}{\@pastDegreeB}

\newcommand{\setPastDegreeC}[1]{\def\@pastDegreeC{#1}}
\newcommand{\show@pastDegreeC}{\@pastDegreeC}

\newcommand{\setPastDegreeD}[1]{\def\@pastDegreeD{#1}}
\newcommand{\show@pastDegreeD}{\@pastDegreeD}

\newcommand{\setUniversity}[1]{\def\@university{#1}}
\newcommand{\show@university}{\@university}

\newcommand{\setDepartment}[1]{\def\@department{#1}}
\newcommand{\show@department}{\@department}

\newcommand{\setLocation}[1]{\def\@location{#1}}
\newcommand{\show@location}{\@location}

\newcommand{\setThesisYear}[1]{\def\@thesisYear{#1}}
\newcommand{\show@thesisYear}{\@thesisYear}

\newcommand{\setAuthorsDeclaration}[1]{\def\@authorsDeclarationText{#1}}
\newcommand{\show@authorsDeclarationText}{\@authorsDeclarationText}

\newcommand{\setAbstract}[1]{\def\@abstractText{#1}}
\newcommand{\show@abstractText}{\@abstractText}

\newcommand{\setAcknowledgements}[1]{\def\@acknowledgements{#1}}
\newcommand{\show@acknowledgements}{\@acknowledgements}

\newcommand{\setDedication}[1]{\def\@dedication{#1}}
\newcommand{\show@dedication}{\@dedication}

\newcommand{\define}[1]{\index{#1}\emph{#1}}
\newcommand{\indexText}[1]{\index{#1}#1}

\newcommand\frontmatter{
	\cleardoublepage
	\pagenumbering{roman}
}

\newcommand\mainmatter{
    \cleardoublepage % for page numbering. Main body (Introduction) should be page 1
 	\pagenumbering{arabic}
 	\doublespacing
}

\newcommand\backmatter{
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass{report}

\pdfpageheight 11.0in
\paperwidth 8.5in
\RequirePackage[paperwidth=8.5in,paperheight=11.0in,left=1in,right=1in,top=1in,bottom=1in]{geometry}
%\RequirePackage[parfill]{parskip} % Remove paragraph indentation
\RequirePackage{float}
\RequirePackage[pdftex,
			colorlinks={true},
			linkcolor={Blue3},
			urlcolor={Blue3},
			citecolor={Blue3},
			pdfstartview={FitH},
			bookmarks={true},
            pdfauthor={Author},
            pdftitle={Title},
            pdfsubject={Subject}
            plainpages=false,
            pdfpagelabels
            ]{hyperref}
\RequirePackage[nocompress]{cite}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage[cmex10]{amsmath}
\RequirePackage{verbatim}
\RequirePackage{lmodern}
\RequirePackage{setspace}
\RequirePackage{longtable}
\RequirePackage{array,ragged2e}
\RequirePackage[toc,page,title,header]{appendix}
\RequirePackage{listings}
\RequirePackage{algpseudocode}
\RequirePackage{algorithm}
\RequirePackage{algorithmicx}
\RequirePackage[usenames,dvipsnames,svgnames,table,x11names]{xcolor}
\RequirePackage{todonotes}
\RequirePackage{makeidx}
\RequirePackage{subfiles}
\RequirePackage{blindtext}

\makeindex

\definecolor{dkgreen}{rgb}{0,0.4,0}
\definecolor{maroon}{rgb}{0.5,0,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}
\definecolor{pblue}{rgb}{0.13,0.13,1}
\definecolor{pgreen}{rgb}{0,0.5,0}
\definecolor{pred}{rgb}{0.9,0,0}
\definecolor{pgrey}{rgb}{0.46,0.45,0.48}
\definecolor{darkblue}{rgb}{0.0,0.0,0.5}
\definecolor{cyan}{rgb}{0.0,0.6,0.6}
\definecolor{BackgroundGreen}{HTML}{E6F0F0}
\definecolor{NoteBackground}{HTML}{FFFCE3}
\definecolor{BackgroundBeige}{HTML}{FDF6E3}
\definecolor{BackgroundYellow}{HTML}{FEFBDF}
\definecolor{SolarizedGrey}{HTML}{657B83}
\definecolor{CornellRed}{HTML}{B31B1B}
\definecolor{CppGold}{HTML}{b38000}
\definecolor{PythonBlue}{HTML}{3675a9} 

\lstset{frame=single,
  language=Java,
  columns=flexible,
  showspaces=false,
  showtabs=false,
  breaklines=true,
  showstringspaces=false,
  numbers=left,
  numberstyle=\tiny\color{gray},
  stepnumber=1,
  numbersep=8pt, 
  numberstyle=\color{SolarizedGrey},
  breakatwhitespace=true,
  commentstyle=\color{gray}\upshape,
  keywordstyle=\color{pblue},
  stringstyle=\color{dkgreen},
  basicstyle={\linespread{1}\small\ttfamily},
  tabsize=3,
  moredelim=[il][\textcolor{pgrey}]{$$},
  moredelim=[is][\textcolor{pgrey}]{\%\%}{\%\%}
}

\lstdefinelanguage{Java}{%
  tabsize=4,
  showstringspaces=false,
  mathescape=true,
  breaklines=true,
  numbers=left,
  keywords={%
    abstract, continue, for, new, switch, assert, default, goto, package,
    synchronized, boolean, do, if, private, this, break, double, implements,
    protected, throw, byte, else, import, public, throws, case, enum,
    instanceof, return, transient, catch, extends, int, short, try, char,
    final, interface, static, void, class, finally, long, strictfp, volatile,
    const, float, native, super, while
  },
  keywords=[2]{%
  },
  morestring=[b]",
  morestring=[b]',
  morecomment=[l]{//},
  morecomment=[s]{/*}{*/},
  keywordstyle=[2]\color{DarkOrchid},
  numberstyle=\color{SolarizedGrey}
}

\lstdefinelanguage{JavaScript}{
  keywords={typeof, new, true, false, catch, function, return, null, catch, switch, var, const, let, async, await, if, in, while, do, else, case, break, from},
  ndkeywords={class, export, boolean, throw, implements, import, this},
  sensitive=false,
  comment=[l]{//},
  morecomment=[s]{/*}{*/},
  morestring=[b]',
  morestring=[b]"
}


\lstdefinelanguage{XML}
{
  morestring=[s]{"}{"},
  morecomment=[s]{?}{?},
  morecomment=[s]{!--}{--},
  moredelim=[s][\color{black}]{>}{<},
  moredelim=[s][\color{pblue}]{\ }{=},
  identifierstyle=\color{darkblue}
}
%\renewcommand{\lstlistingname}{Source}% Listing -> Source-code
%\renewcommand{\lstlistlistingname}{List of \lstlistingname s}% List of Listings -> List of Source-code
\hypersetup{pdfpagemode=UseNone}
\AtBeginDocument{
  \hypersetup{
    pdftitle = {\@title},
    pdfauthor = {\@author},
  }
}
\RequirePackage[toc,acronym]{glossaries}

\RequirePackage{graphicx}
\RequirePackage[scriptsize]{caption}
\RequirePackage{subcaption}
\RequirePackage{charter} 
\RequirePackage{IEEEtrantools}
\RequirePackage{sectsty}
\RequirePackage{csquotes}
\RequirePackage[bf,big,raggedright]{titlesec}

\setcounter{secnumdepth}{3}
%\setcounter{tocdepth}{5}

\defglsdisplayfirst[\acronymtype]{#1#4\index{#1}}
\defglsdisplayfirst[\glsdefaulttype]{#1#4\index{#1}}

%Reference: https://tex.stackexchange.com/questions/247035/adding-chapter-prefix-for-appendix
\titleformat{\chapter}[display]%
    {\raggedright\huge\bfseries}% global formatting (number and title)
    {\ifnum\pdfstrcmp{\@currenvir}{appendices}=0
        Appendix \thechapter
  	  \else
        Chapter \thechapter
  	  \fi}% label: number and its formatting
    {10pt}% spacing between number and title
    {}% optional (content between number and title)
\titlespacing*{\chapter}
    {0pt}% left
    {40pt}% before
    {15pt}% after

%Following can be used within the .tex file as well but
%before doing so uncomment the makeatletter and makeatother macros.
%%http://www.michaelshell.org/tex/ieeetran/bibtex/
%%\makeatletter
%\def\bstctlcite{\@ifnextchar[{\@bstctlcite}{\@bstctlcite[@auxout]}}
%\def\@bstctlcite[#1]#2{\@bsphack
%  \@for\@citeb:=#2\do{%
%    \edef\@citeb{\expandafter\@firstofone\@citeb}%
%    \if@filesw\immediate\write\csname #1\endcsname{\string\citation{\@citeb}}\fi}%
%  \@esphack}
%%\makeatother

%\captionsetup{font=scriptsize,labelfont=scriptsize}
\hyphenpenalty 5000
\exhyphenpenalty 5000

\newcommand\T{\rule{0pt}{2.6ex}}       % Top strut
\newcommand\B{\rule[-1.2ex]{0pt}{0pt}} % Bottom strut

\newcolumntype{L}[1]{>{\RaggedRight\hspace{0pt}}p{#1}}
\newcolumntype{R}[1]{>{\RaggedLeft\hspace{0pt}}p{#1}}

\author{Author's name}
\title{Thesis Title}

\doublespacing

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%					ryersonSGSThesis						 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{ryersonSGSThesis}{%begin ryersonSGSThesis
\bibliographystyle{IEEEtran}
\bstctlcite{IEEEexample:BSTcontrol}
\newgeometry{left=1in,right=1in,top=2in,bottom=1.25in}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Front matter                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\frontmatter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     1. Title page                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\begin{titlepage}
   \begin{center}
   \textsc{\large \@title}\\
   \vfill
   by\\
   \vfill
   
   {
   \large \@author \\
   \@ifundefined{@pastDegreeA}{
		\empty
		\ClassWarning {ryersonSGSThesis} {No past degree set. Use `setPastDegreeA' etc. commands}
   }{
		\@pastDegreeA\\
   }
   \@ifundefined{@pastDegreeB}{\empty}{\@pastDegreeB\\}
   \@ifundefined{@pastDegreeC}{\empty}{\@pastDegreeC\\}
   \@ifundefined{@pastDegreeD}{\empty}{\@pastDegreeD\\}
   }

   \vfill
   A dissertation\\
   presented to \@university\\
   in partial fulfillment of\\
   the requirements for the degree of\\
   \@thesisDegree\\
   in the Program of\\
   \@department\\
   \vfill
   \@location, \@thesisYear\\
   \copyright\ \@author, \@thesisYear \\
   All Rights Reserved\\
   \end{center}
\end{titlepage}

\restoregeometry

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    2. Author's declaration                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\@ifundefined{@authorsDeclarationText}{
	\empty
	\ClassWarning {ryersonSGSThesis} {No author's declaration. Use `setAuthorsDeclaration' commnad}
}{
\section*{\centering{Author's Declaration For Electronic Submission Of A Dissertation}}
\@authorsDeclarationText
\clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    3. Abstract                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% author and thesis details on top
\begin{center}
   \setcounter{page}{2}
   \textsc{\large \@title}\\
   \large \@author \\
   \@thesisDegree \\
   \@department \\
   \@university, \@thesisYear
\end{center}

% abstract text
\@ifundefined{@abstractText}{
	\empty
	\ClassWarning {ryersonSGSThesis} {No abstract set. Use `setAbstract' command}
}{
\section*{\centering{Abstract}}
\@abstractText
\clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    4. Acknowledgements                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\@ifundefined{@acknowledgements}{
	\empty
	\ClassWarning {ryersonSGSThesis} {No acknowledgements set. Use `setAcknowledgements' command}
}{
\section*{\centering{Acknowledgments}}
\@acknowledgements
\clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    5. Dedication                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\@ifundefined{@dedication}{
	\empty
	\ClassWarning {ryersonSGSThesis} {No dedication set. Use `setDedication' command}
}{
\section*{\centering{Dedication}}
    \vspace*{\fill}
    \begin{flushright}
    \textit{\@dedication}
    \end{flushright}
    \vspace*{\fill}
	\clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    6. Table of contents                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\tableofcontents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    7. List of Tables                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\listoftables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    9. List of Figures                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\listoffigures

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    9. List of Listings                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\lstlistoflistings

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    9. List of Algorithms                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\listofalgorithms

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Main body                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\clearpage % for page numbering. Main body (Introduction) should be page 1
\mainmatter
}
%*****************end ryersonSGSThesis************************

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Back matter                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\backmatter
