%%
%% This is file `limap.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% limap.dtx  (with options: `class')
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from limap.cls.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file limap.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)
%%^^A%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Purpose:
%%      A package for typesetting Information Maps.
%%
%% Documentation:
%%      The documentation  can be generated  from  the  original  file
%%      limap.dtx with the doc class/package. LaTeX the file limap.tex
%%      to get the full documentation in pdf format.
%%
%% Author: Gerd Neugebauer
%%         Im Lerchelsb\"ohl 5
%%         64521 Gro\ss-Gerau (Germany)
%% Mail:   gene@gerd-neugebauer.de
%%
%% Copyright (C) 1999-2016 Gerd Neugebauer
%%
%% limap.dtx may be  distributed under the terms of  the LaTeX Project
%% Public License version  1.3c, as described in lppl.txt.
%%
%% This class is still under development and  may be replaced with a
%% new version which provides an enhanced functionality.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  \CharacterTable
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
%%
\def\filename{limap.dtx}
\def\fileversion{2.1}
\def\filedate{2016/05/29}
\let\docversion=\fileversion
\let\docdate=\filedate
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{limap}[\filedate\space Gerd Neugebauer]
\def\defineLimapLanguage#1#2#3#4#5{%
  \expandafter\def\csname LIMAP@SelectLanguage@#1\endcsname{%
    \def\MapContinued{#2}%
    \def\MapContinuing{#3}%
    \def\MapTOCname{#4}%
    \def\MapTOCpage{#5}%
  }%
}
\defineLimapLanguage{austrian}%
  { Fortsetzung}{Fortsetzung\dots}%
  {Titel}{Seite}
\defineLimapLanguage{german}%
  { Fortsetzung}{Fortsetzung\dots}%
  {Titel}{Seite}
\defineLimapLanguage{english}%
  { Continued}{Continuing\dots}%
  {Title}{Page}
\defineLimapLanguage{USenglish}%
  { Continued}{Continuing\dots}%
  {Title}{Page}
\defineLimapLanguage{french}%
  { continuation}{continuation\dots}%
  {Intitulé}{Page}
\providecommand\LIMAP@Language{english}
\DeclareOption{austrian}{\renewcommand\LIMAP@Language{austrian}}
\DeclareOption{german}{\renewcommand\LIMAP@Language{german}}
\DeclareOption{french}{\renewcommand\LIMAP@Language{french}}
\DeclareOption{english}{\renewcommand\LIMAP@Language{english}}
\DeclareOption{USenglish}{\renewcommand\LIMAP@Language{USenglish}}
\newif\ifLIMAP@strict \LIMAP@stricttrue
\DeclareOption{nonstrict}{\LIMAP@strictfalse}
\DeclareOption{nolines}{\def\MapRuleWidth{0pt}\ignorespaces}
\providecommand\LIMAP@ClassType{report}
\DeclareOption{book}{\renewcommand\LIMAP@ClassType{book}}
\DeclareOption{report}{\renewcommand\LIMAP@ClassType{report}}
\DeclareOption{article}{\renewcommand\LIMAP@ClassType{article}}
\DeclareOption{letter}{\renewcommand\LIMAP@ClassType{letter}}
\providecommand\LIMAP@Variant{base}
\DeclareOption{koma}{\renewcommand\LIMAP@Variant{koma}}
\DeclareOption{base}{\renewcommand\LIMAP@Variant{base}}
\newcommand\LIMAP@Class@base@article{article}
\newcommand\LIMAP@Class@base@report{report}
\newcommand\LIMAP@Class@base@book{book}
\newcommand\LIMAP@Class@base@letter{letter}
\newcommand\LIMAP@Class@koma@article{scrartcl}
\newcommand\LIMAP@Class@koma@report{scrreprt}
\newcommand\LIMAP@Class@koma@book{scrbook}
\newcommand\LIMAP@Class@koma@letter{scrlettr}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{%
    \csname LIMAP@Class@\LIMAP@Variant @\LIMAP@ClassType\endcsname}%
  }
\ProcessOptions
\LoadClass{\csname
  LIMAP@Class@\LIMAP@Variant @\LIMAP@ClassType\endcsname}
\RequirePackage{longtable}
\RequirePackage{etoolbox}
\RequirePackage{booktabs}
\RequirePackage{fancyhdr}
\addtolength{\headheight}{2ex}%
\pagestyle{fancy}%
\cfoot{}
\rhead{\small\thepage}
\lhead{\textit{\footnotesize\@title}}
\def\@title{}
\raggedbottom
\providecommand\MapRuleWidth{.25pt}
\newcommand\MapRuleStart{}
\newcommand\MapContinued{}
\newcommand\MapContinuing{}
\newcommand\MapContinuingFormat[1]{\textit{\footnotesize #1}}
\newcommand\MapContinuedFormat[1]{, {\MapTitleContinuedFont #1}}
\let\MapFont\textsf
\let\MapTitleFont\Large
\let\MapTitleContinuedFont\small
\def\MapBlockLabelFont{}
\newcommand\MapParskip{2ex}
\newcommand\MapTitleFraction{.2}
\newcommand\MapTextFraction{.75}
\let\MapNewpage\newpage
\newcommand\MapTOC[1]{%
  \refstepcounter{\@nameuse{Map@TOC@name\the\Map@level}}%
  \addcontentsline{toc}{\@nameuse{Map@TOC@name\the\Map@level}}{#1}%
}
\newcommand\MapTOCname{}
\newcommand\MapTOCpage{}
\newcommand\MapTOCheadfont{\scriptsize\emph}
\newlength{\Map@length}
\newcount\Map@level
\Map@level=0
\newcount\Map@blockcount
\def\LT@final@warn{%
  \AtEndDocument{%
    \PackageWarning{limap}%
    {Table \@width s have changed. Rerun LaTeX.\@gobbletwo}}%
  \global\let\LT@final@warn\relax}
\def\Map#1{%
  \def\LT@err{\PackageError{limap}}%
  \def\LT@warn{\PackageWarning{limap}}%
  \let\Block\Map@Block
  \let\endBlock\Map@endBlock
  \Map@blockcount=0
  \global\advance\Map@no1
  \ifx\Map@UP\empty\else
    \immediate\write\@auxout
      {\string\expandafter\string\xdef\string\csname\space
        Map@parts@\Map@UP\string\endcsname{\string\csname\space
          Map@parts@\Map@UP\string\endcsname\the\Map@no:}}%
  \fi
  \edef\Map@UP{\the\Map@no}%
  \ifnum\Map@level>0
    \xdef\Map@@up{\Map@UP}% Just to save the value across blocks.
    \endgroup
    \Map@end
    \begingroup
    \edef\Map@UP{\Map@@up}%
    \def\@currenvir{Map}%
  \fi
  \edef\Map@this{\the\Map@no}%
  \immediate\write\@auxout
    {\string\global\string\@namedef{Map@parts@\the\Map@no}{}}%
  \global\advance\Map@level1
  \def\Map@TITLE{#1}%
  \Map@start
  }
\def\endMap{%
  \Map@end
  \global\advance\Map@level-1
  \ignorespaces
}
\newif\ifMap@open@
\Map@open@false
\@namedef{Map@TOC@name0}{chapter}
\@namedef{Map@TOC@name1}{section}
\@namedef{Map@TOC@name2}{subsection}
\@namedef{Map@TOC@name3}{subsubsection}
\@namedef{Map@TOC@name4}{paragraph}
\@namedef{Map@TOC@name5}{subparagraph}
\@namedef{Map@TOC@name6}{subsubparagraph}
\@namedef{Map@TOC@name7}{subsubparagraph}
\@namedef{Map@TOC@name8}{subsubparagraph}
\@namedef{Map@TOC@name9}{subsubparagraph}
\@namedef{Map@TOC@name10}{subsubparagraph}
\@namedef{Map@TOC@name11}{subsubparagraph}
\@namedef{Map@TOC@name12}{subsubparagraph}
\newcommand\Map@start{%
  \advance\Map@counter1
  \setlength{\Map@length}{\textwidth}%
  \addtolength{\Map@length}{-\MapTitleFraction\textwidth}%
  \addtolength{\Map@length}{-\MapTextFraction\textwidth}%
  \ifx\Map@TITLE\empty\else
    \MapTOC{\Map@TITLE}%
  \fi
  \longtable
    {@{}p{\MapTitleFraction\textwidth}@{\hspace{\Map@length}}
        p{\MapTextFraction\textwidth}@{}}%
      \multicolumn{2}{@{}p{\textwidth}@{}}{%
        \MapFont{\MapTitleFont\rule{0pt}{3ex}%
          \Map@TITLE}}
    \endfirsthead
      \multicolumn{2}{@{}p{\textwidth}@{}}{%
        \MapFont{\MapTitleFont\rule{0pt}{3ex}%
          \Map@TITLE\MapContinuedFormat{\MapContinued}}}%
    \endhead
    \\
      &\MapRuleStart
       \rule{\MapTextFraction\textwidth}{\MapRuleWidth}\newline
       \mbox{}\hfill
       \raisebox{3pt}{\MapContinuingFormat{\MapContinuing}}
    \endfoot
      &\MapRuleStart
       \rule{\MapTextFraction\textwidth}{\MapRuleWidth}%
       \vspace{\MapParskip}
    \endlastfoot
    \xdef\@currentlabel{\Map@TITLE}%
    \label{Map@\the\Map@no}%
    \global\Map@open@true
}
\newcommand\Map@end{%
  \ifMap@open@\vspace*{1.5ex}
    \global\Map@open@false
    \endlongtable
    \MapNewpage
  \fi
  \iftrue
   \ifnum\Map@blockcount>9
    \PackageWarning{limap}%
    {*** The current map contains too much blocks:
         \the\Map@blockcount}%
   \else\ifnum\Map@blockcount>7
    \PackageWarning{limap}%
    {--- The current map contains \the\Map@blockcount blocks.}%
   \fi\fi
  \fi
}
\newcommand\Map@UP{}
\newcount\Map@no
\newcount\Map@counter
\Map@counter=0
\@namedef{Map@parts@}{}
\newenvironment{Map@Block}[1]{\par
  \vspace*{-\parskip}\vspace*{-1ex}%
  \\\null\par
  \vspace*{\MapParskip}%
  \raggedright\hspace{0pt}\MapFont{\MapBlockLabelFont{#1}}%
  \gdef\@currentlabel{#1}%
  &\parskip=\MapParskip
  {\MapRuleStart
    \rule{\MapTextFraction\textwidth}{\MapRuleWidth}}\par
}{%
}
\newcommand\Block[1]{\PackageWarning{limap}{The sectioning command
      `Block' has been encountered outside the scope of a Map
      environment.}}
\newcommand\WideBlock{\\\multicolumn2{@{}l@{}}}
\newif\if@Map@toc@sep@
\def\MapTableOfContents@open{%
  \centering
  \begin{tabular}{p{.6\textwidth}r}\toprule
    \MapTOCheadfont{\MapTOCname}&
    \MapTOCheadfont{\MapTOCpage}\\\midrule
    \ifcsdef{Map@parts@\the\Map@no}{
      \edef\Map@tmp@{\csname Map@parts@\the\Map@no\endcsname:}%
      \expandafter\Map@toc@loop\Map@tmp@
      \\\bottomrule
    }{}
  \end{tabular}
}
\def\MapTableOfContents@boxed{%
  \centering
  \begin{tabular}{|p{.6\textwidth}|r|}\hline
    \MapTOCheadfont{\MapTOCname}&
    \MapTOCheadfont{\MapTOCpage}\\\hline
    \ifcsdef{Map@parts@\the\Map@no}{
      \edef\Map@tmp@{\csname Map@parts@\the\Map@no\endcsname:}%
      \expandafter\Map@toc@loop\Map@tmp@
      \\\hline
    }{}
  \end{tabular}
}
\newcommand\MapTableOfContentsStyle{open}
\newcommand\MapTableOfContents{\par
  \global\@Map@toc@sep@false
  \csname MapTableOfContents@\MapTableOfContentsStyle\endcsname
  \vspace*{-1.5\parskip}\par\ignorespaces
}
\def\Map@toc@loop#1:{%
  \def\Map@tmp@{#1}%
  \ifx\Map@tmp@\empty
    \global\let\Map@next@=\relax
  \else
    \if@Map@toc@sep@
    \gdef\Map@next@{\\
    \ref{Map@#1}&\pageref{Map@#1}%
    \Map@toc@loop}%
    \else
    \gdef\Map@next@{%
    \ref{Map@#1}&\pageref{Map@#1}%
    \Map@toc@loop}%
    \global\@Map@toc@sep@true
    \fi
  \fi
  \Map@next@
}
\newcommand\MapTabularFraction{.95}
\newenvironment{MapTabular}{%
  \begin{center}
    \begin{tabular*}{\MapTabularFraction\linewidth}%
}{%
    \end{tabular*}
  \end{center}\ignorespaces
}
\newcommand\MakeTitle{\thispagestyle{empty}
  \rule{0pt}{.25\textheight}\par
  \mbox{}\hfill
  \begin{minipage}{\MapTextFraction\textwidth}
    \raggedright
    \rule{\textwidth}{2pt}\par
    \vspace*{2.5\MapParskip}%
    \sf{\huge \@title\par}%
    \vspace*{2.5\MapParskip}%
    \rule{\textwidth}{2pt}\par
    \vspace*{2.5\MapParskip}%
    \MapFont{\large \@author} \par
    \vspace*{2.5\MapParskip}%
    \MapFont{\footnotesize \@date}
    \vspace*{\MapParskip}%
  \end{minipage}%
  \vspace*{-22ex}%
  \par
}
\newenvironment{Abstract}{\vfill
  \par
  \mbox{}\hfill
  \begin{minipage}{\MapTextFraction\textwidth}\parskip=1ex
    \rule{\textwidth}{1pt}\medskip\par
}{\par\rule{\textwidth}{1pt}
  \end{minipage}%
  \par
}
\let\maketitle\MakeTitle
\let\abstract\Abstract
\let\endabstract\endAbstract
\InputIfFileExists{limap.cfg}{}{}
\csname LIMAP@SelectLanguage@\LIMAP@Language\endcsname
\ifLIMAP@strict
  \def\chapter{\PackageWarning{limap}{The sectioning command
      `chapter' is not available.}}
  \def\subsection{\PackageWarning{limap}{The sectioning command
      `subsection' is not available.}}
  \def\subsubsection{\PackageWarning{limap}{The sectioning command
      `subsubsection' is not available.}}
  \def\paragraph{\PackageWarning{limap}{The sectioning command
      `paragraph' is not available.}}
  \def\subparagraph{\PackageWarning{limap}{The sectioning command
      `subparagraph' is not available.}}
  \def\subsubparagraph{\PackageWarning{limap}{The sectioning command
      `subsubparagraph' is not available.}}
\fi
\endinput
%%
%% End of file `limap.cls'.