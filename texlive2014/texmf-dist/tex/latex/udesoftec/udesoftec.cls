% !Mode:: "TeX:UTF-8"
%% udesoftec.cls
%% Copyright 2014 J. Peter M. Schuler
%% 2014/05/13 v1.3.8 udesoftec
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
% The current Maintainer of this work is J. Peter M. Schuler
% j.peter.m.schuler@uni-due.de
%
% This work consists of the files udesoftec.cls and udesoftec.bst.
%
% As this work is based on years of mostly undocumented improvement, 
% it includes parts, for which sources can't be identified anymore. Public postings
% in the LaTeX community were used as an input and if source is known, it is
% mentioned below. If anybody identifies parts of his/her own code,
% feel free to contact the maintainer in order to get listed. 
%
% Special thanks to all contributors and for the help of the tex-live team,
% e.g. Axel K.; Norbert P.; Petra R.; Rainer S.; Reinhard K.; Robin F.
%
% For further information refer to:
% http://mirrors.ctan.org/macros/latex/contrib/udesoftec/README
% and
% http://mirrors.ctan.org/macros/latex/contrib/udesoftec/udesoftec-doc.pdf
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{udesoftec}[2014/05/13 v1.3.8 Thesis class and bibstyle for UDE SOFTEC]%

\LoadClass[%
	twoside=true,
	headings=openright,															% same as documentclassoption openany/openright
	numbers=noenddot,                 							% section numbering without dot
	bibliography=totoc,index=totoc,listof=totoc,		% put everything relevant in toc
	]{scrbook}

%%%% nag %%%%%%%%%%%%% 
% purpose: identifies deprecated code and suggests better pckgs
% source:  http://www.ctan.org/pkg/nag
\RequirePackage[l2tabu, orthodox]{nag}
%%%%%%%%%%%%%%%%%%%%%%

%%%% fixltx2e %%%%%%%%
% purpose: removes some Bugs in LaTeX2e (removes some stupid backwards compatibility)
% source:  http://www.ctan.org/pkg/fixltx2e
\usepackage{fixltx2e}          
%%%%%%%%%%%%%%%%%%%%%%


\KOMAoptions{
	headlines=1.5                                   % the size of the header in lines (1.5 because of pagemark and sepline); 1.25 is default; 1 would be appropriate if only text and no sepline)
}
\pdfminorversion=6
\newif\ifdebugThisClass
\debugThisClasstrue
\debugThisClassfalse
\newcommand{\classdebug}[1]{\ifdebugThisClass\ClassWarning{udesoftec}{#1}\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% all template conditions %%%%%%
\newif\ifdocumentIsFinal
\newif\ifdocumentIsProposal
\newif\iftemplateUseSansSerifFont
\newif\iftemplateUseBookLayout
\newif\iftemplateAddChapterToFigureNumbering
\newif\iftemplateUseCustomMaketitle
\newif\ifdocumentOmitCC
\newif\ifprimaryDocumentLanguageGerman
\newif\iftemplateUseColorfulLinks

\newif\iftemplateVawi
\newif\iftemplateVawiEssen
\newif\iftemplateVawiBamberg

\newif\ifdocumentOmitSD
\newif\ifdocumentOmitLOT
\newif\ifdocumentOmitLOF
\newif\ifdocumentOmitLOA
\newif\ifdocumentOmitTOC
\newif\ifdocumentOmitTodos
\newif\ifdocumentOmitA
\newif\ifdocumentOmitAen
\newif\ifdocumentHasShortA
\newif\ifdocumentUsedTodos



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% all default values and the options %%%%%
\documentIsFinalfalse
\documentIsProposalfalse
\documentOmitLOTfalse
\documentOmitSDfalse
\documentOmitLOFfalse
\documentOmitLOAfalse
\documentOmitTOCfalse
\documentOmitTodosfalse
\documentOmitAfalse
\documentOmitAenfalse
\documentOmitCCtrue 
\documentHasShortAtrue
\documentUsedTodosfalse
\templateUseColorfulLinkstrue
\templateUseSansSerifFonttrue
\templateUseBookLayoutfalse	
\templateVawifalse
\templateVawiEssenfalse
\templateVawiBambergfalse
\templateAddChapterToFigureNumberingfalse
\templateUseCustomMaketitletrue    
\primaryDocumentLanguageGermantrue
\bibliographystyle{udesoftec}

\DeclareOption{draft}       {\documentIsFinalfalse}
\DeclareOption{final}       {\documentIsFinaltrue}
\DeclareOption{de}          {\primaryDocumentLanguageGermantrue}
\DeclareOption{en}          {\primaryDocumentLanguageGermanfalse}
\DeclareOption{omit-lot}    {\documentOmitLOTtrue}
\DeclareOption{omit-lof}    {\documentOmitLOFtrue}
\DeclareOption{omit-loa}    {\documentOmitLOAtrue}
\DeclareOption{omit-toc}    {\documentOmitTOCtrue}
\DeclareOption{omit-sd}     {\documentOmitSDtrue}
\DeclareOption{omit-todos}  {\documentOmitTodostrue}
\DeclareOption{omit-a}      {\documentOmitAtrue}
\DeclareOption{long-a}      {\documentHasShortAfalse}
\DeclareOption{omit-aen}      {\documentOmitAentrue}
\DeclareOption{confidential}{\documentOmitCCfalse}

\DeclareOption{proposal}{
    \documentIsProposaltrue
    \documentOmitLOTtrue
    \documentOmitSDtrue
    \documentOmitLOFtrue
    \documentOmitLOAtrue
    \documentOmitTOCtrue
    \documentOmitAtrue
    \documentOmitTodosfalse
}
\ifdocumentIsFinal
  \ifdocumentIsProposal
    \documentOmitTodostrue
  \else
    \documentOmitLOTfalse
    \documentOmitLOFfalse
    \documentOmitLOAfalse
    \documentOmitTOCfalse
    \documentOmitTodostrue
  \fi
\else%
\fi%

\DeclareOption{printlayout}{
	\templateUseColorfulLinksfalse
	\templateUseSansSerifFontfalse
	\templateUseBookLayouttrue
}
\DeclareOption{screenlayout}{
	\templateUseColorfulLinkstrue
	\templateUseSansSerifFonttrue
	\templateUseBookLayoutfalse
}
\DeclareOption{vawiessen}{
  \templateVawitrue
  \templateVawiEssentrue
}
\DeclareOption{vawibamberg}{
  \templateVawitrue
  \templateVawiBambergtrue
}
\DeclareOption*{\ClassWarning{udesoftec}{Unknown option \CurrentOption}}

%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%
\def \udesoftec@templatePageMarkPrefix {} 	              % might be something like "S. "

%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\city}[1]{\def\udesoftec@city{#1}}
\newcommand{\typeofdoc}[1]{\def\udesoftec@typeofdoc{#1}}
\newcommand{\labelPreTopic}[1]{\def\udesoftec@labelPreTopic{#1}}
\newcommand{\labelRespectConfidentiality}[1]{\def\udesoftec@labelRespectConfidentiality{#1}}
\newcommand{\academicfield}[1]{\def\udesoftec@academicfield{#1}}
\newcommand{\institution}[1]{\def\udesoftec@institution{#1}}
\newcommand{\semester}[1]{\def\udesoftec@semester{#1}}
\newcommand{\entitle}[1]{\def\udesoftec@entitle{#1}}                   
\newcommand{\confidentialitySource}[1]{\def\udesoftec@confidentialitySource{#1}}                
\newcommand{\authorbox}[1]{\def\udesoftec@authorbox{#1}}                   
\newcommand{\abstract}[1]{\def\udesoftec@abstract{#1}}                   
\newcommand{\abstractEn}[1]{\def\udesoftec@abstracten{#1}}               

%%%%%%%%%%%%%%%%%%%%%%
%%%% labels %%%%

\title{Komplexer Titel einer Abschlussarbeit f\"ur ein Dokument}
\author{Max Mustermann}
\city{Essen}
\typeofdoc{Masterarbeit}
\labelPreTopic{zum Thema}
\labelRespectConfidentiality{(Sperrvermerk beachten)}
\academicfield{Wirtschaftsinformatik}
\institution{Vorgelegt der Fakult\"at f\"ur Wirtschaftswissenschaften\par der Universit\"at Duisburg-Essen}
\semester{Wintersemester 2011/2012, 8. Fachsemester \academicfield}         
\entitle{Englischer Titel der Arbeit}                                                                  
\confidentialitySource{Name der Firma, die auf die Vertraulichkeitserkl\"arung besteht}
\date{Version: \today}

\authorbox{
\begin{tabularx}{.7\linewidth}{ll}
  von:&Max Mustermann\\
	    &Musterstrasse 123\\
			&12345 Musterstadt\\
	\\
  Gutacher:&Prof. Dr. Stefan Eicker\\
	         &Prof. Dr. John Doe\\
	\\
	Betreuer:&Dipl.-Wirt.-Inf Some Body\\
	\\
\end{tabularx}	
}

\abstract{Jede wissenschaftliche Arbeit sollte eine Kurzfassung am Anfang aufweisen. Diese Kurzfassung sollte etwa eine halbe Seite lang sein.}
\abstractEn{As all theses have an English title, there should be an English abstract as well. 

Folglich sollten auch deutsche Arbeiten einen englischen Abstract haben. Falls die Abstracts zu lang werden, gibt es im Handbuch eine Hilfestellung.}

\newcommand{\confidentialityclausegerman}{
					Die vorliegende \udesoftec@typeofdoc ~enth\"alt vertrauliche Informationen der \emph{\udesoftec@confidentialitySource}, die der Geheimhaltung unterliegen. Ver\"offentlichungen oder Vervielf\"altigungen der \udesoftec@typeofdoc ~-- auch nur auszugsweise -- sind ohne ausdr\"uckliche Genehmigung der \emph{\udesoftec@confidentialitySource} nicht gestattet. Die \udesoftec@typeofdoc ~ist nur den Mitarbeitern des betreuenden Lehrstuhls sowie den Mitgliedern des Pr\"ufungsausschusses zug\"anglich zu machen.
			
					Dieser Sperrvermerk gilt f\"ur die n\"achsten 2 Jahre. Die sich aus diesem Sperrvermerk ergebenden Einschr\"ankungen entfallen nach Ablauf dieses Zeitraums.
}
\newcommand{\confidentialityclause}{
					\chapter*{Sperrvermerk}
                    \confidentialityclausegerman}
 

\newcommand{\statutorydeclarationheading}{
\chapter*{Eidesstattliche Versicherung}
}
\newcommand{\statutorydeclaration}{
\statutorydeclarationheading
Ich versichere an Eides statt durch meine Unterschrift, dass ich die vorstehende Arbeit 
selbst\"andig und ohne fremde Hilfe angefertigt und alle Stellen, die ich w\"ortlich oder 
ann\"ahrend w\"ortlich aus Ver\"offentlichungen entnommen habe, als solche kenntlich gemacht 
habe, mich auch keiner anderen als der angegebenen Literatur oder sonstiger Hilfsmittel 
bedient habe. Die Arbeit hat in dieser oder \"ahnlicher Form noch keiner anderen 
Pr\"ufungsbeh\"orde vorgelegen.


\vspace*{40pt}
\parbox{4cm}{\udesoftec@city, \today\hrule\strut \footnotesize Ort, Datum} \hfill
\parbox{7cm}{\textcolor{white}{Hier wurde im Original unterschrieben}\hrule\strut \footnotesize Unterschrift} \hfill
}

\newcommand{\chapterHeading}[1]{
    \let\oldcleardoublepage\cleardoublepage
    \let\oldclearpage\clearpage
    \let\clearpage\relax
    \let\cleardoublepage\relax
    
    \let\backupskip\chapterheadstartvskip
    \renewcommand*\chapterheadstartvskip{\vspace*{-\topskip}\vspace*{10pt}} 

    \chapter*{#1}
    \let\cleardoublepage\oldcleardoublepage
    \let\clearpage\oldclearpage
    \let\chapterheadstartvskip\backupskip
}

\newcaptionname{ngerman}{\labelabstracttitle}{Kurzfassung}
\newcaptionname{english}{\labelabstracttitle}{Abstract}


\newcommand{\printabstractDe}{%        
\chapter*{\labelabstracttitle}
\label{sec:abstract}\pdfbookmark{\labelabstracttitle}{sec:abstract}%
\udesoftec@abstract

\ifdocumentOmitAen
\else
\selectlanguage{english}

\ifdocumentHasShortA%

\chapterWithoutPageBreak{\labelabstracttitle}
\else

\chapter*{\labelabstracttitle}
\fi
\label{sec:abstracten}\pdfbookmark{\labelabstracttitle}{sec:abstracten}%
\udesoftec@abstracten
\selectlanguage{ngerman}
\fi
}

\newcommand{\printabstractEn}{%
\chapter*{\labelabstracttitle}
\label{sec:abstract}\pdfbookmark{\labelabstracttitle}{sec:abstract}%
\udesoftec@abstract
}

\newcommand{\printabstract}{\printabstractDe}
\ifprimaryDocumentLanguageGerman
\else
\renewcommand{\printabstract}{\printabstractEn}
\abstract{Every thesis should have an abstract at the beginning. This abstract should be about have an page long. Of course an English thesis doesn't need an German abstract, as it doesn't even have a German title.}
\entitle{}
\abstractEn{}

\renewcommand*{\confidentialityclause}{
                   \chapter*{Confidentially Clause}
					
                    
					This \udesoftec@typeofdoc ~contains confidential data of \emph{\udesoftec@confidentialitySource}. Any publication or duplication of this \udesoftec@typeofdoc ~-- even in part -- is prohibited, excluding cases with explicit permission by \emph{\udesoftec@confidentialitySource}. The \udesoftec@typeofdoc ~is to be made accessible only to the staff of the research group supervising it and the board of examiners.
					
					This confidentially clause is valid for the next 2 years. Any limitations resulting from this confidentially clause do not apply after this period.
					
                    \chapterHeading{Sperrvermerk}
                    
                    \confidentialityclausegerman
}
\renewcommand*{\statutorydeclarationheading}{
\chapter*{Statutory Declaration}
The statutory declaration needs to be in german, so the following excerpt is in german:

\section*{Eidesstattliche Versicherung}
}
\typeofdoc{Master Thesis}
\labelPreTopic{about the topic}
\labelRespectConfidentiality{(Adhere confidentially clause --- Sperrvermerk beachten)}
\academicfield{Business Information Systems}
\institution{Presented to the Faculty of Economics and Business Administration\par of  University of Duisburg-Essen}
\semester{Winter semester 2011/2012, 8th Semester  in \academicfield}                                                                
\confidentialitySource{Name der Firma, die auf die Vertraulichkeitserkl\"arung besteht}
\date{Version: \today}
\authorbox{
\begin{tabularx}{.7\linewidth}{ll}
  Author:&Max Mustermann\\
	    &Musterstrasse 123\\
			&12345 Musterstadt\\
	\\
  Examiner:&Prof. Dr. Stefan Eicker\\
	         &Prof. Dr. John Doe\\
	\\
	Supervisor:&Dipl.-Wirt.-Inf Some Body\\
	\\
\end{tabularx}	
}
\fi

\ifprimaryDocumentLanguageGerman
	\def\@documentLanguage{english,ngerman}         % all used languages, primary LAST
\else
	\def\@documentLanguage{ngerman,english}
\fi


\def\udesoftec@templateTitlePageBackground{udesoftec-cover-ude-de}

\ifprimaryDocumentLanguageGerman
\else
  \def\udesoftec@templateTitlePageBackground{udesoftec-cover-ude-en}
\fi

\iftemplateVawiBamberg
	\def\udesoftec@templateTitlePageBackground{udesoftec-cover-uba}
\fi

\iftemplateVawiEssen
	\institution{Im Virtuellen Weiterbildungsstudiengang Wirtschaftsinformatik\par der Universit\"at Duisburg-Essen}
    \labelPreTopic{}
\fi
\iftemplateVawiBamberg
	\institution{Im Virtuellen Weiterbildungsstudiengang Wirtschaftsinformatik}
    \labelPreTopic{}
\fi

\iftemplateUseBookLayout
	\KOMAoptions{twoside=true} 
\else
	\KOMAoptions{twoside=false}
\fi

%%%% xcolor %%%%%%%%%%
% purpose: define some color names
\usepackage[svgnames]{xcolor}
%%%%%%%%%%%%%%%%%%%%%%
%%%% customcolors %%%%
% purpose: have every color defined in one place
% special: color1!percent!color2 mixes two colors (easier as pseudo-names or rgb)
%          percent * color1 + (100-percent) * color2
\definecolor{UDEblue}{RGB/cmyk}{0,76,147/1,.68,0,.12}
\definecolor{UDEbeige}{RGB/cmyk}{239,228,191/0,.03,.19,.06}
\definecolor{UDEbrightblue}{RGB/cmyk}{223,228,242/.15,.09,0,0}

\definecolor{UDEcustombrightbeige}{RGB}{255,249,229}
\definecolor{UDEcustombrightblue}{RGB}{229,236,255}
\definecolor{UDEcustommediumgreen}{RGB}{200,229,185}
\definecolor{UDEcustombrightgreen}{RGB}{238,255,229}
\definecolor{UDEcustomediumorange}{RGB}{200,229,185}
\definecolor{UDEcustombrightorange}{RGB}{255,249,229}
\definecolor{UDEcustombrightgray}{RGB}{244,244,244}
\definecolor{UDEcustommediumgray}{RGB}{159,159,189}
\definecolor{UDEcustomdarkgray}{RGB}{74,74,74}

\colorlet{UDEVariantsDarkBlue}{UDEblue}
\colorlet{UDEVariantsMediumBlue}{UDEblue!50!UDEbrightblue}
\colorlet{UDEVariantsBrightBlue}{UDEbrightblue}
\colorlet{UDEVariantsDarkBeige}{UDEbeige}
\colorlet{UDEVariantsMediumBeige}{UDEbeige}
\colorlet{UDEVariantsBrightBeige}{UDEcustombrightbeige}
\colorlet{UDEVariantsMediumGreen}{UDEcustommediumgreen}
\colorlet{UDEVariantsBrightGreen}{UDEcustombrightgreen}
\colorlet{UDEVariantsMediumOrange}{UDEcustomediumorange}
\colorlet{UDEVariantsBrightOrange}{UDEcustombrightgreen}

\colorlet{DocumentDark0}{UDEcustomdarkgray}
\colorlet{DocumentMedium0}{UDEcustommediumgray}
\colorlet{DocumentBright0}{UDEcustombrightgray}

\colorlet{DocumentDark1}{UDEVariantsDarkBlue}
\colorlet{DocumentMedium1}{UDEVariantsMediumBlue}
\colorlet{DocumentBright1}{UDEVariantsBrightBlue}

\colorlet{DocumentDark2}{UDEVariantsDarkBeige}
\colorlet{DocumentMedium2}{UDEVariantsMediumBeige}
\colorlet{DocumentBright2}{UDEVariantsBrightBeige}

\colorlet{DocumentMedium3}{UDEVariantsMediumBeige}
\colorlet{DocumentBright3}{UDEVariantsBrightGreen}

\colorlet{DocumentMedium4}{UDEVariantsMediumOrange}
\colorlet{DocumentBright4}{UDEVariantsBrightOrange}


\colorlet{allchaptercolor}{black}

		
\colorlet{listingBackground}{white!50!UDEbeige}
\colorlet{documentTitle}{black}
\colorlet{parExample}{UDEbrightblue} 	

\colorlet{chapter}{allchaptercolor} 				% for all chapters, toc etc 
\colorlet{section}{allchaptercolor} 				% for all chapters, toc etc 
\colorlet{subsection}{allchaptercolor} 				% for all chapters, toc etc 

\colorlet{ChapterHeadingBigChapterNumber}{allchaptercolor}		% for the special chapter title page design
\colorlet{ChapterHeadingSmallChapterNumer}{allchaptercolor}		% for the special chapter title page design
\colorlet{ChapterHeadingSeperatorLine}{allchaptercolor}		% for the special chapter title page design
\colorlet{Todo}{orange!30!white}									%default color for todo notes
\colorlet{Headsepline}{UDEblue} 						% seperator between header and text body
\colorlet{PagemarkBackground}{UDEblue}
\colorlet{PagemarkText}{white}										% page number color
\colorlet{HeadmarkText}{black}				% textcolor of header text (chapters, sections)
\colorlet{Good}{DarkGreen}										% page number color
\colorlet{Bad}{DarkRed}				% textcolor of header text (chapters, sections)

\iftemplateUseColorfulLinks
	\colorlet{LinkExternal} {black!75!green}				% URLs in text and bibliography
	\colorlet{LinkDoi} {black!75!green}										% links to doi in bibliography
	\colorlet{LinkInternal} {black!30!UDEblue} 			% internal links are from TOC or references in text
	\colorlet{LinkBibliography} {black!30!UDEblue} 	% links in citation
	\colorlet{LinkAnchor} {black} 								% not used
\else
	\colorlet{LinkExternal}{black}				% URLs in text and bibliography
	\colorlet{LinkDoi}{black}										% links to doi in bibliography
	\colorlet{LinkInternal}{black} 			% internal links are from TOC or references in text
	\colorlet{LinkBibliography}{black!30!UDEblue} 	% links in citation
	\colorlet{LinkAnchor}{black} 								% not used
\fi



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
% http://www.golatex.de/nummerierung-der-fussnoten-durchgehend-im-gesamten-dokument-t2042.html
% change counters for figures, footnotes, etc
\usepackage{chngcntr} 
\counterwithout{footnote}{chapter} % count footnotes for whole document, not per chapter

%%%% l18n %%%%%%%%%%%%% 
% purpose: localization and utf-8 config
% babel has primary language last
\usepackage[\@documentLanguage]{babel}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{hyphenat}  % helps with \nohyphens command, which allows to remove hypens from quotes.
%%%%%%%%%%%%%%%%%%%%%%



%%%% helvet %%%%%%%%%%
% purpose: use helvetica
% special load font before fontenc!
\iftemplateUseSansSerifFont
	\usepackage[scaled]{helvet}
	\renewcommand*\familydefault{\sfdefault}
\else
	\usepackage{lmodern} 
	\renewcommand*\familydefault{\rmdefault}
% KOMAfont Definitionen: caption captionlabel chapter chapterentry chapterentrypagenumber chapterentry chapterprefix dictum dictumauthor dictumtext  disposition footnote footnotelabel footnotereference footnoterule labelinglabel labelingseparator  minisec pagefoot pagehead pageheadfoot pagenumber pagination paragraph  part partentry partentrypagenumber partentry partnumber section sectionentry sectionentrypagenumber sectionentry sectioning subject subparagraph subsection subsubsection subtitle title
\fi
	\setkomafont{descriptionlabel}{\normalfont\bfseries}
	\setkomafont{dictumtext}{\normalfont\normalcolor\small}
	\setkomafont{disposition}{\normalfont\normalcolor\bfseries}
	\setkomafont{caption}{\normalfont\normalcolor\scriptsize}
%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%
%%%% setspacing %%%%%%
% purpose: give options for changing line spacing \doublespacing, \singlespacing, 
%          \onehalfspacing
\usepackage[onehalfspacing]{setspace}
%%%%%%%%%%%%%%%%%%%%%%
%
%%%% setspacing %%%%%%
 %special: novbox in order for tabularx to get correct width
%\ifdocumentIsFinal
%\else
%\usepackage[novbox]{pdfsync}
%\fi
%%%%%%%%%%%%%%%%%%%%%%

%%%% microtype %%%%%%
% purpose: character protrusion (also known as margin kerning) and font expansion 
% purpose-de: optischen Randausgleich verwenden. Beispiele siehe Paket-Doku% source: http://www.ctan.org/pkg/microtype
\usepackage{microtype} 
%%%%%%%%%%%%%%%%%%%%%%


%%%% graphicx %%%%%%%%
% purpose: allows better graphics import
% special: if we just dont use DeclareGraphicsExtensions and have folders for eps and pdf
%          Latex2dvi will always use eps and Latex2pdf always pdf
\usepackage[pdftex]{graphicx}%
\graphicspath{{Images/pdf/}}
%%%%%%%%%%%%%%%%%%%%%%


%%%% footmisc %%%%%%%%
% purpose: repair footnote indent - first line and second line should start with same space
\usepackage[marginal]{footmisc}
%%%%%%%%%%%%%%%%%%%%%%

%%%% floatbarrier %%%%
% purpose: keep images, tables and other floating stuff in the same section
%
\usepackage[section]{placeins}
%%%%%%%%%%%%%%%%%%%%%%

%%%% tabularx %%%%%%%%
% purpose: Tabularx berechnet in dem Fall drei gleich breite Spalten so, dass die Tabelle insgesamt
%          die Breite textwidth einnimmt. RaggedRight setzt das ganze dann im Flattersatz mit
%          Silbentrennung. Definiert man neue Spaltentypen, so benötigt man den Befehl arraybackslash
%          damit der \\-Befehl zum Beenden der Zeile funktioniert (ganz genau weiß ich's aber auch
%          nicht).
% source:  http://mrunix.de/forums/showthread.php?t=56679
\usepackage{ragged2e, tabularx}
%\usepackage{tabularx}
%\newcolumntype{Y}{>{\RaggedRight\arraybackslash}X}
%%%%%%%%%%%%%%%%%%%%%%



\usepackage{enumitem}
%\def \breaklabel{\ClassWarning{udesoftec}{\\breaklabel deprecated use "style=newline"}}

%%% natbib %%%%%%%%%%
% purpose: real cite options (in parentheses, out of parentheses, suppressing author etc)
\usepackage[elide]{natbib}	
%%%%%%%%%%%%%%%%%%%%%

%%% bibstyleconf %%%%
% based on: natbib plainnat
% purpose:  plainnat-peet changes natbib plainnat for using \bbland with cite instead of 
%           fixed string and changes authors in bibliography to "ll, f; ll, f; ll, f"'
\bibpunct{(}{)}{;}{a}{}{}{} 
\newcommand*{\doi}[1]{\href{http://dx.doi.org/#1}{\color{LinkDoi}doi:\detokenize{#1}}} %use real doi links with doi:<num> as label
\newcommand{\bblisbn}[1]{\small{ISBN:\mbox{#1}}}
\newcommand{\bblissn}[1]{\small{ISSN:\mbox{#1}}}
\newcommand{\bbland}{\& }
\newcommand{\bblAuthorYearSep}{ } % possible to add \newline 
\newcommand{\bblAuthorTitleSep}{: } % possible to add \newline 
\newcommand{\bblAuthorTitleSepInEd}{: }
\providecaptionname{ngerman}{\bblin}{In: }%
\providecaptionname{english}{\bblin}{In: }%
\providecaptionname{ngerman}{\bbled}{~(Hrsg.)}%
\providecaptionname{english}{\bbled}{~(Ed.)}%
\providecaptionname{ngerman}{\bbleds}{~(Hrsg.)}%
\providecaptionname{english}{\bbleds}{~(Eds.)}%
\providecaptionname{ngerman}{\bbledn}{~Aufl.}%
\providecaptionname{english}{\bbledn}{~edn}%
\providecaptionname{ngerman}{\bbletal}{et~al.}%
\providecaptionname{english}{\bbletal}{et~al.}%
\providecaptionname{ngerman}{\bblpp}{S.~}%
\providecaptionname{english}{\bblpp}{pp.}%
\providecaptionname{ngerman}{\bblp}{S.~}%
\providecaptionname{english}{\bblp}{p.~}%
\providecaptionname{ngerman}{\bblvol}{Nr.}%
\providecaptionname{english}{\bblvol}{No}%
\providecaptionname{ngerman}{\bblof}{von}%
\providecaptionname{english}{\bblof}{of}%
\providecaptionname{ngerman}{\bblnoyear}{o.J.}%
\providecaptionname{english}{\bblnoyear}{n.d.}%
\providecaptionname{ngerman}{\bblnoyearlong}{ohne Jahresangabe}%
\providecaptionname{english}{\bblnoyearlong}{no date}%
\providecaptionname{ngerman}{\bbllastaccesswas}{Zuletzt geprüft: }%
\providecaptionname{english}{\bbllastaccesswas}{Last checked: }%

\renewcommand*{\bibfont}{\raggedright}
\newcommand{\bblurldate}[1]{ (\bbllastaccesswas #1)}
\newcommand{\bblVolumeOfSeries}[2]{ (#2~#1)}
\newcommand{\bblSeries}[1]{ (#1)}
\newcommand{\bblFontAuthorInText}[1]{\nohyphens{\textsc{#1}}}
\newcommand{\bblFontAuthorInList}[1]{\textbf{#1}}
\newcommand{\bblFontYearInList}[1]{\textbf{(#1)}}
\newcommand{\bblFontBookTitle}[1]{\emph{#1}}
\newcommand{\bblFontInBookTitle}[1]{#1}
\newcommand{\bblFontJournalTitle}[1]{#1}
\newcommand{\bblWarning}[2]{
	\message{LaTeX Warning: Error with citation of #2 -- #1 }%
	\textbf{\emph{\color{red}{BibError: #2 -- #1}}}%
}
%\renewcommand{\bblWarning}[1]{} %for production
\newcommand{\bblyear}[1]{\ifnumber{#1}{#1}{\bblnoyear}}

\newcommand{\bbledGenerateEdition}[1]{\ifnumber{#1}{\bbledOrdinal{#1}~\bbledn}{#1}}

\newcommand*{\englishordinal}[1]{\ifcase #1\or 1\textsuperscript{st}\or 2\textsuperscript{nd}\or 3\textsuperscript{rd}\else #1\textsuperscript{th}\fi}
\newcommand*{\germanordinal}[1]{#1.}
\iflanguage{ngerman}{%
	\newcommand*{\bbledOrdinal}[1]{\germanordinal{#1}}
}{%
	\newcommand*{\bbledOrdinal}[1]{\englishordinal{#1}}
}

%http://www.tug.org/applications/hyperref/manual.html#TBL-23
%evtl mit \addto\extrasngerman{%  
  %\def\subsectionautorefname{Unterkapitel}%  
%}

\setlength{\bibhang} {2em} %hanging indentation for list of references
\setlength{\bibsep} {.5em} %vertical sep between bibitems in list of references
%\renewcommand{\bibfont}{\small}
%\renewcommand{\bibfont}{\sc}
%%%%%%%%%%%%%%%%%%%%%

%http://tex.stackexchange.com/questions/9325/bump-right-aligned-text-to-next-line-if-no-room
\newcommand\putRightIfRoom[1]{{%
  \leftskip=0ptplus1fil\rightskip=-\leftskip\parfillskip=\leftskip%
  \hfill \phantom{ } \mbox{#1}\par}}

\newcommand{\inquotequote}[1]{\glq{}#1\grq{}}
\newcommand{\blockquote}[3][]{
\message{LaTeX Warning: \noexpand\blockquote is deprecated, use \noexpand\citequotepar on input line \the\inputlineno }
\citequotepar[#1]{#2}{#3}
}
\newcommand{\intextquote}[3][]{
\message{LaTeX Warning: \noexpand\intextquote is deprecated, use \noexpand\citequote on input line \the\inputlineno }
\citequote[#1]{#2}{#3}}
\newcommand{\inlinequote}[3][]{
\message{LaTeX Warning: \noexpand\intextquote is deprecated, use \noexpand\citequote on input line \the\inputlineno }
\citequote[#1]{#2}{#3}}
\newcommand{\citequote}[3][]{\glqq#3\grqq \ \cite[#1]{#2}}
\newcommand{\citequotehidden}[3][]{\cite[#1]{#2}}
\newcommand{\citetquotehidden}[3][]{\citet[#1]{#2}}

% !Mode:: "TeX:UTF-8"
%%%% todonotes %%%%%%%
% purpose: get (orange) todo comments in text or in margin
% use option "disable" to disable the complete packages (leaving all commands intact, just removing output)
\usepackage[
ngerman,
textsize=scriptsize,
backgroundcolor=DocumentBright1,
bordercolor=DocumentMedium1,
linecolor=DocumentBright1,
colorinlistoftodos
]{todonotes}%
%% alternative for deactivation:
%\newcommand*{\todo}[2][]{}
%\newcommand*{\listoftodos}[1][]{}
%\newcommand*{\missingfigure}[2][]{}


\ifdocumentOmitTodos
	\renewcommand{\listoftodos}{}
	\renewcommand{\todo}[2][]{}
	\newcommand*{\todoDesign}[1]{}
	\newcommand*{\todoText}[1]{}
	\newcommand*{\todoFigure}[1]{}
    \newcommand*{\inlinetodo}[1]{}
    \newcommand*{\todoinline}[1]{}
\else
	\let\defaultTodo\todo
	\renewcommand{\todo}[1]{%
	  \documentUsedTodostrue%
		\defaultTodo[]{#1}%
	}
	\newcommand*{\todoDesign}[1]{%
	  \documentUsedTodostrue%
		\defaultTodo[fancyline,backgroundcolor=DocumentBright2]{#1}%
	}
	\newcommand*{\todoText}[1]{%
	  \documentUsedTodostrue%
		\defaultTodo[fancyline,backgroundcolor=DocumentBright3]{#1}%
	}
	\newcommand*{\todoFigure}[1]{%
	  \documentUsedTodostrue%
		\defaultTodo[fancyline,backgroundcolor=DocumentBright4]{#1}%
	}
	\newcommand{\inlinetodo}[1]{\documentUsedTodostrue\defaultTodo[inline]{#1}}
	\newcommand{\todoinline}[1]{\inlinetodo{#1}}

	\let\defaultListoftodos\listoftodos
	\renewcommand{\listoftodos}{
		\let\originalHbadness\hbadness
		\hbadness 100000
		\defaultListoftodos
		\hbadness \originalHbadness
	}
\fi
% !Mode:: "TeX:UTF-8"

%%%% chapterdesign %%%
\usepackage{type1cm}
\usepackage{fix-cm}
\addtokomafont{chapter}{\color{chapter}}
\addtokomafont{sectioning}{\color{section}}
\addtokomafont{subsubsection}{\color{subsection}}
%have a section level which doesn't use numbers never and will work no matter how deep secnum is.
\newcommand{\unnumberedsection}[1]{%
\subparagraph{#1}\hspace{0cm}\\%
}
% Chapter-Numbering for 4 levels, i.e. PART B Chapter 5.7.3.1; in order to have unnumbered headings use \paragraph{}
\setcounter{secnumdepth}{3} 
\setcounter{tocdepth}{3}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% purpose: have some nice chapter headings (big number, lines and so on)
% we need type1cm and cm-super for the bigger fonts - else there would be warnings
% source: https://groups.google.com/forum/#!msg/de.comp.text.tex/rVcjvNQI6IA/N-NsfyQzXRwJ
\makeatletter% siehe De-TeX-FAQ
\renewcommand*{\chapterformat}{%
\begingroup% damit \unitlength-Aenderung lokal bleibt
\setlength{\unitlength}{1mm}%
\begin{picture}(20,40)(0,5)%
\setlength{\fboxsep}{0pt}%
%\put(0,0){\framebox(20,30){}}%
%\put(0,20){\makebox(20,20){\rule{20\unitlength}{20\unitlength}}}%
\put(20,15){\color{ChapterHeadingSeperatorLine}\line(1,0){\dimexpr
\textwidth-20\unitlength\relax\@gobble}}%
\put(-6,2.5){\makebox(20,20)[r]{%
\fontsize{23\unitlength}{28\unitlength}\selectfont\color{ChapterHeadingBigChapterNumber}\thechapter
%\kern-.04em% Ziffer in der Zeichenzelle nach rechts schieben
}}%
\put(20,15){\makebox(\dimexpr
\textwidth-20\unitlength\relax\@gobble,\ht\strutbox\@gobble)[l]{%
\ifdefined\chapterAuthor
\ \normalsize\color{ChapterHeadingSmallChapterNumer}\chapterAuthor\autodot
\else
%\ \normalsize\color{ChapterHeadingSmallChapterNumer}\chapapp~\thechapter\autodot
\ \normalsize\color{ChapterHeadingSmallChapterNumer}\chapapp~\autodot
\fi
}}%
\end{picture} % <-- Leerzeichen ist hier beabsichtigt!
\endgroup
}
%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\headfont}{\normalfont\small\color{HeadmarkText}} % header text should be small
\renewcommand{\pnumfont}{\normalfont\small\color{PagemarkText}} % pagenumber is in header and should be small too

%%%% scrpage2 %%%%%%%%
% purpose: customize page styles (header, footer)
\usepackage{scrpage2}% 
% default page behaviour: header has line, chap.section left; page right
\pagestyle{scrheadings}
\clearscrheadings
\clearscrplain
\clearscrheadfoot
% change color of headsepline
\addtokomafont{headsepline}{\color{Headsepline}}
\setheadsepline{.4pt}%{\color{Headsepline}}

% create headermarks so the chapter is shown on left page and section on right


% new pagestyle "chapter": pagenumber top outer, no line no headmark
\iftemplateUseBookLayout
		\ihead[\headmark]{\headmark}
		% clear outer head (where the normale pagemark is in)
		\ohead[]{}
		% add pageMark boxes to leftpage lefthead and rightpage righthead (pagemark box needs to know "r" or "l"
		\rohead[]{\pagemarkBox{\pagemark}{r}}
		\lehead[]{\pagemarkBox{\pagemark}{l}}

		\classdebug{using headline for booklayout}
		\automark[section]{chapter}
		\defpagestyle{chapter}{
		(0pt,0pt)
			{\pagemarkBox{\pagemark}{l}\hfill}
		{\hfill\pagemarkBox{\pagemark}{r}}
			{\pagemarkBox{\pagemark}{r}\hfill}
		(0pt,0pt)
		}{{}{}{}}
\else
		\ihead[]{}
		\ohead[]{}
		\lehead[\headmark]{\headmark}
		\rehead[]{\pagemarkBox{\pagemark}{r}}
		\lohead[\headmark]{\headmark}
		\rohead[]{\pagemarkBox{\pagemark}{r}}
		\classdebug{using headline for screenlayout}
		\automark[chapter]{chapter}
		\defpagestyle{chapter}{
		(0pt,0pt)
			{\hfill\pagemarkBox{\pagemark}{r}}
		{\hfill\pagemarkBox{\pagemark}{r}}
			{\hfill\pagemarkBox{\pagemark}{r}}
		(0pt,0pt)
		}{{}{}{}}
\fi
% custom page behavior for title, part and chapter
\renewcommand*{\titlepagestyle}{empty}
\renewcommand*{\partpagestyle}{empty}
\renewcommand*{\chapterpagestyle}{chapter}
%%%%%%%%%%%%%%%%%%%%%%

%%%% custom pagemark %%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\pagemarkBox}[2] {	
  % the picture has height 0 to change clipping behavior, else the clipping box might be higher than the text line
	\begin{picture}(50,0) 
	\put(-.55,-5.05) {
		\put(-2.8,.3){%these relate box to text
		\color{PagemarkBackground}\rule{56.7pt}{16pt}}%
		\put(5,1){%these relate box to text
		\makebox(40,16)[#2]{\textcolor{PagemarkText}\udesoftec@templatePageMarkPrefix\fontseries{b}\fontshape{n}\selectfont #1}}%
		}
	\end{picture}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%% page layout %%%%%
% purpose: set page margins, textbody size etc
% usage:   typearea[BCOR]{DIV}
%          DIV is auto-calculation of all margins in depencedy of font size
% 				 10pt = DIV 8;11pt = DIV 10;12pt = DIV 12
%	         BCOR is additional inner margin (binding correction)
% special: BCOR adds inner margin and reduces text space. As the default margin sum seems fine we use geometry instead
%          to adjust for regular printing (e.g. use in a folder), see below "geometry"
\usepackage[includehead=false,includefoot=false]{geometry}
\iftemplateUseBookLayout
        \KOMAoptions{BCOR=12mm,DIV=calc} % for helvetica	
\else
	\KOMAoptions{BCOR=0mm,DIV=calc} % for helvetica	
\fi

\renewcommand*\chapterheadstartvskip{} 


\usepackage{wallpaper}
\newcommand{\udesoftecmaketitle} {
	
		\newgeometry{bottom=1cm, inner=0cm,outer=0cm,top=4cm}
	
  \begin{titlepage}
			\begin{center}
				\ThisCenterWallPaper{1}{\udesoftec@templateTitlePageBackground}
				\vspace*{30pt}
					\begin{minipage}[30em]{.7\linewidth}
						\begin{center}
							\Large\udesoftec@typeofdoc\normalsize

							\udesoftec@labelPreTopic
							
							{\color{documentTitle}\Huge\singlespacing\textbf{\@title}\par}
							{\color{documentTitle}\huge\singlespacing\textbf{\@subtitle}\par}			
							\vspace*{20pt}				
							{\color{documentTitle}\large\singlespacing\textbf{\udesoftec@entitle}\par}
							
							\vspace*{50pt}
								
							\large\udesoftec@institution
						\end{center}
					\end{minipage}
								\vfill
				
							
				\begin{minipage}{.7\linewidth}
					\begin{center}
					\ifdocumentOmitCC
                    \else
                    
                    \udesoftec@labelRespectConfidentiality
                    
					\fi				
						\vspace*{20pt}\Large\@date
					\end{center}
					\vspace*{30pt}
				\end{minipage}
				\udesoftec@authorbox
				\begin{minipage}{.7\linewidth}
					\begin{center}
								
					\vspace*{40pt}
					\large\udesoftec@semester 
					\end{center}
				\end{minipage}%
			\end{center}%
\end{titlepage}%
		\restoregeometry
	}

	\newcommand{\udesoftecvawibambergmaketitle}{

		\newgeometry{bottom=1cm, left=2cm,right=1cm,top=4cm}
		
  \begin{titlepage}
			\begin{center}
				\ThisCenterWallPaper{1}{\udesoftec@templateTitlePageBackground}
				\vspace*{0pt}
					\begin{minipage}[30em]{.7\linewidth}
						\begin{center}

							
							{\color{documentTitle}\Huge\singlespacing\textbf{\@title}\par}
							{\color{documentTitle}\huge\singlespacing\textbf{\@subtitle}\par}			
							\vspace*{20pt}				
							{\color{documentTitle}\large\singlespacing\textbf{\udesoftec@entitle}\par}
							
							\vspace*{50pt}
							\hrule
							\vspace*{20pt}
								\Large\textbf{\udesoftec@typeofdoc}\normalsize
							
							\large\udesoftec@institution
						
							\vspace*{20pt}
							\hrule
							\vspace*{20pt}
							\end{center}
					\end{minipage}
								\vfill
				
							
				\begin{minipage}{.7\linewidth}
					\begin{center}
					\ifdocumentOmitCC
                    \else
                    
                    \udesoftec@labelRespectConfidentiality
                    
					\fi
						\vspace*{15pt}\Large\@date
					\end{center}
					\vspace*{20pt}
				\end{minipage}
				\udesoftec@authorbox
				\begin{minipage}{.7\linewidth}
					\begin{center}
								
					\vspace{20pt}
					\large\udesoftec@semester 
					\vspace{20pt}
					\end{center}%
				\end{minipage}%
			\end{center}%
  \end{titlepage}%
		\restoregeometry
}


\renewcommand{\maketitle}{\udesoftecmaketitle}
\iftemplateVawiBamberg
    \renewcommand{\maketitle}{\udesoftecvawibambergmaketitle}
\fi
\let\oldmaketitle\maketitle

\renewcommand{\maketitle}{
	\let\oldhbadness\hbadness
	\let\oldvbadness\vbadness
	\hbadness=10000
	\vbadness=10000
	\oldmaketitle
	\let\hbadness\oldhbadness
	\let\vbadness\oldvbadness
}


% !Mode:: "TeX:UTF-8"
% special: don't change marginpar, else it will create overfuls with package todonotes
\usepackage{marginnote}
\ifx\marginfont\undefined
	\newcommand{\marginfont}[1]{}
	\newcommand{\marginnote}[2][]{\marginpar[#1]{#2}}
\fi


\renewcommand*{\marginfont}[1]{\scriptsize#1}

\newcommand*{\marginalText}[2][]{
\message{LaTeX Warning: \noexpand\marginalText is deprecated, use \noexpand\marginnote on input line \the\inputlineno }
\marginnote[#1]{#2}
}
\renewcommand*{\marginline}[2][]{
\message{LaTeX Warning: \noexpand\marginline is deprecated, use \noexpand\marginnote on input line \the\inputlineno }
\marginnote[#1]{#2}
}

\newcommand{\chapterWithoutPageBreak}[1]{
\let\backupchapterskip\chapterheadstartvskip%
\renewcommand*\chapterheadstartvskip{\vspace*{-.4\topskip}}%
\global\@topnum\z@\@afterindentfalse\secdef\@chapter\@schapter*{#1}
\let\chapterheadstartvskip\backupchapterskip%
}

\newcommand{\ignoreHbadness}[1]{%
  \let\originalHbadness\hbadness%
	\hbadness 100000%
	#1
	\hbadness \originalHbadness%
}

\renewcommand{\figurename}{Abb.}
\newcommand{\figref}[1]{\autoref{fig:#1}}



\newcommand{\eng}[1]{engl.: \emph{\english{#1}}}
\newcommand{\entode}[1]{engl. für \emph{\english{#1}}}
\newcommand{\english}[1]{\foreignlanguage{english}{#1}}

\newcommand{\good}[1]{\textcolor{Good}{#1}}
\newcommand{\bad}[1]{\textcolor{Bad}{#1}}

%%%%%%%%%%%%%%%%
% allow footnotes in minipage
% from http://stackoverflow.com/questions/3126082/store-a-text-string-in-latex-and-then-add-other-text-to-it-concatenate
% by David Underhill
\newcounter{footnotesinthisminipage}
\stepcounter{footnotesinthisminipage}\addtocounter{footnotesinthisminipage}{-1} % initialize counter to avoid errors
\newcommand{\footnoteNumberInMinipage}{\stepcounter{footnotesinthisminipage}\stepcounter{footnote}\footnotemark[\value{footnote}]}
\newcommand{\footnoteTextAfterMinipage}[1]{%
\addtocounter{footnotesinthisminipage}{-1}%decrease 
\addtocounter{footnote}{-\value{footnotesinthisminipage}}%set footnote counter backwards for the number of footnotes
\footnotetext[\value{footnote}]{#1}%output footnotetext
\addtocounter{footnote}{\value{footnotesinthisminipage}}%reset footnote counter to real value
}%
\newcommand{\footnoteCmdForInsideMinipage}[1]{%
\ClassError{udesoftec}{Warning: \protect\footnote\space in minipages not implemented, use \protect\footnoteNumberInMinipage and \protect\footnoteTextAfterMinipage instead}%
%\footnoteNumberInMinipage
%\let\executeThisAfterEndOfMinipage aloa
}%


%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DEMO AND TESTING AREA HERE
%%%%%%%%%%%%%%%%%%%%%%%%%
% have quote boxes with big quotation marks
% big quotation marks based on, reduced code and used mdframed
% http://tex.stackexchange.com/questions/16964/block-quote-with-big-quotation-marks
\usepackage{tikz}
\usepackage{mdframed}
\usepackage{libertine} % or any other font package
\newcommand*\quotefont{\fontfamily{LinuxLibertineT-LF}} % selects Libertine as the quote font
\newcommand*\quotesize{60} % if quote size changes, need a way to make shifts relative
% Make commands for the quotes
\newcommand*{\openquote}
   {\tikz[remember picture,overlay,xshift=-4ex,yshift=-.5]
   \node (OQ) {\quotefont\fontsize{\quotesize}{\quotesize}\selectfont\glqq};\kern0pt}
\newcommand*{\closequote}
  {\tikz[remember picture,overlay,xshift=4ex,yshift=2ex]
   \node (CQ) {\quotefont\fontsize{\quotesize}{\quotesize}\selectfont\grqq};}

\newenvironment{quoteBox}{%
\mdfsetup{%
innertopmargin=2ex,%
backgroundcolor=DocumentBright2,%
linecolor=DocumentMedium2,%
linewidth=.5pt,
nobreak=true,
}\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}
\begin{mdframed}\begin{quote}%
\openquote%
}{
\closequote%
\end{quote}\end{mdframed}%
}

\newcommand{\citequotepar}[3][]
{%
\begin{quoteBox}
\sloppy{\small\nohyphens{#3}}%
\par\hfill\small\cite[#1]{#2}%
\end{quoteBox}%
}

\newenvironment{exampleBox}[1][]{%
\mdfsetup{%
frametitle={%
\tikz[baseline=(current bounding box.east),outer sep=0pt]
\node[anchor=east,rectangle,draw=DocumentMedium1,line width=.5pt,fill=DocumentBright1,]
{\strut #1};}%
}%
\mdfsetup{innertopmargin=.5em,linecolor=DocumentMedium1,%
backgroundcolor=DocumentBright1,%
linewidth=.5pt,topline=true,
frametitleaboveskip=\dimexpr-\ht\strutbox\relax,}
\begin{mdframed}%
}{\end{mdframed}}

\newcommand{\parExample}[2][!]{%
\ifx!#1{
\parExampleWithHeading{Beispiel:}{#2}
}\else{
\parExampleWithHeading{Beispiel für #1:}{#2}
}\fi
}
\newcommand{\parExampleWithHeading}[2]{%
	\let\defaultCmdFootnote\footnote%
	\let\footnote\footnoteCmdForInsideMinipage%
  \begin{exampleBox}[#1]%
	\small{#2}%
	\end{exampleBox}%
	\let\footnote\defaultCmdFootnote%
}


%%%%%%%%%%%%%%%%
\usepackage{verbatim}
\usepackage{multicol}
\usepackage{listings}
\usepackage[listings]{scrhack} 
\lstset{%
frame=single,%
basicstyle=\scriptsize,%
breaklines=true,%
backgroundcolor=\color{DocumentBright0},%
rulecolor=\color{DocumentMedium0},%
keywordstyle=\color{DocumentDark1},
stringstyle=\color{DocumentDark2},
commentstyle=\color{DocumentMedium0}
}
%add support for german utf-8 umlauts:
% source: http://stackoverflow.com/questions/1116266/listings-in-latex-with-utf-8-or-at-least-german-umlauts
\lstset{
  literate={ö}{{\"o}}1
           {ä}{{\"a}}1
           {ü}{{\"u}}1
           {Ä}{{\"A}}1
           {Ö}{{\"O}}1
           {Ü}{{\"U}}1
           {ß}{{\ss}}1
}


\newcommand{\ctanlink}[1]{\href{http://www.ctan.org/pkg/#1}{#1}}



%%%% hyperref %%%%%%%%
%% special: hyperref needs to be loaded last! (exception hycap)
%% purpose: make internal and external links working and colored
\usepackage[colorlinks=true,
						linkcolor=LinkInternal,
						anchorcolor=LinkAnchor,
						citecolor=LinkBibliography,
						filecolor=LinkExternal,
						urlcolor=LinkExternal,
						hyperindex,linktoc=section,pdfstartview=FitV,plainpages=false,
                        pdfpagelabels,pdftex,
bookmarks=true,bookmarksopen=true,bookmarksopenlevel=1,bookmarksnumbered=true]{hyperref}%
\AtBeginDocument{\def\subsectionautorefname{\sectionautorefname}}
\AtBeginDocument{\def\subsubsectionautorefname{\sectionautorefname}}
% change url font type to "inherit"
\renewcommand\UrlFont{\color{LinkExternal}}
%%%%%%%%%%%%%%%%%%%%%%

%%%% hycap %%%%%%%%%%%
%% special: directly AFTER hyperref: 
%% purpose: links to figures and tables should link to top of figure and not to top of caption
%%					(which is below figure, so figure wouldn't show but only caption); no other change necessary
\usepackage[all]{hypcap}


%%%% glossary %%%%%%%%%
% for glossary and acronyms; instead of package acronym
% special: glossary after hyperref
% special:\AtEndDocument{\printglossary} before usepackage to suppress warning of missing printglossary
%\usepackage[footnote,printonlyused]{acronym}
\AtEndDocument{\printglossary}
\usepackage[acronym,nonumberlist,section=chapter,toc]{glossaries}
\deftranslation[to=ngerman]{Acronyms}{Abkürzungsverzeichnis}
\deftranslation[to=ngerman]{Glossary}{Glossar}
\makeglossaries


\newcommand{\printacronyms}{%
\printglossary[type=\acronymtype,style=myAcronymStyle]%
}
\newcommand{\acr}[1]{\gls{#1}}

\newglossarystyle{myAcronymStyle}{%
% put the glossary in the itemize environment:
\renewenvironment{theglossary}{\begin{description}[leftmargin=1.5cm,style=sameline]}{\end{description}}%
% have nothing after \begin{theglossary}:
\renewcommand*{\glossaryheader}{}%
% have nothing between glossary groups:
\renewcommand*{\glsgroupheading}[1]{}%
\renewcommand*{\glsgroupskip}{}%
% set how each entry should appear:
\renewcommand*{\glossaryentryfield}[5]{%
\item[\glstarget{##1}{##2}]{##3}
}%
% set how sub-entries appear:
\renewcommand*{\glossarysubentryfield}[6]{%
\glossaryentryfield{##2}{##3}{##4}{##5}{##6}}%
}

\newcommand{\udesoftecoverride}{}
\AtBeginDocument{
    \udesoftecoverride
    \pagenumbering{alph}    % title page is "a" - internal trick to prevent two pages with same name
    \hypertarget{titlepage}{}
    \pdfbookmark[-1]{\@title}{titlepage}
    
    \maketitle                                                      % Komplett automatisch generiert anhand von Metadaten
    \cleardoublepage
    \pagenumbering{Roman}   % I,II,III,IV... - all pre-content pages are roman upper
	
    \ifdocumentOmitCC\else\cleardoublepage\confidentialityclause\fi%
    \ifdocumentOmitA\else\cleardoublepage\printabstract\fi%
    \ifdocumentOmitTOC\else\cleardoublepage
        \hypertarget{tocpage}{}
        \pdfbookmark{\contentsname}{topage}
        \tableofcontents
    \fi
    \ifdocumentOmitLOF\else\cleardoublepage\listoffigures\fi
    \ifdocumentOmitLOT\else\cleardoublepage\listoftables\fi
    \ifdocumentOmitLOA\else\cleardoublepage\printacronyms\fi
                
    \newlength{\imagewidth}
    \setlength\imagewidth\linewidth
}

\AtEndDocument{
    \ifdocumentUsedTodos
        \ifdocumentOmitTodos
        \else
            \listoftodos
        \fi
    \fi

    \ifdocumentOmitSD\else\statutorydeclaration\fi
}