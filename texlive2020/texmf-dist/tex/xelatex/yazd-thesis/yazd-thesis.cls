
%%
%%  This is file `yazd-thesis.cls',
%%   __________________________________
%%   Copyright © 2015-2019 Vahid Damanafshan
%%   http://xelinic.ir
%%   vdamanafshan@gmail.com
%% 
%% 
\NeedsTeXFormat{LaTeX2e}
\def\yazd-thesisversion{0.3}
\ProvidesClass{yazd-thesis}
              [2019/07/25 v\yazd-thesisversion\space A template for the Yazd University]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[a4paper,11pt]{book}
%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{calc}
\RequirePackage[top=3cm, bottom=2.5cm, left=4cm, right=2.5cm]{geometry}
\RequirePackage[]{graphicx}
\graphicspath{{figures/}}
\RequirePackage{array}
\newcolumntype{C}[1]{>{\raggedleft\centering\arraybackslash}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}
\newcolumntype{M}[1]{>{\raggedleft\centering\arraybackslash}m{#1}}
\RequirePackage{multicol} 
\RequirePackage{fancyhdr}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{zref-perpage}
\zmakeperpage{footnote}
\RequirePackage{makeidx}
\makeindex
\RequirePackage[]{xcolor}
\RequirePackage[]{hyperref}


\newcommand{\besmwidth}[1]{\def\@besmwidth{#1}}
\def\department#1{\gdef\@department{#1}}
\def\thesisdate#1{\gdef\@thesisdate{#1}}
\newcommand{\firstsupervisor}[1]{\def\@firstsupervisor{#1}}
\newcommand{\secondsupervisor}[1]{\def\@secondsupervisor{#1}}
\newcommand{\firstadvisor}[1]{\def\@firstadvisor{#1}}
\newcommand{\secondadvisor}[1]{\def\@secondadvisor{#1}}
\def\name#1{\gdef\@name{#1}}
\def\surname#1{\gdef\@surname{#1}}
\newcommand{\credit}[1]{\def\@credit{#1}}
\newcommand{\defensedate}[1]{\def\@defensedate{#1}}
\newcommand{\grade}[1]{\def\@grade{#1}}
\newcommand{\letgrade}[1]{\def\@letgrade{#1}}
\newcommand{\degree}[1]{\def\@degree{#1}}
\newcommand{\firstinternalreferee}[1]{\def\@firstinternalreferee{#1}}
\newcommand{\secondinternalreferee}[1]{\def\@secondinternalreferee{#1}}
\newcommand{\firstexternalreferee}[1]{\def\@firstexternalreferee{#1}}
\newcommand{\secondexternalreferee}[1]{\def\@secondexternalreferee{#1}}
\newcommand{\viewer}[1]{\def\@viewer{#1}}
\newcommand{\totext}[1]{\def\@totext{#1}}
\newcommand{\ack}[1]{\def\@ack{#1}}
\newcommand{\faabstract}[1]{\def\@faabstract{#1}}
\def\faculty#1{\gdef\@faculty{#1}}
\def\subject#1{\gdef\@subject{#1}}
\def\field#1{\gdef\@field{#1}}
\def\department#1{\gdef\@department{#1}}
\def\campus#1{\gdef\@campus{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%
\def\latintitle#1{\gdef\@latintitle{#1}}
\def\latinthesisdate#1{\gdef\@latinthesisdate{#1}}
\def\latinfaculty#1{\gdef\@latinfaculty{#1}}
\def\latindepartment#1{\gdef\@latindepartment{#1}}
\def\latinfield#1{\gdef\@latinfield{#1}}
\def\firstlatinsupervisor#1{\gdef\@firstlatinsupervisor{#1}}
\def\secondlatinsupervisor#1{\gdef\@secondlatinsupervisor{#1}}
\def\firstlatinadvisor#1{\gdef\@firstlatinadvisor{#1}}
\def\secondlatinadvisor#1{\gdef\@secondlatinadvisor{#1}}
\def\latinname#1{\gdef\@latinname{#1}}
\def\latinsurname#1{\gdef\@latinsurname{#1}}
\def\latincampus#1{\gdef\@latincampus{#1}}
\newcommand{\enabstract}[1]{\def\@enabstract{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\if@mscthesis
\@mscthesisfalse

\newif\if@minutes
\DeclareOption{minutes}{\@minutestrue}   

\DeclareOption{msc}{\@mscthesistrue}
\ProcessOptions
%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\mychapter}[1]{%
\phantomsection%
\addcontentsline{toc}{chapter}{#1}\chapter*{#1}\markboth{#1}{#1}%
}

\newcommand{\yazdtitle}{%
\pagenumbering{adadi}
\thispagestyle{empty}
\begin{minipage}[c][\textheight][c]{\textwidth}%
\centering
\includegraphics[width=
\ifx\@besmwidth\undefined%
.9\textwidth
\else
\@besmwidth\textwidth
\fi
]{besm}
\end{minipage}%
%\cleardoublepage%~
\newpage
\thispagestyle{empty}
\vspace*{\fill}
\noindent
\textcolor{gray}{
آماده‌شده توسط کلاس 
\texttt{yazd-thesis}،
نسخه 
\lr{\yazd-thesisversion}}
\cleardoublepage%~
\newpage
%\vspace*{\fill} 
%{\large \bfseries \noindent 
\thispagestyle{empty}
\renewcommand{\arraystretch}{2.25}%
{\ypfont
\begin{tabular}{|M{2cm}|@{}M{7.95cm}@{}|m{3.5cm}|}
\hline
\vspace{5pt}
\includegraphics[scale=.20]{logo}
&
{\large \bfseries 
تعهد رعایت حقوق معنوی دانشگاه یزد
}
&
شناسه مدرک:
\if@mscthesis 
\lr{\yefont EP/F013}
\else
\lr{\yefont EP/F114}
\fi
\par
ویرایش:
\if@mscthesis 
۰
\else
بهار ۱۳۹۸
\fi
\par
شماره صفحات: ۱ از ۱
\\ \hline
\multicolumn{3}{|p{14cm}|}{
\if@mscthesis
\baselineskip=.85cm
\else
\baselineskip=.73cm
\fi
اینجانب        
\@name  \@surname\
\if@mscthesis
 دانش‌آموخته مقطع كارشناسی ارشد
\else
دانشجوی مقطع دکتری
\fi
 در رشتهٔ
\@subject \
گرایش
\@field \
که در تاریخ
\@defensedate \
از 
\if@mscthesis 
 پایان‌نامه
\else
رساله
\fi
خود تحت عنوان:
\@title
\par
با کسب درجه
 \ifx\@degree\undefined
\hphantom{عالی}
\else
\@degree\
\fi
دفاع نموده‌ام، شرعاً و قانوناً متعهد می‌شوم: 
\par
\if@mscthesis 
1)‌ مطالب مندرج در این پایان‌نامه حاصل تحقیق و پژوهش اینجانب بوده و در مواردی که از دستاوردهای علمی و پژوهشی دیگران اعم از پایان‌نامه، کتاب، مقاله و غیره استفاده نموده‌ام، رعایت کامل امانت را نموده. مطابق مقررات. ارجاع و در فهرست منابع مآخذ اقدام به ذکر آنها نموده‌ام. 
\par
2) تمام یا بخشی از این  پایان‌نامه قبلاً برای دریافت هیچ مدرک تحصیلی (هم‌سطح، پایین‌تر یا بالاتر) در سایر دانشگاه‌ها و مؤسسات آموزش عالی ارائه نشده است. 
\par
3) مقالات مستخرج از این پایان‌نامه کاملاً حاصل کار اینجانب بوده و از هرگونه جعل داده و یا تغییر اطلاعات پرهیز نموده‌ام. 
\par
4) از ارسال همزمان و یا تکراری مقالات مستخرج از این پایان‌نامه (با بیش از 30 درصد همپوشانی) به نشریات و یا کنگره‌های گوناگون خودداری نموده و می‌نمایم. 
\par
5)‌ کلیه حقوق مادی و معنوی حاصل از این پایان‌نامه متعلق به دانشگاه یزد بوده و متعهد می‌شوم هرگونه بهره‌مندی و یا نشر دستاوردهای حاصل از این تحقیق یا غیر از آن اعم از چاپ کتاب، مقاله، ثبت اختراع و غیره (در زمان دانشجویی و یا بعد از فراغت از تحصیل) با کسب اجازه از تیم استادان راهنما و مشاور و حوزه پژوهشی دانشکده / گروه باشد. 
\par
6) در صورت اثبات تخلف (در هر زمان) مسئولیت حقوقی آن بطور کامل برعهده اینجانب بوده و می‌پذیرم مدرک تحصیلی صادر شده توسط دانشگاه یزد از درجه اعتبار ساقط و اینجانب هیچگونه ادعایی نخواهم داشت. 
\else
1)‌ مطالب مندرج در این رساله حاصل تحقیق و پژوهش اینجانب بوده و در مواردی که از دستاوردهای علمی و پژوهشی دیگران اعم از پایان‌نامه، کتاب، مقاله و غیره استفاده نموده‌ام، رعایت کامل امانت را نموده. مطابق مقررات. ارجاع و در فهرست منابع مآخذ اقدام به ذکر آنها نموده‌ام. 
\par
2) تمام یا بخشی از این رساله قبلاً برای دریافت هیچ مدرک تحصیلی (هم‌سطح، پایین‌تر یا بالاتر) در سایر دانشگاه‌ها و مؤسسات آموزش عالی ارائه نشده است. 
\par
3) مقالات مستخرج از این رساله کاملاً حاصل کار اینجانب بوده و از هرگونه جعل داده و یا تغییر اطلاعات پرهیز نموده‌ام. همچنین با آگاهی کامل از مفاد اصول اخلاق علمی، خود را ملزم به رعایت آن و عدم انجام سرقت و جعل علمی می‌دانم. 
\par
4) از ارسال همزمان و یا تکراری مقالات مستخرج از این رساله (با بیش از 30 درصد همپوشانی) به نشریات و یا کنگره‌های گوناگون خودداری نموده و می‌نمایم. 
\par
5)‌ کلیه حقوق مادی و معنوی حاصل از این رساله متعلق به دانشگاه یزد بوده و متعهد می‌شوم هرگونه بهره‌مندی و یا نشر دستاوردهای حاصل از این تحقیق یا غیر از آن اعم از چاپ کتاب، مقاله، ثبت اختراع و غیره (در زمان دانشجویی و یا بعد از فراغت از تحصیل) با کسب اجازه از تیم استادان راهنما و مشاور و حوزه پژوهشی دانشکده / گروه باشد. 
\par
6) در صورت اثبات تخلف (در هر زمان) مسئولیت حقوقی آن بطور کامل برعهده اینجانب بوده و می‌پذیرم مدرک تحصیلی صادر شده توسط دانشگاه یزد از درجه اعتبار ساقط و اینجانب هیچگونه ادعایی نخواهم داشت. 
\par
7) قبل از گرفتن نوبت دفاع، کاربرگ ارزشیابی استاد راهنما را به طور دقیق در سیستم آموزشی گلستان تکمیل کرده‌ام. 
\par
8) برای انجام مراحل بعد از دفاع آیین‌نامه‌ها و شیوه‌نامه‌های مربوط در وب‌سایت تحصیلات تکمیلی دانشگاه را بطور دقیق مطالعه کرده‌ام و به مفاد آنها پایبند هستم.
\fi
\par
\mbox{}
\par
\hspace*{9cm}
\begin{minipage}{6cm}
\@name  \@surname\
\par
امضاء و تاریخ:
\end{minipage}
\par
\mbox{}
\par
}
\\\hline
\end{tabular}
\cleardoublepage%~
\newpage
\begin{titlepage}
{\huge \bfseries
دانــــشگاه یــــزد
}
\\[15pt]
{\Large\@campus
\\[10pt]
\@faculty}
\par
\vspace{.3\baselineskip}
{\large\bfseries
\if@mscthesis
پایان‌نامه 
\else
رساله
\fi
\\[4mm]
برای دریافت درجه
\if@mscthesis
کارشناسی ارشد
\else
دکتری
\fi
}
\vskip 2ex
\centerline{\large \bfseries
\@field}
\vskip 6ex
\Large\bfseries
عنوان
\\[4mm]
{\huge\bfseries {\@title}}
\baselineskip=1.5cm\par
\vskip 4ex
 \baselineskip=.5cm
\large
{\ifx\@firstsupervisor\undefined%
\ifx\@secondsupervisor\undefined%
\else\fi
\else
\ifx\@secondsupervisor\undefined%
{\large\bfseries
استاد راهنما
\\[4mm]
\@firstsupervisor}
\else
{\large\bfseries 
استادان راهنما
\\[4mm]
\@firstsupervisor{} و \@secondsupervisor}
\fi\fi}
\par\large
{\ifx\@firstadvisor\undefined%
\ifx\@secondadvisor\undefined%
\else\fi
\else
\ifx\@secondadvisor\undefined%
{\large\bfseries
استاد مشاور
\\[4mm]
\@firstadvisor}
\else
{\large\bfseries
استادان مشاور
\\[4mm]
\@firstadvisor{} و \@secondadvisor}
\fi\fi}

{\large\bfseries%
پژوهش و نگارش
\\[4mm]
\@name\  \@surname}\par
{\large \@thesisdate}
\end{titlepage}}
\cleardoublepage%~
\newpage
\ifx\@totext\undefined%
\else
\thispagestyle{empty}
\@totext
\fi
\cleardoublepage%~
\newpage
\thispagestyle{empty}
\ifx\@ack\undefined%
\else
\thispagestyle{empty}
\@ack
\fi
\cleardoublepage%~
\newpage
\if@minutes
\thispagestyle{empty}
{\minutesfont
\centerline{بسمه تعالی}%
\vspace{1em}%
\renewcommand{\arraystretch}{2.25}%
\begin{tabular}{|M{3.4cm}|@{}M{6.95cm}@{}|M{3cm}|}
\hline
\vspace{1pt}
\includegraphics[scale=.20]{logo}\par
\vspace{-2mm}
{\small 
مدیریت تحصیلات تکمیلی
}
&
\baselineskip=1cm
{\large \bfseries 
صورتجلسه دفاعیه پایان‌نامه دانشجوی
\par
دوره
\if@mscthesis 
کارشناسی ارشد
\else
دکتری
\fi
}
&
\if@mscthesis 
شناسه: ب/ک/\lr{3}
\else
شناسه: ب/د/\lr{3}
\fi
\\ \hline
\multicolumn{3}{|p{14cm}|}{
\baselineskip=1cm
جلسه دفاعیه
\if@mscthesis
پایان‌نامه 
\else
رساله
\fi 
 تحصیلی آقای/خانم:          
\@name \  \@surname
\hfill
 دانشجوی
\if@mscthesis 
 كارشناسی ارشد
\else
دکتری
\fi
\par
 رشتـه/گرایش:       
\@subject/\@field
\par                                        
تحت عنوان:        
\@title
\par                                                                                                        
و تعداد واحد:   
\hskip 1ex
\ifx\@credit\undefined
\else
\@credit
\fi
\hskip 1ex
در تاریخ 
\ifx\@credit\undefined
\else
\@defensedate\
\fi \
 با حضور اعضای هيأت داوران (به شرح ذیل) تشكيل گرديد.
\par
پس از ارزيابی توسط هيأت داوران، پايان‌نامه با نمره به عدد 
\ifx\@grade\undefined
\hphantom{۱۹٫۲۵}
\else
\@grade\
\fi
به حروف    
\ifx\@letgrade\undefined
\hphantom{نوزده و بیست و پنج صدم}
\else
\@letgrade\
\fi                        
و  درجه      
\ifx\@degree\undefined
\hphantom{عالی}
\else
\@degree\
\fi
 مورد تصويب قرار گرفت.

\vspace{2em}
\begin{tabular}{@{}R{4.2cm}C{5.7cm}C{3cm}@{}}
%%\hline
\multicolumn{1}{c}{\underline{عنوان}}
 &
\underline{نام و نام خانوادگی}
&
\underline{امضاء}%
\\[1em]
%%\hline
استاد/استادان راهنما:
\if@mscthesis
\else 
الف:
\ifx\@secondsupervisor\undefined
\else
\newline
\hphantom{استاد/استادان راهنما:}
ب:
 \fi
 \fi
 & 
 \@firstsupervisor{}
 \ifx\@secondsupervisor\undefined
 \else
 \par
 \@secondsupervisor
 \fi
 &
\\[2em]
استاد/استادان مشاور:
\if@mscthesis
\else
الف:
\ifx\@secondadvisor\undefined
\else
\newline
\hphantom{استاد/استادان مشاور:}
ب:
 \fi
 \fi
&
\ifx\@firstadvisor\undefined
  \else
   \@firstadvisor
\fi
 \ifx\@secondadvisor\undefined
 \else
 \par
 \@secondadvisor
 \fi
 &
\\[2em]
\if@mscthesis 
متخصص و صاحبنظر داخلی:
\else
داور داخل گروه: 
\fi
\if@mscthesis
\else 
الف:
\ifx\@secondinternalreferee\undefined
 \else
 \newline
\hphantom{داور داخل گروه:}
ب:
 \fi
 \fi
&
\ifx\@firstinternalreferee\undefined
  \else
   \@firstinternalreferee
\fi
 \ifx\@secondinternalreferee\undefined
 \else
 \par
 \@secondinternalreferee
 \fi
 &
\\[2em] 
\if@mscthesis 
متخصص و صاحبنظر خارجی:
\else
داور خارج از گروه: 
\fi
\if@mscthesis
\else 
الف:
\ifx\@secondexternalreferee\undefined
\else
\newline
\hphantom{داور خارج از گروه:}
ب:
 \fi
 \fi
 & 
 \@firstexternalreferee{}
 \ifx\@secondexternalreferee\undefined
 \else
 \par
 \@secondexternalreferee
 \fi
 &
\\[1.5cm] 
&
\multicolumn{2}{R{7cm}}{
\baselineskip=.7cm
نماينده تحصيلات تكميلی دانشگاه (ناظر)
\par
نام ونام خانوادگی:
\ifx\@viewer\undefined
  \else
   \@viewer
\fi
\par
امضاء:
}
\\[5em]
%%\hline 
\end{tabular} 
}
\\ \hline
\end{tabular}
}% end of \bnazanin font
\fi
\cleardoublepage%~
\newpage
\ifx\@faabstract\undefined%
\else
\@faabstract
\thispagestyle{empty}
\fi
\if@minutes
\cleardoublepage
\else
\cleardoublepage\clearpage
\fi
}

\def\titlepage{\newpage\centering
  \thispagestyle{empty}
  \parindent 0pt \parskip 10pt plus 1fil minus 1fil
  \def\baselinestretch{1}\@normalsize\vbox to \vsize\bgroup\vbox to 9in\bgroup}
\def\endtitlepage{\par\kern 0pt\egroup\vss\egroup\newpage}

\def\signature{\vspace{1cm}
\begin{flushleft}
{\scriptsize \@name\ \@surname \\
\@thesisdate}
\end{flushleft}}

\newcommand{\latinyazdtitle}{%
\cleardoublepage%~
\newpage
\newgeometry{left=2.5cm, right=4cm}
\ifx\@enabstract\undefined%
\else
\@enabstract
\fi
\clearpage~
\thispagestyle{empty}
\begin{titlepage}
\yefont
{\huge \bfseries
Yazd University
}
\\[10pt]
{\Large \@latinfaculty
\\[10pt]
\@latindepartment}
\par
\vspace{4em}
{\Large
 \if@mscthesis
A Thesis Submitted in Partial Fulfillment of the Requirements for\\[1em]
the Master Degree in \@latinfield
\else
A Dissertation Submitted in Partial Fulfillment of the\\[1em]
Requirements for the Ph.D. in \@latinfield
\fi
}
\par
\vspace{5em}
{\Large \bfseries Title}
\par
{\Large\bfseries\@latintitle}
\baselineskip=1cm \par
\vskip 2cm
\ifx\@firstlatinsupervisor\undefined%
\ifx\@secondlatinsupervisor\undefined%
\else\fi
\else
\ifx\@secondlatinsupervisor\undefined%
{\large\bfseries
Supervisor\\
\@firstlatinsupervisor}
\else
{\large\bfseries
Supervisors\\
 \@firstlatinsupervisor{} and \@secondlatinsupervisor}
\fi\fi
\par
\vskip 7mm
\ifx\@firstlatinadvisor\undefined%
\ifx\@secondlatinadvisor\undefined%
\else\fi
\else
\ifx\@secondlatinadvisor\undefined%
{\large\bfseries
Advisor\\
\@firstlatinadvisor}
\else
{\large\bfseries
Advisors\\
\@firstlatinadvisor{} and \@secondlatinadvisor}
\fi\fi
\vskip 7mm
{\large\bfseries By\\
\@latinname \; \@latinsurname}\par
\vskip 5mm
\par
\vskip 1cm
{\@latinthesisdate}
\par
\vskip 1cm
\par
\vfill
%
\end{titlepage}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\persiangloss[2]{#1\dotfill\lr{#2}\\}
\newcommand\englishgloss[2]{#2\dotfill\lr{#1}\\}
%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{
\theoremstyle{definition}
\newtheorem{definition}{تعریف}[section]
\newtheorem{observation}{مشاهده}[section]
\theoremstyle{plain}
\newtheorem{theorem}[definition]{قضیه}
\newtheorem{lemma}[definition]{لم}
\newtheorem{proposition}[definition]{گزاره}
\newtheorem{corollary}[definition]{نتیجه}
\newtheorem{remark}[definition]{ملاحظه}
\theoremstyle{definition}
\newtheorem{example}[definition]{مثال}
\renewcommand{\bibname}{منابع و مآخذ}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy}
\fancyhf{} 
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \if@RTL\raggedleft\else\raggedright\fi \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
    \thispagestyle{empty}
    \newpage
  }}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \if@RTL\raggedleft\else\raggedright\fi
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
    \thispagestyle{empty}
%%    \newpage
  }}  
  \flushbottom
}


\setlength{\parindent}{1cm}
\setlength{\parskip}{0pt}

\setlength{\footskip}{
\paperheight   -(1in+\voffset+\topmargin+\headheight+\headsep+\textheight)  -1cm
}

\makeatletter
\renewcommand\section{\@startsection{section}{1}{\z@}%
                                   {-1.4cm \@plus -0ex \@minus -0ex}%
                                   {1cm \@plus0ex}%
                                   {\normalfont\Large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                    {-1.4cm \@plus -0ex \@minus -0ex}%
                                   {1cm \@plus0ex}%
                                     {\normalfont\large\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-1.4cm \@plus -0ex \@minus -0ex}%
                                   {1cm \@plus0ex}%
                                     {\normalfont\normalsize\bfseries}}  
 \makeatother
 
\makeatletter
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
\makeatother


\makeatletter
\let\origprintindex\printindex
\renewcommand*{\printindex}{%
\cleardoublepage
  \fancypagestyle{plain}{%
    \fancyhf{}%
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
  }%
  \tolerance=10000
  \origprintindex
}
\makeatother



\newcommand{\ysymbol}[2]{%
\gdef\currntsymbol{#1}%
\gdef\currntsymboldef{#2}%
\csname phantomsection\endcsname%
%#1%
\addcontentsline{los}{ysymbol}{%
\protect\numberline{\currntsymbol}%
\currntsymboldef}%
}

\makeatletter
\renewcommand\@tocrmarg{1.55em}
\newcommand\listsymbolsname{فهرست نمادها}
\newcommand\listofsymbols[1][3em]{%
\cleardoublepage
\newcommand*\l@ysymbol{%
\@dottedtocline{1}{0em}{#1}}\mychapter{\listsymbolsname}%
\setlength{\columnsep}{5ex}
\begin{multicols*}{2}
\small
\baselineskip=1cm
\@starttoc{los}
\raggedcolumns
\end{multicols*}
}
\makeatother


%% 
%% 
%% Distributable under the LaTeX Project Public License,
%% version 1.3c or higher (your choice). The latest version of
%% this license is at: http://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained" (as per LPPL maintenance status)
%%  by Vahid Damanafshan.
%% 
%% 
%% 
%% 
%%
%% End of file `yazd-thesis.cls'.
