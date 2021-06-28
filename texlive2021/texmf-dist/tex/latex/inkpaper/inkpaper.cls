%% This is inkpaper.cls,Version 1.0.
%% Copyright (c) Moyan Liang,2019.

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{inkpaper}[2019/6/23 v 1.0 Paper template.]

\LoadClass[UTF8,fancyhdr,twocolumn]{ctexart}
\RequirePackage{xcolor}
\RequirePackage{amsthm,amsfonts,siunitx}
\RequirePackage{etoolbox,xstring,mfirstuc,textcase}
\RequirePackage{asymptote}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage{abstract}
\RequirePackage{cite}
\RequirePackage{kvoptions}
\RequirePackage{ifthen}
\RequirePackage{ifxetex}
\RequirePackage{calc}
\AtEndOfClass{\RequirePackage{microtype}}
\RequirePackage[colorlinks,linkcolor=blue]{hyperref}
\renewcommand{\abstractnamefont}{\normalfont\bfseries}
\renewcommand{\abstractnamefont}{\normalfont}
\SetupKeyvalOptions{family=INK, prefix=INK@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{INK}{#1}}
\DeclareStringOption[cn]{lang}
\DeclareVoidOption{cn}{\ekv{lang = cn}}
\DeclareVoidOption{en}{\ekv{lang = en}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
%\ExecuteOptions{12pt}
\ProcessKeyvalOptions*\relax
\ProcessOptions
\makeatletter
\newtoks\entitle
\renewcommand*\maketitle{%
	\thispagestyle{empty}
	\let\footnotesize\small
	%\let\footnoterule\hrule\vspace{5pt}
    \let \footnote \thanks
 
	\begin{center}
        {\LARGE \@title \par}
        \vspace{2pt}
        {\Large \textbf{\MakeUppercase{\the\entitle}} \par}
        \vspace{5pt}
        {\@author \par}
    \end{center}

	\@thanks
	\vfil\null
	\setcounter{footnote}{0}%
	
 \global\let\thanks\relax
 \global\let\maketitle\relax
 \global\let\@thanks\@empty
 \global\let\@author\@empty
 \global\let\@date\@empty
 \global\let\@title\@empty
 \global\let\title\relax
 \global\let\author\relax
 \global\let\date\relax
 \global\let\and\relax

}
\ctexset{
    section = {
        number=\arabic{section},
        name=\S,
        format+=\zihao{-4}
    },
    subsection = {
        number=\Roman{subsection},
        format = \raggedright\zihao{-4}\textit,
        aftername = {.}
    },
    subsubsection = {
        number=\roman{subsubsection},
        format=\raggedright\zihao{-4}\textit,
        name={(,)}
    }
}

\RequirePackage{fancyhdr}
\fancyhf{}
\lhead{\textnormal{\kaishu\rightmark}} 
\rhead{--\ \thepage\ --} 
\pagestyle{fancy} 
% \sectionmark 的重定义需要在 \pagestyle 之后生效 
\renewcommand\sectionmark[1]{% 
\markright{\CTEXifname{\CTEXthesection——}{}#1}} 
\ifdefstring{\INK@lang}{cn}{
    \theoremstyle{plain}% default
	\newtheorem{theorem}{定理}[section] %
	\newtheorem{lemma}[theorem]{引理} %
	\newtheorem{proposition}[theorem]{性质} %
	\newtheorem*{corollary}{推论} %
	\theoremstyle{definition} %
	\newtheorem{definition}{定义}[section] %
	\newtheorem{conjecture}{猜想}[section] %
    \newtheorem{example}{例}[section] %
    \newtheorem{problem}{题}[section] %
    \newtheorem*{problema}{引题}
    \newtheorem*{solution}{解}
	\theoremstyle{remark} %
	\newtheorem*{remark}{\normalfont\bfseries 评论} %
	\newtheorem*{note}{\normalfont\bfseries 注} %
	\newtheorem{case}{\normalfont\bfseries 案例} %
	\renewcommand*{\proofname}{\normalfont\bfseries\color{black}证明} %

	\renewcommand\figurename{图} %
	\renewcommand\tablename{表}
	
	\setlength{\parindent}{2em}
  	\newcommand{\keywords}[1]{\vskip2ex\par\noindent\normalfont{\bfseries 关键词: } #1}
  
}{\relax}
\ifdefstring{\INK@lang}{en}{
  \theoremstyle{plain}% default
	\newtheorem{theorem}{Theorem}[section] %
	\newtheorem{lemma}[theorem]{Lemma} %
	\newtheorem{proposition}[theorem]{Proposition} %
	\newtheorem*{corollary}{Corollary} %
	\theoremstyle{definition} %
	\newtheorem{definition}{Definition}[section] %
	\newtheorem{conjecture}{Conjecture}[section] %
    \newtheorem{example}{Example}[section] %
    \newtheorem{problem}{Problem}[section] %
    \newtheorem*{problema}{Initial Problem}
    \newtheorem*{solution}{Solution.}
	\theoremstyle{remark} %
	\newtheorem*{remark}{Remark} %
	\newtheorem*{note}{Note} %
    \newtheorem{case}{Case} 
    \renewcommand*{\refname}{Bibliography}
	\renewcommand*{\proofname}{\normalfont\bfseries\color{black}Proof}
	\renewcommand\figurename{Fig.} %
	\renewcommand\tablename{Tab.}
}{\relax}    
\renewcommand*{\qed}{\begin{flushright}
        $\square$
    \end{flushright}}
    
    \AtEndEnvironment{solution}{\begin{flushright}
        \qed
    \end{flushright}}
\makeatother
\RequirePackage{listings}

\lstset{
    columns=fixed,       
    numbers=left,                                        % 在左侧显示行号
    frame=none,                                          % 不显示背景边框
    backgroundcolor=\color[RGB]{245,245,244},            % 设定背景颜色
    keywordstyle=\color[RGB]{40,40,255},                 % 设定关键字颜色
    numberstyle=\footnotesize\color{darkgray},           % 设定行号格式
    commentstyle=\it\color[RGB]{0,96,96},                % 设置代码注释的格式
    stringstyle=\rmfamily\slshape\color[RGB]{128,0,0},   % 设置字符串格式
    showstringspaces=false,                              % 不显示字符串中的空格                           
}
