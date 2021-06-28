  %% br-lex.cls
  %% Copyright (c) Youssef Cherem <ycherem(at)gmail.com>, 2017
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
  % This work consists of the files br-lex.cls, brlex-doc.tex, the example
  % leis-exemplo.tex and the files compiled therefrom: 
  % brlex-doc.pdf and leis-exemplo.pdf

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{br-lex}[2017/08/01]
\LoadClassWithOptions{mwbk}
\RequirePackage[normalem]{ulem}

\widowpenalty 1000
\clubpenalty  1000
\displaywidowpenalty 1000



\SetSectionFormatting{section}
{12pt}
{\centering\large\textbf{\ifHeadingNumbered
		Se\c{c}\~{a}o~
		\HeadingNumber\enspace\fi\\[8pt] %retirei o ponto
		\HeadingText}}
{6pt}

\renewcommand{\thesection}{\Roman{section}}

\renewcommand{\thechapter}{\Roman{chapter}}

%%%SECTION IN TOC%%%%
\renewcommand*\l@section[2]{\mw@tocline{1}{1.5em}{4em}{Seção~ #1}{#2}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\RequirePackage{hyperref}
%\RequirePackage[all]{nowidow}

\RequirePackage{ifxetex}
\ifxetex
\RequirePackage{fontspec}
\RequirePackage{polyglossia}
\setmainlanguage{brazil}
\else
\RequirePackage[utf8]{inputenc}
\RequirePackage[brazil]{babel}
\fi

\RequirePackage{textcase}

%%risca partes do texto
\newcommand{\cortado}[1]{\sout{#1}}

\newcommand{\titulo}[1]{
	\begin{center}
		\centering \bfseries \huge #1
	\end{center}
	\thispagestyle{plain}}

\newcommand{\descricao}[1]{\hfill%
	\begin{minipage}{0.5\textwidth}
		#1
	\end{minipage}
	\vspace{\baselineskip}
	}




% % % Para começar capítulos na mesma página:


% opção de começar capítulos na mesma página: capitulo

\DeclareOption{capitulo}{%
%\SetSectionFormatting[wholewidth]{chapter}
%{12pt}
%{\centering\Large\textbf{\ifHeadingNumbered
%		\@chapapp\enspace
%		\HeadingNumber\enspace\fi\\[8pt] %retirei o ponto
%		\HeadingText}}
%{6pt}



\SetSectionFormatting[wholewidth]{chapter}
{12pt}
{\FormatRigidChapterHeading{4\baselineskip}{0pt}%
	{\centering\large\MakeUppercase\@chapapp\space}{\Large\MakeUppercase}}
{\baselineskip}

}


%%%capítulos em maiúsculas 

\SetSectionFormatting[breakbefore,wholewidth]{chapter}
{12pt}
{\FormatRigidChapterHeading{4\baselineskip}{0pt}%
	{\centering\large\MakeUppercase\@chapapp\space}{\Large\MakeUppercase}}
{\baselineskip}



%%%%%



\DeclareOption{paragrafoespaco}{%
\setlength{\parskip}{8pt}%
\setlength{\parindent}{0pt}%
}

\DeclareOption{paragrafonormal}{%
	\setlength{\parskip}{0pt}%
}

\ExecuteOptions{paragrafoespaco}

\ProcessOptions\relax




%%%%%%%%%
%# a unidade básica de articulação será o artigo, indicado pela abreviatura "Art.", seguida de numeração ordinal até o nono e cardinal a partir deste;
%
%# os artigos desdobrar-se-ão em parágrafos ou em incisos; os parágrafos em incisos, os incisos em alíneas e as alíneas em itens;
%
%# os parágrafos serão representados pelo sinal gráfico "§", seguido de numeração ordinal até o nono e cardinal a partir deste, utilizando-se, quando existente apenas um, a expressão "parágrafo único" por extenso;
%
%# os incisos serão representados por algarismos romanos, as alíneas por letras minúsculas e os itens por algarismos arábicos;
%%%%%


\newcounter{artigo}
\newcommand{\artigo}{\refstepcounter{artigo} % 
	\par
	\ifnum\theartigo<10 %
	{\bfseries Art.~\arabic{artigo}º~~}%
	\else
	{\bfseries Art. \arabic{artigo}~~}%
	\fi
	%Art. \arabic{artigo}.~
	\setcounter{inciso}{0}
}

\newcounter{paragrafo}[artigo]
\newcommand{\paragrafo}{\refstepcounter{paragrafo} %
	\par 
	\ifnum\theparagrafo<10 %
	\hangindent=2em \hangafter=0 \S~\arabic{paragrafo}º~%
	\else
	\hangindent=2em \hangafter=0 \S~\arabic{paragrafo}~%
	\fi
}

\newcommand{\paragrafounico}{\hangindent=2em \hangafter=0 Parágrafo único.\enspace}


\newcounter{inciso}[paragrafo]
\newcommand{\inciso}{\refstepcounter{inciso} % 
\par
\ifnum\theparagrafo=0
\hangindent=2em \hangafter=0
\else 
\hangindent=3.5em \hangafter=0
\fi 
\Roman{inciso} --- 
}



\newcounter{alinea}[inciso]
\newcommand{\alinea}{\refstepcounter{alinea} %
\par 
 \hangindent=5em  \hangafter=0	\alph{alinea}) 
}

\newcounter{itens}[alinea]
\newcommand{\itens}{\refstepcounter{itens} % 
\par 
 \hangindent=6.5em \hangafter=0	\arabic{itens}. 
}


\endinput
