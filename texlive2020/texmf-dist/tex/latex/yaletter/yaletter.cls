%%
%% This is file `yaletter.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% yaletter.dtx  (with options: `package')
%% This is a generated file.
%% 
%% This document is copyright 2014 by Donald P. Goodman, and is
%% released publicly under the LaTeX Project Public License.  The
%% distribution and modification of this work is constrained by the
%% conditions of that license.  See
%% http://www.latex-project.org/lppl.txt
%% for the text of the license.  This document is released
%% under version 1.3 of that license, and this work may be distributed
%% or modified under the terms of that license or, at your option, any
%% later version.
%% 
%% This work has the LPPL maintenance status 'maintained'.
%% 
%% The Current Maintainer of this work is Donald P. Goodman
%% (dgoodmaniii@gmail.com).
%% 
%% This work consists of yaletter.dtx, yaletter.ins, and
%% derived files yaletter.cls and yaletter.pdf.

\NeedsTeXFormat{LaTeX2e}[1996/06/01]
\ProvidesClass{yaletter}[2017/01/01 v1.1 Yet Another Letter Class]
\RequirePackage{xkeyval}
\pagenumbering{arabic}
\newdimen\ya@lftmarg\ya@lftmarg=0.5in
\newdimen\ya@rgtmarg\ya@rgtmarg=0.5in
\newdimen\ya@topmarg\ya@topmarg=0.5in
\newdimen\ya@botmarg\ya@botmarg=1.0in
\paperheight=\the\pdfpageheight
\paperwidth=\the\pdfpagewidth
\newdimen\ya@pageheight\ya@pageheight=\the\paperheight
\newdimen\ya@pagewidth\ya@pagewidth=\the\paperwidth
\marginparwidth=0pt
\marginparpush=0pt
\topmargin=0pt
\headheight=12pt
\headsep=12pt
\footskip=24pt
\marginparsep=0pt
\newdimen\ya@headheight\ya@headheight=\the\headheight
\newdimen\ya@headsep\ya@headsep=\the\headsep
\newdimen\ya@footskip\ya@footskip=\the\footskip
\oddsidemargin=0pt
\newdimen\ya@oddsidemargin\ya@oddsidemargin=\the\oddsidemargin
\newdimen\ya@headwidth\ya@headwidth=0pt
\def\ya@headrulewidth{0.4pt}
\def\ya@footrulewidth{0.4pt}
\newdimen\ya@predate\ya@predate=12pt
\newdimen\ya@postdate\ya@postdate=12pt
\newdimen\ya@preinsideaddr\ya@preinsideaddr=12pt
\newdimen\ya@postinsideaddr\ya@postinsideaddr=0pt
\newdimen\ya@presalutation\ya@presalutation=0pt
\newdimen\ya@postsalutation\ya@postsalutation=0pt
\newdimen\ya@prefarewell\ya@prefarewell=0pt
\newdimen\ya@postfarewell\ya@postfarewell=12pt
\newdimen\ya@presignature\ya@presignature=12pt
\newdimen\ya@postsignature\ya@postsignature=0pt
\newdimen\ya@preenclosure\ya@preenclosure=0pt
\newdimen\ya@postenclosure\ya@postenclosure=0pt
\def\ya@saluword{Dear }
\def\ya@salupunct{:}
\def\ya@farewellword{Sincerely}
\def\ya@farewellpunct{,}
\def\ya@signatureword{Your Name Here}
\def\ya@enclosureword{Enclosure}
\def\yaaddressee{}
\def\yawriter{}
\define@key{yaoptions}{lftmarg}{\global\ya@lftmarg=#1}
\define@key{yaoptions}{rgtmarg}{\global\ya@rgtmarg=#1}
\define@key{yaoptions}{topmarg}{\global\ya@topmarg=#1}
\define@key{yaoptions}{botmarg}{\global\ya@botmarg=#1}
\define@key{yaoptions}{pageheight}{\global\ya@pageheight=#1}
\define@key{yaoptions}{pagewidth}{\global\ya@pagewidth=#1}
\define@key{yaoptions}{footskip}{\global\ya@footskip=#1}
\define@key{yaoptions}{headsep}{\global\ya@headsep=#1}
\define@key{yaoptions}{headheight}{\global\ya@headheight=#1}
\define@key{yaoptions}{oddsidemargin}{\global\ya@oddsidemargin=#1}
\define@key{yaoptions}{headwidth}{\global\ya@headwidth=#1}
\define@key{yaoptions}{headrulewidth}{\global\def\ya@headrulewidth{#1}}
\define@key{yaoptions}{footrulewidth}{\global\def\ya@footrulewidth{#1}}
\define@key{yaoptions}{predate}{\global\ya@predate=#1}
\define@key{yaoptions}{postdate}{\global\ya@postdate=#1}
\define@key{yaoptions}{preinsideaddr}{\global\ya@preinsideaddr=#1}
\define@key{yaoptions}{postinsideaddr}{\global\ya@postinsideaddr=#1}
\define@key{yaoptions}{presalutation}{\global\ya@presalutation=#1}
\define@key{yaoptions}{postsalutation}{\global\ya@postsalutation=#1}
\define@key{yaoptions}{prefarewell}{\global\ya@prefarewell=#1}
\define@key{yaoptions}{postfarewell}{\global\ya@postfarewell=#1}
\define@key{yaoptions}{presignature}{\global\ya@presignature=#1}
\define@key{yaoptions}{postsignature}{\global\ya@postsignature=#1}
\define@key{yaoptions}{preenclosure}{\global\ya@preenclosure=#1}
\define@key{yaoptions}{postenclosure}{\global\ya@postenclosure=#1}
\define@key{yaoptions}{datehskip}{\global\yahdateskip=#1}
\define@key{yaoptions}{insideaddrhskip}{\global\yahinsideaddrskip=#1}
\define@key{yaoptions}{saluskip}{\global\yahsalutationskip=#1}
\define@key{yaoptions}{farewellskip}{\global\yahfarewellskip=#1}
\define@key{yaoptions}{signatureskip}{\global\yahsignatureskip=#1}
\define@key{yaoptions}{enclosureskip}{\global\yahenclosureskip=#1}
\define@key{yaoptions}{enclosureword}{\global\def\ya@enclosureword{#1}}
\define@key{yaoptions}{saluword}{\global\def\ya@saluword{#1}}
\define@key{yaoptions}{salupunct}{\global\def\ya@salupunct{#1}}
\define@key{yaoptions}{farewellword}{\global\def\ya@farewellword{#1}}
\define@key{yaoptions}{farewellpunct}{\global\def\ya@farewellpunct{#1}}
\define@key{yaoptions}{signatureword}{\global\def\ya@signatureword{#1}}
\define@key{yaoptions}{signatureword}{\global\def\ya@signatureword{#1}}
\define@key{yaoptions}{addressee}{\yasetaddressee{#1}}
\define@key{yaoptions}{writer}{\yasetwriter{#1}}
\define@key{yaoptions}{parskip}{\global\yaparskip=#1}
\define@key{yaoptions}{parindent}{\global\yaparindent=#1}
\define@key{yaoptions}{datafile}{\global\input{#1}}
\newcommand\yaoptions[1]{%
\setkeys{yaoptions}{#1}%
\geometry{top=\the\ya@topmarg,bottom=\the\ya@botmarg,
left=\the\ya@lftmarg,right=\the\ya@rgtmarg,
paperheight=\the\ya@pageheight,paperwidth=\the\ya@pagewidth,
footskip=\the\ya@footskip,headsep=\the\ya@headsep,
headheight=\the\ya@headheight}
\ifdim\ya@headwidth=0pt
\global\headwidth=\the\textwidth
\else
\global\headwidth=\the\ya@headwidth
\fi
\renewcommand{\headrulewidth}{\ya@headrulewidth}
\renewcommand{\footrulewidth}{\ya@footrulewidth}
}%
\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}
\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\newcommand\large{\@setfontsize\large\@xiipt{14}}
\newcommand\Large{\@setfontsize\Large\@xivpt{18}}
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
\paperheight=\the\pdfpageheight
\paperwidth=\the\pdfpagewidth
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\fancypagestyle{yafirstpage}{%
\renewcommand\headrulewidth{0pt}
\renewcommand\footrulewidth{0.4pt}
\fancyhf{}%
\fancyfoot[C]{Page \thepage\ of \yalastpage}%
}%
\fancypagestyle{yaotherpage}{%
\renewcommand\headrulewidth{0.4pt}
\renewcommand\footrulewidth{0.4pt}
\fancyhf{}%
\fancyhead[L]{\yawriter\ to \yaaddressee}%
\fancyhead[R]{\yathedate}%
\fancyfoot[C]{Page \thepage\ of \yalastpage}%
}%
\fancypagestyle{yaenvpage}{%
\renewcommand\headrulewidth{0pt}
\renewcommand\footrulewidth{0pt}
\fancyhf{}%
\newgeometry{margin=0pt}
}%
\def\defineletterhead#1#2{%
\global\expandafter\def\csname letterhead#1\endcsname{%
\hbox{#2}%
}%
\vskip1pt
\@afterindentfalse\@afterheading
}%
\def\yauseletterhead#1{%
\csname letterhead#1\endcsname%
}%
\newcount\ya@lettertype\ya@lettertype=0
\newdimen\yaparskip\yaparskip=12pt
\newdimen\yaparindent\yaparindent=0pt
\newdimen\yahdateskip\yahdateskip=0pt
\newdimen\yahinsideaddrskip\yahinsideaddrskip=0pt
\newdimen\yahsalutationskip\yahsalutationskip=0pt
\newdimen\yahfarewellskip\yahfarewellskip=0pt
\newdimen\yahsignatureskip\yahsignatureskip=0pt
\newdimen\yahenclosureskip\yahenclosureskip=0pt
\def\yaletterblock{%
\everypar={%
\parindent=\the\yaparindent
\parskip=\the\yaparskip
}%
}%
\def\yalettermodblock{%
\everypar={%
\parindent=\the\yaparindent
\parskip=\the\yaparskip
}%
\yahdateskip=\textwidth%
\divide\yahdateskip by2%
\yahfarewellskip=\textwidth%
\divide\yahfarewellskip by 2%
\yahsignatureskip=\textwidth%
\divide\yahsignatureskip by 2%
\ya@lettertype=1
}%
\def\yaletternormal{%
\yaparskip=0pt
\yaparindent=24pt
\everypar={%
\parindent=\the\yaparindent
\parskip=\the\yaparskip
}%
\yahdateskip=\textwidth%
\divide\yahdateskip by2%
\yahfarewellskip=\textwidth%
\divide\yahfarewellskip by2%
\yahsignatureskip=\textwidth%
\divide\yahsignatureskip by2%
\ya@lettertype=2
\ya@preinsideaddr=24pt%
\ya@presalutation=12pt%
\ya@postsalutation=12pt%
\ya@prefarewell=12pt%
}
\def\yadatestyle{}
\def\yadate#1{%
\vskip\ya@predate%
\noindent\hskip\yahdateskip\hbox{%
\yadatestyle #1%
\hfil%
}%
\vskip\ya@postdate%
\global\def\yathedate{#1}%
}%
\def\yainsideaddrstyle{}
\def\yainsideaddr#1{%
\vskip\ya@preinsideaddr%
\noindent\hskip\yahinsideaddrskip\hbox{%
\vbox{\yainsideaddrstyle\noindent #1}
}
\vskip\ya@postinsideaddr%
}%
\def\yasalutationstyle{}
\def\yasalutation#1{%
\vskip\ya@presalutation%
\noindent\hskip\yahsalutationskip\hbox{%
\yasalutationstyle%
\ya@saluword #1\ya@salupunct\hfil%
}%
\vskip\ya@postsalutation%
}%
\def\yafarewellstyle{}
\def\yafarewell{%
\vskip\ya@prefarewell%
\noindent\hskip\yahfarewellskip\hbox{%
\yafarewellstyle%
\ya@farewellword\ya@farewellpunct\hfil%
}%
\vskip\ya@postfarewell%
}%
\def\yasignaturestyle{}
\def\yasignature{%
\vskip\ya@presignature%
\noindent\hskip\yahsignatureskip\hbox{%
\yasignaturestyle%
\ya@signatureword\hfil%
}%
\vskip\ya@postsignature%
\label{thelast}%
}%
\def\yaenclosurestyle{}
\def\yaenclosure{%
\vskip\ya@preenclosure%
\noindent\hskip\yahenclosureskip\hbox to\linewidth{%
\yaenclosurestyle%
\ya@enclosureword\hfil%
}%
\vskip\ya@postenclosure%
}%
\def\yaaddresseestyle{\itshape}
\def\yasetaddressee#1{%
\global\def\yaaddressee{{\yaaddresseestyle #1}}%
}%
\def\yawriterstyle{\itshape}
\def\yasetwriter#1{%
\global\def\yawriter{{\yawriterstyle #1}}%
}%
\def\yalastpagestyle{}
\def\yalastpage{%
{\yalastpagestyle \pageref{thelast}}%
}%
\def\defineaddress#1#2#3{%
\global\expandafter\def\csname address#1\endcsname{%
\noindent\parskip=0pt\parindent=0pt%
#3%
}%
\global\expandafter\def\csname shortname#1\endcsname{%
#2%
}%
}%
\def\yatoaddress#1{%
\yasetaddressee{\csname shortname#1\endcsname}%
\csname address#1\endcsname%
}%
\def\yareturnaddress#1{%
\yasetwriter{\csname shortname#1\endcsname}%
\csname address#1\endcsname%
}%
\def\yafromaddress#1{%
\yasetwriter{\csname shortname#1\endcsname}%
}%
\def\yaaddress#1{%
\csname address#1\endcsname%
}%
\RequirePackage{textpos}
\def\yashowboxeson{%
\TPoptions{showboxes=true}
}%
\def\yashowboxesoff{%
\TPoptions{showboxes=false}
}%
\def\yaenvunit#1{%
\setlength{\TPHorizModule}{#1}%
\setlength{\TPVertModule}{#1}%
}%
\yaenvunit{0.1in}
\def\yaenvtoaddr{%
TO ADDRESS%
}%
\def\yaenvretaddr{%
RETURN ADDRESS%
}%
\newcount\yaenvrethskip\yaenvrethskip=2
\newcount\yaenvretvskip\yaenvretvskip=1
\newcount\yaenvtohskip\yaenvtohskip=42
\newcount\yaenvtovskip\yaenvtovskip=18
\def\yaenvelope#1#2{%
\clearpage%
\eject\pdfpagewidth=#1 \pdfpageheight=#2%
\thispagestyle{yaenvpage}
\begin{textblock}{100}(\yaenvrethskip,\yaenvretvskip)
\parskip=0pt\parindent=0pt%
\yaenvretaddr%
\end{textblock}
\begin{textblock}{100}(\yaenvtohskip,\yaenvtovskip)
\parskip=0pt\parindent=0pt%
\yaenvtoaddr%
\end{textblock}
}%
\def\yabusiness{%
\global\yaenvrethskip=2
\global\yaenvretvskip=1
\global\yaenvtohskip=42
\global\yaenvtovskip=18
\yaenvelope{9.5in}{4.125in}%
}%
\def\yananoxenvelope{%
\global\yaenvrethskip=2
\global\yaenvretvskip=1
\global\yaenvtohskip=42
\global\yaenvtovskip=18
\yaenvelope{9.5in}{4.125in}%
}%
\def\yadlenvelope{%
\global\yaenvrethskip=2
\global\yaenvretvskip=1
\global\yaenvtohskip=36
\global\yaenvtovskip=18
\yaenvelope{8.66in}{4.33in}%
}%
\def\yacvienvelope{%
\global\yaenvrethskip=2
\global\yaenvretvskip=1
\global\yaenvtohskip=26
\global\yaenvtovskip=20
\yaenvelope{6.4in}{4.5in}%
}%
\def\yacvicvenvelope{%
\global\yaenvrethskip=2
\global\yaenvretvskip=1
\global\yaenvtohskip=42
\global\yaenvtovskip=18
\yaenvelope{9in}{4.5in}%
}%
\def\yacvenvelope{%
\global\yaenvrethskip=2
\global\yaenvretvskip=1
\global\yaenvtohskip=38
\global\yaenvtovskip=28
\yaenvelope{9in}{6.4in}%
}%
\def\yacivenvelope{%
\global\yaenvrethskip=3
\global\yaenvretvskip=3
\global\yaenvtohskip=60
\global\yaenvtovskip=42
\yaenvelope{12.8in}{9.0in}%
}%
\def\yaciiienvelope{%
\global\yaenvrethskip=3
\global\yaenvretvskip=3
\global\yaenvtohskip=84
\global\yaenvtovskip=60
\yaenvelope{18in}{12.8in}%
}%
\def\yanaaiienvelope{%
\global\yaenvrethskip=2
\global\yaenvretvskip=1
\global\yaenvtohskip=22
\global\yaenvtovskip=20
\yaenvelope{5.75in}{4.375in}%
}%
\def\yanaavienvelope{%
\global\yaenvrethskip=2
\global\yaenvretvskip=1
\global\yaenvtohskip=26
\global\yaenvtovskip=22
\yaenvelope{6.5in}{4.75in}%
}%
\def\yanaaviienvelope{%
\global\yaenvrethskip=2
\global\yaenvretvskip=1
\global\yaenvtohskip=30
\global\yaenvtovskip=24
\yaenvelope{7.25in}{5.25in}%
}%
\def\yanaaviiienvelope{%
\global\yaenvrethskip=2
\global\yaenvretvskip=1
\global\yaenvtohskip=34
\global\yaenvtovskip=24
\yaenvelope{8.125in}{5.5in}%
}%
\def\yanaaixenvelope{%
\global\yaenvrethskip=2
\global\yaenvretvskip=1
\global\yaenvtohskip=38
\global\yaenvtovskip=28
\yaenvelope{8.75in}{5.75in}%
}%
\def\yanaaxenvelope{%
\global\yaenvrethskip=2
\global\yaenvretvskip=1
\global\yaenvtohskip=42
\global\yaenvtovskip=28
\yaenvelope{9.5in}{6.00in}%
}%
\def\yananovienvelope{%
\global\yaenvrethskip=2
\global\yaenvretvskip=1
\global\yaenvtohskip=26
\global\yaenvtovskip=14
\yaenvelope{6.5in}{3.625in}%
}%
\def\yananoviienvelope{%
\global\yaenvrethskip=2
\global\yaenvretvskip=1
\global\yaenvtohskip=32
\global\yaenvtovskip=16
\yaenvelope{7.5in}{3.875in}%
}%
\def\yananoixenvelope{%
\global\yaenvrethskip=2
\global\yaenvretvskip=1
\global\yaenvtohskip=36
\global\yaenvtovskip=16
\yaenvelope{8.875in}{3.875in}%
}%
\def\yananoxienvelope{%
\global\yaenvrethskip=2
\global\yaenvretvskip=1
\global\yaenvtohskip=48
\global\yaenvtovskip=20
\yaenvelope{10.375in}{4.5in}%
}%
\def\yananoxiienvelope{%
\global\yaenvrethskip=2
\global\yaenvretvskip=1
\global\yaenvtohskip=48
\global\yaenvtovskip=22
\yaenvelope{11in}{4.75in}%
}%
\def\yananoxivenvelope{%
\global\yaenvrethskip=2
\global\yaenvretvskip=1
\global\yaenvtohskip=52
\global\yaenvtovskip=22
\yaenvelope{11.5in}{5in}%
}%
\def\nloop#1{%
\def\nl@@p##1##2\repeat#1{%
\def##1{##2\relax\expandafter##1\fi}%
##1\let##1\relax}%
\expandafter\nl@@p\csname nl@@p-\string#1\endcsname
}%
\newdimen\ya@labwidth
\newdimen\ya@labheight
\newdimen\ya@tempboxh\newdimen\ya@tempboxv
\newcount\ya@loopi
\newcount\ya@loopj
\newcount\ya@numacross
\newcount\ya@numdown
\newdimen\yalabelmarg\yalabelmarg=0.1in
\def\yalabeltext{}
\newdimen\yalableftmarg\yalableftmarg=0pt
\newdimen\yalabrightmarg\yalabrightmarg=0pt
\newdimen\yalabtopmarg\yalabtopmarg=0pt
\newdimen\yalabbotmarg\yalabbotmarg=0pt
\def\yalabelsheet#1#2#3#4#5#6#7#8{%
\clearpage%
\eject\pdfpagewidth=#1 \pdfpageheight=#2%
\ifdim\yalableftmarg=0pt \yalableftmarg=#5\fi
\ifdim\yalabrightmarg=0pt \yalabrightmarg=#5\fi
\ifdim\yalabtopmarg=0pt \yalabtopmarg=#6\fi
\ifdim\yalabbotmarg=0pt \yalabbotmarg=#6\fi
\newgeometry{left=\the\yalableftmarg,right=\the\yalabrightmarg,
top=\the\yalabtopmarg,bottom=\the\yalabbotmarg}
\thispagestyle{empty}
\ya@numacross=#7 \ya@numdown=#8
\ya@labwidth=#3 \ya@labheight=#4
\ya@tempboxh=#3 \ya@tempboxv=#4
\advance\ya@labwidth by#5
\advance\ya@labheight by#6
\divide\ya@labwidth by2%
\divide\ya@labheight by2%
\newcount\ya@acthfact\newcount\ya@actvfact
\setlength{\TPHorizModule}{\the\ya@labwidth}%
\setlength{\TPVertModule}{\the\ya@labheight}%
\ya@loopi=0 \ya@loopj=0
\nloop1\ifnum\ya@loopi<\ya@numdown
\ya@actvfact=\ya@loopi\multiply\ya@actvfact by2
\ya@loopj=0
\nloop2\ifnum\ya@loopj<\ya@numacross
\ya@acthfact=\ya@loopj\multiply\ya@acthfact by2
\begin{textblock}{100}(\ya@acthfact,\ya@actvfact)
\hbox to#3{%
\hskip\yalabelmarg%
\vbox to#4{%
\parskip=0pt\parindent=0pt%
\vfil%
\yalabeltext%
\vfil%
}%
}%
\end{textblock}
\advance\ya@loopj by1%
\repeat2
\advance\ya@loopi by1%
\repeat1
}%
\def\yaplacelabel#1#2#3{%
\newcount\ya@numacrossii\ya@numacrossii=#2
\newcount\ya@numdownii\ya@numdownii=#3
\multiply\ya@numacrossii by2%
\multiply\ya@numdownii by2%
\begin{textblock}{100}(\ya@numacrossii,\ya@numdownii)
\hbox to\ya@tempboxh{%
\hskip\yalabelmarg%
\vbox to\ya@tempboxv{%
\parskip=0pt\parindent=0pt%
\vfil%
#1%
\vfil%
}%
}%
\end{textblock}
}%
\expandafter\def\csname avery8663\endcsname{%
\yalabtopmarg=0.5in
\yalabbotmarg=0.5in
\yalableftmarg=0.15625in
\yalabrightmarg=0.15625in
\yalabelsheet{8.5in}{11in}{4in}{1.95in}{0.15625in}{0in}{2}{5}%
}%
\expandafter\def\csname avery8660\endcsname{%
\yalabtopmarg=0.5in
\yalabbotmarg=0.5in
\yalableftmarg=0.1875in
\yalabrightmarg=0.1875in
\yalabelsheet{8.5in}{11in}{2.625in}{25mm}{0.125in}{0in}{3}{10}%
}%
\def\yaavery#1{%
\csname avery#1\endcsname%
}%
\AtBeginDocument{%
\pagestyle{yaotherpage}%
\thispagestyle{yafirstpage}%
\ifnum\ya@lettertype=0
\yaletterblock
\fi\ifnum\ya@lettertype=1
\yalettermodblock
\fi\ifnum\ya@lettertype=2
\yaletternormal
\fi
}
\endinput
%%
%% End of file `yaletter.cls'.
