%% 
%% Copyright (C) 2007 by Robert Nyqvist.
%% 
%% Class for typesetting licentiate theses at Växjö University.
%% 
%% Any modified versions of this file must be renamed with new
%% filenames distinct from vxulicentiate.cls.  It is better to
%% use \renewcommand or similar control sequences, than change
%% the code in this file.
%% 
\NeedsTeXFormat{LaTeX2e}[2001/06/01]
\ProvidesClass{vxulicentiate}%
  [2007/05/17\space v2.0\space Class for Theses, Vaxjo University]
\DeclareOption{twocolumn}
  {\ClassError{vxulicentiate}{Option `twocolumn' is not supported}{}}
\DeclareOption{oneside}
  {\ClassError{vxulicentiate}{Option `oneside' is not supported}{}}
\DeclareOption{11pt}
  {\ClassError{vxulicentiate}{Option `11pt' is not supported}{}}
\DeclareOption{12pt}
  {\ClassError{vxulicentiate}{Option `12pt' is not supported}{}}
\DeclareOption{a4paper}
  {\ClassError{vxulicentiate}{Option `a4paper' is not supported}}
\DeclareOption{a5paper}
  {\ClassError{vxulicentiate}{Option `a5paper' is not supported}}
\DeclareOption{b5paper}
  {\ClassError{vxulicentiate}{Option `b5paper' is not supported}{}}
\DeclareOption{letterpaper}
  {\ClassError{vxulicentiate}{Option `letterpaper' is not supported}{}}
\DeclareOption{legalpaper}
  {\ClassError{vxulicentiate}{Option `legalpaper' is not supported}{}}
\DeclareOption{executivepaper}
  {\ClassError{vxulicentiate}{Option `executivepaper' is not supported}{}}
\DeclareOption{landscape}
  {\ClassError{vxulicentiate}{Option `landscape' is not supported}{}}
\DeclareOption{notitlepage}
  {\ClassError{vxulicentiate}{Option `notitlepage' is not supported}{}}
\DeclareOption{titlepage}
  {\ClassError{vxulicentiate}{Option `titlepage' is not supported}{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[10pt,onecolumn,openany,twoside]{book}
\RequirePackage{geometry}
\geometry{%
  papersize={169mm,239mm},
  textwidth=117mm,
  lines=43,
  inner=22mm,
  top=25mm,
  headheight=12pt,
  headsep=15pt,
  footskip=30pt
}
\RequirePackage{ifpdf}
\ifpdf
  \RequirePackage[pdftex]{graphicx,color}
  \pdfadjustspacing 1
  \AtBeginDocument{%
    \DeclareGraphicsExtensions{.mps,.pdf,.jpg,.png}%
    \DeclareGraphicsRule{*}{mps}{*}{}%
  }
\else
  \RequirePackage[dvips]{graphicx,color}
  \AtBeginDocument{%
    \DeclareGraphicsExtensions{.mps,.eps}%
    \DeclareGraphicsRule{*}{eps}{*}{}%
  }
\fi
\RequirePackage{fancyhdr}
\fancyfoot{}
\fancyhead{}
\fancyhead[RO]{\small\nouppercase\rightmark}
\fancyhead[LE]{\small\nouppercase\leftmark}
\fancyfoot[LE,RO]{\thepage}
\renewcommand{\headrulewidth}{\z@}
\pagestyle{fancy}
\definecolor{vxucolor}{cmyk}{1,0.6,0,0.56}
\newenvironment{pagecoords}{%
  \vtop\bgroup%
    \kern-\topskip
    \kern-\topmargin
    \kern-\headheight
    \kern-\headsep
    \kern-1in
    \hbox\bgroup%
      \ifodd\c@page
        \kern-\oddsidemargin
      \else
        \kern-\evensidemargin
      \fi
      \kern-1in
      \setlength{\unitlength}{1mm}%
      \begin{picture}(0,0)(0,239)
      }{%
      \end{picture}%
    \egroup
  \egroup
}
\newcommand*{\wexio}{V\"{a}xj\"{o}}
\newcommand*{\university}{University}
\newcommand*{\department}{School of Mathematics and System Engineering}
\newcommand*{\publication}{Reports from MSI}
\newcommand*{\thesistype}{Licentiate Thesis}
\newcommand*{\subtitle}[1]{\gdef\@subtitle{#1}}
\let\@subtitle\@empty
\newcommand*{\publyear}[1]{\gdef\@publyear{#1}}
\def\@publyear{????}
\newcommand*{\discipline}[1]{\gdef\@discipline{#1}}
\def\@discipline{????}
\newcommand{\information}{%
  A thesis for the Degree of Licentiate of Philosophy in \@discipline.%
}
\newcommand*{\address}{SE\kern.1em-\kern.1em 351\kern.15em95 \wexio, Sweden}
\newcommand*{\homepage}{http://www.vxu.se/msi/}
\newcommand{\ISSN}{1650-2647}
\newcommand{\ISRN}[2]{%
  \gdef\@subject{#1}%
  \gdef\@reportno{#2}%
}
\newcommand{\telephone}{+46\,(0)470\,70\,80\,00}
\newcommand{\fax}{+46\,(0)470\,840\,04}
\newcommand{\frontcover}{%
  \thispagestyle{empty}
  \begin{pagecoords}
    \setlength{\fboxrule}{\z@}
    \setlength{\fboxsep}{\z@}
    \put(0,0){\makebox(0,0)[lb]{\color{vxucolor}{\rule{20mm}{239mm}}}}
    \put(30,179){\makebox(0,0)[lb]{%
        \parbox[t]{119mm}{%
          \raggedright
          \fontsize{17.28}{20.74}\usefont{T1}{phv}{m}{n}\@author
        }%
      }%
    }
    \put(30,167){\makebox(0,0)[lt]{%
        \parbox[t]{119mm}{%
          \raggedright
          \fontsize{29.86}{37}\usefont{T1}{ppl}{m}{n}\@title
          \ifx\@empty\@subtitle\else
            \par\vspace{.75cm}
            \fontsize{24.88}{29.86}\usefont{T1}{ppl}{m}{n}%
            \@subtitle
          \fi
          \par\vspace{1.5cm}
          \fontsize{12}{14.4}\usefont{T1}{phv}{m}{n}%
          \thesistype
        }%
      }%
    }
    \put(94.5,229){%
      \makebox(0,0)[ct]{%
        \includegraphics[width=8mm]{vxusymbol.1}%
        \kern0.5em\raisebox{\depth}{%
          \fontsize{17.28}{20.74}\usefont{T1}{ppl}{m}{n}%
          \wexio\space\university
        }%
      }%
    }
    \put(94.5,15){%
      \makebox(0,0)[cb]{%
        \parbox{9cm}{%
          \centering\fontsize{8}{9.6}\selectfont%
          \textbf{\department}\\[-0.4\baselineskip]
          \rule{9cm}{0.3pt}\\
          \textbf{\publication}
        }%
      }%
    }
  \end{pagecoords}
  \newpage
  \thispagestyle{empty}
  \hbox{}\clearpage
}
\renewcommand{\maketitle}{%
  \thispagestyle{empty}
  \begin{center}
    \fontsize{14.4}{17.28}\selectfont\@author\par\vspace{.5cm}%
    \fontsize{20.74}{24.88}\selectfont\@title
    \ifx\@empty\@subtitle\else
      \par\vspace{0.25\baselineskip}%
      \fontsize{17.28}{20.74}\selectfont\@subtitle
    \fi
    \par\vspace{1.5cm}%
    \fontsize{12}{14.4}\selectfont\thesistype
    \par\vspace{\baselineskip}%
    \fontsize{12}{14.4}\selectfont\@discipline
    \par\vspace{2\baselineskip}%
    \fontsize{11}{12}\selectfont\oldstylenums{\@publyear}
    \vfill
    \includegraphics[width=9mm]{vxusymbol.1}%
    \kern0.5em\hbox{%
      \raisebox{\depth}{%
        \fontsize{17.28}{20.74}\usefont{T1}{ppl}{m}{n}%
        \wexio\space\university
      }%
    }%
  \end{center}
  \clearpage
}
\newcommand{\makecopyright}{%
  \thispagestyle{empty}
  \vspace*{\fill}%
  \noindent
  {
    \fontsize{9}{10.8}\selectfont
    \information
    \par\vspace{2\baselineskip}\noindent
    \textbf{\@title}%
    \ifx\@empty\@subtitle\else
      \\
      \textbf{\@subtitle}
    \fi
    \\
    \@author
    \par\vspace{2\baselineskip}\noindent
    \wexio\space\university\\
    \department\\
    \address\\
    \homepage
    \par\vspace{0.5\baselineskip}\noindent
    \publication, no \@reportno/\@publyear\\
    ISSN \ISSN\\
    ISRN VXU/MSI/\@subject/R/--\@reportno--SE
  }%
  \clearpage
}
\newcommand{\dedication}[1]{%
  \ifx\@dedication\empty\else
    \thispagestyle{empty}
    \vspace*{3cm}
    \begin{center}
      \fontsize{14.4}{17.28}\usefont{T1}{pzc}{m}{it}%
      #1
    \end{center}
    \clearpage
    \thispagestyle{empty}
    \mbox{}
    \clearpage
  \fi
}
\newcommand{\backcover}{%
  \clearpage
  \thispagestyle{empty}
  \mbox{}
  \clearpage
  \ifodd\c@page
    \thispagestyle{empty}
    \mbox{}
    \clearpage
  \fi
  \thispagestyle{empty}
  \begin{pagecoords}
    \setlength{\fboxrule}{\z@}
    \setlength{\fboxsep}{\z@}
    \put(169,0){%
      \makebox(0,0)[rb]{\color{vxucolor}{\rule{20mm}{239mm}}}%
    }
    \put(74.5,15){%
      \makebox(0,0)[cb]{%
        \parbox{9cm}{%
          \centering
          \includegraphics[width=8mm]{vxusymbol.1}\\
          {%
            \fontsize{17.28}{20.74}\usefont{T1}{ppl}{m}{n}%
            \wexio\\\university
          }\\[\baselineskip]
          \fontsize{8}{9.6}\selectfont%
          \textbf{\department}\\
          \address\\[\baselineskip]
          Telephone \telephone, fax \fax\\
          \homepage
        }%
      }%
    }
  \end{pagecoords}
}
\newenvironment{keywords}[1][Key-words]{%
  \par\vspace{.5\baselineskip}%
  \noindent\textbf{#1:}
}{}
\newenvironment{abstract}[1][Abstract]{%
  \clearpage
  \thispagestyle{plain}
  \addcontentsline{toc}{chapter}{#1}
  \begin{center}
    \Large\slshape\bfseries #1
  \end{center}
  \par%\vspace{.25\baselineskip}
  \noindent\ignorespaces
}{}
\setcounter{secnumdepth}{1}
\setcounter{tocdepth}{1}


\renewcommand{\part}{%
  \clearpage
  \thispagestyle{empty}%
  \@tempswafalse
  \null\vfil
  \secdef\@part\@spart
}
\def\@part[#1]#2{%
  \ifnum \c@secnumdepth >-2\relax
    \refstepcounter{part}%
    \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
  \else
    \addcontentsline{toc}{part}{#1}%
  \fi
  \markboth{}{}%
  {%
    \centering
    \interlinepenalty \@M
    \normalfont
    \ifnum \c@secnumdepth >-2\relax
      \LARGE\bfseries \partname~\thepart
      \par
      \vskip 20\p@
    \fi
    \Huge \bfseries #2\par
  }%
  \@endpart
}
\def\@spart#1{%
  {%
    \centering
    \interlinepenalty \@M
    \normalfont
    \Huge \bfseries #1\par
  }%
  \@endpart
}
\def\@makechapterhead#1{%
  \vspace*{15\p@}%
  {%
    \parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \Large\bfseries\slshape \@chapapp\space \thechapter
      \par\nobreak
      \vskip 10\p@
    \fi
    \interlinepenalty\@M
    \huge \bfseries\upshape #1\par\nobreak
    \vskip 30\p@
  }%
}
\def\@makeschapterhead#1{%
  \vspace*{15\p@}%
  {%
    \parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \huge\bfseries  #1\par\nobreak
    \vskip 30\p@
  }%
}
\renewcommand{\section}{%
  \@startsection{section}{1}{\z@}%
    {-3.5ex \@plus -1ex \@minus -.2ex}%
    {2.3ex \@plus.2ex}%
    {\normalfont\Large\bfseries\slshape}%
}
\renewcommand{\subsection}{%
  \@startsection{subsection}{2}{\z@}%
    {-2.5ex\@plus -1ex \@minus -.2ex}%
    {1ex \@plus .2ex}%
    {\normalfont\large\bfseries}%
}
\renewcommand{\subsubsection}{%
  \@startsection{subsubsection}{2}{\z@}%
    {-10pt plus 2pt minus 4pt}
    {-12pt plus 2pt minus 2pt}%
    {\normalsize\bfseries\slshape}%
}
\let\paragraph\relax
\let\subparagraph\relax
\setlength{\parindent}{.5cm}
\@addtoreset{figure}{chapter}
\@addtoreset{table}{chapter}
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand{\thetable}{\thechapter.\arabic{table}}
\endinput
%%
%% End of file `vxulicentiate.cls'.
