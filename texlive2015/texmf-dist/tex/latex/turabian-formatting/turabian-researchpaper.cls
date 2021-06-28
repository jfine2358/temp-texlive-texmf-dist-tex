% Turabian Formatting for LaTeX -- Research Papers
%
% Based on the Chicago Manual of Style (16th edition) and Kate Turabian's A Manual for Writers of Research Papers, Theses, and Dissertations (8th edition)
%
% ==============================
% Copyright 2013 Omar Abdool
%
% This work may be distributed and/or modified under the conditions of the LaTeX
% Project Public License (LPPL), either version 1.3 of this license or (at your
% option) any later version.
%
% The latest version of this license is in:
%	http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX version
% 2005/12/01 or later.
%
% LPPL Maintenance Status: maintained (by Omar Abdool)
%
% This work consists of the files: turabian-formatting.sty,
% turabian-researchpaper.cls, turabian-thesis.cls, turabian-formatting-doc.tex, % and turabian-formatting-doc.pdf (in addition to this README file).
%
% ==============================
%
%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{turabian-researchpaper}[2014/12/27 Turabian Research Paper]


% Flags adjusted with class options

\newif\if@endnotesonly\@endnotesonlyfalse


% Options for document class, some passed to article class

\DeclareOption{draft}{%
	\PassOptionsToPackage{\CurrentOption}{turabian-formatting}
	\PassOptionsToClass{\CurrentOption}{article}}

\DeclareOption{raggedright}{%
	\PassOptionsToPackage{\CurrentOption}{turabian-formatting}}

\DeclareOption{emptymargins}{%
	\PassOptionsToPackage{\CurrentOption}{turabian-formatting}}

\DeclareOption{endnotesonly}{\@endnotesonlytrue}

\DeclareOption{twocolumn}{\OptionNotUsed}

\DeclareOption{notitlepage}{\OptionNotUsed}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax


\LoadClass[titlepage]{article}


\RequirePackage{turabian-formatting}

\if@endnotesonly
	\PassOptionsToPackage{notetype=endonly}{biblatex-chicago}
	\RequirePackage{endnotes}
\fi

\AtEndPreamble{%
	\if@endnotesonly
		\let\footnote=\endnote
	\fi
}


