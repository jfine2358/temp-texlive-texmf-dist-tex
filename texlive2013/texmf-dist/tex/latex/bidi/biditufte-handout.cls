%%
%% This is file `biditufte-handout.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% bidi.dtx  (with options: `biditufte-handout.cls')
%% 
%%   ______________________________________
%%   Copyright © 2009–2013  Persian TeX Group
%% 
%%   License information appended.
%% 
%% 
\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{biditufte-handout}[2011/06/18 v0.1 biditufte-handout class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{bidituftefloat}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{bidituftetoc}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{bidituftehyperref}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{bidituftetitle}}
\ProcessOptions\relax
\LoadClass{article}
\RequirePackage{bidituftefloat}
\RequirePackage{bidituftesidenote}
\RequirePackage{bidituftetoc}
\RequirePackage{bidituftegeneralstructure}
\RequirePackage{bidituftehyperref}
\RequirePackage{bidituftetitle}
\renewenvironment{abstract}
  {\begin{quotation}}
  {\end{quotation}}
\AtBeginDocument{%
\IfFileExists{biditufte-handout.cfg}
  {\input{biditufte-handout.cfg}
   \ClassInfo{biditufte-handout}{Loading biditufte-handout configuration file \@gobble}}
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
%% End of file `biditufte-handout.cls'.
