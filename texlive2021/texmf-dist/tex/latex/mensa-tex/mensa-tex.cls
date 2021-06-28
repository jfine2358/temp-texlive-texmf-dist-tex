%%	This is file 'mensa-tex.cls', Version 2017-12-03
%%	Copyright 2017 Sebastian Friedl <sfr682k@t-online.de>
%% 
%%	This work may be distributed and/or modified under the conditions of the LaTeX Project
%%	Public License, either version 1.3c of this license or (at your option) any later version.
%%	The latest version of this license is available at
%%		http://www.latex-project.org/lppl.txt
%%	and version 1.3c or later is part of all distributions of LaTeX version 2008-05-04 or later.
%%
%%	This work has the LPPL maintenance status 'maintained'.
%%	Author: Sebastian Friedl
%%	Current maintainer of this work is Sebastian Friedl
%%
%%	This work consists of the files mensa-tex.cls, mensa-tex-doc.tex and mensa-tex-example.tex
%%
%%	---------------------------------------------------------------------------------------------------------------------------------------------
%%
%%	A LaTeX class for typesetting school cafeteria menus consisting of two lunches (with dessert) and dinner
%%
%%	---------------------------------------------------------------------------------------------------------------------------------------------
%%
%%	Please report bugs and other problems as well as suggestions for improvements to the following email address: sfr682k@t-online.de
%%
%%	--------------------------------------------------------------------------------------------------------------------------------------------- 



\ProvidesClass{mensa-tex}[2017/12/02 mensa-tex - a class for typesetting simple school cafeteria menus]


% Requires LaTeX2e
\NeedsTeXFormat{LaTeX2e}

% Base class: article instead of KOMA-Skript classes (-> less dependencies :D)
\LoadClass[12pt]{article}



% OPTION DECLARATIONS -------------------------------------------------------------------------------------------------------

% Print or App version
\newif\if@print
\@printtrue
\DeclareOption{app}{\@printfalse}

% Use English localization
\newif\if@english
\newif\if@engb
\newif\if@enus
\@englishtrue
\@engbtrue
\@enusfalse
\DeclareOption{en-GB}{%
	\@germanfalse
	\@englishtrue
	\@engbtrue
	\@enusfalse}
\DeclareOption{en-US}{%
	\@germanfalse
	\@englishtrue
	\@engbfalse
	\@enustrue}

% Use German localization
\newif\if@german
\@germanfalse
\DeclareOption{german}{%
	\@englishfalse
	\@germantrue}

\ProcessOptions



% REQUIRED PACKAGES ---------------------------------------------------------------------------------------------------------

% Required packages: more features for tables, scaleboxes, more color features and extra symbols
\RequirePackage{array}
\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}
\RequirePackage{textcomp}

% Date-specific stuff
\RequirePackage{datetime2}
\RequirePackage{datetime2-calc}

% lmodern is better than cm, but has quite the same look
\RequirePackage{lmodern}

% Page size and layout: depending on the usage
\if@print	\RequirePackage[a4paper,left=1.5cm,right=1.5cm,top=1.5cm,bottom=1.5cm,ignorehead,ignorefoot]{geometry}
\else		\RequirePackage[a6paper,left=1cm,right=1cm,top=1cm,bottom=1cm,ignorehead,ignorefoot]{geometry}
\fi

% No head- and footline
\pagestyle{empty}

% No indent of the first paragraph
\parindent0pt

% Uses sans-serif fonts (i. e. Latin Modern Sans)
\renewcommand{\familydefault}{\sfdefault}



% COMMON DEFINITIONS --------------------------------------------------------------------------------------------------------

% Storage for the mensa's name
\def\mensaname{}
\def\insertmensaname{Mensa}
\renewcommand{\mensaname}[1]{%
	\def\insertmensaname{#1}}

% Storage for the institute's name
\def\institute{}
\def\insertinstitute{}
\renewcommand{\institute}[1]{%
	\def\insertinstitute{#1}}

% Short syntax for printing the weekday in the table
\def\printday{}
\renewcommand{\printday}[1]{%
	\begin{minipage}[b][2.5cm][c]{.75cm}\centering
		\swdayname{#1}
	\end{minipage}}

% Shorthand for superscripts
\def\sup{}
\renewcommand{\sup}[1]{\textsuperscript{#1}}

% Defines a column with horizontal and vertical centered cells
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}

% Defines symbols for vegetarian and vegan food
\def\vgt{{\rmfamily\color{green!50!black}\textleaf}}
\def\vgn{{\rmfamily\color{green!50!black}\textleaf\textleaf}}



% VARIABLES -----------------------------------------------------------------------------------------------------------------

% Commands for the dates
\def\startdate{}
\renewcommand{\startdate}[1]{%
	\DTMsavedate{monday}{#1}
	\DTMsavedate{tuesday}{#1+1}
	\DTMsavedate{wednesday}{#1+2}
	\DTMsavedate{thursday}{#1+3}
	\DTMsavedate{friday}{#1+4}
}

% Avoids errors when the user forgets to set the start date
\startdate{2001-01-01}

% Commands and variables for Monday
\def\monday{}
\def\mondayI{}
\def\mondayII{}
\def\mondayA{}
\def\mondayD{}

% Commands and variables for Tuesday
\def\tuesday{}
\def\tuesdayI{}
\def\tuesdayII{}
\def\tuesdayA{}
\def\tuesdayD{}

% Commands and variables for Wednesday
\def\wednesday{}
\def\wednesdayI{}
\def\wednesdayII{}
\def\wednesdayA{}
\def\wednesdayD{}

% Commands and variables for Thursday
\def\thursday{}
\def\thursdayI{}
\def\thursdayII{}
\def\thursdayA{}
\def\thursdayD{}

% Commands and variables for Friday
\def\friday{}
\def\fridayI{}
\def\fridayII{}
\def\fridayA{}
\def\fridayD{}

% Variables for the remarks
\def\insertlongremarks{}
\def\insertshortremarks{}

% Color variables and commands to change them
\def\bgcolor{}
\def\colorfg{}
\def\ctextcolor{}
\def\setbgcolor{}
\def\setcolorfg{}
\def\setctextcolor{}
\renewcommand{\setbgcolor}[1]{\def\bgcolor{#1}}
\renewcommand{\setcolorfg}[1]{\def\colorfg{#1}}
\renewcommand{\setctextcolor}[1]{\def\ctextcolor{#1}}

% Default colors
\def\bgcolor{white}
\def\colorfg{black}
\def\ctextcolor{black}

% The image
\def\image{~}
\def\setimage{}
\renewcommand{\setimage}[1]{\def\image{#1}}



% COMMANDS FOR VARIABLE MANAGEMENT ------------------------------------------------------------------------------------------

\renewcommand{\monday}[4]{%
	\def\mondayI{#1}
	\def\mondayII{#2}
	\def\mondayD{#3}
	\def\mondayA{#4}
}

\renewcommand{\tuesday}[4]{%
	\def\tuesdayI{#1}
	\def\tuesdayII{#2}
	\def\tuesdayD{#3}
	\def\tuesdayA{#4}
}

\renewcommand{\wednesday}[4]{%
	\def\wednesdayI{#1}
	\def\wednesdayII{#2}
	\def\wednesdayD{#3}
	\def\wednesdayA{#4}
}

\renewcommand{\thursday}[4]{%
	\def\thursdayI{#1}
	\def\thursdayII{#2}
	\def\thursdayD{#3}
	\def\thursdayA{#4}
}

\renewcommand{\friday}[4]{%
	\def\fridayI{#1}
	\def\fridayII{#2}
	\def\fridayD{#3}
	\def\fridayA{#4}
}

\def\longremarks{}
\renewcommand{\longremarks}[1]{\def\insertlongremarks{#1}}

\def\shortremarks{}
\renewcommand{\shortremarks}[1]{\def\insertshortremarks{#1}}



% REQUIRED IN CONJUNCTION WITH datetime2 - ENGLISH (regionless) LOCALIZATION ------------------------------------------------

\if@english
	% English weekday names
	\def\wdayname{}
	\renewcommand{\wdayname}[1]{%
		\ifcase\DTMfetchdow{#1}
		Monday%
		\or
		Tuesday%
		\or
		Wednesday%
		\or
		Thursday%
		\or
		Friday%
		\or
		Saturday%
		\or
		Sunday%
		\fi
	}
	
	% German short weekday names
	\def\swdayname{}
	\renewcommand{\swdayname}[1]{%
		\ifcase\DTMfetchdow{#1}
		Mon%
		\or
		Tue%
		\or
		Wed%
		\or
		Thu%
		\or
		Fri%
		\or
		Sat%
		\or
		Sun%
		\fi
	}
	
	% English menu name
	\def\menuname{Menu}
	\def\dessertname{Dessert}
	\def\dinnername{Dinner}
	\def\dietname{Weekly menu}
\fi



% REQUIRED IN CONJUNCTION WITH datetime2 - ENGLISH (GB) LOCALIZATION --------------------------------------------------------

\if@engb
	% Print the short version of a saved date
	\def\shortdate{}
	\renewcommand{\shortdate}[1]{\DTMtwodigits{\DTMfetchday{#1}}/\DTMtwodigits{\DTMfetchmonth{#1}}/\DTMtwodigits{\DTMfetchyear{#1}}}
	
	% Print the short version of a saved date with the day of week
	\def\dowshortdate{}
	\renewcommand{\dowshortdate}[1]{\wdayname{#1},~\shortdate{#1}}
	
	% Print the long version of a saved date with the day of week
	\def\longdate{}
	\renewcommand{\longdate}[1]{\DTMtwodigits{\DTMfetchday{#1}}/\DTMtwodigits{\DTMfetchmonth{#1}}/\DTMfetchyear{#1}}
	
	% Print a range of dates
	\def\daterange{}
	\renewcommand{\daterange}[2]{\shortdate{#1}\,--\,\shortdate{#2}}
\fi



% REQUIRED IN CONJUNCTION WITH datetime2 - ENGLISH (US) LOCALIZATION --------------------------------------------------------

\if@enus
	% Print the short version of a saved date
	\def\shortdate{}
	\renewcommand{\shortdate}[1]{\DTMtwodigits{\DTMfetchmonth{#1}}/\DTMtwodigits{\DTMfetchday{#1}}/\DTMtwodigits{\DTMfetchyear{#1}}}
	
	% Print the short version of a saved date with the day of week
	\def\dowshortdate{}
	\renewcommand{\dowshortdate}[1]{\wdayname{#1},~\shortdate{#1}}
	
	% Print the long version of a saved date with the day of week
	\def\longdate{}
	\renewcommand{\longdate}[1]{\DTMtwodigits{\DTMfetchmonth{#1}}/\DTMtwodigits{\DTMfetchday{#1}}/\DTMfetchyear{#1}}
	
	% Print a range of dates
	\def\daterange{}
	\renewcommand{\daterange}[2]{\shortdate{#1}\,--\,\shortdate{#2}}
\fi



% REQUIRED IN CONJUNCTION WITH datetime2 - GERMAN LOCALIZATION --------------------------------------------------------------

\if@german
	% German weekday names
	\def\wdayname{}
	\renewcommand{\wdayname}[1]{%
		\ifcase\DTMfetchdow{#1}
		Montag%
		\or
		Dienstag%
		\or
		Mittwoch%
		\or
		Donnerstag%
		\or
		Freitag%
		\or
		Samstag%
		\or
		Sonntag%
		\fi
	}
	
	% German short weekday names
	\def\swdayname{}
	\renewcommand{\swdayname}[1]{%
		\ifcase\DTMfetchdow{#1}
		Mo%
		\or
		Di%
		\or
		Mi%
		\or
		Do%
		\or
		Fr%
		\or
		Sa%
		\or
		So%
		\fi
	}
	
	% German menu name
	\def\menuname{Men\"u}
	\def\dessertname{Dessert}
	\def\dinnername{Abendessen}
	\def\dietname{Speiseplan vom}
	
	% Print the short version of a saved date
	\def\shortdate{}
	\renewcommand{\shortdate}[1]{\DTMtwodigits{\DTMfetchday{#1}}.\DTMtwodigits{\DTMfetchmonth{#1}}.}
	
	% Print the short version of a saved date with the day of week
	\def\dowshortdate{}
	\renewcommand{\dowshortdate}[1]{\wdayname{#1},~\shortdate{#1}}
	
	% Print the long version of a saved date with the day of week
	\def\longdate{}
	\renewcommand{\longdate}[1]{\DTMtwodigits{\DTMfetchday{#1}}.\DTMtwodigits{\DTMfetchmonth{#1}}.\DTMfetchyear{#1}}
	
	% Print a range of dates
	\def\daterange{}
	\renewcommand{\daterange}[2]{\shortdate{#1}\,--\,\longdate{#2}}
\fi



% MENU FOR THE WHOLE WEEK ---------------------------------------------------------------------------------------------------

\if@print
	\AtBeginDocument{%
		\begin{center} \huge
			\color{\ctextcolor}\insertinstitute
		\end{center}
		%
		\bigskip\bigskip
		\begin{minipage}[b][.15\textheight][b]{.5\textwidth} \LARGE
			\image
		\end{minipage}
		\begin{minipage}[b][.15\textheight][c]{.48\textwidth}\flushright\huge\color{\ctextcolor}
			\scalebox{2}{\Huge \insertmensaname} \\[\bigskipamount]
			\dietname \\
			\daterange{monday}{friday}
		\end{minipage}
	
		\setlength{\arrayrulewidth}{1.25pt}
		\begin{center}
			\rowcolors{2}{\bgcolor!20}{white}
			\begin{tabular}{|>{\bfseries}M{0.95cm}*{2}{|M{5cm}}*2{|M{2.4cm}}|}
				\hline
				\rowcolor{\bgcolor} \vbox to .5cm {} &%
				\bfseries{\color{\colorfg} \menuname{} 1} &%
				\bfseries{\color{\colorfg} \menuname{} 2} &%
				\bfseries{\color{\colorfg} \dessertname{}} &%
				\bfseries{\color{\colorfg} \dinnername{}} \tabularnewline \hline
				%
				\printday{monday}    & \mondayI     & \mondayII     & \mondayD     & \mondayA       \tabularnewline \hline
				\printday{tuesday}   & \tuesdayI    & \tuesdayII    & \tuesdayD    & \tuesdayA      \tabularnewline \hline
				\printday{wednesday} & \wednesdayI  & \wednesdayII  & \wednesdayD  & \wednesdayA    \tabularnewline \hline
				\printday{thursday}  & \thursdayI   & \thursdayII   & \thursdayD   & \thursdayA     \tabularnewline \hline
				\printday{friday}    & \fridayI     & \fridayII     & \fridayD     & \fridayA       \tabularnewline \hline
			\end{tabular}
		\end{center}
	
		\vfill
		{\insertlongremarks}}
\fi



% MENUS FOR MULTIPLE DAYS (when setting the "app" option) -------------------------------------------------------------------

\if@print\else
	\def\daypage{}
	\renewcommand{\daypage}[5]{{% Double braces, otherwise changes on a single page will apply to the whole document
		\clearpage
		\begin{minipage}[b][.15\textheight][b]{.58\textwidth}
			\image
		\end{minipage}
		\begin{minipage}[b][.15\textheight][b]{.4\textwidth} \flushright
			{\LARGE\color{\ctextcolor} \insertmensaname} \\
			{\footnotesize\color{\ctextcolor} #1} \\\vspace{\medskipamount}
		\end{minipage}
		
		\small
		\medskip
		\begin{minipage}[t][.15\textheight][t]{\textwidth} \centering
			\colorbox{\bgcolor}{\hbox to .975\textwidth{\hfill\color{\colorfg}\bfseries \menuname{} 1 \hfill}} \\[\smallskipamount]
			#2
		\end{minipage}
		\begin{minipage}[t][.15\textheight][t]{\textwidth} \centering
			\colorbox{\bgcolor}{\hbox to .975\textwidth{\hfill\color{\colorfg}\bfseries \menuname{} 2 \hfill}} \\[\smallskipamount]
			#3
		\end{minipage}
		\begin{minipage}[t][.15\textheight][t]{\textwidth} \centering
			\colorbox{\bgcolor}{\hbox to .975\textwidth{\hfill\color{\colorfg}\bfseries \dessertname{} \hfill}} \\[\smallskipamount]
			#4
		\end{minipage}
		\begin{minipage}[t][.15\textheight][t]{\textwidth} \centering
			\colorbox{\bgcolor}{\hbox to .975\textwidth{\hfill\color{\colorfg}\bfseries \dinnername{} \hfill}} \\[\smallskipamount]
			#5
		\end{minipage}
		
		\vfill
		{\insertshortremarks}}
	}
	
	\AtBeginDocument{%
		\daypage{\dowshortdate{monday}}{\mondayI}{\mondayII}{\mondayD}{\mondayA}
		\daypage{\dowshortdate{tuesday}}{\tuesdayI}{\tuesdayII}{\tuesdayD}{\tuesdayA}
		\daypage{\dowshortdate{wednesday}}{\wednesdayI}{\wednesdayII}{\wednesdayD}{\wednesdayA}
		\daypage{\dowshortdate{thursday}}{\thursdayI}{\thursdayII}{\thursdayD}{\thursdayA}
		\daypage{\dowshortdate{friday}}{\fridayI}{\fridayII}{\fridayD}{\fridayA}
	}
\fi



% END OF FILE ---------------------------------------------------------------------------------------------------------------
\endinput