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
%% Copyright (C) 2012-2015 by huxuan <i@huxuan.org>
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
    [2015/09/21 v0.3.2 Welcome, contributors]
\newif\ifrclscolor\rclscolorfalse
\DeclareOption{color}{\rclscolortrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{article}
\RequirePackage[top=.5in,bottom=.5in,left=.5in,right=.5in]{geometry}
\RequirePackage[xetex,unicode]{hyperref}
\RequirePackage[noindent]{ctex}
\RequirePackage{tabularx}
\RequirePackage{color}
\RequirePackage{fancyhdr}
\definecolor{heading}{gray}{0.85}
\ifrclscolor
    \hypersetup{colorlinks}
\else
    \hypersetup{hidelinks}
\fi
\RequirePackage[sort&compress]{natbib}
\bibliographystyle{unsrt}
\setlength{\bibsep}{0pt}
\def\rclsname{}
\newcommand\name[1]{\def\rclsname{#1}}
\def\rclsorganization{}
\newcommand\organization[1]{\def\rclsorganization{#1}}
\def\rclsaddress{}
\newcommand\address[1]{\def\rclsaddress{#1}}
\def\rclsmobile{}
\newcommand\mobile[1]{\def\rclsmobile{#1}}
\def\rclsmail{}
\newcommand\mail[1]{\def\rclsmail{#1}}
\def\rclshomepage{}
\newcommand\homepage[1]{\def\rclshomepage{#1}}
\def\rclsleftfooter{}
\newcommand\leftfooter[1]{\def\rclsleftfooter{#1}}
\def\rclsrightfooter{}
\newcommand\rightfooter[1]{\def\rclsrightfooter{#1}}
\newcommand{\heading}[1]{%
    \colorbox{heading}{%
        \parbox{.98\textwidth}{%
            \bfseries\zihao{4}#1
        }
    } \\
}
\newcommand{\entry}[3]{%
    \begin{tabularx}{\textwidth}{@{\hspace{#1}}#2}
        #3
    \end{tabularx}
}
\renewcommand{\maketitle}{%
    \entry{0em}{Xr}{%
        \bfseries\zihao{4}\rclsname  & \rclsmobile \\
        \rclsorganization            & \href{mailto:\rclsmail}{\rclsmail} \\
        \rclsaddress                 & \url{\rclshomepage} \\
    }
}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[L]{\footnotesize \rclsleftfooter}
\fancyfoot[R]{\footnotesize \rclsrightfooter}
\renewcommand{\refname}{}
\endinput
%%
%% End of file `resumecls.cls'.
