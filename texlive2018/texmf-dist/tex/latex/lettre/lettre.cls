% file name   : `lettre.cls'.
% package name: lettre
% maintenance : Vincent Belaïche (vincentb1@users.sourceforge.net)
% author      : Denis Mégevand - Observatoire de Genève
% email       : vincentb1@users.sourceforge.net
% version     : v3.000
% date        : 2017/08/03
%
% This file is part of the "lettre" package.
% This work may be distributed and/or modified under the conditions of the
% LaTeX Project Public License, either version 1.3 of this license or (at your
% option) any later version.  The latest version of this license is in
% http://www.latex-project.org/lppl.txt and version 1.3 or later is part of all
% distributions of LaTeX version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Vincent Belaïche.
%
% This work consists of all files listed in file README
%
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{etoolbox}
\RequirePackage{graphicx}
\ProvidesClass{lettre}[2017/08/03 v3.000]\typeout{Copyleft Denis Megevand - Observatoire de Geneve}%
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\newlength\lettre@x@mm
\setlength\lettre@x@mm{1mm}%
\newlength\lettre@y@mm
\setlength\lettre@y@mm{1mm}
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}%
    \lettre@x@mm=1mm%
    \lettre@y@mm=1mm%
  }
\DeclareOption{letterpaper}
   {\setlength\paperheight {11.00in}%
    \setlength\paperwidth  {8.50in}%
    \lettre@y@mm=0.94074074074mm%
    \lettre@x@mm=1.0280952381mm%
  }
\DeclareOption{legalpaper}
   {\setlength\paperheight {14.00in}%
    \setlength\paperwidth  {8.50in}%
    \lettre@y@mm=1.19730639731mm%
    \lettre@x@mm=1.0280952381mm%
  }
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.50in}%
    \setlength\paperwidth  {7.25in}%
    \lettre@y@mm=0.897979797979mm%
    \lettre@x@mm=0.876904761905mm%
}
\DeclareOption{b5paper}
   {\setlength\paperheight {250.00mm}%
    \setlength\paperwidth  {176.00mm}%
    \lettre@y@mm=0.841750841751mm%
    \lettre@x@mm=0.838095238095mm%
}
\DeclareOption{a5paper}
   {\setlength\paperheight {210.00mm}%
    \setlength\paperwidth  {148.00mm}%
    \lettre@y@mm=0.707070707071mm%
    \lettre@x@mm=0.704761904762mm%
}
\fi
\if@compatibility
  \DeclareOption{twoside}{\ClassError{lettre}{No `twoside' layout for letters}%
     {LaTeX2e is running in compatibility mode, in this mode there is no `twoside'
     layout for letters}}
\else
  \DeclareOption{twoside}{\@twosidetrue}
\fi
\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{origdate}{\@origdatetrue\l@@info{Mode `origdate'}}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{keepenvs=true}{\lettre@keep@envstrue}%
\DeclareOption{keepenvs=false}{\lettre@keep@envsfalse}%
\DeclareOption{keepenvs}{\ExecuteOptions{keepenvs=true}}%
\def\lettre@iterate#1,{%
    {%
      \def\@tempa{#1}%
      \ifx\@tempa\@nnil
        \let\@tempa\@empty
      \else
        \def\@tempa{%
          \lettre@iterate@body{#1}%
          \lettre@iterate
        }%
      \fi
      \expandafter
    }\@tempa
}%
\newcommand*\lettre@supported@language@list{%
  francais,french,frenchb,romand,%
  allemand,german,germanb,ngerman,ngermanb,%
  americain,american,USenglish,%
  anglais,english,british,UKenglish%
}%
\newcommand*\lettre@iterate@body[1]{%
  \expandafter\def\csname lettre@#1@alias@of\endcsname{#1}}%
\expandafter\lettre@iterate\lettre@supported@language@list,\@nil,%
\def\@tempa#1#2{\expandafter\def\csname lettre@#1@alias@of\endcsname{#2}}%
\@tempa{frenchb}{french}
\@tempa{francais}{french}
\@tempa{allemand}{german}
\@tempa{germanb}{german}
\@tempa{ngermanb}{german}
\@tempa{ngerman}{german}
\@tempa{anglais}{english}
\@tempa{british}{english}
\@tempa{american}{USenglish}
\@tempa{americain}{USenglish}
\newcommand*\lettre@languages{}%
\newcommand*\lettre@mainlang{}%
\newcommand*\lettre@ldf@filename[1]{lettre-#1.ldf}%
\newcommand*\lettre@ldf@version[1]{ver@\lettre@ldf@filename{#1}}%
\def\lettre@iterate@body#1{%
  \DeclareOption{#1}{%
    \edef\@tempa{\csname lettre@#1@alias@of\endcsname}%
    \ifcsundef{\lettre@ldf@version{\@tempa}}{%
      \expandafter\def\csname \lettre@ldf@version{\@tempa}\endcsname{To be loaded}%
       \ifx\lettre@languages\@empty
          \def\lettre@languages{#1}%
       \else
          {%
            \toks0{#1}%
            \toks1\expandafter{\lettre@languages}%
            \edef\@tempa{\noexpand\def\noexpand\lettre@languages{\the\toks0,\the\toks1}}%
          \expandafter
          }\@tempa
       \fi
       \def\lettre@mainlang{#1}%
    }{%
      \l@@info{Langage `#1' deja charge par option}%
    }%
  }%
}%
\expandafter\lettre@iterate\lettre@supported@language@list,\@nil,%
\DeclareOption{passlang=true}{\lettre@pass@langtrue}%
\DeclareOption{passlang=false}{\lettre@pass@langfalse}%
\DeclareOption{passlang}{\ExecuteOptions{pass lang=true}}%
\DeclareOption{noinfo}{\c@infos=0}
\DeclareOption{loghighlight=false}{\lettre@loghighlightfalse}
\DeclareOption{loghighlight=true}{\lettre@loghighlighttrue}
\DeclareOption{loghighlight}{\ExecuteOptions{loghighlight=true}}
\DeclareOption{strict}{\ExecuteOptions{strict=true}}
\DeclareOption{strict=true}{\lettre@stricttrue\l@@info{Mode `strict': traite certains avertissements comme des erreurs}}
\DeclareOption{strict=false}{\lettre@strictfalse\l@@info{Mode `strict' desactive}}
\if@compatibility\else
  \DeclareOption*{\l@@warning{Option inconnue : `\CurrentOption', assurez-vous que
    c'est une option globale passee aux paquetages utilises dans votre document}}
\fi
\def\l@@error#1{\ClassError{lettre}{#1}}%
\def\infos{\c@infos=1\relax}
\def\noinfos{\c@infos=0\relax}
\def\l@@warning{%
  \iflettre@loghighlight
  \typeout{LETTRE AVERTISSEMENT ===============================================}%
  \fi
  \ClassWarning{lettre}%
}
\def\l@@warning@strictable#1{%
  \iflettre@loghighlight
  \typeout{LETTRE AVERTISSEMENT ===============================================}%
  \fi
  \iflettre@strict
     \l@@error{#1}{#1\MessageBreak\space 
     Cette erreur est causee par un avertissement en mode strict}%
  \else
     \ClassWarning{lettre}{#1}%
  \fi
}
\def\l@@info#1{%
  \ifnum\c@infos=1 %
    \iflettre@loghighlight
    \typeout{LETTRE INFO ================================================}%
    \fi
    \GenericWarning{%
      (lettre)\space\space\space\space
    }{%
      Class lettre Message: #1\@gobble}%
  \fi}%
\newcommand*{\LettreProvidesLanguage}[1]{%
  \ProvidesFile{lettre-#1.ldf}%
}%
\newcommand*{\LettreDeclareLanguage}[1]{%
  \begingroup
     \toks0{#1}%
     \@ifnextchar[\lettre@declare@language@arg@ii
     {%
       \toks2{}%
       \lettre@declare@language@arg@iii
     }%
}%
\ifcsdef{lettre@declare@language@arg@ii}{%
  \l@@error{Macro \protect\lettre@declare@language@arg@ii\space dej'a d'efinie}%
}{}%
\def\lettre@declare@language@arg@ii[#1]{%
   \def\@tempa##1{%
     \toks2{\gdef##1{#1}}
   }%
   \expandafter\@tempa\csname lettre@lmp@\the\toks0@use\endcsname
  \lettre@declare@language@arg@iii}
\newcommand*\lettre@declare@language@arg@iii[1]{%
  \toks3{#1}%
  \edef\@tempa{%
    \noexpand\ifcsdef{lettre@select@\the\toks0 @labels}{%
      \noexpand\l@@error{Macro `\string\lettre@select@\the\toks0 @labels\space d'ej`a d'efinie}%
    }{%
      \noexpand\gdef
      \expandafter\noexpand\csname lettre@select@\the\toks0@labels\endcsname{%
        \the\toks3}%
      \the\toks2 %
    }%
  }%
  \expandafter\endgroup\@tempa
}%
\newcommand\@ptsize{}
\newcount\c@infos\c@infos=1\relax
\newif\if@origdate\@origdatefalse
\newif\if@etiq\@etiqfalse
\newif\iflettre@pass@lang\lettre@pass@langtrue
\newif\iflettre@keep@envs\lettre@keep@envsfalse
\newif\iflettre@strict\lettre@strictfalse
\newif\iflettre@loghighlight\lettre@loghighlightfalse
\ExecuteOptions{10pt,oneside,final}
\ProcessOptions
\def\lettre@iterate@body#1{%
  \edef\@tempa{\csname lettre@#1@alias@of\endcsname}%
  \def\@tempb{To be loaded}%
  \edef\@tempc{\lettre@ldf@version{\@tempa}}%
  \expandafter\ifx\csname\@tempc\endcsname\@tempb
     \expandafter\let\csname\@tempc\endcsname\undefined
     \input{\lettre@ldf@filename{\@tempa}}
  \fi
}%
\expandafter\lettre@iterate\lettre@supported@language@list,\@nil,%
\newcommand\lettre@languageable@packages{babel,fmtcount,mlp}%
\ifx\lettre@languages\@empty\else
  \iflettre@pass@lang
    \def\lettre@iterate@body#1{%
      \let\@tempb\lettre@iterate@body
      \def\lettre@iterate@body##1{\PassOptionsToPackage{#1}{##1}%
        \l@@info{Option `#1' pass'ee au paquetage `##1'}%
      }%
      \expandafter\lettre@iterate\lettre@languageable@packages,\@nil,%
      \let\lettre@iterate@body\@tempb
    }%
    \expandafter\lettre@iterate\lettre@languages,\@nil,%
  \fi
\fi
\input{size1\@ptsize.clo}
\DeclareOldFontCommand{\rm}{\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sl}{\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\it}{\itshape}{\mathit}
\DeclareOldFontCommand{\sc}{\scshape}{\@nomath\sc}
\DeclareOldFontCommand{\bf}{\bfseries}{\mathbf}
\DeclareOldFontCommand{\sf}{\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\ttfamily}{\mathtt}
\DeclareRobustCommand*{\cal}{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand*{\mit}{\@fontswitch{\relax}{\mathnormal}}
\lineskip  1pt%
\normallineskip 1pt%
\parskip  .7em%
\parindent 0pt%
\topsep   .2em%
\partopsep 0pt%
\itemsep  .2em%
\renewcommand\baselinestretch{1}
\@lowpenalty   51\relax
\@medpenalty  151\relax
\@highpenalty 301\relax
\@beginparpenalty -\@lowpenalty 
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\topmargin        25\lettre@y@mm
\advance\topmargin by -1in
\headheight        0pt%
\headsep           4\lettre@y@mm
\textheight      250\lettre@y@mm
\footskip          9\lettre@y@mm
\footnotesep       5\lettre@y@mm
\marginparpush     1\lettre@x@mm
\oddsidemargin    25\lettre@x@mm
\evensidemargin   25\lettre@x@mm
\advance\oddsidemargin by -1in
\advance\evensidemargin by -1in
\textwidth       160\lettre@x@mm
\marginparsep      4\lettre@x@mm
\marginparwidth   15\lettre@x@mm
\skip\footins    4mm plus 2pt minus 4pt%
\newcount\auxcount
\newcount\c@labelstart
\newcount\c@lettre
\newcount\c@telefax
\newcount\emailcount
\newcount\faxpage
\newcount\sigflag
\newcount\signum
%
\newdimen\letterwidth
\newdimen\openingspace
\newdimen\openingindent
\newdimen\lettermargin
\newdimen\listmargin
\newdimen\sigspace
\newdimen\ssigindent
\newdimen\ssigwidth
\newdimen\msigwidth
\newdimen\fromaddress@let@width
\newdimen\fromlieu@let@width
\newdimen\toaddress@let@width
\newdimen\fromaddress@fax@width
\newdimen\faxstring@width
\newdimen\faxbox@width
\newdimen\toaddress@fax@width
\newdimen\fromname@fax@width
\newlength\lettre@vref@width
\newlength\lettre@nref@width
\newif\if@letter\@lettertrue
\newif\if@detail\@detailfalse 
\newwrite\@tensionaux
\newwrite\@dateaux
\newwrite\@etiqaux
\newwrite\@faxaux
\@ifundefined{lettre@t}{}{\ClassError{lettre}{Definition en double}%
  {Redefinition de la macro `lettre@t'}}
\def\lettre@t#1#2{\begin{list}{#1}{\setlength{\labelsep}{10pt}%
                            \setlength{\labelwidth}{\listmargin}%
                            \setlength{\leftmargin}{\listmargin}%
                            \setlength{\listparindent}{0pt}}%
           \item #2%
           \end{list}}
\def\detailledaddress{\@detailtrue}%
\def\stopletter{\vskip0ptplus1filll}%
\def\stopfax{\vskip0ptplus1filll}%
\def\resetopenenv{%
        \faxpage=0\relax
        \csuse{\lettre@mainlang}%
        \def\concdecl{}%
        \def\fromlocation{}%
        }%
\def\resetcloseenv{
        \def\fromsig{}\def\fromssig{}\def\fromtsig{}
        \ps@plain
        \pagenumbering{arabic}       
        \onecolumn                   
        \signum=0\relax
        }
\def\resetauxenv{
        \def\auxflag{}
        \auxcount=0\relax
        \let\toref\space\let\fromref\space
        \def\telexnum{}\def\ccpnum{}
        }
\def\resetemailenv{
        \def\emailflag{}
        \emailcount=0\relax
        \def\@username{}
        \def\ccittnum{}\def\internetnum{}\def\bitnetnum{}\def\telepacnum{}\def\decnetnum{}
        }
\long\def\@processto#1{\@xproc #1\\@@@\ifx\toaddress\@empty 
    \else \@yproc #1@@@\fi}%
\long\def\@xproc #1\\#2@@@{\def\toname{#1}\def\toaddress{#2}}%
\long\def\@yproc #1\\#2@@@{\def\toaddress{#2}}%
\def\stopbreaks{\interlinepenalty \@M
   \def\par{\@@par\nobreak}\let\\=\@nobreakcr
   \let\vspace\@nobreakvspace}%
\def\@nobreakvspace{\@ifstar{\@nobreakvspacex}{\@nobreakvspacex}}%
\def\@nobreakvspacex#1{\ifvmode\nobreak\vskip #1\relax\else
               \@bsphack\vadjust{\nobreak\vskip #1}\@esphack\fi}%
\def\@nobreakcr{\vadjust{\penalty\@M}\@ifstar{\@xnewline}{\@xnewline}}%
\def\startbreaks{\let\\=\@normalcr
   \interlinepenalty 200\relax\def\par{\@@par\penalty -100\relax}}%
\def\startlabels{%
\baselineskip=0pt\lineskip=0pt%
\pagestyle{empty}%
\let\@texttop=\relax
\topmargin=0pt\headsep=0pt%
\oddsidemargin=15mm\evensidemargin=15mm%
\textheight=297mm\textwidth=180mm\columnsep=30mm%
\@colht=\textheight\@colroom=\textheight\vsize=\textheight
\small
\baselineskip=0pt\lineskip=0pt%
\boxmaxdepth=0pt%
\twocolumn\relax}%
\def\@startlabels{%
\l@@info{Position de la premiere etiquette: \the\c@labelstart}%
\ifnum\c@labelstart>\z@
    \ifnum\c@labelstart>16\relax 
        \l@@warning@strictable{Position de la premiere etiquette ignoree}%
    \else
    \@whilenum\c@labelstart>\@ne\do
        {\immediate\write\@etiqaux{\string\mlabel{~\string\\~}}%
         \advance\c@labelstart\m@ne}%
    \fi%
\else
    \l@@warning@strictable{Position de la premiere etiquette ignoree}%
\fi
}%
\def\mlabel#1{\setbox0\vbox{\parbox[b]{70mm}{\rm\strut\ignorespaces #1}}%
         \vbox to 37mm{\vskip5mmplus1fil \box0 \vskip5mmplus1fil}}%
\def\makelabels{%
    \@etiqtrue
    \l@@info{On demande des etiquettes}%
    \@ifnextchar [{\i@makelabels}{\i@makelabels[1]}}%
\def\i@makelabels[#1]{\c@labelstart=#1}%
\newcommand*\lettre@institut[1]{%
  \l@@info{Fichier de defaut: #1}%
  \def\lettre@input@institut{\makeatletter
                 \input{#1}%
                 \makeatother}}%
\newcommand*\lettre@institut@parse[1]{%
  \filename@parse{#1}%
  \edef\filename@area{\filename@area lettre-\filename@base\unless\ifx\filename@ext\relax.\filename@ext\fi.cfg}%
}%
\iflettre@strict
\newcommand*\institut[1]{%
  \lettre@institut@parse{#1}%
  \expandafter\lettre@institut\expandafter{\filename@area}}%
\else
\newcommand*\institut[1]{%
  \lettre@institut@parse{#1}%
  \IfFileExists{\filename@area}{\expandafter\lettre@institut\expandafter{\filename@area}}{%
    \l@@warning{Le nommage des fichiers instituts en `<institut>.ins' est obsolete, veuillez les nommer en
      `lettre-<institut>.cfg'}%
    \lettre@institut{#1.ins}}%
}
\fi
\long\def\letter#1{%
  \rm
  \global\advance\c@lettre\@ne
  \l@@info{Lettre \the\c@lettre}%
  \ifcsundef{newletter\the\c@lettre}{%
     \expandafter\def\csname letter\the\c@lettre\endcsname{2}%
  }{%
     \expandafter\def\csname letter\the\c@lettre\endcsname{%
		\csname newletter\the\c@lettre\endcsname}%
  }%
  \ifodd\c@page%
  \else
    \if@twoside
      \l@@info{Saut de page force pour commencer la lettre sur une page impaire.}%
      \thispagestyle{empty}
      \hbox{}\penalty-10000\relax
    \fi
  \fi
  \c@page\@ne
  \c@footnote0 %
  \resetopenenv\resetcloseenv\resetauxenv\resetemailenv
  \@lettertrue
  \lettre@input@institut
  \let\opening=\letteropening
  \interlinepenalty=200\relax
  \@processto{#1}
}%
\def\endletter{\par
  \ifdim\pagetotal < 50pt
    \immediate\write\@tensionaux{%
          \string\expandafter\string\def%
          \string\csname\space newletter\the\c@lettre\string\endcsname{-2}}%
    \l@@warning{Longueur de la derniere page : \the\pagetotal < 50pt\MessageBreak
      tension de page modifiee a -2, veuillez recompiler}%
  \else
  \ifdim\pagetotal < 90pt
    \immediate\write\@tensionaux{%
          \string\expandafter\string\def%
          \string\csname\space newletter\the\c@lettre\string\endcsname{-4}}%
    \l@@warning{Longueur de la derniere page : \the\pagetotal < 90pt\MessageBreak
      tension de page modifiee a -4, veuillez recompiler}%
  \else
  \ifdim\pagetotal < 130pt
    \immediate\write\@tensionaux{%
          \string\expandafter\string\def%
          \string\csname\space newletter\the\c@lettre\string\endcsname{-5}}%
    \l@@warning{Longueur de la derniere page : \the\pagetotal < 130pt\MessageBreak
      tension de page modifiee a -5, veuillez recompiler}%
  \else
  \ifdim\pagetotal < 170pt
    \immediate\write\@tensionaux{%
          \string\expandafter\string\def%
          \string\csname\space newletter\the\c@lettre\string\endcsname{-6}}%
    \l@@warning{Longueur de la derniere page : \the\pagetotal < 170pt\MessageBreak
      tension de page modifiee a -6, veuillez recompiler}%
  \else
  \ifdim\pagetotal < 210pt
    \immediate\write\@tensionaux{%
          \string\expandafter\string\def%
          \string\csname\space newletter\the\c@lettre\string\endcsname{4}}%
    \l@@warning{Longueur de la derniere page : \the\pagetotal < 210pt\MessageBreak
      tension de page modifiee a 4, veuillez recompiler}%
  \else
  \ifdim\pagetotal < 250pt
    \immediate\write\@tensionaux{%
          \string\expandafter\string\def%
          \string\csname\space newletter\the\c@lettre\string\endcsname{6}}%
    \l@@warning{Longueur de la derniere page : \the\pagetotal < 250pt\MessageBreak
      tension de page modifiee a 6, veuillez recompiler}%
  \else
    \immediate\write\@tensionaux{%
          \string\expandafter\string\def%
          \string\csname\space newletter\the\c@lettre\string\endcsname{%
          \csname letter\the\c@lettre\endcsname}}%
    \l@@info{Longueur de la derniere page : \the\pagetotal >= 250pt}%
  \fi
  \fi
  \fi
  \fi
  \fi
  \fi
  \stopletter
  \@@par\pagebreak\@@par
  \if@etiq 
    \ifodd\c@page%
    \else
      \if@twoside
  	\l@@info{Saut de page force pour commencer les etiquettes sur une page impaire.}%
  	\thispagestyle{empty}
  	\hbox{}\penalty-10000\relax
      \fi
    \fi
    \begingroup 
      \def\protect{\string}%
      \let\\=\relax
      \def\protect##1{\string##1\space}%
      \immediate\write\@etiqaux{\string\mlabel{\toname
           \\\toaddress}}%
    \endgroup 
  \fi}%
\long\def\telefax#1#2{%
  \rm
  \global\advance\c@telefax\@ne
  \l@@info{Telefax \the\c@telefax}%
  \ifnum\c@telefax=\@ne
  \else
    \l@@warning@strictable{Un seul telefax par fichier, s.v.p.,\MessageBreak
      sinon le nombre de pages du fax est incorrect !}
  \fi
  \ifodd\c@page%
  \else
    \if@twoside
      \l@@info{Saut de page force pour commencer le telefax sur une page impaire.}%
      \thispagestyle{empty}
      \hbox{}\penalty-10000\relax
    \fi
  \fi
  \c@page\@ne
  \resetopenenv\resetcloseenv\resetauxenv\resetemailenv
  \@letterfalse
  \lettre@input@institut
  \def\tofaxnum{#1}%
  \let\opening=\faxopening
  \interlinepenalty=200\relax
  \makeatletter
  \@input{\jobname.fax}%
  \l@@info{Lecture du fichier auxiliaire de fax: Nombre total de pages=\totalpages}%
  \makeatother
  \@processto{#2}
}%
\def\endtelefax{%
  \stopfax
  \begingroup 
    \advance\faxpage by\c@page
    \def\protect{\string}%
    \let\\=\relax
    \def\protect##1{\string##1\space}%
    \immediate\openout\@faxaux=\jobname.fax%
    \immediate\write\@faxaux{\string\def\string\totalpages{\the\faxpage}}%
    \if\totalpages\the\faxpage\else
      \l@@warning{Le nombre de pages du fax a change, \MessageBreak
      (ancien=\totalpages, nouveau=\the\faxpage) \MessageBreak
      veuillez recompiler pour le corriger dans l'entete}%
    \fi
  \endgroup
  \@@par\pagebreak\@@par
}%
\def\lettre@write@pdate@to@dateaux{%
  \l@@info{`\pdate' ecrit dans \jobname.odt}%
  {%
    \let\protect\string
    \immediate\write\@dateaux{%
      \string\expandafter\string\def%
      \string\csname\space origdate\the\c@lettre
      \string\endcsname{\pdate}}}}
\def\lettre@get@date{%
   \if@origdate
     \ifcsundef{origdate\the\c@lettre}{}{%
        \l@@info{Date originale lue dans \jobname.odt}%
        \def\pdate{\csname origdate\the\c@lettre\endcsname}%
     }%
     \lettre@write@pdate@to@dateaux
  \fi
}
\def\lettre@put@fromlieu@date{%
  \ifx\@empty\fromlieu
   \else
     \fromlieu
     \ifx\@empty\pdate\else, \fi
   \fi 
  \ifx\@empty\pdate\else\pdate\fi}
\def\letteropening#1{%
   \lettre@get@date
   \hbadness=10000\relax
   \thispagestyle{empty}% 
   \setlength{\unitlength}{1mm}%
   \advance\rightskip -75pt%
   \begin{picture}(\pict@let@width,\pict@let@height)%
                  (\pict@let@hoffset,\pict@let@voffset)%
     \put(\rule@hpos,\rule@vpos){\line(1,0){\rule@length}}%
     \put(\fromaddress@let@hpos,\fromaddress@let@vpos){\makebox(0,0)[tl]{%
          \parbox[t]{\fromaddress@let@width}{%
                  \fromaddress\\[3mm]%
                  \ifx\@empty\fromlocation
                  \else \fromlocation \\%
                  \fi 
                  \ifx\@empty\telephonenum
                  \else \tellabelname \telephonenum \\
                  \fi
                  \ifx\@empty\faxnum
                  \else \faxlabelname \faxnum \\
                  \fi
                  \ifx\@empty\emailnum
                  \else \mbox{\emaillabelname\ttfamily\emailnum} \\
                  \fi}}}
     \put(\fromlieu@let@hpos,\fromlieu@let@vpos){\makebox(0,0)[bl]{%
          \parbox[t]{\fromlieu@let@width}{%
            \lettre@put@fromlieu@date
              }}}%
     \put(\toaddress@let@hpos,\toaddress@let@vpos){\makebox(0,0)[tl]{%
          \parbox{\toaddress@let@width}{%
                 \toname\\\toaddress}}}%
   \end{picture}%
   \par\vskip\csname letter\the\c@lettre\endcsname mm
   \advance\leftskip\lettermargin
   \advance\rightskip75pt%
   \ifx\@empty\auxflag
     \vspace{2\openingspace}%
   \else 
     \vspace{\openingspace}\auxline\vspace{\openingspace}%
   \fi
   \vskip\csname letter\the\c@lettre\endcsname mm
   \ifx\@empty\concdecl 
     \vspace{\openingspace}%
   \else 
     \concline\vspace{\openingspace}%
   \fi
   \vskip\csname letter\the\c@lettre\endcsname mm
   \hbadness=1000\relax
   {\parindent=\openingindent
   #1}\par\startbreaks\nobreak
   \let\flushleft=\letterflushleft
   \let\raggedright=\letterraggedright
   \let\center=\lettercenter
   \let\centering=\lettercentering}%
\def\faxopening#1{%
   \hbadness=10000\relax
   \thispagestyle{empty}%
   \setlength{\unitlength}{1mm}%
   \advance\rightskip -75pt%
   \begin{picture}(\pict@fax@width,\pict@fax@height)
                   (\pict@fax@hoffset,\pict@fax@voffset)%
     \put(\fromaddress@fax@hpos,\fromaddress@fax@vpos){\makebox(0,0)[tl]{
          \parbox[t]{\fromaddress@fax@width}{\fromaddress}}}%
     \put(\faxstring@hpos,\faxstring@vpos){\makebox(0,0)[bl]{%
          \parbox[t]{\faxstring@width}{\telefaxstring}}}
   \end{picture}\par%
 \par\vspace{5mm}%
  \makebox[\faxbox@width]{\scriptsize\telephonelabelname\telephonenum
   \hfill\telefaxlabelname\faxnum
   \ifx\@empty\emailnum\else\hfill\emaillabelname{\ttfamily\emailnum}\fi
   \ifx\@empty\telexnum\else\hfill\telexlabelname\telexnum\fi}%
 \par
 \begin{tabular*}{\faxbox@width}[t]{l@{\hspace{5mm}}p{70mm}@{\hfill}r}%
    \hline
    \multicolumn{3}{@{}c@{}}{\vrule height 0pt depth 0pt width \faxbox@width}\\
    \headtoname
       &\parbox[t]{\toaddress@fax@width}{\toname\\\toaddress}%
       &\telefaxname\tofaxnum\\%
    \\%
    \headfromname
       &\parbox[t]{\fromname@fax@width}{\ifx\@empty\fromlocation
                                       \fromname
                                   \else
                                       \fromlocation
                                   \fi}%
       &\pagetotalname\totalpages\\%
 \end{tabular*}\par%
 \begin{tabular*}{\faxbox@width}[t]{@{\hfill}c@{\hfill}}%
    \hline
    \vrule height 3ex depth 7pt width 0pt\faxwarning\\%
    \hline
 \end{tabular*}\par%
 \begin{tabular*}{\faxbox@width}[t]{@{}r@{}}%
    \vrule height 0pt depth 0pt width \faxbox@width\\
    \multicolumn{1}{r}{%
       \lettre@get@date
       \lettre@put@fromlieu@date
           }\\%
 \end{tabular*}%
 \par
   \vspace{\openingspace}%
   \advance\leftskip  \lettermargin
   \advance\rightskip 75pt%
   \ifx\@empty\concdecl 
     \vspace{\openingspace}%
   \else 
     \concline\vspace{\openingspace}%
   \fi
   \hbadness=1000\relax
   {\parindent=\openingindent
   #1}\par\startbreaks\nobreak
   \let\flushleft=\letterflushleft
   \let\raggedright=\letterraggedright
   \let\center=\lettercenter
   \let\centering=\lettercentering}%
\long\def\closing#1{%
  \let\center=\normalcenter
  \let\centering=\normalcentering
  \let\flushleft=\normalflushleft
  \let\raggedright=\normalraggedright
  \par\stopbreaks
  \if@letter
    \vskip\csname letter\the\c@lettre\endcsname mm
  \fi
  \par\vspace{2\parskip}%
  \nobreak
  \noindent
  \l@@info{Signature \ifcase\signum manquante\or simple\or double\or triple\fi}%
  \ifnum\signum=0\space\ifx\fromname\undefined
    \l@@error{\protect\fromname\space non d'efini, vous avez sans
     doute omis de sp'ecifier \protect\name\space ou
     \protect\institut\space!}
  \fi\fi
  \ifcase\sigflag
    \ifcase\signum
       \parbox[t]{\letterwidth}{#1}%
       \par\vspace*{4\parskip}%
           \vspace*{\sigspace}%
       \hspace*{\ssigindent}%
       \noindent
       \parbox[t]{\ssigwidth}{\centering \ignorespaces\fromname}%
    \or
       \parbox[t]{\letterwidth}{#1}%
       \par\vspace*{4\parskip}%
           \vspace*{\sigspace}%
       \hspace*{\ssigindent}%
       \noindent
       \parbox[t]{\ssigwidth}{\centering \ignorespaces\fromsig}%
    \or
       \parbox[t]{\letterwidth}{#1}%
       \par\vspace*{4\parskip}%
           \vspace*{\sigspace}%
       \msigwidth=\letterwidth
       \divide\msigwidth by 2\relax
       \advance\msigwidth -3pt%
       \noindent
       \mbox{\parbox[t]{\msigwidth}{\centering\ignorespaces\fromsig}%
             \parbox[t]{\msigwidth}{\centering\ignorespaces\fromssig}}%
    \or
       \parbox[t]{\letterwidth}{#1}%
       \par\vspace*{4\parskip}%
           \vspace*{\sigspace}%
       \msigwidth=\letterwidth
       \divide\msigwidth by 3\relax
       \advance\msigwidth -3pt%
       \noindent
       \mbox{\parbox[t]{\msigwidth}{\centering\ignorespaces\fromsig}%
             \parbox[t]{\msigwidth}{\centering\ignorespaces\fromssig}%
             \parbox[t]{\msigwidth}{\centering\ignorespaces\fromtsig}}%
    \fi
  \or
    \ifcase\signum
        \hspace*{\ssigindent}%
        \parbox[t]{\ssigwidth}%
        {\centering \ignorespaces
        #1%
        \par\vspace*{4\parskip}%
            \vspace*{\sigspace}%
        \fromname}%
    \or
        \hspace*{\ssigindent}%
        \parbox[t]{\ssigwidth}%
        {\centering \ignorespaces
        #1%
        \par\vspace*{4\parskip}%
            \vspace*{\sigspace}%
        \fromsig}%
    \or
       \parbox[t]{\letterwidth}{#1}%
       \par\vspace*{4\parskip}%
           \vspace*{\sigspace}%
       \msigwidth=\letterwidth
       \divide\msigwidth by 2\relax
       \advance\msigwidth -3pt%
       \noindent
       \mbox{\parbox[t]{\msigwidth}{\centering\ignorespaces\fromsig}%
             \parbox[t]{\msigwidth}{\centering\ignorespaces\fromssig}}%
    \or
       \parbox[t]{\letterwidth}{#1}%
       \par\vspace*{4\parskip}%
           \vspace*{\sigspace}%
       \msigwidth=\letterwidth
       \divide\msigwidth by 3\relax
       \advance\msigwidth -3pt%
       \noindent
       \mbox{\parbox[t]{\msigwidth}{\centering\ignorespaces\fromsig}%
             \parbox[t]{\msigwidth}{\centering\ignorespaces\fromssig}%
             \parbox[t]{\msigwidth}{\centering\ignorespaces\fromtsig}}%
    \fi
  \fi
  \par\vfill\startbreaks
}%
\def\marge#1{%
 \lettermargin=#1%
 \listmargin=#1%
 \leftmargini=\listmargin%
   \advance\leftmargini   2.5em%
 \letterwidth=\textwidth
   \advance\letterwidth by -\lettermargin
   \advance\letterwidth by 0pt}%
\def\basdepage#1{%
  \def\bdp{#1}}%
\def\tension#1{%
  \if@letter
    \expandafter\def\csname letter\the\c@lettre\endcsname{#1}%
  \fi
}%
\def\addpages#1{%
  \l@@info{Pages additionnelles: #1}%
  \advance\faxpage by #1}%
\def\name#1{\def\fromname{#1}}%
\def\signature#1{%
  \ifnum\signum=0\relax
    \def\fromsig{#1}\signum=1\relax
  \else
    \l@@warning@strictable{Signature deja definie}%
  \fi
}%
\def\secondsignature#1{%
  \ifnum\signum=1\relax
    \def\fromssig{#1}\signum=2\relax
  \else
    \l@@warning@strictable{Seconde signature illegale ou deja definie}%
  \fi
}%
\def\thirdsignature#1{%
  \ifnum\signum=2\relax
    \def\fromtsig{#1}\signum=3\relax
  \else
    \l@@warning@strictable{Troisieme signature illegale ou deja definie}%
  \fi
}%
\def\vref{\l@@warning@strictable{La commande \protect\Vref\space devrait etre utilisee}\Vref}
\def\Vref#1{%
  \def\@tempa{#1}%
  \ifx\@empty\@tempa
     \let\toref\@empty
  \else
     \def\auxflag{.}%
     \def\toref{\parbox[t]{\lettre@vref@width}{#1}}%
  \fi
}%
\def\nref{\l@@warning@strictable{La commande \protect\Nref\space devrait etre utilisee}\Nref}
\def\Nref#1{%
  \def\@tempa{#1}%
  \ifx\@empty\@tempa
     \let\fromref\@empty
  \else
     \def\auxflag{.}%
     \def\fromref{\parbox[t]{\lettre@nref@width}{#1}}%
  \fi
}%
\def\concline{%
         \noindent\parbox[t]{\letterwidth}%
           {\@hangfrom{\textrm{\concname}}\ignorespaces\concdecl\strut}%
         \par}%
\def\auxline{%
  \l@@info{Ligne auxiliaire demandee}%
  {\scriptsize
    \ifx\@empty\toref\else
      \vrefname
      \ifx\space\toref
        \hspace{\lettre@vref@width}%
      \else 
        {\small\toref}
      \fi
      \hfill
   \fi
   \ifx\@empty\fromref\else
     \nrefname
     \ifx\space\fromref
       \hspace{\lettre@nref@width}%
     \else 
      {\small\fromref}
     \fi
     \hfill
   \fi
   \ifx\@empty \telexnum
      \hfill
   \else 
      T\'ELEX\ \telexnum
      \hspace{5mm}%
    \fi
    \ifx\@empty \ccpnum
      \hfill
    \else 
      C.C.P.\ \ccpnum\hspace{5mm}%
    \fi}\par}%
\def\emailine{%
  \l@@info{Ligne d'E-Mail demandee}%
  {\scriptsize
    \emaillabelname\hfill\ttfamily
    \ifx\@empty \ccittnum
    \else
     \hfill \ccittnum\hfill
    \fi
    \ifx\@empty \internetnum
    \else
     \hfill \internetnum\hfill
    \fi
    \ifx\@empty \bitnetnum
    \else
     \hfill \bitnetnum\hfill
    \fi
    \ifx\@empty \telepacnum
    \else 
     \hfill \telepacnum\hfill
    \fi
    \ifx\@empty \decnetnum
    \else 
     \hfill \decnetnum\hfill
    \fi
    \ifnum\emailcount<3\relax
     \hfill\mbox{}%
    \fi}}%
\long\def\address#1{\l@@info{Adresse precisee}\def\fromaddress{#1}}%
%\long\def\address*#1{\if@letter
%                        \l@@info{Adresse avec nom precisee}%
%                        \def\fromaddress{\fromname\\#1}
%                     \else
%                        \l@@warning@strictable{Commande illegale dans un fax}
%                     \fi}%
\def\nodate{\l@@info{Date supprimee}\def\pdate{}}%
\def\date#1{\l@@info{Date precisee}\def\pdate{#1}}%
\def\nolieu{\l@@info{Lieu supprime}\def\fromlieu{}}%
\def\lieu#1{\l@@info{Lieu precise}\def\fromlieu{#1}}%
\def\conc#1{\l@@info{Champ d'objet defini}\def\concdecl{#1}}%
\def\location#1{\l@@info{Precision d'adresse definie}\def\fromlocation{#1}}%
\def\notelephone{\l@@info{Numero de telephone supprime}\def\telephonenum{}}%
\def\telephone#1{\l@@info{Numero de telephone precise}\def\telephonenum{#1}}%
\def\nofax{\l@@info{Numero de fax supprime}\def\faxnum{}}%
\def\fax#1{\l@@info{Numero de fax precise}\def\faxnum{#1}}%
\def\email#1{\l@@info{Numero d'E-Mail precise}\def\emailnum{#1}}%
\def\username#1{\def\@username{#1}}%
\def\ccitt#1{\ifnum\emailcount<3\relax
                  \def\emailflag{.}%
                  \advance\emailcount by 1\relax
                   \def\ccittnum{\ifx\@empty \@username
                                           \l@@warning@strictable{<<username>> indefini}
                                           #1%
                                  \else
                                        S=\@username;#1%
                               \fi}%
                \else
                  \def\ccittnum{}%
                \fi}%
\def\internet#1{\ifnum\emailcount<3\relax
                  \def\emailflag{.}%
                  \advance\emailcount by 1\relax
                   \def\internetnum{\ifx\@empty \@username
                                           \l@@warning@strictable{<<username>> indefini}
                                           #1\relax
                                    \else
                                        \@username @#1\relax
                                 \fi}%
                \else
                  \def\internetnum{}%
                \fi}%
\def\bitnet#1{\ifnum\emailcount<3\relax
               \def\emailflag{.}%
               \advance\emailcount by 1\relax
               \def\bitnetnum{\ifx\@empty \@username
                                     \l@@warning@strictable{<<username>> indefini}
                                     #1\relax
                                   \else
                                  \@username\ at #1\relax
                                \fi}%
             \else
               \def\bitnetnum{}%
             \fi}%
\def\telepac#1{\ifnum\emailcount<3\relax
             \def\emailflag{.}%
             \advance\emailcount by 1\relax
              \def\telepacnum{\ifx\@empty \@username
                                 \l@@warning@strictable{<<username>> indefini}
                                 #1\relax
                              \else
                              #1::\@username
                           \fi}%
           \else
             \def\telepacnum{}%
           \fi}%
\def\decnet#1{\ifnum\emailcount<3\relax
             \def\emailflag{.}%
             \advance\emailcount by 1\relax
              \def\decnetnum{\ifx\@empty \@username
                                \l@@warning@strictable{<<username>> indefini}
                                #1\relax
                              \else
                             #1::\@username
                           \fi}%
           \else
             \def\decnetnum{}%
           \fi}%
\def\telex#1{\ifnum\auxcount<2\relax
               \def\auxflag{.}%
               \advance\auxcount by 1\relax
               \def\telexnum{#1}%
             \else
               \def\telexnum{}%
             \fi}%
\def\ccp#1{\ifnum\auxcount<2\relax
             \def\auxflag{.}%
             \advance\auxcount by 1\relax
             \def\ccpnum{#1}%
           \else
             \def\ccpnum{}%
           \fi}%
\def\ps#1#2{\penalty100\relax
  \if@letter
    \vskip\csname letter\the\c@lettre\endcsname mm
  \fi
  \l@@info{Post-scriptum defini}%
  \noindent\lettre@t{#1}{#2\\}\vfill\penalty-100\relax}%
\def\cc#1{\penalty100\relax
  \if@letter
    \vskip\csname letter\the\c@lettre\endcsname mm
  \fi
  \l@@info{Copies declarees}%
  \noindent\lettre@t{\ccname}{#1\\}\vfill\penalty-100\relax}%
\def\encl#1{\penalty100\relax
  \if@letter
    \vskip\csname letter\the\c@lettre\endcsname mm
  \fi
  \l@@info{Annexes declarees}%
  \noindent\lettre@t{\enclname}{#1\\}\vfill\penalty-100\relax}%
\def\mencl{\penalty100\relax
  \if@letter
    \vskip\csname letter\the\c@lettre\endcsname mm
  \fi
  \l@@info{Annexes mentionnees}%
  \noindent\lettre@t{\mentionname\\}{~}\vfill\penalty-100\relax}%
\newcommand*{\lettrelmpselectlanguage}[1]{%
  \lettreloadlang{#1}%
  {%
    \ifcsundef{lettre@#1@alias@of}{%
      \l@@warning@strictable{Langue #1 non ger'ee par lettre}%
      \let\@tempa\@empty
    }{%
      \toks0\expandafter\expandafter\expandafter{\csname lettre@#1@alias@of\endcsname}%
      \ifcsundef{lettre@lmp@\the\toks0@use}{%
        \toks1\toks0 %
      }{%
        \toks1\expandafter\expandafter\expandafter{\csname lettre@lmp@\the\toks0@use\endcsname}%
      }%
      \toks4\expandafter{%
        \expandafter\lettre@lmp@selectlanguage\expandafter{%
          \the\toks1}}%
      \iflettre@keep@envs
         \toks3{}%
         \toks5{}%
      \else
         \toks3{\lettre@restore@orig@envs}%
         \ifcsundef{lettre@set@\the\toks1@envs}{%
           \toks5{\lettre@store@orig@envs}%
         }{%
            \toks5\expandafter{\expandafter\lettre@store@orig@envs
              \csname lettre@set@\the\toks1 @envs\endcsname}%
         }%
      \fi
      \edef\@tempa{%
        \the\toks3 %
        \the\toks4 %
        \the\toks5}%
    }%
    \expandafter
  }\@tempa
}%
\def\FAXSTR{\fontfamily{cmdh}\fontseries{m}\fontshape{n}\selectfont}%
\newcommand*\lettre@lmp@selectlanguage[1]{%
  \l@@warning{ `\string\lettre@lmp@selectlanguage{#1}' appel'e, mais ne fait rien. Vous n'avez charg'e ni babel,
ni mlp, ni polyglossia, ni french}}
\newcommand*\lettrelabelselectlanguage[1]{%
  \lettreloadlang{#1}%
  {%
     \ifcsundef{lettre@#1@alias@of}{%
       \l@@warning@strictable{La langue <<#1>> n'est pas prise en charge par lettre}%
       \let\@tempa\@empty
     }{%
        \expandafter\let\expandafter\@tempa\csname lettre@#1@alias@of\endcsname
        \ifcsundef{lettre@select@\@tempa @labels}{%
          \l@@warning@strictable{Les d'efinitions de la langue <<\@tempa>> n'ont pas pu etre charg'ees}%
          \let\@tempa\@empty
        }{%
          \expandafter\def\expandafter\@tempa\expandafter{%
            \csname lettre@select@\@tempa @labels\endcsname
            \def\lettre@mainlang{#1}}%
        }%
     }%
     \expandafter
  }\@tempa
}%
\newcommand*\lettreloadlang[1]{%
  {%
     \newif\iflettre@lang@not@supported
     \ifcsundef{lettre@#1@alias@of}{%
       \lettre@lang@not@supportedtrue
       \l@@warning@strictable{La langue <<#1>> ne fait pas partie des langues prises en charge par lettre}%
       \def\@tempb##1{\toks0{\def##1{#1}}}%
       \expandafter\@tempb\csname lettre@#1@alias@of\endcsname
       \def\@tempa{#1}%
     }{%
       \lettre@lang@not@supportedfalse
       \toks0{}%
       \expandafter\let\expandafter\@tempa\csname lettre@#1@alias@of\endcsname
     }%
     \edef\@tempc{\lettre@ldf@filename{\@tempa}}%
     \IfFileExists{\@tempc}{%
       \iflettre@lang@not@supported
         \l@@info{Un fichier `\@tempc' ne faisant pas partie de lettre a 'et'e trouv'e, et va etre charg'e.}%
       \fi
       \ifcsundef{\lettre@ldf@version{\@tempa}}{%
         \edef\@tempa{%
           \noexpand\l@@info{Chargement du fichier de definition de langue `\@tempc'}%
           \noexpand\input{\@tempc}%
           \the\toks0
         }}{\edef\@tempa{\the\toks0}}%
     }{%
       \let\@tempa\@empty
     }
     \expandafter
  }\@tempa
}%
\newcommand*\lettreselectlanguage[1]{%
  \lettrelmpselectlanguage{#1}%
  \lettrelabelselectlanguage{#1}%
}%
\newcommand*\lettre@babel@selectlanguage[1]{%
  \ifcsdef{lettre@babel@#1}{\csname lettre@babel@#1\endcsname}{\selectlanguage{#1}}%
}%
\newcommand*\lettre@babel@german{%
  \ifcsdef{ver@ngerman.ldf}{\selectlanguage{ngerman}}{\selectlanguage{german}}%
}
\newcommand*\lettre@efrench@selectlanguage[1]{%
  \ifx\undefined\frenchname
    \l@@warning@strictable{L'un des paquetages mlp ou french n'a pas 'et'e charg'e correctement}%
  \else
    \def\@tempb{\l@@warning@strictable{La langue  `#1' n'est pas dans \string{french, german, english\string} qui sont les trois seules langues que lettre peut demander `a mlp}}%
    \def\@tempc{#1}%
    \def\lettre@iterate@body##1{%
      \def\@tempd{##1}%
      \ifx\@tempc\@tempd
         \let\@tempb\@empty
        \l@@info{Selection de la langue `#1' dans le paquetage french ou mlp d'efrench}%
        \csname lettre@efr@#1\endcsname
        \def\@tempc####1\@nil,{}%
        \expandafter\@tempc
      \fi
    }%
    \lettre@iterate french,english,german,\@nil,%
    \@tempb
  \fi
}%
\newcommand*\lettre@efr@german{%
  \ifx\undefined\ngermanTeXmods
    \ifx\undefined\germanTeXmods
      \l@@warning@strictable{Ni \protect\german\space ni \protect\ngerman\space ne sont d'efinis !}
    \else
      \german
     \fi
  \else
     \ngerman
  \fi
}
\newcommand*\lettre@efr@french{\ifcsdef{french}{%
    \def\lettre@efr@french{\ifFrench\else\french\fi}\lettre@efr@french
  }{\l@@warning@strictable{La commande \protect\french\space n'est pas
      d'efinie.}}}
\newcommand*\lettre@efr@english{\english}
\def\@tempa#1{%
  \expandafter\newcommand\expandafter*\csname #1\endcsname{%
    {%
      \def\@tempa{#1}%
      \ifx\lettre@mainlang\@tempa\else\l@@info{Langage modifie: #1}\fi
    }%
    \lettreselectlanguage{#1}%
  }%
}%
\@tempa{romand}%
\@tempa{francais}%
\@tempa{allemand}%
\@tempa{anglais}%
\@tempa{americain}%
\AtBeginDocument{%
  \makeatletter
  \@input{\jobname.tns}%
  \@input{\jobname.odt}%
  \begingroup\@floatplacement\@dblfloatplacement
  \immediate\openout\@tensionaux=\jobname.tns%
  \if@origdate
    \immediate\openout\@dateaux=\jobname.odt%
  \fi
  \endgroup
  \if@etiq
    \immediate\openout\@etiqaux=\jobname.etq%
    \immediate\write\@etiqaux{\string\startlabels}%
    \@startlabels
  \fi
  {%
    \toks0{}%
    \toks1{\def\lettre@lmp@selectlanguage#1{\selectlanguage{#1}}}%
    \toks2{\let\lettre@lmp@selectlanguage\lettre@efrench@selectlanguage}%
    \toks3{\let\lettre@lmp@selectlanguage\lettre@babel@selectlanguage}%
    \count0=0 %
  \def\lettre@iterate@body#1{\@tempb#1\@nil}%
  \def\@tempb#1:#2\@nil{%
    \@ifpackageloaded{#1}{%
      \l@@info{Le paquetage `#1' est charg'e}%
      \count0=#2 %
      \def\lettre@iterate##1\@nil,{}%
    }{%
      \l@@info{Le paquetage `#1' n'est pas charg'e}%
    }%
  }%
  \l@@info{Scrutation des paquetages de gestion de langue}%
  \lettre@iterate%
    babel:3,%
    polyglossia:1,%
    french:2,%
    mlp:2,%
    \@nil,%
  \expandafter
  }\the\toks\count0 %
  \makeatother
}%
\AtEndDocument{%
  \l@@info{Nombre de lettres :\the\c@lettre}%
  \l@@info{Nombre de telefax :\the\c@telefax}%
  \newpage\begingroup 
  \immediate\closeout\@tensionaux%
  \if@origdate
    \immediate\closeout\@dateaux%
  \fi
  \if@letter
    \if@etiq 
      \immediate\closeout\@etiqaux%
      \makeatletter
      \@input{\jobname.etq}%
      \makeatother
      \clearpage
    \fi
  \else
    \immediate\closeout\@faxaux%
  \fi
  \endgroup
}%
\def\@texttop{\ifnum\c@page=1\vskip 0pt plus .00001fil\relax\fi}%
\if@twoside
  \def\ps@headings{%
    \headheight 12pt%
    \headsep 25pt%
    \def\@oddhead{{\hspace{15mm}\ifx\@empty\fromlieu\else\fromlieu , \fi
                                  \pdate\hfill Page \thepage}}%
    \def\@oddfoot{}%
    \def\@evenhead{{Page \thepage\hfill\ifx\@empty\fromlieu\else\fromlieu , \fi
                                  \pdate\hspace{15mm}}}%
    \def\@evenfoot{}}%
\else
  \def\ps@headings{%
    \headheight 12pt%
    \headsep 25pt%
    \def\@oddhead{{\hspace{15mm}\ifx\@empty\fromlieu\else\fromlieu , \fi
                                  \pdate\hfill Page \thepage}}%
    \def\@oddfoot{}%
    \def\@evenhead{}%
    \def\@evenfoot{}}%
\fi
\def\ps@empty{%
   \headheight 0pt%
   \headsep 9pt%
   \def\@oddhead{}%
   \def\@oddfoot{%
       \ifnum\c@page=1\relax
          \ifx\@empty\emailflag
             \ifx\@empty\bdp
             \else
                \hbadness=10000\relax
                \rlap{\parbox{\textwidth}{\mbox{}\\\rule{\textwidth}{.4pt}\\\bdp}}
                ~\hfill~
                \hbadness=1000\relax
             \fi
          \else
             \hbadness=10000\relax
             \rlap{\parbox{\textwidth}{\mbox{}\\\rule{\textwidth}{.4pt}\\\emailine}}%
             ~\hfill~
             \hbadness=1000\relax
          \fi
       \fi}%
   \def\@evenhead{}%
   \def\@evenfoot{}}%
\def\ps@firstpage{%
   \headheight 12pt%
   \headsep 25pt%
   \def\@oddhead{}%
   \def\@oddfoot{}%
   \def\@evenhead{}%
   \def\@evenfoot{}}%
\def\ps@plain{%
   \headheight 0pt%
   \headsep 9pt%
   \def\@oddhead{}%
   \def\@oddfoot{\textrm{\hfill\thepage\hfill}}%
   \def\@evenhead{}%
   \def\@evenfoot{\textrm{\hfill\thepage\hfill}}}%
\def\normalcenter{\trivlist \normalcentering\item[]}%
\def\lettercenter{\trivlist \lettercentering\item[]}%
\def\normalcentering{\let\\=\@centercr\rightskip\@flushglue
                     \leftskip\@flushglue
                     \parindent\z@\parfillskip\z@}%
\def\lettercentering{\let\\=\@centercr\rightskip\@flushglue
                     \leftskip\@flushglue\advance\leftskip\lettermargin
                     \parindent\z@\parfillskip\z@}%
\let\endcenter=\endtrivlist
\def\normalflushleft{\trivlist \normalraggedright\item[]}%
\def\letterflushleft{\trivlist \letterraggedright\item[]}%
\def\normalraggedright{\let\\=\@centercr\leftskip\z@
                       \@rightskip\@flushglue\rightskip\@rightskip
                       \parindent\z@}%
\def\letterraggedright{\let\\=\@centercr\leftskip\lettermargin
                       \@rightskip\@flushglue\rightskip\@rightskip
                       \parindent\z@}%
\let\endflushleft=\endtrivlist
\newcommand*{\lettre@store@orig@envs}{%
\let\lettre@orig@itemize\itemize
\let\lettre@orig@enditemize\enditemize
}%
\AtBeginDocument{\lettre@store@orig@envs}%
\newcommand*{\lettre@restore@orig@envs}{%
\let\itemize\lettre@orig@itemize
\let\enditemize\lettre@orig@enditemize}%
\newcommand*{\reset@frenchitemize}{\l@@warning@strictable{\protect\reset@frenchitemize\space est obsolete, utilisez
    plutot \protect\lettre@set@french@envs}\lettre@set@french@envs}
\rightmargin   25mm%
   \advance\rightmargin   5pt%
\leftmarginii  2.2em%
\leftmarginiii 1.87em%
\leftmarginiv  1.7em%
\leftmarginv   1em%
\leftmarginvi  1em%
\leftmargin\leftmargini
\labelsep 5pt%
\parsep 0pt%
\def\@listi{\leftmargin\listmargin\labelwidth\leftmargin
   \advance\leftmargin 1.5em\advance\labelwidth-\labelsep}%
\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii\advance\labelwidth-\labelsep}%
\def\@listiii{\leftmargin\leftmarginiii
    \labelwidth\leftmarginiii\advance\labelwidth-\labelsep
    \topsep .1em% 
    \itemsep \topsep}%
\def\@listiv{\leftmargin\leftmarginiv
     \labelwidth\leftmarginiv\advance\labelwidth-\labelsep}%
\def\@listv{\leftmargin\leftmarginv
     \labelwidth\leftmarginv\advance\labelwidth-\labelsep}%
\def\@listvi{\leftmargin\leftmarginvi
     \labelwidth\leftmarginvi\advance\labelwidth-\labelsep}%
\def\labelitemi{$\bullet$}%
\def\labelitemii{\bfseries --}%
\def\labelitemiii{$\ast$}%
\def\labelitemiv{$\cdot$}%
\def\labelenumi{\arabic{enumi}.}%
\def\theenumi{\arabic{enumi}}%     
\def\labelenumii{(\alph{enumii})}%
\def\theenumii{\alph{enumii}}%
\def\p@enumii{\theenumi}%
\def\labelenumiii{\roman{enumiii}.}%
\def\theenumiii{\roman{enumiii}}%
\def\p@enumiii{\theenumi(\theenumii)}%
\def\labelenumiv{\Alph{enumiv}.}%
\def\theenumiv{\Alph{enumiv}}%
\def\p@enumiv{\p@enumiii\theenumiii}%
\def\verse{\let\\=\@centercr  
  \list{}{\itemsep\z@ \itemindent -15pt\listparindent \itemindent 
          \rightmargin\leftmargin\advance\leftmargin 15pt}\item[]}%
\let\endverse\endlist
\def\quotation{\list{}{\listparindent 1.5em%
    \itemindent\listparindent
    \rightmargin\leftmargin}\item[]}%
\let\endquotation=\endlist
\def\quote{\list{}{\rightmargin\leftmargin}\item[]}%
\let\endquote=\endlist
\def\descriptionlabel#1{\itshape #1}%
\def\description{\list{}{\leftmargin=2\listmargin
       \labelwidth\listmargin \advance\labelwidth -\labelsep 
       \let\makelabel\descriptionlabel}}%
\let\enddescription\endlist
\def\@begintheorem#1#2{\itshape \trivlist \item[\hskip \labelsep{\bfseries #1\ #2}]}%
\def\@endtheorem{\endtrivlist}%
\def\theequation{\arabic{equation}}%
\arraycolsep 5pt%
\tabcolsep 5pt%
\arrayrulewidth .4pt%
\doublerulesep 2pt%
\tabbingsep\labelsep
\skip\@mpfootins=\skip\footins
\fboxsep = 3pt
\fboxrule = .4pt
\newcommand*\today{\cejour}
\def\footnoterule{\kern-1\p@   
  \hrule width .4\columnwidth 
  \kern .6\p@}%
\long\def\@makefntext#1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}#1}%
\def\pict@let@width{185}%
\def\pict@let@height{65}%
\def\pict@let@hoffset{0}%
\def\pict@let@voffset{0}%
\def\rule@hpos{-25}%
\def\rule@vpos{-15}%
\def\rule@length{10}%
\def\fromaddress@let@hpos{-10}%
\def\fromaddress@let@vpos{70}%
\fromaddress@let@width=69mm
\def\fromlieu@let@hpos{90}%
\def\fromlieu@let@vpos{62}%
\fromlieu@let@width=69mm
\def\toaddress@let@hpos{90}%
\def\toaddress@let@vpos{40}%
\toaddress@let@width=80mm
\def\pict@fax@width{185}%
\def\pict@fax@height{30}%
\def\pict@fax@hoffset{0}%
\def\pict@fax@voffset{0}%
\def\fromaddress@fax@hpos{-10}%
\def\fromaddress@fax@vpos{30}%
\fromaddress@fax@width=69mm
\def\faxstring@hpos{90}%
\def\faxstring@vpos{20}%
\faxstring@width=69mm%
\faxbox@width=170mm%
\toaddress@fax@width=69mm%
\fromname@fax@width=69mm%
\lettre@vref@width=21mm%
\lettre@nref@width=21mm%
\def\lettre@input@institut{\makeatletter
         \input{lettre-default.cfg}%
         \makeatother}%
\smallskipamount=.5\parskip
\medskipamount=\parskip
\bigskipamount=2\parskip
\ps@plain
\pagenumbering{arabic}%
\raggedbottom
\onecolumn
\def\pdate{\cejour}%
\def\emailnum{}%
\def\fromlocation{}%
\signum=0\relax
\def\fromsig{}%
\def\fromssig{}%
\def\fromtsig{}%
\ifx\lettre@mainlang\@empty
   \def\lettre@mainlang{francais}%
   \lettreloadlang{french}%
\fi
{%
  \edef\@tempa{%
    \noexpand\AtBeginDocument{%
      \noexpand\lettreselectlanguage{\lettre@mainlang}%
      \noexpand\l@@info{Langage par defaut: \lettre@mainlang}}%
  }%
\expandafter}\@tempa
\def\concdecl{}%
\marge{15mm}%
\msigwidth=\letterwidth
\ssigindent=0.5\letterwidth
\ssigwidth=\letterwidth
  \advance\ssigwidth by -\ssigindent
  \advance\ssigwidth by -5pt
\sigspace=1.5cm
\openingspace=1cm
\openingindent=0pt
\@lettertrue        
\faxpage=0\relax
\def\totalpages{}%
\def\auxflag{}%
\auxcount=0\relax
\let\toref\space
\let\fromref\space
\def\telexnum{}%
\def\ccpnum{}%
\def\emailflag{}%
\emailcount=0\relax
\def\@username{}%
\def\ccittnum{}%
\def\internetnum{}%
\def\bitnetnum{}%
\def\telepacnum{}%
\def\decnetnum{}%
\def\bdp{}%
\endinput
% End of file `lettre.cls'.
