%%
%% This is file `cesenaexam.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% cesenaexam.dtx  (with options: `class,classpackage')
%% ----------------------------------------------------------------
%% cesenaexam --- class file to typeset exams
%% E-mail: alexpacini90@gmail.com
%% Released under the LaTeX Project Public License v1.3c or later
%% See http://www.latex-project.org/lppl.txt
%% Contributions to this repository as pull requests are welcome!
%% ----------------------------------------------------------------
%% 
%% This LaTeX document class has been designed to typeset exams.
%% To make the .cls from the .dtx one, just run
%% ```make```.
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cesenaexam}[2017/08/03 - v0.2 Cesena Exam]
\def\cesenaexamversion{0.2}
%% Custom options
\RequirePackage{etoolbox}
%% I decided to use the etoolbox ifbool because the if else fi
%% has issues with docstrip and needs a dirty hack
%% tex.stackexchange.com/questions/162762
%% No version option
\newbool{exam@version}\booltrue{exam@version}
%% Box the blocks option
\newbool{exam@boxed}\boolfalse{exam@boxed}
%% Times font option
\newbool{exam@times}\boolfalse{exam@times}
%% No version option
\DeclareOption{noversion}{\boolfalse{exam@version}}
%% Box the blocks option
\DeclareOption{boxed}{\booltrue{exam@boxed}}
%% Times font option
\DeclareOption{times}{\booltrue{exam@times}}
%% This class extends the article class
%% Read all the documentclass options; pass them to article,
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax
%%
\LoadClass{article}
%%
\RequirePackage{pgfkeys}
\RequirePackage{pgfopts}
%%
%% Options to pass to geometry using pgfopts
\pgfkeys{
 /myexamgeometry/.is family, /myexamgeometry,
 left/.default = 2cm,
 right/.default = 2cm,
 top/.default = 2.5cm,
 bottom/.default = 2.5cm,
 left/.store in =\exam@geometryleft,
 right/.store in =\exam@geometryright,
 top/.store in =\exam@geometrytop,
 bottom/.store in =\exam@geometrybottom,
 left, right, bottom, top,
}
\ProcessPgfOptions{/myexamgeometry}
%%
%% Page layout, check if the boxed option is used to load
%% geometry with the showframe option
\ifbool{exam@boxed}{%
\RequirePackage[showframe,%
left=\exam@geometryleft, right=\exam@geometryright,%
top=\exam@geometrytop,bottom=\exam@geometrybottom]{geometry}%
}{%
\RequirePackage[left=\exam@geometryleft, right=\exam@geometryright,%
top=\exam@geometrytop, bottom=\exam@geometrybottom]{geometry}%
}
%%
%% Set the times font if the option is times
\ifbool{exam@times}{%
\RequirePackage{newtxtext,newtxmath}%
}{}
%% Loading graphicx before tikz removes a
%% strange issue with the \graphicspath
\RequirePackage[pdftex]{graphicx}
%% Tikz and circuitikz
\RequirePackage{tikz}
\RequirePackage[betterproportions]{circuitikz}
\usetikzlibrary{arrows.meta,arrows,intersections,%
positioning,fit,calc,through,babel}
\usetikzlibrary{decorations.pathmorphing,backgrounds}
%% Some settings for Tikz
\tikzset{switcharc/.style={draw, thick, >=stealth},
    every picture/.append style={tight background,%
    baseline={([yshift=-1em] current bounding box.north)}}}
%% Set the Header
\RequirePackage{fancyhdr}
\renewcommand{\headrulewidth}{0pt}
\setlength{\headheight}{25pt}
\addtolength{\headheight}{\baselineskip}
\fancypagestyle{plain}{
\fancyhead[C]{
\ifbool{exam@boxed}{%
\tikzset{every picture/.style={framed, tight background},%
background rectangle/.style={draw=red}}%
}{}
\begin{tikzpicture}
\node (header) [align=center] at (0,0) {\@title};
\end{tikzpicture}%
}%
\ifbool{exam@version}{%
\fancyfoot[L]{{\it Proudly made with} \LaTeX}%
\fancyfoot[R]{CesenaExam v\cesenaexamversion { }- {\it A. Pacini}}%
}{}
}
\pagestyle{plain}
%% Redefine the section to have bigger font and to be
%% delimited between two lines
\RequirePackage{titlesec}
\newcommand{\sectionfont}{\Large}
\renewcommand\thesection{\bfseries \arabic{section}}
\titleformat{\section}
    {\titlerule
     \vspace{0.5ex}%
     \sectionfont}
    {\thesection}{1em}
    {\sectionfont \bfseries}[\titlerule]
%% Redefine the enumerate item to be bold
\renewcommand\labelenumi{\bfseries\theenumi.}
%% Options for the titlebox processed from the
%% maketitle optional arguments
\pgfkeys{
 /mytitlebox/.is family, /mytitlebox,
 textboxheight/.default = 0.6cm,
 whiteboxheight/.default = 1cm,
 textboxheight/.store in = \minheighttext@title,
 whiteboxheight/.store in = \minwhiteboxheight@title,
 textboxone/.default = {\relax},
 textboxtwo/.default = {\relax},
 textboxthree/.default = {\relax},
 textboxfour/.default = {\relax},
 textboxone/.store in = \textboxone@title,
 textboxtwo/.store in = \textboxtwo@title,
 textboxthree/.store in = \textboxthree@title,
 textboxfour/.store in = \textboxfour@title,
 %% Executing them to assign the default value
 %% (Tikz manual 82.3.2 or tex.stackexchange.com/questions/85754)
 textboxheight, whiteboxheight, textboxone,
 textboxtwo, textboxthree, textboxfour,
}


%% Define examsection and examsection*
\def\examsection{\@ifstar\@examsection\@@examsection}
\def\@examsection#1#2{\section*{#1 \textmd{(\textit{#2})}}\noindent}
\def\@@examsection#1#2{\section{#1 \textmd{(\textit{#2})}}\noindent}
%% Definition of empty tick box
\newcommand{\boxempty}{$ \square \;$}
%% Definition of empty tick box
\newcommand{\boxcheck}{$ \blacksquare \;$}
%% Assigns to ex@parts what is passed to the function examparts{}.
%% Works similarly similarly to author{}
\def\examparts#1{\def\ex@parts{#1}}
%% Redefine maketitle
%% Just for a future starred version
\def\maketitle{\@ifstar\make@@title\make@title}%
%% Define the unstarred version maketitle (make@title)
\newcommand\make@title[6][]{%
 \pgfkeys{/mytitlebox, #1}%
 \make@@@title{#2}{#3}{#4}{#5}{#6}}%
%% Define the common command
\def\make@@@title#1#2#3#4#5{%
\ifbool{exam@boxed}{%
\tikzset{every picture/.append style={framed},%
background rectangle/.style={draw=red}}}{}%
\begin{center}%
\begin{tikzpicture}%
\pgfmathsetmacro{\boxlen}{(\textwidth-1.6cm)/4}%
\pgfmathsetmacro{\lastboxlen}{\textwidth - 4*\boxlen - 1mm}%
\node (surname) [draw, align=center, minimum width=\boxlen,%
minimum height = \minheighttext@title] at (0,0) {\bf #1};%
\node (surname box) [draw, anchor=north, minimum width=\boxlen,%
minimum height = \minwhiteboxheight@title] at%
($(surname.south)+(0,\pgflinewidth)$) {\textboxone@title};%
\node (name) [draw, align=center, right=0 and -\pgflinewidth of surname,%
minimum width=\boxlen, minimum height = \minheighttext@title] {\bf #2};%
\node (name box) [draw, anchor=north, minimum width=\boxlen,%
minimum height = \minwhiteboxheight@title] at%
($(name.south)+(0,\pgflinewidth)$) {\textboxtwo@title};%
\node (id) [draw, align=center, right=0 and -\pgflinewidth of name,%
minimum width=\boxlen, minimum height = \minheighttext@title] {\bf #3};%
\node (id box) [draw, anchor=north, minimum width=\boxlen,%
minimum height = \minwhiteboxheight@title] at%
($(id.south)+(0,\pgflinewidth)$) {\textboxthree@title};%
\node (signature) [draw, align=center, right=0 and -\pgflinewidth of id,%
minimum width=\boxlen, minimum height = \minheighttext@title] {\bf #4};%
\node (signature box) [draw, anchor=north, minimum width=\boxlen,%
minimum height = \minwhiteboxheight@title] at%
($(signature.south)+(0,\pgflinewidth)$) {\textboxfour@title};%
%%
\pgfmathsetmacro{\minheighttypebox}{\minheighttext@title +%
\minwhiteboxheight@title}%
\node (examtype) [draw, align=center, anchor=north west,%
minimum width=\lastboxlen, minimum height = \minheighttypebox] at%
($(signature.north east)+(-\pgflinewidth,0)$) {\Huge \bfseries #5};%
\node (checkboxes) [align=left, anchor=north west] at%
(surname box.south west) {\ex@parts};%
\end{tikzpicture}%
\end{center}%
}
%% Macro for two blocks centre aligned
\def\examtwoblocks#1#2#3#4{%
\noindent%
\begin{minipage}[c]{#1}\flushleft#3\end{minipage}%
\hfill%
\begin{minipage}[c]{#2}#4\end{minipage}
\par\vspace{5mm}\noindent%
}
\def\examtwoblocks@box#1#2#3#4{%
\noindent%
\tikzset{every picture/.append style={framed},
    background rectangle/.style={draw=red}}%
\let\bak@fboxsep\fboxsep%
\def\fboxsep{0pt}%
\fbox{\begin{minipage}[c]{#1}\flushleft#3\end{minipage}}%
\hfill%
\fbox{\begin{minipage}[c]{#2}#4\end{minipage}}%
\let\fboxsep\bak@fboxsep%
\par\vspace{5mm}\noindent%
}
\ifbool{exam@boxed}{%
\renewcommand{\examtwoblocks}{\examtwoblocks@box}}{}
%% Macro for two blocks top aligned
\def\examtwoblockstop#1#2#3#4{%
\noindent%
\begin{minipage}[t]{#1}\flushleft#3\end{minipage}%
\hfill%
\begin{minipage}[t]{#2}\flushright#4\end{minipage}%
}
\def\examtwoblockstop@box#1#2#3#4{%
\noindent%
\tikzset{every picture/.append style={framed},
    background rectangle/.style={draw=red}}%
\let\bak@fboxsep\fboxsep%
\def\fboxsep{0pt}%
\fbox{\begin{minipage}[t]{#1}\flushleft#3\end{minipage}}%
\hfill%
\fbox{\begin{minipage}[t]{#2}\flushright#4\end{minipage}}%
\let\fboxsep\bak@fboxsep%
}
\ifbool{exam@boxed}{%
\renewcommand{\examtwoblockstop}{\examtwoblockstop@box}}{}
%% Macro for one block top aligned
\def\examoneblocktop#1#2{%
\noindent%
\begin{minipage}[t]{#1}\flushleft#2\end{minipage}}%
\def\examoneblocktop@box#1#2{%
\noindent%
\tikzset{every picture/.append style={framed},
    background rectangle/.style={draw=red}}%
\let\bak@fboxsep\fboxsep%
\def\fboxsep{0pt}%
\fbox{\begin{minipage}[t]{#1}\flushleft#2\end{minipage}}%
\let\fboxsep\bak@fboxsep%
}
\ifbool{exam@boxed}{%
\renewcommand{\examoneblocktop}{\examoneblocktop@box}}{}

%% 
%% Copyright (C) 2017 by Alex Pacini <alexpacini90@gmail.com>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License (LPPL), either
%% version 1.3c of this license or (at your option) any later
%% version.  The latest version of this license is in the file:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained" (as per LPPL maintenance status) by
%% Alex Pacini.
%% 
%% This work consists of the file  cesenaexam.dtx
%% and the derived files           cesenaexam.ins,
%%                                 cesenaexam.pdf and
%%                                 cesenaexam.cls.
%% 
%%
%% End of file `cesenaexam.cls'.
