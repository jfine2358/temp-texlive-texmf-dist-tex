%%
%% This is file `graphpaper.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% graphpaper.dtx  (with options: `class')
%%  ________________________________________
%%  The graphpaper class for generating several types of graph paper
%%  Copyright (C) 2020 C. Beccari & F. Biccari
%%  All rights reserved
%% 
%%  License information appended
%% 
\NeedsTeXFormat{LaTeX2e}[2018-01-01]
\ProvidesClass{graphpaper}%
   [2020-10-10 1.0 A LaTeX class to generate several types of graph papers]
\RequirePackage{xkeyval}
\def\GP@paper{1}
\define@key[GRP]{}{a4paper}[]{\PassOptionsToPackage{a4paper}{geometry}}
\define@key[GRP]{}{letterpaper}[]{\PassOptionsToPackage{letterpaper}{geometry}%
  \def\GP@paper{2}}
\define@key[GRP]{}{a3paper}[]{\PassOptionsToPackage{a3paper}{geometry}%
  \def\GP@paper{3}}
\DeclareOptionX*{\ClassError{graphpaper}{Option '\CurrentOption'%
  \MessageBreak is not valid}{Remove '\CurrentOption' %
  from class options}}
\ProcessOptionsX[GRP]<>
\LoadClass[a4paper,11pt]{article}
\RequirePackage[landscape]{geometry}
\RequirePackage{euclideangeometry,graphicx,xcolor}
\definecolor{gridcolor}{RGB}{250,153,89}
\newlength\lwa
\setlength{\lwa}{1pt}
\newlength\lwb
\setlength{\lwb}{0.6pt}
\newlength\lwc
\setlength{\lwc}{0.25pt}
\newlength\mindistanceunit
\setlength{\mindistanceunit}{1mm}
\newlength\xsideunit
\newlength\ysideunit
\if\GP@paper1
  \setlength{\xsideunit}{260mm}
  \setlength{\ysideunit}{180mm}
\fi
\if\GP@paper2
  \setlength{\xsideunit}{250mm}
  \setlength{\ysideunit}{190mm}
\fi
\if\GP@paper3
  \setlength{\xsideunit}{380mm}
  \setlength{\ysideunit}{280mm}
\fi
\newcount\J
\newcount\K

\newcommand\WhileDoOne[4][1]{%
\J=#2 \fpdowhile{\J=<#3 }{#4\advance\J by #1\relax}}

\newcommand\WhileDoTwo[4][1]{%
\K=#2 \fpdowhile{\K=<#3 }{#4\advance\K by #1\relax}}
\newcommand\hlines[6]{%
\multiput(-#4,\fpeval{ln(#2) * #5 / ln(10)})(0,#5){#1}%
{\linethickness{#3}\line(1,0){\fpeval{#6 + 2*#4}}}%
}

\newcommand\vlines[6]{%
\multiput(\fpeval{ln(#2) * #5 / ln(10)},-#4)(#5,0){#1}%
{\linethickness{#3}\line(0,1){\fpeval{#6 + 2*#4}}}%
}
\NewDocumentCommand{\carta}{O{0} m m}{%
\newpage
\parindent=0pt
\pagestyle{empty}%
\color{gridcolor}%
\setlength{\unitlength}{1mm}%
\def\ticklength{2}
\def\minorticklength{1.2}
\def\minimumdistance{\fpeval{(\mindistanceunit/1mm)}}
\def\xlength{\fpeval{round(round(\xsideunit/1cm) * 10)}}
\def\ylength{\fpeval{round(round(\ysideunit/1cm) * 10)}}
\def\xlinsq{\inteval{\xlength/10}}
\def\ylinsq{\inteval{\ylength/10}}
\edef\decx{#2}% decades along x
\edef\decy{#3}% decades along y
\unless\ifnum#2=0 \unless\ifnum#3=0 \ifnum#1=1%
\fptest{\decx/\decy < \xlength/\ylength}%
{\def\xlength{\fpeval{\ylength*\decx/\decy}}}
{\def\ylength{\fpeval{\xlength*\decy/\decx}}}
\fi\fi\fi
\ifcsname ml\endcsname\relax\else\newlength\ml\fi
\ifcsname mr\endcsname\relax\else\newlength\mr\fi
\ifcsname mt\endcsname\relax\else\newlength\mt\fi
\ifcsname mb\endcsname\relax\else\newlength\mb\fi
\unless\ifcsname mr\endcsname\newlength\mr\fi
\unless\ifcsname mt\endcsname\newlength\mt\fi
\unless\ifcsname mb\endcsname\newlength\mb\fi
\setlength{\ml}{\fpeval{(\paperwidth/1mm - \xlength)/2}mm}
\setlength{\mr}{\fpeval{(\paperwidth/1mm - \xlength)/2}mm}
\setlength{\mt}{\fpeval{(\paperheight/1mm - \ylength)/2}mm}
\setlength{\mb}{\fpeval{(\paperheight/1mm - \ylength)/2}mm}
\newgeometry{left=\ml,right=\mr,top=\mt,bottom=\mb}
\begin{picture}(\xlength,\ylength)
\ifnum#2=0\relax
  \multiput(0,0)(10,0){\inteval{\xlinsq + 1}}{%
    \linethickness{\lwa}\squarecap\line(0,1){\ylength}}
  \ifnum\fpeval{\minimumdistance <= 5}=1
  \multiput(5,0)(10,0){\xlinsq}{%
    \linethickness{\lwb}\line(0,1){\ylength}}\fi
  \ifnum\fpeval{\minimumdistance <= 1}=1
  \multiput(0,0)(1,0){\xlength}{%
    \linethickness{\lwc}\line(0,1){\ylength}}\fi
\else
  % vertical lines on log abscissa
  \edef\decxx{\fpeval{\decx + 1}}%
  \edef\xstep{\fpeval{\xlength / \decx}}
  % main lines: one for each decade (10) plus one at the end
  \vlines{\decxx}{1}{\lwa}{\ticklength}{\xstep}{\ylength}
  % second-level lines: one every unit (1), for each decade
  \WhileDoOne{2}{9}{\vlines{\decx}{\J}{\lwb}{%
    \minorticklength}{\xstep}{\ylength}}
  % third-level lines: for each decade (10) and for each unit (1):
  % 20, 10, 5, 2 are progressively tested and adopted if the distance
  % between two subsequent nearest lines is less to \minimumdistance
  \WhileDoTwo{1}{9}{%
    \edef\xmindivfloat{%
      \fpeval{(\K+1)*(1-10^-(\minimumdistance/\xstep))}}
    % xmindiv corresponds to 1/20 of unit
    \def\xmindiv{20}
    % xmindivfloat corresponds to the distance of two
    % subdivision with respect to the unit
    \ifnum\fpeval{\xmindivfloat <= 0.5}=1 \def\xmindiv{10}\fi
    \ifnum\fpeval{\xmindivfloat <= 0.2}=1 \def\xmindiv{4}\fi
    \ifnum\fpeval{\xmindivfloat <= 0.1}=1 \def\xmindiv{2}\fi
    \ifnum\fpeval{\xmindivfloat <= 0.05}=1 \def\xmindiv{1}\fi
    \ifnum\fpeval{\xmindiv == 20}=1\relax
    \else\WhileDoOne[\xmindiv]{\xmindiv}{19}{%
      \vlines{\decx}{(\K+\J/20)}{\lwc}{0}{\xstep}{\ylength}}\fi}
\fi
\ifnum#3=0\relax
  \multiput(0,0)(0,10){\inteval{\ylinsq + 1}}{%
    \linethickness{\lwa}\squarecap\line(1,0){\xlength}}
  \ifnum\fpeval{\minimumdistance <= 5}=1
  \multiput(0,5)(0,10){\ylinsq}{%
   \linethickness{\lwb}\line(1,0){\xlength}}\fi
  \ifnum\fpeval{\minimumdistance <= 1}=1
  \multiput(0,0)(0,1){\ylength}{%
    \linethickness{\lwc}\line(1,0){\xlength}}\fi
\else
  % horizontal lines on log ordinates
  \edef\decyy{\fpeval{\decy + 1}}%
  \edef\ystep{\fpeval{\ylength / \decy}}
  % main lines: one for each decade (10) plus one at the end
  \hlines{\decyy}{1}{\lwa}{\ticklength}{\ystep}{\xlength}
  % second-level lines: one every unit (1), for each decade
  \WhileDoOne{2}{9}{\hlines{\decy}{\J}{\lwb}{%
    \minorticklength}{\ystep}{\xlength}}
  % third-level lines: for each decade (10) and for each unit (1):
  % 20, 10, 5, 2 are progressively tested and adopted if the distance
  % between two subsequent nearest lines is less to \minimumdistance
  \WhileDoTwo{1}{9}{\edef\ymindivfloat{%
   \fpeval{(\K+1)*(1-10^-(\minimumdistance/\ystep))}}
\def\ymindiv{20}
\ifnum\fpeval{\ymindivfloat <= 0.5}=1 \def\ymindiv{10}\fi
\ifnum\fpeval{\ymindivfloat <= 0.2}=1 \def\ymindiv{4}\fi
\ifnum\fpeval{\ymindivfloat <= 0.1}=1 \def\ymindiv{2}\fi
\ifnum\fpeval{\ymindivfloat <= 0.05}=1 \def\ymindiv{1}\fi
\ifnum\fpeval{\ymindiv == 20}=1\relax
\else\WhileDoOne[\ymindiv]{\ymindiv}{19}{%
  \hlines{\decy}{(\K+\J/20)}{\lwc}{0}{\ystep}{\xlength}}\fi}
\fi
\GP@custom
\end{picture}
\ifGP@customcodereset\def\GP@custom{}\fi}
\newcount\I
\NewDocumentCommand\Rbox{O{0} D(){0:0} m}{%
    \fptest{#1>=0}{\edef\RotLab{\fpeval{#1-90}}}{\edef\RotLab{\fpeval{#1+90}}}%
    \put(#2){\color{black}\segment(0,0)(#1:1)\put(#1:1){%
            \rotatebox{\RotLab}{\makebox(0,0)[c]{%
                    \fptest{#1>=0}{\Pbox[b]}{\Pbox[t]}{\scriptstyle#3}[0]}}%
        }%
    }\ignorespaces}
\NewDocumentCommand\Xcircle{m}{%
\edef\Czero{0,0}\edef\Rzero{\Scala}%
\edef\Rdue{\fpeval{1/(#1+1)*\Scala}}%
\edef\Cdue{\fpeval{\Rzero-\Rdue},0}%
\Circlewithcenter\Cdue radius\Rdue\ignorespaces}
\NewDocumentCommand\Ycircle{m s}{%
\edef\Czero{0,0}\edef\Rzero{\Scala}% external circle center and radius
\edef\Rdue{\fpeval{\Scala/abs(#1)}}% Small circle radius
\edef\Cdue{\Rzero,\fpeval{\Scala/#1}}% Small circle center
\edef\Cuno{\Rzero,0}% First intersection point
\ModAndAngleOfVect\Cdue to\Mod and\Alfa % Small circle center polar coordinates
\IntersectionOfLines(\Czero)(\Cdue)and(\Cuno)(\fpeval{\Alfa+90}:1)to\Inter
\SymmetricalPointOf\Cuno respect\Inter to\Idue
\ModAndAngleOfVect\Idue to\Mdue and\Adue
\SubVect\Cdue from\Idue to\IIdue
\ModAndAngleOfVect\IIdue to\Mod and\Alfa
\fptest{#1>0}{\edef\Alfa{\fpeval{270-\Alfa}}\Arc(\Cdue)(\Idue){\Alfa}}%
{\edef\Alfa{\fpeval{270+\Alfa}}\Arc(\Cdue)(\Cuno){\Alfa}}%
\IfBooleanT{#2}{\Rbox[\Adue](\Idue){\color{black}#1}}\relax
\ignorespaces}
\newcommand\CalcRxx[1]{%
\edef\Rxx{\fpeval{\Scala*(#1 - 1)/(#1 + 1)}}%
\segment(\Rxx,\LowResZero)(\Rxx,\LowResUno)\relax
\Pbox(\Rxx,\LowResUno)[t]{$\color{black}\scriptsize#1$}[0]\ignorespaces}
\newcommand\GradResist[1]{%
    \color{black}
\edef\LowResZero{-#1}\edef\LowResUno{\fpeval{\LowResZero-1}}%
\I=0\edef\Auxx{0}\relax
\fpdowhile{\I<=10}{\CalcRxx{\Auxx}%
\advance\I by1\edef\Auxx{\fpeval{\Auxx+0.1}}\ignorespaces}
\CalcRxx{1.5}\I=2\edef\Auxx{2}\relax
\fpdowhile{\I<=9}{\CalcRxx{\Auxx}%
\advance\I by1\edef\Auxx{\fpeval{\Auxx+1}}\ignorespaces}
\CalcRxx{15}\CalcRxx{30}%
\edef\Rxx{\Scala}%
{\segment(-\Rxx,\LowResZero)(\Rxx,\LowResZero)%
\segment(\Rxx,\LowResZero)(\Rxx,\LowResUno)%
\Pbox(\Rxx,\LowResUno)[t]{\infty}[0]}}
\newcommand{\GradPolar}[1]{%
    \color{black}
    \edef\yline{\fpeval{-1.2 * \Scala}}
    \linethickness{\lwa}
    \segment(-\Scala,\yline)(\Scala,\yline)
    \edef\ytickstart{\yline}
    \edef\ytickstop{\fpeval{\yline-2}}
    \edef\yytickstop{\fpeval{\yline-1}}
    \segment(\Scala,\ytickstart)(\Scala,\ytickstop)
    \segment(-\Scala,\ytickstart)(-\Scala,\ytickstop)
    \fptest{#1=0}{%
        \segment(0,\ytickstart)(0,\ytickstop)
        \edef\plstep{\fpeval{\Scala/10}}
        \linethickness{\lwb}
        \multiput(\plstep,\yline)(\plstep,0){9}{\line(0,-1){1}}
        \multiput(-\plstep,\yline)(-\plstep,0){9}{\line(0,-1){1}}%
    }{%
    \I=0
    \fpwhiledo{\I<#1}{%
        \linethickness{\lwa}
        \edef\xtick{\fpeval{\I*\Scala/#1}}
        \segment(\xtick,\ytickstart)(\xtick,\ytickstop)
        \segment(-\xtick,\ytickstart)(-\xtick,\ytickstop)
        \J=2
        \fpwhiledo{\J<=9}{%
            \linethickness{\lwb}
            \edef\xtick{\fpeval{\Scala/#1 * (\I + ln(\J)/ln(10))}}
            \segment(\xtick,\ytickstart)(\xtick,\yytickstop)
            \segment(-\xtick,\ytickstart)(-\xtick,\yytickstop)
            \advance\J by1\relax}
        \advance\I by1\relax}}
}
\NewDocumentCommand\PolarChart{O{\paperheight} m}{%
\newpage
\parindent=0pt
\pagestyle{empty}%
\ifcsname pmargin\endcsname\relax\else\newlength\pmargin\fi
\setlength{\pmargin}{20pt}
\newgeometry{left=\pmargin,right=\pmargin,top=\pmargin,bottom=\pmargin}
\def\factor{140}
\unitlength=\fpeval{#1/\factor}pt
\def\xlength{\fpeval{(\textwidth-0.01pt)/\unitlength}}
\def\ylength{\fpeval{(\textheight-0.01pt)/\unitlength}}
\begin{picture}(\xlength,\ylength)%
    (\fpeval{-\xlength/2},\fpeval{-\ylength/2})%
\color{gridcolor}%
\edef\Scala{50}% The scale factor
\fptest{#2=0}{% start circle linear radius sequence.
\I=1
\fpdowhile{\I=<100}{\edef\R{\fpeval{0.01*\Scala*\I}}%
{\fptest{\fpeval{\I-10(round(\I/10,0))}=0}{\linethickness{\lwa}%
}%
{\fptest{\fpeval{\I-5(round(\I/5,0))}=0}{\linethickness{\lwb}}%
{\linethickness{\lwc}}%
}\Circlewithcenter0,0radius\R
}\advance\I by1\relax}%
}% end circle linear radius sequence
{%
\edef\LnDieci{\fpeval{ln(10)}}%
    \edef\ScalaDecade{\fpeval{\Scala/#2}}%
\fptest{#2<3}{%
        \newcount\Dec \Dec=1\relax
\fpdowhile{\Dec=<#2}{%
            \linethickness{\lwa}%
            \edef\R{\fpeval{\Dec*\ScalaDecade}}%
            \Circlewithcenter0,0radius\R% Thick circles
\edef\LPLA{1}%
\fpdowhile{\LPLA<4}{
\edef\Logaritmo{\fpeval{\Dec-1+(ln(\LPLA))/\LnDieci}}%
\edef\R{\fpeval{\ScalaDecade*\Logaritmo}}%
\fptest{\R>0}{\fptest{\LPLA=round(\LPLA,0)}%
{\linethickness{\lwb}}{\linethickness{\lwc}}%
\Circlewithcenter0,0radius\R}{}%
\edef\LPLA{\fpeval{\LPLA+0.2}}}%
\edef\LPLA{4}%
\fpdowhile{\LPLA=<10}{%
\edef\Logaritmo{\fpeval{\Dec-1+(ln(\LPLA))/\LnDieci}}%
\edef\R{\fpeval{\ScalaDecade*\Logaritmo}}%
\fptest{\R>0}{\fptest{\LPLA=round(\LPLA,0)}%
{\linethickness{\lwb}}{\linethickness{\lwc}}%
\Circlewithcenter0,0radius\R}{}%
\edef\LPLA{\fpeval{\LPLA+0.5}}}%
\advance\Dec by1\relax}%
}{%
\ClassWarning{GraphPaper}{Logarithmic polar graph paper:\MessageBreak
too many decades: \number#2\space\MessageBreak
Reduce their number}%
}}% End logarithmic circle radius sequence
\ignorespaces
\I=0\edef\R{\Scala}%
\fpdowhile{\I<360}{\edef\A{\fpeval{\I}}%
\fptest{\fpeval{\I-10(round(\I/10,0))}=0}%
{\linethickness{\lwa}\segment(0,0)(\A:\R)
\Rbox[\A](\A:\R){\color{black}\A}}% multiple of 10
{\fptest{\fpeval{\I-5(round(\I/5,0))}=0}%
{\linethickness{\lwb}%
\segment(\A:5)(\A:10)
\segment(\A:30)(\A:\R)}% multiple of 5
{\linethickness{\lwc}%
\fptest{\fpeval{\I-2(round(\I/2,0))}=0}%
{\segment(\A:10)(\A:\R)}% multiple of 2
{\segment(\A:30)(\A:\R)}% multiple of 1
}%
}%
\advance\I by 1\relax
}\ignorespaces
    \GradPolar{#2}
\GP@custom
\end{picture}
\ifGP@customcodereset\def\GP@custom{}\fi}
\NewDocumentCommand\SmithChart{O{\paperheight}}{%
    \newpage
    \parindent=0pt
    \pagestyle{empty}%
    \ifcsname pmargin\endcsname\relax\else\newlength\pmargin\fi
    \setlength{\pmargin}{20pt}
    \newgeometry{left=\pmargin,right=\pmargin,top=\pmargin,bottom=\pmargin}
    \def\factor{140}
    \unitlength=\fpeval{#1/\factor}pt\relax
    \def\xlength{\fpeval{(\textwidth-0.01pt)/\unitlength}}
    \def\ylength{\fpeval{(\textheight-0.01pt)/\unitlength}}
    \begin{picture}(\xlength,\ylength)%
                   (\fpeval{-\xlength/2},\fpeval{-\ylength/2})%
\color{gridcolor}%
\edef\Scala{50}% scale factor based on the main circle but valid
               % for everything inside the graph paper.
{\color{black}\Pbox(0,0){}[4]}% Black dot in the origin
\I=0\relax
\fpdowhile{\I=<6}{\edef\Aux{\fpeval{\I/20}}{%
\fptest{\I=0}{\color{black}}{\color{gridcolor}}\thicklines\Xcircle{\Aux}}%
\advance\I by1\edef\Aux{\fpeval{\I/20}}\Xcircle{\Aux}%
\advance\I by1\ignorespaces}%fino a 0.4
\fpdowhile{\I=<16}{\edef\Aux{\fpeval{\I/20}}\relax
{\thicklines\Xcircle{\Aux}}\advance\I by2\edef\Aux{\fpeval{\I/20}}\relax
\Xcircle{\Aux}\advance\I by2\ignorespaces}% fino a 1
\fpdowhile{\I=<36}{\edef\Aux{\fpeval{\I/20}}\relax
{\thicklines\Xcircle{\Aux}}\advance\I by4\edef\Aux{\fpeval{\I/20}}\relax
\Xcircle{\Aux}\advance\I by4\ignorespaces}% fino a 2
\fpdowhile{\I=<96}{\edef\Aux{\fpeval{\I/20}}\relax
{\thicklines\Xcircle{\Aux}}\advance\I by8\edef\Aux{\fpeval{\I/20}}\relax
\Xcircle{\Aux}\advance\I by8\ignorespaces}%fino a 5
\fpdowhile{\I=<296}{\edef\Aux{\fpeval{\I/20}}\relax
{\thicklines\Xcircle{\Aux}}\advance\I by16\edef\Aux{\fpeval{\I/20}}\relax
\Xcircle{\Aux}\advance\I by16\ignorespaces}% up to 15
\Ycircle{1}%
{\thicklines\segment(-\Rzero,0)(\Rzero,0)}% diameter
\Rbox[180](-\Rzero,0){0}\Rbox[0](\Rzero,0){\infty}
\Ycircle{0.05}\Ycircle{-0.05}\I=2% \I=2 is to avoid a division by 0
\fpdowhile{\I=<18}{\edef\Aux{\fpeval{\I/20}}\relax
{\thicklines\Ycircle{\Aux}*\Ycircle{-\Aux}*}%
\advance\I by1\edef\Aux{\fpeval{\I/20}}\relax
\Ycircle{\Aux}\Ycircle{-\Aux}\advance\I by 1\ignorespaces}% restarts from 1
\fpdowhile{\I<40}{\edef\Aux{\fpeval{\I/20}}\relax
{\thicklines\Ycircle{\Aux}*\Ycircle{-\Aux}*}%
\advance\I by 2\edef\Aux{\fpeval{\I/20}}\relax
\Ycircle{\Aux}\Ycircle{-\Aux}\advance\I by 2\ignorespaces}% restarts from 2
\fpdowhile{\I<80}{\edef\Aux{\fpeval{\I/20}}\relax
{\thicklines\Ycircle{\Aux}*\Ycircle{-\Aux}*}%
\advance\I by 4\edef\Aux{\fpeval{\I/20}}\relax
\Ycircle{\Aux}\Ycircle{-\Aux}\advance\I by 4\ignorespaces}% restarts from 4
\fpdowhile{\I=<140}{\edef\Aux{\fpeval{\I/20}}\relax
{\thicklines\Ycircle{\Aux}*\Ycircle{-\Aux}*}%
\advance\I by 10\edef\Aux{\fpeval{\I/20}}\relax
\Ycircle{\Aux}\Ycircle{-\Aux}\advance\I by 10\ignorespaces}% stops at 7.5
{\thicklines\Ycircle{8}*\Ycircle{-8}*}%
\GradResist{62}%
\edef\Rout{\fpeval{1.09*\Rzero}}%
\edef\RoutCifre{\fpeval{\Rout+2}}%
\edef\RoutTak{\fpeval{\Rout+1}}%
{\color{black}%
\Circlewithcenter 0,0radius\Rout
\I=0\fpdowhile{\I<10}%
{\edef\LAng{\fpeval{180-\I*36}}\edef\Cifre{\fpeval{\I*5}}%
\put(\LAng:\RoutCifre){%
\rotatebox{\fpeval{\LAng-90}}{\makebox(0,0)[b]{\scriptsize\Cifre}}}%
\advance\I by 1\ignorespaces}
\I=0\fpdowhile{\I<50}{%
\edef\LAng{\fpeval{180-\I*7.2}}\segment(\LAng:\Rout)(\LAng:\RoutTak)%
\advance\I by1\ignorespaces}
\Circlewithcenter0,0radius{\fpeval{\Scala+9}}}%
\GP@custom
\end{picture}
\ifGP@customcodereset\def\GP@custom{}\fi}%
\NewDocumentCommand{\bilinear}{}{\carta{0}{0}}
\NewDocumentCommand{\semilogx}{m}{\carta{#1}{0}}
\NewDocumentCommand{\semilogy}{m}{\carta{0}{#1}}
\NewDocumentCommand{\loglog}{O{0}mm}{\carta[#1]{#2}{#3}}
\NewDocumentCommand{\polar}{}{\PolarChart{0}}
\NewDocumentCommand{\logpolar}{m}{\PolarChart{#1}}
\NewDocumentCommand{\smith}{}{\SmithChart}
\NewDocumentCommand{\setgridcolor}{m}{\colorlet{gridcolor}{#1}}
\NewDocumentCommand{\setmajorlinethickness}{m}{\setlength{\lwa}{#1}}
\NewDocumentCommand{\setmediumlinethickness}{m}{\setlength{\lwa}{#1}}
\NewDocumentCommand{\setminorlinethickness}{m}{\setlength{\lwa}{#1}}
\NewDocumentCommand{\setminimumdistance}{m}{\setlength{\mindistanceunit}{#1}}
\NewDocumentCommand{\setxside}{m}{%
\ifnum\fpeval{#1 > \paperwidth}=1 \ClassError{graphpaper}{X side too wide!} \fi
\setlength{\xsideunit}{#1}}
\NewDocumentCommand{\setyside}{m}{%
\ifnum\fpeval{#1 > \paperheight}=1 \ClassError{graphpaper}{Y side too wide!} \fi
\setlength{\ysideunit}{#1}}
\def\GP@custom{}
\newif\ifGP@customcodereset \GP@customcoderesettrue
\NewDocumentCommand{\customcode}{O{1} m}{%
\ifnum#1=\z@ \GP@customcoderesetfalse \fi%
\def\GP@custom{#2}}
%% Copyright (C) 2020 Claudio Beccari & Francesco Biccari
%% 
%% Distributable under the LaTeX Project Public License,
%% version 1.3c or higher (your choice). The latest version of
%% this license is at: http://www.latex-project.org/lppl.txt
%% 
%% This work is "author-maintained".
%% 
%% This work consists of this file graphpaper.dtx,
%% and the derived files graphpaper.cls and graphpaper.pdf.
%% 
%%
%% End of file `graphpaper.cls'.
