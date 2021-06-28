%%
%% This is file `grant-aro.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% grant.dtx  (with options: `grant-aro')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2016-2019 Jonathan Karr <karr@mssm.edu>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the MIT License. The latest version of this license is in:
%% 
%%     https://github.com/KarrLab/latex-grant/blob/master/LICENSE
%% 


%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}





\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{grant-aro}[2019/02/26 ARO class]

\newcommand{\draftstatus}{isnotdraft}
\DeclareOption{isdraft}{\renewcommand{\draftstatus}{isdraft}}
\DeclareOption{isnotdraft}{\renewcommand{\draftstatus}{isnotdraft}}

\newcommand{\whitepaperstatus}{isnotwhitepaper}
\DeclareOption{iswhitepaper}{\renewcommand{\whitepaperstatus}{iswhitepaper}}
\DeclareOption{isnotwhitepaper}{\renewcommand{\whitepaperstatus}{isnotwhitepaper}}

\newcommand{\sectioncompactstatus}{isnotsectioncompact}
\DeclareOption{issectioncompact}{\renewcommand{\sectioncompactstatus}{issectioncompact}}
\DeclareOption{isnotsectioncompact}{\renewcommand{\sectioncompactstatus}{isnotsectioncompact}}

\newcommand{\bibcompactstatus}{isnotbibcompact}
\DeclareOption{isbibcompact}{\renewcommand{\bibcompactstatus}{isbibcompact}}
\DeclareOption{isnotbibcompact}{\renewcommand{\bibcompactstatus}{isnotbibcompact}}

\ExecuteOptions{isdraft, isnotdraft, iswhitepaper, isnotwhitepaper, issectioncompact, isnotsectioncompact, isbibcompact, isnotbibcompact}
\ProcessOptions

\LoadClass[12pt, \draftstatus, \whitepaperstatus, \sectioncompactstatus, \bibcompactstatus]{grant}

%%%%%%%%%%%%%%%%%%%%%%
%% formatting
%%%%%%%%%%%%%%%%%%%%%%

\geometry{margin=1in}

\usepackage{times}
\renewcommand{\familydefault}{\rmdefault}

\setlength{\parskip}{4pt}

%%%%%%%%%%%%%%%%%%%%%%
%% abstract
%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\AbstractName}{White paper}
\settoggle{AbstractIsCentered}{true}
\settoggle{AbstractShowAdminPOC}{true}
\settoggle{AbstractShowLeadOrg}{true}
\settoggle{AbstractShowOtherPersonnel}{true}
\settoggle{AbstractShowDuration}{false}
\settoggle{AbstractShowCost}{false}

\ifbool{iswhitepaper}{
    \titleformat{\section}[block]{\bfseries}{\uline{\thesection.~}}{0ex}{\uline{#1}}[]
    \titleformat{\subsection}[runin]{\bfseries}{\thesubsection.~}{0ex}{#1}[.]
    \titleformat{\subsubsection}[runin]{}{\uline{\thesubsubsection.~}}{0ex}{\uline{#1}}[.]

    \titlespacing*{\section}{0pt}{*0.0}{*-1}

    \renewcommand{\bibfont}{\normalsize}
}{}







\endinput
%%
%% End of file `grant-aro.cls'.
