%%
%% This is file `ejpecp.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ejpecp.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (c), 2011 by Krzysztof BURDZY and Djalil CHAFAI for EJP-ECP
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{ejpecp}
    [2012/01/09 v0.57721 .dtx ejpecp file]
\ClassInfo{ejpecp}{Copyright (c), 2011, 2012, BURDZY and CHAFAI for EJP-ECP.}
%% We declare and handle our class options
\DeclareOption{EJP}{%
  \makeatletter
  \newcommand{\@EJP}{}
  \newcommand{\@JOURNAL}{EJP}
  \newcommand{\@JOURNALA}{Electron. J. Probab.}
  \newcommand{\@JOURNALL}{Electronic Journal of Probability}
  \newcommand{\@ISSN}{1083-6489}
  \newcommand{\@URL}{ejp.ejpecp.org}
  \makeatother
}
\DeclareOption{ECP}{%
  \makeatletter
  \newcommand{\@ECP}{}
  \newcommand{\@JOURNAL}{ECP}
  \newcommand{\@JOURNALA}{Electron. Commun. Probab.}
  \newcommand{\@JOURNALL}{Electronic Communications in Probability}
  \newcommand{\@ISSN}{1083-589X}
  \newcommand{\@URL}{ecp.ejpecp.org}
  \makeatother
}
\DeclareOption{NODS}{% asks to avoid renaming \mathbb into \mathds
  \makeatletter
  \newcommand{\@NODS}{}
  \makeatother
}
\DeclareOption{draft}{%
 \PassOptionsToClass{draft}{article}
}
\DeclareOption{final}{%
 \PassOptionsToClass{final}{article}
}
\DeclareOption*{%
  \PackageWarning{ejpecp}{Unknown option ‘\CurrentOption’}%
}
\ProcessOptions\relax
%% We use the standard article class
\LoadClass[a4paper,10pt,twoside]{article}
%% Packages and their options
\RequirePackage[pdftex]{graphicx}
\DeclareGraphicsExtensions{.pdf,.PDF,.eps,.EPS,.png,.PNG,.jpg,.JPG,.jpeg,.JPEG}
\RequirePackage{lastpage}
\RequirePackage{amsmath,amsfonts,amssymb,amsthm,latexsym,dsfont}
\RequirePackage{geometry}
\geometry{a4paper,portrait,left=4.5cm,right=2.5cm,top=3.5cm,bottom=3.5cm}
\RequirePackage{bera} % beware that the logo is sensitive to default font change
\RequirePackage[pdftex,pagebackref=false]{hyperref}
\hypersetup{colorlinks=false}
\hypersetup{pdfborder=0}
\hypersetup{pdfcreator=pdflatex engine with ejpecp class}
\hypersetup{pdfstartview={FitH}}
%%%% Macros et Environments
%% General macros
\makeatletter%
\newcommand{\@TITLE}{FIXME!}
\newcommand{\@SHORTTITLE}{FIXME!}
\newcommand{\@KEYWORDS}{FIXME!}
\newcommand{\@AMSSUBJ}{FIXME!}
\newcommand{\@ABSTRACT}{FIXME!}
\newcommand{\@VOLUME}{0}
\newcommand{\@PAPERNUM}{0}
\newcommand{\@YEAR}{2012}
\newcommand{\@PAGESTART}{1}
\newcommand{\@PAGEEND}{\pageref{LastPage}}  % using lastpage package
\newcommand{\@SUBMITTED}{FIXME!}
\newcommand{\@ACCEPTED}{FIXME!}
\newcommand{\TITLE}[1]{\renewcommand{\@TITLE}{#1}}
\newcommand{\SHORTTITLE}[1]{\renewcommand{\@SHORTTITLE}{#1}}
\newcommand{\AUTHORS}[1]{\author{#1}}
\newcommand{\KEYWORDS}[1]{\renewcommand{\@KEYWORDS}{#1}}
\newcommand{\AMSSUBJ}[1]{\renewcommand{\@AMSSUBJ}{#1}}
\newcommand{\AMSSUBJSECONDARY}[1]{\gdef\@AMSSUBJSECONDARY{#1}}
\newcommand{\ABSTRACT}[1]{\renewcommand{\@ABSTRACT}{#1}}
\newcommand{\VOLUME}[1]{\renewcommand{\@VOLUME}{#1}}
\newcommand{\PAPERNUM}[1]{\renewcommand{\@PAPERNUM}{#1}}
\newcommand{\YEAR}[1]{\renewcommand{\@YEAR}{#1}}
\newcommand{\PAGESTART}[1]{\renewcommand{\@PAGESTART}{#1}} % unused
\newcommand{\PAGEEND}[1]{\renewcommand{\@PAGEEND}{#1}} % unused
\newcommand{\SUBMITTED}[1]{\renewcommand{\@SUBMITTED}{#1}}
\newcommand{\ACCEPTED}[1]{\renewcommand{\@ACCEPTED}{#1}}
\newcommand{\DOI}[1]{\gdef\@DOI{10.1214/\@JOURNAL.#1}}
\newcommand{\ARXIVID}[1]{\gdef\@ARXIVID{#1}}
\newcommand{\ACKNO}[1]{\noindent\textbf{Acknowledgments.} #1}
\newcommand{\EMAIL}[1]{E-mail:~\texttt{\href{mailto:#1}{#1}}}
\makeatother
%% Logos
\makeatletter
\newcommand{\@EJPLOGO}{% designed by KB.
  % This version is for bera 10pt (depends on the font via "em" and "ex")
  \centerline {%
    \hbox {%
      %\vrule  height -0.4 pt depth 0.8 pt width 26.5 em\space %
      \vrule  height -0.4 pt depth 0.8 pt width 27.7 em\space %
      %\kern   -26.5 em\space %
      \kern   -27.8 em\space %
      \raise   0.03ex  \hbox {\bf  E}\space %
      \raise   0.06ex \hbox {l}\space %
      \raise  .13ex \hbox {e}\space %
      \raise  .24ex \hbox {c}\space %
      \raise  .45ex \hbox {t}\space %
      \raise  .78ex \hbox {r}\space %
      \raise  1.31ex \hbox {o}\space %
      \raise  2.08ex \hbox {n}\space %
      \raise  3.14ex \hbox {i}\space %
      \raise  4.53ex \hbox {c}\space %
      \kern    1em\space %
      \raise  8.15ex \hbox {\bf  J}\space %
      \raise  10.15ex \hbox {o}\space %
      \raise  12.04ex \hbox {u}\space %
      \raise  13.60ex \hbox {r}\space %
      \raise  14.64ex \hbox {n}\space %
      \kern  .3 em\space %
      \vrule  depth 0.8pt height 14.5ex \space % %BEST!
      \kern  -.3em\space %
      \raise  15ex \hbox {a}\space %
      \raise  14.64ex \hbox {l}\space %
      \kern    1em\space %
      \raise  12.04ex \hbox {o}\space %
      \raise  10.15ex \hbox {f}\space %
      \kern    1em\space %
      \raise  6.23ex \hbox {\bf  P}\space %
      \raise  4.53ex \hbox {r}\space %
      \raise  3.14ex \hbox {o}\space %
      \raise  2.08ex \hbox {b}\space %
      \raise  1.31ex \hbox {a}\space %
      \raise  .78ex \hbox {b}\space %
      \raise  .45ex \hbox {i}\space %
      \raise  .24ex \hbox {l}\space %
      \raise  .13ex \hbox {i}\space %
      \raise  .06ex \hbox {t}\space %
      \raise  .03ex \hbox {y}%
    }%
  }%
}%EJPLOGO
\newcommand{\@ECPLOGO}{% designed when Ren\'e Carmona was in charge of ECP
  \raisebox{0.3cm}{\parbox[t]{1.3in}{\noindent\rule{1.3in}{1.6pt}\\
      \textbf{ ELECTRONIC}\\
      \textbf{ COMMUNICATIONS}\\
      \textbf{ in PROBABILITY}\\
      \rule[.08in]{1.3in}{1.6pt}}}
}%ECPLOGO
\makeatother
%% Macro handling the first page
\makeatletter
\newcommand{\FIRSTPAGE}{%
  \setcounter{page}{\@PAGESTART}%
  \title{\small%
    \ifx\@EJP\undefined\else%
    \@EJPLOGO
    \bigskip
    \centerline{\@JOURNALA\ \textbf{\@VOLUME} (\@YEAR),\ %
     no. \@PAPERNUM, \,\@PAGESTART--\@PAGEEND.} %
     \centerline{ISSN:\ \texttt{\href{http://\@URL/}{\@ISSN}} %
     \ifx\@DOI\undefined\else%
     \ DOI: \texttt{\href{http://dx.doi.org/\@DOI}{\@DOI}}%
     \fi} %
    \bigskip
    \bigskip
    {\Large\bfseries\@TITLE}%\ifx\@THANKS\undefined\else\thanks{\@THANKS}\fi
    \fi%EJP
    \ifx\@ECP\undefined\else%
    \parbox[t]{9cm}{%
      \@JOURNALA\ \textbf{\@VOLUME} (\@YEAR), %
      no. \@PAPERNUM, \@PAGESTART--\@PAGEEND.\\ %
      \ifx\@DOI\undefined\else%
      \ DOI: \texttt{\href{http://dx.doi.org/\@DOI}{\@DOI}}%
      \fi \\ %
      ISSN:\ \texttt{\href{http://\@URL/}{\@ISSN}}%
    }%
    \hfill
    \@ECPLOGO\\
    \bigskip
    \bigskip
    {\Large\@TITLE}%\ifx\@THANKS\undefined\else\thanks{\@THANKS}\fi
    \fi%ECP
  } % end title
 \date{}%
 \maketitle\thispagestyle{empty}%
 \begin{abstract}%
   \noindent%
   \@ABSTRACT\\[1em]%
   {\footnotesize\newlength{\@DH}\setlength{\@DH}{-.2em}%
   \textbf{Keywords: }%
   \@KEYWORDS.\\[\@DH]%
   \textbf{AMS 2010 Subject Classification: }%
   \ifx\@AMSSUBJSECONDARY\undefined
    \@AMSSUBJ.
   \else
    Primary \@AMSSUBJ, Secondary \@AMSSUBJSECONDARY.
   \fi\\[0.5em]
   Submitted to \@JOURNAL\ on \@SUBMITTED, %
    final version accepted on \@ACCEPTED.\\[\@DH]%
   \ifx\@ARXIVID\undefined\else%
    Supersedes %
     \texttt{\href{http://arXiv.org/abs/\@ARXIVID}{arXiv:\@ARXIVID}}.%
   \fi%
   }%footnotesize
 \end{abstract}

 \smallskip

}%END-FIRSTPAGE
\makeatother
%% Bibliography
\makeatletter
\def\@MRExtract#1 #2!{#1}     % thanks, Martin!
\newcommand{\MR}[1]{% we need to strip the "(...)"
  \xdef\@MRSTRIP{\@MRExtract#1 !}%
  \href{http://www.ams.org/mathscinet-getitem?mr=\@MRSTRIP}{MR-\@MRSTRIP}}
\makeatother
\newcommand{\ARXIV}[1]{\href{http://arXiv.org/abs/#1}{arXiv:#1}}
\makeatletter
\renewenvironment{thebibliography}[1]{%
  \section*{\refname
    \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}}%
  \list{\@biblabel{\@arabic\c@enumiv}}{%
    \small%
    \setlength{\labelwidth}{0em}%
    \setlength{\labelsep}{0.4em}%
    \setlength{\leftmargin}{\labelwidth}%
    \addtolength{\leftmargin}{\labelsep}%
    \setlength{\itemsep}{-.25em}%
    \@openbib@code
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m}{%
  \def\@noitemerr{%
    \@latex@warning{Empty `thebibliography' environment}}%
  \endlist}
\makeatother
%% Theorem styles
\newtheoremstyle{ejpecpbodyit}% name % cf. thmtest.tex of AMSLaTeX
  {3pt}%      Space above
  {3pt}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent,
    %         \parindent = para indent)
  {\bfseries\sffamily}% Thm head font
  {.}%        Punctuation after thm head
  { }%        Space after thm head: " " = normal interword space;
     %        \newline = linebreak
  {}%         Thm head spec (can be left empty, meaning `normal')
\newtheoremstyle{ejpecpbodyrm}% name % cf. thmtest.tex of AMSLaTeX
  {3pt}%      Space above
  {3pt}%      Space below
  {}%         Body font
  {}%         Indent amount (empty = no indent,
    %         \parindent = para indent)
  {\bfseries\sffamily}% Thm head font
  {.}%        Punctuation after thm head
  { }%        Space after thm head: " " = normal interword space;
     %        \newline = linebreak
  {}%         Thm head spec (can be left empty, meaning `normal')
%%
\theoremstyle{ejpecpbodyit}
\newtheorem{theorem}{Theorem}[section]%
\newtheorem{corollary}[theorem]{Corollary}%
\newtheorem{proposition}[theorem]{Proposition}%
\newtheorem{lemma}[theorem]{Lemma}%
\newtheorem{definition}[theorem]{Definition}%
\newtheorem{fact}[theorem]{Fact}%
\newtheorem{notation}[theorem]{Notation}%
\newtheorem{hypothesis}[theorem]{Hypothesis}%
\newtheorem{heuristics}[theorem]{Heuristics}%
\newtheorem{conjecture}[theorem]{Conjecture}%
\theoremstyle{ejpecpbodyrm}%
\newtheorem{example}[theorem]{Example}%
\newtheorem{exercise}[theorem]{Exercise}%
\newtheorem{problem}[theorem]{Problem}%
\newtheorem{remark}[theorem]{Remark}%
%%%% Commands to be executed before \begin{document}
%% Numbering
\numberwithin{equation}{section}
%% Itemize and enumerate for bera
\makeatletter
\newcommand{\@reduceitemsep}{\addtolength{\itemsep}{-0.5\baselineskip}}
\let\OLD@itemize\itemize
\renewcommand\itemize{\OLD@itemize\@reduceitemsep}
\let\OLD@enumerate\enumerate
\renewcommand\enumerate{\OLD@enumerate\@reduceitemsep}
\makeatother
%% Replace \mathbb by \mathds except if we require the contrary
\makeatletter
\ifx\@NODS\undefined%
\let\realmathbb=\mathbb
\let\mathbb=\mathds
\else%
\fi
\makeatother
%% Headings
\makeatletter
\renewcommand{\@evenfoot}
{\small\normalfont%
  \newcommand{\@ARTICLEBLOB}{\@JOURNALA\normalfont\ %
    \textbf{\@VOLUME}\, (\@YEAR),\ %
    no. \@PAPERNUM, \,\@PAGESTART--\@PAGEEND.}
  \href{http://dx.doi.org/\@DOI}{\@ARTICLEBLOB}\ %
  \hfil\href{http://\@URL}{\@URL}}
\renewcommand{\@oddfoot}{\@evenfoot}
\renewcommand{\@evenhead}
{\small\upshape {\thepage}\ \hfil\@SHORTTITLE\hfil}
\renewcommand{\@oddhead}
{\small\hfil\@SHORTTITLE\hfil \upshape\ \thepage}
\makeatother
%% smaller sections titles
\makeatletter
\renewcommand{\section}{\@startsection%
  {section}%                           % name
  {1}%                                 % level
  {0em}%                               % indent
  {\baselineskip}%                     % beforeskip
  {0.5\baselineskip}%                  % afterskip
  {\normalfont\large\bfseries}}%       % style
\renewcommand{\subsection}{\@startsection%
  {subsection}%                        % name
  {2}%                                 % level
  {0em}%                               % indent
  {\baselineskip}%                     % beforeskip
  {0.25\baselineskip}%                 % afterskip
  {\normalfont\bfseries}%              % style
}
\makeatother
%% Macros
%%%% Commands to be executed just after \begin{document}
\AtBeginDocument{%
 \FIRSTPAGE%
}
%%%% Commands to be executed just before \end{document}
\AtEndDocument{\vfill}
\endinput
%%
%% End of file `ejpecp.cls'.
