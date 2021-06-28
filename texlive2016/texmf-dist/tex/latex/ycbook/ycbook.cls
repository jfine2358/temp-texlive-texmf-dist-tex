  %% br-lex.cls
  %% Copyright (c) Youssef Cherem <ycherem(at)gmail.com>, 2016
  %
  % This work may be distributed and/or modified under the
  % conditions of the LaTeX Project Public License, either version 1.3c
  % of this license or (at your option) any later version.
  % The latest version of this license is in
  %   http://www.latex-project.org/lppl.txt
  % and version 1.3 or later is part of all distributions of LaTeX
  % version 2005/12/01 or later.
  %
  % This work has the LPPL maintenance status `maintained'.
  % 
  % The Current Maintainer of this work is Youssef Cherem.
  %
  % This work consists of the files ycbook.cls and ycbook-doc.tex, and the files compiled therefrom: 
  % ycbook.pdf and ycbook-doc.pdf



\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ycbook}[2016/04/06 ycbook class]
 
\LoadClassWithOptions{mwbk}	


%\SetSectionFormatting{section}
%{24pt plus5pt minus2pt}
%{\large\textbf{\ifHeadingNumbered
%		\HeadingNumber\enspace\fi %retirei o ponto
%		\HeadingText}}
%{10pt plus3pt}

%default section definitions, keep for future work
%\DeclareSectioningCommand{section}{1}
%{24\p@\@plus5\p@\@minus2\p@}
%{\FormatHangHeading{\large}}
%{10\p@\@plus3\p@}
%\DeclareSectioningCommand{subsection}{2}
%{16\p@\@plus4\p@\@minus1\p@}
%{\FormatHangHeading{}}
%{6\p@\@plus2\p@}
%\DeclareSectioningCommand{subsubsection}{3}
%{10\p@\@plus2\p@\@minus1\p@}
%{\FormatHangHeading{}}
%{4\p@\@plus1\p@}
%\DeclareSectioningCommand[runin]{paragraph}{4}
%{\bigskipamount}
%{\FormatRunInHeading{}}
%{.5em}

%original declaration and spaces

%\DeclareSectioningCommand[breakbefore,wholewidth]{chapter}{0}
%{56pt}
%{\FormatChapterHeading{12pt}{\large\@chapapp\space}{\LARGE}}
%{24pt}
%%%%%%


%%%% OPTIONS %%%%%


\DeclareOption{chapterrule}{\SetSectionFormatting[breakbefore,wholewidth]{chapter}
	{56pt plus8pt minus4pt}%espaço antes do capítulo
	{\Large\textbf{\ifHeadingNumbered
			\HeadingNumber.\enspace\fi % pode retirar o ponto daqui^: \HeadingNumber.\enspace\fi para não ficar com ponto depois do número da seção
			\HeadingText}\\\rule[12pt]{\hsize}{0.4pt}%\thispagestyle{plain}
		} %\hsize=horizontal size of the text...
	{24pt plus9pt}%espaço depois do capítulo
	}


\DeclareOption{sectionrule}{%
	\SetSectionFormatting{section}
	{24pt plus5pt minus2pt}
	{\large\textbf{\ifHeadingNumbered
			\HeadingNumber.\enspace\fi %deixei o ponto
			\HeadingText}\\\rule[10pt]{\hsize}{0.4pt}}
	{10pt plus3pt}
	}


%\FormatRigidChapterHeading{hwysi}{hodstępi}{hdekl numi}{hdekl tyti}


\DeclareOption{chaptercentered}{%
\SetSectionFormatting[breakbefore,wholewidth]{chapter}
{12pt}
{\FormatChapterHeading{0pt}%additional space between label and chapter title
	{\centering\LARGE \@chapapp \space}{\Huge\centering}}
{24pt plus6pt}

\renewcommand*\chapter@toc{%
	\ifHeadingNumbered\typeout{\@chapapp\space\thechapter.}%\fi
	\addcontentsline{toc}{chapter}{%
		%\ifHeadingNumbered
		\mw@seccntformat{\@chapapp\ \HeadingNumber}\HeadingTOCText%
		%\fi
	}\fi %added \fi here
	%\addtocontents{lof}{\protect\addvspace{10\p@}}%
	%\addtocontents{lot}{\protect\addvspace{10\p@}}%
}

}

\DeclareOption{chapterleft}{%
	\SetSectionFormatting[breakbefore,wholewidth]{chapter}
	{12pt}
	{\FormatChapterHeading{0pt}%
		{\LARGE \@chapapp \space}{\Huge}}
	{24pt plus6pt}

\renewcommand*\chapter@toc{%
	\ifHeadingNumbered\typeout{\@chapapp\space\thechapter.}%\fi
	\addcontentsline{toc}{chapter}{%
		%\ifHeadingNumbered
		\mw@seccntformat{\@chapapp\ \HeadingNumber}\HeadingTOCText%
		%\fi
	}\fi %added \fi here
	%\addtocontents{lof}{\protect\addvspace{10\p@}}%
	%\addtocontents{lot}{\protect\addvspace{10\p@}}%
}

}

\DeclareOption{chapterright}{%
	\SetSectionFormatting[breakbefore,wholewidth]{chapter}
	{12pt}
	{\FormatChapterHeading{0pt}%
		{\flushright\LARGE \@chapapp \space}{\flushright\Huge}}
	{24pt plus6pt}

\renewcommand*\chapter@toc{%
	\ifHeadingNumbered\typeout{\@chapapp\space\thechapter.}%\fi
	\addcontentsline{toc}{chapter}{%
		%\ifHeadingNumbered
		\mw@seccntformat{\@chapapp\ \HeadingNumber}\HeadingTOCText%
		%\fi
	}\fi %added \fi here
	%\addtocontents{lof}{\protect\addvspace{10\p@}}%
	%\addtocontents{lot}{\protect\addvspace{10\p@}}%
}

}

%%%%%%%%

\DeclareOption{nochaptercentered}{\SetSectionFormatting[breakbefore,wholewidth]{chapter}
	{12pt}
	{\centering\LARGE\textbf{\ifHeadingNumbered
			\HeadingNumber.\enspace\fi % tirei o ponto daqui^: \HeadingNumber.\enspace\fi para não ficar com ponto depois do número da seção
			\HeadingText}%\\\rule[12pt]{\hsize}{0.4pt}%\thispagestyle{plain}
	} %\hsize=horizontal size of the text...
	{24pt plus9pt}

\renewcommand*\chapter@toc{%
	\ifHeadingNumbered\typeout{\thechapter.}%\fi
	\addcontentsline{toc}{chapter}{%
		%\ifHeadingNumbered
		\mw@seccntformat{\HeadingNumber}\HeadingTOCText%
		%\fi
	}\fi %added \fi here
	%\addtocontents{lof}{\protect\addvspace{10\p@}}%
	%\addtocontents{lot}{\protect\addvspace{10\p@}}%
}
}

\DeclareOption{nochapterleft}{\SetSectionFormatting[breakbefore,wholewidth]{chapter}
	{12pt}
	{\LARGE\textbf{\ifHeadingNumbered
			\HeadingNumber.\enspace\fi % tirei o ponto daqui^: \HeadingNumber.\enspace\fi para não ficar com ponto depois do número da seção
			\HeadingText}%\\\rule[12pt]{\hsize}{0.4pt}%\thispagestyle{plain}
	} %\hsize=horizontal size of the text...
	{24pt plus9pt}

\renewcommand*\chapter@toc{%
	\ifHeadingNumbered\typeout{\thechapter.}%\fi
	\addcontentsline{toc}{chapter}{%
		%\ifHeadingNumbered
		\mw@seccntformat{\HeadingNumber}\HeadingTOCText%
		%\fi
	}\fi %added \fi here
	%\addtocontents{lof}{\protect\addvspace{10\p@}}%
	%\addtocontents{lot}{\protect\addvspace{10\p@}}%
}
}

\DeclareOption{nochapterright}{\SetSectionFormatting[breakbefore,wholewidth]{chapter}
		{12pt}
	{\flushright \LARGE\textbf{\ifHeadingNumbered
			\HeadingNumber.\enspace\fi % tirei o ponto daqui^: \HeadingNumber.\enspace\fi para não ficar com ponto depois do número da seção
			\HeadingText}%\\\rule[12pt]{\hsize}{0.4pt}%\thispagestyle{plain}
	} %\hsize=horizontal size of the text...
	{24pt plus9pt}

\renewcommand*\chapter@toc{%
	\ifHeadingNumbered\typeout{\thechapter.}%\fi
	\addcontentsline{toc}{chapter}{%
		%\ifHeadingNumbered
		\mw@seccntformat{\HeadingNumber}\HeadingTOCText%
		%\fi
	}\fi %added \fi here
	%\addtocontents{lof}{\protect\addvspace{10\p@}}%
	%\addtocontents{lot}{\protect\addvspace{10\p@}}%
}
}
%%%%%%%%%%


\DeclareOption{myheadings}{%
\def\ps@myheadings{%
	\let\ps@normal\hf@headings
	\let\ps@opening\hf@plain
	\let\ps@closing\hf@headings
	\let\ps@blank\hf@empty
	\ps@normal
	\let\@mkboth\@gobbletwo
	\let\chaptermark\@gobble
	\let\sectionmark\@gobble
}
\pagestyle{myheadings}
}

\DeclareOption{myheadings=beforeplain}{%
	\def\ps@myheadings{%
		\let\ps@normal\hf@headings
		\let\ps@opening\hf@plain
		\let\ps@closing\hf@plain
		\let\ps@blank\hf@plain
		\ps@normal
		\let\@mkboth\@gobbletwo
		\let\chaptermark\@gobble
		\let\sectionmark\@gobble
	}
	\pagestyle{myheadings}
}


%The macro \@chapapp is initially defined to expand to \chaptername, but \appendix redefines it to be \appendixname.


%%for headings:%%%%
\DeclareOption{headings}{%

\renewcommand\ps@headings{%
	\let\@mkboth\@gobbletwo
	\let\ps@normal\hf@headings
	\let\ps@opening\hf@plain
	\let\ps@closing\hf@headings %% <-- this was @empty, now @headings!!! use this for page numbers and headings to appear on even pages before new chapter
	\let\ps@blank\hf@empty
	\ps@normal}

\pagestyle{headings}
}

\DeclareOption{headings=beforeplain}{%
	
	\renewcommand\ps@headings{%
		\let\@mkboth\@gobbletwo
		\let\ps@normal\hf@headings
		\let\ps@opening\hf@plain
		\let\ps@closing\hf@headings %% <-- this was @empty, now @headings!!! use this for page numbers and headings to appear on even pages before new chapter
		\let\ps@blank\hf@plain
		\ps@normal}
	
	\pagestyle{headings}
}



\if@twoside
\def\ps@uheadings{%
	\let\@mkboth\markboth
	\let\ps@normal\hf@uheadings
	\let\ps@opening\hf@plain
	\let\ps@closing\hf@uheadings
	\let\ps@blank\hf@empty
	\ps@normal
	\def\chaptermark##1{%
		\markboth{%
			\ifHeadingNumbered
			\if@mainmatter
			\@chapapp\
			\thechapter.\enspace
			\fi
			\fi
			##1}{}}%
	\def\sectionmark##1{%
		\markright{%
			\ifHeadingNumbered \thesection.\enspace \fi
			##1}}}
\else
\def\ps@uheadings{%
	\let\@mkboth\markboth
	\let\ps@normal\hf@uheadings
	\let\ps@opening\hf@plain
	\let\ps@closing\hf@uheadings
	\let\ps@blank\hf@empty
	\ps@normal
	\def\chaptermark##1{%
		\markright{%
			\ifHeadingNumbered
			\if@mainmatter
			\@chapapp\
			\thechapter.\enspace
			\fi
			\fi
			##1}}}
\fi
\def\ps@myuheadings{%
	\let\ps@normal\hf@uheadings
	\let\ps@opening\hf@plain
	\let\ps@closing\hf@uheadings
	\let\ps@blank\hf@empty
	\ps@normal
	\let\@mkboth\@gobbletwo
	\let\chaptermark\@gobble
	\let\sectionmark\@gobble
}




\DeclareOption*{\PassOptionsToClass{\CurrentOption}{mwbk}}


\DeclareOption{sansserifnotes}{%marginpar to sans serif
	\let\oldmarginpar\marginpar
	\renewcommand{\marginpar}[1]{\oldmarginpar{\footnotesize \raggedright \sffamily#1}}
	
	%footnote to sans serif
	\let\oldfootnote\footnote
	\renewcommand{\footnote}[1]{\oldfootnote{\sffamily#1}}
	
	%footnotemark to sans serif
	\long\def\@makefnmark{%
		\hbox {\@textsuperscript {\sffamily\@thefnmark}}
		}
		}


%\PassOptionsToClass{withmarginpar}{mwbk}

\DeclareOption{toc}{%
%%% you can use this package. says there is an error, but it works nonetheless%%%
\AtEndOfClass{\RequirePackage[tocgraduated]{tocstyle}}%\AtEndOfClass -- important
%\usetocstyle{nopagecolumn}
\ClassWarning{ycbook}{'toc' option implemented by the 'tocstyle' package. You can use this package. says there is an error, but it works nonetheless.}
}

\ExecuteOptions{headings,chapterleft}

\ProcessOptions\relax



\RequirePackage{ifxetex}
\ifxetex
\RequirePackage{fontspec}
\RequirePackage{polyglossia}
%dot below in xetex
\renewcommand{\d}[1]
{\hmode@bgroup
	\o@lign{\relax#1\crcr\hidewidth\ltx@sh@ft{-1ex}.\hidewidth}\egroup}
\else
\RequirePackage[utf8]{inputenc}
\fi

\RequirePackage{hyperref}

\pdfstringdefDisableCommands{%
	\let\enspace\empty  % this causes the warning for \kern
	\let\noindent\empty % this causes the warning for \indent
}

%\RequirePackage{picinpar}

%\RequirePackage[justification=raggedright,font={sf},labelfont=bf]{caption}
\RequirePackage[space,extendedchars]{grffile} % para inserir figuras com espaços no nome
\RequirePackage{graphicx}

\RequirePackage{booktabs}





%\setlength{\marginparwidth}{1.3in}


% remove toc, list of figures and list of tables from table of contents
% NEED TO TAKE CHAPTER NAME FROM TOC IN nochapterleft etc. options%%%
%\renewcommand*\chapter@toc{%
%	\ifHeadingNumbered\typeout{\@chapapp\space\thechapter.}%\fi
%	\addcontentsline{toc}{chapter}{%
%		%\ifHeadingNumbered
%		\mw@seccntformat{\@chapapp\ \HeadingNumber}\HeadingTOCText%
%		%\fi
%	}\fi %added \fi here
%	%\addtocontents{lof}{\protect\addvspace{10\p@}}%
%	%\addtocontents{lot}{\protect\addvspace{10\p@}}%
%}

%to remove chaptername from toc with options nochapterX



%\RequirePackage[side,ragged,flushmargin]{footmisc} %marginal coloca os números da nota de rodapé para fora da margem, à la Bringhurst, flushmargin: fundamental para notas na margem.


%%% para notas sempre à direita.
%%%http://tex.stackexchange.com/questions/69595/marginnote-always-on-right-side-of-the-page
\RequirePackage{etoolbox}
\patchcmd{\@addmarginpar}{\ifodd\c@page}{\ifodd\c@page\@tempcnta\m@ne}{}{}
\reversemarginpar


\frenchspacing


	%%%% uso econômico de espaços%%%%
	
	\renewcommand\floatpagefraction{.99} % 9 before 
	\renewcommand\dblfloatpagefraction{.99} % for two column documents
	\renewcommand\topfraction{.99}
	\renewcommand\dbltopfraction{.99} % for two column documents
	\renewcommand\bottomfraction{.99}
	\renewcommand\textfraction{.01}  %1 before 
	\setcounter{totalnumber}{1} % 50 before
	\setcounter{topnumber}{1}
	\setcounter{bottomnumber}{1}

%\setcounter{totalnumber}{1}
%\setcounter{topnumber}{1}
%\setcounter{bottomnumber}{1}
%\renewcommand{\topfraction}{.99}
%\renewcommand{\bottomfraction}{.99}
%\renewcommand{\textfraction}{.01}


%%%%%% TWO PAGE PICTURE %%%%%%%%
%%%% from: http://tex.stackexchange.com/questions/23860/how-to-include-a-picture-over-two-pages-left-part-on-left-side-right-on-right
%%% Thanks to Martin Scharrer

\RequirePackage{adjustbox}
\RequirePackage{afterpage}
\RequirePackage{placeins}
\RequirePackage[strict]{changepage}


	\newcommand*{\twopagepicture}[4]{%
    \checkoddpage
    \ifoddpage
        \expandafter\@firstofone
    \else
        \expandafter\afterpage
    \fi
    {\afterpage{%
    \if #1t%
        \if #2p%
            \thispagestyle{empty}%
            \afterpage{\thispagestyle{empty}}%
        \fi
    \fi
    \begin{figure}[#1]
        \if #2p%
            \if #1t%
                \vspace*{-\dimexpr1in+\voffset+\topmargin+\headheight+\headsep\relax}%
            \fi
        \fi
        \if #1b%
            \caption{#4}%
        \fi
        \makebox[\textwidth][l]{%
        \if #2p\relax
            \let\mywidth\paperwidth
            \hskip-\dimexpr1in+\hoffset+\evensidemargin\relax
        \else
            \let\mywidth\linewidth
        \fi
        \adjustbox{trim=0 0 {.5\width} 0,clip}{\includegraphics[width=2\mywidth]{#3}}}%
        \if #1b\else
            \caption{#4}%
        \fi
        \if #2p%
            \if #1b%
                \vspace*{-\dimexpr\paperheight-\textheight-1in-\voffset-\topmargin-\headheight-\headsep\relax}%
            \fi
        \fi
    \end{figure}%
    \begin{figure}[#1]
        \if #2p%
            \if #1t%
                \vspace*{-\dimexpr1in+\voffset+\topmargin+\headheight+\headsep\relax}%
            \fi
        \fi
        \makebox[\textwidth][l]{%
        \if #2p%
            \let\mywidth\paperwidth
            \hskip-\dimexpr1in+\hoffset+\oddsidemargin\relax
        \else
            \let\mywidth\linewidth
        \fi
        \adjustbox{trim={.5\width} 0 0 0,clip}{\includegraphics[width=2\mywidth]{#3}}}%
        \if #2p%
            \if #1b%
                \vspace*{-\dimexpr\paperheight-\textheight-1in-\voffset-\topmargin-\headheight-\headsep\relax}%
            \fi
        \fi
    \end{figure}%
    }}%
}

%% for usage with \caption*{}%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand*{\twopagepicturen}[4]{%
    \checkoddpage
    \ifoddpage
        \expandafter\@firstofone
    \else
        \expandafter\afterpage
    \fi
    {\afterpage{%
    \if #1t%
        \if #2p%
            \thispagestyle{empty}%
            \afterpage{\thispagestyle{empty}}%
        \fi
    \fi
    \begin{figure}[#1]
        \if #2p%
            \if #1t%
                \vspace*{-\dimexpr1in+\voffset+\topmargin+\headheight+\headsep\relax}%
            \fi
        \fi
        \if #1b%
            \caption*{#4}%
        \fi
        \makebox[\textwidth][l]{%
        \if #2p\relax
            \let\mywidth\paperwidth
            \hskip-\dimexpr1in+\hoffset+\evensidemargin\relax
        \else
            \let\mywidth\linewidth
        \fi
        \adjustbox{trim=0 0 {.5\width} 0,clip}{\includegraphics[width=2\mywidth]{#3}}}%
        \if #1b\else
            \caption*{#4}%
        \fi
        \if #2p%
            \if #1b%
                \vspace*{-\dimexpr\paperheight-\textheight-1in-\voffset-\topmargin-\headheight-\headsep\relax}%
            \fi
        \fi
    \end{figure}%
    \begin{figure}[#1]
        \if #2p%
            \if #1t%
                \vspace*{-\dimexpr1in+\voffset+\topmargin+\headheight+\headsep\relax}%
            \fi
        \fi
        \makebox[\textwidth][l]{%
        \if #2p%
            \let\mywidth\paperwidth
            \hskip-\dimexpr1in+\hoffset+\oddsidemargin\relax
        \else
            \let\mywidth\linewidth
        \fi
        \adjustbox{trim={.5\width} 0 0 0,clip}{\includegraphics[width=2\mywidth]{#3}}}%
        \if #2p%
            \if #1b%
                \vspace*{-\dimexpr\paperheight-\textheight-1in-\voffset-\topmargin-\headheight-\headsep\relax}%
            \fi
        \fi
    \end{figure}%
    }}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\endinput