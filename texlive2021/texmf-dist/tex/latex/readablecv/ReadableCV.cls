%% ReadableCV
%% Copyright 2021 Philip Stone
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Philip Stone
%
% This work consists of the files ReadableCV.cls and ReadableCV.tex

\NeedsTeXFormat{LaTeX2e}
\def\ClassDate{2021/01/09}
\def\ClassVersion{3.0}
\ProvidesClass{ReadableCV}[\ClassDate ReadableCV \ClassVersion class written by Philip Stone]

\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption{twoside}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ExecuteOptions{a4paper}
\ProcessOptions\relax
\LoadClass[10pt, onecolumn, oneside]{memoir}

\setlrmarginsandblock{1.5cm}{1.5cm}{*}
\setulmarginsandblock{1.5cm}{*}{*}
\checkandfixthelayout


%set up PDF metadata
\usepackage{hyperref}

%Alter how date is printed
\RequirePackage[nodayofweek]{datetime}

% Allow use of multiple columns
\RequirePackage{multicol}

% Support for graphics, fonts and colour 
\RequirePackage{marvosym}
\RequirePackage{graphicx}
\RequirePackage[x11names]{xcolor}
\RequirePackage[thin]{roboto}
\RequirePackage[T1]{fontenc}

\pagestyle{empty}
%\setlength{\parindent}{0em}
\addtolength{\parskip}{6pt}

% Allow use of if statements
\RequirePackage{etoolbox}
\RequirePackage{xstring}


% Set up whether sections align to the left or right
\def\SectionAlignment{flushleft}

\newcommand{\setSectionAlignment}[1]{
  \IfEqCase{#1}{
    {left}{\def\SectionAlignment{flushleft}}
	{right}{\def\SectionAlignment{flushright}}
  }
}

% Displays section title or heading
\newcommand{\newHeading}[2]{
 \begin{\SectionAlignment}
   \smallskip
   \textcolor{\HeadingColour}{\robotoThin{\textbf{\Large{#1}}}}
   \smallskip
   \hrule
 \end{\SectionAlignment}
}

% Define page colour
% Uses X11names
\def\PageColour{white}
\newcommand{\setPageColour}[1]{
  \def\PageColour{#1}
  \pagecolor{\PageColour}
}

% Define left or right aligned header
% Can be either 'left' or 'right'
\def\HeaderAlignment{flushright}
% Create command to change header alignment
\newcommand{\setHeaderAlignment}[1]{
	\IfEqCase{#1}{
		{left}{\def\HeaderAlignment{flushleft}}
		{right}{\def\HeaderAlignment{flushright}}
	}
}

% Define default colour of headings
% Uses X11names
\def\HeadingColour{SlateGray3}
% Create command to change header colour
\newcommand{\setHeadingColours}[1]{
	\def\HeadingColour{#1}
}

\def\rcvname{}
\def\rcvjobtitle{}
\def\rcvmobileno{}
\def\rcvhomeno{}
\def\rcvemailaddr{}
\def\rcvwebaddr{}

\newcommand{\HeaderText}{
 
  \noindent\begin{minipage}{1.0\linewidth}
	\begin{\HeaderAlignment}
       \textcolor{\HeadingColour}{\robotoThin{\textbf{\Huge{\rcvname}}}}\\
       \smallskip
	   \robotoThin{\LARGE{\rcvjobtitle}}\\ 
			
	   \smallskip
	   \ifdefempty{\rcvmobileno}%
	   {
     	%if mobile number not defined
		\ifdefempty{\rcvhomeno}%
		{
	     % mobile and home numbers not defined
		}
		{
		 %mobile number not defined, home number is
		 \robotoThin{\normalsize{\textcolor{\HeadingColour}{\Telefon}\ \rcvhomeno\\}}
		}
	   }
	   {
		%if mobile number defined
		\ifdefempty{\rcvhomeno}%
		{
		 %if mobile number defined, home number not defined
		 \robotoThin{\normalsize{\textcolor{\HeadingColour}{\Mobilefone}\ \rcvmobileno\\}}
		}
		{
		 %if home number and mobile number defined
		 \robotoThin{\normalsize{\textcolor{\HeadingColour}{\Mobilefone}\ \rcvmobileno\ {\textcolor{\HeadingColour}{\Telefon}\ \rcvhomeno\\}}
		}}
	   }	
	
	   \ifdefempty{\rcvemailaddr}%
	   {
		\ifdefempty{\rcvwebaddr}%
		{
		 % email and web not defined
		}
		{
		 %email not defined, web is
		 \robotoThin{\normalsize{\textcolor{\HeadingColour}{\Mundus}\ \rcvwebaddr\\}}
		}
	   }
	   {
		%if email defined
		\ifdefempty{\rcvwebaddr}%
		{
		 %if email defined, web not defined
		 \robotoThin{\normalsize{\textcolor{\HeadingColour}{\Letter}\ \rcvemailaddr\\}}
		}
		{
		 %if email and web defined
		 \robotoThin{\normalsize{\textcolor{\HeadingColour}{\Letter}\ \rcvemailaddr\  {\textcolor{\HeadingColour}{\Mundus}\ \rcvwebaddr\\}}
		}}
	   }
	\end{\HeaderAlignment}
  \end{minipage}
}

\newcommand{\HeaderRightContact}{
  % Name and jobtitle on the left. Contact details on the right.
 
  \noindent\begin{minipage}{0.5\linewidth}
  	\begin{flushleft}
  		\textcolor{\HeadingColour}{\robotoThin{\textbf{\Huge{\rcvname}}}}\\
        \smallskip
  		\robotoThin{\LARGE{\rcvjobtitle}}\\ 
  	\end{flushleft}
  \end{minipage}
  \begin{minipage}{0.5\linewidth}
	\begin{flushright}
		\ifdefempty{\rcvmobileno}
		{}
		{\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Mobilefone}\ \rcvmobileno\\}}}
		\ifdefempty{\rcvhomeno}
		{}
		{\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Telefon}\ \rcvhomeno\\}}}
		\ifdefempty{\rcvemailaddr}
		{}
		{\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Letter}\ \rcvemailaddr\\}}}
		\ifdefempty{\rcvwebaddr}
		{}
		{\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Mundus}\ \rcvwebaddr\\}}}
	\end{flushright}
  \end{minipage}
}

\newcommand{\HeaderLeftContact}{
  % Name and jobtitle on the right. Contact details on the left.

  \noindent\begin{minipage}{0.5\linewidth}
  	\begin{flushleft}
      \ifdefempty{\rcvmobileno}
      {}
      {\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Mobilefone}\ \rcvmobileno\\}}}
      \ifdefempty{\rcvhomeno}
      {}
      {\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Telefon}\ \rcvhomeno\\}}}
      \ifdefempty{\rcvemailaddr}
      {}
      {\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Letter}\ \rcvemailaddr\\}}}
      \ifdefempty{\rcvwebaddr}
      {}
      {\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Mundus}\ \rcvwebaddr\\}}}
   	\end{flushleft}
  \end{minipage}
  \begin{minipage}{0.5\linewidth}
  	\begin{flushright}
  		\textcolor{\HeadingColour}{\robotoThin{\textbf{\Huge{\rcvname}}}}\\
        \smallskip
  		\robotoThin{\LARGE{\rcvjobtitle}}\\ 
  	\end{flushright}
  \end{minipage}

}

\newcommand{\HeaderTextOppo}{
 \IfEqCase{\HeaderAlignment}{
 	{flushleft}{\HeaderRightContact}
 	{flushright}{\HeaderLeftContact}
 } 
}

\newcommand{\HeaderLeftImage}{
	\noindent\begin{minipage}{0.5\linewidth}
		\begin{flushleft}
			\includegraphics[width=2.5cm,height=2.5cm,keepaspectratio]{\rcvimageloc}
		\end{flushleft}
	\end{minipage}
	\begin{minipage}{0.5\linewidth}
		\begin{flushright}
			\textcolor{\HeadingColour}{\robotoThin{\textbf{\Huge{\rcvname}}}}\\
            \smallskip
			\robotoThin{\LARGE{\rcvjobtitle}}\\ 
			
			\smallskip
			\ifdefempty{\rcvmobileno}%
			{
				%if mobile number not defined
				\ifdefempty{\rcvhomeno}%
				{
					% mobile and home numbers not defined
				}
				{
					%mobile number not defined, home number is
					\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Telefon}}\ \robotoThin{\rcvhomeno}\\}
				}
			}
			{
				%if mobile number defined
				\ifdefempty{\rcvhomeno}%
				{
					%if mobile number defined, home number not defined
					\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Mobilefone}\ \rcvmobileno\\}}
				}
				{
					%if home number and mobile number defined
					\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Mobilefone}\ \rcvmobileno\ {\textcolor{\HeadingColour}{\Telefon}\ \rcvhomeno\\}}}
				}
			}	
			
			\ifdefempty{\rcvemailaddr}%
			{
				\ifdefempty{\rcvwebaddr}%
				{
					% email and web not defined
				}
				{
					%email not defined, web is
					\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Mundus}\ \rcvwebaddr\\}}
				}
			}
			{
				%if email defined
				\ifdefempty{\rcvwebaddr}%
				{
					%if email defined, web not defined
					\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Letter}\ \rcvemailaddr\\}}
				}
				{
					%if email and web defined
					\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Letter}\ \rcvemailaddr\  {\textcolor{\HeadingColour}{\Mundus}\ \rcvwebaddr\\}}}
				}
			}
		\end{flushright}
	\end{minipage}
}

\newcommand{\HeaderRightImage}{
	\noindent\begin{minipage}{0.5\linewidth}
		\begin{flushleft}
			\textcolor{\HeadingColour}{\robotoThin{\textbf{\Huge{\rcvname}}}}\\
            \smallskip
			\robotoThin{\LARGE{\rcvjobtitle}}\\ 
			
			\smallskip
			\ifdefempty{\rcvmobileno}%
			{
				%if mobile number not defined
				\ifdefempty{\rcvhomeno}%
				{
					% mobile and home numbers not defined
				}
				{
					%mobile number not defined, home number is
					\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Telefon}\ \rcvhomeno\\}}
				}
			}
			{
				%if mobile number defined
				\ifdefempty{\rcvhomeno}%
				{
					%if mobile number defined, home number not defined
					\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Mobilefone}\ \rcvmobileno\\}}
				}
				{
					%if home number and mobile number defined
					\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Mobilefone}\ \rcvmobileno\ {\textcolor{\HeadingColour}{\Telefon}\ \rcvhomeno\\}}}
				}
			}	
			
			\ifdefempty{\rcvemailaddr}%
			{
				\ifdefempty{\rcvwebaddr}%
				{
					% email and web not defined
				}
				{
					%email not defined, web is
					\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Mundus}\ \rcvwebaddr\\}}
				}
			}
			{
				%if email defined
				\ifdefempty{\rcvwebaddr}%
				{
					%if email defined, web not defined
					\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Letter}\ \rcvemailaddr\\}}
				}
				{
					%if email and web defined
					\robotoThin{\normalsize{\textcolor{\HeadingColour}{\Letter}\ \rcvemailaddr\  {\textcolor{\HeadingColour}{\Mundus}\ \rcvwebaddr\\}}}
				}
			}
		\end{flushleft}
	\end{minipage}
	\begin{minipage}{0.5\linewidth}
	  \begin{flushright}
		\includegraphics[width=2.5cm,height=2.5cm,keepaspectratio]{\rcvimageloc}
	  \end{flushright}
    \end{minipage}
}

% Define image use
\newtoggle{useImage}
\def\rcvimageloc{}

% Set up use of image
\newcommand{\setImage}[1]{  
  \IfEq {#1}{}{
    \togglefalse{useImage}
    \def\rcvimageloc{}  
  }
  {
    \toggletrue{useImage}
    \def\rcvimageloc{#1}
  }
}

\def\contactloc{below}

\newcommand{\setContactLocation}[1]{
 \IfEqCase{#1}{
	{below}{\def\contactloc{below}}
	{opposite}{\def\contactloc{opposite}}
 }
}

\newcommand{\setYourName}[1]{\def\rcvname{#1}}
\newcommand{\setYourJobTitle}[1]{\def\rcvjobtitle{#1}}
\newcommand{\setYourMobileNo}[1]{\def\rcvmobileno{#1}}
\newcommand{\setYourHomeNo}[1]{\def\rcvhomeno{#1}}
\newcommand{\setYourEmailAddr}[1]{\def\rcvemailaddr{#1}}
\newcommand{\setYourWebAddr}[1]{\def\rcvwebaddr{#1}}

% Display header
\newcommand{\showHeader}{
 
 \hypersetup
 {
 	pdftitle = {CV for \rcvname},
 	pdfauthor = {\rcvname},
 	pdfsubject = {CV for \rcvname},
 	pdfkeywords = {CV, curriculum, vitae, resume, \rcvname, \rcvjobtitle},
 	pdfproducer = {ReadableCV \ClassVersion\ template written by Philip Stone}
 }
  
 \iftoggle{useImage}%
 {
  % Image present
  \IfEqCase{\HeaderAlignment}{
  	{flushleft}{\HeaderRightImage}
  	{flushright}{\HeaderLeftImage}
  } 
 }
 {
  % Image not present
  \IfEqCase{\contactloc}{
  	{below}{\HeaderText}
  	{opposite}{\HeaderTextOppo}
  }
 }

% \vspace{\baselineskip}
}

\newcommand{\addSkills}[9]{
	\def\sone{#1}
	\def\stwo{#2}
	\def\sthree{#3}
	\def\sfour{#4}
	\def\sfive{#5}
	\def\ssix{#6}
	\def\sseven{#7}
	\def\seight{#8}
	\def\snine{#9}
	
	\begin{multicols}{3}
		\begin{itemize}
			\ifdefempty{\sone}{}{\item \sone}
			\ifdefempty{\stwo}{}{\item \stwo}
			\ifdefempty{\sthree}{}{\item \sthree}
			\ifdefempty{\sfour}{}{\item \sfour}
			\ifdefempty{\sfive}{}{\item \sfive}
			\ifdefempty{\ssix}{}{\item \ssix}
			\ifdefempty{\sseven}{}{\item \sseven}
			\ifdefempty{\seight}{}{\item \seight}
			\ifdefempty{\snine}{}{\item \snine}
		\end{itemize}
	\end{multicols}
}

% Set up whether job title or company printed first
\newtoggle{jobfirst}
\toggletrue{jobfirst}

\newcommand{\setJobCompanyOrder}[1]{
  \IfEqCase{#1}{
	{JobFirst}{\toggletrue{jobfirst}}
	{CompanyFirst}{\togglefalse{jobfirst}}
  }
}

\newcommand{\newRole}[4]{
 % This displays the whole of the role information
 % including dates [1], job title [2], 
 % company name [3] and role summary [4]

\vspace{0.5em}
\begin{samepage}
  \iftoggle{jobfirst}{
   % Display job before company	
   \noindent\begin{tabular}{@{}p{3cm} l}
     \textbf{#1}      & \textbf{#2}\\
                      & \textbf{#3}\\
   \end{tabular}
    }
    {
      % Display company before job
      \noindent\begin{tabular}{@{}p{3cm} l}
      	\textbf{#1} & \textbf{#3}\\
      	            & \textbf{#2}\\
      \end{tabular}
    }

     \vspace{-0.5em}
     \noindent\sffamily{\textit{Role outline}} \rmfamily \par #4 \vspace{\baselineskip}
\end{samepage}
}

\newcommand{\roleResponsibilities}[5]{
	% Adds up to five responsibilities in an itemized list
	\vspace{\baselineskip}
	
\noindent\textit{Responsibilities}
\vspace{-1em}
	
	\def\rone{#1}
	\def\rtwo{#2}
	\def\rthree{#3}
	\def\rfour{#4}
	\def\rfive{#5}
	
	\begin{itemize}
		\ifdefempty{\rone}{}{\item \rone}
		\ifdefempty{\rtwo}{}{\item \rtwo}
		\ifdefempty{\rthree}{}{\item \rthree}
		\ifdefempty{\rfour}{}{\item \rfour}
		\ifdefempty{\rfive}{}{\item \rfive}
	\end{itemize}
	
%	\bigskip
}

\newcommand{\roleAchievements}[6]{
 % Adds up to six achievements in an itemized list
  
 \def\aone{#1}
 \def\atwo{#2}
 \def\athree{#3}
 \def\afour{#4}
 \def\afive{#5}
 \def\asix{#6}
 
% \begin{samepage}
 	\vspace{-0.5em}
 	\noindent\sffamily{\textit{Achievements}}\rmfamily
 	\vspace{-1em}
 
 \begin{itemize}
 	\ifdefempty{\aone}{}{\item \aone}
 	\ifdefempty{\atwo}{}{\item \atwo}
 	\ifdefempty{\athree}{}{\item \athree}
 	\ifdefempty{\afour}{}{\item \afour}
 	\ifdefempty{\afive}{}{\item \afive}
 	\ifdefempty{\asix}{}{\item \asix}
 \end{itemize}
%\end{samepage}
}

\newcommand{\newCourse}[4]{
% Allows the display of a new course. Arguments are
% [1] date, [2] course title, [3] awarding body.
% If JobFirst set then course title will be first
% If CompanyFirst set then awarding body will be first

  \iftoggle{jobfirst}{
	% Display job before company	
	\begin{tabular}{@{}p{3cm} l}
		\textbf{#1}      & \textbf{#2} (#3)\\
	\end{tabular}
}
{
	% Display company before job
	\begin{tabular}{@{}p{3cm} l}
		\textbf{#1} & \textbf{#3} (#2)\\
	\end{tabular}
}  
}

% Recipients address
\def\recpname{}
\def\recpjobtitle{}
\def\recproad{}
\def\recptown{}
\def\recpcity{}
\def\recppostcode{}

\newcommand{\setRecpName}[1]{\def\recpname{#1}}
\newcommand{\setRecpJobTitle}[1]{\def\recpjobtitle{#1}}
\newcommand{\setRecpRoad}[1]{\def\recproad{#1}}
\newcommand{\setRecpTown}[1]{\def\recptown{#1}}
\newcommand{\setRecpCity}[1]{\def\recpcity{#1}}
\newcommand{\setRecpPostcode}[1]{\def\recppostcode{#1}}

\newcommand{\makeLetter}{
	\setlength{\parindent}{0em}
 \begin{flushright}
 	\today
 \end{flushright}

 \bigskip \bigskip
 
 \noindent\recpname \\
 \ifdefempty{\recpjobtitle}{}{\recpjobtitle \\}
 \recproad \\ \recptown \\ \recpcity \\ \recppostcode
 
 \bigskip
 
}

% Finish letter image of signature and your name
\newcommand{\closeletter}[1]{%
	\includegraphics{#1}\\ \bigskip \rcvname
}