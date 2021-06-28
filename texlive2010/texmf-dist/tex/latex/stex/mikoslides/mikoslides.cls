%%
%% This is file `mikoslides.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% mikoslides.dtx  (with options: `cls')
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{mikoslides}[2010/06/25 v0.9 Jacobs slides]
\newif\ifnotes\notesfalse
\newif\ifproblems\problemstrue
\DeclareOption{notes}{\notestrue}
\DeclareOption{slides}{\notesfalse}
\DeclareOption{noproblems}{\problemsfalse}
\ifnotes\else\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}\fi
\ProcessOptions
\ifnotes
\LoadClass{omdoc}
\RequirePackage{a4wide}
\RequirePackage[notheorems,noamsthm]{beamerarticle}
\else
\LoadClass[notheorems,noamsthm,10pt]{beamer}
\newcounter{Item}
\newcounter{paragraph}
\newcounter{subparagraph}
\newcounter{Hfootnote}
\usetheme{Jacobs}
\fi
\RequirePackage{stex}
\RequirePackage{latexml}
\RequirePackage{amssymb}
\RequirePackage{tikz}
\usepgflibrary{shapes}\usetikzlibrary{arrows}
\RequirePackage{url}
\RequirePackage{amsmath}
\RequirePackage{comment}
\newcounter{slide}
\newlength{\slidewidth}\setlength{\slidewidth}{13.5cm}
\newlength{\slideheight}\setlength{\slideheight}{9cm}
\ifnotes\renewenvironment{note}{}{}\else\excludecomment{note}\fi
\ifnotes
\newlength{\slideframewidth}\setlength{\slideframewidth}{2pt}
\newsavebox{\myframebox}
\renewenvironment{frame}[1][]%
{\stepcounter{slide}
\def\itemize@level{outer}
\def\itemize@outer{outer}
\def\itemize@inner{inner}
\renewenvironment{itemize}
{\ifx\itemize@level\itemize@outer\def\itemize@label{$\rhd$}\fi
 \ifx\itemize@level\itemize@inner\def\itemize@label{$\scriptstyle\rhd$}\fi
  \begin{list}
    {\itemize@label}
    {\setlength{\labelsep}{.3em}\setlength{\labelwidth}{.5em}\setlength{\leftmargin}{1.5em}}
  \edef\itemize@level{\itemize@inner}}
{\end{list}}
 \noindent\hfill\begin{lrbox}{\myframebox}
   \begin{minipage}{\slidewidth}\sf}%
   {\miko@slidelabel\end{minipage}\end{lrbox}%
 \begin{center}\fbox{\usebox\myframebox}\end{center}\hfill}
\renewcommand{\frametitle}[1]{{\Large\bf\sf\color{blue}{#1}}}
\fi
\makeindex
\ifproblems\newenvironment{problems}{}{}\else\excludecomment{problems}\fi
\newlength{\slidelogoheight}
\ifnotes\setlength{\slidelogoheight}{.4cm}\else\setlength{\slidelogoheight}{1cm}\fi
\newsavebox{\slidelogo}\sbox{\slidelogo}{\includegraphics[height=\slidelogoheight]{jacobs-logo}}
\def\source{Michael Kohlhase}% customize locally
\def\copyrightnotice{\footnotesize\copyright:\hspace{.3ex}{\source}}
\newsavebox{\cclogo}\sbox{\cclogo}{\includegraphics[height=\slidelogoheight]{cc_somerights}}
\newif\ifcchref\cchreffalse
\AtBeginDocument{\@ifpackageloaded{hyperref}{\cchreftrue}{\cchreffalse}}
\def\licensing{\ifcchref\href{http://creativecommons.org/licenses/by-sa/2.5/}{\usebox{\cclogo}}\else{\usebox{\cclogo}}\fi}
\newcommand{\miko@slidelabel}%
{\vbox to \slidelogoheight{\vss\hbox to \slidewidth%
{\licensing\hfill\copyrightnotice\hfill\arabic{slide}\hfill\usebox{\slidelogo}}}}
\AtBeginDocument{\definecolor{green}{rgb}{0,.5,0}\definecolor{purple}{cmyk}{.3,1,0,.17}}
\def\defemph#1{{\textcolor{magenta}{#1}}}
\def\notemph#1{{\textcolor{magenta}{#1}}}
\def\stDMemph#1{{\textcolor{blue}{#1}}}
\def\@@lec#1{(\textcolor{green}{#1})}
\def\textwarning{\raisebox{-.05cm}{\includegraphics[width=1.2em]{dangerous-bend}}\xspace}
\newenvironment{ttitle}{\begin{center}\LARGE\begin{tabular}{|c|}\hline}%
 {\\\hline\end{tabular}\end{center}\vspace{1ex minus 1ex}}
\newenvironment{ttitlejoint}[1]%
{\newbox\boxwith\setbox\boxwith\hbox{\begin{tabular}{c}{\em joint work with}\\#1\end{tabular}}%
\begin{center}\LARGE\begin{tabular}{c}\color{red}}%
{\\\box\boxwith\end{tabular}\end{center}%
\vspace{1ex minus 1ex}}
\newcommand{\putgraphicsat}[3]{%
 \begin{picture}(0,0)\put(#1){\includegraphics[#2]{#3}}\end{picture}}
\newcommand{\putat}[2]{%
 \begin{picture}(0,0)\put(#1){#2}\end{picture}}
\newcommand\hateq{\ensuremath{\hat=}}
\newcommand\textleadsto{\ensuremath{\leadsto}}
\ifnotes\else\sf\fi
\endinput
%%
%% End of file `mikoslides.cls'.
