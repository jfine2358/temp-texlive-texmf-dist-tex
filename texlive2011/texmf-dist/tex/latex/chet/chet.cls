% chet.cls
% Copyright 2011 Andreas Stergiou
%
% This class is supposed to streamline latex typesetting and give the look and feel of harvmac to a paper, with the use of LaTex2e.
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.

\ProvidesClass{chet}

\LoadClass[12pt]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{filecontents}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%    rcite   %%%%%%%%%%%%%%%%%%%%%%%%%%%

\begin{filecontents}{rcite.sty}
\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{rcite}[2011/05/04]

\renewcommand{\rcite}[1]{\cite{#1}$^{\normalfont\text{\textsf{#1}}}$}

\endinput
\end{filecontents}


%%%%%%%%%%%%%%%%%%%%%%%%%%    chetapp   %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% chetapp.sty
% Copyright 2011 Andreas Stergiou
%
% This is basically a copy of appendix.sty with minor changes.
%
%% This is file `appendix.sty',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% appendix.dtx  (with options: `usc')
%% 
%% -----------------------------------------------------------------
%%   Author: Peter Wilson, Herries Press
%%   Maintainer: Will Robertson (will dot robertson at latex-project dot org)
%%   Copyright 1998--2004 Peter R. Wilson
%% 
%%   This work may be distributed and/or modified under the
%%   conditions of the LaTeX Project Public License, either
%%   version 1.3c of this license or (at your option) any
%%   later version: <http://www.latex-project.org/lppl.txt>
%% 
%%   This work has the LPPL maintenance status "maintained".
%%   The Current Maintainer of this work is Will Robertson.
%% 
%%   This work consists of the files listed in the README file.
%% -----------------------------------------------------------------
%% 
\begin{filecontents}{chetapp.sty}

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{chetapp}[2011/05/04]

\newif\if@chapter@pp\@chapter@ppfalse
\newif\if@knownclass@pp\@knownclass@ppfalse
\@ifundefined{chapter}{%
  \@ifundefined{section}{}{\@knownclass@pptrue}}{%
  \@chapter@pptrue\@knownclass@pptrue}
\providecommand{\phantomsection}{}
\newcounter{@pps}
  \renewcommand{\the@pps}{\alph{@pps}}
\newif\if@pphyper
  \@pphyperfalse
\AtBeginDocument{%
  \@ifpackageloaded{hyperref}{\@pphypertrue}{}}

\newif\if@dotoc@pp\@dotoc@ppfalse
\newif\if@dotitle@pp\@dotitle@ppfalse
\newif\if@dotitletoc@pp\@dotitletoc@ppfalse
\newif\if@dohead@pp\@dohead@ppfalse
\newif\if@dopage@pp\@dopage@ppfalse
\DeclareOption{toc}{\@dotoc@pptrue}
\DeclareOption{title}{\@dotitle@pptrue}
\DeclareOption{titletoc}{\@dotitletoc@pptrue}
\DeclareOption{header}{\@dohead@pptrue}
\DeclareOption{page}{\@dopage@pptrue}
\ProcessOptions\relax
\newcommand{\@ppendinput}{}
\if@knownclass@pp\else
  \PackageWarningNoLine{appendix}%
    {There is no \protect\chapter\space or \protect\section\space command.\MessageBreak
     The appendix package will not be used}
  \renewcommand{\@ppendinput}{\endinput}
\fi
\@ppendinput

\newcommand{\appendixtocon}{\@dotoc@pptrue}
\newcommand{\appendixtocoff}{\@dotoc@ppfalse}
\newcommand{\appendixpageon}{\@dopage@pptrue}
\newcommand{\appendixpageoff}{\@dopage@ppfalse}
\newcommand{\appendixtitleon}{\@dotitle@pptrue}
\newcommand{\appendixtitleoff}{\@dotitle@ppfalse}
\newcommand{\appendixtitletocon}{\@dotitletoc@pptrue}
\newcommand{\appendixtitletocoff}{\@dotitletoc@ppfalse}
\newcommand{\appendixheaderon}{\@dohead@pptrue}
\newcommand{\appendixheaderoff}{\@dohead@ppfalse}
\newcounter{@ppsavesec}
\newcounter{@ppsaveapp}
\setcounter{@ppsaveapp}{0}
\newcommand{\@ppsavesec}{%
  \if@chapter@pp \setcounter{@ppsavesec}{\value{chapter}} \else
                 \setcounter{@ppsavesec}{\value{section}} \fi}
\newcommand{\@pprestoresec}{%
  \if@chapter@pp \setcounter{chapter}{\value{@ppsavesec}} \else
                 \setcounter{section}{\value{@ppsavesec}} \fi}
\newcommand{\@ppsaveapp}{%
  \if@chapter@pp \setcounter{@ppsaveapp}{\value{chapter}} \else
                 \setcounter{@ppsaveapp}{\value{section}} \fi}
\newcommand{\restoreapp}{%
  \if@chapter@pp \setcounter{chapter}{\value{@ppsaveapp}} \else
                 \setcounter{section}{\value{@ppsaveapp}} \fi}
\providecommand{\appendixname}{Appendix}
\newcommand{\appendixtocname}{Appendices}
\newcommand{\appendixpagename}{Appendices}
\newcommand{\appendixpage}{%
  \if@chapter@pp \@chap@pppage \else \@sec@pppage \fi
}
\newcommand{\clear@ppage}{%
  \if@openright\cleardoublepage\else\clearpage\fi}

\newcommand{\@chap@pppage}{%
  \clear@ppage
  \thispagestyle{plain}%
  \if@twocolumn\onecolumn\@tempswatrue\else\@tempswafalse\fi
  \null\vfil
  \markboth{}{}%
  {\centering
   \interlinepenalty \@M
   \normalfont
   \Huge \bfseries \appendixpagename\par}%
  \if@dotoc@pp
    \addappheadtotoc
  \fi
  \vfil\newpage
  \if@twoside
    \if@openright
      \null
      \thispagestyle{empty}%
      \newpage
    \fi
  \fi
  \if@tempswa
    \twocolumn
  \fi
}

\newcommand{\@sec@pppage}{%
  \par
  \addvspace{4ex}%
  \@afterindentfalse
  {\parindent \z@ \raggedright
   \interlinepenalty \@M
   \normalfont
   \huge \bfseries \appendixpagename%
   \markboth{}{}\par}%
  \if@dotoc@pp
    \addappheadtotoc
  \fi
  \nobreak
  \vskip 3ex
  \@afterheading
}

\newif\if@pptocpage
  \@pptocpagetrue
\newcommand{\noappendicestocpagenum}{\@pptocpagefalse}
\newcommand{\appendicestocpagenum}{\@pptocpagetrue}
\newcommand{\addappheadtotoc}{%
  \phantomsection
  \if@chapter@pp
    \if@pptocpage
      \addcontentsline{toc}{chapter}{\appendixtocname}%
    \else
      \if@pphyper
        \addtocontents{toc}%
          {\protect\contentsline{chapter}{\appendixtocname}{}{\@currentHref}}%
      \else
        \addtocontents{toc}%
          {\protect\contentsline{chapter}{\appendixtocname}{}}%
      \fi
    \fi
  \else
    \if@pptocpage
      \addcontentsline{toc}{section}{\appendixtocname}%
    \else
      \if@pphyper
        \addtocontents{toc}%
          {\protect\contentsline{section}{\appendixtocname}{}{\@currentHref}}%
      \else
        \addtocontents{toc}%
          {\protect\contentsline{section}{\appendixtocname}{}}%
      \fi
    \fi
  \fi
}

\providecommand{\theH@pps}{\alph{@pps}}

\newcommand{\@resets@pp}{\par
  \@ppsavesec
  \stepcounter{@pps}
  \setcounter{section}{0}%
  \if@chapter@pp
    \setcounter{chapter}{0}%
    \renewcommand\@chapapp{\appendixname}%
    \renewcommand\thechapter{\@Alph\c@chapter}%
  \else
    \setcounter{subsection}{0}%
    \renewcommand\thesection{\@Alph\c@section}%
  \fi
  \if@pphyper
    \if@chapter@pp
      \renewcommand{\theHchapter}{\theH@pps.\Alph{chapter}}%
    \else
      \renewcommand{\theHsection}{\theH@pps.\Alph{section}}%
    \fi
    \def\Hy@chapapp{\appendixname}%
  \fi
  \restoreapp
}

\newenvironment{appendices}{%
  \@resets@pp
  \if@dotoc@pp
    \if@dopage@pp              % both page and toc
      \if@chapter@pp           % chapters
        \clear@ppage
      \fi
      \appendixpage
    \else                      % toc only
       \if@chapter@pp          % chapters
         \clear@ppage
       \fi
      \addappheadtotoc
    \fi
  \else
    \if@dopage@pp              % page only
      \appendixpage
    \fi
  \fi
  \if@chapter@pp
    \if@dotitletoc@pp \@redotocentry@pp{chapter} \fi
  \else
    \if@dotitletoc@pp \@redotocentry@pp{section} \fi
    \if@dohead@pp
      \def\sectionmark##1{%
        \if@twoside
          \markboth{\@formatsecmark@pp{##1}}{}
        \else
          \markright{\@formatsecmark@pp{##1}}{}
        \fi}
    \fi
    \if@dotitle@pp
      \def\sectionname{\appendixname}
      \def\@seccntformat##1{\@ifundefined{##1name}{}{\csname ##1name\endcsname\ }%
        \csname the##1\endcsname.\hspace{4.6pt}}
    \fi
  \fi}{%
  \@ppsaveapp\@pprestoresec}

\newcommand{\setthesection}{\thechapter.\Alph{section}}
\newcommand{\setthesubsection}{\thesection.\Alph{subsection}}

\newcommand{\@resets@ppsub}{\par
  \stepcounter{@pps}
  \if@chapter@pp
    \setcounter{section}{0}
    \renewcommand{\thesection}{\setthesection}
  \else
    \setcounter{subsection}{0}
    \renewcommand{\thesubsection}{\setthesubsection}
  \fi
  \if@pphyper
    \if@chapter@pp
      \renewcommand{\theHsection}{\theH@pps.\setthesection}%
    \else
      \renewcommand{\theHsubsection}{\theH@pps.\setthesubsection}%
    \fi
    \def\Hy@chapapp{\appendixname}%
  \fi
}

\newenvironment{subappendices}{%
  \@resets@ppsub
  \if@chapter@pp
    \if@dotitletoc@pp \@redotocentry@pp{section} \fi
    \if@dotitle@pp
      \def\sectionname{\appendixname}
      \def\@seccntformat##1{\@ifundefined{##1name}{}{\csname ##1name\endcsname\ }%
        \csname the##1\endcsname\quad}
    \fi
  \else
    \if@dotitletoc@pp \@redotocentry@pp{subsection} \fi
    \if@dotitle@pp
      \def\subsectionname{\appendixname}
      \def\@seccntformat##1{\@ifundefined{##1name}{}{\csname ##1name\endcsname\ }%
        \csname the##1\endcsname.\hspace{4.6pt}}
    \fi
  \fi}{}

\newcommand{\@formatsecmark@pp}[1]{%
  \MakeUppercase{\appendixname\space
    \ifnum \c@secnumdepth >\z@
      \thesection\quad
    \fi
    #1}}
\newcommand{\@redotocentry@pp}[1]{%
  \let\oldacl@pp=\addcontentsline
  \def\addcontentsline##1##2##3{%
    \def\@pptempa{##1}\def\@pptempb{toc}%
    \ifx\@pptempa\@pptempb
      \def\@pptempa{##2}\def\@pptempb{#1}%
      \ifx\@pptempa\@pptempb
\oldacl@pp{##1}{##2}{\appendixname\space ##3}%
      \else
        \oldacl@pp{##1}{##2}{##3}%
      \fi
    \else
      \oldacl@pp{##1}{##2}{##3}%
    \fi}
}
\endinput
%

\end{filecontents}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%    chetref       %%%%%%%%%%%%%%%%%%%%%%%%%

\begin{filecontents}{chetref.bst}
% chetref.bst
% Copyright 2011 Andreas Stergiou
%
% This is is basically a copy of nb.bst, with minor stylistic changes and additions.
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
 
% This is nb.bst 2010/04/06 v1.02 
% A BibTeX style for fancy unsorted bibliographies in high energy physics
%
% nb.bst Copyright (C) 2003-2010 Niklas Beisert
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Niklas Beisert.
%
% This work consists of the files nb.bst
%

        % this work is based on BibTeX standard bibliography style `unsrt'
	% version 0.99a for BibTeX versions 0.99a or later, LaTeX version 2.09.
	% Copyright (C) 1985, all rights reserved.
	% Copying of this file is authorized only if either
	% (1) you make absolutely no changes to your copy, including name, or
	% (2) if you do make changes, you name it something other than
	% btxbst.doc, plain.bst, unsrt.bst, alpha.bst, and abbrv.bst.
	% This restriction helps ensure that all standard styles are identical.
	% The file btxbst.doc has the documentation for this style.
ENTRY
  { address
    author
    archive
    booktitle
    chapter
    collaboration
    doi
    edition
    editor
    eprint
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    SLACcitation
    title
    type
    url
    volume
    year
  }
  {}
  { label }

STRINGS { s t }

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{f{.}.~}{vv~~}{ll}{,~jj}" format.name$ 't :=
      nameptr #1 >
	{ namesleft #1 >
	    { ", " * t * }
	    { t "others" =
		{ " et~al." * }
		{ " \& " * t * }
	      if$
	    }
	  if$
	}
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
	{ t #1 #2 substring$ "--" = not
	    { "--" *
	      t #2 global.max$ substring$ 't :=
	    }
	    {   { t #1 #1 substring$ "-" = }
		{ "-" *
		  t #2 global.max$ substring$ 't :=
		}
	      while$
	    }
	  if$
	}
	{ t #1 #1 substring$ *
	  t #2 global.max$ substring$ 't :=
	}
      if$
    }
  while$
}

FUNCTION {first.page}
{ 't :=
  ""
  { t empty$ not 
    t #1 #1 substring$ duplicate$ "-" = not 
                 swap$ duplicate$ "," = not 
                            swap$ "+" = not 
    and and and }
    { 
      t #1 #1 substring$ *
      t #2 global.max$ substring$ 't :=
    }
  while$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
	{ #1 'multiresult := }
	{ t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

INTEGERS { output.state }

FUNCTION {output}
{ 
  's := 
  s empty$
    'skip$
    {
      output.state #1 =
        { ", " write$ newline$  }
        { #1 'output.state := }
      if$ 
      s write$
    }
  if$
}

FUNCTION {begin.entry}
{ 
  "\bibitem{" cite$ * "}" * write$ newline$
  #0 'output.state :=
}

FUNCTION {fin.entry}
{ 
  output.state #1 =
    { ". " write$ newline$ }
    'skip$
  if$
}

FUNCTION {output.spires}
{ 
  SLACcitation empty$
    'skip$
    { SLACcitation write$ newline$ }
  if$
}

FUNCTION {format.authors}
{ 
  collaboration empty$
    { "" }
    { collaboration " Collaboration, " * }
  if$
  author empty$
    { "" }
    { author format.names }
  if$
  *
}

FUNCTION {format.url}
{ 
  url empty$
    { "" }
    { "\href{" url * "}{\texttt{" * url * "}}" * }
  if$
}

FUNCTION {format.editor}
{ 
  editor empty$
    { "" }
    { "ed: " editor format.names * }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { "\textit{``" title * "''}" *}
  if$
}

FUNCTION {format.btitle}
{ title empty$
    { "" }
    { "\textit{``" title * "''}" *}
  if$
}

INTEGERS { tilden tildepos }

FUNCTION {puttilde}
{
  's := 
  s text.length$ 'tilden :=
  #0 'tildepos :=
  { tildepos tilden < }
  { tildepos #1 + 'tildepos := 
    s tildepos #1 substring$ " " = 
      { s #1 tildepos #1 - substring$ "~" * 
        s tildepos #1 + tilden tildepos - substring$ * 's := }
      'skip$ 
    if$
  }
  while$  
  s
}

STRINGS { nvol ndoi }

FUNCTION {format.journal}
{ 
  journal empty$
    { "" }
    { 
      volume empty$ { "no volume for journal in " cite$ * warning$ } 'skip$ if$
      pages empty$ { "no pages for journal in " cite$ * warning$ } 'skip$ if$
      year empty$ { "no year for journal in " cite$ * warning$ } 'skip$ if$

      volume 'nvol :=

      journal "JHEP" = nvol text.length$ #2 = and 
        { year #3 #2 substring$ nvol * 'nvol := }
        'skip$ 
      if$

      doi empty$ { "" } { doi } if$ 'ndoi := 

      journal "JHEP" = ndoi "" = and 
        { 
          year #1 #3 substring$ "200" = year #1 #3 substring$ "199" = or
          {
            "10.1088/1126-6708/" year * 
            "/" * nvol #3 #2 substring$ * 
            "/" * pages first.page *
            'ndoi :=
          }
          {
            "10.1007/JHEP" nvol #3 #2 substring$ * "(" * year * ")" * pages first.page *
            'ndoi :=
          }
        if$
        }
        'skip$ 
      if$
      "" 
      ndoi "" = { } { "\doiref{" * ndoi * "}{" * } if$
      journal puttilde *
      " \textbf{" *
      nvol * 
      "}, " *
      pages first.page * 
      year empty$
        { } 
        { " (" * year * ")" * }
      if$
      ndoi "" = { } { "}" * } if$
      "" *
    }
  if$
}

INTEGERS { spacen spacepos }

FUNCTION { formatarxiv }
{
  's := 
  s #1 #6 substring$ "arXiv:" =
  {
    s #7 s text.length$ #6 - substring$ 's :=
  }
  'skip$ 
  if$

  s text.length$ 'spacen :=
  #0 'spacepos :=
  { spacepos spacen < }
  { spacepos #1 + 'spacepos := 
    s spacepos #1 substring$ " " = 
      { 
        spacepos #1 - 'spacen := 
        s #1 spacen substring$ 's := 
      }
      'skip$ 
    if$
  }
  while$  
  s
}

FUNCTION { arxivprefix }
{
  's := 
  s #1 #1 substring$ chr.to.int$ "0" chr.to.int$ <
  s #1 #1 substring$ chr.to.int$ "9" chr.to.int$ > + 
  'skip$ 
  {
    "arXiv:" s * 's :=
  }
  if$
  s
}

FUNCTION {format.eprint}
{ eprint empty$
    { "" }
    { "\normalsize{\texttt{\arxivref{" eprint formatarxiv * "}{" * eprint formatarxiv arxivprefix * "}}}" * }
  if$
}

FUNCTION {format.note}
{ note empty$
    { "" }
    { note }
  if$
}

FUNCTION {format.date}
{ year empty$
    { "" }
    { " (" year * ")" *}
  if$
}

FUNCTION {format.publisher}
{ publisher empty$
    { "" }
    { publisher format.date *}
  if$
}

FUNCTION {format.address}
{ address empty$
    { "" }
    { address }
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { edition "l" change.case$ " edition" * }
  if$
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { "p.~" pages *}
  if$
}

FUNCTION {do.inbook}
{ booktitle empty$
    { }
    { "in \textit{``" booktitle * "''}" * output
      format.edition output
      format.editor output
      format.publisher output
      format.address output
      format.pages output
    }
  if$
}

FUNCTION {article}
{ 
  crossref missing$ 'skip$ { "crossref in " cite$ * warning$} if$
  author missing$ { "author missing in " cite$ * warning$} 'skip$ if$
  title missing$ journal missing$ and eprint missing$ and note missing$ and { "title, journal, eprint and note missing in " cite$ * warning$} 'skip$ if$
  begin.entry
  format.authors output
  format.title output
  format.journal output
  format.eprint output
  do.inbook 
  format.note output
  format.url output
  fin.entry
  output.spires
  newline$
}


FUNCTION {book}
{
  crossref missing$ 'skip$ { "crossref in " cite$ * warning$} if$
  author missing$ { "author missing in " cite$ * warning$} 'skip$ if$
  title missing$ { "title missing in " cite$ * warning$} 'skip$ if$
  publisher missing$ { "publisher missing in " cite$ * warning$} 'skip$ if$

  begin.entry
  format.authors output
  
  format.btitle output
  format.edition output
  format.publisher output
  format.address output
  format.pages output
  format.note output
  fin.entry
  newline$
}

FUNCTION {inbook}
{     begin.entry
      format.authors output
      format.title output
      "in \textit{``" booktitle * "''}" * output
      format.edition output
      format.editor output
      format.pages output
      format.publisher output
      format.address output
      fin.entry
}

FUNCTION {inproceedings}
    { begin.entry
      format.authors output
      format.title output
      "in \textit{``" booktitle * "''}" * output
      format.edition output
      format.editor output
      format.pages output
      format.publisher output
      format.address output
      fin.entry
}


FUNCTION {default.type} { article }

READ

STRINGS { longest.label }

INTEGERS { number.label longest.label.width }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}

FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}

EXECUTE {initialize.longest.label}

ITERATE {longest.label.pass}

FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "%bibliography generated by nb.bst v1.01 (C) 2003-2010 Niklas Beisert" write$ newline$
  "\begin{thebibliography}{"  longest.label  * "}" * write$ newline$
  "\ifx\href\asklfhas\newcommand{\href}[2]{#2}\fi" write$ newline$
  "\ifx\arxivref\asklfhas\newcommand{\arxivref}[2]{\href{http://arxiv.org/abs/#1}{#2}}\fi" write$ newline$
  "\ifx\doiref\asklfhas\newcommand{\doiref}[2]{\href{http://dx.doi.org/#1}{#2}}\fi" write$ newline$
  "\parskip 0pt" write$ newline$
  "\normalsize" write$ newline$
%  "\itemsep 0pt" write$ newline$

  newline$
}

EXECUTE {begin.bib}

ITERATE {call.type$}

FUNCTION {end.bib}
{ 
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}

\end{filecontents}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{xparse}
\usepackage{xspace}
\usepackage{datetime}
\usepackage{amsmath}
\usepackage[labelsep=colon,labelfont=bf]{caption}
\usepackage{tocloft}
\usepackage[title,titletoc]{chetapp}
\usepackage{pifont}
\usepackage{cite}
\usepackage{color}
\usepackage{collref}
\usepackage{footmisc}
\usepackage[left=2.5cm,right=2.5cm,top=2.5cm,bottom=3cm]{geometry}
\usepackage[linktocpage]{hyperref}

\numberwithin{equation}{section}

\newcommand{\rcite}{\cite}
\newcommand{\draftmode}{\usepackage[notref,notcite]{showkeys}\usepackage{rcite}}
\providecommand*\showkeyslabelformat[1]{\normalfont\sffamily\footnotesize#1}

\newcommand{\multaffil}{\usepackage[noblocks,affil-it]{authblk}\setlength{\affilsep}{0.5cm}\renewcommand{\affiliation}{\affil}\renewcommand\Authsep{, } \renewcommand\Authand{ and } \renewcommand\Authands{ and }}

% Table of contents formatting
\setcounter{tocdepth}{3}
\renewcommand{\cfttoctitlefont}{\hfill\bfseries}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsubsecaftersnum}{.}
\renewcommand{\cftsubsubsecaftersnum}{.}
\renewcommand{\cftdotsep}{8}
\newcommand{\toc}{\tableofcontents}

% Numbered equation with optional label
\NewDocumentCommand\eqn{mo}{%
  \IfNoValueTF{#2}
     {\[ #1 \]}
     {\begin{equation}\label{#2} #1 \end{equation} \expandafter\newcommand\csname #2\endcsname{\eqref{#2}\xspace}\ignorespaces}
}
% Numbered aligned equation with optional label in the vertical middle
\NewDocumentCommand\eqna{mo}{%
  \IfNoValueTF{#2}
    {\begin{align*} #1 \end{align*}}
    {\begin{equation}\label{#2}\begin{split} #1 \end{split}\end{equation} \expandafter\def\csname #2\endcsname{\eqref{#2}\xspace}\ignorespaces}
}

% Numbered subequations
% Two subequations
\NewDocumentCommand\twoseqn{momoo}{%
    \IfNoValueTF{#5}
       {\begin{subequations}\begin{align} #1\label{#2} \\ #3 \label{#4}  \end{align}\end{subequations} \expandafter\def\csname #2\endcsname{\eqref{#2}\xspace}\ignorespaces \expandafter\def\csname #4\endcsname{\eqref{#4}\xspace}\ignorespaces}
       {\begin{subequations}\label{#5}\begin{align} #1\label{#2} \\ #3 \label{#4}  \end{align}\end{subequations} \expandafter\def\csname #5\endcsname{\eqref{#5}\xspace}\ignorespaces \expandafter\def\csname #2\endcsname{\eqref{#2}\xspace}\ignorespaces \expandafter\def\csname #4\endcsname{\eqref{#4}\xspace}\ignorespaces}
}
% Three subequations
\NewDocumentCommand\threeseqn{momomoo}{%
   \IfNoValueTF{#7}
     {\begin{subequations}\begin{align} #1\label{#2} \\ #3 \label{#4} \\ #5 \label{#6} \end{align}\end{subequations} \expandafter\def\csname #2\endcsname{\eqref{#2}\xspace}\ignorespaces \expandafter\def\csname #4\endcsname{\eqref{#4}\xspace}\ignorespaces \expandafter\def\csname #6\endcsname{\eqref{#6}\xspace}\ignorespaces}
     {\begin{subequations}\label{#7}\begin{align} #1\label{#2} \\ #3 \label{#4} \\ #5 \label{#6} \end{align}\end{subequations} \expandafter\def\csname #7\endcsname{\eqref{#7}\xspace}\ignorespaces \expandafter\def\csname #2\endcsname{\eqref{#2}\xspace}\ignorespaces \expandafter\def\csname #4\endcsname{\eqref{#4}\xspace}\ignorespaces \expandafter\def\csname #6\endcsname{\eqref{#6}\xspace}\ignorespaces}
}
% Four subequations
\NewDocumentCommand\fourseqn{momomomoo}{%
   \IfNoValueTF{#9}
     {\begin{subequations}\begin{align} #1\label{#2} \\ #3 \label{#4} \\ #5 \label{#6} \\ #7\label{#8} \end{align}\end{subequations} \expandafter\def\csname #2\endcsname{\eqref{#2}\xspace}\ignorespaces \expandafter\def\csname #4\endcsname{\eqref{#4}\xspace}\ignorespaces \expandafter\def\csname #6\endcsname{\eqref{#6}\xspace}\ignorespaces \expandafter\def\csname #8\endcsname{\eqref{#8}\xspace}\ignorespaces}
     {\begin{subequations}\label{#9}\begin{align} #1\label{#2} \\ #3 \label{#4} \\ #5 \label{#6} \\ #7\label{#8} \end{align}\end{subequations} \expandafter\def\csname #9\endcsname{\eqref{#9}\xspace}\ignorespaces \expandafter\def\csname #2\endcsname{\eqref{#2}\xspace}\ignorespaces \expandafter\def\csname #4\endcsname{\eqref{#4}\xspace}\ignorespaces \expandafter\def\csname #6\endcsname{\eqref{#6}\xspace}\ignorespaces \expandafter\def\csname #8\endcsname{\eqref{#8}\xspace}\ignorespaces}
}


% Sections and subsections
\NewDocumentCommand\newsec{mo}{%
  \IfNoValueTF{#2}
     {\section{#1}}
     {\section{#1}\label{#2} \expandafter\gdef\csname #2\endcsname{\ref{#2}\xspace}\ignorespaces}
}
\NewDocumentCommand\subsec{mo}{%
  \IfNoValueTF{#2}
     {\subsection{#1}}
     {\subsection{#1}\label{#2}\expandafter\gdef\csname #2\endcsname{\ref{#2}\xspace}\ignorespaces}
}
\NewDocumentCommand\subsubsec{mo}{%
  \IfNoValueTF{#2}
     {\subsubsection{#1}}
     {\subsubsection{#1}\label{#2}\expandafter\gdef\csname #2\endcsname{\ref{#2}\xspace}\ignorespaces}
}

\makeatletter
\renewcommand\section{\@startsection {section}{1}{\z@}% 
{-6ex \@plus -1ex \@minus -.2ex}% 
{2.3ex \@plus.2ex}% 
{\bfseries}}
\makeatother
\makeatletter
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\itshape}}
\makeatother
\makeatletter
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\itshape}}
\makeatother
% Dot after section number
\makeatletter 
\def\@seccntformat#1{\csname the#1\endcsname.\hspace{4.6pt}} 
\makeatother 

\renewcommand{\appendix}{\appendices}


% Acknowledgements
\newenvironment{acknowledgments}{\vspace{12pt}\begin{center}\textbf{Acknowledgments}\end{center}\vspace{-12pt}}{}
\newcommand{\ack}[1]{\begin{samepage}\begin{acknowledgments} {#1} \end{acknowledgments}\end{samepage}}


% References
\renewcommand\refname{\bfseries\centering References\\ \vspace{-0.4cm}}
\bibliographystyle{chetref}
% Separator between references in single cite number
\collectsep{\ding{70}~}


% Footnotes
\newcommand{\foot}{\footnote}
\setlength{\skip\footins}{0.5cm} % Vertical spacing between text body and footnotes
\setlength{\footnotesep}{0.4cm} % Vertical separation of footnotes


% Horizontal spacing between words
\fontdimen2\font=1.2\fontdimen2\font


% Vertical spacing between lines
\linespread{1.25}


% Vertical spacing in multiline equations (align, gather, ...)
\setlength{\jot}{5pt}


% Figure name
\renewcommand{\figurename}{Fig.\!}

% Format of date in bottom left of title page
\newdateformat{mydate}{\monthname[\THEMONTH] \THEYEAR} %Needs package datetime
\mydate{}


%Titlepage
\makeatletter
	\renewcommand{\abstract}[1]{\def \@abstract {#1}}
	\newcommand{\affiliation}[1]{\def \@affiliation {#1}}
	\newcommand{\preprint}[1]{\def\@preprint {#1}}
	\newcommand{\email}[2]{\footnote[#1]{\href{mailto:#2}{\texttt{#2}}}}
	\abstract{}
	\affiliation{}
	\preprint{}
\makeatother

\makeatletter
\def \maketitle {%
	\begin{titlepage}
	          \begin{flushright}
                           \@preprint
                   \end{flushright}
                           \vspace{2cm}
		\begin{center}
			{\Large\bfseries \@title} 
		
			\bigskip\bigskip\bigskip
		
			\@author 
			
			\bigskip
			
			\it{\@affiliation}
                  	\end{center}
			\vskip 1cm

			\noindent\@abstract
			
			\vfill	
			\noindent\@date
	\end{titlepage}
}
\makeatother
