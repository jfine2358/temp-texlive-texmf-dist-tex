%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LaTeX classfile for EuroTeX 2001 proceedings
%
% Copyright 2001 NTG / MAPS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% provide for pdftex

\newif\ifpdf
\ifx \pdfoutput \undefined
  \pdffalse
\else
  \ifnum \pdfoutput=1
    \pdftrue
    \pdfhorigin=1in
    \pdfvorigin=1in
  \else
    \pdffalse
  \fi
\fi
\paperwidth=21cm
\paperheight=29.7cm
\ifpdf
  \pdfpagewidth=21cm
  \pdfpageheight=29.7cm
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% option processing and class loading

\let\pagetopbot\null
\def\paget@pb@t{%
  \smash{\rlap{%
    \rule[-3cm]{\paperwidth}{.4pt}}}%
  \smash{\rlap{%
    \rule[23.5cm]{\paperwidth}{.4pt}}}%
}
\DeclareOption{pagebounds}{\AtBeginDocument{\let\pagetopbot=\paget@pb@t}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[twoside,a4paper,10pt]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% general typography

\parindent=1em

% dropcaps
\newdimen\dropht
\newdimen\dropwd
\newcount\dropct
\newcount\dropctm
\long\def\initial#1#2{%
  \dropct=#1
  \dropctm=#1\advance\dropctm-1%
  \dropht=\dropctm\baselineskip
  \advance\dropht1ex
  \advance\dropht1pt
  \sbox\@tempboxa{\resizebox{!}{\dropht}{#2}}%
  \hangindent=\wd\@tempboxa
  \advance\hangindent2pt
  \hangafter=-\dropct
  \noindent
  \llap{\vbox{\null\vskip\dropct\baselineskip
    \box\@tempboxa\vskip-\dropct\baselineskip\null
  }}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% logos

\def\logo#1{\mbox{\textsc{#1}}}
\def\eurotex{\logo{eurotex}}
\let\Eurotex\eurotex
\let\EuroTex\eurotex
\let\EuroTeX\eurotex
\let\euroTeX\eurotex
\let\euroTex\eurotex
\def\LaTeX{\logo{latex}}
\def\LaTeXe{\logo{latex}2$\epsilon$}
\def\Context{\logo{context}}
\let\ConTeXt\Context
\let\conTeXt\Context
\let\context\Context

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% page layout

% copied/adapted from size10.clo
\newdimen\le@ding\le@ding=12pt
\topmargin=.5in
\headheight=\le@ding
\headsep=26pt
\topskip=10pt
\textheight=44\baselineskip
\advance\textheight\topskip
\textwidth=31pc
\oddsidemargin=.5\paperwidth
\advance\oddsidemargin-.5\textwidth
\advance\oddsidemargin-1in
\let\evensidemargin\oddsidemargin

\raggedbottom

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% page styles

% \pagetopbot defined at start of file
\def\ps@empty{%
  \let\@oddhead\@empty\let\@evenhead\@empty
  \def\@oddfoot{%
    \null\hskip-\oddsidemargin
    \null\hskip-1in
    \pagetopbot\hfil\null}%
  \def\@evenfoot{%
    \null\hskip-\evensidemargin
    \null\hskip-1in
    \pagetopbot\hfil\null}%
}
\let\ps@plain\ps@empty
\def\ps@headings{%
  \let\@mkboth\@gobbletwo
  \def\@oddhead{%
    \reset@font\hfil{\scshape\rightmark}\hfil\llap{\thepage}}%
  \def\@evenhead{%
    \reset@font\rlap{\thepage}\hfil{\scshape\leftmark}\hfil}%
  \def\@oddfoot{%
    \null\hskip-\oddsidemargin
    \null\hskip-1in
    \pagetopbot\hfil\null}%
  \def\@evenfoot{%
    \null\hskip-\evensidemargin
    \null\hskip-1in
    \pagetopbot\hfil\null}%
%  \let\@evenfoot\@empty\let\@oddfoot\@empty
}
\pagestyle{headings}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% maketitle

\renewcommand\date[1]{\relax}
\renewcommand\author[2][\@empty]{%
  \gdef\@author{#2}\xdef\r@nauthor{\lowercase{#1}}%
  \ifx\r@nauthor \@empty
    \xdef \r@nauthor{\lowercase{#2}}%
  \fi
}
\renewcommand\title[2][\@empty]{%
  \gdef\@title{#2}\xdef\r@ntitle{\lowercase{#1}}%
  \ifx\r@ntitle \@empty
    \xdef \r@ntitle{\lowercase{#2}}%
  \fi
}
\def\titleornament{%
  \fontfamily{cmr}\fontencoding{OMS}\itshape
  \char125\quad \char125\quad \char125%
}
%\def\titleornament{%
%   \fontfamily{pzd}\fontencoding{U}\small\selectfont F F F%
%}
\def\@maketitle{%
  \newpage
  \markboth{\lowercase{\r@nauthor}}{\lowercase{\@title}}%
  \null
  \reset@font
  \vskip\baselineskip
  \begin{center}
    \reset@font
    \vskip.7\baselineskip
    {\titleornament\par}
    \vskip1.3\baselineskip
    \let\footnote\thanks
    {\LARGE \itshape \@title \par}%
    \vskip.5\baselineskip
    {\scshape \@author}
  \end{center}
  \vskip2\baselineskip
}
\renewenvironment{abstract}{%
  \begin{center}
  \rightskip=1em plus 1fil
  \leftskip=\rightskip\small
  {\scshape abstract.}
}{\par\end{center}}
\newcommand\keywords[1]{{%
    \rightskip=\parindent\leftskip=\parindent\small
    \begin{center}
    {\scshape keywords:} #1
    \end{center}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sectioning

\setcounter{secnumdepth}{-10}

% parameters \@startsection:
% 1 name, 2 level, 3 indent, 4 beforeskip, 5 afterskip, 6 style
% beforeskip <0 -> no indent after
% afterskip <0 -> run-in head
\renewcommand{\section}{%
  \@startsection{section}{1}{\z@}%
  {-2.0\le@ding}{.5\le@ding}{\normalsize\sc\centering}%
}
\renewcommand{\subsection}{%
  \@startsection{subsection}{2}{\z@}%
  {-.8\le@ding}{1sp}{\large\itshape}%
}
\renewcommand{\subsubsection}{%
  \@startsection{subsubsection}{3}{\z@}%
  {-.4\le@ding}{-.5em}{\scshape}%
}
\def\appendixname{appendix}

\def\midornament{%
  \begin{center}
    \vskip.5\le@ding
    \rule{10pc}{.4pt}\\[-10pt]
    \rule{6pc}{.2pt}\par
    \vskip.5\le@ding
  \end{center}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% enumerate/itemize/description

\leftmargini=1.5em
\leftmarginii=1.25em
\leftmarginiii=1em
\def\enumerate{%
  \ifnum \@enumdepth >\thr@@\@toodeep\else
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
      \expandafter
      \list
        \csname label\@enumctr\endcsname
        {\usecounter\@enumctr\def\makelabel##1{\rlap{##1}}}%
  \fi}
\let\endenumerate =\endlist
\def\itemize{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\def\makelabel##1{\rlap{##1}}}%
  \fi}
\def\@listi{\leftmargin\leftmargini
  \labelwidth0pt\labelsep\leftmargin
            \parsep 0pt
            \topsep 3\p@
            \itemsep3\p@}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
  \labelwidth0pt\labelsep\leftmargin
              \topsep    3\p@
              \parsep    0\p@
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
  \labelwidth0pt\labelsep\leftmargin
              \topsep    2\p@
              \parsep    \z@
              \partopsep \p@
              \itemsep   \topsep}

%\renewcommand\labelitemi{%
%  {\fontfamily{pzd}\fontencoding{U}\selectfont\char226}%
%}
\renewcommand\labelitemi{%
  {\fontfamily{cmr}\fontencoding{OMS}\itshape\char5}%
}
\renewcommand\labelenumii{{\itshape\theenumii})}
\renewcommand*\descriptionlabel[1]{%
  \hspace\labelsep\normalfont\itshape #1%
}

\renewenvironment{quotation}
               {\list{}{\rightmargin   \leftmargin
	                \listparindent1.5em
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\renewenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% footnotes

\let\footnoterule\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tabulars

\arrayrulewidth.2pt

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% floats and captions

\renewenvironment{figure}
               {\@float{figure}\begin{center}\footnotesize}
               {\par\end{center}\end@float}
\renewenvironment{figure*}
               {\@dblfloat{figure}\begin{center}\footnotesize}
               {\par\end{center}\end@dblfloat}
\renewenvironment{table}
               {\@float{table}\begin{center}\footnotesize}
               {\par\end{center}\end@float}
\renewenvironment{table*}
               {\@dblfloat{table}\begin{center}\footnotesize}
               {\par\end{center}\end@dblfloat}
\def\mystrut{\rule[-.3\baselineskip]{0pt}{\baselineskip}}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip\footnotesize
  \sbox\@tempboxa{\mystrut\scshape #1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    \mystrut\scshape #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\renewcommand\figurename{figure}
\renewcommand\tablename{table}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% bibliography

\def\refname{references}
