%%
%% This is file `jmlrbook.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% jmlr.dtx  (with options: `jmlrbook.cls,package')
%% 
%%  jmlr.dtx
%%  Copyright 2010 Nicola Talbot
%% 
%%  This work may be distributed and/or modified under the
%%  conditions of the LaTeX Project Public License, either version 1.3
%%  of this license of (at your option) any later version.
%%  The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%%  and version 1.3 or later is part of all distributions of LaTeX
%%  version 2005/12/01 or later.
%% 
%%  This work has the LPPL maintenance status `maintained'.
%% 
%%  The Current Maintainer of this work is Nicola Talbot.
%% 
%%  This work consists of the files jmlr.dtx and jmlr.ins and the derived files jmlr.cls, jmlrbook.cls.
%% 
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%% First editor:
%% Second editor:
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jmlrbook}[2010/06/30 v1.07 (NLCT) JMLR Book Style]
\RequirePackage{xkeyval}
\newcommand*{\@prehyperref}{}
\define@key{jmlrbook.cls}{prehyperref}{%
  \renewcommand*{\@prehyperref}{#1}}
\newif\ifgrayscale
\grayscalefalse
\DeclareOptionX{color}{\grayscalefalse}
\DeclareOptionX{gray}{\grayscaletrue}
\DeclareOptionX{html}{\PassOptionsToClass{\CurrentOption}{jmlr}}
\DeclareOptionX{nohtml}{\PassOptionsToClass{\CurrentOption}{jmlr}}
\DeclareOptionX{wcp}{\PassOptionsToClass{\CurrentOption}{jmlr}}
\DeclareOptionX{nowcp}{\PassOptionsToClass{\CurrentOption}{jmlr}}
\DeclareOptionX{tablecaptiontop}{\PassOptionsToClass{\CurrentOption}{jmlr}}
\DeclareOptionX{tablecaptionbottom}{\PassOptionsToClass{\CurrentOption}{jmlr}}
\ProcessOptionsX
\@ifundefined{jmlrgrayscale}{}%
{%
  \ifnum\jmlrgrayscale=0\relax
    \grayscalefalse
  \else
    \grayscaletrue
  \fi
}
\let\@org@LoadClass\LoadClass
\def\LoadClass#1{\let\LoadClass\@org@LoadClass\@org@LoadClass{jmlr}}
\@org@LoadClass{combine}
\RequirePackage{combnat}
\renewcommand\c@laNAT@parse[1]{{%
     \let\protect=\@unexpandable@protect\let~\relax
     \let\active@prefix=\@gobble
     \xdef\NAT@temp{\csname b@#1\@extra@b@citeb\endcsname}}%
     \expandafter\NAT@split\NAT@temp?????@@%
     \expandafter\NAT@parse@date\NAT@date??????@@%
     \ifciteindex\NAT@index\fi}

\renewcommand\c@lbNAT@parse[1]{{%
     \let\protect=\@unexpandable@protect\let~\relax
     \let\active@prefix=\@gobble
     \xdef\NAT@temp{\csname B?\jobname?@#1\@extra@b@citeb\endcsname}}%
     \expandafter\NAT@split\NAT@temp?????@@%
     \expandafter\NAT@parse@date\NAT@date??????@@%
     \ifciteindex\NAT@index\fi}
\RequirePackage{setspace}
\@prehyperref
\usepackage[colorlinks,
            linkcolor=blue,
            citecolor=blue,
            urlcolor=magenta,
            linktocpage,
            plainpages=false]{hyperref}
\usepackage{nameref}
\ifgrayscale
  \hypersetup{draft}
\fi
\@twosidetrue
\newif\if@openright
\@openrighttrue
\newif\if@mainmatter
\newcommand*{\pagerule}[1][0pt]{\par\noindent
  \rule[#1]{\linewidth}{2pt}\par}
\newcommand*{\chapterrefname}{Chapter}
\newcommand*{\chaptersrefname}{Chapters}
\newcommand*{\chapterref}[1]{%
  \objectref{#1}{\chapterrefname}{\chaptersrefname}{}{}}
\newcommand*{\articlepageref}[1]{%
  \pageref{#1jmlrstart}%
}
\newcommand*{\articlepagesref}[1]{%
  \pageref{#1jmlrstart}--\pageref{#1jmlrend}%
}
\newcommand*{\@articlepagesref}{%
  \pageref{jmlrstart}--\pageref{jmlrend}%
}
\newcommand*{\articletitleref}[1]{\nameref{#1jmlrstart}}
\newcommand*{\articleauthorref}[1]{%
  \@ifundefined{@jmlr@author@#1}%
  {%
    \ClassWarning{jmlrbook}{Label `#1' undefined}%
  }%
  {%
    \@nameuse{@jmlr@author@#1}%
  }%
}
\newcommand*{\@parttoclabel}{part}
\newcommand*{\@partapp}{\partname}
\renewcommand*\jmlrtitlehook{%
  \hypersetup{pdftitle={\@shorttitle}}%
  \let\jmlrtitlehook\relax
}
\renewcommand*\jmlrauthorhook{%
  \ifx\@sauthor\@empty
    \hypersetup{pdfauthor={\@author}}%
  \else
    \hypersetup{pdfauthor={\@sauthor}}%
  \fi
  \let\jmlrauthorhook\relax
  \let\@shortauthor\@empty
}
\newcommand*{\@volume}{\@jmlrvolume}
\newcommand*{\volume}[1]{\renewcommand*{\@volume}{#1}}
\newcommand*{\@issue}{\@jmlrissue}
\newcommand*{\issue}[1]{\renewcommand*{\@issue}{#1}}
\newcommand*{\thejmlrworkshop}{\@jmlrworkshop}
\newcommand*{\@team}{}
\newcommand*{\team}[1]{\renewcommand*{\@team}{#1}}
\newcommand*{\@productioneditorname}{Production Editor}
\newcommand*{\@productioneditor}{}
\newcommand*{\productioneditor}[1]{%
  \renewcommand*{\@productioneditor}{#1}%
  \renewcommand*{\@productioneditorname}{Production Editor}%
}
\newcommand*{\productioneditors}[1]{%
  \renewcommand*{\@productioneditor}{#1}%
  \renewcommand*{\@productioneditorname}{Production Editors}%
}
\newcommand*{\@logo}{}
\newcommand*{\logo}[1]{\renewcommand*{\@logo}{#1}}
\def\c@lbmaketitle{\jmlrmaketitle}
\newcommand*{\maintitle}{}
\newcommand*{\SetTitleElement}[3]{%
  {%
    \expandafter\ifx\csname @#1\endcsname\@empty
    \else
      #2\csname @#1\endcsname#3%
    \fi
  }%
}
\newcommand{\IfTitleElement}[3]{%
  \expandafter\ifx\csname @#1\endcsname\@empty
    #2%
  \else
    #3%
  \fi
}
\newcommand{\titlebody}{%
  \SetTitleElement{title}{\maintitlefont}{\postmaintitle}%
  \SetTitleElement{volume}{\mainvolumefont}{\postmainvolume}%
  \SetTitleElement{subtitle}{\mainsubtitlefont}{\postmainsubtitle}%
  \SetTitleElement{logo}{\mainlogofont}{\postmainlogo}%
  \SetTitleElement{team}{\mainteamfont}{\postmainteam}%
  \SetTitleElement{author}{\mainauthorfont}{\postmainauthor}%
  \SetTitleElement{productioneditor}{\mainproductioneditorfont}%
    {\postmainproductioneditor}%
}
\ifjmlrhtml
  \renewcommand{\c@lamaketitle}{%
    \HCode{<table cellpadding="2" cellspacing="2" border="0" width="100\%">}%
    \HCode{<tbody><tr><td valign="top">}%
    \HCode{<h1>}%
    \@title\newline
    \ifx\@volume\@empty
    \else
      Volume \@volume
      \ifx\@subtitle\@empty\else: \fi
    \fi
    \@subtitle
    \HCode{</h1>}%
    \newline
    \textbf{Editors: \@author}
    \HCode{</td><td valign="top">}%
    \@logo
    \HCode{</td></tr></tbody></table>}%
    \let\maintitle\@title
  }
\else
  \renewcommand{\c@lamaketitle}{%
    \pagenumbering{alph}%
    \pagestyle{empty}%
    \begin{titlepage}%
      \let\footnotesize\small
      \let\footnoterule\relax
      \let\footnote\thanks
      \titlebody
      \par
      \@thanks
    \end{titlepage}%
    \setcounter{footnote}{0}%
    \let\maintitle\@title
    \c@lmtitlempty
  }
\fi
\renewcommand{\maintitlefont}{%
  \null\vskip15pt\relax\par
  \flushleft\Huge\bfseries\noindent}
\renewcommand{\postmaintitle}{%
  \par\relax
}
\newcommand{\mainvolumefont}{%
  \flushleft\noindent\LARGE\bfseries Volume
}
\newcommand{\postmainvolume}{%
  \IfTitleElement{subtitle}{}{:}\par\relax
}
\newcommand{\mainissuefont}{%
  \flushleft\noindent\LARGE\bfseries Issue
}
\newcommand{\postmainissue}{%
  \par\relax
}
\newcommand{\mainsubtitlefont}{%
  \flushleft\LARGE\bfseries\noindent}
\newcommand{\postmainsubtitle}{\par}
\newcommand{\mainlogofont}{%
  \vfill
  \begin{center}}
\newcommand{\postmainlogo}{\end{center}\vfill\par}
\newcommand{\mainteamfont}{\flushleft\bfseries\Large\noindent}
\newcommand{\postmainteam}{\par}
\renewcommand{\mainauthorfont}{%
  \flushleft\Large\itshape\doublespacing\noindent}
\renewcommand{\postmainauthor}{%
\par}
\newcommand{\mainproductioneditorfont}{%
  \flushleft\Large\noindent \@productioneditorname: \itshape}
\newcommand{\postmainproductioneditor}{\par}
\renewcommand{\maindatefont}{}
\renewcommand{\postmaindate}{}
\newenvironment{signoff}[2][The Editorial Team]{%
  \def\Editor##1{\begin{tabular}{@{}l@{}}%
    ##1%
    \end{tabular}%
    \par\vskip\baselineskip\noindent\ignorespaces
  }%
  \def\@editorialteam{#1}%
  \def\@signoffdate{#2}%
  \par\vskip\baselineskip\noindent
  \ifx\@signoffdate\@empty
  \else
    \emph{\@signoffdate}\par
    \vskip\baselineskip\noindent
  \fi
  \ifx\@editorialteam\@empty
  \else
    \@editorialteam:\par\vskip\baselineskip
  \fi
  \noindent\ignorespaces
}{%
}
\newenvironment{authorsignoff}{%
  \def\Author##1{\begin{tabular}{@{}l@{}}%
    ##1%
    \end{tabular}%
    \par\vskip\baselineskip\noindent\ignorespaces
  }%
  \par\vskip\baselineskip\noindent\ignorespaces
}{%
}
\renewcommand{\zeroextracounters}{%
  \@ifundefined{c@theorem}{}{\setcounter{theorem}{0}}%
  \@ifundefined{c@algorithm}{}{\setcounter{algorithm}{0}}%
  \@ifundefined{c@example}{}{\setcounter{example}{0}}%
}
\renewcommand*{\contentsname}{Table of Contents}
\def\theHalgorithm{\thechapter.\thealgorithm}
\def\theHexample{\thechapter.\theexample}
\def\theHtheorem{\thechapter.\thetheorem}
\def\theHsection{\thechapter.\thesection}
\def\theHsubsection{\thechapter.\thesubsection}
\def\theHsubsubsection{\thechapter.\thesubsubsection}
\def\theHparagraph{\thechapter.\theparagraph}
\def\theHsubfigure{\thechapter.\thefigure.\thesubfigure}
\def\theHsubtable{\thechapter.\thetable.\thesubtable}
\renewcommand*{\mailto}[1]{%
  \href{mailto:#1}{\nolinkurl{#1}}%
}
\c@lhaschapterfalse
\let\c@lthesec\thesection
\newcommand\doimportchapterHref{%
  \edef\@currentHref{chapter.\thechapter}%
}
\def\toclevel@appendix{-1}
\def\Xprefix{}
\DeclareRobustCommand\Xref{\@ifstar\@Xrefstar\T@Xref}%
\DeclareRobustCommand\Xpageref{%
  \@ifstar\@Xpagerefstar\T@Xpageref
}%
\def\HyRef@StarSetXRef#1{%
  \begingroup
    \Hy@safe@activestrue
    \edef\x{#1}%
    \@onelevel@sanitize\x
    \edef\x{\endgroup
      \noexpand\HyRef@@StarSetRef
        \expandafter\noexpand\csname r@\Xprefix\x\endcsname{\x}%
    }%
  \x
}
\def\@Xrefstar#1{%
  \HyRef@StarSetXRef{#1}\@firstoffive
}
\def\@Xpagerefstar#1{%
  \HyRef@StarSetXRef{#1}\@secondoffive
}
\def\T@Xref#1{%
  \Hy@safe@activestrue
  \expandafter\@setXref\csname r@\Xprefix#1\endcsname\@firstoffive{#1}%
  \Hy@safe@activesfalse
}%
\def\T@Xpageref#1{%
  \Hy@safe@activestrue
  \expandafter\@setXref\csname r@\Xprefix#1\endcsname\@secondoffive{#1}%
  \Hy@safe@activesfalse
}%
\def\Xlabel#1{%
  \@bsphack
    \begingroup
      \@onelevel@sanitize\@currentlabelname
      \edef\@currentlabelname{%
        \expandafter\strip@period\@currentlabelname\relax.\relax\@@@
      }%
      \protected@write\@mainauxout{}{%
        \string\newlabel{\Xprefix#1}{{\@currentlabel}{\thepage}%
          {\@currentlabelname}{\@currentHref}{}}%
      }%
    \endgroup
  \@esphack
}
\let\ltx@label\Xlabel
\def\@setXref#1#2#3{% csname, extract group, refname
  \ifx#1\relax
    \protect\G@refundefinedtrue
    \nfss@text{\reset@font\bfseries ??}%
    \@latex@warning{%
      Reference `#3' on page \thepage \space undefined%
    }%
  \else
    \expandafter\Hy@setref@link#1\@empty\@empty\@nil{#2}%
  \fi
}
\AtBeginDocument{\renewcommand\@secondoffive[5]{#2}}
\def\@setimportlabel{%
  \let\@mainauxout\@auxout
  \let\HRlabel\label
}
\AtBeginDocument{%
  \@setimportlabel
  \gdef\@setimportlabel{\let\ref\Xref \let\pageref\Xpageref}%
  \let\ReadBookmarks\relax
}
\let\@org@InputIfFileExists\InputIfFileExists
\newenvironment{jmlrpapers}{%
  \begin{papers}[]
  \if@twocolumn
    \def\@jmlr@restore{\twocolumn}%
  \else
    \def\@jmlr@restore{\onecolumn}%
  \fi
  \jmlrarticlecommands
  \let\importpubpaper\@importpubpaper
  \let\importpaper\@importpaper
  \let\importarticle\@importarticle
  \let\label\Xlabel
  \let\ref\Xref
  \pagestyle{article}%
}{%
  \@jmlr@restore
  \end{papers}
}
\newcommand{\addtomaincontents}[2]{%
  \protected@write\@mainauxout{\let\label\@gobble\let\index\@gobble
    \let\glossary\@gobble}{\string\@writefile{#1}{#2}}%
}
\newcommand*{\@write@author}[2]{%
  \def\@jmlr@authors@sep{ and }%
  \protected@write\@mainauxout{}{%
    \string\@new@articleauthor{#1}{#2}%
  }%
}
\newcommand*{\@new@articleauthor}[2]{%
  \expandafter\gdef\csname @jmlr@author@#1\endcsname{%
    \hyperref[#1jmlrstart]{#2}}%
}
\newcommand*{\@write@jmlr@import}[3]{%
  \protected@write\@mainauxout{}{\string\@jmlr@import{#1}{#2}{#3}}%
}
\newcommand*{\@jmlr@import}[3]{}
\newcommand*{\@importpubpaper}[4][\@importdir\@importfile]{%
  \bgroup
    \def\@importdir{#2/}%
    \def\@importfile{#3}%
    \@write@jmlr@import{#1}{#2}{#3}%
    \def\@extra@b@citeb{#1}%
    \def\@extra@binfo{#1}%
    \jmlrpages{#4}%
    \graphicspath{{\@importdir}}%
    \def\jmlrmaketitlehook{%
      \refstepcounter{chapter}%
      \addtomaincontents{toc}%
        {\protect\contentsline{papertitle}{\@shorttitle}{\thepage}%
   {page.\thepage}}%
      \pdfbookmark{\@shorttitle}{chapter.\thechapter}%
      \def\@jmlr@authors@sep{ \& }%
      \tocchapterpubauthor{\@jmlrauthors}%
      {%
        \@jmlrabbrvproceedings
        \ifx\@jmlrvolume\@empty
           \ifx\@jmlrpages\@empty\else\space\fi
        \else
           \space\@jmlrvolume
           \ifx\@jmlrpages\@empty\else:\fi
        \fi
        \ifx\@jmlrpages\@empty
        \else
           \@jmlrpages
           \ifx\@jmlryear\@empty\else,\fi
        \fi
        \space\@jmlryear
      }%
      \@write@author{#1}{\@jmlrauthors}%
    }%
    \def\jmlrpremaketitlehook{%
      \cleardoublepage
      \phantomsection
      \let\@currentlabelname\@shorttitle
    }%
    \def\InputIfFileExists##1##2##3{%
       \IfFileExists{##1}{%
          \@org@InputIfFileExists{##1}{##2}{##3}%
       }%
       {%
          \@org@InputIfFileExists{\@importdir##1}{##2}{##3}%
       }%
     }%
    \def\Xprefix{#1}%
    \import{\@importdir\@importfile}%
    \def\Xprefix{}%
  \egroup
  \gdef\@shortauthor{}%
  \gdef\@shorttitle{}%
  \gdef\@firstauthor{}%
  \gdef\@jmlrauthors{}%
  \gdef\@firstsurname{}%
}
\newcommand{\importpubpaper}[4][]{%
  \ClassError{jmlrbook}{\string\importpubpaper\space
not permitted outside `jmlrpapers' environment}{}%
}
\newcommand{\@importpaper}[3][\@importdir\@importfile]{%
  \bgroup
    \def\@importdir{#2/}%
    \def\@importfile{#3}%
    \@write@jmlr@import{#1}{#2}{#3}%
    \def\@extra@b@citeb{#1}%
    \def\@extra@binfo{#1}%
    \jmlrpages{\protect\@articlepagesref}%
    \graphicspath{{\@importdir}}%
    \def\jmlrmaketitlehook{%
      \refstepcounter{chapter}%
      \addtomaincontents{toc}%
        {\protect\contentsline{papertitle}{\@shorttitle}{\thepage}%
   {page.\thepage}}%
      \pdfbookmark{\@shorttitle}{chapter.\thechapter}%
      \def\@jmlr@authors@sep{ \& }%
      \tocchapterpubauthor{\@jmlrauthors}%
      {%
        \@jmlrabbrvproceedings
        \ifx\@jmlrvolume\@empty
           \space
        \else
           \space\@jmlrvolume:%
        \fi
        \protect\articlepagesref{#1}%
        \ifx\@jmlryear\@empty\else,\fi
        \space\@jmlryear
      }%
      \@write@author{#1}{\@jmlrauthors}%
    }%
    \def\jmlrpremaketitlehook{%
      \cleardoublepage
      \phantomsection
      \let\@currentlabelname\@shorttitle
    }%
    \def\InputIfFileExists##1##2##3{%
       \IfFileExists{##1}{%
          \@org@InputIfFileExists{##1}{##2}{##3}%
       }%
       {%
          \@org@InputIfFileExists{\@importdir##1}{##2}{##3}%
       }%
     }%
    \def\Xprefix{#1}%
    \import{\@importdir\@importfile}%
    \def\Xprefix{}%
  \egroup
  \gdef\@shortauthor{}%
  \gdef\@shorttitle{}%
  \gdef\@firstauthor{}%
  \gdef\@jmlrauthors{}%
  \gdef\@firstsurname{}%
}

\newcommand{\importpaper}[3][]{%
  \ClassError{jmlrbook}{\string\importpaper\space
not permitted outside `jmlrpapers' environment}{}%
}
\newcommand{\@importarticle}[3][\@importdir\@importfile]{%
  \bgroup
    \def\@importdir{#2/}%
    \def\@importfile{#3}%
    \@write@jmlr@import{#1}{#2}{#3}%
    \def\@extra@b@citeb{#1}%
    \def\@extra@binfo{#1}%
    \def\jmlrmaketitlehook{%
      \addtomaincontents{toc}%
        {\protect\contentsline{papertitle}{\@shorttitle}{\thepage}%
   {page.\thepage}}%
      \refstepcounter{chapter}%
      \pdfbookmark{\@shorttitle}{chapter.\thechapter}%
      \def\@jmlr@authors@sep{ \& }%
      \tocchapterauthor{\@jmlrauthors}%
      \@write@author{#1}{\@jmlrauthors}%
      \jmlrpages{}%
      \jmlrvolume{}%
      \jmlryear{}%
      \jmlrsubmitted{}%
      \jmlrpublished{}%
      \jmlrproceedings{}{}%
    }%
    \def\jmlrpremaketitlehook{%
      \cleardoublepage
      \phantomsection
      \let\@currentlabelname\@shorttitle
    }%
    \graphicspath{{\@importdir}}%
    \def\InputIfFileExists##1##2##3{%
       \IfFileExists{##1}{%
          \@org@InputIfFileExists{##1}{##2}{##3}%
       }%
       {%
          \@org@InputIfFileExists{\@importdir##1}{##2}{##3}%
       }%
     }%
    \def\Xprefix{#1}%
    \import{\@importdir\@importfile}%
    \def\Xprefix{}%
  \egroup
  \gdef\@shortauthor{}%
  \gdef\@shorttitle{}%
  \gdef\@firstauthor{}%
  \gdef\@jmlrauthors{}%
  \gdef\@firstsurname{}%
}
\newcommand{\importarticle}[3][]{%
  \ClassError{jmlrbook}{\string\importarticle\space
not permitted outside `jmlrpapers' environment}{}%
}
\newcommand{\addtocpart}[1]{%
  \cleardoublepage
  \refstepcounter{tocpart}%
  \addtocontents{toc}{\protect\tocpart{#1}}%
  \pdfbookmark[-1]{#1}{part.\thetocpart}%
}
\newcounter{tocpart}
\newcommand{\tocpart}[1]{%
    \addpenalty{-\@highpenalty}%
    \vskip 1.0ex \@plus\p@
    \setlength\@tempdima{2.25em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \large\bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss \null}\par
      \penalty\@highpenalty
    \endgroup
}
\setlength{\prechapterskip}{3em}
\setlength{\postchapterskip}{20pt}
\renewcommand{\chapternumberformat}[1]{%
 \Large\bfseries \@chapapp\space#1\par
}
\renewcommand{\chaptertitleformat}[1]{%
 \Large\bfseries #1}
\renewcommand*{\chapterformat}{%
   \raggedright
}
\renewcommand{\preparthook}{\cleardoublepage\null\vfil}
\renewcommand{\partnumberformat}[1]{%
  \Huge\bfseries \@partapp\nobreakspace#1\par\nobreak
  \vskip 20\p@
}
\def\postparthook{%
  \thispagestyle{empty}%
  \vfil\newpage
  \null
  \thispagestyle{empty}%
  \newpage
}
\newcommand{\@curparthead}{}
\renewcommand{\parttitleformat}[1]{#1%
  \gdef\@curparthead{\@partapp\space \thepart. #1}%
  \@mkboth{\@curparthead}{\@curparthead}%
}
\renewcommand{\firstpageno}[1]{}
\newcommand{\tocchapterauthor}[1]{%
  \addtomaincontents{toc}{\protect\contentsline{chapterauthor}{%
  #1}{}{}}%
}
\newcommand{\tocchapterpubauthor}[2]{%
  \addtomaincontents{toc}{\protect\contentsline{chapterauthor}{%
  #1; #2.}{}{}}%
}
\renewcommand*\@pnumwidth{2em}
\renewcommand*\l@part[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{5em}%
    \vbox{%
      \pagerule
      \begingroup
        \parindent \z@ \rightskip \@pnumwidth
        \parfillskip -\@pnumwidth
        \leavevmode \large\bfseries
        \advance\leftskip\@tempdima
        \hskip -\leftskip
        \renewcommand*\numberline[1]{\hb@xt@ \@tempdima
          {\partname\space ##1\hfil }}%
        #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss }\par
        \penalty\@highpenalty
      \endgroup
      \pagerule
    }%
  \fi}
\newcommand*{\l@papertitle}[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{3em}%
    \begingroup
      \leavevmode \raggedright\itshape
      #1\nobreak\hfill \nobreak\hb@xt@\@pnumwidth{\hss
       \normalfont#2}%
       \par
      \penalty\@highpenalty
    \endgroup
  \fi
}
\newcommand*\l@chapterauthor[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \raggedright
      #1%
       \par
    \endgroup
  \fi}
\renewcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \normalsize\mdseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewcommand*\l@subsection[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{3.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \normalsize\mdseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewcommand*{\chaptermark}[1]{%
  \@mkboth{\@curparthead}{\protect\thechapter. #1}%
}
\newcommand{\firstpagehead}{}
\newcommand{\firstpagefoot}{\hfill\thepage}
\renewcommand*{\headfont}{\reset@font\small\scshape}%
\renewcommand*{\footfont}{\reset@font\small\itshape}%
\newcommand*{\ps@chplain}{%
  \let\@mkboth\@gobbletwo
  \renewcommand*{\@oddhead}{\headfont\firstpagehead}%
  \renewcommand*{\@evenhead}{}%
  \renewcommand*{\@oddfoot}{\footfont\firstpagefoot}%
  \renewcommand*{\@evenfoot}{\footfont\thepage\hfill
  }%
}
\let\ps@plain\ps@chplain
\newcommand*{\ps@article}{%
  \let\@mkboth\@gobbletwo
  \renewcommand*{\@oddhead}{\headfont\hfill\@shorttitle}%
  \renewcommand*{\@evenhead}{\headfont\@shortauthor\hfill}%
  \renewcommand*{\@oddfoot}{\footfont\hfill\thepage}
  \renewcommand*{\@evenfoot}{\footfont\thepage\hfill}
}
\newcommand*{\ps@jmlrbook}{%
  \ps@headings
  \renewcommand*{\sectionmark}[1]{}%
}
\renewcommand*{\morefrontmatter}{\pagestyle{jmlrbook}%
  \def\chaptermark##1{%
    \@mkboth{##1\hfill}{\hfill##1}}%
}
\renewcommand*{\moremainmatter}{\pagestyle{jmlrbook}%
  \def\chaptermark##1{%
    \@mkboth{\@curparthead}{\protect\thechapter. ##1}%
  }%
}
\renewcommand*\bibsection{\section*{\refname}}
\def\@bookpart[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{\@parttoclabel}{%
        \protect\numberline{\thepart}#1}%
    \else
      \addcontentsline{toc}{\@parttoclabel}{#1}%
    \fi
    \markboth{}{}%
    {\interlinepenalty \@M
     \normalfont\partformat
     \ifnum \c@secnumdepth >-2\relax
       \partnumberformat{\thepart}%
     \fi
     \parttitleformat{#2}\par}%
    \postparthook}
\jmlrbookcommands
\endinput
%%
%% End of file `jmlrbook.cls'.
