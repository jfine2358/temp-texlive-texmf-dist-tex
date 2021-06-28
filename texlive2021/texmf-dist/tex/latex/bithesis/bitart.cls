%%
%% This is file `bitart.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% bithesis.dtx  (with options: `cls,article')
%% 
%%     Copyright (C) 2021
%%     Association of Bit Network Pioneer and any individual authors listed in the documentation.
%% ------------------------------------------------------------------------------
%% 
%%     This work may be distributed and/or modified under the
%%     conditions of the LaTeX Project Public License, either
%%     version 1.3c of this license or (at your option) any later
%%     version. This version of this license is in
%%        http://www.latex-project.org/lppl/lppl-1-3c.txt
%%     and the latest version of this license is in
%%        http://www.latex-project.org/lppl.txt
%%     and version 1.3 or later is part of all distributions of
%%     LaTeX version 2020/11/27 or later.
%% 
%%     This work has the LPPL maintenance status `maintained'.
%% 
%%     The Current Maintainer of this work is Feng Kaiyu.
%% ------------------------------------------------------------------------------
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{bitart}
 [2021/01/06 v1.0.1 BIT Thesis Templates]


\newif\if@bit@labreport
\newif\if@bit@proposalreport

\DeclareOption{lab-report}{\@bit@labreporttrue\@bit@proposalreportfalse}
\DeclareOption{proposal-report}{\@bit@labreportfalse\@bit@proposalreporttrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ExecuteOptions{lab-report}
\ProcessOptions\relax

\LoadClass[UTF8,AutoFakeBold,AutoFakeSlant,zihao=-4]{ctexart}%

\if@bit@labreport
  \RequirePackage[a4paper,left=3.18cm,right=3.18cm,top=2.54cm,bottom=2.54cm,includeheadfoot]{geometry}%
\else
  \RequirePackage[a4paper,left=3cm,right=2.4cm,top=2.6cm,bottom=2.38cm,includeheadfoot]{geometry}
\fi

\RequirePackage{fontspec}%
\RequirePackage{setspace}%
\RequirePackage{graphicx}%
\RequirePackage{fancyhdr}%
\RequirePackage{pdfpages}%
\RequirePackage{setspace}%
\RequirePackage{booktabs}%
\RequirePackage{multirow}%
\RequirePackage{caption}%

\if@bit@labreport
  \RequirePackage{titlesec}%
  \RequirePackage{float}%
  \RequirePackage{etoolbox}
\fi

\if@bit@proposalreport
  % 设置参考文献编译后端为 biber，引用格式为 GB/T7714-2015 格式
  % 参考文献使用宏包见 https://github.com/hushidong/biblatex-gb7714-2015
  \usepackage[style=gb7714-2015,backend=biber]{biblatex}

\fi

\if@bit@labreport
  % 将西文字体设置为 Times New Roman
  \setromanfont{Times New Roman}%

  % 设置引用位于右上角
  \newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}%

  % 设置文档标题深度
  \setcounter{tocdepth}{3}%
  \setcounter{secnumdepth}{3}%

  %%
  % 设置一级标题、二级标题格式
  \ctexset{section={%
    format={\raggedright \bfseries \songti \zihao{-3}},%
    name = {,.},%
    number = \chinese{section}%
    }%
  }%
  \ctexset{subsection={%
    format = {\bfseries \songti \raggedright \zihao{-4}},%
    }%
  }%

  % 页眉和页脚（页码）的格式设定
  \fancyhf{}%
  \fancyhead[L]{\fontsize{10.5pt}{10.5pt}\selectfont\kaishu{\reportName}}%
  \fancyfoot[C]{\fontsize{9pt}{9pt}\selectfont\kaishu{\thepage}}%
  \renewcommand{\headrulewidth}{0.5pt}%
  \renewcommand{\footrulewidth}{0pt}%

  \AtBeginDocument{
  }
\fi

\if@bit@proposalreport
  % 定义 caption 字体为楷体
  \DeclareCaptionFont{kaiticaption}{\kaishu \normalsize}

  % 设置图片的 caption 格式
  \renewcommand{\thefigure}{\thesection-\arabic{figure}}
  \captionsetup[figure]{font=small,labelsep=space,skip=10bp,labelfont=bf,font=kaiticaption}

  % 设置表格的 caption 格式
  \renewcommand{\thetable}{\thesection-\arabic{table}}
  \captionsetup[table]{font=small,labelsep=space,skip=10bp,labelfont=bf,font=kaiticaption}

  % 输出大写数字日期
  \CTEXoptions[today=big]

  % 将西文字体设置为 Times New Roman
  \setromanfont{Times New Roman}

  %% 将中文楷体设置为 SIMKAI.TTF（如果需要）
  % \setCJKfamilyfont{zhkai}{[SIMKAI.TTF]}
  % \newcommand*{\kaiti}{\CJKfamily{zhkai}}

  % 设置文档标题深度
  \setcounter{tocdepth}{3}
  \setcounter{secnumdepth}{3}

  %%
  % 设置一级标题、二级标题格式
  % 一级标题：小三，宋体，加粗，段前段后各半行
  \ctexset{section={
    format={\raggedright \bfseries \songti \zihao{-3}},
    beforeskip = 24bp plus 1ex minus .2ex,
    afterskip = 24bp plus .2ex,
    fixskip = true,
    name = {,.\quad}
    }
  }
  % 二级标题：小四，宋体，加粗，段前段后各半行
  \ctexset{subsection={
    format = {\bfseries \songti \raggedright \zihao{4}},
    beforeskip =24bp plus 1ex minus .2ex,
    afterskip = 24bp plus .2ex,
    fixskip = true,
    }
  }
  % 页眉和页脚（页码）的格式设定
  \fancyhf{}
  \fancyhead[R]{\fontsize{10.5pt}{10.5pt}\selectfont{北京理工大学本科生毕业设计（论文）开题报告}}
  \fancyfoot[R]{\fontsize{9pt}{9pt}\selectfont{\thepage}}
  \renewcommand{\headrulewidth}{1pt}
  \renewcommand{\footrulewidth}{0pt}
\fi

\AtBeginDocument{
  \if@bit@labreport
    \input{../lab-report/misc/cover_v1.tex}
    % 正文开始
    \pagestyle{fancy}
    \setcounter{page}{1}%
  \fi
  \if@bit@proposalreport
    % 报告封面
    \input{misc/cover.tex}
  \fi

}

\endinput
%%
%% End of file `bitart.cls'.
