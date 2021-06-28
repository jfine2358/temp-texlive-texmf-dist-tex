%%%  Version 0.42
%%%  This work is inspired by `Tabriz_thesis.cls' by Vahid Damanafshan,
%%%  `yazd-thesis.cls' by Vahid Damanafshan, `KNTU_thesis.cls' by Farschad Torabi, and 
%%%  `aut-thesis' by Vafa Khalighi. 
%%%   __________________________________
%%%
%%%   Copyright © 2017-2018 Seiied-Mohammad-Javad Razavian
%%%  
%%%   http://www.parsilatex.com  
%%%   __________________________________
%%%   
%%%  Change Log:
%%%  ver 0.42,  Nov 10th, 2018
%%%  logo is replaced by logo.jpg because of a conflict with ls-R databese.
%%%  ver 0.41,  Oct 15th, 2018
%%%  thesis-qom.pdf is now attached to the class documentation. 
%%%  ver 0.4,  Oct 12th, 2018
%%%  The new version is adapted with bidi ver 34.5 and bidi ver 21.6; in this new version extrafootnotefeatures have many extra features than to past, as a result there is no need to patch footnotes. 
%%%  ver 0.33,  Feb 4th, 2018
%%%  The style is called thesis-qom by know. 
%%%  ver 0.32,  Jan 2nd, 2018
%%%  After bidi ver 30.2 and xepersian ver 20.1 ther is no need so adjust text digit font in the style, 
%%%  because those packages do it as desirable. These updates happened in  January 1st, 2018. 
%%%  ver 0.31, Dec 17th, 2017 
%%%  some little change in toc style
%%%  ver 0.3, Dec 12th, 2017 
%%%  \listofsymbols macro is defined with the aid of Vahid Damanafshan. 
%%%  ver 0.29, Dec 11th, 2017 
%%%  scratch option replaced by final 
%%%  ver 0.28, Dec 11th, 2017  
%%%  Final improvement in setting digits' font to Yas font; it'll be done with the aid of some xetex interal macros. 
%%%  Thanks to Vafa Khalighi for his draft in doing such an action automatically. 
%%%  ver 0.27, Dec 10th, 2017  
%%%  Another improvement in sophisticated main matter page numbering.
%%%  ver 0.26, Dec 9th, 2017  
%%%  There is no neeed to \mainmatter macro, it'll be set automatically by some hacks. 
%%%  ver 0.25, Dec 6th, 2017  
%%%  some other improvement in en2fa dictionary. https://tex.stackexchange.com/questions/404984
%%%  ver 0.24, Dec 6th, 2017  
%%% definition of \lettergroup macro changed in coordination with style of fa2en dictionary . 
%%%  ver 0.23, Dec 5th, 2017  
%%%  scratch option causes the preamble pages not to show. Some improvement in dictionaries. 
%%%  ver 0.22, Dec 4th, 2017
%%%  some improvement in TOC. 
%%%  ver 0.21, Dec 3rd, 2017
%%%  adding \strut to \RTL and \LTR command, for solving http://qa.parsilatex.com/28105 by vafa khalighi. 
%%% Some improvement in dictionaries code. 
%%%  ver 0.2, Dec 3rd, 2017
%%%  Dictionary files are automatically read from the dicfa2en.tex and dicen2fa.tex. 
%%%  ver 0.1, Nov 12th, 2017
%%%  First Release

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\def\qom@thesis@date{2018/11/10}
\def\qom@thesis@version{0.42}
\ProvidesClass{thesis-qom}[%
    \qom@thesis@date\space version\qom@thesis@version\space
  University of  Qom thesis class%
]
\newif\if@qom@print
\newif\if@qom@index
\newif\if@qom@debug
\newif\if@qom@draft\@qom@drafttrue
\newif\if@qom@preamble \@qom@preambletrue
\newcount\qom@thesistype
\newcount\qom@thesis@supervisor
\newcount\qom@thesis@advisor
\newcount\qom@thesis@supervisor@english
\newcount\qom@thesis@advisor@english
\newcount\qom@thesis@referee@enternal
\newcount\qom@thesis@referee@external
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{xepersian}}
\DeclareOption{final}{\@qom@draftfalse\@qom@printfalse}
\DeclareOption{print}{\@qom@printtrue}
\DeclareOption{phd}{\qom@thesistype=\z@\relax} %default option 
\DeclareOption{ms}{\qom@thesistype=\@ne\relax}
\DeclareOption{bs}{\qom@thesistype=\tw@\relax}
\DeclareOption{index}{\@qom@indextrue}%
\DeclareOption{debug}{\@qom@debugtrue}%
\ProcessOptions\relax
\LoadClass[a4paper,12pt,openany, oneside]{book}
\RequirePackage{keyval}
\define@key{qomthesis}{نام و نام‌خانوادگی}{\def\@author@persian{#1}}
\define@key{qomthesis}{نام و نام خانوادگی}{\def\@author@persian{#1}}
\define@key{qomthesis}{نام و نام‌خانوادگي}{\def\@author@persian{#1}}
\define@key{qomthesis}{نام و نام خانوادگي}{\def\@author@persian{#1}}
\define@key{qomthesis}{شماره دانشجویی}{\def\@student@id{#1}}
\define@key{qomthesis}{شمارهٔ دانشجویی}{\def\@student@id{#1}}
\define@key{qomthesis}{شماره‌ی دانشجویی}{\def\@student@id{#1}}
\define@key{qomthesis}{شماره دانشجويي}{\def\@student@id{#1}}
\define@key{qomthesis}{شمارهٔ دانشجويي}{\def\@student@id{#1}}
\define@key{qomthesis}{شماره‌ي دانشجويي}{\def\@student@id{#1}}
\define@key{qomthesis}{author}{\def\@author@english{#1}}
\define@key{qomthesis}{عنوان}{\def\@title@persian{#1}}
\define@key{qomthesis}{title}{\def\@title@english{#1}}
\define@key{qomthesis}{دانشکده}{\def\@faculty{#1}}
\define@key{qomthesis}{گروه}{\def\@department{#1}}
\define@key{qomthesis}{رشته}{\def\@major{#1}}
\define@key{qomthesis}{گرایش}{\def\@field{#1}}
\define@key{qomthesis}{گرايش}{\def\@field{#1}}
\define@key{qomthesis}{تاریخ اتمام}{\def\@submissiondate{#1}}
\define@key{qomthesis}{تاريخ اتمام}{\def\@submissiondate{#1}}
\define@key{qomthesis}{faculty}{\def\@faculty@english{#1}}
\define@key{qomthesis}{department}{\def\@department@english{#1}}
\define@key{qomthesis}{major}{\def\@major@english{#1}}
\define@key{qomthesis}{field}{\def\@field@english{#1}}
\define@key{qomthesis}{submission date}{\def\@submissiondate@english{#1}}
\define@key{qomthesis}{تاریخ دفاع}{\def\@defensedate{#1}}
\define@key{qomthesis}{تاريخ دفاع}{\def\@defensedate{#1}}
%\define@key{qomthesis}{phd}     []{\qom@thesistype=\z@\relax}
%\define@key{qomthesis}{master}     []{\qom@thesistype=\@ne\relax}
%\define@key{qomthesis}{bachelor}     []{\qom@thesistype=\tw@\relax}
\define@key{qomthesis}{تعداد واحد}{\def\@credit{#1}}
\define@key{qomthesis}{نمره}{\def\@grade{#1}}
\define@key{qomthesis}{نمره به حروف}{\def\@grade@letters{#1}}
\define@key{qomthesis}{درجه}{\def\@degree{#1}}
\define@key{qomthesis}{استاد راهنمای اوّل}{\qom@thesis@supervisor=\@ne\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@first@supervisor@name@persian{\@name}\edef\@first@supervisor@rank@persian{\@rank}}
\define@key{qomthesis}{استاد راهنمای اول}{\qom@thesis@supervisor=\@ne\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@first@supervisor@name@persian{\@name}\edef\@first@supervisor@rank@persian{\@rank}}
\define@key{qomthesis}{استاد راهنماي اوّل}{\qom@thesis@supervisor=\@ne\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@first@supervisor@name@persian{\@name}\edef\@first@supervisor@rank@persian{\@rank}}
\define@key{qomthesis}{استاد راهنماي اول}{\qom@thesis@supervisor=\@ne\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@first@supervisor@name@persian{\@name}\edef\@first@supervisor@rank@persian{\@rank}}
\define@key{qomthesis}{first supervisor}{\qom@thesis@supervisor@english=\@ne\relax\def\@first@supervisor@name@english{#1}}
\define@key{qomthesis}{استاد راهنمای دوّم}{\qom@thesis@supervisor=\tw@\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@second@supervisor@name@persian{\@name}\edef\@second@supervisor@rank@persian{\@rank}}
\define@key{qomthesis}{استاد راهنمای دوم}{\qom@thesis@supervisor=\tw@\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@second@supervisor@name@persian{\@name}\edef\@second@supervisor@rank@persian{\@rank}}
\define@key{qomthesis}{استاد راهنماي دوّم}{\qom@thesis@supervisor=\tw@\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@second@supervisor@name@persian{\@name}\edef\@second@supervisor@rank@persian{\@rank}}
\define@key{qomthesis}{استاد راهنماي دوم}{\qom@thesis@supervisor=\tw@\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@second@supervisor@name@persian{\@name}\edef\@second@supervisor@rank@persian{\@rank}}
\define@key{qomthesis}{second supervisor}{\qom@thesis@supervisor@english=\tw@\relax\def\@second@supervisor@name@english{#1}}
\define@key{qomthesis}{استاد مشاور اوّل}{\qom@thesis@advisor=\@ne\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@first@advisor@name@persian{\@name}\edef\@first@advisor@rank@persian{\@rank}}
\define@key{qomthesis}{استاد مشاور اول}{\qom@thesis@advisor=\@ne\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@first@advisor@name@persian{\@name}\edef\@first@advisor@rank@persian{\@rank}}
\define@key{qomthesis}{first advisor}{\qom@thesis@advisor@english=\@ne\relax\def\@first@advisor@name@english{#1}}
\define@key{qomthesis}{استاد مشاور دوّم}{\qom@thesis@advisor=\tw@\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@second@advisor@name@persian{\@name}\edef\@second@advisor@rank@persian{\@rank}}
\define@key{qomthesis}{استاد مشاور دوم}{\qom@thesis@advisor=\tw@\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@second@advisor@name@persian{\@name}\edef\@second@advisor@rank@persian{\@rank}}
\define@key{qomthesis}{second advisor}{\qom@thesis@advisor@english=\tw@\relax\def\@second@advisor@name@english{#1}}
\define@key{qomthesis}{داور داخلی اوّل}{\qom@thesis@referee@enternal=\@ne\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@first@referee@name{\@name}\edef\@first@referee@rank{\@rank}}
\define@key{qomthesis}{داور داخلی اول}{\qom@thesis@referee@enternal=\@ne\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@first@referee@name{\@name}\edef\@first@referee@rank{\@rank}}
\define@key{qomthesis}{داور داخلي اوّل}{\qom@thesis@referee@enternal=\@ne\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@first@referee@name{\@name}\edef\@first@referee@rank{\@rank}}
\define@key{qomthesis}{داور داخلي اول}{\qom@thesis@referee@enternal=\@ne\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@first@referee@name{\@name}\edef\@first@referee@rank{\@rank}}
\define@key{qomthesis}{داور داخلی دوّم}{\qom@thesis@referee@enternal=\tw@\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@second@referee@name{\@name}\edef\@second@referee@rank{\@rank}}
\define@key{qomthesis}{داور داخلی دوم}{\qom@thesis@referee@enternal=\tw@\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@second@referee@name{\@name}\edef\@second@referee@rank{\@rank}}
\define@key{qomthesis}{داور داخلي دوّم}{\qom@thesis@referee@enternal=\tw@\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@second@referee@name{\@name}\edef\@second@referee@rank{\@rank}}
\define@key{qomthesis}{داور داخلي دوم}{\qom@thesis@referee@enternal=\tw@\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@second@referee@name{\@name}\edef\@second@referee@rank{\@rank}}
\define@key{qomthesis}{داور خارجی اوّل}{\qom@thesis@referee@external=\@ne\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@first@referee@external@name{\@name}\edef\@first@referee@external@rank{\@rank}}
\define@key{qomthesis}{داور خارجی اول}{\qom@thesis@referee@external=\@ne\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@first@referee@external@name{\@name}\edef\@first@referee@external@rank{\@rank}}
\define@key{qomthesis}{داور خارجي اوّل}{\qom@thesis@referee@external=\@ne\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@first@referee@external@name{\@name}\edef\@first@referee@external@rank{\@rank}}
\define@key{qomthesis}{داور خارجي اول}{\qom@thesis@referee@external=\@ne\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@first@referee@external@name{\@name}\edef\@first@referee@external@rank{\@rank}}
\define@key{qomthesis}{داور خارجی دوّم}{\qom@thesis@referee@external=\tw@\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@second@referee@external@name{\@name}\edef\@second@referee@external@rank{\@rank}}
\define@key{qomthesis}{داور خارجی دوم}{\qom@thesis@referee@external=\tw@\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@second@referee@external@name{\@name}\edef\@second@referee@external@rank{\@rank}}
\define@key{qomthesis}{داور خارجي دوّم}{\qom@thesis@referee@external=\tw@\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@second@referee@external@name{\@name}\edef\@second@referee@external@rank{\@rank}}
\define@key{qomthesis}{داور خارجي دوم}{\qom@thesis@referee@external=\tw@\relax\expandafter\@get@name@rank\expandafter{#1}%
\edef\@second@referee@external@name{\@name}\edef\@second@referee@external@rank{\@rank}}
\define@key{qomthesis}{نماینده تحصیلات تکمیلی}{\expandafter\@get@name@rank\expandafter{#1}%
\edef\qom@graduate@repsentative@name{\@name}\edef\qom@graduate@repsentative@rank{\@rank}}
\define@key{qomthesis}{نماينده تحصيلات تکميلي}{\expandafter\@get@name@rank\expandafter{#1}%
\edef\qom@graduate@repsentative@name{\@name}\edef\qom@graduate@repsentative@rank{\@rank}}
\define@key{qomthesis}{تقدیم به}{\def\@dedicatedto{#1}}
\define@key{qomthesis}{تقديم به}{\def\@dedicatedto{#1}}
\define@key{qomthesis}{نیایش}{\def\@praise{#1}}
\define@key{qomthesis}{نيايش}{\def\@praise{#1}}
\define@key{qomthesis}{سپاسگزاری}{\def\@acknowledgement{#1}}
\define@key{qomthesis}{سپاسگزاري}{\def\@acknowledgement{#1}}
\define@key{qomthesis}{چکیده}{\def\@abstract@persian{#1}}
\define@key{qomthesis}{چکيده}{\def\@abstract@persian{#1}}
\define@key{qomthesis}{کلمات کلیدی}{\def\@keywords@persian{#1}}
\define@key{qomthesis}{کلمات کليدي}{\def\@keywords@persian{#1}}
\define@key{qomthesis}{abstract}{\def\@abstract@english{#1}}
\define@key{qomthesis}{keywords}{\def\@keywords@english{#1}}
\newcommand{\thesisdetails}{\setkeys{qomthesis}}
\@onlypreamble\thesisdetails
%%%%%%%%%  Some Macros for Internal Use  %%%%%%%%%%%%%%%%%
\newsavebox\dotboxwidth
\def\qom@dotfill#1{\cleaders\hb@xt@ #1{\hss .\hss }\hfill \kern \z@}
\newcommand\qom@dotline[2][.3em]{\sbox\dotboxwidth{#2}\leavevmode\hb@xt@ \wd\dotboxwidth{\qom@dotfill{#1}\hfil}}
\newcommand\qom@dotlined[2][.3em]{\leavevmode\hb@xt@ #2{\qom@dotfill{#1}\hfil}}
%%%%% name-rank
%\def\@get#1-#2;{\def\@name{#1}\def\@rank{#2}}%
%\def\@striprank#1-{\edef\@rank{#1}}%
%\def\@get@name@rank#1{%
%  \@get#1-\relax;%
%  \edef\@tmpa{\@rank}%
%  \edef\@relax{\relax}%
%  \ifx\@tmpa\@relax%
%  \else\expandafter\@striprank\@rank\fi%
%}%
%%%%% name(rank)
\def\@get#1(#2);{\def\@name{#1}\def\@rank{#2}}%
\def\@striprank#1({\def\@@striprank##1){##1}%
\edef\@rank{\@@striprank#1}}%
\def\@get@name@rank#1{%
  \@get#1(\relax);%
  \edef\@tmpa{\@rank}%
  \edef\@relax{\relax}%
  \ifx\@tmpa\@relax%
  \else\expandafter\@striprank\@rank\fi%
}%
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\vspace*{\fill}
\begin{center}
%این صفحه، عمداً خالی گذاشته شده است.
\end{center}
\vspace{\fill}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}
%
\newif\if@qom@TestSubString%
\def\qom@IfSubString #1#2{%
    \edef\@qom@MainString{#1}%
    \def\@qom@TestSubS ##1#2##2\@qom@Del{\edef\@qom@TestTemp{##1}}%
    \expandafter\@qom@TestSubS\@qom@MainString#2\@qom@Del%
    \ifx\@qom@MainString\@qom@TestTemp%
        \@qom@TestSubStringfalse%
    \else%
        \@qom@TestSubStringtrue%
    \fi%
}%
\def\qom@firstletter#1{\expandafter\qom@justfirst#1\relax}
\def\qom@justfirst#1#2\relax{#1}
%%%%%%%%%% list of symbols macros%%%%%%%%%%%%%%
\newcommand{\addsymbol}[3]{%
    \gdef\currntsymbol{#2}%
    \gdef\currntsymboldef{#3}%
    \expandafter\gdef\csname qom@symb@short@#1\endcsname{#2}%
    \expandafter\gdef\csname qom@symb@long@#1\endcsname{#3}
    \addcontentsline{los}{addsymbol}{%
        \protect\numberline{\currntsymbol}%
        \currntsymboldef%
    }%
}
\newcommand\sym[1]{\expandafter{\csname qom@symb@long@#1\endcsname}%
\space(\expandafter{\csname qom@symb@short@#1\endcsname})}
\newcommand\syms[1]{\expandafter{\csname qom@symb@short@#1\endcsname}}
\newcommand\syml[1]{\expandafter{\csname qom@symb@long@#1\endcsname}}
\renewcommand\@tocrmarg{1.55em}
\newcommand\listsymbolsname{فهرست نمادها}
\newcommand\listofsymbols[1][3em]{%
    \newcommand*\l@addsymbol{\@dottedtocline{1}{0em}{#1}}
    \chapter*{\listsymbolsname}%
    \markboth{\listsymbolsname}{\listsymbolsname}%
    \setlength{\columnsep}{5ex}
    \begin{multicols*}{2}
        \small
        \@starttoc{los}
        \raggedcolumns
    \end{multicols*}
}
%%%%%%%%%% end of list of symbols macros%%%%%%%%%%%%%%
%%%%%%%%%%%%%%End of Some Macros for Internal Use %%%%%%%%%%%%%%%%
%%%%%%%%%  Packages  %%%%%%%%%%%%%%%%%
%
%\RequirePackage[immediate]{silence}
%\WarningFilter{latex}{Underfull}
%\WarningFilter{latex}{Overfull}
%\WarningFilter{latex}{LaTeX}
%\WarningsOff[Fancyhdr,fancyhdr, hyperref] 
%\ActivateWarningFilters
%\SafeMode
%-------------------------------------------------------------------------------------------------------------------
% در ورژن جدید زی‌پرشین برای تایپ متن‌های ریاضی، این سه بسته، حتماً باید فراخوانی شود؛‌ این بسته‌ها در صورت نیاز کاربر به متن افزوده خواهد شد. 
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{biditools}
\RequirePackage{multicol}
% بسته‌ای برای تنطیم حاشیه‌های بالا، پایین، چپ و راست صفحه
\RequirePackage[top=40mm, bottom=30mm, left=30mm, right=40mm, 
        bindingoffset=0mm, headsep=15mm]{geometry}
%
\RequirePackage{graphicx}
\graphicspath{{images/}}
%
\RequirePackage[]{xcolor}
\RequirePackage{bidi-atbegshi}
\if@qom@debug
    \RequirePackage{picture}
\fi
%
\RequirePackage{array}
\newcolumntype{C}[1]{>{\raggedleft\centering\arraybackslash}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}
\newcolumntype{M}[1]{>{\raggedleft\centering\arraybackslash}m{#1}}
%
\RequirePackage[inline]{enumitem}
\setlist{noitemsep}
\RequirePackage{booktabs}
%
\RequirePackage{emptypage}
\RequirePackage{setspace}
%
\RequirePackage{fancyhdr}
\RequirePackage[titles, subfigure]{tocloft}
\addtolength{\cftchapnumwidth}{10pt}
\addtolength{\cftsecnumwidth}{12pt}
\addtolength{\cftsubsecnumwidth}{14pt}      

% بسته‌ای برای ظاهر شدن «مراجع»  در فهرست مطالب 
%nottoc Disables the inclusion of the ToC.
%notlot Disables the inclusion of the List of Tables.
%notlof Disables the inclusion of the List of Figures.
\RequirePackage[nottoc,notlot,notlof]{tocbibind}
% This option make preparation for making index in the document
\if@qom@index
    \PassOptionsToPackage{quickindex-variant1}{xepersian}%
    \RequirePackage{makeidx}%
    \makeindex%
\fi    
\RequirePackage{tikz}
\global\let\tikz@ensure@dollar@catcode=\relax
\RequirePackage{apptools}
%%%%% The hyperref package should be the last package before xepersian package. 
\if@qom@print
    \PassOptionsToPackage{monocolor, hyperref}{xcolor}
    \RequirePackage[hidelinks=true]{hyperref}
\else
    \PassOptionsToPackage{hyperref}{xcolor}
    \RequirePackage[
    pagebackref,
    colorlinks=true, %% به جای استفاده از مربع قرمز دور موارد ارجاعی از لینک های رنگی استفاده کند.
    linkcolor=red, anchorcolor=green, citecolor=magenta, urlcolor=cyan, filecolor=magenta, %% رنگ برخی از لینک ها . 
    ]{hyperref}
\fi    
%% در این قسمت تنظیمات بسته hyperref را قرار می دهیم.
%% این تنظیمات شامل موارد زیر است.
\hypersetup{
%% موقعی که فایل پی دی اف خروجی را باز می کنید صفحه به صورت عریض و بزرگ باز می شود.
pdfmenubar=false, pdfstartview=FitH, 
%% در قسمت مراجع شماره صفحه ای که به آن مرجع ارجاع داده است را وارد می کند،
%% مواردی که برای فعال سازی این که شماره اشکال را به صورت ارجاعی نشان دهد
pagebackref =true,hyperfigures=true,
pdftoolbar=true
bookmarksopen = true,
bookmarksopenlevel = 1
%%% اگر این option را true‌ بکنیم، آن‌گاه در کنار bookmark شماره فصل و بخش و زیربخش نیز می آید. مثلا می‌نویسد: ۱.۲ طراحی شبکه
bookmarksnumbered = true
}
%%%%%%%%%%%%%%%%%%%%%%%%%%
% فراخوانی بسته زی‌پرشین و تعریف قلم فارسی و انگلیسی
%\RequirePackage{bidipoem}
\bidi@AtEndPreamble{%
%    \usepackage[para*]{manyfoot}
%    \SetFootnoteHook{\setLTR}
%    \DeclareNewFootnote[para]{A}
    \RequirePackage[extrafootnotefeatures, computeautoilg]{xepersian}[2018/10/06] %ver 21.6 and upper 
    \@ifpackagelater{xepersian}{2018/10/06}{}{%
    \typeout{}
    \typeout{############## FATAL ERROR ##############}
    \ClassError{thesis-qom}{You must update your TeX distribution; \MessageBreak 
        This version of thesis-qom just works \MessageBreak with xepersian ver 21.6 or upper
    }{if you have no time to update your TeX distribution,\MessageBreak do use there-qom version 0.34 or below.}
    \end{document}
    } 
    \normalRTLparaLTRfootnotes*
    % in case of Kashida=off option, because nastaliq font has no support for kashida and the code needs to know about that. 
    \if@bidi@csundef{if@Kashida@on}{\newif\if@Kashida@on}{}
    % See http://qa.parsilatex.com/7884 for details
    \if@bidi@csundef{@bidi@removefromreset}{}{%
        \@bidi@removefromreset{footnote}{chapter}%
    }
%    %\settextfont[Language=Default,Scale=1.33,BoldFont={IRlotus}]{IRLotus} %scale adopted with respect to XB Zar font.
    \settextfont[Scale=1.12,]{XB Niloofar} %scale adopted with respect to XB Zar font.  
    \setdigitfont[Scale=1]{Yas}
%%    \setlatintextfont[Scale=1.1,]{Linux Libertine}%Times New Roman
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\@ifpackageloaded{listings}{
        \lstset{ 
            basicstyle=\setLTR\@nonlatinfalse\footnotesize\ttfamily, % from xepersian ver. 16.8
            captiondirection=RTL, captionscript=nonlatin,
        }
}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % تعریف قلم‌های فارسی و انگلیسی اضافی برای استفاده در بعضی از قسمت‌های متن
    \defpersianfont\nastaliq[Language=Default,Scale=2.5,AutoFakeBold]{IranNastaliq}
    \defpersianfont\chapternumber[Language=Default,Scale=1.5,BoldFont={IRlotus}]{IRLotus}
    \defpersianfont\zarfont{XB Zar}
    \defpersianfont\titrfont{XB Titre}
    \defpersianfont\yasfont{Yas}
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%  با استفاده از این دستور می‌توان فونت و فارسی و یا انگلیسی بودن اعداد در فرمول‌ها را به حالت اولیه (یعنی پیش‌فرض لاتک) برگرداند.
%   \DefaultMathsDigits
    %
    %\DeclareMathSizes{textsize}{mathsize}{scriptsize}{scriptscriptsize}
    % گزینه اول: این برای چه دسته فونتی است. پیش فرض استایل ما فونت 10pt است. 
    % گزینه دوم: اندازه فونت توابع و موجودات ریاضی درون متن.
    % گزینه سوم: برای اسکریپت ها، اندازه زیرنویس و بالانویس.
    % گزینه چهارم: برای زیرنویس زیرنویس.

    % در دستورات زیر ما برای سه حالت، اندازه‌های مورد نظر را تعریف کرده ایم. 
%    \DeclareMathSizes{10}{11}{9}{8}   % For size 10 text
%    \DeclareMathSizes{11}{12}{11}{10}   % For size 11 text
%    \DeclareMathSizes{12}{13}{12}{11}  % For size 12 text
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \newsavebox\qom@thesis@proof@box
    \sbox{\qom@thesis@proof@box}{\textcolor{gray}{\hboxR{\tiny آماده‌ شده توسط کلاس \texttt{thesis-qom}، نسخهٔ \lr{\qom@thesis@version}}}}
    \newdimen\qom@thesis@proof@box@dim@ht
    \newdimen\qom@thesis@proof@box@dim@wd
    \qom@thesis@proof@box@dim@wd=\wd\qom@thesis@proof@box
    \qom@thesis@proof@box@dim@ht=\ht\qom@thesis@proof@box
    \AtBeginDocument{\AtBeginShipoutInit}%
    \AtBeginShipout{\AtBeginShipoutLowerRight{%
    % \put doesn't work properly in index pages!
    %\put(0,\LengthToUnit{\ht\qom@thesis@proof@box}){\rotatebox{90}{\usebox\qom@thesis@proof@box}}% 
    \begin{tikzpicture}[color=black,remember picture, overlay, every node/.style={inner sep=0pt},]
        \node at (current page.south east) 
        [anchor=north, xshift=-\qom@thesis@proof@box@dim@ht,yshift=\qom@thesis@proof@box@dim@wd+2] 
        {\rotatebox{90}{\usebox\qom@thesis@proof@box}};
    \end{tikzpicture}
    }}
    \bidi@patchcmd{\@Abjad}{آ}{الف}
    {\typeout{Succeeded in changing `آ` into `الف`}}
    {\typeout{Failed in changing `آ` into `الف`}}
    \bidi@patchcmd{\@Abjad}{ه}{ه‍}
    {\typeout{Succeeded in changing `ه` into `ه‍`}}
    {\typeout{Failed in changing `ه` into `ه‍`}}
    \bidi@patchcmd{\@harfi}{آ}{\hbox{الف}}
    {\typeout{Succeeded in changing `آ` into `الف`}}
    {\typeout{Failed in changing `آ` into `الف`}}
    \bidi@patchcmd{\@harfi}{ه}{ه‍}
    {\typeout{Succeeded in changing `ه` into `ه‍`}}
    {\typeout{Failed in changing `ه` into `ه‍`}}
    \PersianAlphs
%%% because of computeautoilg the changing from RTL to LTR causes a little space. in this case user can use below macro. 
    \def\bigpar{\par\medskip}
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \if@qom@debug
    \AtBeginShipout{%
      \AtBeginShipoutUpperRight{%
        {\color{red}%
        \put(\dimexpr 1in+\oddsidemargin,
             -\dimexpr 1in+\topmargin+\headheight+\headsep+\topskip)%
          {%
           \vtop to\dimexpr\vsize+\baselineskip{
             \hrule
             \leaders\vbox to\baselineskip{\hrule width\hsize\vfill}\vfill
           }%
          }%
      }}%
    }
    \fi
} %%%%%%%%%%%%%%%%%%% end of  \bidi@AtEndPreamble %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\@excellent{عالی}
\def\@verygood{بسیار خوب}
\def\@good{خوب}
\def\@acceptable{قابل قبول}
%
\def\Thesis{\ifcase\qom@thesistype{رساله}\or{پایان‌نامه}\or{پروژه}\fi}
%
\def\titlepage{\newpage\centering
  \thispagestyle{empty}
  \parindent 0pt \parskip 10pt plus 1fil minus 1fil
  \def\baselinestretch{1}\@normalsize\vbox to \vsize\bgroup\vbox to 9in\bgroup}
\def\endtitlepage{\par\kern 0pt\egroup\vss\egroup\newpage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{preamblepage}{%
\cleardoublepage%~
\newpage%
\thispagestyle{empty}%
\baselineskip=.76cm
\parindent=\z@}% at the beginnig of the environment
{\thispagestyle{empty}}% at the end of  environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\pagetitle#1{%
\vspace*{2.2cm}
\begingroup\if@Kashida@on\KashidaOff\fi
\nastaliq #1
\endgroup
\vspace*{1.4cm}\par
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\renewenvironment{abstract}{
%\section*{چکیده}
%\settextfont[Scale=1.2]{Adobe Arabic} 
%\setlatintextfont[Scale=1]{Times New Roman}
%}{\\*[8pt]}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\oathpage{%  تعهدنامه اصالت پایان‌نامه/رساله
\begin{preamblepage}
    \baselineskip=.76cm
    \begin{center}
        \setlength{\baselineskip}{.7\baselineskip}
        {\zarfont\fontsize{12}{14}\selectfont\includegraphics[width=2cm, height=2cm]{logo.jpg}\\  دانشگاه قم}\\
        {\bfseries\titrfont
        مدیریت تحصیلات تکمیلی\\
        «تعهدنامه اصالت \ifcase\qom@thesistype{رساله}\or{پایان‌نامه}\fi»}
    \end{center}
    \vspace{-\baselineskip}
    \rule{\textwidth}{1mm}\vspace{-\baselineskip}\\[2pt]
    \rule{\textwidth}{1pt}

    

    \noindent 
    اینجانب آقای/خانم: 
    {\ifx\@author@persian\undefined\qom@dotline{سیدمحمدجواد رضویان}\else\bfseries\@author@persian\fi{} }
    دانشجوی مقطع 
    {کارشناسی ارشد}\ifnum\qom@thesistype=1\rlap{\checkmark}\fi$\bigcirc$ %\hskip 10pt
    {دکتری}\ifnum\qom@thesistype=0\rlap{\checkmark}\fi$\bigcirc$ %\hskip 10pt 
    به شماره دانشجویی 
    {\ifx\@student@id\undefined\qom@dotline{۹۶ ۱۲۱۴۱۰۱۸}\else\bfseries\@student@id\fi{} }
    رشته
    {\ifx\@major\undefined\qom@dotline{مهندسی کامپیوتر}\else\bfseries\@major\fi{} }
    {\ifx\@field\undefined\else گرایش \bfseries\@field\fi }
    که در تاریخ 
    {\ifx\@defensedate\undefined\qom@dotline{۱۳۹۶/۰۷/۱۴}\else\bfseries\LR{\@defensedate}\fi{} }
    از \Thesis{}  خود تحت عنوان:\\
    \centerline{\ifx\@title@persian\undefined\qom@dotlined{7cm}\else\bfseries«\@title@persian»\fi}
    با کسب نمره  با عدد: 
    {\ifx\@grade\undefined\qom@dotline{۱۹/۲۵}\else\bfseries\LR{$\mathbf{\@grade}$}\fi{} }
    با حروف: 
    {\ifx\@grade@letters\undefined\qom@dotline{نوزده و بیست و پنج صدم تمام}\else\bfseries\@grade@letters\fi}
     و با درجه 
     {\ifx\@degree\undefined\qom@dotline{عالی}\else\bfseries\@degree\fi{} }\linebreak
     دفاع نموده‌ام، بدین وسیله متعهد می‌شوم که:
     \begin{enumerate}[label=\arabic*-]
        \item 
        این \Thesis{} حاصل تحقیق و پژوهش انجام شده توسط اینجانب بوده و در مواردی که از دستاوردهای 
        علمی و پژوهشی دیگران اعم از پایان‌نامه، کتاب، مقاله، \ldots استفاده نموده‌ام،   مطابق ضوابط و رویه  موجود، نام منبع مورد استفاده و سایر مشخصات 
        آن را در فهرست مربوطه ذکر و درج کرده‌ام. 
        \item 
        این \Thesis{} قبلاً برای هیچ مدرک تحصیلی هم سطح، پایین‌تر یا بالاتر در سایر \linebreak 
        دانشگاه‌ها و مؤسسات آموزش عالی ارائه نشده است. 
        \item 
        چنانچه بعد از فراغت از تحصیل،‌ قصد استفاده و هرگونه بهره‌برداری اعم از چاپ کتاب، ثبت اختراع و \ldots 
        از این \Thesis{} را داشته باشم، از حوزه معاونت پژوهشی واحد مجوزهای مربوطه را اخذ نمایم. 
        \item 
        چنانچه در هر مقطع زمانی خلاف موارد فوق ثابت شود، عواقب ناشی از آن را می‌پذیرم  و واحد دانشگاه قم مجاز است با اینجانب مطابق ضوابط و مقررات 
        رفتار نموده و در صورت ابطال مدرک تحصیلی‌ام هیچگونه ادعایی نخواهم داشت. 
     \end{enumerate}

    \vfill
    \begin{footnotesize}
    \bfseries
     \begin{tabularx}{\textwidth}{@{\hskip 1cm}c@{\hskip 2.5cm}c}
     صحت امضای دانشجو مورد تایید است. & نام و نام‌خانوادگی متعهد: \\ 
     نماینده تحصیلات تکمیلی & {\scriptsize تاریخ و امضاء} \\
     نام و نام‌خانوادگی: \ldots\ldots\ldots  & \\
     {\scriptsize تاریخ و امضاء} & \\
     \end{tabularx}
     \end{footnotesize}
     \vfill\null
\end{preamblepage}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newsavebox\@too@box@wd
\def\@too#1{%
    \sbox\@too@box@wd{#1}%
    \makebox[\wd\@too@box@wd][c]{"}%
}
\newcommand\refereeAck{%
\begin{preamblepage}
%\begin{minipage}{\textwidth}
%\vbox
{
    \small
    \baselineskip=.7cm
%    \parindent=\z@
%    \begin{center}
    \begingroup
    \centerline{\zarfont%\fontsize{12}{14}\selectfont
    \includegraphics[width=2cm, height=2cm]{logo.jpg} %\\  دانشگاه قم\\
    }%\par%[5pt]
    \centerline{\titrfont\bfseries «صورت جلسه دفاع از \ifcase\qom@thesistype{رساله دکتری}\or{پایان‌نامه کارشناسی ارشد}\fi»}
    \endgroup
%    \end{center}

    {\bfseries با تأييدات خداوند متعال و با استعانت از حضرت ولی عصر}
     {\footnotesize (عجل الله تعالی فرجه الشريف)}
     
     
     جلسه دفاعیه \ifcase\qom@thesistype{رساله دکتری}\or{پایان‌نامه کارشناسی ارشد}\fi{} خانم/آقای{}
         {\ifx\@author@persian\undefined\qom@dotlined{4cm}\else\bfseries\@author@persian\fi} 
     رشته 
        {\ifx\@major\undefined\qom@dotline{مهندسی کامپیوتر}\else\bfseries\@major\fi}
     تحت عنوان 
     {\ifx\@title@persian\undefined\qom@dotlined{9cm}\else\bfseries\@title@persian\fi}
     با حضور هیأت داوران در محل دانشگاه قم در تاریخ 
    {\ifx\@defensedate\undefined\qom@dotline{۱۳۹۶/۰۷/۱۴}\else\bfseries\LR{\@defensedate}\fi{} }
     تشکیل گردید. 
     
     در این جلسه، \Thesis{} با نمره (به عدد  
     {\bfseries\ifx\@grade\undefined\ldots\ldots\ldots\else\LR{$\mathbf{\@grade}$}\fi}{،}
      به حروف
      {\bfseries\ifx\@grade@letters\undefined\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\else\@grade@letters\fi})    و \linebreak
        با درجه عالی ~%
        \ifx\@degree\@excellent\rlap{\checkmark}\fi$\bigcirc$ \hskip 10pt 
        بسیار~خوب~%
        \ifx\@degree\@verygood\rlap{\checkmark}\fi$\bigcirc$\hskip 10pt 
        خوب~%
        \ifx\@degree\@good\rlap{\checkmark}\fi$\bigcirc$\hskip 10pt 
        قابل~قبول~%
        \ifx\@degree\@acceptable\rlap{\checkmark}\fi$\bigcirc$\hskip 10pt مورد دفاع قرار گرفت. 
        
    \vskip 5pt
    \def\@nextrow{\\[10pt]}
    \begin{tabularx}{\textwidth}{|@{\hskip 3pt}p{4cm}@{\hskip 3pt}|@{\hskip 2pt}c@{\hskip 2pt}|@{}c@{}|@{}X@{}|}
    \toprule
    \multicolumn{1}{|c|}{\titrfont\small نام و نام‌خانوادگی}  &
    \multicolumn{1}{c|}{\titrfont\small سمت} &
    \multicolumn{1}{c|}{\titrfont\small مرتبه علمی}  &
    \multicolumn{1}{c|}{\titrfont\small امضاء}
     \\[5pt]
    \toprule\toprule
%    &&&\\
    \ifnum\qom@thesis@supervisor>\z@ 
    \@first@supervisor@name@persian & 
    \ifcase\qom@thesis@supervisor\or استاد راهنما\or استاد راهنمای اوّل\fi  & 
     \@first@supervisor@rank@persian & \@nextrow
    \ifnum\qom@thesis@supervisor=\tw@ 
    \@second@supervisor@name@persian & 
    \@too{استاد} \@too{راهنمای}  
     دوّم  & 
     \@second@supervisor@rank@persian & \@nextrow\fi
    \fi

    \ifnum\qom@thesis@advisor>\z@
    \@first@advisor@name@persian & 
    \ifcase\qom@thesis@advisor\or{ استاد مشاور}\or{استاد مشاور اوّل}\fi  & 
    \@first@advisor@rank@persian & \@nextrow
    \ifnum\qom@thesis@advisor=\tw@ 
    \@second@advisor@name@persian &
    \@too{استاد} \@too{مشاور}  
    دوّم &  
    \@second@advisor@rank@persian &\@nextrow\fi\fi

    \ifnum\qom@thesis@referee@enternal>\z@
    \@first@referee@name  & 
    \ifcase\qom@thesis@referee@enternal\or{داور داخلی}\or{داور داخلی اوّل}\fi & 
    \@first@referee@rank  &  \@nextrow
    \ifnum\qom@thesis@referee@enternal=\tw@ 
    \@second@referee@name & \@too{داور} \@too{داخلی}  
    دوّم
    &  \@second@referee@rank  & \@nextrow\fi\fi

    \ifnum\qom@thesis@referee@external>\z@
    \@first@referee@external@name &
    \ifcase\qom@thesis@referee@external\or{داور خارجی}\or{داور خارجی اوّل}\fi & 
     \@first@referee@external@rank &\@nextrow
    \ifnum\qom@thesis@referee@external=\tw@
     \@second@referee@external@name & \@too{داور} \@too{خارجی}  
     دوّم 
     &  \@second@referee@external@rank & \@nextrow\fi\fi

    \ifx\qom@graduate@repsentative@name\undefined\else\qom@graduate@repsentative@name\fi &  
     \parbox[t]{4.1cm}{\centering استاد ناظر و \par نماینده تحصیلات تکمیلی}
     & \ifx\qom@graduate@repsentative@rank\undefined\else\qom@graduate@repsentative@rank\fi &
    \\
%    & نماینده تحصیلات تکمیلی & & \\[5pt]
    \bottomrule
    \end{tabularx}

    \bigskip       
%        \vfill
        \begin{tabularx}{\textwidth}{XX}
            \begin{minipage}{.4\textwidth}
                \centering
                معاون آموزشی و پژوهشی دانشکده\\[5pt]
                نام و امضاء 
            \end{minipage} &
            \begin{minipage}{.4\textwidth}
                \centering
                مدیر آموزش و  تحصیلات تکمیلی \\[5pt]
                نام و امضاء 
            \end{minipage}\\
        \end{tabularx}
        \vfill    
 \thispagestyle{empty}
 }
\end{preamblepage}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\qomtitle}{%
%%%%%%%%%%%%%%%% صفحهٔ سفید پس از جلد %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if@qom@draft\else
\begin{preamblepage}
    \vspace*{\fill}
    \textcolor{gray}{\hfill\tiny آماده‌ شده توسط کلاس \texttt{thesis-qom}، نسخهٔ \lr{\qom@thesis@version}}
\end{preamblepage}
\fi

%%%%%%%%%%%%%%% صفحه بسم‌الله %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if@qom@draft\else
\begin{preamblepage}
    \begin{minipage}[c][\textheight][c]{\textwidth}%
    \centering
    \includegraphics[width=%
    \ifx\@besmwidth\undefined%
    .9\textwidth
    \else
    \@besmwidth\textwidth
    \fi
    ]{basmalah}
    \end{minipage}%
\end{preamblepage}
\fi
%%%%%%%%%%%%%%% صفحه عنوان  %%%%%%%%%%%%%%%
\begin{preamblepage}
    \begin{titlepage}
    {\zarfont\fontsize{12}{14}\selectfont\includegraphics[width=2cm, height=2cm]{logo.jpg}\\[-7pt] \bfseries دانشگاه قم}
    \\[-5pt]
    {\zarfont\fontsize{12}{14}\selectfont\bfseries دانشکده 
    \ifx\@faculty\undefined\qom@dotline{علوم ریاضی}\else\@faculty\fi
    \\[-7pt] 
    گروه 
    \ifx\@department\undefined\qom@dotline{علوم کامپیوتر}\else\@department\fi}
    \\%[5pt] 
    %\par
    %\vspace{.3\baselineskip}
    {\vskip 2ex
    \zarfont\fontsize{14}{16}\selectfont\bfseries
    \ifcase\qom@thesistype{رساله دکتری}\or{پایان‌نامه کارشناسی‌ارشد}\or{پروژه کارشناسی}\fi
    }
    %\vskip 2ex
%    \vskip 5pt
    \centerline{\zarfont\fontsize{12}{14}\selectfont\bfseries  رشته 
    {\ifx\@major\undefined\qom@dotline{مهندسی کامپیوتر}\else\bfseries\@major\fi}{}
    \ifx\@field\undefined\else گرایش \@field\fi}
    \vskip 4ex
    {\titrfont\fontsize{14}{16}\selectfont\bfseries عنوان: \\
    \ifx\@title@persian\undefined\qom@dotlined{9cm}\else\bfseries {\fontsize{22}{24}\selectfont\@title@persian }\fi}
    \baselineskip=1.5cm\par
    \vskip 4ex
     \baselineskip=1cm

%    \large
    {\bfseries\ifcase\qom@thesis@supervisor%0
    \titrfont استاد راهنما: \\
    \qom@dotlined{5cm}
    \or%1
    \titrfont استاد راهنما: \\
    \fontsize{12}{14}\selectfont\@first@supervisor@name@persian
    \or%2
    \titrfont استادان راهنما: \\
    \fontsize{12}{14}\selectfont\@first@supervisor@name@persian{} و \@second@supervisor@name@persian
    \fi
    }
    \par 
    {\bfseries\ifcase\qom@thesis@advisor\relax%0
    \ifnum\qom@thesistype=0\titrfont استاد مشاور: \\ \qom@dotlined{5cm} \fi
    \or%1
    \titrfont استاد مشاور: \\
    \fontsize{12}{14}\selectfont%
    \@first@advisor@name@persian
    \or%2
    \titrfont استادان مشاور: \\
    \fontsize{12}{14}\selectfont%
    \@first@advisor@name@persian{} و \@second@advisor@name@persian
    \fi
    }
    \par
    {%
    \titrfont نگارنده: \\
    \ifx\@author@persian\undefined\qom@dotlined{4cm}
    \else\fontsize{12}{14}\selectfont\bfseries\@author@persian\fi}
    \par
    {\bfseries\fontsize{12}{14}\selectfont\zarfont 
    \ifx\@submissiondate\undefined ماه سال\else\@submissiondate\fi}
    \end{titlepage}
\end{preamblepage}    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% برای پروژه کارشناسی نیازی به صفحات زیر نیست. 
\if@qom@draft\else
\ifnum\qom@thesistype<\tw@
%%%%%%%%%%%%%%% صفحه تأییده داوران
\refereeAck%
%%%%%%%%%%%%%%% صفحه تعهدنامه اصالت پایان‌نامه/رساله
\oathpage%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fi    
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% صفحه تقدیم 
\if@qom@draft\else
\begin{preamblepage}
    \ifx\@dedicatedto\undefined%
    \else
        \pagetitle{تقدیم}    
        {\@dedicatedto}
    \fi
\end{preamblepage}    
\fi
%%%%%%%%%%%%%%% صفحه نیایش 
\if@qom@draft\else
\begin{preamblepage}
    \ifx\@praise\undefined%
    \else
    \pagetitle{نیایش}    
    {\@praise}
    \fi
\end{preamblepage}    
\fi
%%%%%%%%%%%%%%% صفحه سپاسگزاری
\if@qom@draft\else
\begin{preamblepage}
    \ifx\@acknowledgement\undefined%
    \else
        \pagetitle{تشکر و قدردانی}
        {\@acknowledgement}
    \fi
\end{preamblepage}
\fi
%%%%%%%%%%%%%%% صفحه چکیده
\begin{preamblepage}
    \ifx\@abstract@persian\undefined%
    \else
%        \pagetitle{چکیده}
        \chapter*{چکیده}
        \begin{abstractcount}
            {\@abstract@persian}%
        \end{abstractcount}
        \vspace*{1cm}\par
        {\noindent {\bfseries کلمات کلیدی:}
        \ifx\@keywords@persian\undefined\else\@keywords@persian{}\fi}
    \fi
\end{preamblepage}
} %%%% end of qomtitle macro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% دستورهایی برای سفارشی کردن صفحات اول فصل‌ها
\newcommand\mycustomraggedright{%
 \if@RTL\raggedleft%
 \else\raggedright%
 \fi}
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\bidi@AfterPackage{xepersian}{%
\SepMark{-}
% دستوری برای حذف کلمه «چکیده»
\renewcommand{\abstractname}{}
% دستوری برای حذف کلمه «abstract»
%\renewcommand{\latinabstract}{}
% دستوری برای تغییر نام کلمه «اثبات» به «برهان»
\renewcommand\proofname{\textbf{برهان}}
% دستوری برای تغییر نام کلمه «کتاب‌نامه» به «مراجع»
\renewcommand{\bibname}{منابع و مآخذ}
% دستوری برای تعریف واژه‌نامه انگلیسی به فارسی
\newcommand\persiangloss[2]{#1\dotfill\lr{#2}\\}
% دستوری برای تعریف واژه‌نامه فارسی به انگلیسی 
\newcommand\englishgloss[2]{#2\dotfill\lr{#1}\\}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% با دستور newtheoremstyle شما می توانید یک استایل جدید برای محیط هایی چون plain، definition‌ و ... تعریف کنید. شکل کلی این دستور به صورت زیر است.

%%\newtheoremstyle{stylename}% name of the style to be used
%%  {spaceabove}% measure of space to leave above the theorem. E.g.: 3pt
%%  {spacebelow}% measure of space to leave below the theorem. E.g.: 3pt
%%  {bodyfont}% name of font to use in the body of the theorem
%%  {indent}% measure of space to indent
%%  {headfont}% name of head font
%%  {headpunctuation}% punctuation between head and body
%%  {headspace}% space after theorem head; " " = normal interword space
%%  {headspec}% Manually specify head
% % تعریف محیط‌های گوناگون مانند محیط برای قضیه و ... 
%% theoremstyle = > plain, definition, remark 
%% با دستور newtheorem یک نوع از استایلی که در بالای آن تعریف شده است ایجاد می کنیم. 
% تعریف و نحوه ظاهر شدن عنوان قضیه‌ها، تعریف‌ها، مثال‌ها و ...
\theoremstyle{definition}
\newtheorem{definition}{تعریف}[chapter]
\newtheorem{example}[definition]{مثال}
\theoremstyle{plain}
\newtheorem{theorem}[definition]{قضیه}
\newtheorem{lemma}[definition]{لم}
\newtheorem{proposition}[definition]{گزاره}
\newtheorem{corollary}[definition]{نتیجه}
\theoremstyle{remark}
\newtheorem{remark}[definition]{ملاحظه}
\newtheorem{point}[definition]{نکته}
%%%%%%%%%%%%%%%%%%%%%%%%
%\theoremstyle{plain}
%\newtheorem{theorem}{قضیه}
%\newtheorem{lemma}{لم}
%\newtheorem{proposition}{گزاره}
%\theoremstyle{definition}
%\newtheorem{definition}{تعریف}
%\newtheorem{example}{مثال}
%\newtheorem{prob}{سوال}
%\theoremstyle{remark}
%\newtheorem{corollary}{نتیجه}
%\newtheorem{remark}{ملاحظه}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{%
    \def\@makechapterhead#1{%
      \vspace*{50\p@}%
      {\parindent \z@ \if@RTL\raggedleft\else\raggedright\fi \normalfont
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \huge\bfseries \@chapapp\space 
            \ifappendix \harfi{chapter}\else \expandafter\tartibinumeral\c@chapter\fi
            \par\nobreak
            \vskip 20\p@
          \fi
        \fi
        \interlinepenalty\@M
        \Huge \bfseries #1\par\nobreak
        \vskip 40\p@
        \nobreak
        \thispagestyle{empty}
      }}
    \def\@makeschapterhead#1{%
      \vspace*{50\p@}%
      {\parindent \z@ \if@RTL\raggedleft\else\raggedright\fi
        \normalfont
        \interlinepenalty\@M
        \Huge \bfseries  #1\par\nobreak
        \vskip 40\p@
        \thispagestyle{empty}
      }}  
     \bidi@appto{\appendix}{%\addcontentsline{toc}{chapter}{پیوست‌ها}%\appendices
     \appendixtrue}
     %% The followings are hacks for not using \mainmatter macro by users. 
     %% Sophisticated front matter page-numbering
%      \bidi@preto{\chapter}{\if@qom@preamble\else\ifappendix\else\ifnum\c@chapter=0\mainmatter\fi\fi\fi}
%      \bidi@patchcmd{\@chapter}{\if@mainmatter}{\if@qom@preamble\else\ifappendix\else\ifnum\c@chapter=0\global\mainmatter\fi\fi\fi\if@mainmatter}{}{}
      \bidi@patchcmd{\secdef}{\@dblarg}{\if@qom@preamble\else\ifappendix\else\ifnum\c@chapter=0\mainmatter\fi\fi\fi\@dblarg}{}{}
      \bidi@appto{\tableofcontents}{\@qom@preamblefalse}
      \bidi@appto{\listoffigures}{\@qom@preamblefalse}
      \bidi@appto{\listoftables}{\@qom@preamblefalse}
      \bidi@appto{\lstlistoflistings}{\@qom@preamblefalse}
      \bidi@appto{\listofsymbols}{\@qom@preamblefalse}
      \bidi@appto{\endacronym}{\@qom@preamblefalse}
        \setlength{\parindent}{1cm}
        \setlength{\parskip}{0pt}
    %
    %\setlength{\footskip}{
    %\paperheight   -(1in+\voffset+\topmargin+\headheight+\headsep+\textheight)  -1cm
    %}
    \pagenumbering{roman}
    \qomtitle
    \frontmatter
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@part[#1]#2{%
\ifnum\c@secnumdepth >-2\relax
\refstepcounter{part}%
\addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
\else
\addcontentsline{toc}{part}{#1}%
\fi
\markboth{}{}%
{\centering
\interlinepenalty \@M
\ifnum \c@secnumdepth >-2\relax
 \huge\bfseries \partname\nobreakspace\thepart
\par
\vskip 20\p@
\fi
\Huge\bfseries #2\par}%
\@endpart}
%\def\@makechapterhead#1{%
%\vspace*{-30\p@}%
%{\parindent \z@ \mycustomraggedright %\@mycustomfont
%\ifnum \c@secnumdepth >\m@ne
%\if@mainmatter
%\huge\bfseries \@chapapp\space {\chapternumber\thechapter}
%\par\nobreak
%\vskip 20\p@
%\fi
%\fi
%\interlinepenalty\@M 
%\Huge \bfseries #1\par\nobreak
%\vskip 120\p@
%}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% http://qa.parsilatex.com/25972/
\newenvironment{abstractcount}{%
    \newcount\WordCount
    \newcount\My@Alphabets
    \newXeTeXintercharclass\MyAlphabets
    \newXeTeXintercharclass\MyPunctuations
    \newXeTeXintercharclass\qom@dot@charclass
    \XeTeXcharclass `\. \qom@dot@charclass
    \XeTeXcharclass`\{\MyPunctuations
    \XeTeXcharclass`\}\MyPunctuations
    \XeTeXcharclass`\[\MyPunctuations
    \XeTeXcharclass`\]\MyPunctuations
    \XeTeXcharclass`\(\MyPunctuations
    \XeTeXcharclass`\)\MyPunctuations
    \XeTeXcharclass`\`\MyPunctuations
    \XeTeXcharclass`\'\MyPunctuations
    \XeTeXcharclass`\!\MyPunctuations
    \XeTeXcharclass`\:\MyPunctuations
    \XeTeXcharclass`\;\MyPunctuations
    \XeTeXcharclass`\?\MyPunctuations
    \XeTeXcharclass`\؟\MyPunctuations
    \XeTeXcharclass`\«\MyPunctuations
    \XeTeXcharclass`\»\MyPunctuations
    \XeTeXcharclass`\،\MyPunctuations
    \XeTeXcharclass`\,\MyPunctuations
    \My@Alphabets=`\آ \loop \XeTeXcharclass \My@Alphabets=\MyAlphabets \ifnum\My@Alphabets<`\ی \advance\My@Alphabets \@ne \repeat
    \My@Alphabets=`\A \loop \XeTeXcharclass \My@Alphabets=\MyAlphabets \ifnum\My@Alphabets<`\Z \advance\My@Alphabets \@ne \repeat
    \My@Alphabets=`\a \loop \XeTeXcharclass \My@Alphabets=\MyAlphabets \ifnum\My@Alphabets<`\z \advance\My@Alphabets \@ne \repeat
    \XeTeXinterchartoks \MyAlphabets 4095 = {\PrintWordCount}
    \XeTeXinterchartoks \MyAlphabets \MyPunctuations = {\PrintWordCount}
    \XeTeXinterchartoks \MyAlphabets \qom@dot@charclass = {\PrintWordCount}
    \newcommand*{\PrintWordCount}{%\raise.4\baselineskip
    \llap{\tiny\global\advance\WordCount\@ne\textcolor{red}{}%{\the\WordCount}
    }}
}% end of beginnig of abstractcount environment
{%
    \renewcommand*{\PrintWordCount}{}
    \ifnum\WordCount>300%
    \par\null\vspace{5mm}
    \centerline{\color{red}\bfseries\if@RTL\zarfont "متن چکیده نباید بیش از ۳۰۰ کاراکتر باشد؛‌ لطفاً آن را ویرایش نمایید.``\else%
    ``The Abstract cannot contain more than 300 words."\fi}
    \centerline{\color{gray}\bfseries\if@RTL\zarfont در حال حاضر متن چکیدهٔ شما حاوی \the\WordCount{} کلمه است!\else%
    This one includes \the\WordCount{} words! Please modify it.\fi}%
    \fi
}% end of abstractcount environment
}
\AtEndDocument{%
    %%%%%%%%%%%%%%%%%%%%%% Bibliography  %%%%%%%%%%%%%%%%%%%%%%%%%
    \IfFileExists{references.bib}{%
    \begin{spacing}{1}
    \bibliographystyle{plain-fa}
    \small
    \bibliography{references}
    \end{spacing}
    }%
    {}
    %%%%%%%%%%%%%%%%%%%%%% Making Dictionary %%%%%%%%%%%%%%%%%%%%%%%%%
    \newif\if@qom@dicfatoen
    \newif\if@qom@dicentofa
    \def\qom@Aa{ا}\def\qom@He{ه}%
    \newcommand\qom@makedic[1]{%
        \chapter*{#1}
        \markboth{#1}{#1}
        \addcontentsline{toc}{chapter}{#1}
        \parindent=\z@%
        \parskip\z@ \@plus .3\p@\relax
        \if@qom@dicentofa%
            \def\qom@dicrow##1##2{\bigskip##1\dotfill\rl{##2}\par}%% en2fa
        \fi%    
        \if@qom@dicfatoen%
            \def\qom@dicrow##1##2{\medskip##1\dotfill\dotfill\hbox{\lr{##2}}\par}%% fa2en
        \fi%
        \def\qom@dic@letter@space{\def\qom@dic@letter@space{\bigskip}}%
        \def\qom@dic@letter@title##1{%
        \qom@dic@letter@space\centerline{\normalfont\textbf{##1}}\nobreak}%   
        \expandafter\gdef\expandafter\qom@trimtok##1=##2;\relax{\qom@dicrow{##1}{##2}}%
        \gdef\qom@trimmer##1{\expandafter\qom@trimtok ##1;\relax}%
        \catcode\endlinechar=9 %
        \newread\qom@reader%
        \gdef\qom@letter{\relax}%
        \begingroup
        \if@qom@dicentofa\latin\fi
        \footnotesize%
        \if@qom@dicentofa\LTRmulticolcolumns\fi%
        \begin{multicols*}{2}%
            \if@qom@dicentofa%
                \openin\qom@reader=dicen2fa.tex\relax%
            \fi
            \if@qom@dicfatoen%
                \openin\qom@reader=dicfa2en.tex\relax%
            \fi%
            \loop%
                \read\qom@reader to \qom@data%
                \unless\ifeof\qom@reader%
                    \qom@IfSubString{\qom@data}{=}%
                    \if@qom@TestSubString%
                        \edef\qom@dic@letter{\qom@firstletter{\qom@data}}%
                        \uppercase\expandafter{\expandafter\edef\expandafter\qom@dic@letter\expandafter{\qom@dic@letter}} %https://tex.stackexchange.com/questions/404984
                        \ifx\qom@Aa\qom@dic@letter\def\qom@dic@letter{آ}\fi
                        \ifx\qom@He\qom@dic@letter\def\qom@dic@letter{ه‍}\fi
                        \ifx\qom@letter\qom@dic@letter\else%
                            \edef\qom@letter{\qom@dic@letter}%
                            \qom@dic@letter@title{\qom@dic@letter}%
                        \fi%
                        \qom@trimmer{\qom@data}%
                    \fi%
            \repeat%
            \closein\qom@reader%
        \end{multicols*}%
        \if@qom@dicentofa\endlatin\fi
        \endgroup
    }%
    %%%%%%%%%%%%%%%%%%%%%% Persian to English Dictionary %%%%%%%%%%%%%%%%%%%%%%%%%
    \IfFileExists{dicfa2en.tex}{\@qom@dicfatoentrue\@qom@dicentofafalse}%
    {\typeout{======There is no persian to english dictionary file in the main folder, named dicfa2en.tex.======}}
    \if@qom@dicfatoen
        \qom@makedic{{واژه‌نامه‌ فارسی به انگلیسی}}
    \fi
    %%%%%%%%%%%%%%%%%%%%%% English to Persian Dictionary %%%%%%%%%%%%%%%%%%%%%%%%%
    \IfFileExists{dicen2fa.tex}{\@qom@dicentofatrue\@qom@dicfatoenfalse}%
    {\typeout{======There is no english to persian dictionary file in the main folder, named dicfa2en.tex.======}}
    \if@qom@dicentofa
        \qom@makedic{ واژه‌نامه‌ انگلیسی به فارسی}
    \fi
    %%%%%%%%%%%%%%%%%%%%%% Index %%%%%%%%%%%%%%%%%%%%%%%%%
    \if@qom@index
      \providecommand*\lettergroup[1]{%
          \par%
            \def\qom@lettergroup{#1}%
             \ifx\qom@lettergroup\qom@Aa%
                \textbf{آ}%
             \else%
                \ifx\qom@lettergroup\qom@He%
                    \textbf{ه‍}%
                 \else%
                    \textbf{#1}%
                \fi%
            \fi%
          \par%
          \nopagebreak%
      }%
        \printindex%
    \fi    
    %%%%%%%%%%%%%%%%%%%%%% English Abstract %%%%%%%%%%%%%%%%%%%%%%%%%
    \begin{preamblepage}
    \begin{latin}
        \ifx\@abstract@english\undefined%
        \else
            \chapter*{Abstract}
            \begin{abstractcount}
                {\@abstract@english}%
            \end{abstractcount}
            \vspace*{1cm}\par
            {\noindent {\bfseries Keywords:}
             \ifx\@keywords@english\undefined\else\@keywords@english{}\fi}
        \fi
    \end{latin}    
    \end{preamblepage}
    %%%%%%%%%%%%%%%%%%%%%% English Title %%%%%%%%%%%%%%%%%%%%%%%%%
    \begin{preamblepage}
        \begin{titlepage}
    \begin{latin}
        {\fontsize{12}{14}\selectfont\includegraphics[width=2cm, height=2cm]{logo.jpg}\\ The University of Qom}
        \\[5pt]
        {\fontsize{12}{14}\selectfont Faculty of 
        \ifx\@faculty@english\undefined\qom@dotline{Mathematics}\else\@faculty@english\fi
        \\[5pt] 
        Department of  
        \ifx\@department@english\undefined\qom@dotline{Computer Science}\else\@department@english\fi}
        \\[10pt] 
        %\par
        %\vspace{.3\baselineskip}
    %    {\vskip 4ex
    %    \fontsize{14}{16}\selectfont\bfseries
    %    \ifcase\qom@thesistype{رساله دکتری}\or{پایان‌نامه کارشناسی‌ارشد}\or{پروژه کارشناسی}\fi
    %    }
        %\vskip 2ex
        \vskip 5pt
        \begin{center}
        {\fontsize{12}{14}\selectfont\bfseries  
        A Thesis Submitted in Partial Fulfillment of the Requirements for\linebreak the Degree of 
        \ifcase\qom@thesistype{Doctor of Philosophy}\or{Master of Science}\or{Bachelor of Science}\fi{} in
        {\ifx\@major@english\undefined\qom@dotline{Computer Science}\else\bfseries\@major@english\fi}{}
        }
        \end{center}
        \vskip 4ex
        {\fontsize{14}{16}\selectfont\textsf{Title:} \\
        \ifx\@title@english\undefined\qom@dotlined{9cm}\else\bfseries {\fontsize{22}{24}\selectfont\@title@english }\fi}
        \baselineskip=1.5cm\par
        \vskip 4ex
         \baselineskip=.5cm
        \large
        {\large\ifcase\qom@thesis@supervisor@english%0
         \textsf{Supervisor:} \\
        \qom@dotlined{5cm}
        \or%1
         \textsf{Supervisor:} \\
        \bfseries\fontsize{12}{14}\selectfont\@first@supervisor@name@english
        \or%2
         \textsf{Supervisors:} \\
        \bfseries\fontsize{12}{14}\selectfont\@first@supervisor@name@english{} and \@second@supervisor@name@english
        \fi
        }
        \par 
        {\large\ifcase\qom@thesis@advisor@english\relax%0
        \ifnum\qom@thesistype=0 Advisor: \\ \qom@dotlined{5cm} \fi
        \or%1
        \textsf{Advisor:} \\
        \bfseries\fontsize{12}{14}\selectfont%
        \@first@advisor@name@english
        \or%2
         \textsf{Advisors:} \\
        \bfseries\fontsize{12}{14}\selectfont%
        \@first@advisor@name@english{} and \@second@advisor@name@english
        \fi
        }
        \par
        {\large%
        \textsf{By:} \\
        \ifx\@author@english\undefined\qom@dotlined{4cm}
        \else\fontsize{12}{14}\selectfont\bfseries\@author@english\fi}
        \par
        {\fontsize{12}{14}\selectfont 
        \ifx\@submissiondate@english\undefined Season Year\else\@submissiondate@english\fi}
    \end{latin}    
        \end{titlepage}
    \end{preamblepage}    
    %%%%%%%%%%%%%%%%%%% Blank Page %%%%%%%%%%%%%%%%%%%%%%%%%
    \cleardoublepage
    \newpage\null
    \thispagestyle{empty}
}

\endinput


%% 
%% Copyright © 2017-2018      by Seiied-Mohammad-Javad Razavian
%% 
%% Distributable under the LaTeX Project Public License,
%% version 1.3c or higher (your choice). The latest version of
%% this license is at: http://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained" (as per LPPL maintenance status)
%%  by Seiied-Mohammad-Javad Razavian
%% 
%%  It is a based on Tabriz_thesis of Vahid Damanafshan,
%%    which was based on xepersian-thesis.cls by Vafa Khalighi
%%   ____________________________________________________________________
%% Special thanks to Vafa Khalighi for the XePersian Package.
%% This work is supported by University of Qom.
%% End of file `thesis-qom.cls'.	
