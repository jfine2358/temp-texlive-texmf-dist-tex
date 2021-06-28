%%
%% This is file `resumecls.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% resumecls.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2012-2013 by huxuan <i@huxuan.org>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is huxuan <i@huxuan.org>.
%% 
%% This work consists of the files resumecls.dtx and resumecls.ins
%% and the derived file resumecls.cls.
%% 

\NeedsTeXFormat{LaTeX2e}[2011/06/27]
\ProvidesClass{resumecls}
    [2013/03/17 v0.2.1 Celebrate for being included in CTAN]
\newif\ifrcls@zh\rcls@zhtrue
\newif\ifrcls@en\rcls@enfalse
\newif\ifrcls@color\rcls@colorfalse
\DeclareOption{zh}{\rcls@zhtrue\rcls@enfalse}
\DeclareOption{en}{\rcls@entrue\rcls@zhfalse}
\DeclareOption{color}{\rcls@colortrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{article}
\RequirePackage[top=.5in,bottom=.5in,left=.5in,right=.5in]{geometry}
\RequirePackage[xetex,unicode]{hyperref}
\RequirePackage[noindent,adobefonts]{ctex}
\RequirePackage{tabularx}
\RequirePackage{color}
\RequirePackage{fancyhdr}
\definecolor{heading}{gray}{0.85}
\ifrcls@color
    \hypersetup{colorlinks}
\else
    \hypersetup{hidelinks}
\fi
\RequirePackage[sort&compress]{natbib}
\bibliographystyle{unsrt}
\setlength{\bibsep}{0pt}
\def\rcls@name{}
\newcommand\name[1]{\def\rcls@name{#1}}
\def\rcls@organization{}
\newcommand\organization[1]{\def\rcls@organization{#1}}
\def\rcls@address{}
\newcommand\address[1]{\def\rcls@address{#1}}
\def\rcls@mobile{}
\newcommand\mobile[1]{\def\rcls@mobile{#1}}
\def\rcls@mail{}
\newcommand\mail[1]{\def\rcls@mail{#1}}
\def\rcls@homepage{}
\newcommand\homepage[1]{\def\rcls@homepage{#1}}
\def\rcls@resumeurl{}
\newcommand\resumeurl[1]{\def\rcls@resumeurl{#1}}
\newcommand{\heading}[1]{
    \colorbox{heading}{
        \parbox{.96\textwidth}{
            \bfseries\zihao{4}#1
        }
    } \\
}
\newcommand{\entry}[3]{
    \begin{tabularx}{\textwidth}{@{\hspace{#1}}#2}
        #3
    \end{tabularx}
}
\renewcommand{\maketitle}{
    \entry{0em}{Xr}{
        \bfseries\zihao{4}\rcls@name  & \rcls@mobile \\
        \rcls@organization            & \href{mailto:\rcls@mail}{\rcls@mail} \\
        \rcls@address                 & \url{\rcls@homepage} \\
    }
}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\ifrcls@zh
    \CTEXoptions[today=small]
    \fancyfoot[L]{\footnotesize 最后更新：\today}
\else
    \CTEXoptions[today=old]
    \fancyfoot[L]{\footnotesize Last Modified: \today}
\fi
\fancyfoot[R]{\footnotesize \url{\rcls@resumeurl}}
\renewcommand{\refname}{}
\endinput
%%
%% End of file `resumecls.cls'.
