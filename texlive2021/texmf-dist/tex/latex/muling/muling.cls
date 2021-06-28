%%
%% This is file `muling.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% muling.dtx  (with options: `class')
%% 
%% ---------------------------------------------------------------------------
%% Class:        muling
%% Author:       Niranjan
%% Description:  A class file for the Department of Linguistics, University of
%%               Mumbai
%% Repository:   https://gitlab.com/niranjanvikastambe/muling
%% Bug tracker:  https://gitlab.com/niranjanvikastambe/muling/-/issues
%% License:      The LaTeX Project Public License v1.3c or later.
%% ---------------------------------------------------------------------------
%% This work may be distributed and/or modified under the conditions of the
%% LaTeX Project Public License, either version 1.3c of this license or (at
%% your option) any later version.
%% 
%% The latest version of this license is in
%% 
%%     http://www.latex-project.org/lppl.txt.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Niranjan.
%% 
%% This work consists of the files muling.dtx
%%                                 muling.ins
%% and the derived file            muling.cls.
%% ---------------------------------------------------------------------------
%% 
\def\mulingClassName{muling}
\def\mulingClassVersion{0.1}
\def\mulingClassDate{2020/11/12}
\def\mulingClassDescription{A class file for the Department of Linguistics,
  University of Mumbai
}
\ProvidesClass{muling}[2020/11/12 v0.1
A class file for the Department of Linguistics,
University of Mumbai]
\DeclareOption{digital}{\PassOptionsToClass{oneside}{book}}
\newif\iflof
\DeclareOption{lof}{\loftrue}
\ProcessOptions
\iflof
\def\@printlof{%
  \thispagestyle{empty}%
  \phantomsection
  \addcontentsline{toc}{section}{List of figures}%
  \listoffigures
  \clearpage\pagebreak
}%
\else
\let\@printlof\@empty
\fi
\LoadClass{book}
\RequirePackage{hyperref}
\hypersetup{
  colorlinks,
  linkcolor=red!60!black,
  citecolor=green!60!black,
  urlcolor=blue!60!black
}
\RequirePackage[backend=biber,style=apa]{biblatex}
\RequirePackage[linguistics]{forest}
\RequirePackage{tipa}
\RequirePackage{leipzig}
\RequirePackage{expex}
\RequirePackage{ling-macros}
\makeatletter
\let\@supervisor\@empty
\def\supervisor#1{%
  \def\@supervisor{#1}%
}%
\let\@shorttitle\@empty
\def\shorttitle#1{%
  \def\@shorttitle{#1}%
}%
\let\@subtitle\@empty
\def\subtitle#1{%
  \def\@subtitle{#1}%
}%
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\cfoot{\thepage}
\rhead{}
\lhead{%
  \begin{tabular}{l}
    \@author\\%
    \textsc{%
    \footnotesize University of Mumbai%
    }%
  \end{tabular}%
  \hfill
  \@shorttitle
}%
\newlength{\shift}
\setlength{\shift}{0.3in}
\renewcommand{\maketitle}{%
  \thispagestyle{empty}%
  \addtolength{\oddsidemargin}{\shift}%
  \fboxsep3em
  \noindent\fbox{%
    \begin{minipage}
      [c][\dimexpr\textheight-2\fboxsep-2\fboxrule]
      [c]{\dimexpr\linewidth-2\fboxsep-2\fboxrule}
      \begin{center}
        \bigskip
        \hrule
        \vspace{2ex}
        \textbf{%
          {\LARGE \@title}\\%
          \vspace{0.2cm}%
          {\textsc\@subtitle}%
        }
        \vspace{2ex}
        \hrule
        \vfill
        {\large
          \textsc{%
            \@author%
          }%
        }\\%
        \vspace{0.5in}%
        {\large
          \textsc{%
            supervisor : \@supervisor%
          }%
        }\\%
        \vspace{0.5in}%
        {\large
          \textsc{%
            a dissertation submitted in\\ the partial fulfillment of the
            requirements for the masters of linguistics%
          }%
        }\\%
        \vspace{0.5in}%
        \textsc{%
          department of linguistics\\%
          university of mumbai, kalina%
        }\\%
        \smallskip
        \bigskip
        \textsc{\@date}%
      \end{center}
    \end{minipage}
    \makeatother
    \addtolength{\oddsidemargin}{-\shift}
  }
  \clearpage\pagebreak
  \thispagestyle{empty}
  \tableofcontents
  \clearpage\pagebreak
  \thispagestyle{empty}
  \phantomsection
  \addcontentsline{toc}{section}{Abbreviations}
  \printglossary
  \clearpage\pagebreak
  \thispagestyle{empty}
  \phantomsection
  \addcontentsline{toc}{section}{List of tables}
  \listoftables
  \clearpage\pagebreak
  \thispagestyle{empty}
  \phantomsection
  \begin{center}
    \texttt{%
      \LARGE
      \textsc{%
        declaration%
      }%
    }%
  \end{center}
  \bigskip
  \texttt{%
    As required by the University Regulation No: R. 1972 I wish to state that the
    work embodied in this thesis titled \@title{} : \@subtitle{} forms my own
    contribution to the research work carried out under the guidance of
    \@supervisor{} at the University of Mumbai.\\
    \indent This work has not been submitted for any other degree of this or any
    other university. Whenever references have been made to previous works of
    others, it has been clearly indicated as such and included in the
    bibliography.\\
    \bigskip
    \texttt{%
      \flushright{%
        Date : \@date\\
        \vspace{0.5in}
      }%
      Signature of the candidate :\\
      \hfill Name : \@author
    }\\%
    \bigskip
    \flushleft{%
      Certified by -\\
      \vspace{0.5in}
      Signature of the guide :\\
      Name : \@supervisor
    }%
  }%
}%
\endinput
%%
%% End of file `muling.cls'.
