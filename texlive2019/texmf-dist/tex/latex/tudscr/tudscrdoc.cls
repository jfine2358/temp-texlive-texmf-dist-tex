%%
%% This is file `tudscrdoc.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% tudscr-version.dtx  (with options: `class,doc')
%% tudscr-base.dtx  (with options: `class,doc')
%% tudscr-doc.dtx  (with options: `class,doc,option')
%% tudscr-locale.dtx  (with options: `class,doc')
%% tudscr-manual.dtx  (with options: `class,doc')
%% tudscr-doc.dtx  (with options: `class,doc,body')
%% tudscr-texindy.dtx  (with options: `class,doc')
%% 
%% TUD-Script -- Corporate Design of Technische Universitaet Dresden
%% 
%%   2017/05/30 v2.05m TUD-Script
%% 
%% Copyright (C) Falk Hanisch <hanisch.latex@outlook.com>, 2012-2017
%% 
%% This file was generated from file(s) of the TUD-Script bundle.
%% ----------------------------------------------------------------------------
%% 
%% This work may be distributed and/or modified under the conditions
%% of the LaTeX Project Public License, version 1.3c of the license.
%% The latest version of this license is in
%%     http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of
%% LaTeX 2005/12/01 or later and of this work.
%% 
%% This work has the LPPL maintenance status "author-maintained".
%% 
%% The current maintainer and author of this work is Falk Hanisch.
%% 
%%% From File: tudscr-version.dtx
\begingroup
  \catcode`\@11\relax
  \ifx\TUD@Version\@undefined
    \newcommand*\TUD@Version@Check[1]{%
      \gdef\TUD@Version{#1}%
      \gdef\TUDScriptVersion{#1}%
      \def\@tempb##1 v##2 ##3\relax##4\relax{\gdef\TUDScriptVersionNumber{##2}}%
      \edef\@tempa{\TUD@Version}%
      \expandafter\@tempb\@tempa\relax? ? \relax\relax%
      \gdef\TUD@Version@KOMA{3.17}%
    }
  \else
    \newcommand*\TUD@Version@Check[1]{%
      \def\@tempa{#1}%
      \ifx\TUD@Version\@tempa\else%
        \@latex@warning@no@line{%
          \noexpand\TUD@Version\space is `\TUD@Version',\MessageBreak%
          but `#1' was expected!\MessageBreak%
          You should not use classes, packages or files from\MessageBreak%
          different TUD-Script-Bundle versions%
        }%
      \fi%
    }
  \fi
  \TUD@Version@Check{2017/05/30 v2.05m TUD-Script}
\endgroup
\NeedsTeXFormat{LaTeX2e}
\providecommand*\tudscrmail{hanisch.latex@outlook.com}
\newcommand*\TUD@ProvidesClass[3]{%
  \ProvidesClass{#1}[%
  2017/05/30 v2.05m TUD-Script
    ^^J#3 (#2)%
  ]%
  \newcommand*\TUD@Class@KOMA{#2}%
  \ifx\TUD@Class@Parent\@undefined%
    \newcommand*\TUD@Class@Name{#1}%
    \TUD@Class@Info%
  \fi%
}
\providecommand*\TUD@Class@Info{%
  \typeout{+---------------------------------------------------------------}%
  \typeout{| Corporate Design of Technische Universitaet Dresden}%
  \typeout{| Class: \TUD@Class@Name}%
  \typeout{| Version: \TUD@Version}%
  \typeout{| Author: Falk Hanisch (\tudscrmail)}%
  \typeout{| Forum: http://latex.wcms-file3.tu-dresden.de/phpBB3/}%
  \typeout{+---------------------------------------------------------------}%
}
\TUD@ProvidesClass{tudscrdoc}{scrartcl}{source code documentation class}
\edef\TUDScriptClassName{\TUD@Class@Name}
\providecommand*\TUDClassName{\TUDScriptClassName}
\@ifundefined{TUDScript}{%
  \DeclareRobustCommand\TUDScript{%
    \ifdin{TUD-SCRIPT}{%
      \textsf{T\kern.05em U\kern.05em D\kern.1em-\kern.1em Script}%
    }\csname xspace\endcsname%
  }%
}{}
%%% From File: tudscr-base.dtx
\RequirePackage{scrlfile}[2013/12/19]
\RequirePackage{etoolbox}[2011/01/03]
\newcommand*\tud@reserved{}
\newcommand*\eaddto@hook[2]{%
  \expandafter\addto@hook\expandafter#1\expandafter{#2}%
}
\BeforePackage{tudscrbase}{%
  \undef\tud@reserved%
  \undef\eaddto@hook%
}
\newcommand*\TUD@UnwindPackage[2]{\AtEndPreamble{\@ifpackageloaded{#1}{}{#2}}}
\BeforePackage{tudscrbase}{\undef\TUD@UnwindPackage}
%%% From File: tudscr-doc.dtx
\newcommand*\scr@maketitle{}%
\PassOptionsToClass{toc=left}{scrartcl}%
\AfterClass{scrartcl}{\let\scr@maketitle\@maketitle}%
\newcommand*\sd@saved@LoadClass{}
\let\sd@saved@LoadClass=\LoadClass
\renewcommand*\LoadClass[2][]{%
  \begingroup
    \edef\@tempc{#2}\def\@tempb{article}%
    \ifx\@tempc\@tempb
      \let\LoadClass\sd@saved@LoadClass
      \def\@tempc{scrartcl}%
    \fi
    \edef\@tempc{%
      \noexpand\endgroup\noexpand\sd@saved@LoadClass[{#1}]{\@tempc}}%
  \@tempc
}
\newcommand*\sd@saved@PassOptionsToClass{}
\let\sd@saved@PassOptionsToClass=\PassOptionsToClass
\renewcommand*\PassOptionsToClass[2]{%
  \begingroup
    \edef\@tempc{#2}\def\@tempb{article}%
    \ifx\@tempc\@tempb
      \def\@tempc{scrartcl}%
    \fi
    \edef\@tempc{%
      \noexpand\endgroup\noexpand\sd@saved@PassOptionsToClass{#1}{%
        \@tempc}}%
  \@tempc
}
\LoadClassWithOptions{ltxdoc}[2015/03/26]
\setcounter{IndexColumns}{2}
\setcounter{StandardModuleDepth}{2}
\DeclareOption{final}{\let\tudfinalflag\relax}
\DeclareOption{texindy}{\let\tudxdyflag\relax}
\DeclareOption{xindy}{\let\tudxdyflag\relax}
\DeclareOption{xdy}{\let\tudxdyflag\relax}
\ProcessOptions\relax
\newcommand*\DisableCrossrefsForced{}
\let\DisableCrossrefsForced\DisableCrossrefs
%%% From File: tudscr-locale.dtx
\newcommand*\tud@locale@define[1]{%
  \providecommand*#1{%
    \ClassError{\TUD@Class@Name}{%
      `\string#1' not defined for language `\languagename'%
    }{%
      Currently the class `\TUD@Class@Name' only supports the\MessageBreak%
      languages german and english an its dialects. You must\MessageBreak%
      define single patterns by yourself, e.g.:\MessageBreak%
      `\string\providecaptionname{\languagename}\string#1{<text>}'\MessageBreak%
      You can send your definitions to \tudscrmail\space in\MessageBreak%
      order to implement support for additional languages.%
    }%
  }%
}
\tud@locale@define{\tud@general@name}
\tud@locale@define{\tud@implementation@name}
\tud@locale@define{\tud@changes@name}
\tud@locale@define{\tud@todo@name}
\tud@locale@define{\tud@environment@name}
\tud@locale@define{\tud@environments@name}
\tud@locale@define{\tud@option@name}
\tud@locale@define{\tud@options@name}
\tud@locale@define{\tud@layerpagestyle@name}
\tud@locale@define{\tud@layerpagestyles@name}
\tud@locale@define{\tud@layer@name}
\tud@locale@define{\tud@layers@name}
\tud@locale@define{\tud@length@name}
\tud@locale@define{\tud@lengths@name}
\tud@locale@define{\tud@counter@name}
\tud@locale@define{\tud@counters@name}
\tud@locale@define{\tud@TUDcolor@name}
\tud@locale@define{\tud@TUDcolors@name}
\tud@locale@define{\tud@locale@name}
\tud@locale@define{\tud@locales@name}
\tud@locale@define{\tud@field@name}
\tud@locale@define{\tud@fields@name}
\tud@locale@define{\tud@KOMAfont@name}
\tud@locale@define{\tud@KOMAfonts@name}
\tud@locale@define{\tud@parameter@name}
\tud@locale@define{\tud@parameters@name}
\tud@locale@define{\tud@index@text}
\newcommand*\tud@locale@german{%
  \providecaptionname{%
    german,ngerman,austrian,naustrian,swissgerman,nswissgerman%
  }%
}
\tud@locale@german{\tud@general@name}{Allgemein}%
\tud@locale@german{\tud@implementation@name}{Implementierung}%
\tud@locale@german{\tud@changes@name}{\"Anderungsliste}
\tud@locale@german{\tud@todo@name}{Liste der noch zu erledigenden Punkte}
\tud@locale@german{\tud@environment@name}{Umg.}
\tud@locale@german{\tud@environments@name}{Umgebungen}
\tud@locale@german{\tud@option@name}{Opt.}
\tud@locale@german{\tud@options@name}{Optionen}
\tud@locale@german{\tud@layerpagestyle@name}{Seitenstil}
\tud@locale@german{\tud@layerpagestyles@name}{Seitenstile}
\tud@locale@german{\tud@layer@name}{Layer}
\tud@locale@german{\tud@layers@name}{Layer (Seitenstilebenen)}
\tud@locale@german{\tud@length@name}{L\"ange}
\tud@locale@german{\tud@lengths@name}{L\"angen}
\tud@locale@german{\tud@counter@name}{Z\"ahler}
\tud@locale@german{\tud@counters@name}{Z\"ahler}
\tud@locale@german{\tud@TUDcolor@name}{Farbe}
\tud@locale@german{\tud@TUDcolors@name}{Farben}
\tud@locale@german{\tud@locale@name}{Lok.}
\tud@locale@german{\tud@locales@name}{Lokalisierungsvariablen}
\tud@locale@german{\tud@field@name}{Feld}
\tud@locale@german{\tud@fields@name}{Eingabefelder}
\tud@locale@german{\tud@KOMAfont@name}{Schriftel.}
\tud@locale@german{\tud@KOMAfonts@name}{Schriftelemente}
\tud@locale@german{\tud@parameter@name}{Param.}
\tud@locale@german{\tud@parameters@name}{Parameter}
\tud@locale@german{\tud@index@text}{%
  Kursive Zahlen entsprechen der Seite, auf welcher der korrespondierende
  Eintrag beschrieben wird. Unterstrichene Zahlen verweisen auf die
  \ifcodeline@index Codezeile der \fi Definition.
  \ifscan@allowed%
    Alle weiteren Eintr\"age sind
    \ifcodeline@index Zeilennummern\else Seitenzahlen\fi,
    wo der jeweilige Eintrag verwendet wird.
  \fi%
}
\newcommand*\tud@locale@english{%
  \providecaptionname{%
    american,australian,british,canadian,english,newzealand,UKenglish,USenglish%
  }%
}
\tud@locale@english{\tud@general@name}{General}%
\tud@locale@english{\tud@implementation@name}{Implementation}%
\tud@locale@english{\tud@changes@name}{Change History}
\tud@locale@english{\tud@todo@name}{List of ToDos}
\tud@locale@english{\tud@environment@name}{env.}
\tud@locale@english{\tud@environments@name}{environments}
\tud@locale@english{\tud@option@name}{opt.}
\tud@locale@english{\tud@options@name}{options}
\tud@locale@english{\tud@layerpagestyle@name}{pagestyle}
\tud@locale@english{\tud@layerpagestyles@name}{pagestyles}
\tud@locale@english{\tud@layer@name}{layer}
\tud@locale@english{\tud@layers@name}{layers (pagestyle)}
\tud@locale@english{\tud@length@name}{length}
\tud@locale@english{\tud@lengths@name}{lengths}
\tud@locale@english{\tud@counter@name}{counter}
\tud@locale@english{\tud@counters@name}{counters}
\tud@locale@english{\tud@TUDcolor@name}{color}
\tud@locale@english{\tud@TUDcolors@name}{colors}
\tud@locale@english{\tud@locale@name}{locale}
\tud@locale@english{\tud@locales@name}{locales}
\tud@locale@english{\tud@field@name}{field}
\tud@locale@english{\tud@fields@name}{input fields}
\tud@locale@english{\tud@KOMAfont@name}{font}
\tud@locale@english{\tud@KOMAfonts@name}{font elements}
\tud@locale@english{\tud@parameter@name}{param.}
\tud@locale@english{\tud@parameters@name}{parameters}
\tud@locale@english{\tud@index@text}{%
  Numbers written in italic refer to the page where the corresponding entry is
  described. Numbers underlined refer to the
  \ifcodeline@index code line of the \fi definition.
  \ifscan@allowed%
    All additional entries refer to the
    \ifcodeline@index code lines \else pages \fi
    where the entry is used.
  \fi%
}
%%% From File: tudscr-manual.dtx
\RequirePackage{scrhack}[2014/02/27]
\RequirePackage{xspace}[2009/10/20]
\xspaceaddexceptions{"=}
\newcommand*\vTUDScript{v\TUDScriptVersionNumber}
\newcommand*\vKOMAScript{v\TUD@Version@KOMA}
\newcommand*\tud@english[1]{#1}
\AtBeginDocument{%
  \providecommand*\iflanguageloaded[3]{#3}%
  \iflanguageloaded{english}{%
    \renewcommand*\tud@english[1]{\foreignlanguage{english}{#1}}%
  }{}%
}
\RequirePackage{pdftexcmds}[2016/05/21]
\PassOptionsToPackage{hyperindex=false,colorlinks,linkcolor=blue}{hyperref}
\PassOptionsToPackage{open,openlevel=0}{bookmark}
\AfterPackage*{hyperref}{%
  \newcommand*\hypersource@def{}
  \newcommand*\hypersourcedef[1]{%
    \ifstr{#1}{\hypersource@def}{}{%
      \Hy@raisedlink{\hyperdef{}{source:#1}{}}%
      \xdef\hypersource@def{#1}%
    }%
  }%
  \newcommand*\hypersource@ref@codeline[2][\@firstofone]{%
    \begingroup%
      \def\@tempa##1{\hyperref{}{}{source:##1}{#1{##1}}}%
      \forcsvlist\@tempa{#2}%
    \endgroup%
  }%
  \newcommand*\hypersource@ref@page[2][\@firstofone]{%
    \begingroup%
      \def\@tempa##1{\hyperlink{page.##1}{#1{##1}}}%
      \forcsvlist\@tempa{#2}%
    \endgroup%
  }%
  \renewcommand*\main[1]{%
    \ifcodeline@index%
      \hypersource@ref@codeline[\underline]{#1}%
    \else%
      \hypersource@ref@page[\underline]{#1}%
    \fi%
  }%
  \renewcommand*\usage[1]{\hypersource@ref@page[\textit]{#1}}%
}
\TUD@UnwindPackage{hyperref}{%
  \providecommand*\hypersetup[1]{}%
  \providecommand*\href[3][]{#3}%
  \providecommand*\phantomsection{}%
  \providecommand*\texorpdfstring[2]{#1}%
  \RequirePackage{url}[2013/09/16]%
  \providecommand*\nolinkurl[1]{\url{#1}}%
  \providecommand*\hypersourcedef[1]{}
  \providecommand*\hypersource@def{}
  \providecommand*\hypersource@ref@codeline[2][]{}
  \providecommand*\hypersource@ref@page[2][]{}
}
\TUD@UnwindPackage{trimspaces}{\providecommand*\trim@spaces[1]{#1}}
\newcommand*\hrfn[2]{%
  \href{#1}{\trim@spaces{#2}}%
  \footnote{%
    \begingroup%
      \def\_{_}%
      \edef\@tempa{#1}%
      \strut\expandafter\url\expandafter{\@tempa}%
    \endgroup%
  }%
}
\newrobustcmd*\mailto[1]{\mbox{\href{mailto:#1}{\nolinkurl{#1}}}}%
\AfterPackage*{hyperref}{%
  \patchcmd{\pdfstringdef}{\csname HyPsd@babel@}{%
    \let\bbl@info\@gobble\csname HyPsd@babel@%
  }{}{\tud@patch@wrn{pdfstringdef}}%
}
\AfterPackage*{inputenc}{\RequirePackage{csquotes}[2011/10/22]}
\newcommand*\tud@replace[3]{%
  \begingroup%
    \toks@{\def\@tempa##1}%
    \eaddto@hook\toks@{\detokenize{#2}}%
    \addto@hook\toks@{##2\@nil{\@tempb{##1}{##2}}}%
    \the\toks@%
    \def\@tempb##1##2{%
      \IfArgIsEmpty{##2}{%
        \appto#1{##1}%
        \let\@tempc\relax%
      }{%
        \appto#1{##1#3}%
        \def\@tempc{\@tempa##2\@nil}%
      }%
      \@tempc%
    }%
    \toks@{\@tempa}%
    \edef\@tempc{\expandafter\detokenize\expandafter{#1}}%
    \eaddto@hook\toks@{\@tempc}%
    \eaddto@hook\toks@{\detokenize{#2}\@nil}%
    \def#1{}%
    \the\toks@%
    \edef\tud@reserved{%
      \noexpand\endgroup%
      \def\noexpand#1{#1}%
    }%
  \tud@reserved%
}
\newcommand*\CD{\tud@english{Corporate Design}\xspace}
\newcommand*\CDs{\tud@english{Corporate Designs}\xspace}
\newcommand*\TUD{Technische Universit\"at Dresden\xspace}
\newcommand*\TnUD{Technischen Universit\"at Dresden\xspace}
\newcommand*\TUDCD{\CD der \TnUD}
\newcommand*\TUDCDs{\CDs der \TnUD}
\newrobustcmd*\DDC{%
  \mbox{%
    D\kern.05em R\kern.05em E\kern.05em S\kern.05em %
    D\kern.05em E\kern.05em N\kern.1em-\kern.1em concept%
  }\xspace%
}
\AfterPackage*{hyperref}{%
  \pdfstringdefDisableCommands{%
    \def\DDC{DRESDEN-concept}%
    \def\TUDScript{TUD-Script}%
    \def\KOMAScript{KOMA-Script}%
  }%
}
\newcommand*\Univers{\texorpdfstring{\textubn{Univers}}{Univers}\xspace}
\newcommand*\DIN{\texorpdfstring{\textdbn{DIN~BOLD}}{DIN BOLD}\xspace}
%%% From File: tudscr-doc.dtx
\RequirePackage{dox}[2010/12/16]
\@ifpackagelater{dox}{2017/01/27}{%
  \ClassWarning{\TUD@Class@Name}{%
    Package `dox' was updated so some patches\MessageBreak%
    are maybe outdated%
  }%
}{}%
\CheckCommand\m@cro@[2]{%
  \endgroup \topsep\MacroTopsep \trivlist
  \edef\saved@macroname{\string#2}%
  #1
    \let\saved@indexname\saved@macroname
  \else
    \edef\saved@indexname{\expandafter\@gobble\string#2}%
  \fi
  \def\makelabel##1{\llap{##1}}%
  \if@inlabel
    \let\@tempa\@empty \count@\macro@cnt
    \loop \ifnum\count@>\z@
      \edef\@tempa{\@tempa\hbox{\strut}}\advance\count@\m@ne \repeat
    \edef\makelabel##1{\llap{\vtop to\baselineskip
                               {\@tempa\hbox{##1}\vss}}}%
    \advance \macro@cnt \@ne
  \else  \macro@cnt\@ne  \fi
  \edef\@tempa{\noexpand\item[%
     #1%
       \noexpand\PrintMacroName
     \else
       \noexpand\PrintEnvName
     \fi
     {\string#2}]}%
  \@tempa
  \global\advance\c@CodelineNo\@ne
   #1%
      \SpecialMainIndex{#2}\nobreak
      \DoNotIndex{#2}%
   \else
      \SpecialMainEnvIndex{#2}\nobreak
   \fi
  \global\advance\c@CodelineNo\m@ne
  \ignorespaces
}
\CheckCommand\doxitem[4][]{%
  \@nameuse{dox@macrolike\dox@macrolikedefault}%
  \def\dox@idxtype{#3}%
  \setkeys{dox}{#1}
  \@ifundefined{Print#2Name}{%
    \ifdox@macrolike
      \expandafter\def\csname Print#2Name\endcsname##1{%
        \strut\MacroFont\string ##1\ }
    \else
      \expandafter\def\csname Print#2Name\endcsname##1{%
        \strut\MacroFont ##1\ }
    \fi}{}
  \ifdox@macrolike
    \def\@doxexpr{\@doxcreatespecialmainmacrolikeindex{#2}}%
  \else
    \def\@doxexpr{\@doxcreatespecialmainindex{#2}}%
  \fi
  \expandafter\@doxexpr\expandafter{\dox@idxtype}{#4}%
  \@ifundefined{PrintDescribe#2}{%
    \ifdox@macrolike
      \expandafter\def\csname PrintDescribe#2\endcsname##1{%
        \strut\MacroFont\string ##1\ }
    \else
      \expandafter\def\csname PrintDescribe#2\endcsname##1{%
        \strut\MacroFont ##1\ }
    \fi}{}
  \ifdox@macrolike
    \def\@doxexpr{\@doxcreatespecialmacrolikeindex{#2}}%
  \else
    \def\@doxexpr{\@doxcreatespecialindex{#2}}%
  \fi
  \expandafter\@doxexpr\expandafter{\dox@idxtype}{#4}%
  \@doxcreatedescribe{#2}
  \@doxcreateenv{#2}{#3}
  \ifdox@macrolike
    \expandafter\let\csname @Save#2IndexName\endcsname%
      \@doxsavemacrolikeindexname%
  \else
    \expandafter\let\csname @Save#2IndexName\endcsname\@doxsaveindexname%
  \fi
}
\renewcommand*\doxitem[4][]{%
  \@nameuse{dox@macrolike\dox@macrolikedefault}%
  \def\dox@idxtype{#3}%
  \setkeys{dox}{#1}%
  \ifdox@macrolike%
    \def\@doxexpr{\@doxcreatespecialmainmacrolikeindex{#2}}%
  \else%
    \def\@doxexpr{\@doxcreatespecialmainindex{#2}}%
  \fi%
  \expandafter\@doxexpr\expandafter{\dox@idxtype}{#4}%
  \ifdox@macrolike%
    \def\@doxexpr{\@doxcreatespecialmacrolikeindex{#2}}%
  \else%
    \def\@doxexpr{\@doxcreatespecialindex{#2}}%
  \fi%
  \expandafter\@doxexpr\expandafter{\dox@idxtype}{#4}%
  \ifdox@macrolike%
    \def\@doxexpr{\@doxcreatemacrolikeprintname{#2}}%
  \else%
    \def\@doxexpr{\@doxcreateprintname{#2}}%
  \fi%
  \expandafter\@doxexpr\expandafter{\dox@idxtype}%
  \ifdox@macrolike%
    \def\@doxexpr{\@doxcreatemacrolikeindexname{#2}}%
  \else%
    \def\@doxexpr{\@doxcreateindexname{#2}}%
  \fi%
  \expandafter\@doxexpr\expandafter{\dox@idxtype}%
  \@doxcreatedescribe{#2}%
  \@doxcreatedescribes{#2}%
  \@doxcreateenv{#2}{#3}%
}
\newlength\marginnotevskip
\newcommand*\@doxcreatedescribes[1]{%
  \expandafter\def\csname Describe#1s\endcsname##1{%
    \setlength\marginnotevskip{\z@}%
    \def\@tempc{##1}%
    \@for\@tempa:=\@tempc\do{%
      \expandafter\ifblank\expandafter{\@tempa}{}{%
        \edef\@tempb{%
          \expandonce{\csname Describe#1\endcsname}{\expandonce{\@tempa}}%
        }%
        \@tempb%
        \addtolength\marginnotevskip{\baselineskip}%
      }%
    }%
    \setlength\marginnotevskip{\z@}%
    \ignorespaces%
  }%
}
\@doxcreatedescribes{Macro}
\AfterPackage{marginnote}{%
  \renewcommand*\marginpar[2][]{%
    \IfArgIsEmpty{#1}{%
      \marginnote{#2}[\marginnotevskip]%
    }{%
      \marginnote[{#1}]{#2}[\marginnotevskip]%
    }%
  }%
}
\newrobustcmd*\index@type[1]{%
  \begingroup%
  \normalfont\scriptsize\space(#1)%
  \endgroup%
}
\CheckCommand*\@doxcreatespecialmainmacrolikeindex[3]{%
  \expandafter\def\csname SpecialMain#1Index\endcsname##1{%
    \@SpecialIndexHelper@##1\@nil
    \@bsphack%
    \special@index{\@gtempa\actualchar
      \string\verb\quotechar*\verbatimchar\bslash\@gtempa\verbatimchar
      \space(#2)\encapchar main}%
    \special@index{#3:\levelchar\@gtempa\actualchar%
      \string\verb\quotechar*\verbatimchar\bslash\@gtempa\verbatimchar
      \encapchar main}%
    \@esphack%
  }%
}
\renewcommand*\@doxcreatespecialmainmacrolikeindex[3]{%
  \expandafter\def\csname SpecialMain#1Index\endcsname##1{%
    \@SpecialIndexHelper@##1\@nil%
    \@bsphack%
    \protected@edef\tud@reserved{#2}%
    \special@index{%
      \@gtempa\space\expandonce\tud@reserved\actualchar%
      \string\verb\quotechar*\verbatimchar\bslash\@gtempa\verbatimchar%
      \index@type{\expandonce\tud@reserved}\encapchar main%
    }%
    \protected@edef\tud@reserved{#3}%
    \special@index{%
      \expandonce\tud@reserved:\levelchar\@gtempa\actualchar%
      \string\verb\quotechar*\verbatimchar\bslash\@gtempa\verbatimchar%
      \encapchar main%
    }%
    \@esphack%
    \let\parameter@parent@changes\relax%
    \hypersourcedef{\filesep\number\c@CodelineNo}%
  }%
}
\CheckCommand*\@doxcreatespecialmainindex[3]{%
  \expandafter\def\csname SpecialMain#1Index\endcsname##1{%
    \@bsphack%
    \special@index{##1\actualchar{\string\ttfamily\space##1} (#2)
      \encapchar main}%
    \special@index{#3:\levelchar##1\actualchar{\string\ttfamily\space##1}
      \encapchar main}%
    \@esphack%
  }%
}
\renewcommand*\@doxcreatespecialmainindex[3]{%
  \expandafter\def\csname SpecialMain#1Index\endcsname##1{%
    \@bsphack%
    \protected@edef\tud@reserved{#2}%
    \special@index{%
      ##1\space\expandonce\tud@reserved\actualchar%
      {\string\ttfamily\space##1}\index@type{\expandonce\tud@reserved}%
      \encapchar main%
    }%
    \protected@edef\tud@reserved{#3}%
    \special@index{%
      \expandonce\tud@reserved:\levelchar##1\actualchar%
      {\string\ttfamily\space##1}\encapchar main%
    }%
    \@esphack%
    \let\parameter@parent@changes\relax%
    \hypersourcedef{\filesep\number\c@CodelineNo}%
  }%
}
\CheckCommand*\@doxcreatespecialmacrolikeindex[3]{%
  \expandafter\def\csname Special#1Index\endcsname##1{%
    \@SpecialIndexHelper@##1\@nil
    \@bsphack%
    \index{\@gtempa\actualchar
      \string\verb\quotechar*\verbatimchar\bslash\@gtempa\verbatimchar
      \space(#2)\encapchar usage}%
    \index{#3:\levelchar\@gtempa\actualchar
      \string\verb\quotechar*\verbatimchar\bslash\@gtempa\verbatimchar
      \encapchar usage}%
    \@esphack%
  }%
}
\renewcommand*\@doxcreatespecialmacrolikeindex[3]{%
  \expandafter\def\csname Special#1Index\endcsname##1{%
    \@SpecialIndexHelper@##1\@nil%
    \@bsphack%
    \protected@edef\tud@reserved{#2}%
    \index{%
      \@gtempa\space\expandonce\tud@reserved\actualchar%
      \string\verb\quotechar*\verbatimchar\bslash\@gtempa\verbatimchar%
      \index@type{\expandonce\tud@reserved}\encapchar usage%
    }%
    \protected@edef\tud@reserved{#3}%
    \index{%
      \expandonce\tud@reserved:\levelchar\@gtempa\actualchar%
      \string\verb\quotechar*\verbatimchar\bslash\@gtempa\verbatimchar%
      \encapchar usage%
    }%
    \@esphack%
  }%
}
\CheckCommand*\@doxcreatespecialindex[3]{%
  \expandafter\def\csname Special#1Index\endcsname##1{%
    \@bsphack%
    \index{##1\actualchar{\protect\ttfamily##1} (#2)\encapchar usage}%
    \index{#3:\levelchar##1\actualchar{\protect\ttfamily##1}
      \encapchar usage}%
    \@esphack%
  }%
}
\renewcommand*\@doxcreatespecialindex[3]{%
  \expandafter\def\csname Special#1Index\endcsname##1{%
    \@bsphack%
    \protected@edef\tud@reserved{#2}%
    \index{%
      ##1\space\expandonce\tud@reserved\actualchar%
      {\protect\ttfamily##1}\index@type{\expandonce\tud@reserved}%
      \encapchar usage%
    }%
    \protected@edef\tud@reserved{#3}%
    \index{%
      \expandonce\tud@reserved:\levelchar##1\actualchar%
      {\protect\ttfamily##1}\encapchar usage%
    }%
    \@esphack%
  }%
}
\def\@doxcreatemacrolikeprintname#1#2{%
  \@ifundefined{Print#1Name}{%
    \expandafter\def\csname Print#1Name\endcsname##1{%
      \MacroFont\string##1\index@type{#2}\strut\ %
    }%
  }{}%
  \@ifundefined{PrintDescribe#1}{%
    \expandafter\def\csname PrintDescribe#1\endcsname##1{%
      \MacroFont\string##1\index@type{#2}\strut\ %
    }%
  }{}%
}
\def\@doxcreateprintname#1#2{%
  \@ifundefined{Print#1Name}{%
    \expandafter\def\csname Print#1Name\endcsname##1{%
      \MacroFont##1\index@type{#2}\strut\ %
    }%
  }{}%
  \@ifundefined{PrintDescribe#1}{%
    \expandafter\def\csname PrintDescribe#1\endcsname##1{%
      \MacroFont##1\index@type{#2}\strut\ %
    }%
  }{}%
}
\newcommand*\saved@indextype{}
\def\@doxcreatemacrolikeindexname#1#2{%
  \expandafter\def\csname @Save#1IndexName\endcsname##1{%
    \edef\saved@indexname{\expandafter\@gobble##1}%
    \protected@edef\saved@indextype{#2}%
  }%
}
\def\@doxcreateindexname#1#2{%
  \expandafter\def\csname @Save#1IndexName\endcsname##1{%
    \let\saved@indexname##1%
    \protected@edef\saved@indextype{#2}%
  }%
}
\CheckCommand*\@SaveMacroIndexName[1]{%
  \edef\saved@indexname{\expandafter\@gobble#1}%
}
\CheckCommand*\@SaveEnvIndexName[1]{\let\saved@indexname#1}
\apptocmd{\@SaveMacroIndexName}{%
  \let\saved@indextype\@empty%
}{}{\tud@patch@wrn{@SaveMacroIndexName}}
\CheckCommand*\SpecialMainMacroIndex[1]{%
  \SpecialMainIndex{#1}\nobreak%
  \DoNotIndex{#1}%
}
\apptocmd{\SpecialMainMacroIndex}{%
  \let\parameter@parent@changes\relax%
  \hypersourcedef{\filesep\number\c@CodelineNo}%
}{}{\tud@patch@wrn{SpecialMainMacroIndex}}
\renewcommand*\tud@reserved[3][]{%
  \doxitem[#1,idxtype=\csname tud@#3@name\endcsname]{#2}{#3}{%
    \csname tud@#3s@name\endcsname%
  }%
}
\undef\PrintEnvName
\undef\PrintDescribeEnv
\tud@reserved{Env}{environment}
\tud@reserved{Option}{option}
\tud@reserved{LayerPageStyle}{layerpagestyle}
\tud@reserved{Layer}{layer}
\tud@reserved[macrolike]{Length}{length}
\tud@reserved{Counter}{counter}
\tud@reserved{Color}{TUDcolor}
\tud@reserved[macrolike]{Locale}{locale}
\tud@reserved[macrolike]{Field}{field}
\tud@reserved{Font}{KOMAfont}
\tud@reserved{Parameter}{parameter}
\newcommand*\parameter@parent@changes{}
\let\parameter@parent@changes\relax
\newcommand*\parameter@parent@indexname{}
\let\parameter@parent@indexname\relax
\newcommand*\parameter@parent@indexformat{}
\let\parameter@parent@indexformat\relax
\apptocmd{\@SaveMacroIndexName}{%
  \edef\parameter@parent@indexname{\expandafter\@gobble#1}%
  \edef\parameter@parent@indexformat{%
    \string\verb\quotechar*\verbatimchar#1\verbatimchar%
  }%
}{}{\tud@patch@wrn{@SaveMacroIndexName}}
\apptocmd{\@SaveEnvIndexName}{%
  \protected@edef\parameter@parent@indexname{#1\space\saved@indextype}%
  \protected@edef\parameter@parent@indexformat{%
    \string\verb\quotechar*\verbatimchar#1\verbatimchar%
    \index@type{\saved@indextype}%
  }%
}{}{\tud@patch@wrn{@SaveEnvIndexName}}
\renewcommand*\SpecialMainParameterIndex[1]{%
  \ifx\parameter@parent@indexname\relax%
    \ClassError{\TUD@Class@Name}{No previous macro or environment}{%
      Since parameters can only be used for macros or\MessageBreak%
      environments, you have to use `parameter' within\MessageBreak%
      `macro' or `environment'.%
    }%
  \fi%
  \protected@edef\parameter@parent@changes{%
    \parameter@parent@indexname\actualchar%
    \parameter@parent@indexformat:\levelchar%
  }%
  \@bsphack%
  \special@index{%
    \parameter@parent@indexname\actualchar%
    \parameter@parent@indexformat\levelchar%
    #1\space\tud@parameter@name\actualchar%
    {\string\ttfamily\space#1}\index@type{\tud@parameter@name}%
    \encapchar main%
  }%
  \special@index{%
    \tud@parameters@name:\levelchar%
    #1\space\parameter@parent@indexname%
    \actualchar{\string\ttfamily\space#1}%
    \noexpand\,--\noexpand\,\parameter@parent@indexformat%
    \encapchar main%
  }%
  \@esphack%
  \hypersourcedef{\filesep\number\c@CodelineNo}%
}
\newenvironment{DescribeParameterParent}[2]{%
  \@nameuse{@Save#1IndexName}{\string#2}%
}{}
\renewcommand*\SpecialParameterIndex[1]{%
  \ifx\parameter@parent@indexname\relax%
    \ClassError{\TUD@Class@Name}{No previous macro or environment}{%
      Since parameters can only be used for macros or\MessageBreak%
      environments, you have to use macro\MessageBreak%
      `\string\DescribeParameter' only within the environment\MessageBreak%
      `DescribeParameterParent'.%
    }%
  \fi%
  \@bsphack%
  \index{%
    \parameter@parent@indexname\actualchar%
    \parameter@parent@indexformat\levelchar%
    #1\space\tud@parameter@name\actualchar%
    {\protect\ttfamily#1}\index@type{\tud@parameter@name}%
    \encapchar usage%
  }%
  \index{%
    \tud@parameters@name:\levelchar#1\space\parameter@parent@indexname%
    \actualchar{\protect\ttfamily#1}%
    \noexpand\,--\noexpand\,\parameter@parent@indexformat%
    \encapchar usage%
  }%
  \@esphack%
}
\CheckCommand*\changes@[3]{%
  \protected@edef\@tempa{%
    \noexpand\glossary{%
      #1\levelchar
      \ifx\saved@macroname\@empty
        \space
        \actualchar
        \generalname
      \else
        \saved@indexname
        \actualchar
        \string\verb\quotechar*%
        \verbatimchar\saved@macroname
        \verbatimchar
      \fi
      :\levelchar #3%
    }%
  }%
  \@tempa\endgroup\@esphack%
}
\ifdefined\tudxdyflag%
  \renewcommand*\changes@[3]{%
    \@tempswatrue%
    \ifblank{#1}{\@tempswafalse}{}%
    \ifblank{#3}{\@tempswafalse}{}%
    \if@tempswa%
      \ifx\parameter@parent@changes\relax%
        \protected@edef\@tempb{%
          \saved@indexname%
          \ifx\saved@indextype\@empty\else%
            \space\saved@indextype%
          \fi%
          \actualchar%
          \string\verb\quotechar*%
          \verbatimchar\saved@macroname%
          \verbatimchar%
          \ifx\saved@indextype\@empty\else%
            \index@type{\saved@indextype}%
          \fi%
          :\levelchar%
        }%
      \else%
        \protected@edef\@tempb{%
          \parameter@parent@changes%
          \saved@indexname%
          \ifx\saved@indextype\@empty\else%
            \space\saved@indextype%
          \fi%
          \actualchar%
          {\noexpand\ttfamily\saved@macroname}%
          \ifx\saved@indextype\@empty\else%
            \index@type{\saved@indextype}%
          \fi%
          :\levelchar%
        }%
      \fi%
      \protected@edef\@tempa{%
        \noexpand\glossary{%
          #1\levelchar%
          \ifx\saved@macroname\@empty%
            \tud@general@name%
          \else%
            \tud@implementation@name%
          \fi%
          \levelchar%
          \ifx\saved@macroname\@empty\else%
            \@tempb%
          \fi%
          #2 #3%
          \actualchar%
          #3% (#2)%
        }%
      }%
    \else%
      \let\@tempa\relax%
    \fi%
    \@tempa\endgroup\@esphack%
  }%
\else%
  \renewcommand*\changes@[3]{%
    \protected@edef\@tempa{%
      \noexpand\glossary{%
        #1\levelchar%
        \ifx\saved@macroname\@empty%
          \quotechar!%
          \actualchar%
          \tud@general@name%
          :\levelchar%
        \else%
          \ifx\parameter@parent@changes\relax\else%
            \parameter@parent@changes zzz\space%
          \fi%
          \saved@indexname%
          \ifx\saved@indextype\@empty\else%
            \space\saved@indextype%
          \fi%
          \actualchar%
          \string\verb\quotechar*%
          \verbatimchar\saved@macroname%
          \verbatimchar%
          \ifx\saved@indextype\@empty\else%
            \index@type{\saved@indextype}%
          \fi%
          \ifx\parameter@parent@changes\relax%
            :\levelchar%
          \else%
            :\space%
          \fi%
        \fi%
        #3%
      }%
    }%
    \@tempa\endgroup\@esphack%
  }%
\fi%
\CheckCommand*\@wrglossary[1]{%
  \protected@write\@glossaryfile{}%
  {\string\glossaryentry{#1}{\thepage}}%
  \endgroup
  \@esphack%
}
\def\@wrglossary#1{%
  \ifx\saved@macroname\@empty%
    \protected@write\@glossaryfile{}{%
      \string\glossaryentry{#1|usage}{\thepage}%
    }%
  \else%
    \ifcodeline@index%
      \global\advance\c@CodelineNo\@ne%
      \protected@write\@glossaryfile{}{%
        \string\glossaryentry{#1|main}{\filesep\number\c@CodelineNo}%
      }%
      \global\advance\c@CodelineNo\m@ne%
    \else%
      \protected@write\@glossaryfile{}{%
        \string\glossaryentry{#1|main}{\thepage}%
      }%
    \fi%
  \fi%
  \endgroup%
  \@esphack%
}
\newcommand*\tud@lst@subsub{}
\newcommand*\tud@lst@subsubsub{}
\newcommand*\subsubsubitem{\@idxitem\hspace*{35\p@}}
\newcommand*\efil{\hfil\nopagebreak}%
\newcommand*\tud@lst@def{%
  \newcommand*\tud@lst@values{}%
  \newif\if@tud@lst@multi%
  \newcommand*\tud@lst@init{%
    \let\tud@lst@values\relax%
    \let\tud@lst@subsub\relax%
    \@tud@lst@multifalse%
  }%
  \newcommand*\tud@lst@add[1]{%
    \ifx\tud@lst@values\relax\else%
      \@tud@lst@multitrue%
      \def\tud@lst@subsub{\subsubitem}%
    \fi%
    \listadd\tud@lst@values{\tud@lst@subsub ##1}%
  }%
  \newcommand*\tud@lst@process{%
    \if@tud@lst@multi%
      \preto\tud@lst@values{\efill}%
    \fi%
    \forlistloop{}{\tud@lst@values}%
    \tud@lst@init%
  }%
  \newcommand*\tud@lst@@values{}%
  \newif\if@tud@lst@@multi%
  \newcommand*\tud@lst@@init{%
    \let\tud@lst@@values\relax%
    \def\tud@lst@subsub{\subsubitem}%
    \def\tud@lst@subsubsub{\space}%
    \@tud@lst@@multifalse%
  }%
  \newcommand*\tud@lst@@add[1]{%
    \@tud@lst@multitrue%
    \ifx\tud@lst@@values\relax\else%
      \@tud@lst@@multitrue%
      \def\tud@lst@subsubsub{\subsubsubitem}%
    \fi%
    \listadd\tud@lst@@values{##1}%
  }%
  \newcommand*\tud@lst@@process{%
    \if@tud@lst@@multi%
      \appto\tud@lst@values{\efill}%
    \fi%
    \edef\tud@reserved####1{%
      \noexpand\listadd\noexpand\tud@lst@values{%
        \expandonce\tud@lst@subsubsub####1%
      }%
    }%
    \forlistloop{\tud@reserved}{\tud@lst@@values}%
    \tud@lst@@init%
  }%
}
\ifdefined\tudxdyflag
  \newcommand*\tud@write@replace{}
  \newwrite\tud@write@replace
  \newcommand*\tud@read@replace{}
  \newread\tud@read@replace
  \def\actualchar{<|1|>}
  \def\quotechar{<|2|>}
  \def\levelchar{<|3|>}
  \begingroup
    \endlinechar=\m@ne\relax%
    \def\tud@reserved#1#2{%
      \IfFileExists{\jobname.#1}{%
        \immediate\openin\tud@read@replace=\jobname.#1\relax%
        \immediate\openout\tud@write@replace=\jobname-xdy.#1\relax%
        \@tempswafalse%
        \loop\unless\ifeof\tud@read@replace%
          \readline\tud@read@replace to\tud@line@replace%
          \tud@replace\tud@line@replace{"}{""}%
          \tud@replace\tud@line@replace{!}{"!}%
          \tud@replace\tud@line@replace{:}{":}%
          \tud@replace\tud@line@replace{@}{"@}%
          \tud@replace\tud@line@replace{\"@}{"\@backslashchar"@}%
          \expandafter\tud@replace\expandafter\tud@line@replace%
            \expandafter{\actualchar}{@}%
          \expandafter\tud@replace\expandafter\tud@line@replace%
            \expandafter{\quotechar}{"}%
          \expandafter\tud@replace\expandafter\tud@line@replace%
            \expandafter{\levelchar}{!}%
          \tud@replace\tud@line@replace{" @}{}%
          \ifeof\tud@read@replace\else%
            \immediate\write\tud@write@replace{%
              \unexpanded\expandafter{\tud@line@replace}%
            }%
            \@tempswatrue%
          \fi%
        \repeat%
        \immediate\closein\tud@read@replace%
        \immediate\closeout\tud@write@replace%
        \ifnum\pdf@shellescape=\@ne\relax%
          \if@tempswa%
            \immediate\write18{%
              texindy\space%
                -o \jobname.#2\space%
                -M \@currname-#2.xdy\space%
                -t \jobname-#2.xlg\space%
              \jobname-xdy.#1%
            }%
          \else%
            \immediate\openout\tud@write@replace=\jobname.#2\relax%
            \immediate\closeout\tud@write@replace%
          \fi%
        \fi%
      }{}%
    }%
    \tud@reserved{idx}{ind}%
    \tud@reserved{glo}{gls}%
  \endgroup
\else
  \ifnum\pdf@shellescape=\@ne\relax%
    \immediate\write18{%
      makeindex -s gglo.ist -t \jobname.glg -o \jobname.gls \jobname.glo%
    }%
    \immediate\write18{%
      makeindex -s gind.ist -t \jobname.ilg -o \jobname.ind \jobname.idx%
    }%
  \fi%
\fi
\IndexPrologue{\addsec{\indexname}\tud@index@text}
\GlossaryPrologue{\addsec{\tud@changes@name}}
\DeclareNewTOC[%
  type=todo,%
  listname={\tud@todo@name},%
  name=ToDo,%
  tocentryindent=\z@,%
  owner=\@currname,%
]{tdo}
\setuptoc{tdo}{totoc}
\newcommand*\PrintToDos{\ifdefined\tudfinalflag\else\listoftodos\fi}
\patchcmd{\@docinclude}{%
  \let\@ltxdoc@PrintIndex\PrintIndex
  \let\PrintIndex\relax
  \let\@ltxdoc@PrintChanges\PrintChanges
  \let\PrintChanges\relax
}{%
  \let\@ltxdoc@PrintIndex\PrintIndex
  \let\PrintIndex\relax
  \let\@ltxdoc@PrintChanges\PrintChanges
  \let\PrintChanges\relax
  \let\@ltxdoc@PrintToDos\PrintToDos
  \let\PrintToDos\relax
}{}{\tud@patch@wrn{@docinclude}}
\patchcmd{\@docinclude}{%
  \let\PrintIndex\@ltxdoc@PrintIndex
  \let\PrintChanges\@ltxdoc@PrintChanges
}{%
  \let\PrintIndex\@ltxdoc@PrintIndex
  \let\PrintChanges\@ltxdoc@PrintChanges
  \let\PrintToDos\@ltxdoc@PrintToDos
}{}{\tud@patch@wrn{@docinclude}}
\newcommand*\ToDo[2][]{%
  \kernel@ifnextchar[{\@ToDo{#2}}{\@ToDo{#2}[]}%
}
\newcommand*\@ToDo{}
\def\@ToDo#1[#2]{%
  \ifdefined\tudfinalflag\else%
    \begingroup%
      \csuse{phantomsection}%
      \IfArgIsEmpty{#2}{%
        \def\tud@reserved{??}%
      }{%
        \def\tud@reserved{#2}%
      }%
      \endgraf%
      \hfuzz0.8pt%
      \leavevmode%
      \def\@tempa{\raggedleft\fbox{ToDo:\space\tud@reserved\strut}}%
      \ifdefined\marginnote%
        \expandafter\marginnote\expandafter{\@tempa}[%
          \dimexpr-\fboxsep-\fboxrule\relax%
        ]%
      \else%
        \expandafter\marginpar\expandafter{\@tempa}%
      \fi%
      \fbox{\parbox{\dimexpr\textwidth-2\fboxsep\relax}{#1\strut}}%
      \endgraf%
      \let\@tempa\@empty%
      \ifdefined\currentfile%
        \def\@tempa{\,--\,\texttt{\currentfile}}%
      \fi%
      \addxcontentsline{tdo}{todo}{\tud@reserved\@tempa:\space#1}%
    \endgroup%
  \fi%
}
\newcommand*\calculatearea{%
  \setlength\topmargin{-1in}%
  \setlength\headheight{0pt}%
  \setlength\headsep{3em}%
  \setlength\footskip{1.5\headsep}%
  \setlength\textheight{\dimexpr\paperheight-2.5\headsep-\footskip\relax}%
  \settowidth\MacroIndent{\rmfamily\scriptsize 0000\ }%
  \begingroup%
    \MacroFont\selectfont%
    \settowidth\@tempdima{\space}%
    \setlength\@tempdima{80\@tempdima}%
    \addtolength\@tempdima{\MacroIndent}%
    \edef\@tempa{%
      \endgroup%
      \noexpand\setlength\noexpand\textwidth{\the\@tempdima}%
    }%
  \@tempa%
  \setlength\columnsep{1em}%
  \setlength\marginparsep{1em}%
  \setlength\marginparwidth{%
    \dimexpr\paperwidth-\textwidth-2\marginparsep\relax%
  }%
  \setlength\oddsidemargin{\dimexpr\marginparwidth+\marginparsep-1in\relax}%
}
\AtEndPreamble{\calculatearea}
\AfterPackage{tudscrfonts}{%
  \RequirePackage{mweights}[2013/07/21]%
  \CheckCommand*\MacroFont{%
    \fontencoding\encodingdefault%
    \fontfamily\ttdefault%
    \fontseries\mddefault%
    \fontshape\updefault%
    \small%
  }%
  \renewcommand*\MacroFont{%
    \fontencoding\encodingdefault%
    \fontfamily\ttdefault%
    \fontseries\mdseries@tt%
    \fontshape\updefault%
    \small%
  }%
  \CheckCommand*\AltMacroFont{%
    \fontencoding\encodingdefault%
    \fontfamily\ttdefault%
    \fontseries\mddefault%
    \fontshape\sldefault%
    \small%
  }%
  \renewcommand*\AltMacroFont{%
    \fontencoding\encodingdefault%
    \fontfamily\ttdefault%
    \fontseries\mdseries@tt%
    \fontshape\sldefault%
    \small%
  }%
  \newcommand*\saved@calculatearea{}%
  \let\saved@calculatearea\calculatearea%
  \let\calculatearea\relax%
  \appto\tud@font@set{%
    \ifcase\tud@cdfont@num\relax\else% true/heavy
      \def\mdseries@tt{m}%
      \renewcommand*\@pnumwidth{1.7em}%
      \renewcommand*\@tocrmarg{2.7em}%
    \fi%
    \saved@calculatearea%
  }%
}
\newrobustcmd*\app[1]{\mbox{\textsl{\textbf{#1}}}}
\newrobustcmd*\cls[1]{\mbox{\textsf{\textbf{#1}}}}
\newrobustcmd*\pkg[1]{\mbox{\textsf{\textbf{#1}}}}
\newrobustcmd*\opt[1]{\mbox{\texttt{#1}}}
\newrobustcmd*\val[1]{\mbox{\texttt{#1}}}
\newrobustcmd*\pgs[1]{\mbox{\texttt{#1}}}
\newrobustcmd*\env[1]{\mbox{\texttt{#1}}}
\newrobustcmd*\prm[1]{\mbox{\texttt{#1}}}
\newrobustcmd*\cnt[1]{\mbox{\texttt{#1}}}
\newrobustcmd*\file[1]{\mbox{\texttt{#1}}}
\AfterPackage{hyperref}{%
  \pdfstringdefDisableCommands{%
    \let\app\@firstofone%
    \let\cls\@firstofone%
    \let\pkg\@firstofone%
    \let\opt\@firstofone%
    \let\val\@firstofone%
    \let\pgs\@firstofone%
    \let\env\@firstofone%
    \let\prm\@firstofone%
    \let\file\@firstofone%
  }%
}
\AtEndPreamble{%
  \@ifpackageloaded{babel}{}{%
    \ClassWarning{\TUD@Class@Name}{Package `babel' not loaded}%
    \providecommand*\selectlanguage[1]{}%
    \providecommand*\glqq{}%
    \providecommand*\grqq{}%
  }%
  \@ifpackageloaded{csquotes}{}{%
    \ClassWarning{\TUD@Class@Name}{Package `csquotes' not loaded}%
    \providecommand\enquote[1]{\emph{#1}}%
  }%
  \@ifpackageloaded{tudscrfonts}{}{%
    \RequirePackage{lmodern}[2009/10/30]%
    \providecommand*\ifdin[2]{#2}%
    \providecommand*\textuln[1]{\textsf{#1}}%
    \providecommand*\texturn[1]{\textuln{#1}}%
    \providecommand*\textubn[1]{\textbf{\textuln{#1}}}%
    \providecommand*\textuxn[1]{\textubn{#1}}%
    \providecommand*\textuls[1]{\textsl{\textuln{#1}}}%
    \providecommand*\texturs[1]{\textuls{#1}}%
    \providecommand*\textubs[1]{\textbf{\textuls{#1}}}%
    \providecommand*\textuxs[1]{\textubs{#1}}%
    \providecommand*\textdbn[1]{\textubn{#1}}%
  }%
}
%%% From File: tudscr-texindy.dtx
\catcode`\#=12
\newcommand*\@hashchar{#}
\catcode`\#=6
\begingroup
\ifdef{\tudxdyflag}{%
\newcommand*\tud@write@xdy{}
\newwrite\tud@write@xdy
\newif\if@tud@xdy@glo
\newcommand*\tud@xdy@create[2][theindex]{%
  \IfFileExists{\@currname-#2.xdy}{}{%
  \ifstr{#1}{theglossary}{\@tud@xdy@glotrue}{\@tud@xdy@glofalse}%
  \openout\tud@write@xdy=\@currname-#2.xdy\relax%
  \write\tud@write@xdy{(require "texindy.xdy")}%
  \write\tud@write@xdy{%
    (markup-index^^J%
    \space\space:open^^J%
    "\string\begin{#1}^^J%
    \space\space%
    \string\providecommand*\string\lettergroupDefault[1]{\@percentchar^^J%
    \@spaces\string\par%
    \string\centerline{\string\textbf{\string\textsf{Symbole}}}%
    \string\par\@percentchar^^J%
    \@spaces\string\nopagebreak\@percentchar^^J%
    \space\space}\@percentchar^^J%
    \space\space%
    \string\providecommand*\string\lettergroup[1]{\@percentchar^^J%
    \@spaces\string\par%
    \string\centerline{\string\textbf{\string\textsf{\@hashchar1}}}%
    \string\par\@percentchar^^J%
    \@spaces\string\nopagebreak\@percentchar^^J%
    \space\space}\@percentchar^^J%
    \space\space\string\makeatletter\@percentchar^^J%
    \space\space\string\scan@allowedfalse\@percentchar%
  }%
  \if@tud@xdy@glo%
  \write\tud@write@xdy{%
    \space\space\string\newcommand*\string\@lettergroup{}\@percentchar^^J%
    \space\space%
    \string\def\string\@lettergroup\@hashchar1\string\relax%
    {\string\lettergroup{\@hashchar1}}\@percentchar^^J%
    \space\space\string\tud@lst@def\@percentchar%
  }%
  \fi%
  \if@tud@xdy@glo%
  \write\tud@write@xdy{%
    "^^J%
    \space\space:close "\string~n\string~n\string\end{#1}\string~n"^^J%
    \space\space:hierdepth 4^^J%
    )%
  }%
  \else%
  \write\tud@write@xdy{%
    "^^J%
    \space\space:close "\string~n\string~n\string\end{#1}\string~n"^^J%
    \space\space:hierdepth 3^^J%
    )%
  }%
  \fi%
  \write\tud@write@xdy{%
    (define-location-class^^J%
    \space\space"arabic-page-numbers" ("arabic-numbers")%
    \space:min-range-length 1^^J%
    )^^J%
    (define-alphabet "AlphaExtended"^^J%
    \space(^^J%
    \space\space"A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M"^^J%
    \space\space"N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"^^J%
    \space\space"a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m"^^J%
    \space\space"n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"^^J%
    \space\space"?"^^J%
    \space)^^J%
    )^^J%
    (define-location-class^^J%
    \space\space"codeline" ("AlphaExtended" :sep "-" "arabic-numbers")%
    \space:min-range-length 2^^J%
    )^^J%
    (define-location-class-order ("arabic-page-numbers" "codeline"))^^J%
    (markup-range :sep "--")%
  }%
  \write\tud@write@xdy{%
    (merge-rule "\@backslashchar[(.*)\@backslashchar]" "" :eregexp)%
    ^^J%
    (merge-rule%
    \space"\string^(@+)([\string^@~n]*)"%
    \space"\string\2\string~e\string\1"%
    \space:eregexp :again%
    )^^J%
    (merge-rule%
    \space"(.*)(@@@@)([\string^@~n]*)"%
    \space"\string\1@@@\string\3\string~e"%
    \space:again :eregexp%
    )^^J%
    (merge-rule%
    \space"(.*)(@@@)([\string^@~n]*)"%
    \space"\string\1@@\string\3\string~e"%
    \space:again :eregexp%
    )^^J%
    (merge-rule%
    \space"(.*)(@@)([\string^@~n]*)"%
    \space"\string\1@\string\3\string~e"%
    \space:eregexp :again%
    )^^J%
    (merge-rule%
    \space"(.*?)(@)([\string^@~n]*)"%
    \space"\string\1\string~b\string\3"%
    \space:eregexp :again%
    )%
  }%
  \if@tud@xdy@glo%
  \write\tud@write@xdy{%
    (markup-letter-group%
    \space:open-head "\string~n\space\space\string\@gobble{"%
    \space:close-head "}"%
    )^^J%
    (markup-indexentry-list%
    \space:sep "\string~n\string~n\space\space\string\indexspace\string~n"%
    \space:depth 0%
    )^^J%
    (markup-indexentry\@spaces\space\space%
    :open "\string~n\space\space\string\@lettergroup\space"\space:depth 0%
    )^^J%
    (markup-indexentry-list :open "\string\relax" :depth 1)^^J%
    (markup-indexentry\@spaces\space\space%
    :open "\string~n\space\space\string\item\space" :depth 1%
    )^^J%
    (markup-indexentry-list :open "\string\efill" :depth 2)^^J%
    (markup-indexentry\@spaces\space\space%
    :open "\string~n\@spaces\string\subitem\space" :depth 2%
    )^^J%
    (markup-indexentry-list^^J%
    \space\space:open\space\space"\string\tud@lst@init"^^J%
    \space\space:close "\string~n \@spaces\space\string\tud@lst@process"^^J%
    \space\space:depth 3^^J%
    )^^J%
    (markup-indexentry^^J%
    \space\space:open%
    \space\space"\string~n\@spaces\space\space\string\tud@lst@add{"^^J%
    \space\space:close "}"^^J%
    \space\space:depth 3^^J%
    )^^J%
    (markup-indexentry-list^^J%
    \space\space:close "\string~n\@spaces\@spaces\string\tud@lst@@process{"^^J%
    \space\space:open\space\space"}\string\tud@lst@@init"^^J%
    \space\space:depth 4^^J%
    )^^J%
    (markup-indexentry^^J%
    \space\space:open%
    \space\space"\string~n\@spaces\@spaces\string\tud@lst@@add{"^^J%
    \space\space:close "}"^^J%
    \space\space:depth 4^^J%
    )%
  }%
  \else%
  \write\tud@write@xdy{%
    (markup-indexentry-list :open "\string\efil" :depth 1)%
  }%
  \fi%
  \write\tud@write@xdy{%
    (markup-locclass-list%
    \space:open "\string\pfill\space"%
    \space:close "\string\relax"%
    \space:sep ",\space"%
    )%
  }%
  \write\tud@write@xdy{%
    (markup-attribute-group-list :sep ", ")^^J%
    (define-attributes (("usage") ("main") ("default")))^^J%
    (markup-locref :attr "usage"%
    \space:open "\string\usage{"\space:close "}"%
    )^^J%
    (markup-locref :attr "main"%
    \space\space:open "\string\main{"\space\space:close "}"%
    )%
  }%
  \closeout\tud@write@xdy%
  }%
}
\tud@xdy@create{ind}
\tud@xdy@create[theglossary]{gls}
}{}
\endgroup
\endinput
%%
%% End of file `tudscrdoc.cls'.
