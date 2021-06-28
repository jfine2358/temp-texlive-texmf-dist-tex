%%
%% This is file `articleingud.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% articleingud.dtx  (with options: `cls')
%% 
%% -------------------------------------------------------------------
%%                           LICENSE
%% -------------------------------------------------------------------
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2012 by Omar Salazar Morales
%% osalazarm@correo.udistrital.edu.co
%% Laboratory for Automation and Computational Intelligence
%% Engineering Department
%% Universidad Distrital ``Francisco José de Caldas''
%% Bogotá, Colombia
%% http://www.udistrital.edu.co/
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.2 of this license or (at your option) any later
%% version. The latest version of this license is in:
%% http://www.latex-project.org/lppl.txt
%% and version 1.2 or later is part of all distributions of
%% LaTeX version 1999/12/01 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Omar Salazar Morales.
%% 
%% This work consists of the source files:
%%  - articleingud.dtx (documented LaTeX file)
%%  - articleingud.ins (installer)
%% 
%% -------------------------------------------------------------------
%%                           LICENCIA
%% -------------------------------------------------------------------
%% 
%% Este es un archivo generado.
%% 
%% Derechos de autor (C) 2012 por Omar Salazar Morales
%% osalazarm@correo.udistrital.edu.co
%% Laboratorio de Automática e Inteligencia Computacional
%% Facultad de Ingeniería
%% Universidad Distrital ``Francisco José de Caldas''
%% Bogotá, Colombia.
%% http://www.udistrital.edu.co/
%% 
%% Este archivo puede ser redistribuido y/o modificado
%% bajo las condiciones de la Licencia Pública del Proyecto LaTeX,
%% versión 1.2 o cualquier versión superior (a su opción).
%% La última versión de esta licencia se encuentra en
%% http://www.latex-project.org/lppl.txt
%% y la versión 1.2 o superior es parte de todas las distribuciones
%% de LaTeX versión 1999/12/01 o superior.
%% 
%% Este trabajo tiene el estado LPPL de `mantenido'.
%% 
%% El responsable del mantenimiento de este trabajo es Omar Salazar Morales.
%% 
%% Este trabajo consiste de los archivos fuente:
%%  - articleingud.dtx (archivo LaTeX documentado)
%%  - articleingud.ins (instalador)
%% 
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{articleingud}%
[2012/11/10 v0.2 Article for INGENIERIA UD]%
\newif\ifINGUD@peerreview\INGUD@peerreviewfalse
\newif\ifINGUD@ingudpapersize\INGUD@ingudpapersizefalse
\newif\ifINGUD@rightcolauthor\INGUD@rightcolauthorfalse
\newif\ifINGUD@endofbiography\INGUD@endofbiographytrue
\newcommand{\INGUD@internalmargin}{21mm}%
\newcommand{\INGUD@externalmargin}{18mm}%
\newcommand{\INGUD@topmargin}{18mm}%
\newcommand{\INGUD@bottommargin}{18mm}%
\newcommand{\INGUD@headmargin}{5mm}%
\newcommand{\INGUD@footmargin}{9mm}%
\newcommand{\INGUD@photosep}{5\p@}%
\newcommand{\INGUD@colauthorinfosep}{\columnsep}%
\newcommand{\INGUD@colauthorinfowidth}{0.3\textwidth}%
\newcommand{\INGUD@reviewname}{ingenier\'\i a}%
\newcommand{\INGUD@reviewvolume}{}%
\newcommand{\INGUD@reviewnumber}{}%
\newcommand{\INGUD@reviewissn}{0121-750x}%
\newcommand{\INGUD@udname}{universidad distrital
                           francisco jos\'e de caldas}%
\newcommand{\INGUD@separator}{\hskip 2.5\p@ \@plus1\p@ \@minus 1\p@
                              $\scriptstyle\bullet$%
                              \hskip 2.5\p@ \@plus 1\p@ \@minus 1\p@}%
\newcommand{\INGUD@reviewinfo}{%
\begingroup
  \normalfont\scriptsize\scshape
  {\bfseries\INGUD@reviewname}\INGUD@separator
  \ifINGUD@peerreview
    draft, paper for peer review \INGUD@separator
  \else
    vol.\kern 1\p@ \INGUD@reviewvolume \INGUD@separator
    no.\kern 1\p@  \INGUD@reviewnumber \INGUD@separator
    issn\kern 1\p@ \INGUD@reviewissn   \INGUD@separator
  \fi
  \INGUD@udname
\endgroup}%
\newcommand{\INGUD@authorinfo}{}%
\newcommand{\INGUD@paperinfo}{}%
\newcommand{\INGUD@secondtitle}{%
  \ClassError{articleingud}%
             {No \noexpand\title given}%
             {See documentation for details}}%
\newcommand{\INGUD@citeinfo}{%
  \ClassError{articleingud}%
             {No \noexpand\INGUDsetciteinfo given}%
             {See documentation for details}}%
\DeclareOption{ingudpaper}{%
  \global\INGUD@ingudpapersizetrue}%
\DeclareOption{titlepage}{%
  \OptionNotUsed
  \ClassError{articleingud}%
             {Unused option `\CurrentOption'}%
             {See documentation for details}}%
\DeclareOption{notitlepage}{%
  \OptionNotUsed
  \ClassError{articleingud}%
             {Unused option `\CurrentOption'}%
             {See documentation for details}}%
\DeclareOption{peerreview}{%
  \global\INGUD@peerreviewtrue}%
\DeclareOption{rightcolauthor}{%
  \global\INGUD@rightcolauthortrue}%
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}}%
\ProcessOptions\relax
\LoadClass{article}%
\ifINGUD@ingudpapersize
  \setlength{\paperheight}{240mm}%
  \setlength{\paperwidth}{170mm}%
  \AtBeginDvi{\special{papersize=170mm,240mm}}%
\fi
\setlength{\headheight}{24\p@}%
\setlength{\voffset}{\z@}%
\setlength{\headsep}{\INGUD@topmargin}%
\addtolength{\headsep}{-\INGUD@headmargin}%
\addtolength{\headsep}{-\headheight}%
\setlength{\textheight}{\paperheight}%
\addtolength{\textheight}{-\INGUD@topmargin}%
\addtolength{\textheight}{-\INGUD@bottommargin}%
\setlength{\footskip}{\INGUD@bottommargin}%
\addtolength{\footskip}{-\INGUD@footmargin}%
\setlength{\topmargin}{\INGUD@headmargin}%
\addtolength{\topmargin}{-1in}%
\addtolength{\topmargin}{-\voffset}%
\setlength{\hoffset}{\z@}%
\setlength{\oddsidemargin}{\INGUD@internalmargin}%
\addtolength{\oddsidemargin}{-1in}%
\addtolength{\oddsidemargin}{-\hoffset}%
\setlength{\evensidemargin}{\INGUD@externalmargin}%
\addtolength{\evensidemargin}{-1in}%
\addtolength{\evensidemargin}{-\hoffset}%
\setlength{\textwidth}{\paperwidth}%
\addtolength{\textwidth}{-\INGUD@internalmargin}%
\addtolength{\textwidth}{-\INGUD@externalmargin}%
\setlength{\columnsep}{5mm}%
\setlength{\columnseprule}{\z@}%
\setlength{\parskip}{\z@}%
\setlength{\parindent}{3mm}%
\newcommand{\INGUD@hangcarryover}{%
  \edef\INGUD@next{\hangafter=\the\hangafter
                   \hangindent=\the\hangindent}%
  \par\INGUD@next
  \edef\INGUD@next{\prevgraf=\the\prevgraf}%
  \indent\INGUD@next}%
\def\title{\@ifnextchar[\INGUD@titlei\INGUD@titleii}%
\def\INGUD@titlei[#1]#2#3{%
  \gdef\INGUD@paperinfo{{\normalfont\footnotesize #1}}%
  \gdef\@title{#2}%
  \gdef\INGUD@secondtitle{#3}}%
\def\INGUD@titleii#1#2{%
  \gdef\INGUD@paperinfo{{\normalfont\footnotesize #1}}%
  \gdef\@title{#1}%
  \gdef\INGUD@secondtitle{#2}}%
\def\author{\@ifnextchar[\INGUD@authori\INGUD@authorii}%
\def\INGUD@authori[#1]#2{%
  \ifINGUD@peerreview
    \global\let\INGUD@authorinfo\@empty
  \else
    \gdef\INGUD@authorinfo{\begingroup
                             \normalfont\footnotesize
                             \let\thanks\@gobble
                             \let\and\INGUD@separator
                             \let\\\space
                             #1\relax
                           \endgroup}%
  \fi
  \gdef\@author{#2}}%
\def\INGUD@authorii#1{%
  \ifINGUD@peerreview
    \global\let\INGUD@authorinfo\@empty
  \else
    \gdef\INGUD@authorinfo{\begingroup
                             \normalfont\footnotesize
                             \let\thanks\@gobble
                             \let\and\INGUD@separator
                             \let\\\space
                             #1\relax
                           \endgroup}%
  \fi
  \gdef\@author{#1}}%
\renewcommand{\and}{\\[5\p@]}%
\renewcommand{\thanks}[1]{\par #1}%
\def\@thanks{}%
\renewenvironment{titlepage}{}{}%
\newcommand{\INGUD@makeciteinfo}{%
\ifINGUD@peerreview\else
  \@tempdima\textwidth
  \advance\@tempdima by -\INGUD@colauthorinfosep
  \advance\@tempdima by -\INGUD@colauthorinfowidth
  \parbox[b][\headheight][b]{\@tempdima}%
    {\parskip\z@ \parindent\z@
     \normalfont\scriptsize
    \ifINGUD@rightcolauthor
      \raggedright
    \else
      \raggedleft
    \fi
    \INGUD@citeinfo}%
\fi}%
\newcommand{\INGUD@makeauthorinfo}{%
  \hb@xt@\z@{\vbox to\z@{\vskip\headsep
  \parbox[t][\textheight][t]{\INGUD@colauthorinfowidth}%
  {\parskip\z@ \parindent\z@
   \normalfont\scriptsize
   \ifINGUD@peerreview\else
     \ifINGUD@rightcolauthor
       \raggedright
     \else
       \raggedleft
     \fi
     \@author
   \fi
   \vfill
   \raggedright
   \@date}%
   \hrule \@width\z@ \@depth\z@ \@height\z@}}%
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \global\let\thanks\relax}%
\long\def\maketitle#1\endmaketitle{%
\begingroup
  \newpage
  \global\@topnum\z@
  \thispagestyle{titlepageingud}%
  \columnwidth\textwidth
  \advance\columnwidth by -\INGUD@colauthorinfosep
  \advance\columnwidth by -\INGUD@colauthorinfowidth
  \hsize\columnwidth
  \linewidth\columnwidth
  \@twocolumnfalse
  \col@number \@ne
  \noindent
  \@maketitle
  #1\endmaketitle
  \global\let\@title\@empty
  \global\let\INGUD@secondtitle\@empty
  \global\let\INGUD@citeinfo\@empty
  \global\let\maketitle\relax
  \global\let\endmaketitle\relax
  \global\let\INGUDsetciteinfo\relax
  \global\let\title\relax
  \global\let\INGUDsetvolume\relax
  \global\let\INGUDsetnumber\relax
  \global\let\INGUDsetinitialpage\relax
\endgroup}%
\def\endmaketitle{\clearpage}%
\long\def\@maketitle{%
\begingroup
\ifINGUD@rightcolauthor
  \raggedleft
\else
  \raggedright
\fi
  \normalfont \parskip\z@ \parindent\z@
  {\LARGE\bfseries\@title\par\nobreak}%
  \vskip 1em%
  {\Large\bfseries\slshape\INGUD@secondtitle\par\nobreak}%
\endgroup}%
\newcommand*{\INGUDsetvolume}[1]{\gdef\INGUD@reviewvolume{#1}}%
\newcommand*{\INGUDsetnumber}[1]{\gdef\INGUD@reviewnumber{#1}}%
\newcommand*{\INGUDsetinitialpage}[1]{\global\setcounter{page}{#1}}%
\newcommand*{\INGUDsetciteinfo}[1]{\gdef\INGUD@citeinfo{#1}}%
\renewenvironment{abstract}{%
  \removelastskip
  \section*{\abstractname}}{\par}%
\newcommand{\INGUDkeywordsname}{Key words}%
\newenvironment{INGUDkeywords}{%
  \removelastskip
  \vskip0.25\baselineskip
  \par\nobreak
  \noindent\textbf{\INGUDkeywordsname :}%
  \nobreakspace}{\par}%
\renewcommand{\thetable}{\@Roman\c@table}%
\setlength{\abovecaptionskip}{\z@}%
\setlength{\belowcaptionskip}{\z@}%
\renewcommand{\@makecaption}[2]{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{{\footnotesize\textbf{#1.} #2}}%
  \ifdim\wd\@tempboxa >\hsize
    {\footnotesize\textbf{#1.} #2 \par}%
  \else
    \global\@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}%
\def\@citex[#1]#2{%
  \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{], [}%
     \edef\@citeb{\expandafter\@firstofone\@citeb\@empty}%
     \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
     \@ifundefined{b@\@citeb}{\mbox{\reset@font\bfseries ?}%
       \G@refundefinedtrue
       \@latex@warning
         {Citation `\@citeb' on page \thepage \space undefined}}%
       {\hbox{\csname b@\@citeb\endcsname}}}}{#1}}%
\def\citepunct{], [}%
\def\citedash{]--[}%
\setlength{\floatsep}{\baselineskip}%
\setlength{\textfloatsep}{\baselineskip}%
\setlength{\intextsep}{\baselineskip}%
\setlength{\dblfloatsep}{\baselineskip}%
\setlength{\dbltextfloatsep}{\baselineskip}%
\setlength{\@fptop}{\z@}%
\setlength{\@fpsep}{\baselineskip}%
\setlength{\@fpbot}{\z@ \@plus 1fil}%
\setlength{\@dblfptop}{\z@}%
\setlength{\@dblfpsep}{\baselineskip}%
\setlength{\@dblfpbot}{\z@ \@plus 1fil}%
\if@twoside
  \def\ps@plainingud{%
      \def\@oddfoot{\INGUD@reviewinfo\hfil{\bfseries\thepage}}%
      \def\@evenfoot{{\bfseries\thepage}\hfil\INGUD@reviewinfo}%
      \def\@oddhead{\vbox{\hb@xt@\textwidth{\hfil\INGUD@authorinfo}%
                          \vskip2\p@
                          \hrule \@height0.4\p@
                                 \@width\textwidth
                                 \@depth\z@}}%
      \def\@evenhead{\vbox{\hb@xt@\textwidth{\INGUD@paperinfo\hfil}%
                           \vskip2\p@
                           \hrule \@height0.4\p@
                                  \@width\textwidth
                                  \@depth\z@}}%
      \let\@mkboth\markboth
    \def\sectionmark##1{}%
    \def\subsectionmark##1{}}%
\else
  \def\ps@plainingud{%
    \def\@oddfoot{\INGUD@reviewinfo\hfil{\bfseries\thepage}}%
    \def\@oddhead{\vbox{\hb@xt@\textwidth{\hfil\INGUD@authorinfo}%
                        \vskip2\p@
                        \hrule \@height0.4\p@
                               \@width\textwidth
                               \@depth\z@}}%
    \let\@mkboth\markboth
    \def\sectionmark##1{}}%
\fi
\if@twoside
  \def\ps@titlepageingud{%
  \ifINGUD@rightcolauthor\else
      \advance\oddsidemargin by \INGUD@colauthorinfosep
      \advance\oddsidemargin by \INGUD@colauthorinfowidth
      \advance\evensidemargin by \INGUD@colauthorinfosep
      \advance\evensidemargin by \INGUD@colauthorinfowidth
  \fi
  \ifINGUD@rightcolauthor
    \def\@oddfoot{\INGUD@reviewinfo\hfil{\bfseries\thepage}}%
    \def\@evenfoot{{\bfseries\thepage}\hfil\INGUD@reviewinfo}%
  \else
    \def\@oddfoot{\hskip-\INGUD@colauthorinfosep
                  \hskip-\INGUD@colauthorinfowidth
                  \hb@xt@\textwidth{\INGUD@reviewinfo
                                    \hfil
                                    {\bfseries\thepage}}}%
    \def\@evenfoot{\hskip-\INGUD@colauthorinfosep
                   \hskip-\INGUD@colauthorinfowidth
                   \hb@xt@\textwidth{{\bfseries\thepage}%
                                     \hfil
                                     \INGUD@reviewinfo}}%
  \fi
  \ifINGUD@rightcolauthor
      \def\@oddhead{\INGUD@makeciteinfo
                     \hfil
                     \hb@xt@\z@{\hskip-\INGUD@colauthorinfowidth
                                \INGUD@makeauthorinfo}}%
  \else
      \def\@oddhead{\hskip-\INGUD@colauthorinfosep
                    \hskip-\INGUD@colauthorinfowidth
                    \hb@xt@\textwidth{\INGUD@makeauthorinfo
                                      \hfil
                                      \INGUD@makeciteinfo}}%
  \fi
      \let\@evenhead\@oddhead
      \let\@mkboth\markboth
    \def\sectionmark##1{}%
    \def\subsectionmark##1{}}%
\else
  \def\ps@titlepageingud{%
  \ifINGUD@rightcolauthor
    \def\@oddfoot{\INGUD@reviewinfo\hfil{\bfseries\thepage}}%
    \def\@oddhead{\INGUD@makeciteinfo
                  \hfil
                  \hb@xt@\z@{\hskip-\INGUD@colauthorinfowidth
                              \INGUD@makeauthorinfo}}%
  \else
    \advance\oddsidemargin by \INGUD@colauthorinfosep
    \advance\oddsidemargin by \INGUD@colauthorinfowidth
    \def\@oddfoot{\hskip-\INGUD@colauthorinfosep
                  \hskip-\INGUD@colauthorinfowidth
                  \hb@xt@\textwidth{\INGUD@reviewinfo
                                    \hfil
                                    {\bfseries\thepage}}}%
    \def\@oddhead{\hskip-\INGUD@colauthorinfosep
                  \hskip-\INGUD@colauthorinfowidth
                  \hb@xt@\textwidth{\INGUD@makeauthorinfo
                                    \hfil
                                    \INGUD@makeciteinfo}}%
  \fi
    \let\@mkboth\markboth
    \def\sectionmark##1{}}%
\fi
\let\INGUD@thebibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
  \INGUD@thebibliography{#1}%
  \itemsep\z@
  \parsep\z@
  %\parskip\z@ %<-- Necesario si no se necesitan espacios entre entradas
  \footnotesize}%
\ifINGUD@peerreview
  \def\biography{%
    \let\do\@makeother
    \dospecials
    \INGUD@clearbiography}%
  \def\endbiography{}%
\begingroup
  \catcode`[=1   \catcode`]=2   \catcode`|=0
  \catcode`\{=12 \catcode`\}=12 \catcode`\\=12
  |long|gdef|INGUD@clearbiography#1\end{biography}[|end[biography]]%
|endgroup
\else
  \def\biography{%
    \removelastskip
    \addpenalty\@highpenalty
    \@ifnextchar[\INGUD@biographyphoto\INGUD@biographynophoto}%
  \def\endbiography{\par}%
  \def\INGUD@biographyphoto[#1]#2{%
    \INGUD@biographyauthorname{#2}%
    \par \nobreak \noindent
    \normalfont \footnotesize
    \global\INGUD@endofbiographyfalse
    \sbox\@tempboxa{#1}%
    \@tempdima\wd\@tempboxa
    \advance \@tempdima by \INGUD@photosep
    \@tempdimb\ht\@tempboxa
    \advance \@tempdimb by \dp\@tempboxa
    \advance \@tempdimb by \INGUD@photosep
    \divide \@tempdimb by \baselineskip
    \@tempcnta\@tempdimb
    \hangindent\@tempdima
    \hangafter-\@tempcnta
    \INGUD@checkendofbiography
    \def\INGUD@searchpar##1\par{##1\ifINGUD@endofbiography
                                     \par\null
                                   \else
                                     \INGUD@hangcarryover
                                     \csname INGUD@searchpar\endcsname
                                   \fi}%
    \INGUD@searchpar
    \hb@xt@\z@{\hss
               \vbox to\baselineskip{\box\@tempboxa
                                     \hrule \@width\z@
                                            \@height\z@
                                            \@depth\z@}%
               \hskip\INGUD@photosep}%
    \ignorespaces}%
  \newcommand{\INGUD@biographyauthorname}[1]{%
    \begingroup
    \parindent\z@ \parskip\z@
    \par \nobreak
    \sbox\@tempboxa{\normalfont\bfseries #1}%
    \ifdim\wd\@tempboxa >\hsize
      \vrule \@width\hsize
             \@height 0.4\p@
             \@depth\z@
    \else
      \vrule \@width\wd\@tempboxa
             \@height 0.4\p@
             \@depth\z@
    \fi
    \par\nobreak
    {\normalfont\bfseries #1}\par\nobreak
    \vskip 5\p@
  \endgroup}%
  \long\def\INGUD@checkendofbiography#1\end#2{%
    \def\INGUD@biographyname{biography}%
    \def\INGUD@secondargument{#2}%
    \ifx\INGUD@biographyname\INGUD@secondargument
      \global\let\INGUD@keepchecking\relax
      \long\gdef\INGUD@firstargument##1{%
        ##1\global\INGUD@endofbiographytrue\par}%
    \else
      \global\let\INGUD@keepchecking\INGUD@checkendofbiography
      \long\gdef\INGUD@firstargument##1{##1}%
    \fi
    \INGUD@firstargument{#1}%
    \global\let\INGUD@firstargument\@empty
    \end{#2}%
    \INGUD@keepchecking}%
  \def\INGUD@biographynophoto#1{%
    \INGUD@biographyauthorname{#1}%
    \par \nobreak \noindent
    \normalfont \footnotesize \ignorespaces}%
\fi
\renewcommand{\sfdefault}{phv}%
\renewcommand{\rmdefault}{ptm}%
\renewcommand{\ttdefault}{pcr}%
\pagestyle{plainingud}%
\endinput
%%
%% End of file `articleingud.cls'.
