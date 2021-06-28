%%
%% This is file `mluexercise.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% mluexercise.dtx  (with options: `class')
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from mluexercise.cls.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file mluexercise.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)
\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{mluexercise}[2020/11/12 v2.0]
\newif\ifdataminingstyle\dataminingstylefalse
\DeclareOption{dataminingstyle}{%
  \dataminingstyletrue
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions*
\LoadClass{scrartcl}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{ifthen} % Conditional branches and loops.
\RequirePackage{etoolbox} % Hooks for executing code.
\RequirePackage{hyperref} % Hyperlinks.
\RequirePackage{xcolor} % Color definitions.
\RequirePackage{babel}
\RequirePackage{iflang}
\newcommand{\IfGerman}[2]{\IfLanguagePatterns{german}{#1}{%
    \IfLanguagePatterns{ngerman}{#1}{#2}}}
\newcommand{\@checkoption}[3]{%
    \AtEndPreamble{%
        \ifthenelse{\equal{\the#1}{}}{%
            \ClassError{mluexercise}{Missing #2}{%
                Set #2 using the \protect#3 command.%
            }%
        }{}%
    }%
}
\newtoks\@lecture
\newcommand{\lecture}[1]{\global\@lecture{#1}}
\let\title\lecture % Redefine standard \title command.
\@checkoption{\@lecture}{lecture name}{\lecture}
\newtoks\@semester
\newcommand{\semester}[1]{\global\@semester{#1}}
\global\@semester{ % Automatically set semester based on current date.
    \ifnum\month<4 % Winter semester, including previous year.
    WS~{\advance\year by -1 \the\year\advance\year by 1}/\the\year%
    \else\ifnum\month<10 % Summer semester.
    SS~\the\year%
    \else % Winter semester, including next year.
    WS~\the\year/{\advance\year by 1 \the\year\advance\year by -1}%
    \fi\fi%
}
\newtoks\@exercise
\newcommand{\exercise}[1]{\global\@exercise{#1}}
\@checkoption{\@exercise}{exercise number}{\exercise}
\newtoks\@task
\newcommand{\task}[1]{\global\@task{#1}}
\global\@task{1}
\newtoks\@group
\newcommand{\group}[1]{\global\@group{#1}}
\global\@group{0}
\newtoks\@studentname
\newcommand{\studentname}[1]{\global\@studentname{#1}}
\let\author\studentname % Redefine standard \title command.
\@checkoption{\@studentname}{student name}{\studentname}
\newtoks\@studentnumber
\newcommand{\studentnumber}[1]{\global\@studentnumber{#1}}
\newtoks\@studentsymbol
\newcommand{\studentsymbol}[1]{\global\@studentsymbol{#1}}
\RequirePackage{calc}
\RequirePackage[
    a4paper,
    inner=2cm,
    outer=2cm,
    top=3cm,
    bottom=3cm,
    head=0.75cm,
    headsep=0.25cm,
    foot=0.75cm,
]{geometry}
\renewcommand{\baselinestretch}{1.15}
\setlength{\parindent}{0em} % Disable paragraph indentation.
\setlength{\parskip}{1ex} % Instead enable paragraph margins.
\RequirePackage{libertine}
\RequirePackage{eulervm}
\RequirePackage[ttdefault]{sourcecodepro}
\RequirePackage{microtype}
\DisableLigatures{family=tt*}
\newcommand{\strong}[1]{\textbf{#1}}
\newcommand{\italic}[1]{\textit{#1}}
\newcommand{\code}[1]{\texttt{#1}}
\newcommand{\Underline}[1]{\underline{\underline{#1}}}
\newcommand{\plural}[1]{\textsuperscript{\underline{#1}}}
\newcommand{\pl}[1]{\plural{#1}}
\RequirePackage[autostyle=true,german=quotes]{csquotes}
\RequirePackage{relsize}
\newcommand{\ttsmallfont}{\ttfamily\smaller}
\renewcommand{\UrlFont}{\ttsmallfont}
\newcommand{\textttsmall}[1]{{\ttsmallfont #1}}
\newcommand{\query}[1]{{\ttsmallfont #1}}
\newcommand{\domain}[1]{\href{http://#1}{\mbox{\ttsmallfont #1}}}
\newcommand{\email}[1]{\href{mailto:#1}{\mbox{\ttsmallfont #1}}}
\setkomafont{sectioning}{\sffamily\mdseries}
\setkomafont{section}{\LARGE}
\setkomafont{subsection}{\Large}
\setkomafont{subsubsection}{\large}
\setkomafont{paragraph}{\large}
\setkomafont{subparagraph}{\normalsize}
\renewcommand{\thesection}{%
    \bfseries\upshape \IfGerman{Aufgabe}{Task} \arabic{section}}
\renewcommand{\thesubsection}{%
    \bfseries\upshape \alph{subsection})}
\renewcommand{\thesubsubsection}{%
    \upshape (\roman{subsubsection})}
\renewcommand{\autodot}{}
\newcommand{\Rom}[1]{\uppercase\expandafter{\romannumeral#1\relax}}
\newcommand{\groupstring}{\ifnum\the\@group>0{,
    \IfGerman{Gruppe}{Group} \Rom{\the\@group}}\fi}
\author{}
\setkomafont{title}{\sffamily\bfseries\huge\centering}
\setkomafont{date}{\sffamily\large\centering}
\newlength{\approxtitlewidth}
\renewcommand{\maketitle}{%
    \settowidth{\approxtitlewidth}{%
        \usefontofkomafont{title}\the\@lecture}%
    \ifthenelse{\lengthtest{\approxtitlewidth>\textwidth}}{%
        \addtokomafont{title}{\LARGE}}{}%
    \begin{center}%
        \usefontofkomafont{title}\the\@lecture \\
        \usefontofkomafont{date}\@date, \the\@semester\groupstring
    \end{center}
}
\RequirePackage[headsepline,footsepline]{scrlayer-scrpage}
\RequirePackage{totpages}
\pagestyle{scrheadings}
\clearscrheadfoot
\setkomafont{pageheadfoot}{\sffamily}
\setkomafont{pagenumber}{\sffamily}
\ofoot{\thepage~von~\ref{TotPages}}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{amstext}
\RequirePackage{array}
\RequirePackage{cancel}
\newcommand{\union}{\cup}
\newcommand{\disjunction}{\uplus}
\newcommand{\intersection}{\cap}
\newcommand{\intersect}{\cap}
\newcommand{\infinity}{\infty}
\newcommand{\corresponds}{\triangleq}
\newcommand{\C}{\mathbb{C}} % Complex numbers.
\newcommand{\complexnumbers}{\C}
\newcommand{\R}{\mathbb{R}} % Real numbers.
\newcommand{\realnumbers}{\R}
\newcommand{\Q}{\mathbb{Q}} % Rational numbers.
\newcommand{\rationalnumbers}{\Q}
\newcommand{\Z}{\mathbb{Z}} % Whole numbers.
\newcommand{\wholenumbers}{\Z}
\newcommand{\N}{\mathbb{N}} % Natural numbers.
\newcommand{\naturalnumbers}{\N}
\newcommand{\B}{\mathbb{B}} % Binary numbers.
\newcommand{\binarynumbers}{\B}
\newcommand{\eqtransform}{\ensuremath{\qquad\big|\,\,}}
\newcommand{\ditto}{\textquotedbl} \newcommand{\dito}{\ditto}
\renewcommand{\qed}{\nopagebreak\hfill\ensuremath{\square}}
\newcommand{\mland}{\(\land\)} % \land in text.
\newcommand{\mlor}{\(\lor\)} % \lor in text.
\let\tmp\mod \let\mod\bmod \let\bmod\tmp
\let\varemptyset\emptyset \let\emptyset\varnothing
\let\tmp\epsilon \let\epsilon\varepsilon \let\varepsilon\tmp
\let\tmp\phi \let\phi\varphi \let\varphi\tmp
\newcommand{\base}[1]{\mathcal{#1}} % Base (caligraphic)
\DeclareMathOperator{\im}{im} % Image
\DeclareMathOperator{\id}{id} % Identity
\DeclareMathOperator{\sel}{sel} % Selection
\DeclareMathOperator{\dom}{dom} % Domain
\DeclareMathOperator{\ran}{ran} % Range
\DeclareMathOperator{\Hom}{Hom} % Homomorphism
\DeclareMathOperator{\End}{End} % Endomorphism
\renewcommand{\O}{\mathcal{O}} % asymptotic O-Notation (Landau)
\DeclareMathOperator{\indeg}{indeg} % Indegree
\DeclareMathOperator{\outdeg}{outdeg} % Outdegree
\renewcommand{\P}{\ifdataminingstyle p\else\mathbf{P}\fi}
\newcommand{\E}{\ifdataminingstyle\mathbb{E}\else\mathbf{E}\fi}
\DeclareMathOperator{\var}{var}
\DeclareMathOperator{\Var}{Var}
\DeclareMathOperator{\cov}{cov}
\DeclareMathOperator{\Cov}{Cov}
\DeclareMathOperator{\Bin}{Bin}
\DeclareMathOperator{\Exp}{Exp}
\DeclareMathOperator{\Dir}{Dir}
\DeclareMathOperator{\Mult}{Mult}
\newcommand{\Normal}{\mathcal{N}}
\newcommand{\Norm}{\Normal}
\newcolumntype{L}{>{\(}l<{\)}}
\newcolumntype{R}{>{\(}r<{\)}}
\newcolumntype{C}{>{\(}c<{\)}}
\newcounter{calculusRowCount}
\RequirePackage{pgfkeys}
\newenvironment{calculus}[1]{
\pgfkeys{/mlu/calculus/.cd,show index=false,
    context=\Gamma,context command=context,#1}
\setcounter{calculusRowCount}{0}
\newcommand{\calculusSymbol}{\text{
        \sffamily\itshape\pgfkeysvalueof{/mlu/calculus/symbol}}}
\newcommand{\calculusContext}{\ensuremath{
        \pgfkeysvalueof{/mlu/calculus/context}}}
\expandafter\let\csname \pgfkeysvalueof{/mlu/calculus/context command}%
    \endcsname\calculusContext
\par\vspace{0.5em}
\begin{minipage}{\textwidth}\begin{tabular}{
    @{\stepcounter{calculusRowCount}
    (\arabic{calculusRowCount})\hspace{1em}} R
    @{\hspace{0.4em}
    \(
        \vdash_{%
            \ifthenelse{%
                \equal{\pgfkeysvalueof{/mlu/calculus/show index}}{true}
            }{
                \ifthenelse{%
                    \equal{\pgfkeysvalueof{/mlu/calculus/symbol}}{}%
                }{}{%
                    \calculusSymbol%
                }%
            }{%
                \hspace{-0.1em}%
            }%
        }%
    \)\hspace{0.6em}}
        L l
    }
}{
\end{tabular}\end{minipage}\vspace{0.5em}
\let\calculusContext\undefined \let\calculusSymbol\undefined
\expandafter\let\csname \pgfkeysvalueof{/mlu/calculus/context command}%
    \endcsname\undefined
}
\newenvironment{eqcalc}[1][]{\begin{calculus}[
    symbol=E,show index=true,context={\calculusSymbol_{#1}},
    context command=E]}{\end{calculus}} % Equation calculus
\newenvironment{seqcalc}{\begin{calculus}[
    symbol=S,show index=true, context={\calculusSymbol},
    context command=seq]}{\end{calculus}} % Sequence calculus
\RequirePackage[vlined,linesnumbered]{algorithm2e}
\DontPrintSemicolon % Hide semicolons.
\SetKwProg{Function}{function}{\ is}{end function}
\SetKwComment{Comment}{\quad\(\triangleright\)~}{} % Comment style.
\SetCommentSty{itshape} % Comment font.
\SetKw{Continue}{continue}
\SetKwBlock{Repeat}{repeat}{}
\SetNlSty{tiny}{}{} % Line number font.
\SetNlSkip{0.5em} % Line number skip.
\SetAlgoNlRelativeSize{0}
\SetAlFnt{\footnotesize}
\RequirePackage{listings}
\RequirePackage{listingsutf8} % UTF8 support in included listings.
\definecolor{lsnumber}{rgb}{0,0,0} % Zeilennummerfarbe
\definecolor{lscomment}{rgb}{0.25,0.5,0.35} % Kommentarfarbe
\definecolor{lskeyword}{rgb}{0.5,0,0.35} % Schl^^c3^^bcsselw^^c3^^b6rterfarbe
\definecolor{lsstring}{rgb}{0.6,0,0} % Zeichenkettenfarbe
\lstset{
    language=C,
    basicstyle=\ttfamily,
    breakatwhitespace=false,
    breaklines=true,
    prebreak={\mbox{\footnotesize\(\hookleftarrow\)}},
    numbers=left,
    numberstyle=\color{lsnumber}\tiny,
    numbersep=0.5em,
    stepnumber=1,
    commentstyle=\color{lscomment},
    morecomment=[s][\color{lscomment}]{/**}{*/},
    keepspaces=true,
    keywordstyle=\bfseries\color{lskeyword},
    stringstyle=\color{lsstring},
    showtabs=false, showspaces=false,
    showstringspaces=false,
    tabsize=2,
}
\lstdefinelanguage[Zimmermann]{haskell}[]{haskell}{
    escapeinside={*'}{'*},
    showstringspaces=false,
    morecomment=[l]\%,
    captionpos=b,
    emphstyle={\bfseries},
}
\lstalias[]{zhaskell}[Zimmermann]{haskell}
\lstdefinestyle{haskell}{language=zhaskell}
\lstdefinelanguage[Molitor]{Assembler}[x86masm]{Assembler}{
    morekeywords={
        ldd,sto,shl,shr,rol,ror,sub,add,shli,shri,roli,rori,
        subi,addi,or,and,xor,xnor,jmp,beq,bneq,bgt,bo,ldpc,stpc
    },
    comment=[l]{\#},
}
\lstalias[]{massembler}[Molitor]{Assembler}
\lstdefinestyle{massembler}{language=massembler}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{subcaption}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{rotating}
\usetikzlibrary{positioning}
\usetikzlibrary{automata}
\usetikzlibrary{trees}
\tikzset{
    >=latex,
    font=\sffamily,
}
\pgfplotsset{compat=1.16}
\AtEndPreamble{
    \setcounter{section}{\the\@task} \addtocounter{section}{-1}
    \newcommand{\@exercisestring}{\IfGerman{%
        \the\@exercise.~^^c3^^9cbungsserie}{Exercise~\the\@exercise}}
    \ihead{\the\@studentname}
    \chead{\textbf{\@exercisestring}}
    \ohead{
        \the\@studentnumber%
        \ifthenelse{\equal{\the\@studentnumber}{} \OR
            \equal{\the\@studentsymbol}{}}{}{\ /\,}%
        \the\@studentsymbol%
    }
    \hypersetup{
        pdfauthor={\the\@studentname},
        pdftitle={\@exercisestring - \the\@lecture}
    }
}
\endinput
%%
%% End of file `mluexercise.cls'.
