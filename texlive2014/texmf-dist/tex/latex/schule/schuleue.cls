%%
%% This is file `schuleue.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% schule.dtx  (with options: `schuleue.cls,package')
%% Copyright (C)
%% 2010, 2011, 2012, 2013, 2014
%% Johannes Pieper (johannes_pieper@yahoo.de)
%% Johannes Kuhaupt (kujohann@seminar.ham.nw.schule.de)
%% Andre Hilbig (mail@andrehilbig.de)
%% 
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
%% The Current Maintainer of this work is Johannes Pieper.
%% 
%% This work consists of the files schule.dtx and schule.ins, readme
%% and the derived files schule.sty, schulinf.sty, syntaxdi.sty,
%% relaycircuit.sty, schulphy.sty, schulekl.cls, schuleub.cls,
%% schullzk.cls, schuleab.cls, schulein.cls, schuleue.cls, schullsg.cls,
%% schulit.cls, schulekl.sty, schulelzk.sty.
%% 
%% Dies ist der dokumentierte Makrocode zur Erzeugung und Dokumentation
%% des LaTeX-Paket `schule'.
%% 
%% This is the documented Macrocode to build the LaTeX-Package `schule'
%% and its documentation.
%% 
%% Some of the examples in the documentation have different copyright
%% notes.
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
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{schuleue}[2014/05/04 v1.1 %
                         Vorlage für eine Übersicht]
\DeclareOption{loesung}%
    {\PassOptionsToClass{loesung}{schuleab}}
\DeclareOption{loesungseite}%
    {\PassOptionsToClass{loesungseite}{schuleab}}
\DeclareOption{loesungsseite}%
    {\PassOptionsToClass{loesungsseite}{schuleab}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax
\LoadClass{schuleab}

\ohead{\"Ubersicht%
\ifthenelse{\isundefined{\@dokNummer}}
{}
{ Nr. \@dokNummer}}
\endinput
%%
%% End of file `schuleue.cls'.