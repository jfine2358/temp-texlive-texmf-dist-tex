%%
%% This is file `isodoc.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% isodoc.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2006 by Wybo Dekker <wybo@dekkerdocumenten.nl>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{isodoc}%
   [2014/04/20 v1.05 isodoc class for letters and invoices]
\ifx\pdfoutput\undefined\else%
\ifnum\pdfoutput=1\else\ClassError{isodoc}{Compile me with pdflatex or xelatex!}{}
\fi\fi
%% \StopEventually{}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}
\RequirePackage{ctable,color,tabularx,graphicx,xstring,calc}
\RequirePackage{forarray,longtable}
\RequirePackage[nofoot,head=\baselineskip]{geometry}
\RequirePackage[absolute,overlay]{textpos}
\geometry{papersize={210mm,297mm},margin=35mm}
\TPGrid{210}{297}
\definecolor{headcolor}{gray}{0}
\definecolor{headingcolor}{gray}{0}
\definecolor{markercolor}{gray}{0}
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\AtBeginDocument{\addtolength{\headheight}{\baselineskip}}
\definecolor{isodocpink}{rgb}{1,.7,.7}
\def\Undefined#1{\fboxsep1pt\colorbox{isodocpink}{\strut Undefined #1}}
\def\@hft{\footnotesize\sffamily\color{headcolor}}
\def\@xyshift#1,#2@@@{\def\@xshift{#1}\def\@yshift{#2}}
\define@key{isodoc}{shift}{%
  \@xyshift#1@@@
  \AtBeginDocument{\textblockorigin{\@xshift mm}{\@yshift mm}}
}
\define@key{isodoc}{vertical}[\verticaltrue]{\verticaltrue}
\define@key{isodoc}{novertical}[\verticaltrue]{\verticalfalse}
                                           \newif\ifvertical\verticaltrue
\define@key{isodoc}{foreign}[\foreigntrue]{\foreigntrue}
                                           \newif\ifforeign\foreignfalse
\define@key{isodoc}{cityzip}[\cityziptrue]{\cityziptrue}
                                           \newif\ifcityzip\cityzipfalse
\define@key{isodoc}{dutch}   []{\isodoc@nlNL\ClassWarning{isodoc}{the option dutch is obsolete: use language=nl-NL}}
\define@key{isodoc}{english} []{\isodoc@enGB\ClassWarning{isodoc}{the option english is obsolete: use language=en-GB}}
\define@key{isodoc}{german}  []{\isodoc@deDE\ClassWarning{isodoc}{the option german is obsolete: use language=de-DE}}
\define@key{isodoc}{american}[]{\isodoc@enUS\ClassWarning{isodoc}{the option american is obsolete: use language=en-US}}
\define@key{isodoc}{french}  []{\isodoc@frFR\ClassWarning{isodoc}{the option french is obsolete: use language=fr-FR}}
\define@key{isodoc}{language}{\StrSubstitute{#1}{-}{}[\@iso]\csname isodoc@\@iso\endcsname}
\define@key{isodoc}{fill}  []{\rightskip=1\rightskip}
\define@key{isodoc}{nofill}[]{\rightskip=0mm plus 35mm}
                              \rightskip=0mm plus 35mm
\define@key{isodoc}{logo}[\@isodoclogotrue]{\@isodoclogotrue}
\define@key{isodoc}{nologo}[\@isodoclogofalse]{\@isodoclogofalse}
                                 \newif\if@isodoclogo\@isodoclogotrue
\define@key{isodoc}{company}    {\def\company{#1}}
                                 \def\company{\Undefined{company}}
\define@key{isodoc}{logoaddress}{\def\logoaddress{#1}}
 \def\logoaddress{}
\define@key{isodoc}{who}        {\def\who{#1}}
                                 \def\who{\Undefined{who}}
\define@key{isodoc}{street}     {\def\street{#1}}
                                 \def\street{\Undefined{street}}
\define@key{isodoc}{city}       {\def\city{#1}}
                                 \def\city{\Undefined{city}}
\define@key{isodoc}{country}    {\def\country{#1}}
                                 \def\country{\Undefined{country}}
\define@key{isodoc}{countrycode}{\def\countrycode{#1}}
                                 \def\countrycode{\Undefined{countrycode}}
\define@key{isodoc}{zip}        {\def\zip{#1}}
                                 \def\zip{\Undefined{zip}}
\def\prezip{\ifforeign\countrycode\else\fi}
\define@key{isodoc}{leftaddress} []{\def\xaddress{35}}
                                    \def\xaddress{35}
\define@key{isodoc}{rightaddress}[]{\def\xaddress{105}}
\define@key{isodoc}{addresscenter} {\def\@addresscenter{#1}}
                                    \def\@addresscenter{63.5}
\define@key{isodoc}{addresswidth}  {\def\@addresswidth{#1}}
                                    \def\@addresswidth{70}
\define@key{isodoc}{to}{\processto{#1}}\def\toname{Various people}
                                       \def\toaddress{\Undefined{to}}
\long\def\processto#1{\xproc #1\\@@@\ifx\toaddress\empty
    \else \yproc #1@@@\fi}
\long\def\xproc #1\\#2@@@{\gdef\toname{#1}\gdef\toaddress{#2}}
\long\def\yproc #1\\#2@@@{\gdef\toaddress{#2}}
\define@key{isodoc}{return}     []{\returntrue}
                    \newif\ifreturn\returnfalse
\define@key{isodoc}{noreturn}   []{\returnfalse}
\define@key{isodoc}{returnaddress}{\def\returnaddress{#1}}
\define@key{isodoc}{header}  []{\headertrue}
                 \newif\ifheader\headertrue
\define@key{isodoc}{noheader}[]{\headerfalse}
\define@key{isodoc}{bodyshift} {\advance\headerpos#1}
\newcount\headerpos\headerpos=98
\newcount\footerpos\footerpos=275
\newcount\subjectpos
\newcount\openingpos
\newcount\textskip
\define@key{isodoc}{footorder} {\def\@footorder{#1}}
                                \def\@footorder{website;phone;cellphone;email}
\define@key{isodoc}{footer}  []{\footertrue}
                 \newif\iffooter\footerfalse
\define@key{isodoc}{nofooter}[]{\footerfalse}
\define@key{isodoc}{areacode}   {\def\areacode{#1}}
                                 \def\areacode{\Undefined{areacode}}
\define@key{isodoc}{phoneprefix}{\def\phoneprefix{#1}}
                                 \def\phoneprefix{0}
\define@key{isodoc}{phone}      {\def\phone{#1}}
                                 \def\phone{}
                                 \def\@phone{\Undefined{phone}}
\define@key{isodoc}{cellphone}  {\def\cellphone{#1}}
                                 \def\cellphone{}
                                 \def\@cellphone{\Undefined{cellphone}}
\define@key{isodoc}{fax}        {\def\fax{#1}}
                                 \def\fax{}
                                 \def\@fax{\Undefined{fax}}
\define@key{isodoc}{website}    {\def\website{#1}}
                                 \def\website{}
                                 \def\@website{\Undefined{website}}
\define@key{isodoc}{email}      {\def\email{#1}}
                                 \def\email{}
                                 \def\@email{\Undefined{email}}
\define@key{isodoc}{nofold}[]{\yfold=-1mm}
               \newdimen\yfold\yfold=-1mm
\define@key{isodoc}{foldleft}[]{\xfold=9mm}
               \newdimen\xfold\xfold=201mm
\define@key{isodoc}{foldright}[]{\xfold=201mm}
\define@key{isodoc}{fold2}[]{\yfold=158mm}
\define@key{isodoc}{fold3}[]{\yfold=107mm}
\define@key{isodoc}{fold}{\yfold=#1mm}
\define@key{isodoc}{ourref}  {\def\ourref{#1}}
                              \def\ourref{}
\define@key{isodoc}{yourref}   {\def\yourref{#1}}
                              \def\yourref{}
\define@key{isodoc}{yourletter}{\def\yourletter{#1}}
                              \def\yourletter{}
\define@key{isodoc}{date}{\@isomakedate{#1}}
\define@key{isodoc}{forcedate}{\def\@forcedate{#1}}\def\@forcedate{}
\define@key{isodoc}{subject}{\def\subject{#1}}
                             \def\subject{}
\define@key{isodoc}{opening}     {\def\opening{#1}}
                                  \def\opening{\Undefined{opening}}
\define@key{isodoc}{openingcomma}{\def\@openingcomma{#1}}
                                  \def\@openingcomma{,}
\define@key{isodoc}{closing}     {\def\closing{#1}}
                                 \def\closing{\Undefined{closing}}
\define@key{isodoc}{closingcomma}{\def\@closingcomma{#1}}
                                  \def\@closingcomma{,}
\define@key{isodoc}{closingskip}{\ClassError{isodoc}{The closingskip option has been removed
                                  in version 1.04; instead set the signatureskip length,
                                  preferably in a style file}}
            \newdimen\closingskip\closingskip=\baselineskip
            \newdimen\signatureskip\signatureskip=2\baselineskip
            \newdimen\copytoskip\copytoskip=\baselineskip
            \newdimen\enclosureskip\enclosureskip=\baselineskip
            \newif\ifencldown\encldownfalse
\define@key{isodoc}{autograph}[2]{\def\autographversion{#1}}
                                  \def\autographversion{0}
\define@key{isodoc}{signature}{\def\signature{#1}}
                               \def\signature{\Undefined{signature}}
\define@key{isodoc}{enclosures} {\def\enclosures{#1}}
                                 \def\enclosures{}
\define@key{isodoc}{copyto} {\def\copyto{#1}}
                             \def\copyto{}
\define@key{isodoc}{term}   [30]{\def\term{#1}}
                                 \def\term{}
\define@key{isodoc}{accountno}  {\def\accountno{#1}}
\define@key{isodoc}{routingno}  {\def\routingno{#1}}
\define@key{isodoc}{accountname}{\def\accountname{#1}}
\define@key{isodoc}{iban}       {\def\iban{#1}}
\define@key{isodoc}{bic}        {\def\bic{#1}}
\define@key{isodoc}{vatno}      {\def\vatno{#1}}
\define@key{isodoc}{chamber}    {\def\chamber{#1}}
                                 \def\chamber{\Undefined{chamber}}
\define@key{isodoc}{currency}   {\def\currency{#1}}
                                 \def\currency{\EuroSymbol}
\define@key{isodoc}{accept}[E05]{\def\accepttype{#1}
                                 \newfont\ocrb{ocrb10}
                                }
\define@key{isodoc}{acceptaccount}    {\def\acceptaccount{#1}}
                                       \def\acceptaccount{}
\define@key{isodoc}{acceptaddress}    {\def\acceptaddress{#1}}
                                       \def\acceptaddress{}
\define@key{isodoc}{acceptcents}      {\def\acceptcents{#1}}
                                       \def\acceptcents{\Undefined{}}
\define@key{isodoc}{acceptdescription}{\def\acceptdescription{#1}}
                                       \def\acceptdescription{}
\define@key{isodoc}{acceptdesc}       {\def\acceptdesc{#1}}
                                       \def\acceptdesc{}
\define@key{isodoc}{accepteuros}      {\def\accepteuros{#1}}
                                       \def\accepteuros{\Undefined{}}
\define@key{isodoc}{acceptreference}  {\def\acceptreference{#1}}
                                       \def\acceptreference{\Undefined{ref}}
\def\xacceptdescription{105}\def\yacceptdescription{200}\def\wacceptdescription{100} %T
\def\xacceptref{7}          \def\yacceptref{212}        \def\wacceptref{30}          %T
\def\xaccepteuros{60}       \def\yaccepteuros{216}      \def\waccepteuros{32}        %C
\def\xacceptcents{89}       \def\yacceptcents{216}      \def\wacceptcents{13}        %C
\def\xacceptreference{125}  \def\yacceptreference{216}  \def\wacceptreference{55}    %C
\def\xaccepteur{14.4}       \def\yaccepteur{228.5}      \def\waccepteur{21}          %C
\def\xacceptct{32}          \def\yacceptct{228.5}       \def\wacceptct{9}            %C
\def\xacceptaccount{75}     \def\yacceptaccount{228.5}  \def\wacceptaccount{65}      %C
\def\xacceptdesc{7}         \def\yacceptdesc{241}       \def\wacceptdesc{26}         %T
\def\xacceptaddress{58}     \def\yacceptaddress{241}    \def\wacceptaddress{90}      %T
\newdimen\acceptreferenceskip\acceptreferenceskip=5.15mm
\newcommand{\@isodocsym}{%
  \fontfamily{mvs}\fontencoding{U}%
  \fontseries{m}\fontshape{n}\selectfont
}
\def\EuroSymbol   {{\@isodocsym\char164}}
\def\EUROSymbol   {{\@isodocsym\char99 }}
\def\LetterSymbol {{\@isodocsym\char66 }}
\def\EmailSymbol  {{\@isodocsym\char107}}
\def\PhoneSymbol  {{\@isodocsym\char84 }}
\def\MobileSymbol {{\@isodocsym\char72 }}
\let\EUR\EuroSymbol
\newdimen\iso@outdent
\newdimen\iso@signpos
\newdimen\iso@down
\newdimen\iso@closingpos
\def\iso@isNum#1#2{%
   \sbox\z@{\@tempcnta=0#1\relax}
   \ifdim\wd0>\z@\relax\ClassError{isodoc}%
                       {Argument #2 of autograph must be a number!}%
                       {You are probably using the oldstyle autograph arguments}\fi
}
\def\autograph#1#2#3#4#5#6{%
  \iso@isNum{#3}{3}\iso@isNum{#4}{4}\iso@isNum{#5}{5}
  \ifnum #1<2
    \ClassError{isodoc}{autograph #1 cannot be changed (first arg must be 2..9)}{}
  \fi
  \ifnum #1>9
    \ClassError{isodoc}{autograph #1 cannot be changed (first arg must be 2..9)}{}
  \fi
  \bgroup
  \lccode`2=`A \lccode`6=`E
  \lccode`3=`B \lccode`7=`F
  \lccode`4=`C \lccode`8=`G
  \lccode`5=`D \lccode`9=`H
  \lowercase{\def\temp{#1}}%
  \expandafter\egroup\expandafter\def\csname autograph\temp\endcsname{%
    \vskip-2\baselineskip%
    \setlength{\iso@down}{#2*#3/100-#2-2\baselineskip}
    \setlength{\iso@outdent}{-#2*#5/100}
    \setlength{\iso@signpos}{#2*(#4-#3)/100}
    \hspace*{\iso@outdent}\raisebox{\iso@down}[0pt][0pt]{\includegraphics[height=#2]{#6}}%
    \\[\baselineskip]%
    \closing\@closingcomma\\[\iso@signpos]\\[-2\baselineskip]%
    \signature%
  }
}
\newcommand{\zippedcity}{\ifcityzip\city\ \prezip\ \zip\else\prezip\ \zip\ \city\fi}
\newcommand{\logo}{\if@isodoclogo%
  { \parskip=0pt\parindent=0pt
    \begin{textblock}{140}[0,1](35,20)%
        \textsf{\LARGE\company}\\[-1.7ex] % large company name
        \rule{\hsize}{.3pt}               % on top a rule
    \end{textblock}
  }
  \Tbox{140}{22}{35}{\noindent
     \footnotesize\sffamily
     \ifx\empty\logoaddress%
       \ifx\undefined\tbfigures\else\tbfigures\fi
       \ifx\who\empty\else\who\\\fi
       \ifx\street\empty\else\street\\\fi
       \zippedcity
       \ifforeign\\\country\fi
     \else\logoaddress\fi
  }\fi
}
\def\returnaddress{%
  \ifx\undefined\tbfigures\else\tbfigures\fi % when using osf-txfonts... just for me
  \company\\
  \street\\
  \zippedcity
  \ifforeign\\\country\fi
}
\newcommand{\setupdocument}[1]{
  \setkeys{isodoc}{#1}
  \iffooter\else\geometry{bottom=25mm}\fi
}
\newcount\@isoyear   \@isoyear=\year  \year=0
\newcount\@isomonth \@isomonth=\month
\newcount\@isoday     \@isoday=\day
\def\@isomakedate#1{
  \StrSubstitute[2]{#1}{-}{}[\@iso@arg]
  \IfStrEq{\@iso@arg}{today}{
     \year=\@isoyear
    \month=\@isomonth
      \day=\@isoday
  }{\IfInteger{\@iso@arg}{}{\ClassError{isodoc}{
        Illegal date: not yyyymmdd | yyyy-mm-dd | today}{}\fi}
    \StrLeft{\@iso@arg}{4}[\@iso]\year=\@iso
    \StrRight{\@iso@arg}{2}[\@iso]\day=\@iso
    \StrMid{\@iso@arg}{5}{6}[\@iso]\month=\@iso
  }
  \ifnum\month > 12 \ClassError{isodoc}{Illegal date: month>12}{}\fi
  \ifnum\day   > 31 \ClassError{isodoc}{Illegal date: day>31}{}\fi
}
\def\date{%
  \ifx\@forcedate\empty%
    \ifnum\year=0\Undefined{date}\else\@isodate\fi
  \else\@forcedate\fi
}
\def\accountdata{
  \textbf{\accountdatatext:}\\
  \begin{tabular}{@{}rl@{}}
    \ifx\term\empty\else
             \termtext: & \term\ \daystext\\
    \fi
    \ifx\accounto\undefined\else
        \accountnotext: & \accountno\\
    \fi
    \ifx\iban\undefined\else
        \ibantext: & \scshape \iban\\
    \fi
    \ifx\bic\undefined\else
        \bictext: & \scshape \bic\\
    \fi
    \ifx\accountname\undefined\else
       \accountnametext: & \accountname{}\\
    \fi
    \ifx\routingno\undefined\else
       \routingnotext: & \routingno{}\\
    \fi
    \ifx\ourref\empty\else
        \referencetext: & \ourref\\
    \fi
    \ifx\vatno\undefined\else
      \vatnotext: & \vatno\\
    \fi
  \end{tabular}
}
\def\@isodocmp#1{\begin{minipage}[t]{\hsize}\mbox{}#1\\[-1.8ex]\mbox{}\end{minipage}}
\def\@isodocun#1{\ifx#1\undefined (undefined, so not shown)\else#1\fi}
\def\showkeys{%
  \begin{longtable}{rl}
      acceptaccount & \acceptaccount\NN
      acceptaddress & \acceptaddress\NN
        acceptcents & \acceptcents\NN
         acceptdesc & \@isodocmp{\acceptdesc}\NN
  acceptdescription & \acceptdescription\NN
        accepteuros & \accepteuros\NN
    acceptreference & \acceptreference\NN
        accountname & \@isodocun{\accountname}\NN
          accountno & \@isodocun{\accountno}\NN
           areacode & \areacode\NN
                bic & \@isodocun{\bic}\NN
          cellphone & \cellphone\NN
            chamber & \chamber\NN
               city & \city\NN
            closing & \closing\NN
            company & \company\NN
             copyto & \@isodocmp{\copyto}\NN
            country & \country\NN
        countrycode & \countrycode\NN
           currency & \currency\NN
               date & \date\NN
              email & \email\NN
         enclosures & \@isodocmp{\enclosures}\NN
                fax & \fax\NN
               iban & \@isodocun{\iban}\NN
        logoaddress & \@isodocmp{\logoaddress}\NN
            opening & \opening\NN
             ourref & \ourref\NN
              phone & \phone\NN
        phoneprefix & \phoneprefix\NN
      returnaddress & \@isodocmp{\returnaddress}\NN
          routingno & \@isodocun{\routingno}\NN
          signature & \@isodocmp{\signature}\NN
             street & \street\NN
            subject & \subject\NN
               term & \term\NN
              vatno & \@isodocun{\vatno}\NN
            website & \website\NN
                who & \who\NN
         yourletter & \yourletter\NN
            yourref & \yourref\NN
                zip & \zip\NN
  \end{longtable}
}
\AtEndOfClass{%
  \usepackage{hyperref}
}
\def\@isodocheadL{\totext:{} \toname{} (\date)}
\def\@isodocheadC{}
\def\@isodocheadR{\pagetext\ \thepage\ \oftext{}
    \begin{NoHyper}\pageref{LastPageOf\thelettercount}\end{NoHyper}
}
\def\@isodocheadbox#1{\mbox{\color{headingcolor}#1}}
\def\@isodocfootL{}
\def\@isodocfootC{}
\def\@isodocfootR{}
\def\isodoc@bara{\raisebox{-1ex}{\rule{0pt}{3ex}}}
\def\isodoc@barb{\rule{0pt}{2.7ex}}
\def\isodoc@barc{\rule{0pt}{1ex}}
\def\itable#1{\arrayrulewidth0.05em%
  \ifvertical
    \begin{tabularx}{\hsize}{@{}X|r@{}}%
      \sffamily\descriptiontext &
      \sffamily \amounttext\,(\currency)\isodoc@bara\\\hline\\[-5.4ex]
      \isodoc@barb #1%
    \end{tabularx}
  \else
    \begin{tabularx}{\hsize}{@{}Xr@{}}%
      \sffamily\descriptiontext &
      \sffamily \amounttext\,(\currency)\isodoc@bara\\\hline\\[-5.6ex]
      \isodoc@barb #1%
    \end{tabularx}
  \fi
}
\def\iitem#1#2{\\#1&#2\ignorespaces}
\newcommand{\itotal}[2][\totaltext]{%
  \isodoc@barc\\\cline{2-2}#1&\textbf{#2}\isodoc@barb
}
\newcounter{lettercount}\setcounter{lettercount}{0}
\newif\ifclosing\closingtrue
\newcount\footcount
\newcommand{\invoice}[2][]{%
  \closingfalse
  \letter[#1,
    opening={\bfseries\scshape\Large\invoicetext},
    openingcomma={},
    closing={},
    signature={}]{\Tbox{35}{127}{140}{\ignorespaces#2}}
}
\newcommand{\letter}[2][]{{%
  \clearpage{\pagestyle{empty}\cleardoublepage}
  \setcounter{section}{0}
  \setkeys{isodoc}{#1}
  \def\isodoc@lead{\ifforeign+\areacode\,\else\phoneprefix\fi}
  \ifx\phone    \empty\else\def\@phone    {\isodoc@lead\phone}    \fi
  \ifx\cellphone\empty\else\def\@cellphone{\isodoc@lead\cellphone}\fi
  \ifx\fax      \empty\else\def\@fax      {\isodoc@lead\fax}      \fi
  \ifx\website  \empty\else\def\@website  {\website}              \fi
  \ifx\email    \empty\else\def\@email    {\email}                \fi
  \ifx\yourlettertext\undefined%
    \ClassWarning{isodoc}{You did not use the language option; using the default: en-GB}
    \isodoc@enGB%
  \fi
  \ifnum\value{lettercount}=0%
    \hypersetup{pdftitle={letter to \toname\ dated \today},
                pdfsubject={\subject},
                pdfauthor={\who},
                pdfcreator={LaTeX with isodoc class},
    }
  \fi
  \addtocounter{lettercount}{1}
  \setcounter{page}{1}
  \setcounter{footnote}{0}
  \fancyhf{}
  \if@twoside
    \fancyhead[LE,RO]{\@isodocheadbox{\@isodocheadR}}
    \fancyhead[RE,LO]{\@isodocheadbox{\@isodocheadL}}
    \fancyfoot[LE,RO]{\@isodocheadbox{\@isodocfootR}}
    \fancyfoot[RE,LO]{\@isodocheadbox{\@isodocfootL}}
  \else
    \fancyhead[L]{\@isodocheadbox{\@isodocheadL}}
    \fancyhead[R]{\@isodocheadbox{\@isodocheadR}}
    \fancyfoot[L]{\@isodocheadbox{\@isodocfootL}}
    \fancyfoot[R]{\@isodocheadbox{\@isodocfootR}}
  \fi
  \fancyhead[C]{\@isodocheadbox{\@isodocheadC}}
  \fancyfoot[C]{\@isodocheadbox{\@isodocfootC}}
  \logo
  { \parskip=0pt\parindent=0pt
    \begin{textblock}{\@addresswidth}[0,.5](\xaddress,\@addresscenter)%
        \ifreturn
          {\def\\{\unskip\enspace\textbullet\enspace\ignorespaces}%
            \sffamily\bfseries\scriptsize\returnaddress
          }\\[-.8\baselineskip]
          \rule{\hsize}{.2pt}\\
        \fi
        \toname\\\toaddress
    \end{textblock}
  }
  \subjectpos=\headerpos
  \textskip=\headerpos\advance\textskip-12
  \ifx\subject\empty\advance\textskip-10\else\advance\subjectpos10\fi
  \openingpos=\subjectpos
  \ifheader
    \openingpos=\subjectpos\advance\openingpos12
    \Tbox{35}{\headerpos}{35}{\noindent
      {\@hft\yourlettertext}\\
      \yourletter
    }
    \Tbox{70}{\headerpos}{35}{\noindent
      {\@hft\yourreftext}\\
      \raggedright\yourref
    }
    \Tbox{105}{\headerpos}{35}{\noindent
      {\@hft\ourreftext}\\
      \raggedright\ourref
    }
    \Tbox{140}{\headerpos}{35}{\noindent
      {\@hft\datetext}\\
      \date
    }
    \ifx\subject\empty\else%
      \Tbox{35}{\subjectpos}{140}{\noindent
        \ifx\subjecttext\empty{\bfseries\subject}\else%
          \begin{tabularx}{\hsize}{@{}l>{\raggedright}X@{}}
            \@hft\subjecttext&\subject
          \end{tabularx}
        \fi
      }
    \fi
  \else
    \advance\textskip-12
  \fi
  \footcount=35
  \iffooter
    \ForEachX{;}{%
      \setbox0=\hbox{\csname @\thislevelitem\endcsname}
      \ifdim\wd0=0pt\else
        \Tbox{\footcount}{\footerpos}{35}{\noindent
          {\@hft\csname\thislevelitem text\endcsname}\\
            \csname @\thislevelitem\endcsname
        }
      \fi
        \advance\footcount35
    }{\@footorder}
  \fi
  { \parskip=0pt\parindent=0pt
    \begin{textblock*}{3mm}(\xfold,\yfold)%
       {\color{markercolor}\rule{\hsize}{.2pt}}
    \end{textblock*}
  }
  \ifx\undefined\accepttype\else\accept\fi
  \noindent\Tbox{35}{\openingpos}{140}{\opening\@openingcomma}
  \vspace{\textskip mm}
  \thispagestyle{empty}
  \noindent\ignorespaces#2
  \ifclosing{\\[\closingskip]
    \parindent=0pt\parskip=\baselineskip\noindent
    \begin{minipage}[t]{\hsize}
        \ifcase\autographversion
          \par\closing\@closingcomma\\\signature   % 0: closing on the next line
        \or\par\closing\@closingcomma\\[\signatureskip]\signature % 1: whiteskip
        \or\autographA
        \or\autographB
        \or\autographC
        \or\autographD
        \or\autographE
        \or\autographF
        \or\autographG
        \or\autographH
        \else
          \par\Undefined{autograph: \autographversion}\\
        \fi
    \end{minipage}
  }\fi
  \ifencldown\vspace*{\fill}\fi
  \ifx\enclosures\empty\else{\\[\enclosureskip]
    \noindent
    \begin{minipage}[t]{\hsize}
        \setbox1=\vbox{\enclosures}%
        \textbf{\ifdim\ht1>\baselineskip\enclosurestext\else\enclosuretext\fi}\\
        \enclosures
    \end{minipage}
  }\fi
  \ifx\copyto\empty\else{\\[\copytoskip]
    \noindent
    \begin{minipage}[t]{\hsize}
        \textbf{\copytotext}\\
        \copyto
    \end{minipage}
  }\fi
  \label{LastPageOf\thelettercount}
}}
\def\Cbox#1#2#3#4{%
  { \parskip=0pt\parindent=0pt
    \begin{textblock}{#3}[.5,.5](#1,#2)%
        \begin{center}
          #4
        \end{center}
    \end{textblock}
  }
}
\long\def\Tbox#1#2#3#4{%
  { \parskip0pt\parindent=0pt
    \begin{textblock}{#3}(#1,#2)%
        \begin{minipage}[t]{\hsize}
          \noindent#4
        \end{minipage}
    \end{textblock}
  }
}
\def\accept{
  \Tbox{\xacceptdescription}
       {\yacceptdescription}
       {\wacceptdescription}
       {\acceptdescription}
  \Tbox{\xacceptdesc}
       {\yacceptdesc}
       {\wacceptdesc}
       {\acceptdesc}
  \Tbox{\xacceptaddress}
       {\yacceptaddress}
       {\wacceptaddress}
       {\ifx\acceptaddress\empty\toname\\\toaddress\else\acceptaddress\fi}
  \Cbox{\xacceptreference}
       {\yacceptreference}
       {\wacceptreference}
       {\ocrb\acceptreference}
  \Tbox{\xacceptref}
       {\yacceptref}
       {\wacceptref}
       {\baselineskip=\acceptreferenceskip\ocrb\acceptreference}
  \Cbox{\xaccepteuros}
       {\yaccepteuros}
       {\waccepteuros}
       {\ocrb\accepteuros}
  \Cbox{\xacceptaccount}
       {\yacceptaccount}
       {\wacceptaccount}
       {\ocrb\acceptaccount}
  \Cbox{\xacceptcents}
       {\yacceptcents}
       {\wacceptcents}
       {\ocrb\acceptcents}
  \Cbox{\xaccepteur}
       {\yaccepteur}
       {\waccepteur}
       {\ocrb\accepteuros}
  \Cbox{\xacceptct}
       {\yacceptct}
       {\wacceptct}
       {\ocrb\acceptcents}
}
\input{isodoc-ca-ES.ldf}
\input{isodoc-de-DE.ldf}
\input{isodoc-en-GB.ldf}
\input{isodoc-en-US.ldf}
\input{isodoc-es-ES.ldf}
\input{isodoc-fr-FR.ldf}
\input{isodoc-it-IT.ldf}
\input{isodoc-nb-NO.ldf}
\input{isodoc-nl-BE.ldf}
\input{isodoc-nl-NL.ldf}
\input{isodoc-sr-RS.ldf}
\endinput
%%
%% End of file `isodoc.cls'.
