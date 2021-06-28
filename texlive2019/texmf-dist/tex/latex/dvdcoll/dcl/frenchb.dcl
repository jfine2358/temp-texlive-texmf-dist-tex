%%
%% Copyright (C) 2006-2008 by:
%% Josef Kleber
%% <josef.kleber@gmx.net>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.3 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of LaTeX version
%% 2003/12/01 or later.
%% 
%% This work has the LPPL maintenance status "author-maintained".
%% 
%% This Current Maintainer of this work is Josef Kleber.
%%
%% This work consists of all files listed in manifest.txt.
%%
\ProvidesFile{frenchb.dcl}[2007/03/16 v6 (by Fran�ois P�tiard)]%
%
%contributed by Fran�ois P�tiard
%
\makeatletter%
\renewcommand*\dc@miss{F}%
\renewcommand*\dc@lfrname{Liste des enregistrements d\'{e}fectueux ou absents}%
\renewcommand*\dc@ledname{Liste des enregistrements sans description}%
\renewcommand*\dc@pdf@subject{Description}%
\renewcommand*\dc@dvdlist{Liste des DVDs}%
\renewcommand*\dc@season{Saison}%
\renewcommand*\dc@pdftitle{Archives des DVDs}%
%
%switch on and off the shorthand active character(s) within environment Dvd
\renewcommand*\dc@dvd@shorthand@off{\shorthandoff{:;!?}}%
\renewcommand*\dc@dvd@shorthand@on{\shorthandon{:;!?}}%
\makeatother%
%
\endinput%
%%
%% End of file <frenchb.dcl>.
