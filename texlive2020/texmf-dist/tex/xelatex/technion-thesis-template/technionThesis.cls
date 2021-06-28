% technionThesis         
% Written by Boaz Shuval. 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{technionThesis}[2019/1/28 Class for Technion thesis]
% This is a template for writing a thesis according to the Technion specifications. 
% Version: 1.0

% NOTE: There is a bug in the memoir package in TEXLIVE 2018. 
% Therefore, it is advised to compile using TEXLIVE 2017. 
% The current (As of January 2019) version of overleaf runs TEXLIVE 2017. 


\LoadClass[a4paper, 11pt, twoside, extrafontsizes]{memoir}

% Support for `if' commands: \newtoggle, \toggletrue, \togglefalse, \iftoggle, etc. 
\RequirePackage{etoolbox}
\RequirePackage{xifthen}


\newboolean{addpublist}         \setboolean{addpublist}{false}
\newboolean{addacknowledgments} \setboolean{addacknowledgments}{false}
\newboolean{firstpar}           \setboolean{firstpar}{false}
\newboolean{advisementif}       \setboolean{advisementif}{false}
\newboolean{uselibertine}        \setboolean{uselibertine}{false}

% %%% OPTIONS
\newif\if@loadhyperref
\DeclareOption{hyperref}{\@loadhyperreftrue}
\DeclareOption{publist}{\setboolean{addpublist}{true}}
\DeclareOption{addack}{\setboolean{addacknowledgments}{true}}
\DeclareOption{advisement}{\setboolean{advisementif}{true}}
\DeclareOption{spacepar}{\nonzeroparskip}
\DeclareOption{firstparindent}{\setboolean{firstpar}{true}} % Indent first paragraph of chapter/section
\DeclareOption{libertine}{\setboolean{uselibertine}{true}}
\ProcessOptions\relax



\PassOptionsToPackage{no-math}{fontspec}

% Fix \left \right spacing
\let\originalleft\left
\let\originalright\right
\renewcommand{\left}{\mathopen{}\mathclose\bgroup\originalleft}
\renewcommand{\right}{\aftergroup\egroup\originalright}
    
% Load fonts/symbols.
\RequirePackage[T1]{fontenc}
\RequirePackage{centernot}
\RequirePackage{textcomp}
\RequirePackage{calc}
\RequirePackage[cmex10]{mathtools} %cmex10 is needed for IEEEtran class
%This also loads amsmath, and pass cmex10 to it.                 
\interdisplaylinepenalty=2500   % Allows breaking aligned equations among pages.
\RequirePackage{amssymb,amsthm}
\RequirePackage{thmtools}

\ifthenelse{\boolean{uselibertine}}{%
\RequirePackage[libertine, noamssymbols,cmbraces, liby]{newtxmath}
\RequirePackage[no-math]{fontspec}
\RequirePackage{libertine}
\RequirePackage{cabin}
\setmonofont[Mapping=tex-text]{Inconsolata}
\RequirePackage{eucal}
\DeclareFontFamily{U}{fplmbb}{}
\DeclareFontShape{U}{fplmbb}{m}{n}{<-> fplmbb}{}
\DeclareMathAlphabet{\mathbb}{U}{fplmbb}{m}{n}
}{}

% Black square at end of proof:
\renewcommand{\qedsymbol}{\ensuremath{\blacksquare}}

\RequirePackage[nodayofweek,short]{datetime}

% Including graphics, enabling subfigure environments
\RequirePackage{graphicx}
\RequirePackage[caption = false]{subfig} 
% see https://danangcity45.wordpress.com/2015/05/13/figures-subfigures-and-tables-in-latex/
% This also enables \begin{subtable} with the same syntax. 

% Tikz is useful for LaTeX drawings, inserting Matlab figures, etc. 
\RequirePackage{tikz} %Also loads xcolor
\RequirePackage{pgfplots}
\usetikzlibrary{decorations.markings, decorations.pathreplacing, shapes.misc, shapes.arrows, arrows, arrows.meta}
\usetikzlibrary{calc, intersections, patterns, positioning, fit}

\RequirePackage{stackrel} % Extends LaTeX's stackrel to support above and below: \stackrel[below]{above}{sign/arrow/etc}
\RequirePackage{accents}  % Adds ability to generate new accents for symbols. 

% For defining abbreviations that determine spacing after them 
\RequirePackage{xspace}
% Support for tabbing environments
\RequirePackage{tabto}

% For adding algorithms 
\usepackage[ruled,vlined]{algorithm2e}
% Fix algorithm numbering
\renewcommand{\thealgocf}{\arabic{chapter}.\arabic{algocf}}

% Adding urls
\RequirePackage{url}

% Tables:
\RequirePackage{longtable}  % Tabular environemnt longer than one page, useful for the abstract
% Nicer tables using top/mid/bottom rules. 
% Guidelines: Do not use vertical or double lines, ever. This package adds the
% (*) \toprule (thick line above table), 
% (*) \midrule (thin line mid table), 
% (*) \cmidrule{x-y} (thin line spanning columns x-y), 
% (*) \bottomrule commands (thick line beneath table).
\RequirePackage{booktabs}
\RequirePackage{multirow} % Multirow support:


%%%% Environments
% (proof environment is defined by amsmath or amsthm so no need to define it)
\theoremstyle{plain} % Header bold, numbered, Text in italics
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{lemma}[theorem]{Lemma} % Numbering based on "theorem"
\newtheorem{proposition}[theorem]{Proposition} % Numbering based on "theorem"
\newtheorem{corollary}[theorem]{Corollary} % Numbering based on "theorem"
\newtheorem{conjecture}{Conjecture}

\theoremstyle{definition} % Header bold, numbered, text normal
\newtheorem{definition}{Definition}[chapter]
\newtheorem{example}{Example}[chapter]
\newtheorem{assumption}{Assumption}[chapter]
\renewcommand{\theassumption}{\Alph{assumption}}
\newtheorem{condition}{Condition}
\renewcommand{\thecondition}{\Alph{condition}}

\theoremstyle{remark} % Header in italics, numbered, text normal
\newtheorem{remark}{Remark}[chapter]
\newtheorem{question}{Question}
\newtheorem*{discussion}{Discussion}


% Usage: \begin{example}[continues= <label of continued example/theorem, etc.>]
\renewcommand\thmcontinues[1]{Continued}




% OPTION handling:
\if@loadhyperref
  \RequirePackage[colorlinks = true]{hyperref}
\fi


\newcommand{\advorsup}{Supervision\xspace}
\ifthenelse{\boolean{advisementif}}{\renewcommand{\advorsup}{Advisement\xspace}}{}

% Hebrew is mandatory
\usepackage{polyglossia}
\setdefaultlanguage{english}
\setotherlanguage{hebrew}
\newfontfamily\hebrewfont[Script=Hebrew]{David CLM}
\RequirePackage{hebrewcal} % Hebrew calendar calculations

% Clever references that include the reference header (figure, table): cref or Cref (capitalized):
% Must be loaded after hyperref to work correctly. 

\RequirePackage[noabbrev,capitalise]{cleveref}
\crefname{assumption}{assumption}{assumptions}
\Crefname{assumption}{Assumption}{Assumptions}
\crefname{condition}{condition}{conditions}
\Crefname{condition}{Condition}{Conditions}

     
% Add the IEEEeqnarray command, as well as the IEEE reference style
\RequirePackage{IEEEtrantools}
\RequirePackage[noadjust]{cite}

% Fix how far the IEEEproof environment is indented
\patchcmd{\IEEEproofindentspace}{2\parindent}{\parindent}{}{}

% Date handling

\def\HebrewMonthNameInEnglishTechnion#1#2{%
    \ifnum #1 = 7%
    \@CheckLeapHebrewYear{#2}%
        \if@HebrewLeap Adar bet\else Adar\fi%
    \else%
        \ifcase #1%
            % nothing for 0
            \or Tishrei%
            \or Chesvan%
            \or Kislev%
            \or Tevet%
            \or Shebat%
            \or Adar aleph%
            \or Adar bet%
            \or Nisan%
            \or Iyar%
            \or Sivan%
            \or Tammuz%
            \or Av%
            \or Elul%
        \fi
    \fi}

\newcommand\engmonthname[1]{%
  \ifcase#1\or January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi}
\newcommand\engmonthnamehebrew[1]{%
  \ifcase#1\or ינואר\or פברואר\or מרץ\or אפריל\or מאי\or יוני\or
  יולי\or אוגוסט\or ספטמבר\or אוקטובר\or נובמבר\or דצמבר\fi}

% Registers for date handling. Default to current day,month,year
\newcount\engday    \engday = \day
\newcount\engmonth  \engmonth = \month
\newcount\engyear   \engyear = \year
\newcount\hebday   
\newcount\hebmonth 
\newcount\hebyear  

\HebrewFromGregorian{\engday}{\engmonth}{\engyear}{\hebday}{\hebmonth}{\hebyear}
\newcommand{\ThesisSubmitDate}[3]{% #1 = day, #2 = month, #3 = year
    \engday = #1
    \engmonth = #2
    \engyear = #3
    \HebrewFromGregorian{\engday}{\engmonth}{\engyear}{\hebday}{\hebmonth}{\hebyear}
}


% Setup details in Hebrew 
\newcommand{\AuthorEnglish}{Author Name}
\newcommand{\AdvisorEnglish}{Advisor Name}
\newcommand{\AdvisorTitleEnglish}{Professor}
\newcommand{\TitleEnglish}{Thesis Title}
\newcommand{\DegreeEnglish}{Doctor of Philosophy} % OR: Master of Science
\newcommand{\MonthEnglish}{\engmonthname{\engmonth}}
\newcommand{\YearEnglish}{\the\engyear}
\newcommand{\JewishMonthEnglish}{\HebrewMonthNameInEnglishTechnion{\hebmonth}{\hebyear}}
\newcommand{\JewishYearEnglish}{\the\hebyear}
\newcommand{\FacultyEnglish}{My Faculty}
\newcommand{\FinancialEnglish}{The generous financial help of the Technion is gratefully acknowledged.}
% Setup details in Hebrew:
\newcommand{\AuthorHebrew}{שם המחבר}
\newcommand{\AdvisorHebrew}{שם המנחה}
\newcommand{\AdvisorTitleHebrew}{פרופסור}
\newcommand{\TitleHebrew}{כותרת התיזה}
\newcommand{\DegreeHebrew}{דוקטור לפילוסופיה} % OR: מגיסטר למדעים
\newcommand{\MonthHebrew}{\engmonthnamehebrew{\engmonth}}
\newcommand{\YearHebrew}{\the\engyear}
\newcommand{\JewishMonthHebrew}{\HebrewMonthName{\hebmonth}{\hebyear}}
\newcommand{\JewishYearHebrew}{\HebrewYearName{\hebyear}}
\newcommand{\FacultyHebrew}{הפקולטה שלי}
\newcommand{\FinancialHebrew}{אני מודה לטכניון על התמיכה הכספית הנדיבה בהשתלמותי.}

\newcommand{\PubListEnglish}{%
    \begin{itemize}
        \item Publication 1.  \\ 
            \Cref{chap_first} is based on this paper.  
        \item Publication 2.  \\ 
            \Cref{chap_second} is based on this paper.  
\end{itemize}}

\newcommand{\PubListHebrew}{%
\begin{english}
    \begin{itemize}
        \item First publication.
            \vspace{-1em}
             \begin{flushright}
                 \texthebrew{פרק \ref{chap_first} מבוסס על מאמר זה.} 
            \end{flushright}
        \item Second publication.
            \vspace{-1em}
             \begin{flushright}
                 \texthebrew{פרק \ref{chap_second} מבוסס על מאמר זה.} 
            \end{flushright}
    \end{itemize}
\end{english}}


% Setup thesis style

%  Set margins: 
\setlrmarginsandblock{2.5cm}{3.25cm}{*}
\setulmarginsandblock{2.5cm}{*}{1}
\checkandfixthelayout 

% Turn on subsection numbering
\setsecnumdepth{subsection} 

% Name of TOC
\renewcommand{\contentsname}{Table of Contents}
% TOC page unnumbered
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{empty}}}
\AtBeginDocument{\addtocontents{lof}{\protect\thispagestyle{empty}}}
\AtBeginDocument{\addtocontents{lot}{\protect\thispagestyle{empty}}}

% Let LaTeX be less stringent about word spacing
\midsloppy

% Caption heading setup
\captionnamefont{\footnotesize\scshape \bfseries}  
\captionstyle[\raggedright]{} 
\captiontitlefont{\footnotesize}  


\makeatletter
\def\moverlay{\mathpalette\mov@rlay}
\def\mov@rlay#1#2{\leavevmode\vtop{%
   \baselineskip\z@skip \lineskiplimit-\maxdimen
   \ialign{\hfil$\m@th#1##$\hfil\cr#2\crcr}}}
\newcommand{\charfusion}[3][\mathord]{
    #1{\ifx#1\mathop\vphantom{#2}\fi
        \mathpalette\mov@rlay{#2\cr#3}
      }
    \ifx#1\mathop\expandafter\displaylimits\fi}
\makeatother


% Setup chapter headings format: 
% Modified from the BlueBox style in https://ctan.org/pkg/memoirchapterstyles.
\newsavebox{\ChpNumBox}
\definecolor{ChapBlue}{rgb}{0.00,0.7,0.7}
\makeatletter
\newcommand*{\thickhrulefill}{\leavevmode\leaders\hrule height 2\p@ \hfill \kern \z@}
\newcommand*\BuildChpNum[2]{
  \begin{tabular}[t]{@{}c@{}}
    \makebox[0pt][c]{#1\strut}  \\[.5ex]
    \colorbox{ChapBlue}{
      \rule[-10em]{0pt}{0pt}
      \rule{1ex}{0pt}\makebox[1cm][c]{\color{black}#2\strut}
      \rule{1ex}{0pt}}
  \end{tabular}}
\makechapterstyle{BlueBox}{
  \renewcommand{\chapnamefont}{\large\scshape}
  \renewcommand{\chapnumfont}{\Huge\bfseries\sffamily}
  \renewcommand{\chaptitlefont}{\raggedright\Huge\bfseries\sffamily}
  \setlength{\beforechapskip}{20pt}
  \setlength{\midchapskip}{26pt}
  \setlength{\afterchapskip}{40pt}
  \renewcommand{\printchaptername}{}
  \renewcommand{\chapternamenum}{}
  \renewcommand{\printchapternum}{\sbox{\ChpNumBox}{\BuildChpNum{\chapnamefont\vphantom\@chapapp}{\chapnumfont\thechapter}}}
  \renewcommand{\printchapternonum}{\sbox{\ChpNumBox}{\BuildChpNum{\chapnamefont\vphantom{\@chapapp}}{\chapnumfont\hphantom{\thechapter}}}}
  \renewcommand{\afterchapternum}{}%
  \renewcommand{\printchaptertitle}[1]{%
    \usebox{\ChpNumBox}\hfill
    \parbox[t]{\hsize-\wd\ChpNumBox-1em}{%
      \vspace{\midchapskip}%
      \thickhrulefill\par
      \chaptitlefont ##1\par}}%
}
\chapterstyle{BlueBox}

% Setup Thesis first page
\newlength{\drop}
\newcommand*{\titleGM}{\begingroup% Gentle Madness
    \drop = 0.1\textheight
    \vspace*{\baselineskip}
    \vfill
    \hbox{%
        % \parbox[c]{0.1\textwidth}
        % {\color{ChapBlue}\rule{1ex}{0.9\textheight}}
        \parbox[c]{1.0\textwidth}{
            \vbox{%
                \begin{center}
                    \vfill
                    {\noindent\HUGE\bfseries\sffamily \TitleEnglish}

                    \vspace{7\baselineskip}

                    {\LARGE\itshape Research Thesis in Partial Fulfillment of the Requiremenets for the Degree of \DegreeEnglish}

                    \vspace{7\baselineskip}

                    {\HUGE \sffamily \noindent \AuthorEnglish}

                    \vspace{7\baselineskip}

                    {\Large Submitted to the Senate of the Technion --- Israel Institute of Technology  \\[0.2cm] 
                    \JewishMonthEnglish{}, \JewishYearEnglish{}, \quad Haifa, \quad  \MonthEnglish{}, \YearEnglish{}}
                    \vfill
                \end{center}
            }% end of vbox
        }% end of parbox
    }% end of hbox
    \vfill
    \vspace*{2\baselineskip}
    \null
\endgroup}


% Setup Thesis title page
\newcommand*{\titleGMF}{\begingroup% Gentle Madness
    \drop = 0.1\textheight
    \vspace*{\baselineskip}
    \vfill
    \hbox{%
        % \parbox[c]{0.1\textwidth}
        % {\color{ChapBlue}\rule{1ex}{0.9\textheight}}
        \parbox[c]{1.0\textwidth}{
            \vbox{%
                \begin{center}
                    \vfill
                    {\noindent\HUGE\bfseries\sffamily \TitleEnglish}

                    \vspace{14\baselineskip}

                    {\HUGE \sffamily \noindent \AuthorEnglish}
                    \vfill
                \end{center}
            }% end of vbox
        }% end of parbox
    }% end of hbox
    \vfill
    \vspace*{2\baselineskip}
    \null
\endgroup}

% Setup front page verso
\newcommand*{\frontpageverso}{\begingroup%
    \noindent
    This Research Thesis was Done under the \advorsup of \AdvisorTitleEnglish{} \AdvisorEnglish{}, in the Faculty of \FacultyEnglish{}. 
    \vfill                       
    \ifthenelse{\boolean{addpublist}}{%
    \section*{List of Publications}
    Some of the results presented in this thesis have been published or submitted for publication. These are: 
    \PubListEnglish{}
    \vfill
}{}
    \noindent \FinancialEnglish
\endgroup}


% Command for English title pages

\newcommand*{\makeTitleEnglish}{%
\pagestyle{empty}
\frontmatter
\titleGMF       \cleardoublepage
\titleGM        \clearpage
\frontpageverso \clearpage
\ifthenelse{\boolean{addacknowledgments}}{%
    \section*{Acknowledgments}
    \input{acknowledgments}
    \cleardoublepage
}{}

\tableofcontents* \cleardoublepage
\listoffigures*   \cleardoublepage
\listoftables*    \cleardoublepage

\pagestyle{ruled}
\mainmatter
}





% Setup Hebrew front matter
\newcommand*{\titleGMHebrew}{\begingroup% Gentle Madness
    \drop = 0.1\textheight
    \vspace*{\baselineskip}
    \vfill
    \hbox{%
        \parbox[c]{1.0\textwidth}{
            \vbox{%
                \begin{center}
                    \vfill
                    {\noindent\HUGE\bfseries \TitleHebrew}
                    
                    \vspace{7\baselineskip}
                    
                    {\LARGE\itshape חיבור על מחקר לשם מילוי חלקי של הדרישות לקבלת התואר \DegreeHebrew}

                    \vspace{7\baselineskip}

                    {\HUGE \noindent \AuthorHebrew}

                    \vspace{7\baselineskip}

                    {\Large הוגש לסנט הטכניון \textenglish{---} מכון טכנולוגי לישראל \\[0.2cm] 
                    \JewishMonthHebrew{} \JewishYearHebrew{}, \quad חיפה, \quad  \MonthHebrew{} \YearHebrew{}}
                    \vfill
                \end{center}
            }% end of vbox
        }% end of parbox
        % \parbox[c]{0.1\textwidth}{\color{ChapBlue}\rule{1ex}{0.9\textheight}}
    }% end of hbox
    \vfill
    \vspace*{2\baselineskip}
    \null
\endgroup}

% Setup Hebrew title page
\newcommand*{\titleGMFHebrew}{\begingroup% Gentle Madness
    \drop = 0.1\textheight
    \vspace*{\baselineskip}
    \vfill
    \hbox{%
        \parbox[c]{1.0\textwidth}{
            \vbox{%
                \begin{center}
                    \vfill
                    {\noindent\HUGE\bfseries \TitleHebrew}

                    \vspace{14\baselineskip}

                    {\HUGE \noindent \AuthorHebrew}
                    \vfill
                \end{center}
            }% end of vbox
        }% end of parbox
        % \parbox[c]{0.1\textwidth}{\color{ChapBlue}\rule{1ex}{0.9\textheight}}
    }% end of hbox
    \vfill
    \vspace*{2\baselineskip}
    \null
\endgroup}

% Setup Hebrew front page verso
\newcommand*{\frontpageversohebrew}{\begingroup%
    \noindent המחקר נעשה בהנחיית \AdvisorTitleHebrew{} \AdvisorHebrew{} בפקולטה ל\FacultyHebrew{}. 
\vfill
\ifthenelse{\boolean{addpublist}}{%
\section*{\hebrewfont רשימת פרסומים}
חלק מהתוצאות המופיעות בחיבור זה פורסמו או הוגשו לפרסום, כדלקמן.  
\PubListHebrew{}
\vfill
}
{}
\FinancialHebrew
\endgroup}



% Reverse pages of Hebrew part
% see https://tex.stackexchange.com/a/25142 
\RequirePackage{atbegshi}

\newif\ifRP%
\newbox\RPbox%
\setbox\RPbox\vbox{\vskip1pt}%
\AtBeginShipout{%
    \ifRP
    \AtBeginShipoutDiscard%
    \global\setbox\RPbox\vbox{\unvbox\RPbox
        \box\AtBeginShipoutBox\kern\c@page sp}%
    \fi
}%
\renewcommand{\RPtrue}{%
    \clearpage
    \ifRP\RPfalse\fi
    \global\let\ifRP\iftrue
}%
\let\reversepageorder=\RPtrue%
\renewcommand{\RPfalse}{%
    \clearpage
    \global\let\ifRP\iffalse
    \setbox\RPbox\vbox{\unvbox\RPbox
        \def\protect{\noexpand\protect\noexpand}%
        \@whilesw\ifdim0pt=\lastskip\fi
        {\c@page\lastkern\unkern\shipout\lastbox}%
    }%
}%
\let\resumenormalpageorder=\RPfalse%



% Command for Hebrew title pages
\newcommand*{\makeTitleHebrew}{%
\backmatter
\reversepageorder

\begin{hebrew}
    \pagestyle{empty}
\titleGMFHebrew       \cleardoublepage
\titleGMHebrew        \clearpage
\frontpageversohebrew \clearpage
\ifthenelse{\boolean{addacknowledgments}}{%
    \section*{\hebrewfont תודות}
    \input{hacknowledgments}
    \cleardoublepage
}{}

\pagestyle{plain}
\pagenumbering{roman}
\chapter*{\hebrewfont תקציר \hfill\textcolor{white}{.}}
\input{habstract} \clearpage
\end{hebrew}

\resumenormalpageorder
}


                                        
\RequirePackage{metalogo}

\ifthenelse{\boolean{firstpar}}{\RequirePackage{indentfirst}}{}
