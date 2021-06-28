% This class file is provided 'as is' in the event that someone
% wants to compile the documentation that comes with my packages.
% It is not intended for any other purpose, although you may freely
% copy the code here to another file and modify it for your own purposes.
% There's no guarantee that it will work with other packages.
%
%  Copyright 2013-2020 Nicola Talbot
% 
%  This work may be distributed and/or modified under the
%  conditions of the LaTeX Project Public License, either version 1.3
%  of this license of (at your option) any later version.
%  The latest version of this license is in
%    http://www.latex-project.org/lppl.txt
%  and version 1.3 or later is part of all distributions of LaTeX
%  version 2005/12/01 or later.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nlctdoc}[2020/02/12 v1.07 (NLCT)]
\RequirePackage{ifpdf}
\RequirePackage{ifxetex}
% tex4ht stopped working with koma during TL2013.
% Use pdflatex with koma for the pdf version
% and latex with one of the base classes for the html 
% version to circumvent this.
\ifpdf
  \newcommand{\@nlctdoc@if@usingtexht}[2]{#2}
\else
  \ifxetex
   \newcommand{\@nlctdoc@if@usingtexht}[2]{#2}
  \else
   \newcommand{\@nlctdoc@if@usingtexht}[2]{#1}
  \fi
\fi

\@nlctdoc@if@usingtexht
{
  \def\@nlctdoc@class{article}%
}
{
  \def\@nlctdoc@class{scrartcl}%
}
\DeclareOption{article}{%
  \@nlctdoc@if@usingtexht
  {%
    \def\@nlctdoc@class{article}%
  }%
  {%
    \def\@nlctdoc@class{scrartcl}%
  }%
}
\DeclareOption{book}{%
  \@nlctdoc@if@usingtexht
  {%
    \def\@nlctdoc@class{book}%
  }%
  {%
    \def\@nlctdoc@class{scrbook}%
  }%
}
\DeclareOption{report}{%
  \@nlctdoc@if@usingtexht
  {%
    \def\@nlctdoc@class{report}%
  }%
  {%
    \def\@nlctdoc@class{scrreprt}%
  }%
}
\DeclareOption{a5paper}{\@latexerr{Option not supported}%
   {}}

\newcommand*{\nlct@setupmargin}{}
\DeclareOption{normalmp}{%
  \renewcommand*{\nlct@setupmargin}{%
    \normalmarginpar
    \renewcommand*{\nlctdocmarginfmt}{\raggedright}%
  }%
}

\newif\ifnlctdocinlinetitle
\nlctdocinlinetitlefalse
\DeclareOption{inlinetitle}{\nlctdocinlinetitletrue}
\newif\ifwidecs
\widecsfalse
\DeclareOption{widecs}{\widecstrue}
\DeclareOption*{%
    \PassOptionsToClass  {\CurrentOption}{\@nlctdoc@class}}
\newif\ifwbprompt
\wbpromptfalse
\DeclareOption{wbprompt}{\wbprompttrue}
\ProcessOptions

\@nlctdoc@if@usingtexht
{%
  \LoadClass{\@nlctdoc@class}
}%
{%
  \ifnlctdocinlinetitle
    \LoadClass[captions=tableheading,abstract=true,titlepage=false]{\@nlctdoc@class}
  \else
    \LoadClass[captions=tableheading,abstract=true]{\@nlctdoc@class}
  \fi
}%

\RequirePackage{xcolor}
\ifxetex
\else
 \RequirePackage[utf8]{inputenc}
\fi
\@nlctdoc@if@usingtexht
{%
  \RequirePackage[xhtml,fn-in,css-in,uni-html4,utf8]{tex4ht}
}%
{%
  \ifxetex
  \else
    \RequirePackage[T1]{fontenc}
    \RequirePackage{cmap}
  \fi
  \RequirePackage{fourier}
}%
\RequirePackage{etoolbox}
\RequirePackage{doc,dox}
\RequirePackage{upquote}

% doc.sty interferes with upquote.sty so patch it
\def\@verbatim{\trivlist \item[]\if@minipage\else\vskip\parskip\fi
      \leftskip\@totalleftmargin\rightskip\z@
      \parindent\z@\parfillskip\@flushglue\parskip\z@
      \@@par
      \@tempswafalse
 \def\par{\if@tempswa\hbox{}\fi\@tempswatrue\@@par
          \penalty\interlinepenalty
   \check@percent}%
 \obeylines
 \@noligs
 \let\do\@makeother \dospecials}

% make it easier to configure index

\begin{filecontents}{nlctdoc.ist}
actual '='
quote '!'
level '>'
preamble "\n \\begin{theindex} \n \\makeatletter\\scan@allowedfalse\n"
postamble "\n\n \\end{theindex}\n"
item_x1   "\\efill \n \\subitem "
item_x2   "\\efill \n \\subsubitem "
delim_0   "\\pfill "
delim_1   "\\pfill "
delim_2   "\\pfill "
lethead_prefix   "\\letterheading{"
lethead_suffix   "}\\nopagebreak\n"
lethead_flag       1
heading_prefix   "\\letterheading{"
heading_suffix   "}\\nopagebreak\n"
headings_flag       1
\end{filecontents}

\ifdef\chapter
{\newcommand{\letterheading}[1]{\pdfbookmark[1]{#1}{index.#1}\textbf{\hfil#1\hfil}}}
{\newcommand{\letterheading}[1]{\pdfbookmark[2]{#1}{index.#1}\textbf{\hfil#1\hfil}}}

\newcommand*{\nlctdocmarginfmt}{\raggedleft}
\nlct@setupmargin

\def\@@doxdescribe#1#2{%
    \endgroup%
    \ifdox@noprint\else%
      \nlctdocmargin{\@nameuse{PrintDescribe#1}{#2}}%
    \fi%
    \ifdox@noindex\else%
      \@nameuse{Special#1Index}{#2}%
    \fi%
    \endgroup%
\@esphack\ignorespaces}

\newcommand{\nlctdocmargin}[1]{\marginpar{\nlctdocmarginfmt#1}}
\newcommand{\nlctdocmarginwide}[1]{%
 \marginpar{\parbox[b][2\baselineskip]{\marginparwidth}{\nlctdocmarginfmt#1\vfill\par}}%
}

\newrobustcmd\cs[1]{\texttt{\char`\\#1}}

\newrobustcmd*{\mgroup}[1]{\texttt{\char`\{#1\char`\}}}

\providecommand\marg[1]{%
  \allowbreak{\ttfamily\char`\{}\meta{#1}{\ttfamily\char`\}}}
\providecommand\oarg[1]{%
  \allowbreak{\ttfamily[}\meta{#1}{\ttfamily]}}
\providecommand\parg[1]{%
  \allowbreak{\ttfamily(}\meta{#1}{\ttfamily)}}

\def\PrintChanges{\@input@{\jobname.gls}%
                  \global\let\PrintChanges\@empty}

\let\RecordChanges\makeglossary

\def\main#1{\underline{\hyperpage{#1}}}
\def\usage#1{\textit{\hyperpage{#1}}}

\newcommand{\nlctdocmainencap}{\encapchar main}
\newcommand{\nlctdochyperencap}{\encapchar hyperpage}

\def\SortIndex#1#2{\index{#1\actualchar#2\nlctdochyperencap}}

\newcommand*{\SpecialPageIndex}[1]{\@bsphack
  \index{#1\nlctdochyperencap}\@esphack}

\renewcommand*\PageIndex{\makeindex
               \codeline@indexfalse
               \let\special@index\SpecialPageIndex}


\ifdef\chapter
{
 \renewcommand*\glossary@prologue{%
   \chapter*{{Change History}}%
     \markboth{{Change History}}{{Change History}}%
     \addcontentsline{toc}{chapter}{Change History}%
     \raggedright\sloppy
   }

  \def\index@prologue{\chapter*{Index}%
                 \markboth{Index}{Index}%
                 \addcontentsline{toc}{chapter}{Index}%
                 Numbers written in italic refer to the page
                 where the corresponding entry is described;
                 numbers underlined refer to the
                 \ifcodeline@index
                   code line of the
                 \fi
                 definition; numbers in roman refer to the
                 \ifcodeline@index
                   code lines
                 \else
                   pages
                 \fi
                 where the entry is used.
                 }

}
{
 \renewcommand*\glossary@prologue{%
   \section*{{Change History}}%
     \markboth{{Change History}}{{Change History}}%
     \addcontentsline{toc}{section}{Change History}%
     \raggedright\sloppy
   }

  \def\index@prologue{\section*{Index}%
                 \markboth{Index}{Index}%
                 \addcontentsline{toc}{section}{Index}%
                 Numbers written in italic refer to the page
                 where the corresponding entry is described;
                 numbers underlined refer to the
                 \ifcodeline@index
                   code line of the
                 \fi
                 definition; numbers in roman refer to the
                 \ifcodeline@index
                   code lines
                 \else
                   pages
                 \fi
                 where the entry is used.
                 }
}

\ifwidecs
\else
  \setlength\marginparwidth{8pc}
\fi

\renewcommand*{\changes@}[3]{%
  \protected@edef\@tempa{\noexpand\glossary{#1 (#2)\levelchar
                                 \ifx\saved@macroname\@empty
                                   \space
                                   \actualchar
                                   \generalname
                                 \else
                                   \expandafter\@gobble
                                   \saved@macroname
                                   \actualchar
                                   \string\verb\quotechar*%
                                   \verbatimchar\saved@macroname
                                   \verbatimchar
                                 \fi
                                 :\levelchar #3}}%
  \@tempa\endgroup\@esphack}

\newcommand{\see}[2]{\emph{see} #1}

\RecordChanges
\PageIndex
\CodelineNumbered

\newcommand\Describe@Wide@Macro[1]{%
 \endgroup
  \marginpar{\raggedright\hbox to\marginparwidth{\PrintDescribeMacro{#1}}\par}%
  \SpecialUsageIndex{#1}\@esphack
  \ignorespaces
}

\newlength\macrowidth

\newcommand{\promptsymbol}{\BeginAccSupp{ActualText={}}\$\EndAccSupp{}}

\newcommand{\importantfmt}{\raggedright}
\newcommand{\importantsymbolfont}[1]{\textbf{\Huge#1}}

\newcommand{\importantpar}[1][-3]{%
  \def\@nlct@importantparafter{#1}%
  \@importantpar
}

\@nlctdoc@if@usingtexht
{%
  \newenvironment{definition}[1][]{%
    \par\HCode{<hr><div title="Definition">}#1\ttfamily\noindent
  }{%
    \HCode{</div><hr>}\par\noindent
  }

  \newcommand{\importantsymbol}{\HCode{<span class="warningsymbol">&\#9888;</span>}}
  \newcommand{\@importantpar}[1][]{\importantsymbol\space}
  \newenvironment{important}{%
    \par\HCode{<div class="important" title="Important Note">}\noindent
  }{%
    \HCode{</div>}\par\noindent
  }

  \ifwbprompt
    \AtBeginDocument{\Css{
       pre.prompt {color: white; background: black; font-weight:
bold; padding-bottom: 2ex; padding-left: 1em; padding-right: 1em;}
    }}

    \newenvironment{prompt}%
    {\par\HCode{<spacer type=vertical size=10><pre class="prompt">}%
     \obeylines\ignorespaces}%
    {\HCode{</pre><spacer type=vertical size=10>}\par\noindent}

  \else
    \newenvironment{prompt}%
    {\HCode{<spacer type=vertical size=10>}\begin{ttfamily}\obeylines\ignorespaces}%
    {\end{ttfamily}\HCode{<spacer type=vertical size=10>}\noindent}
  \fi

  \newenvironment{display}{%
    \HCode{<spacer type=vertical size=10>}\obeylines\ignorespaces
  }{%
    \HCode{<spacer type=vertical size=10>}\noindent
  }

  \newenvironment{labelledbox}[1]{%
    \par\HCode{<hr><div>}\marginpar{#1}\noindent
  }{%
    \HCode{</div><hr>}\par\noindent
  }
}%
{%
  \definecolor{defbackground}{rgb}{1,1,0.75}
  \newsavebox\defsbox
  \newlength\defwidth
  \newenvironment{definition}[1][]{%
    \def\defarg{#1}%
    \setlength{\fboxsep}{4pt}\setlength{\fboxrule}{1.25pt}%
    \begin{lrbox}{\defsbox}%
      \setlength\defwidth\linewidth
      \addtolength\defwidth{-2\fboxrule}%
      \addtolength\defwidth{-2\fboxsep}%
      \begin{minipage}[t]{\defwidth}\raggedright\ttfamily
  }{%
      \end{minipage}
    \end{lrbox}%
    \vskip10pt
    \noindent
    \ifwidecs
      \let\nlctdocmargin\nlctdocmarginwide
      \par\bigskip\par\noindent
    \else
    \fi
    \strut\nopagebreak\defarg\nopagebreak
    \fcolorbox{black}{defbackground}{\usebox\defsbox}%
    \vskip10pt
    \noindent
    \ignorespacesafterend
  }

  \newlength\tmpwidth
  \newlength\tmpheight

  \newcommand{\importantsymbol}{\warning}

  \newsavebox\@nlctdoc@tmpsbox
  \newcommand{\@importantpar}[1][0pt]{%
    \sbox\@nlctdoc@tmpsbox{\importantsymbolfont{\importantsymbol}}%
    \settoheight{\tmpheight}{\usebox\@nlctdoc@tmpsbox}%
    \settowidth{\tmpwidth}{\usebox\@nlctdoc@tmpsbox}%
    \advance\tmpheight by #1\relax
    \advance\tmpwidth by .5em\relax
    \par\noindent
    \hangindent=\tmpwidth
    \hangafter=\@nlct@importantparafter\relax
    \makebox[0pt][l]{\hspace*{-\tmpwidth}%
      \smash{\raisebox{-\tmpheight}{\usebox\@nlctdoc@tmpsbox}}%
    }%
    \ignorespaces
  }

  \newenvironment{important}{%
    \setlength{\fboxrule}{4pt}%
    \setlength\defwidth{\linewidth}%
    \addtolength\defwidth{-2\fboxsep}%
    \addtolength\defwidth{-2\fboxrule}%
    \begin{lrbox}{\defsbox}%
      \begin{minipage}{\defwidth}%
      \importantfmt
      \setlength\parindent{1em}%
      \noindent\ignorespaces
  }{%
      \end{minipage}%
    \end{lrbox}%
    \par\vskip10pt\noindent
    \fcolorbox{red}{white}{\usebox{\defsbox}}\par\vskip10pt
    \noindent\ignorespacesafterend
  }

  \ifwbprompt
   \newenvironment{prompt}%
   {%
     \setlength\defwidth{\linewidth}%
     \addtolength\defwidth{-2\fboxsep}%
     \begin{lrbox}{\defsbox}%
      \begin{minipage}[t]{\defwidth}%
      \ttfamily\color{white}\bfseries
      \everypar{\promptsymbol\ }%
      \obeylines\raggedright\frenchspacing\ignorespaces%
   }%
   {%
      \end{minipage}%
    \end{lrbox}\par\noindent\colorbox{black}{\usebox\defsbox}%
    \everypar{}\par\medskip
    \noindent\ignorespacesafterend
   }
  \else
    \newenvironment{prompt}{%
      \par\vskip\baselineskip
      \begin{ttfamily}\frenchspacing\obeylines\noindent\ignorespaces
    }{%
      \end{ttfamily}%
      \par\vskip\baselineskip
      \noindent\ignorespacesafterend
    }
  \fi

  \newenvironment{display}{%
    \par\vskip\baselineskip\noindent
    \obeylines\ignorespaces
  }{%
    \par
    \vskip\baselineskip
    \noindent\ignorespacesafterend
  }

  \newenvironment{labelledbox}[1]{%
    \def\defarg{#1}%
    \setlength{\fboxsep}{4pt}\setlength{\fboxrule}{1.25pt}%
    \begin{lrbox}{\defsbox}%
      \setlength\defwidth\linewidth
      \addtolength\defwidth{-2\fboxrule}%
      \addtolength\defwidth{-2\fboxsep}%
      \begin{minipage}{\defwidth}\flushleft
  }{%
      \end{minipage}
    \end{lrbox}%
    \vskip10pt
    \noindent
    \begin{tabular}{@{}r@{}}%
      \fbox{\usebox\defsbox}\\[4pt]
      \footnotesize\mbox{\defarg}%
    \end{tabular}
    \vskip10pt
    \noindent
    \ignorespacesafterend
  }
}%

\newcommand*{\idxmarker}{\textsuperscript{\textdagger}}
\newcommand*{\doidxmarker}{\strut\llap{\idxmarker}}

\newcommand*{\appfmt}[1]{\texttt{#1}}
\newrobustcmd*{\iapp}{\@ifstar\s@iapp\@iapp}

\newcommand*{\s@iapp}[1]{\index{#1=\doidxmarker\appfmt{#1}\nlctdochyperencap}}
\newcommand*{\@iapp}[1]{\index{#1=\appfmt{#1}\nlctdochyperencap}}

\newrobustcmd*{\app}[1]{\appfmt{#1}\iapp{#1}}

\newcommand*{\qt}[1]{``#1''}

\newrobustcmd*{\termdef}[1]{\emph{#1}\iterm{#1}}
\newrobustcmd*{\term}[1]{#1\iterm{#1}}
\newrobustcmd*{\iterm}[1]{\index{#1\nlctdocmainencap}}
\newcommand*{\tableref}[1]{\hyperref[#1]{table~\ref*{#1}}}
\newcommand*{\Tableref}[1]{\hyperref[#1]{Table~\ref*{#1}}}

\renewcommand{\SpecialMainIndex}[1]{\@bsphack \SpecialIndex@ {#1}{\nlctdocmainencap}\@esphack}

\newcommand{\idxmarker@SpecialMainIndex}[1]{%
 \@bsphack \idxmarker@SpecialIndex@ {#1}{\nlctdocmainencap}\@esphack
}

\newcommand\idxmarker@SpecialIndex@[2]{%
   \@SpecialIndexHelper@#1\@nil
   \def\@tempb{ }%
   \ifcat \@tempb\@gtempa
      \special@index{\quotechar\space\actualchar
                     \doidxmarker\string\verb\quotechar*\verbatimchar
                     \quotechar\bslash\quotechar\space\verbatimchar#2}%
   \else
     \def\@tempb##1##2\relax{\ifx\relax##2\relax
          \def\@tempc{\special@index{\quotechar##1\actualchar
                      \doidxmarker\string\verb\quotechar*\verbatimchar
                      \quotechar\bslash\quotechar##1\verbatimchar#2}}%
        \else
          \def\@tempc{\special@index{##1##2\actualchar
                       \doidxmarker\string\verb\quotechar*\verbatimchar
                       \bslash##1##2\verbatimchar#2}}%
        \fi}%
     \expandafter\@tempb\@gtempa\relax
     \@tempc
   \fi}

\newcommand{\dequals}{%
 \texorpdfstring
 {\discretionary{}{}{}\texttt{=}\discretionary{}{}{}}%
 {=}%
}

\newcommand{\dcomma}{%
 \texorpdfstring
 {\discretionary{}{}{}\texttt{,}\discretionary{}{}{}}%
 {,}%
}

\newcommand{\dhyphen}{%
 \texorpdfstring
 {\discretionary{}{}{}\texttt{-}\discretionary{}{}{}}%
 {-}%
}


\newcommand{\idxmarkedfont}[1]{#1}

\newcommand*{\nlctdoc@ifplus}[1]{\@ifnextchar+{\@firstoftwo {#1}}}

\newrobustcmd{\ics}{\@ifstar\s@ics\@ics}

\newcommand*{\s@ics}[1]{\idxmarkedfont{\cs{#1}}\idxmarker@SpecialMainIndex{#1}}
\newcommand*{\@ics}[1]{\cs{#1}\SpecialMainIndex{#1}}

\newrobustcmd{\csmeta}{\@ifstar\s@csmeta\@csmeta}

\newcommand*{\s@csmeta}[3]{\idxmarkedfont{\cs{#1\meta{#2}#3}}\index{#1#2#3=\protect\doidxmarker\protect\cs{#1\meta{#2}#3}\nlctdochyperencap}}
\newcommand*{\@csmeta}[3]{\cs{#1\meta{#2}#3}\index{#1#2#3=\protect\cs{#1\meta{#2}#3}\nlctdochyperencap}}

\newrobustcmd{\csmetameta}{\@ifstar\s@csmetameta\@csmetameta}

\newcommand*{\s@csmetameta}[5]{\idxmarkedfont{\cs{#1\meta{#2}#3\meta{#4}#5}}\index{#1#2#3#4#5=\protect\doidxmarker\protect\cs{#1\meta{#2}#3\meta{#4}#5}\nlctdochyperencap}}
\newcommand*{\@csmetameta}[5]{\cs{#1\meta{#2}#3\meta{#4}#5}\index{#1#2#3#4#5=\protect\cs{#1\meta{#2}#3\meta{#4}#5}\nlctdochyperencap}}

\newcommand*{\csoptfmt}[1]{\textsf{#1}}

\newrobustcmd*{\icsopt}{\@ifstar\s@icsopt\ns@icsopt}

\newcommand*{\ns@icsopt}{\nlctdoc@ifplus\p@icsopt\@icsopt}

\newcommand*{\s@icsopt}[2]{%
 \index{#1 options\actualchar\cs{#1} options\levelchar#2\actualchar\doidxmarker\csoptfmt{#2}\nlctdochyperencap}}

\newcommand*{\p@icsopt}[2]{%
 \index{#1 options\actualchar\doidxmarker\cs{#1} options\levelchar#2\actualchar\csoptfmt{#2}\nlctdochyperencap}}

\newcommand*{\@icsopt}[2]{%
 \index{#1 options\actualchar\cs{#1} options\levelchar#2\actualchar\csoptfmt{#2}\nlctdochyperencap}}

\newrobustcmd*{\csopt}{\@ifstar\s@csopt\@csopt}

\newcommand*{\s@csopt}[2]{%
  \idxmarkedfont{\csoptfmt{#2}}%
  \@for\@thiscmd:=#1\do{%
    \s@icsopt{\@thiscmd}{#2}%
  }%
}

\newcommand*{\@csopt}[2]{%
  \csoptfmt{#2}%
  \@for\@thiscmd:=#1\do{%
    \@icsopt{\@thiscmd}{#2}%
  }%
}

% Package options
\newcommand*{\pkgoptfmt}[1]{\textsf{#1}}

% \ipkgopt{option}
% \ipkgopt[value]{option}
% \ipkgopt*{option} <- mark option
% \ipkgopt*[value]{option} <- mark value
% \ipkgopt+{value}{option} <- mark option

\newrobustcmd*{\ipkgopt}{\@ifstar\s@ipkgopt\ns@ipkgopt}

\newcommand*{\ns@ipkgopt}{\nlctdoc@ifplus\p@ipkgopt\@ipkgopt}

\newcommand*{\s@ipkgopt}[2][]{%
  \ifstrempty{#1}%
  {\index{package options:>#2=\doidxmarker\pkgoptfmt{#2}\nlctdocmainencap}}%
  {\index{package options:>#2=\pkgoptfmt{#2}>#1=\doidxmarker\pkgoptfmt{#1}\nlctdocmainencap}}%
}

\newcommand*{\p@ipkgopt}[2]{%
  \index{package options:>#2=\doidxmarker\pkgoptfmt{#2}>#1=\pkgoptfmt{#1}\nlctdocmainencap}%
}

\newcommand*{\@ipkgopt}[2][]{%
  \ifstrempty{#1}%
  {\index{package options:>#2=\pkgoptfmt{#2}\nlctdocmainencap}}%
  {\index{package options:>#2=\pkgoptfmt{#2}>#1=\pkgoptfmt{#1}\nlctdocmainencap}}%
}

\newrobustcmd*{\ideprecatedpkgopt}[2][]{%
  \ifstrempty{#1}%
  {\index{package options:>#2=\pkgoptfmt{#2} (deprecated)\nlctdocmainencap}}%
  {\index{package options:>#2=\pkgoptfmt{#2} (deprecated)>#1=\pkgoptfmt{#1}\nlctdocmainencap}}%
}

\newrobustcmd*{\pkgopt}{\@ifstar\s@pkgopt\ns@pkgopt}

\newcommand*{\ns@pkgopt}{\nlctdoc@ifplus\p@pkgopt\@pkgopt}

\newcommand*{\s@pkgopt}[2][]{%
  \idxmarkedfont{\ifstrempty{#1}{\pkgoptfmt{#2}}{\pkgoptfmt{#2\dequals#1}}}%
  \s@ipkgopt[#1]{#2}%
}

\newcommand*{\p@pkgopt}[2]{%
  \idxmarkedfont{\pkgoptfmt{#2\dequals#1}}\p@ipkgopt{#1}{#2}%
}

\newcommand*{\@pkgopt}[2][]{%
  \ifstrempty{#1}{\pkgoptfmt{#2}}{\pkgoptfmt{#2\dequals#1}}%
  \@ipkgopt[#1]{#2}%
}

\newrobustcmd*{\deprecatedpkgopt}[2][]{%
  \ifstrempty{#1}{\pkgoptfmt{#2}}{\pkgoptfmt{#2\dequals#1}}%
  \ideprecatedpkgopt[#1]{#2}%
}

\newrobustcmd*{\pkgoptval}{\@ifstar\s@pkgoptval\ns@pkgoptval}

\newcommand*{\ns@pkgoptval}{\nlctdoc@ifplus\p@pkgoptval\@pkgoptval}

\newcommand*{\s@pkgoptval}[2]{\idxmarkedfont{\pkgoptfmt{#1}}\s@ipkgopt[#1]{#2}}

\newcommand*{\p@pkgoptval}[2]{\idxmarkedfont{\pkgoptfmt{#1}}\p@ipkgopt[#1]{#2}}

\newcommand*{\@pkgoptval}[2]{\pkgoptfmt{#1}\@ipkgopt[#1]{#2}}

% Class options

% \iclsopt{option}
% \iclsopt[value]{option}
% \iclsopt*{option} <- mark option
% \iclsopt*[value]{option} <- mark value
% \iclsopt+{value}{option} <- mark option

\newcommand*{\clsoptfmt}[1]{\textsf{#1}}

\newrobustcmd*{\iclsopt}{\@ifstar\s@iclsopt\ns@iclsopt}

\newcommand*{\ns@iclsopt}{\@ifnextchar+\p@iclsopt\@iclsopt}

\newcommand*{\s@iclsopt}[2][]{%
  \ifstrempty{#1}%
  {\index{class options:>#2=\doidxmarker\clsoptfmt{#2}\nlctdocmainencap}}%
  {\index{class options:>#2=\clsoptfmt{#2}>#1=\doidxmarker\clsoptfmt{#1}\nlctdocmainencap}}%
}

\newcommand*{\p@iclsopt}[2]{%
  \index{class options:>#2=\doidxmarker\clsoptfmt{#2}>#1=\clsoptfmt{#1}\nlctdocmainencap}%
}

\newcommand*{\@iclsopt}[2][]{%
  \ifstrempty{#1}%
  {\index{class options:>#2=\clsoptfmt{#2}\nlctdocmainencap}}%
  {\index{class options:>#2=\clsoptfmt{#2}>#1=\clsoptfmt{#1}\nlctdocmainencap}}%
}

\newrobustcmd*{\ideprecatedclsopt}[2][]{%
  \ifstrempty{#1}%
  {\index{class options:>#2=\clsoptfmt{#2} (deprecated)\nlctdocmainencap}}%
  {\index{class options:>#2=\clsoptfmt{#2} (deprecated)>#1=\clsoptfmt{#1}\nlctdocmainencap}}%
}

\newrobustcmd*{\clsopt}{\@ifstar\s@clsopt\ns@clsopt}

\newcommand*{\ns@clsopt}{\nlctdoc@ifplus\p@clsopt\@clsopt}

\newcommand*{\s@clsopt}[2][]{%
  \idxmarkedfont{\ifstrempty{#1}{\clsoptfmt{#2}}{\clsoptfmt{#2\dequals#1}}}%
  \s@iclsopt[#1]{#2}%
}

\newcommand*{\p@clsopt}[2]{%
  \idxmarkedfont{\ifstrempty{#1}{\clsoptfmt{#2}}{\clsoptfmt{#2\dequals#1}}}%
  \p@iclsopt{#1}{#2}%
}

\newcommand*{\@clsopt}[2][]{%
  \ifstrempty{#1}{\clsoptfmt{#2}}{\clsoptfmt{#2\dequals#1}}%
  \@iclsopt[#1]{#2}%
}

\newrobustcmd*{\deprecatedclsopt}[2][]{%
  \ifstrempty{#1}{\clsoptfmt{#2}}{\clsoptfmt{#2\dequals#1}}%
  \ideprecatedclsopt[#1]{#2}%
}

\newrobustcmd*{\clsoptval}{\@ifstar\s@clsoptval\ns@clsoptval}

\newcommand*{\ns@clsoptval}{\nlctdoc@ifplus\p@clsoptval\@clsoptval}

\newcommand*{\s@clsoptval}[2]{\idxmarkedfont{\clsoptfmt{#1}\s@iclsopt[#1]{#2}}}

\newcommand*{\p@clsoptval}[2]{\idxmarkedfont{\clsoptfmt{#1}\p@iclsopt[#1]{#2}}}

\newcommand*{\@clsoptval}[2]{\clsoptfmt{#1}\@iclsopt[#1]{#2}}

\newcommand*{\filetypefmt}[1]{\texttt{#1}}
\newcommand*{\ifiletype}[1]{\index{file
  types>#1=\filetypefmt{#1}\nlctdochyperencap}}

\newcommand*{\filetype}[1]{\filetypefmt{#1}\ifiletype{#1}}

\newcommand*{\styfmt}[1]{\textsf{#1}}

\newrobustcmd{\isty}{\@ifstar\s@isty\@isty}

\newcommand*{\@isty}[1]{\index{#1 package=\styfmt{#1}
  package\nlctdocmainencap}}
\newcommand*{\s@isty}[1]{\index{#1 package=\doidxmarker\styfmt{#1}
  package\nlctdocmainencap}}

\newrobustcmd{\sty}{\@ifstar\s@sty\@sty}

\newcommand*{\@sty}[1]{\styfmt{#1}\@isty{#1}}
\newcommand*{\s@sty}[1]{\idxmarkedfont{\styfmt{#1}}\s@isty{#1}}

\newcommand*{\clsfmt}[1]{\textsf{#1}}

\newrobustcmd{\icls}{\@ifstar\s@icls\@icls}

\newcommand*{\@icls}[1]{\index{#1 class=\clsfmt{#1}
  class\nlctdocmainencap}}
\newcommand*{\s@icls}[1]{\index{#1 class=\doidxmarker\clsfmt{#1}
  class\nlctdocmainencap}}

\newrobustcmd{\cls}{\@ifstar\s@cls\@cls}

\newcommand*{\@cls}[1]{\clsfmt{#1}\@icls{#1}}
\newcommand*{\s@cls}[1]{\idxmarkedfont{\clsfmt{#1}}\s@icls{#1}}

\newcommand*{\envfmt}[1]{\textsf{#1}}
\newcommand*{\ienv}[1]{\SpecialMainEnvIndex{#1}}
\newcommand*{\env}[1]{\envfmt{#1}\ienv{#1}}

\newcommand*{\ctrfmt}[1]{\textsf{#1}}
\newcommand*{\ictr}[1]{\index{#1={\protect\ttfamily#1} (counter)\nlctdochyperencap}}
\newcommand*{\ctr}[1]{\ctrfmt{#1}\ictr{#1}}

\newcommand*{\boolfmt}[1]{\textsf{#1}}
\newcommand*{\ibool}[1]{\index{#1={\ttfamily#1} (boolean variable)\nlctdochyperencap}}
\newcommand*{\bool}[1]{\boolfmt{#1}\ibool{#1}}

\newcommand*{\bstfmt}[1]{\textsf{#1}}
\newcommand*{\ibst}[1]{\index{#1 bibliography style=\bstfmt{#1} 
bibliography style\nlctdochyperencap}}
\newcommand*{\bst}[1]{\bstfmt{#1}\ibst{#1}}

\newcommand*{\menu}[1]{\textsf{#1}}

\providecommand*{\ctandoc}[1]{%
  \urlfootref{http://ctan.org/pkg/#1}{\sty{#1} documentation}%
}

\newcounter{example}
\newcommand*{\examplename}{example}

\newenvironment{example}[2]{%
  \refstepcounter{example}\label{#2}%
  \par\vskip10pt\noindent
  \textbf{\large Example \theexample\ (#1)}%
  \addcontentsline{loe}{section}{\protect\numberline{\theexample}#1}%
  \nopagebreak\par\vskip10pt\nopagebreak
}
{%
  \begin{center}\rule{2in}{1pt}\end{center}%
}

\@nlctdoc@if@usingtexht
{%
  \edef\aargh{\noexpand\HCode{\string&\string#x1F631;}}

  \newcommand*{\toTop}{\par\noindent\hyperlink{top}{Top}}

  \AtBeginDocument{%
    \Css{.warningsymbol { color: red; font-weight: bold;}}%
    \Css{div.important { border : solid red; }}%
    \Css{div.verbatim { font-family: monospace; white-space: nowrap; text-align:left; clear:both; padding-top: 2ex; padding-bottom: 2ex;} }%
  }

  \@ifundefined{chapter}
  {%
  \AtBeginDocument{%
      \Configure{section}{\toTop\HCode{<h2 class="sectionHead">}}{}{}{}%
      \Configure{subsection}{\toTop\HCode{<h3 class="subsectionHead">}}{}{}{}%
    }
  }%
  {%
    \renewcommand{\thefootnote}{\thechapter.\arabic{footnote}}
    \AtBeginDocument{%
      \Configure{chapter}
      {\HCode{<div class="chapter">}}
      {\HCode{</div>}\toTop}
      {\HCode{<h2 class="chapterHead">}\thechapter. }{\HCode{</h2>}}%
      \Configure{section}{\toTop\HCode{<h3 class="sectionHead">}}{}{}{}%
      \Configure{subsection}{\toTop\HCode{<h4 class="subsectionHead">}}{}{}{}%
    }%
  }%

  \providecommand*{\@maketitle}{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em%
  }

  \let\org@maketitle\maketitle
  \def\maketitle{\hypertarget{top}{}\org@maketitle}

  \let\oldlabel\label
  \renewcommand*{\label}[1]{%
    \HCode{<a name=\string"#1\string">}\oldlabel{#1}%
  }

  \renewcommand{\StopEventually}[1]{#1\toTop}
  \renewcommand*{\OnlyDescription}{}

  \newcommand*{\sectionref}[1]{\hyperref[#1]{\S\ref*{#1} }\nameref{#1}}
  \newcommand*{\xrsectionref}[3]{\href{#2.html\##1}{#3}}
  \newcommand*{\qtdocref}[2]{\href{#2.html}{\qt{#1}}}
  \newcommand*{\docref}[2]{\href{#2.html}{#1}}
  \newcommand*{\altdocref}[3]{\href{#3.html}{#1}}
  \newcommand*{\urlref}[2]{\href{#1}{#2}}
  \newcommand*{\urlfootref}[2]{\href{#1}{#2}}
  \newcommand*{\submenu}[1]{\menu{-\textgreater #1}}
  \newcommand*{\listofexamples}{}

  \edef\nlcthlangle{\noexpand\HCode{\string&\string#x27E8;}}
  \edef\nlcthrangle{\noexpand\HCode{\string&\string#x27E9;}}

  \renewcommand*{\meta}[1]{%
   \nlcthlangle\emph{#1}\nlcthrangle}
}%
{%
  \newcommand*{\toTop}{}
  \newcommand*{\sectionref}[1]{Section~\ref{#1}}
  \newcommand*{\qtdocref}[2]{\qt{#1} (\href{#2.pdf}{#2.pdf})}
  \newcommand*{\docref}[2]{#1 (\href{#2.pdf}{#2.pdf})}
  \newcommand*{\urlref}[2]{\url{#1}}
  \newcommand*{\urlfootref}[2]{#2\footnote{\url{#1}}}
  \newcommand*{\submenu}[1]{\,$\to$\,\menu{#1}}

  % \altdocref{text}{pdf}{html}
  \newcommand*{\altdocref}[3]{#1 (\href{#2.pdf}{#2.pdf})}

  % \xrsectionref{label}{html file}{html title}
  \newcommand*{\xrsectionref}[3]{Section~\ref{#1}}

  \newcommand*{\listofexamples}{%
    \@ifundefined{chapter}
    {%
      \section*{List of Examples}%
    }%
    {%
      \chapter*{List of Examples}%
    }
    \@starttoc{loe}%
  }

  \newcommand{\aargh}{\grimace}
}%


\AtBeginDocument{\MakeShortVerb{\|}}

\endinput
