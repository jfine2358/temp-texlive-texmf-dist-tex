% Copyright (c) 2015-2019 Robert Ryszard Paciorek <rrp@opcode.eu.org>
% 
% MIT License
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pdfArticle}[2019/05/01 v1.0 simple class for creating PDF documents with LuaLaTeX]

\RequirePackage{kvoptions} % key=value option for class ... use also by hyperref, so zero overhead
	\SetupKeyvalOptions{family=KVP, prefix=KVP@} % KVP = Key Val Parameters
	
	% Fonts settings
	\DeclareStringOption[11pt]                         {fontSize}       % base size of font (8pt, 9pt, 10pt, 11pt, 12pt, 14pt, 17pt, or 20pt with extarticle document class)
	\DeclareStringOption[
		UprightFeatures = { SmallCapsFont={ lmromancaps10regular } },
		ItalicFeatures  = { SmallCapsFont={ lmromancaps10oblique } },
		SlantedFont     = lmromanslant10regular,
		BoldSlantedFont = lmromanslant10bold,
		Ligatures=TeX
	]                                                  {mainFontFeat}   % features settings for mainFont
	\DeclareStringOption[Latin Modern Roman]           {mainFont}       % document default main (serif) fornt
	\DeclareStringOption[
		Ligatures=TeX
	]                                                  {sansFontFeat}   % features settings for sansFont
	\DeclareStringOption[Latin Modern Sans]            {sansFont}       % document default main sans-serif fornt
	\DeclareStringOption[
		UprightFeatures = { SmallCapsFont={ lmmonocaps10regular } },
		ItalicFont      = lmmono10italic,
		ItalicFeatures  = { SmallCapsFont={ lmmonocaps10oblique } },
		SlantedFont     = lmmonoslant10regular
	]                                                  {monoFontFeat}   % features settings for monoFont
	\DeclareStringOption[Latin Modern Mono Light]      {monoFont}       % document default main mono-space fornt
	
	% Paper settings
	\DeclareStringOption[a4paper]    {paperSize}      % paper size
	\DeclareStringOption[portrait]   {paperMode}      % paper orientation: portrait lub landscape
	\DeclareStringOption[2.2cm]      {tmargin}        % top margin size
	\DeclareStringOption[2.5cm]      {bmargin}        % bottom margin size
	\DeclareStringOption[2.2cm]      {lmargin}        % left margin size
	\DeclareStringOption[2.2cm]      {rmargin}        % right margin size
	\DeclareBoolOption  [true]       {twoside}        % two side mode (switch left/right margin size): true lub false
	
	% Other settings
	\DeclareStringOption[150]        {imgResolution}  % default resolution (ppi) for raster images inserted into PDF files (override by file header info)
	\DeclareBoolOption  [false]      {extra}          % enable load extra package set
	
	\ProcessKeyvalOptions*

% disable automatic convert eps -> pdf
\def\DoNotLoadEpstopdf{\relax}

% use extarticle as base class
\LoadClass[\KVP@fontSize]{extarticle}

% advanced fonts for LuaLaTeX
\RequirePackage{fontspec}
	\defaultfontfeatures[\rmfamily,\sffamily, \ttfamily]{}
	\setmainfont{\KVP@mainFont}[\KVP@mainFontFeat]
	\setsansfont{\KVP@sansFont}[\KVP@sansFontFeat]
	\setmonofont{\KVP@monoFont}[\KVP@monoFontFeat]

% insert images, with extended key=value interface ... set some defaults
\RequirePackage{graphicx, graphbox}
	\DeclareGraphicsExtensions{.mp, .pdf, .png, .jpg, .jpeg}
	\pdfvariable imageresolution \KVP@imgResolution

% foreground and background colours ... use stack of colors
\RequirePackage{xcolor, fifo-stack}
	\FSCreate{colors}{black}

% page size and settings
\RequirePackage{geometry}
	\geometry{
		\KVP@paperSize, \KVP@paperMode,
		tmargin=\KVP@tmargin, bmargin=\KVP@bmargin, lmargin=\KVP@lmargin, rmargin=\KVP@rmargin
	}
	\ifKVP@twoside \geometry{twoside=true} \else \geometry{twoside=false} \fi

% command for enforce new page geometry inside document, in contrast to \newgeometry:
%  * allow chage paper size and orientation (only pdf output)
%  * don't reset current settings (but allow modifies it)
\newcommand{\forceNewPageGeometry}[1]{%
	\clearpage%
	\Gm@clean\setkeys{Gm}{#1}\Gm@process%
	\eject \pagewidth=\paperwidth \pageheight=\paperheight%
	\Gm@changelayout%
	\ifdefined\headwidth\headwidth=\textwidth\fi%
}

% better verbatim environment ... replace standard verbatim environment by fancyvrb package
\RequirePackage{fancyvrb, fvextra}
	\DefineVerbatimEnvironment{verbatim}{Verbatim}{}
	\let\verb\Verb
	\fvset{breaklines=true, breakafter={/-}, breakaftersymbolpre={}, breakaftersymbolpost={\tiny\ensuremath{\ \hookrightarrow\ }}}

 % text decorations (under line, striking out, highlight, contours, shadows, ...)
\RequirePackage[normalem]{ulem}
	\newcommand{\ul}[1][blue]{\bgroup\markoverwith{\textcolor{#1}{\rule[-0.6ex]{2pt}{0.17ex}}}\ULon}
	\newcommand{\st}[1][red]{\bgroup\markoverwith{\textcolor{#1}{\rule[0.5ex]{2pt}{0.25ex}}}\ULon}
	\newcommand{\hl}[1][yellow]{\bgroup\markoverwith{\textcolor{#1}{\rule[-0.6ex]{1.02pt}{2.7ex}}}\ULon}
\RequirePackage{contour, shadowtext}

% items lists
\RequirePackage{enumitem} % better enumerate, itemize and description environments
\RequirePackage{alphalph} % use display counters as letters with support for big numbers (as: ... x, y, z, aa, ab, ac, ...)
	\let\alph\relax \def\alph#1{\alphalph{\value{#1}}}
	\let\Alph\relax \def\Alph#1{\AlphAlph{\value{#1}}}

% other useful stuff ...
\RequirePackage{pbox,varwidth} % vertical box with automatic minimal width
\RequirePackage{overpic} % put LaTeX stuff on images
\RequirePackage{wrapfig} % wrapfigure and wraptable environments for wraping text around images, tables, etc
\RequirePackage{array,dcolumn} % extentions for tables
\RequirePackage{tabto}  % tabbing to fixed positions
\RequirePackage{changepage} % for adjustwidth environment
\RequirePackage{ragged2e} % \justifying command, justify environment and alternative left, center and right ragged text 
\RequirePackage{setspace} % set line stretch with \setstretch{} command (it's more powerful way than \linespread{}\selectfont or manualy set \baselineskip)
\RequirePackage{amsmath,unicode-math} % math with unicode open-type fonts
\RequirePackage{adjustbox} % scale, clip, rotate, etc boxes

\ifKVP@extra
	\typeout{Document class "pdfArticle" starting to load "EXTRA" packages ...}\typeout{}
	\RequirePackage{minted}  % nice code highlight (use minted insted of listings, due to encoding problems in listings)
	% \ifnum\pdf@shellescape=1 \RequirePackage{minted} \else \typeout{}\typeout{Warning: No -shell-escape, so DO NOT use minted package.} \fi
	\RequirePackage[many,vignette,minted,magazine,poster,external]{tcolorbox} % nice framed boxes
\fi

% if \pdfArticlePreHyperRef is defined run it before load hyperref, but after load all other packages
% (for loading packages and do other stuff than should be do before load hyperref)
\ifdefined\pdfArticlePreHyperRef\pdfArticlePreHyperRef\fi

% internal and external links ... use curent color from stack for refernces
\RequirePackage[unicode=true, colorlinks=true, linkcolor=black, urlcolor=blue]{hyperref}
	\let\oldref\ref
	\AtBeginDocument{\renewcommand\ref[1]{\hyperref[#1]{\color{\FSTop{colors}}\oldref*{#1}}}}

% create label with explicit provided name; usage: \namedLabel{label}{name}
\newcommand\namedLabel[2]{\begingroup%
	\let\@currentlabel\@currentlabelx%
	\def\@currentlabel{#2}%
	\label{#1}%
	\let\@currentlabelx\@currentlabel%
\endgroup}

\typeout{Loading document class "pdfArticle" completed!}\typeout{}
