%%
%% This is file `resphilosophica.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% resphilosophica.dtx  (with options: `class')
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from resphilosophica.cls.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file resphilosophica.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resphilosophica}
[2013/01/08 v1.11 Typesetting articles for Res Philosophica]
\RequirePackage{xkeyval}
\newif\ifRESP@fontauto
\RESP@fontautotrue
\newif\ifRESP@rpfontauto
\RESP@rpfontautotrue
\newif\ifRESP@lsabon
\RESP@lsabonfalse
\newif\ifRESP@mtshadow
\RESP@mtshadowfalse
\define@choicekey*+{resphilosophica.cls}{bodyfont}[\val\nr]{auto,
  sabon, lsabon, cm}[auto]{%
  \ifcase\nr\relax
    \RESP@fontautotrue
  \or
    \RESP@fontautofalse
    \RESP@lsabontrue
  \or
    \RESP@fontautofalse
    \RESP@lsabontrue
  \or
    \RESP@fontautofalse
    \RESP@lsabonfalse
  \fi}{%
  \PackageWarning{resphilosophica}{The option bodyfont must be auto,
    sabon or cm.  Using auto}\RESP@fontautotrue}
\define@choicekey*+{resphilosophica.cls}{rpfont}[\val\nr]{auto,
  imprint, imprintshadow, cm}[auto]{%
  \ifcase\nr\relax
    \RESP@rpfontautotrue
  \or
    \RESP@rpfontautofalse
    \RESP@mtshadowtrue
  \or
    \RESP@rpfontautofalse
    \RESP@mtshadowtrue
  \or
    \RESP@rpfontautofalse
    \RESP@mtshadowfalse
  \fi}{%
  \PackageWarning{resphilosophica}{The option rpfont must be auto,
    imprintshadow or cm.  Using auto}\RESP@rpfontautotrue}
\define@boolkey+{resphilosophica.cls}[RESP@]{natbib}[tue]{}{%
  \PackageWarning{resphilosophica}{The option natbib must be
    yes or no.  Using yes}}
\RESP@natbibtrue
\long\def\RESP@size@warning#1{%
  \ClassWarning{RESPart}{Size-changing option #1 will not be
    honored}}%
\DeclareOptionX{8pt}{\RESP@size@warning{\CurrentOption}}%
\DeclareOptionX{9pt}{\RESP@size@warning{\CurrentOption}}%
\DeclareOptionX{10pt}{\RESP@size@warning{\CurrentOption}}%
\DeclareOptionX{11pt}{\RESP@size@warning{\CurrentOption}}%
\DeclareOptionX{12pt}{\RESP@size@warning{\CurrentOption}}%
\newif\ifRESP@manuscript
\RESP@manuscriptfalse
\DeclareOptionX{manuscript}{\RESP@manuscripttrue}
\newif\ifRESP@screen
\RESP@screenfalse
\DeclareOptionX{screen}{\RESP@screentrue}
\DeclareOptionX{*}{\PassOptionsToClass{\CurrentOption}{amsart}}
\ProcessOptionsX
\LoadClass[noamsfonts]{amsart}
\RequirePackage{microtype, fancyhdr, xcolor, lastpage}
\RequirePackage[bottom,multiple]{footmisc}
\RequirePackage[hyperfootnotes=false]{hyperref}
\urlstyle{rm}
\ifRESP@manuscript\hypersetup{colorlinks,allcolors=blue}\else
   \ifRESP@screen\hypersetup{colorlinks,allcolors=blue}\else
   \hypersetup{hidelinks}\fi\fi
\ifRESP@fontauto
  \IfFileExists{t1lsb.fd}{\RESP@lsabontrue}{\RESP@lsabonfalse}\fi
\ifRESP@lsabon
  \RequirePackage[mdugm]{mathdesign}
  \RequirePackage[rmdefault]{lsabon}
  \renewcommand\scdefault{sc}
\fi
\ifRESP@rpfontauto
  \IfFileExists{t1miih.fd}{\RESP@mtshadowtrue}{\RESP@mtshadowfalse}\fi
\ifRESP@mtshadow
  \def\rpdefault{miih}\else
  \def\rpdefault{\rmdefault}\fi
\def\AddtoEndMatter#1{\g@addto@macro\enddoc@text{#1}}
\ifRESP@natbib
  \RequirePackage[round]{natbib}
  \AtEndDocument{\bibliographystyle{resphilosophica}}
  \let\RESP@bibliography=\bibliography
  \def\bibliography#1{\AddtoEndMatter{\RESP@bibliography{#1}}}
  \def\bibsection{\par\addpenalty\@secpenalty\addvspace{\bigskipamount}%
    \noindent \Small References:\par\nobreak\vskip\medskipamount\@afterheading}
  \def\bibfont{\Small}
\fi
\ifRESP@manuscript\else
\AtBeginDocument{\setlength{\pdfpagewidth}{432bp}%
  \setlength{\pdfpageheight}{648bp}}
\fi
\setlength{\textwidth}{318pt}
\setlength{\textheight}{540pt}
\setlength{\evensidemargin}{-18pt}
\setlength{\oddsidemargin}{\evensidemargin}
\setlength{\topmargin}{-48pt}
\listisep\medskipamount
\setlength{\headsep}{14pt}
\setlength{\headheight}{12pt}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\setlength{\footskip}{20pt}
\ifRESP@manuscript
  \newsavebox{\RESP@linecount}
  \savebox{\RESP@linecount}[4em][t]{\parbox[t]{4em}{%
      \@tempcnta\@ne\relax
      \loop{\color{red}\scriptsize\the\@tempcnta}\\
      \advance\@tempcnta by \@ne\ifnum\@tempcnta<47\repeat}}
\fi
\pagestyle{fancy}
\fancyhead{}
\fancyfoot{}
\fancyhead[LE]{\footnotesize\thepage\qquad\itshape\shortauthors}
\fancyhead[RO]{\footnotesize\textit{\shorttitle}\qquad\thepage}
\ifRESP@manuscript
  \fancyhead[LE]{\begin{picture}(0,0)%
      \put(-26,-22){\usebox{\RESP@linecount}}%
    \end{picture}\footnotesize\thepage\qquad\itshape\shortauthors}
  \fancyhead[LO]{\begin{picture}(0,0)%
      \put(-21,-22){\usebox{\RESP@linecount}}%
    \end{picture}}
  \fancyfoot[C]{\scriptsize\color{red}Author's Proof}
\fi
\fancypagestyle{firstpage}{%
  \fancyhf{}%
  \ifRESP@manuscript
    \lhead{\begin{picture}(0,0)%
        \put(-26,-20){\usebox{\RESP@linecount}}%
      \end{picture}}
  \fi
  \cfoot{\footnotesize{\fontfamily{\rpdefault}\selectfont Res Philosophica,}
    \itshape Vol.~\currentvolume, No.~\currentissue,
      \currentmonth~\currentyear, pp.~\start@page--\end@page
      \ifx\@doinumber\@empty\else\\%
      \doi{\@doinumber}\fi
      \\
  \@copyrightnote}}
\def\volumenumber#1{\def\currentvolume{#1}}
\volumenumber{00}
\def\issuenumber#1{\def\currentissue{#1}}
\issuenumber{0--0}
\def\publicationyear#1{\def\currentyear{#1}}
\publicationyear{2090}
\def\publicationmonth#1{\def\currentmonth{#1}}
\publicationmonth{January--February}
\def\papernumber#1{\def\currentpaper{#1}}
\papernumber{0000}
\def\doinumber#1{\gdef\@doinumber{#1}}
\doinumber{10.11612/resphil.\currentyear.\currentvolume.\currentissue.\currentpaper}
\def\startpage#1{\pagenumbering{arabic}\setcounter{page}{#1}%
  \def\start@page{#1}%
  \ifnum\c@page<\z@ \pagenumbering{roman}\setcounter{page}{-#1}%
    \def\start@page{\romannumeral#1}%
  \fi}
\def\endpage#1{\def\@tempa{#1}%
  \ifx\@tempa\@empty\def\end@page{\pageref{LastPage}}%
  \else\def\end@page{#1}\fi}
\def\pagespan#1#2{\startpage{#1}\endpage{#2}}
\pagespan{1}{}
\def\articleentry#1#2#3#4{\@tempcnta=#4\relax
  \advance\@tempcnta by 1\relax
  \ifodd\the\@tempcnta\else\advance\@tempcnta by 1\relax\fi
  \startpage{\the\@tempcnta}}
\def\prevpaper#1{\IfFileExists{#1.rpi}{%
    \ClassInfo{resphilosophica}{%
      Reading first page number from the file #1.rpi}%
    \input{#1.rpi}%
  }{\ClassWarning{resphilosophica}{Cannot find the file #1.rpi.
      Did you run latex on the previous paper?}}}
\renewenvironment{abstract}{%
  \ifx\maketitle\relax
    \ClassWarning{resphilosophica}{Abstract should precede
      \protect\maketitle\space in AMS derived classes}%
  \fi
  \global\setbox\abstractbox=\vtop\bgroup%
    \vglue1pc%
    \list{}{\labelwidth\z@%
      \leftmargin3pc \rightmargin\leftmargin%
      \listparindent\normalparindent \itemindent\z@%
      \parsep\z@ \@plus\p@%
      \let\fullwidthdisplay\relax%
    }%
    \item[]\normalfont\normalsize\textbf{\abstractname:}\space
}{%
  \endlist\egroup%
  \ifx\@setabstract\relax\@setabstracta\fi%
}
\def\copyrightyear#1{\def\@copyrightyear{#1}}
\copyrightyear{}
\newlength\RESP@bulletboxwidth
\settowidth\RESP@bulletboxwidth{\quad\textbullet\quad}
\def\copyrightnote#1{\def\@copyrightnote{#1}}
\copyrightnote{\textcopyright~%
  \ifx\@empty\@copyrightyear\currentyear\else\@copyrightyear\fi~%
  \shortauthors\cleaders\hbox{\quad\textbullet\quad}\hskip\RESP@bulletboxwidth
  \textcopyright~%
  \ifx\@empty\@copyrightyear\currentyear\else\@copyrightyear\fi~%
  {\normalfont\fontfamily{\rpdefault}\selectfont Res~Philosophica}}
\renewcommand{\author}[2][]{%
  \ifx\@empty\addresses
     \gdef\addresses{\author{#2}}%
  \else
     \g@addto@macro\addresses{\author{#2}}%
  \fi
  \ifx\@empty\authors
    \gdef\authors{#2}%
  \else
    \g@addto@macro\authors{\and#2}%
  \fi
  \@ifnotempty{#1}{%
    \ifx\@empty\shortauthors
      \gdef\shortauthors{#1}%
    \else
      \g@addto@macro\shortauthors{\and#1}%
    \fi
  }%
}
\edef\author{\@nx\@dblarg
  \@xp\@nx\csname\string\author\endcsname}
\def\@settitle{\begin{center}%
  \baselineskip20\p@\relax
  \LARGE\scshape
  \@title
  \hypersetup{pdftitle=\@title}%
  \end{center}%
}
\def\@setauthors{%
  \ifx\authors\@empty\relax\else
    \begingroup
    \def\thanks{\protect\thanks@warning}%
    \trivlist
    \centering\footnotesize \@topsep30\p@\relax
    \advance\@topsep by -\baselineskip
    \item\relax
    \def\@@and{{and}}
    \author@andify\authors
    \hypersetup{pdfauthor=\authors}%
    \def\\{\protect\linebreak}%
    \large\normalfont\authors%
    \endtrivlist
    \endgroup
    \fi}
\def\maketitle{\par
  \@topnum\z@ % this prevents figures from falling at the top of page 1
  \@setcopyright
  \thispagestyle{firstpage}% this sets first page specifications
  \ifx\@empty\shortauthors \let\shortauthors\shorttitle
  \else \andify\shortauthors
  \fi
  \@maketitle@hook
  \RESP@write@paper@info
  \begingroup
  \@maketitle
  \toks@\@xp{\shortauthors}\@temptokena\@xp{\shorttitle}%
  \toks4{\def\\{ \ignorespaces}}% defend against questionable usage
  \edef\@tempa{%
    \@nx\markboth{\the\toks4
      \@nx\MakeUppercase{\the\toks@}}{\the\@temptokena}}%
  \@tempa
  \endgroup
  \c@footnote\z@
  \@cleartopmattertags
}
\def\@maketitle{%
  \normalfont\normalsize
  \@adminfootnotes
  \@mkboth{\@nx\shortauthors}{\@nx\shorttitle}%
  \@settitle
  \ifx\@empty\authors \else \@setauthors \fi
  \ifx\@empty\@dedicatory
  \else
    \baselineskip18\p@
    \vtop{\centering{\footnotesize\itshape\@dedicatory\@@par}%
      \global\dimen@i\prevdepth}\prevdepth\dimen@i
  \fi
  \@setabstract
  \normalsize
  \if@titlepage
    \newpage
  \else
    \dimen@34\p@ \advance\dimen@-\baselineskip
    \vskip\dimen@\relax
  \fi
} % end \@maketitle
\newwrite\@mainrpi
\def\RESP@write@paper@info{%
  \bgroup
  \if@filesw
    \openout\@mainrpi\jobname.rpi%
    \write\@mainrpi{\relax}%
    \ifx\r@LastPage\@undefined
       \edef\@tempa{\start@page}%
    \else
       \def\@tempb##1##2##3##4##5{##2}%
       \edef\@tempa{\expandafter\@tempb\r@LastPage}%
    \fi
    \def\and{\string\and\space}%
    \protected@write\@mainrpi{}%
    {\string\articleentry{\authors}{\@title}{\start@page}{\@tempa}}%
   \protected@write\@mainrpi{}%
    {\@percentchar authors=\authors}%
   \protected@write\@mainrpi{}%
    {\@percentchar title=\@title}%
   \protected@write\@mainrpi{}%
    {\@percentchar year=\currentyear}%
   \protected@write\@mainrpi{}%
    {\@percentchar volume=\currentvolume}%
   \protected@write\@mainrpi{}%
    {\@percentchar issue=\currentissue}%
   \protected@write\@mainrpi{}%
    {\@percentchar paper=\currentpaper}%
   \protected@write\@mainrpi{}%
    {\@percentchar startpage=\start@page}%
   \protected@write\@mainrpi{}%
    {\@percentchar endpage=\@tempa}%
   \protected@write\@mainrpi{}%
    {\@percentchar doi=\@doinumber}%
    \closeout\@mainrpi
    \fi
\egroup}
\def\@adminfootnotes{}
\def\@cleartopmattertags{%
  \def\do##1{\let##1\relax}%
  \do\maketitle \do\@maketitle \do\title \do\@xtitle \do\@title
  \do\author \do\@xauthor \do\address \do\@xaddress
  \do\contrib \do\contribs \do\xcontribs \do\toccontribs
  \do\email \do\@xemail \do\curraddr \do\@xcurraddr
  \do\commby \do\@commby
  \do\dedicatory \do\@dedicatory \do\thanks
  \do\keywords \do\@keywords \do\subjclass \do\@subjclass
  \def\sf@size{7pt}%
}
\newif\if@enddoc
\@enddocfalse
\def\enddoc@text{%
  \@enddoctrue\def\bibliography{\RESP@bibliography}%
  \ifx\@empty\thankses\else
  \bgroup
  \let\@makefnmark\relax
  \let\@thefnmark\relax
   \ifx\lastfootnote@page\@undefined\else
       \@tempcnta=\lastfootnote@page\relax
       \ifnum\c@page=\@tempcnta\relax
         \insert\footins{\medskip}%
       \fi
   \fi
  \@footnotetext{%
    \def\par{\let\par\@par}\textbf{Acknowledgements\quad} \@setthanks}%
  \egroup
  \fi
  \ifx\@empty\@translators \else\@settranslators\fi
  \ifx\@empty\addresses \else\@setaddresses\fi}
\newif\ifRESP@firstingroup
\def\emailaddrname{E-mail}
\def\@setaddresses{\par
  \nobreak \begingroup\flushright\clubpenalty\@MM\interlinepenalty\@MM
  \widowpenalty\@MM
  \RESP@firstingrouptrue
\Small
  \def\author##1{\nobreak\ifRESP@firstingroup\par
    \addvspace\bigskipamount\penalty-1000\fi
    \RESP@firstingroupfalse##1\par\nobreak}%
  \parindent\z@
  \def\address##1##2{\RESP@firstingrouptrue\begingroup
    \par\nobreak
    \@ifnotempty{##1}{(\ignorespaces##1\unskip) }%
    {\ignorespaces##2}\par\endgroup}%
  \def\curraddr##1##2{\RESP@firstingrouptrue\begingroup
    \@ifnotempty{##2}{\nobreak\indent\curraddrname
      \@ifnotempty{##1}{, \ignorespaces##1\unskip}\hskip0.2em:\space
      ##2\par}\endgroup}%
  \def\email##1##2{\RESP@firstingrouptrue\begingroup
    \@ifnotempty{##2}{\nobreak\indent\emailaddrname
      \@ifnotempty{##1}{, \ignorespaces##1\unskip}\hskip0.2em:\space
      \href{mailto:##2}{\nolinkurl{##2}}\par}\endgroup}%
  \def\urladdr##1##2{\RESP@firstingrouptrue\begingroup
    \@ifnotempty{##2}{\nobreak\indent
      \@ifnotempty{##1}{, \ignorespaces##1\unskip}%
      \url{##2}\par}\endgroup}%
  \addresses
  \endgroup
}
\AtEndDocument{\cleardoublepage}
\def\@seccntformat#1{%
  \csname the#1\endcsname\enspace
}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\itshape}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
\@mparswitchfalse
\def\EditorialComment#1{\ifRESP@manuscript\bgroup
  \marginparwidth=200pt\marginpar{\color{red}%
    \raggedright#1}\egroup\fi}
\def\doi#1{\url{http://dx.doi.org/#1}}
\def\@makefntext{\noindent\@makefnmark
  \if@enddoc\else
    \immediate\write\@mainaux%
    {\string\xdef\string\lastfootnote@page{\the\c@page}}%
  \fi}
\long\def\@footnotetext#1{%
  \insert\footins{%
    \normalfont\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep \splitmaxdepth \dp\strutbox
    \floatingpenalty\@MM \hsize\columnwidth
    \@parboxrestore \parindent\normalparindent \sloppy
    \protected@edef\@currentlabel{%
      \csname p@footnote\endcsname\@thefnmark}%
    \@makefntext{%
      \rule\z@\footnotesep\ignorespaces#1\unskip\strut\par}}}
\raggedbottom\normalsize\normalfont
\endinput
%%
%% End of file `resphilosophica.cls'.
