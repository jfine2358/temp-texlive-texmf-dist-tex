%%
%% This is file `actawex.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% actawex.dtx  (with options: `acta')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2007 by Robert Nyqvist.
%% 
%% Class for typesetting theses in Acta Wexionensia.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from actawex.cls.
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
\NeedsTeXFormat{LaTeX2e}[2001/06/01]
\ProvidesClass{actawex}
  [2007/02/12 3.2 Class for Acta Wexionensia]
\newif\if@collection
\newcommand{\@ptsize}{0}
\@twosidetrue
\@mparswitchtrue
\newif\if@openright
\DeclareOption{collection}{\@collectiontrue}
\DeclareOption{monograph}{\@collectionfalse}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{openany}{\@openrightfalse}
\DeclareOption{openright}{\@openrighttrue}
\ExecuteOptions{collection,final,openany}
\ProcessOptions
\if@collection
  \input{awcollection.clo}
\else
  \input{awmonograph.clo}
\fi
\setlength\paperwidth{165mm}
\setlength\paperheight{242mm}
\ifx\pdfpagewidth\undefined\else
  \setlength\pdfpagewidth{165mm}
  \setlength\pdfpageheight{242mm}
\fi
\renewcommand\normalsize{%
  \@setfontsize\normalsize\@xpt\@xiipt
  \abovedisplayskip 9\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 5\p@ \@plus2\p@ \@minus3\p@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI
}
\normalsize
\newcommand\small{%
  \@setfontsize\small\@ixpt{11}%
  \abovedisplayskip 7.5\p@ \@plus2.5\p@ \@minus3\p@
  \abovedisplayshortskip \z@ \@plus2\p@
  \belowdisplayshortskip 3.5\p@ \@plus2\p@ \@minus2\p@
  \belowdisplayskip \abovedisplayskip
  \def\@listi{%
    \leftmargin\leftmargini
    \topsep 4\p@ \@plus2\p@ \@minus2\p@
    \parsep 2\p@ \@plus\p@ \@minus\p@
    \itemsep \parsep}%
}
\newcommand\footnotesize{%
  \@setfontsize\footnotesize\@viiipt{9.5}%
  \abovedisplayskip 5.5\p@ \@plus2\p@ \@minus3\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 2.5\p@ \@plus\p@ \@minus2\p@
  \belowdisplayskip \abovedisplayskip
  \def\@listi{%
    \leftmargin\leftmargini
    \topsep 3\p@ \@plus\p@ \@minus\p@
    \parsep 2\p@ \@plus\p@ \@minus\p@
    \itemsep \parsep}%
}
\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\newcommand\large{\@setfontsize\large\@xiipt{14}}
\newcommand\Large{\@setfontsize\Large\@xivpt{18}}
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\setlength\parindent{1em}
\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setlength\headheight{12\p@}
\setlength\headsep{17\p@}
\setlength\topskip{10\p@}
\setlength\footskip{25\p@}
\setlength\maxdepth{.5\topskip}
\setlength\textwidth{115mm}
\@settopoint\textwidth
\setlength\textheight{45\baselineskip}
\addtolength\textheight{\topskip}
\setlength\oddsidemargin{-1in}
\addtolength\oddsidemargin{25mm}
\@settopoint\oddsidemargin
\setlength\evensidemargin{\oddsidemargin}
\setlength\topmargin{-1in}
\addtolength\topmargin{17mm}
\addtolength\topmargin{-\headheight}
\addtolength\topmargin{-\headsep}
\@settopoint\topmargin
\setlength\marginparwidth{57\p@}
\setlength\marginparsep{7\p@}
\setlength\marginparpush{5\p@}
\setlength\footnotesep{6.65\p@}
\setlength{\skip\footins}{9\p@ \@plus 4\p@ \@minus 2\p@}
\setcounter{topnumber}{1}
\setcounter{bottomnumber}{1}
\setcounter{totalnumber}{2}
\renewcommand\topfraction{.7}
\renewcommand\bottomfraction{.3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setlength\floatsep{10\p@ \@plus 2\p@ \@minus 1\p@}
\setlength\textfloatsep{13\p@ \@plus 3\p@ \@minus 3\p@}
\setlength\intextsep{10\p@ \@plus 2\p@ \@minus 1\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{6\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\leftmargini{2em}
\leftmargin\leftmargini
\setlength\leftmarginii{1.8em}
\setlength\leftmarginiii{1.5em}
\setlength\leftmarginiv{1.7em}
\setlength\leftmarginv{1em}
\setlength\leftmarginvi{1em}
\setlength\labelsep{.5em}
\setlength\labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}
\@beginparpenalty-\@lowpenalty
\@endparpenalty-\@lowpenalty
\@itempenalty-\@lowpenalty
\def\@listi{%
  \leftmargin\leftmargini
  \parsep 2\p@ \@plus2\p@ \@minus\p@
  \topsep 6\p@ \@plus2\p@ \@minus4\p@
  \itemsep 2\p@ \@plus2\p@ \@minus\p@
}
\let\@listI\@listi
\@listi
\def\@listii {%
  \leftmargin\leftmarginii
  \labelwidth\leftmarginii
  \advance\labelwidth-\labelsep
  \topsep 3\p@ \@plus2\p@ \@minus\p@
  \parsep 2\p@ \@plus\p@  \@minus\p@
  \itemsep\parsep
}
\def\@listiii{%
  \leftmargin\leftmarginiii
  \labelwidth\leftmarginiii
  \advance\labelwidth-\labelsep
  \topsep 2\p@ \@plus\p@\@minus\p@
  \parsep \z@
  \partopsep \p@ \@plus\z@ \@minus\p@
  \itemsep\topsep
}
\def\@listiv{%
  \leftmargin\leftmarginiv
  \labelwidth\leftmarginiv
  \advance\labelwidth-\labelsep
}
\def\@listv{%
  \leftmargin\leftmarginv
  \labelwidth\leftmarginv
  \advance\labelwidth-\labelsep
}
\def\@listvi{%
  \leftmargin\leftmarginvi
  \labelwidth\leftmarginvi
  \advance\labelwidth-\labelsep
}
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\textup{\theenumi.}}
\newcommand\labelenumii{\textup{(\theenumii)}}
\newcommand\labelenumiii{\textup{\theenumiii.}}
\newcommand\labelenumiv{\textup{\theenumiv.}}
\renewcommand\p@enumii{\textup{\theenumi}}
\renewcommand\p@enumiii{\textup{\theenumi(\theenumii)}}
\renewcommand\p@enumiv{\textup{\p@enumiii\theenumiii}}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries\textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}{%
  \list{}{%
    \labelwidth\z@
    \itemindent-\leftmargin
    \let\makelabel\descriptionlabel
  }%
}{%
  \endlist
}
\newcommand*\descriptionlabel[1]{%
  \hspace\labelsep
  \normalfont\bfseries #1
}
\newenvironment{quotation}{%
  \list{}{%
    \listparindent 1.5em%
    \itemindent \listparindent
    \rightmargin \leftmargin
    \parsep \z@ \@plus\p@
  }%
  \item\relax
}{%
  \endlist
}
\newenvironment{quote}{%
  \list{}{
    \rightmargin\leftmargin
  }%
  \item\relax
}{%
  \endlist
}
\newcommand\appendix{%
  \par
  \if@collection\else
    \setcounter{chapter}{0}%
  \fi
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{paragraph}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}%
}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\if@collection\else
  \newcommand\chaptername{Chapter}
\fi
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year
}
\pagestyle{headings}
\pagenumbering{arabic}
\onecolumn
\endinput
%%
%% End of file `actawex.cls'.
