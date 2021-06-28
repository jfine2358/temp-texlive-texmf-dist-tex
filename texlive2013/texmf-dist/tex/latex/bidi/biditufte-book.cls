%%
%% This is file `biditufte-book.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% bidi.dtx  (with options: `biditufte-book.cls')
%% 
%%   ______________________________________
%%   Copyright © 2009–2013  Persian TeX Group
%% 
%%   License information appended.
%% 
%% 
\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{biditufte-book}[2011/06/18 v0.1 biditufte-book class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{bidituftefloat}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{bidituftetoc}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{bidituftehyperref}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{bidituftetitle}}
\ProcessOptions\relax
\LoadClass{book}
\RequirePackage{bidituftefloat}
\RequirePackage{bidituftesidenote}
\RequirePackage{bidituftetoc}
\RequirePackage{bidituftegeneralstructure}
\RequirePackage{bidituftehyperref}
\RequirePackage{bidituftetitle}
%%
%%
\renewcommand\frontmatter{%
  \cleardoublepage%
  \@mainmatterfalse%
  \pagenumbering{arabic}%
  %\pagestyle{plain}%
  \fancyhf{}%
    \ifthenelse{\boolean{@bidituftefloat@twoside}}%
    {\fancyhead[LE,RO]{\thepage}}%
    {\fancyhead[RE,RO]{\thepage}}%
}
%%
\renewcommand\mainmatter{%
  \cleardoublepage%
  \@mainmattertrue%
  \fancyhf{}%
  \ifthenelse{\boolean{@bidituftefloat@twoside}}%
      {\renewcommand{\chaptermark}[1]{\markboth{##1}{}}%
      \fancyhead[LE]{\thepage\quad\smallcaps{\newlinetospace{\plaintitle}}}% book title
      \fancyhead[RO]{\smallcaps{\newlinetospace{\leftmark}}\quad\thepage}}% chapter title
      {\fancyhead[RE,RO]{\smallcaps{\newlinetospace{\plaintitle}}\quad\thepage}}% book title
}
%%
\renewcommand\backmatter{%
  \if@openright%
    \cleardoublepage%
  \else%
    \clearpage%
  \fi%
  \@mainmatterfalse%
}
%%
\setcounter{tocdepth}{0}
\AtBeginDocument{%
\IfFileExists{biditufte-book.cfg}
  {\input{biditufte-book.cfg}
   \ClassInfo{biditufte-book}{Loading biditufte-book configuration file \@gobble}}
  {}%
}
%% 
%% Copyright © 2009–2013  Persian TeX Group <persian-tex@tug.org>
%% 
%% It may be distributed and/or modified under the LaTeX Project Public License,
%% version 1.3c or higher (your choice). The latest version of
%% this license is at: http://www.latex-project.org/lppl.txt
%% 
%% This work is “maintained” (as per LPPL maintenance status)
%% by Persian TeX Group.
%% 
%% 
%% 
%%
%% End of file `biditufte-book.cls'.
