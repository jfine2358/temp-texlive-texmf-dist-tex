%NAME: guitartabs.cls
%
% Andrey Babushkin, 2018/05/01
% babusand@fit.cvut.cz
%
% A class allowing to draw guitar tablatures easily.
% 
% Released under the The LaTeX Project Public License 1.3c.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{guitartabs}[2018/05/01 CTU FIT BI-TEX Guitar Tabs]

% Inherit options of article
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass[10pt, a4paper]{article}

% Proper encoding
\RequirePackage[utf8]{inputenc}

% Needed to configure page layout
\RequirePackage{geometry}

% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}

% Needed for creating graphics 
\RequirePackage{tikz}

% Music notation
\RequirePackage{musixtex}
\RequirePackage{harmony}

% Some calculations
\RequirePackage{intcalc}

%-------------------------------------------------------------------------------
%                Commands for the song information
%-------------------------------------------------------------------------------

% Define an artist
\newcommand*{\artistname}[1]{\def\@artistname{#1}}

% Define an album title
\newcommand*{\albumtitle}[1]{\def\@albumtitle{#1}}

% Define a song name
\newcommand*{\songname}[1]{\def\@songname{#1}}

%-------------------------------------------------------------------------------
%                Header creation commands
%-------------------------------------------------------------------------------

\newcommand*{\maketabheader}{
    \begin{center}
    \LARGE\rmfamily\bfseries\@songname%
    \\%
    \normalsize\rmfamily\bfseries\@artistname%
    \\%
    \normalsize\rmfamily\mdseries\@albumtitle%
    \\%
    \vspace{4mm}
    \hrule
    \vspace{10mm}
    \end{center}
}

%-------------------------------------------------------------------------------
%                Counters
%-------------------------------------------------------------------------------

\newcounter{tabstrings}
\newcounter{tabbars}

\newcounter{tabcstring}
\newcounter{tabcbar}
\newcounter{tabcn}
\newcounter{tabcdn}

\newcounter{flag}

%-------------------------------------------------------------------------------
%                A tab line environment
%-------------------------------------------------------------------------------

\newenvironment{tabline}[4]
{

	%-------------------------------------------------------------------------------
	%               Defining helpers
	%-------------------------------------------------------------------------------
	
	\newcommand{\gtuning}{#4}
	\newcommand{\timesigtop}{#2}
	\newcommand{\timesigbot}{#3}
	
	\newcommand{\tabwidth}{
		\textwidth - 0.6cm
	}	
	\newcommand{\ypostimetop}{
		{(\value{tabstrings} - 1) / 4}
	}
	\newcommand{\ypostimebot}{
		{(\value{tabstrings} - 1) / 4 * 3}
	}

	%-------------------------------------------------------------------------------
	%               Defining symbols
	%-------------------------------------------------------------------------------

	% Moves cursor to the next bar.
	% 
	% \nextbar
	%
	\newcommand{\nextbar}{
		\stepcounter{tabcbar}
	}

	% Draws one note on a current bar.
	% 
	% \note{numerator}{denominator}{string}{fret}
	%
	\newcommand{\note}[4]{
		\pgfmathsetlengthmacro\xpos{
			% skipping time sig and tuning
			0.8cm
			% skipping bars
			+ (\textwidth - 1.4cm) / \value{tabbars} * (\value{tabcbar} - 1)
			% calculating position inside a bar
			+ (\textwidth - 1.4cm) / \value{tabbars} / (##2 + 1) * ##1
		}
		\draw node[note] at (##3 - 1,\xpos) {##4};
	}

	%
	% The same as \note but draws the length of a note under strings tab.
	%
	% \note{numerator}{denominator}{string}{fret}{length}
	%
	\newcommand{\notel}[5]{
		\note{##1}{##2}{##3}{##4}
		\setcounter{flag}{0}
		\ifthenelse{\lengthtest{##5 pt = 1pt   }}
			{\note{##1}{##2}{\value{tabstrings} + 1}{\rotatebox{180}{\Ganz}}\setcounter{flag}{1}}{}
		\ifthenelse{\lengthtest{##5 pt = 2pt   }}
			{\note{##1}{##2}{\value{tabstrings} + 1}{\rotatebox{180}{\Halb}}\setcounter{flag}{1}}{}
		\ifthenelse{\lengthtest{##5 pt = 4pt   }}
			{\note{##1}{##2}{\value{tabstrings} + 1}{\rotatebox{180}{\Vier}}\setcounter{flag}{1}}{}
		\ifthenelse{\lengthtest{##5 pt = 8pt   }}
			{\note{##1}{##2}{\value{tabstrings} + 1.3}{\rotatebox{180}{\Acht}}\setcounter{flag}{1}}{}
		\ifthenelse{\lengthtest{##5 pt = 16pt  }}
			{\note{##1}{##2}{\value{tabstrings} + 1.3}{\rotatebox{180}{\Sech}}\setcounter{flag}{1}}{}
		\ifthenelse{\lengthtest{##5 pt = 2.5pt }}
			{\note{##1}{##2}{\value{tabstrings} + 1}{\rotatebox{180}{\Halb}.}\setcounter{flag}{1}}{}
		\ifthenelse{\lengthtest{##5 pt = 4.5pt }}
			{\note{##1}{##2}{\value{tabstrings} + 1}{\rotatebox{180}{\Vier}.}\setcounter{flag}{1}}{}
		\ifthenelse{\lengthtest{##5 pt = 8.5pt }}
			{\note{##1}{##2}{\value{tabstrings} + 1.3}{\rotatebox{180}{\Acht}.}\setcounter{flag}{1}}{}
		\ifthenelse{\lengthtest{##5 pt = 16.5pt}}
			{\note{##1}{##2}{\value{tabstrings} + 1}{\rotatebox{180}{\Sech}.}\setcounter{flag}{1}}{}
		\ifthenelse{\value{flag} = 0}{\note{##1}{##2}{\value{tabstrings} + 1}{?}}{}
	}

	%
	% Draws a whole rest symbol.
	%
	% \restwhole{numerator}{denominator}
	%
	\newcommand{\restwhole}[2]{
		\pgfmathsetlengthmacro\xpos{
			% skipping time sig and tuning
			0.8cm
			% skipping bars
			+ (\textwidth - 1.4cm) / \value{tabbars} * (\value{tabcbar} - 1)
			% calculating position inside a bar
			+ (\textwidth - 1.4cm) / \value{tabbars} / (##2 + 1) * ##1
		}
		\draw node[.style={scale=0.7}] at (\intcalcDiv{\value{tabstrings}}{2} - 1.05,\xpos) {\GaPa};
	}

	%
	% Draws a half rest symbol.
	%
	% \resthalf{numerator}{denominator}
	%
	\newcommand{\resthalf}[2]{
		\pgfmathsetlengthmacro\xpos{
			% skipping time sig and tuning
			0.8cm
			% skipping bars
			+ (\textwidth - 1.4cm) / \value{tabbars} * (\value{tabcbar} - 1)
			% calculating position inside a bar
			+ (\textwidth - 1.4cm) / \value{tabbars} / (##2 + 1) * ##1
		}
		\draw node[.style={scale=0.7}] at (\intcalcDiv{\value{tabstrings}}{2} - 0.85,\xpos) {\HaPa};
	}

	%
	% Draws a quarter rest symbol.
	%
	% \restquarter{numerator}{denominator}
	%
	\newcommand{\restquarter}[2]{
		\note{##1}{##2}{\intcalcDiv{\value{tabstrings}}{2}}{\ViPa}
	}

	%
	% Draws a eighth rest symbol.
	%
	% \resteigth{numerator}{denominator}
	%
	\newcommand{\resteighth}[2]{
		\note{##1}{##2}{\intcalcDiv{\value{tabstrings}}{2}}{\AcPa}
	}

	%
	% Draws a sixteenth rest symbol.
	%
	% \restsixteenth{numerator}{denominator}
	%
	\newcommand{\restsixteenth}[2]{
		\note{##1}{##2}{\intcalcDiv{\value{tabstrings}}{2}}{\SePa}
	}

	%-------------------------------------------------------------------------------
	%               Setting counters
	%-------------------------------------------------------------------------------

	% Set a number of strings
	\setcounter{tabstrings}{0}
	\foreach \tuning in \gtuning {
		\addtocounter{tabstrings}{1}
	}

	% Set a number of bars
	\setcounter{tabbars}{#1}

	% Current bar
	\setcounter{tabcbar}{1}

	%-------------------------------------------------------------------------------
	%               Drawing
	%-------------------------------------------------------------------------------

	\begin{center}
		\begin{tikzpicture}[
			note/.style={rectangle,fill=white, scale=0.7},
			cm={0,-0.3,1,0,(0,0)}
		]
		
		\setcounter{tabcstring}{\value{tabstrings}}
		
		% Drawing tuning labels
		\foreach \tuning in \gtuning {
			\node[
				xshift=-0.3cm,
				font=\fontsize{0.2cm}{0.1cm}\selectfont
			] at (\value{tabcstring}-1,0) {\tuning};
			\addtocounter{tabcstring}{-1}
		}
	
		% Drawing time signatures
		\node[
			xshift=0.4cm,
			font=\fontsize{1cm}{0.1cm}\selectfont\bfseries
		] at (\ypostimetop,0) {\timesigtop};
		
		\node[
			xshift=0.4cm,
			font=\fontsize{1cm}{0.1cm}\selectfont\bfseries
		] at (\ypostimebot,0) {\timesigbot};
		
		% Drawing strings
		\foreach \tline in {1,...,\value{tabstrings}} {
			\draw (\tline - 1,0) -- (\tline - 1,\tabwidth);
		}
	
		% Drawing bars
		\draw (0,0) -- (\value{tabstrings}-1,0);
	
		\foreach \tbar in {1,...,\value{tabbars}} {
			\pgfmathsetlengthmacro\barpos{ (\textwidth - 1.4cm) / \value{tabbars} * \tbar + 0.8cm }
			\draw (0,\barpos) -- (\value{tabstrings}-1,\barpos);
		}
} {
	\end{tikzpicture}
\end{center}
}

%-------------------------------------------------------------------------------
%                Configure layout
%-------------------------------------------------------------------------------
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=1.5cm, footskip=0cm}


