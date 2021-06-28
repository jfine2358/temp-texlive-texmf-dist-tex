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
%% Copyright (C) 2006 by Wybo Dekker <wybo@servalys.nl>
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
           [2009/11/16 v0.7 isodoc class for letters and invoices]
\ifnum\pdfoutput=1\else\ClassError{isodoc}{Compile me with pdflatex!}{}
\fi
%% \StopEventually{}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}
\RequirePackage{ctable,eurosym,graphicx,stringstrings}
\RequirePackage[dutch,norsk,german,frenchb,american,english]{babel}
\RequirePackage[a4paper,margin=35mm,nofoot,head=\baselineskip]{geometry}
\RequirePackage[absolute,overlay]{textpos}
\ifdim\paperwidth>\paperheight\TPGrid{297}{210}\else\TPGrid{210}{297}\fi
\definecolor{headcolor}{gray}{0}
\definecolor{headingcolor}{gray}{0}
\definecolor{markercolor}{gray}{0}
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\if@twoside
  \fancyhead[LE,RO]{\color{headingcolor}%
     \pagetext\ \thepage\ \oftext{} \pageref{LastPageOf\thelettercount}}
  \fancyhead[RE,LO]{\color{headingcolor}%
     \totext: \toname\ (\date)}
\else
  \fancyhead[L]{\color{headingcolor}%
     \totext: \toname\ (\date)}
  \fancyhead[R]{\color{headingcolor}%
     \pagetext\ \thepage\ \oftext{} \pageref{LastPageOf\thelettercount}}
\fi
\newif\ifpreamble\preambletrue
\AtBeginDocument{\preamblefalse}
\definecolor{isodocpink}{rgb}{1,.7,.7}
\def\Undefined#1{\colorbox{isodocpink}{Undefined #1}}
\def\@hft{\footnotesize\sffamily\color{headcolor}}
\define@key{isodoc}{fontpackage}{\def\fontpackage{#1}}
                                 \def\fontpackage{lmodern}
\def\@xyshift#1,#2@@@{\def\@xshift{#1}\def\@yshift{#2}}
\define@key{isodoc}{shift}{%
  \@xyshift#1@@@
  \AtBeginDocument{\textblockorigin{\@xshift mm}{\@yshift mm}}
}
\define@key{isodoc}{cityzip}[\cityziptrue]{\cityziptrue}
                                           \newif\ifcityzip\cityzipfalse
\define@key{isodoc}{foreign}[\foreigntrue]{\foreigntrue}
                                           \newif\ifforeign\foreignfalse
\define@key{isodoc}{localbank}[\localbanktrue]{\localbanktrue}
                                           \newif\iflocalbank\localbankfalse
\define@key{isodoc}{dutch}   []{\dutchdoc}
\define@key{isodoc}{english} []{\englishdoc}
                                \AtEndOfClass{\englishdoc}
\define@key{isodoc}{german}  []{\germandoc}
\define@key{isodoc}{american}[]{\americandoc}
\define@key{isodoc}{french}  []{\frenchdoc}
\define@key{isodoc}{norwegian}  []{\norwegiandoc}
\define@key{isodoc}{fill}  []{\rightskip=1\rightskip}
\define@key{isodoc}{nofill}[]{\rightskip=0mm plus 35mm}
                              \rightskip=0mm plus 35mm
\define@key{isodoc}{company}    {\def\company{#1}}
                                 \def\company{\Undefined{company}}
\define@key{isodoc}{logoaddress}{\def\logoaddress{#1}}
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
\define@key{isodoc}{addresscenter} {\def\addresscenter{#1}}
                                    \def\addresscenter{63.5}
\define@key{isodoc}{addresswidth}  {\def\addresswidth{#1}}
                                    \def\addresswidth{70}
\define@key{isodoc}{to}{\processto{#1}}\def\toname{Various people}
                                       \def\toaddress{\Undefined{to}}
\long\def\processto#1{\xproc #1\\@@@\ifx\toaddress\empty
    \else \yproc #1@@@\fi}
\long\def\xproc #1\\#2@@@{\def\toname{#1}\def\toaddress{#2}}
\long\def\yproc #1\\#2@@@{\def\toaddress{#2}}
\define@key{isodoc}{return}     []{\returntrue}
                    \newif\ifreturn\returnfalse
\define@key{isodoc}{noreturn}   []{\returnfalse}
\define@key{isodoc}{returnaddress}{\def\returnaddress{#1}}
\define@key{isodoc}{header}  []{\headertrue}
                 \newif\ifheader\headertrue
\define@key{isodoc}{noheader}[]{\headerfalse}
\define@key{isodoc}{bodyshift} {\advance\headerpos#1\advance\bodyskip#1mm}
                                \newdimen\bodyskip\bodyskip=0mm
\newcount\headerpos\headerpos=98
\define@key{isodoc}{footer}  []{\footertrue}
                 \newif\iffooter\footerfalse
\define@key{isodoc}{nofooter}[]{\footerfalse}
\define@key{isodoc}{areacode}   {\def\areacode{#1}}
                                 \def\areacode{\Undefined{areacode}}
\define@key{isodoc}{phone}      {\def\phone{#1}}
                                 \def\phone{}
\define@key{isodoc}{phoneprefix}{\def\phoneprefix{#1}}
                                 \def\phoneprefix{0}
\define@key{isodoc}{cellphone}  {\def\cellphone{#1}}
                                 \def\cellphone{}
\define@key{isodoc}{fax}        {\def\fax{#1}}
                                 \def\fax{}
\define@key{isodoc}{website}    {\def\website{#1}}
                                 \def\website{}
\define@key{isodoc}{email}      {\def\email{#1}}
                                 \def\email{}
\def\lead{\ifforeign+\areacode-\else\phoneprefix\fi}
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
                          \def\date{\Undefined{date}}
\define@key{isodoc}{forcedate}{\def\forcedate{#1}}\def\forcedate{}
\define@key{isodoc}{subject}{\def\subject{#1}}
                             \def\subject{}
\newcount\openingpos
\define@key{isodoc}{opening}     {\def\opening{#1}}
                                  \def\openingcomma{,}
\define@key{isodoc}{openingcomma}{\def\openingcomma{#1}}
                                  \def\opening{\Undefined{opening}}
\define@key{isodoc}{closing}    {\def\closing{#1,}}
                                 \def\closing{\Undefined{closing}} % Best regards,
\define@key{isodoc}{closingskip}{\closingskip=#1}
            \newdimen\closingskip\closingskip=2\baselineskip
\define@key{isodoc}{autograph}[2]{\def\autographversion{#1}}
                                  \def\autographversion{0}
\define@key{isodoc}{signature}{\def\signature{#1}}
                               \def\signature{\Undefined{signature}}
\define@key{isodoc}{enclosures} {\def\enclosures{#1}}
                                 \def\enclosures{}
\define@key{isodoc}{term}   [30]{\def\term{#1}}
\define@key{isodoc}{accountno}  {\def\accountno{#1}}
\define@key{isodoc}{routingno}  {\def\routingno{#1}}
\define@key{isodoc}{accountname}{\def\accountname{#1}}
\define@key{isodoc}{iban}       {\def\iban{#1}}
\define@key{isodoc}{bic}        {\def\bic{#1}}
\define@key{isodoc}{vatno}      {\def\vatno{#1}}
\define@key{isodoc}{chamber}    {\def\chamber{#1}}
                                 \def\chamber{Undefined{chamber}}
\define@key{isodoc}{currency}   {\def\currency{#1}}
 \def\currency{\EUR}
\define@key{isodoc}{accept}[E05]{\def\accepttype{#1}
                                 \newfont\ocrb{ocrb10}
                                }
\define@key{isodoc}{acceptaccount}    {\def\acceptaccount{#1}}
                                       \def\acceptaccount{}
\define@key{isodoc}{acceptaddress}    {\def\acceptaddress{#1}}
                                       \def\acceptaddress{}
\define@key{isodoc}{acceptcents}      {\def\acceptcents{#1}}
                                       \def\acceptcents{Undefined{}}
\define@key{isodoc}{acceptdescription}{\def\acceptdescription{#1}}
                                       \def\acceptdescription{}
\define@key{isodoc}{acceptdesc}       {\def\acceptdesc{#1}}
                                       \def\acceptdesc{}
\define@key{isodoc}{accepteuros}      {\def\accepteuros{#1}}
                                       \def\accepteuros{Undefined{}}
\define@key{isodoc}{acceptreference}  {\def\acceptreference{#1}}
                                       \def\acceptreference{Undefined{ref}}
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
\newdimen\myoutdent
\newdimen\signskip
\newdimen\mydown
\def\autograph#1#2#3#4#5#6#7{%
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
    \myoutdent=#3
    \signskip=#5\advance\signskip-#4
    \mydown=#6\advance\mydown-#4
    \par\hspace*{-#2\myoutdent}%
    \raisebox{-#2\mydown}[0bp][0bp]{\includegraphics[scale=#2]{#7}}\\[-\baselineskip]
    \closing\\[-2\baselineskip]\\[#2\signskip]\signature%
  }
}
\newcommand{\zippedcity}{\ifcityzip\city\ \prezip\ \zip\else\prezip\ \zip\ \city\fi}
\newcommand{\logo}{%
  { \parskip=0pt\parindent=0pt
    \begin{textblock}{140}[0,1](35,20)%
        \textsf{\LARGE\company}\\[-1.7ex] % large company name
        \rule{\hsize}{.3pt}               % on top a rule
    \end{textblock}
  }
  \Tbox{140}{22}{35}{\noindent
     \footnotesize\sffamily
     \ifx\undefined\logoaddress%
       \ifx\undefined\tbfigures\else\tbfigures\fi
       \ifx\who\empty\else\who\\\fi
       \ifx\street\empty\else\street\\\fi
       \zippedcity
       \ifforeign\\\country\fi
     \else\logoaddress\fi
  }
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
  \RequirePackage[T1]{fontenc}
  \RequirePackage{\fontpackage}\pdfprotrudechars=1
}
\newcount\@isoyear   \@isoyear=\year  \year=0
\newcount\@isomonth \@isomonth=\month
\newcount\@isoday     \@isoday=\day
\def\@isomakedate#1{%
  \def\@isoarg{#1}\def\@isotoday{today}
  \ifx\@isoarg\@isotoday
     \year=\@isoyear
    \month=\@isomonth
      \day=\@isoday
  \else
    \stringlength[q]{\@isoarg}
    \ifnum\theresult=10
      \substring[q]{\@isoarg}{5}{5}
      \if\thestring-\else\ClassError{isodoc}{
        Illegal date separator: \thestring (must be -)}{}\fi
      \substring[q]{\@isoarg}{8}{8}
      \if\thestring-\else\ClassError{isodoc}{
        Illegal date separator: \thestring (must be -)}{}\fi
    \else
      \ifnum\theresult=8\else\ClassError{isodoc}{
        Illegal date: not yyyymmdd | yyyy-mm-dd | today}{}\fi
    \fi
    \Treatments{0}{0}{0}{1}{0}{0}
    \substring[q]{\@isoarg}{1}{$} \let\@isodigits=\thestring \def\@isoarg{\thestring}
    \stringlength[q]{\@isodigits}
    \ifnum\theresult=8\else\ClassError{isodoc}{Illegal date: must have 8 digits}{}\fi
    \substring[q]{\@isoarg}{1}{4}  \year=\thestring \def\@isoarg{\@isodigits}
    \substring[q]{\@isoarg}{5}{6} \month=\thestring \def\@isoarg{\@isodigits}
    \substring[q]{\@isoarg}{7}{8}   \day=\thestring \def\@isoarg{\@isodigits}
    \ifnum \month > 12 \ClassError{isodoc}{Illegal date: month>12}{}\fi
    \ifnum \day   > 31 \ClassError{isodoc}{Illegal date: day>31}{}\fi
  \fi
}
\def\footfield#1#2#3{%
  \ifx#3\empty\else
    \Tbox{\footcount}{275}{35}{\noindent
      {\@hft#1}\\
        #2#3
    }
    \advance\footcount35
  \fi
}
\def\accountdata{
  \textbf{\accountdatatext:}\\
  \begin{tabular}{@{}rl@{}}
    \ifx\term\undefined\else
             \termtext: & \term\ \daystext\\
    \fi
        \accountnotext: & \accountno\\
    \ifx\accountname\undefined\else
       \accountnametext: & \accountname{}\\
    \fi
    \ifx\routingno\undefined\else
       \routingnotext: & \routingno{}\\
    \fi
        \referencetext: & \ourref\\
    \ifforeign
      \iflocalbank\else
                  iban: & \scshape \iban\\
                   bic: & \scshape \bic\\
      \fi
    \fi
    \ifx\vatno\undefined\else
      \vatnotext: & \vatno\\
    \fi
  \end{tabular}
}
\def\showkeys{%
  \begin{tabular}{ll}
              accept & \accept\NN
       acceptaccount & \acceptaccount\NN
       acceptaddress & \acceptaddress\NN
         acceptcents & \acceptcents\NN
          acceptdesc & \acceptdesc\NN
   acceptdescription & \acceptdescription\NN
         accepteuros & \accepteuros\NN
     acceptreference & \acceptreference\NN
         accountname & \accountname\NN
           accountno & \accountno\NN
       addresscenter & \addresscenter\NN
        addresswidth & \addresswidth\NN
            areacode & \areacode\NN
           autograph & \autograph\NN
                 bic & \bic\NN
           cellphone & \cellphone\NN
             chamber & \chamber\NN
                city & \city\NN
             closing & \closing\NN
             company & \company\NN
             country & \country\NN
         countrycode & \countrycode\NN
            currency & \currency\NN
               email & \email\NN
          enclosures & \enclosures\NN
                 fax & \fax\NN
         fontpackage & \fontpackage\NN
           forcedate & \forcedate\NN
                iban & \iban\NN
         leftaddress & \leftaddress\NN
         logoaddress & \logoaddress\NN
             opening & \opening\NN
        openingcomma & \openingcomma\NN
              ourref & \ourref\NN
               phone & \phone\NN
         phoneprefix & \phoneprefix\NN
       returnaddress & \returnaddress\NN
        rightaddress & \rightaddress\NN
           routingno & \routingno\NN
           signature & \signature\NN
              street & \street\NN
             subject & \subject\NN
                term & \term\NN
               vatno & \vatno\NN
             website & \website\NN
                 who & \who\NN
          yourletter & \yourletter\NN
             yourref & \yourref\NN
                 zip & \zip\NN
  \end{tabular}
}
\AtEndOfClass{%
  \usepackage{hyperref}
   \year=0
}
\AtEndDocument{%
  \hypersetup{pdfauthor={\who},
              pdfproducer={isodoc v\fileversion},
  }
}
\def\itable#1{
  \begin{tabularx}{\hsize}{@{}X@{\barsep\quad\qquad}r@{}}
    \multicolumn{2}{@{}c@{}}{\sffamily\descriptiontext\hfill
    \amounttext (\currency)}\ML
    #1
  \end{tabularx}
}
\def\iitem#1#2{#1&#2\NN}
\def\itotal#1{\cmidrule[.05em]{2-2}\Totaltext&\textbf{#1}\NN}
\newcounter{lettercount}\setcounter{lettercount}{0}
\AtEndDocument{\label{LastPageOf\thelettercount}}
\newif\ifclosing\closingtrue
\newcount\footcount
\newcommand{\invoice}[2][]{%
  \closingfalse
  \def\barsep{\raisebox{-1.5ex}[0pt][0pt]{\rule{.05em}{4ex}}}%
  \letter[#1,opening=\invoicetext,openingcomma={},closing={},signature={}]{%
    \Tbox{35}{127}{140}{#2}
  }
}
\newcommand{\letter}[2][]{{ % extra brace keeps option changes local
  \setkeys{isodoc}{#1}
  \hypersetup{pdftitle={letter to \toname\ dated \today},
              pdfsubject={\subject}}
  \label{LastPageOf\thelettercount}
  \newpage
  \addtocounter{lettercount}{1}
  \setcounter{page}{1}
  \setcounter{footnote}{0}
  \logo
  { \parskip=0pt\parindent=0pt
    \begin{textblock}{\addresswidth}[0,.5](\xaddress,\addresscenter)%
        \ifreturn
          {\def\\{\unskip\enspace\textbullet\enspace\ignorespaces}%
            \sffamily\bfseries\scriptsize\returnaddress
          }\\[-.8\baselineskip]
          \rule{\hsize}{.2pt}\\
        \fi
        \toname\\\toaddress
    \end{textblock}
  }
  \openingpos=\headerpos
  \ifheader
    \advance\openingpos12
    \advance\bodyskip12mm
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
      \ifx\forcedate\empty%
        \ifnum\year=0\Undefined{date}\else\date\fi
      \else\forcedate\fi
    }
    \ifx\subject\empty\else%
     \advance\openingpos10
      \advance\bodyskip10mm
      \Tbox{35}{108}{105}{\noindent
        \begin{tabularx}{\hsize}{@{}l>{\raggedright}X@{}}
          \@hft\subjecttext&\subject
        \end{tabularx}
      }
    \fi
  \fi
  \footcount=35
  \iffooter
    \footfield{\websitetext}{}{\website}
    \footfield{\phonetext}{\lead}{\phone}
    \footfield{\cellphonetext}{\lead}{\cellphone}
    \footfield{\faxtext}{\lead}{\fax}
    \footfield{\emailtext}{}{\email}
  \fi
  { \parskip=0pt\parindent=0pt
    \begin{textblock*}{3mm}(\xfold,\yfold)%
       {\color{markercolor}\rule{\hsize}{.2pt}}
    \end{textblock*}
  }
  \ifx\undefined\accepttype\else\accept\fi
  \ifx\subject\empty\vspace*{80mm}\else\vspace*{90mm}\fi
  \noindent\Tbox{35}{\ifx\subject\empty110\else120\fi}{140}{\opening\openingcomma}
  \thispagestyle{empty}

  \thispagestyle{empty}
  \noindent
  #2
  {\parindent=0pt\parskip=\baselineskip
    \ifclosing
      \ifcase\autographversion
        \par\closing\\\signature                % 0: closing on the next line
      \or\par\closing\\[\closingskip]\signature % 1: whiteskip
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
    \fi
    \ifx\enclosures\empty\else
      \vfill
      \setbox1=\vbox{\enclosures}%
      \textbf{\ifdim\ht1>\baselineskip\enclosurestext\else\enclosuretext\fi}%
      \\\enclosures
    \fi
  }
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
\def\set@lang#1{%
  \ifpreamble\AtBeginDocument{\selectlanguage{#1}}%
  \else\selectlanguage{#1}\fi}
\def\dutchdoc{%
  \set@lang{dutch}
  \def\yourlettertext{Uw brief van}
  \def\yourreftext{Uw kenmerk}
  \def\ourreftext{Ons kenmerk}
  \def\datetext{Datum}
  \def\totext{Aan}
  \def\pagetext{Bladnummer}
  \def\oftext{van}
  \def\date{\number\day~\ifcase\month\or
    januari\or februari\or maart\or april\or mei\or juni\or juli\or
    augustus\or september\or oktober\or november\or december\fi
    \space \number\year}
  \def\subjecttext{Onderwerp:}
  \def\ccname{Cc:}
  \def\enclosuretext{Bijlage:}
  \def\enclosurestext{Bijlagen:}
  \def\faxtext{telefax}
  \def\websitetext{webstek}
  \def\emailtext{email}
  \def\phonetext{telefoon}
  \def\cellphonetext{mobiel}
  \def\chambertext{kvk}
  \def\invoicetext{{\bfseries\Large\scshape rekening}}
  \def\descriptiontext{Omschrijving}
  \def\amounttext{Bedrag}
  \def\accountdatatext{Betalingsgegevens}
  \def\termtext{betalingstermijn}
  \def\daystext{dagen}
  \def\accountnotext{rekening nr}
  \def\accountnametext{ten name van}
  \def\referencetext{kenmerk}
  \def\chambertext{kvk}
  \def\vatnotext{btw nr}
  \def\Vattext{Btw}
  \def\Totaltext{Totaal}
}
\def\englishdoc{%
  \set@lang{english}
  \def\yourlettertext{Your letter of}
  \def\yourreftext{Your reference}
  \def\ourreftext{Our reference}
  \def\datetext{Date}
  \def\totext{To}
  \def\pagetext{Page}
  \def\oftext{of}
  \def\date{\ifcase\day\or
    1st\or 2nd\or 3rd\or 4th\or 5th\or
    6th\or 7th\or 8th\or 9th\or 10th\or
    11th\or 12th\or 13th\or 14th\or 15th\or
    16th\or 17th\or 18th\or 19th\or 20th\or
    21st\or 22nd\or 23rd\or 24th\or 25th\or
    26th\or 27th\or 28th\or 29th\or 30th\or
    31st\fi~\ifcase\month\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December\fi
    \space \number\year}
  \def\subjecttext{Subject:}
  \def\ccname{cc}
  \def\enclosuretext{Enclosure:}
  \def\enclosurestext{Enclosures:}
  \def\faxtext{telefax}
  \def\websitetext{website}
  \def\emailtext{email}
  \def\phonetext{telephone}
  \def\cellphonetext{cellphone}
  \def\invoicetext{{\bfseries\Large\scshape invoice}}
  \def\descriptiontext{Description}
  \def\amounttext{Amount}
  \def\accountdatatext{Banking data}
  \def\termtext{term of payment}
  \def\daystext{days}
  \def\accountnotext{Account no.}
  \def\accountnametext{to the name of}
  \def\referencetext{Reference}
  \def\chambertext{ch.comm.}
  \def\vatnotext{vat no.}
  \def\Vattext{Vat}
  \def\Totaltext{Total}
}
\def\americandoc{%
  \set@lang{american}
  \def\yourlettertext{Your letter of}
  \def\yourreftext{Your reference}
  \def\ourreftext{Our reference}
  \def\datetext{Date}
  \def\totext{To}
  \def\pagetext{Page}
  \def\oftext{of}
  \def\date{\ifcase\month\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December\fi
    \space\number\day, \number\year}
  \def\subjecttext{Subject:}
  \def\ccname{cc}
  \def\enclosuretext{Enclosure:}
  \def\enclosurestext{Enclosures:}
  \def\faxtext{telefax}
  \def\websitetext{website}
  \def\emailtext{email}
  \def\phonetext{telephone}
  \def\cellphonetext{cellphone}
  \def\invoicetext{{\bfseries\Large\scshape invoice}}
  \def\descriptiontext{Description}
  \def\amounttext{Amount}
  \def\accountdatatext{Bank details}
  \def\termtext{term of payment}
  \def\daystext{days}
  \def\accountnotext{Account no.}
  \def\accountnametext{to the name of}
  \def\referencetext{Reference}
  \def\chambertext{ch.comm.}
  \def\vatnotext{vat no.}
  \def\Vattext{Vat}
  \def\Totaltext{Total}
}
\def\germandoc{%
  \set@lang{german}
  \def\yourlettertext{Ihr Brief vom}
  \def\yourreftext{Ihr Zeichen}
  \def\ourreftext{Unser Zeichen}
  \def\datetext{Datum}
  \def\totext{An}
  \def\pagetext{Seite}
  \def\oftext{aus}
  \def\date{\number\day.~\ifcase\month\or
    Januar\or Februar\or M\"arz\or April\or Mai\or Juni\or
    Juli\or August\or September\or Oktober\or November\or Dezember\fi
    \space\number\year}
  \def\subjecttext{Betrifft:}
  \def\ccname{Kopien an}
  \def\enclosuretext{Anlage:}
  \def\enclosurestext{Anlagen:}
  \def\faxtext{Telefax}
  \def\websitetext{Webseite}
  \def\emailtext{Email}
  \def\phonetext{Telefon}
  \def\cellphonetext{Handy}
  \def\invoicetext{{\bfseries\Large\scshape rechnung}}
  \def\descriptiontext{Umschreibung}
  \def\amounttext{Betrag}
  \def\accountdatatext{Bezahlungsdaten}
  \def\termtext{Zahlungstermin}
  \def\daystext{Tage}
  \def\accountnotext{Konto Nr}
  \def\routingnotext{BLZ}
  \def\accountnametext{Name}
  \def\referencetext{Beleg Nr}
  \def\chambertext{Register Nr}
  \def\vatnotext{Ustid Nr}
  \def\Vattext{MwSt}
  \def\Totaltext{Insgesamt}
}
\def\frenchdoc{%
  \set@lang{french}
  \def\yourlettertext{Votre lettre du}
  \def\yourreftext{Vos r\'ef\'erences:}
  \def\ourreftext{Nos r\'ef\'erences:}
  \def\datetext{Date:}
  \def\totext{\`A l'attention de}
  \def\pagetext{Page}
  \def\oftext{de}
  \def\date{\number\day\ifnum\day=1$^{er}$\fi
    ~\ifcase\month\or janvier\or
    f\'evrier\or mars\or avril\or mai\or juin\or
    juillet\or ao\^ut\or septembre\or octobre\or
    novembre\or d\'ecembre\fi \space \number\year}
  \def\subjecttext{Objet:}
  \def\ccname{Copie \`a}
  \def\enclosuretext{Pi\`ece jointe:}
  \def\enclosurestext{Pi\`eces jointes:}
  \def\faxtext{t\'el\'efax}
  \def\websitetext{site Web}
  \def\emailtext{email}
  \def\phonetext{t\'el\'ephone}
  \def\cellphonetext{portable}
  \def\invoicetext{{\bfseries\Large\scshape facture}}
  \def\descriptiontext{Description}
  \def\amounttext{Montant}
  \def\accountdatatext{Donn\'ees banquaires}
  \def\termtext{terme}
  \def\daystext{jours}
  \def\accountnotext{no. compte}
  \def\accountnametext{au nom de}
  \def\referencetext{r\'ef\'erence}
  \def\chambertext{c.c.i.}
  \def\vatnotext{no. T.V.A.}
  \def\Vattext{T.V.A.}
  \def\Totaltext{Total}
}
\def\norwegiandoc{%
  \set@lang{norsk}
  \def\yourlettertext{Deres brev av}
  \def\yourreftext{Deres ref:}
  \def\ourreftext{V\aa{}r ref:}
  \def\datetext{Dato}
  \def\totext{Til}
  \def\pagetext{Side}
  \def\oftext{av}
  \def\date{\number\day.~\ifcase\month\or
   januar\or februar\or mars\or april\or mai\or juni\or
   juli\or august\or september\or oktober\or november\or desember\fi
   \space \number\year}
  \def\subjecttext{Vedr:}
  \def\ccname{kopi til:}
  \def\enclosuretext{Vedlegg:}
  \def\enclosurestext{Vedlegg:}
  \def\faxtext{telefaks}
  \def\websitetext{hjemmeside}
  \def\emailtext{e-post}
  \def\phonetext{telefon}
  \def\cellphonetext{mobil}
  \def\invoicetext{{\bfseries\Large\scshape faktura}}
  \def\descriptiontext{Beskrivelse}
  \def\amounttext{Bel\o{}p}
  \def\accountdatatext{betales til}
  \def\termtext{betalingsfrist}
  \def\daystext{dager}
  \def\accountnotext{faktura nr}
  \def\accountnametext{til}
  \def\referencetext{referanse}
  \def\chambertext{}
  \def\vatnotext{Org. nr.}
  \def\Vattext{Mva}
  \def\Totaltext{Total}
}
\endinput
%%
%% End of file `isodoc.cls'.
