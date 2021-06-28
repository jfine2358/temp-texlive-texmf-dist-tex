%%
%% This is file `bookshelf.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% bookshelf.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright © 2020 by latex@silmaril.ie
%% 
%% This file was generated from an XML master source.
%% Amendments and corrections should be notified to the
%% maintainer for inclusion in future versions.
%% 
\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{bookshelf}[2020/05/24 v0.5
  Turn your bibliography into a bookshelf image]
\RequirePackage{fix-cm}
  \PassOptionsToPackage{svgnames}{xcolor}
%%
%% ******************************************************************
%%
%% Options
\def\SIL@paper{a0paper}%
\DeclareOption{a0paper}{%
    \def\SIL@paper{a0paper}%
    \setlength\paperheight {1189mm}%
    \setlength\paperwidth  {841mm}}
\DeclareOption{a1paper}{%
    \def\SIL@paper{a1paper}%
    \setlength\paperheight {841mm}%
    \setlength\paperwidth  {594mm}}
\DeclareOption{a2paper}{%
    \def\SIL@paper{a2paper}%
    \setlength\paperheight {594mm}%
    \setlength\paperwidth  {420mm}}
\DeclareOption{a3paper}{%
    \def\SIL@paper{a3paper}%
    \setlength\paperheight {420mm}%
    \setlength\paperwidth  {297mm}}
\DeclareOption{a4paper}{%
    \def\SIL@paper{a4paper}%
    \setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}{%
    \def\SIL@paper{a5paper}%
    \setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}{%
    \def\SIL@paper{b5paper}%
    \setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}{%
    \def\SIL@paper{letterpaper}%
    \setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}{%
    \def\SIL@paper{legalpaper}%
    \setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}{%
    \def\SIL@paper{executivepaper}%
    \setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{ledgerpaper}{%
    \def\SIL@paper{ledgerpaper}%
    \setlength\paperheight {17in}%
    \setlength\paperwidth  {11in}}
\DeclareOption{tabloidpaper}{%
    \def\SIL@paper{tabloidpaper}%
    \setlength\paperheight {17in}%
    \setlength\paperwidth  {11in}}
\def\SIL@orient{landscape}%
\DeclareOption{landscape}{%
    \def\SIL@orient{landscape}%
    \setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\DeclareOption{portrait}{%
    \def\SIL@orient{}}
%%
%% ******************************************************************
%%
%% Load the document base class
\DeclareOption*{\ClassWarning{bookshelf}{%
    Unknown option `\CurrentOption', please RTFM}}
\ProcessOptions\relax
\LoadClass{report}
%%
%% Packages required for the class or package
%%
%% Font specification setup for use with \XeLaTeX{}.
\RequirePackage{fontspec}%
%% Required for calculations involving lengths or counters, such as changes to widths for margin adjustment.
\RequirePackage{calc}%
%% Used for fixed-point calculations
\RequirePackage{fp}%
%% Provide for graphics (PNG, JPG, or PDF format (only) for pdflatex; EPS format (only) for standard \LaTeX{}).
\RequirePackage{graphicx}%
%% Provide color.
\RequirePackage{xcolor}%
  \@ifundefined{T}{%
    \newcommand{\T}[2]{{\fontencoding{T1}%
      \selectfont#2}}}{}
%% Add picture commands (or backgrounds) to every page.
\RequirePackage{eso-pic}%
%% Package for establishing margins and text area.
\RequirePackage[\SIL@paper,\SIL@orient,nohead,
  nofoot,margin=1cm]{geometry}%
%% Use biblatex instead of \BibTeX{}
\RequirePackage[backend=biber,style=authoryear,
  doi=true,isbn=true,url=true,uniquename=false]{biblatex}%
  \AtBeginDocument{%
    \setlength{\bibitemsep}{1ex}%
    \setlength{\bibnamesep}{1.5\itemsep}%
    \defbibheading{shortbib}[References]%
      {\section{#1}}}
  \@ifpackagewith{babel}{british}{%
    \DeclareLanguageMapping{british}%
      {british-apa}}{\relax}
  \providetoggle{blx@skipbiblist}
%%
%% ******************************************************************
%%
%% Non-package resources
\input{random.tex}
%%
%% ******************************************************************
%%
%% The code
\newcounter{SIL@maxfont}
\newcounter{SIL@fontsel}
\input{pickfont.tex}
\newcounter{SIL@maxcolno}
\input{svgnam.tex}
\newcounter{SIL@loopcount}
\newcounter{SIL@maxloop}
\newcounter{SIL@bgcolno}
\newcounter{SIL@fgcolno}
\newlength{\SIL@splitpoint}
\setlength{\SIL@splitpoint}{0.6pt}
\def\SIL@bgcol{White}
\def\SIL@fgcol{Black}
\newlength{\SIL@bgval}
\newlength{\SIL@fgval}
\newlength{\SIL@bgfgdiff}
\newif\ifSIL@notyetcols
\pagecolor{BurlyWood}
\AddToShipoutPictureBG{%
 \AtTextLowerLeft{\color{SaddleBrown}%
   \rule[-\footskip]{\textwidth}{%
     \dimexpr\textheight+\footskip}}}
\newlength{\SIL@bookheight}
\newlength{\SIL@bookwidth}
\newlength{\SIL@minbookwidth}
\newlength{\SIL@maxbookwidth}
\newlength{\SIL@minbookheight}
\newlength{\SIL@maxbookheight}
\newlength{\SIL@titlewidth}
\newlength{\SIL@authorwidth}
\newlength{\SIL@titleheight}
\newlength{\SIL@authorheight}
\newlength{\SIL@scaledtitle}
\newlength{\SIL@heightfortitle}
\newbox\SIL@titlebox
\newif\ifSIL@topauthor
\newif\ifSIL@titleoneline
\newcounter{SIL@scale}
\def\SIL@scaleint#1.#2\sentinel{%
   \setcounter{SIL@scale}{#1}}
\fboxsep1em\fboxrule.1pt
\pagestyle{empty}
\newcommand{\makebook}[1]{%
  \typeout{^^J#1}%
  \setcounter{SIL@maxloop}{10}%
  \setcounter{SIL@loopcount}{0}%
  \setlength{\SIL@minbookwidth}{5mm}%
  \setlength{\SIL@maxbookwidth}{20mm}%
  \setlength{\SIL@minbookheight}{70mm}%
  \setlength{\SIL@maxbookheight}{110mm}%
  \setlength{\SIL@bookwidth}{0pt}%
  \setlength{\SIL@bookheight}{0pt}%
  \setlength{\SIL@heightfortitle}{0pt}%
  \SIL@topauthorfalse
  \loop
    \addtocounter{SIL@loopcount}{1}%
    \typeout{Try \theSIL@loopcount}%
    \setrannum{\c@SIL@bgcolno}{1}{%
      \c@SIL@maxcolno}%
    \typeout{BG=\theSIL@bgcolno}%
    \setrannum{\c@SIL@fgcolno}{1}{%
      \c@SIL@maxcolno}%
    \typeout{FG=\theSIL@fgcolno}%
    \setlength{\SIL@bgval}{%
      \SIL@svgcolval{\theSIL@bgcolno}pt}%
    \typeout{BGval=\the\SIL@bgval}%
    \setlength{\SIL@fgval}{%
      \SIL@svgcolval{\theSIL@fgcolno}pt}%
    \typeout{FGval=\the\SIL@fgval}%
    \setlength{\SIL@bgfgdiff}{%
      \SIL@bgval - \SIL@fgval}%
    \typeout{Split gap is \the\SIL@bgfgdiff}%
    \ifdim\SIL@bgfgdiff<0pt
      \setlength{\SIL@bgfgdiff}{%
        \SIL@fgval - \SIL@bgval}%
      \typeout{Using absolute value
        \the\SIL@bgfgdiff}%
    \fi
    \ifdim\SIL@bgval<\SIL@splitpoint
      \ifdim\SIL@fgval>\SIL@splitpoint
        \ifdim\SIL@bgfgdiff>0.2pt
          \SIL@notyetcolsfalse
        \else
          \SIL@notyetcolstrue
        \fi
      \else
        \SIL@notyetcolstrue
      \fi
    \else
      \ifdim\SIL@fgval<\SIL@splitpoint
        \ifdim\SIL@bgfgdiff>0.2pt
          \SIL@notyetcolsfalse
        \else
          \SIL@notyetcolstrue
        \fi
      \else
        \SIL@notyetcolstrue
      \fi
    \fi
    \typeout{BG=\theSIL@bgcolno,
             FG=\theSIL@fgcolno}%
    \ifnum\c@SIL@loopcount>\c@SIL@maxloop
      \SIL@notyetcolsfalse
    \fi
  \ifSIL@notyetcols\repeat
  \def\SIL@bgcol{\SIL@svgcolname{%
      \theSIL@bgcolno}}%
  \def\SIL@fgcol{\SIL@svgcolname{%
      \theSIL@fgcolno}}%
  \typeout{BG=\SIL@bgcol, FG=\SIL@fgcol}%
  \setrannum{\c@SIL@fontsel}{1}{\c@SIL@maxfont}%
  \input{fontsel/\theSIL@fontsel.tex}%
  \typeout{Set in \SILmfontname}%
  \settowidth{\SIL@authorwidth}{%
              \SILmfont\citefullauthor{#1}}%
  \typeout{Author width: \the\SIL@authorwidth}%
  \settoheight{\SIL@authorheight}{%
               \SILmfont\citefullauthor{#1}}%
  \typeout{Author height: \the\SIL@authorheight}%
  \ifdim\SIL@authorwidth<.9\SIL@maxbookwidth
    \typeout{Author width is less than 90\%
             of \the\SIL@maxbookwidth}%
    \setlength{\SIL@bookwidth}{%
               1.1\SIL@authorwidth}%
    \typeout{Book width set to \the\SIL@bookwidth}%
    \ifdim\SIL@bookwidth<\SIL@minbookwidth
      \setlength{\SIL@bookwidth}{%
                 \SIL@minbookwidth}%
      \typeout{Book width reset to min
               \the\SIL@minbookheight}%
    \fi
    \SIL@topauthortrue
  \else
    \typeout{Author won't fit in .9 of
             \the\SIL@maxbookwidth}%
  \fi
  \settowidth{\SIL@titlewidth}{%
              \SILmfont\citetitle{#1}}%
  \ifdim\SIL@titlewidth=0pt
    \typeout{WARNING title width for entry "#1"
      set in \SILmfontname=0pt!}%
    \typeout{Likely that the entry has faulty
      syntax or a bogus title field}%
    \typeout{or a BiBTeX management or
      crossref setting is being misinterpreted.}%
    \typeout{I can't go any further until you
      fix this, sorry}%
    \end{document}%
  \fi
  \ifSIL@topauthor
    \typeout{Title width: \the\SIL@titlewidth}%
  \else
    \addtolength{\SIL@titlewidth}{%
                 \widthof{\SILmfont~~—~~}}%
    \addtolength{\SIL@titlewidth}{%
                 \SIL@authorwidth}%
    \typeout{Title width with em rule and author:
      \the\SIL@titlewidth}%
  \fi
  \typeout{Limits: width=\the\SIL@minbookwidth
              –\the\SIL@maxbookwidth;
                   height=\the\SIL@minbookheight
              –\the\SIL@maxbookheight}%
  \setrandim{\SIL@bookheight}%
            {\SIL@minbookheight}%
            {\SIL@maxbookheight}%
  \typeout{Height generated as
           \the\SIL@bookheight}%
  \setlength{\SIL@heightfortitle}%
            {.9\SIL@bookheight}%
  \typeout{Height available for title (90\%):
           \the\SIL@heightfortitle}%
  \ifSIL@topauthor
    \typeout{Width set because author fits:
             \the\SIL@bookwidth}%
    \addtolength{\SIL@heightfortitle}%
                {-1.2\SIL@authorheight}%
    \typeout{Height available for title reset to
             \the\SIL@heightfortitle}%
  \else
  \setrandim{\SIL@bookwidth}%
            {\SIL@minbookwidth}%
            {\SIL@maxbookwidth}%
  \typeout{Width generated as
           \the\SIL@bookwidth}%
  \fi
  \ifdim\SIL@titlewidth<\SIL@heightfortitle
    \typeout{Titling fits in
             \the\SIL@heightfortitle}%
    \SIL@titleonelinetrue
    \edef\titleval{\strip@pt\SIL@titlewidth}%
    \edef\heightval{\strip@pt\SIL@heightfortitle}%
    \FPeval\SIL@scaledtitle{\heightval/\titleval}%
    \typeout{Scaling 1-line title by
             \SIL@scaledtitle}%
    \expandafter\SIL@scaleint
                \SIL@scaledtitle\sentinel
    \ifnum\c@SIL@scale>4
      \gdef\SIL@scaledtitle{4}%
      \typeout{Resetting scale \theSIL@scale\ to
               \SIL@scaledtitle}%
    \fi
  \else
    \typeout{Titling won't fit
             \the\SIL@heightfortitle}%
    \SIL@titleonelinefalse
    \setbox\SIL@titlebox=\vbox{%
      \hsize\SIL@heightfortitle
      \SILmfont\raggedright
      \vrule height1em width0pt
      \bfseries\citetitle{#1}%
      \vrule depth.2em width0pt
    }%
    \setlength{\SIL@titleheight}%
              {\ht\SIL@titlebox + \dp\SIL@titlebox}%
    \typeout{Multiline title takes
             \the\SIL@titleheight}%
    \ifdim\SIL@titleheight>\SIL@bookwidth
      \typeout{Height of title
               \the\SIL@titleheight\
               is greater than
               \the\SIL@bookwidth}%
      \edef\titleval{\strip@pt\SIL@titleheight}%
      \edef\heightval{\strip@pt\SIL@bookwidth}%
      \FPeval\SIL@scaledtitle
          {10 - \heightval / \titleval}%
      \typeout{10 - \heightval\ ÷ \titleval\
               = \SIL@scaledtitle}%
      \typeout{Using smaller font \SIL@scaledtitle
               pt for multiline title}%
    \else
      \typeout{Height of title
               \the\SIL@titleheight\
               is less than
               \the\SIL@bookwidth}%
      \edef\titleval{\strip@pt\SIL@titleheight}%
      \edef\heightval{\strip@pt\SIL@bookwidth}%
      \FPeval\SIL@scaledtitle
          {10 + \heightval / \titleval}%
      \typeout{10 + \heightval\ ÷ \titleval\
               = \SIL@scaledtitle}%
      \typeout{Using larger font \SIL@scaledtitle
               pt for multiline title}%
    \fi
  \fi
  \leavevmode\vbox{\hsize\SIL@bookwidth
    \advance\hsize by2\fboxsep
    \advance\hsize by2\fboxrule
  \fcolorbox{black}{\SIL@bgcol}{%
    \ifSIL@topauthor
      \typeout{Setting with top author}%
      \vbox to\SIL@bookheight{\hsize\SIL@bookwidth
        \typeout{Spine is a vbox to
          \the\SIL@bookheight,
          hsize=\the\SIL@bookwidth}%
        \centering
        \SILmfont\color{\SIL@fgcol}%
        \citefullauthor{#1}%
        \par\vfill
        \rotatebox{90}{\vbox to\SIL@bookwidth{%
            \hsize\SIL@heightfortitle
          \null\vfill
          \typeout{Title in a vbox to
                   \the\SIL@bookwidth,
                   hsize=\the\SIL@heightfortitle}%
          \raggedright\color{\SIL@fgcol}%
          \ifSIL@titleoneline
            \scalebox{\SIL@scaledtitle}%
                     {\bfseries\citetitle{#1}}%
          \else
            \fontsize{\SIL@scaledtitle}%
                     {\SIL@scaledtitle}\selectfont
            \bfseries\citetitle{#1}%
          \fi
          \par\vfill}%
        }%
      }%
    \else
      \typeout{Setting author inline to title}%
      \vbox to\SIL@bookheight{\hsize\SIL@bookwidth
        \typeout{Spine is a vbox to
                 \the\SIL@bookheight,
                 hsize=\the\SIL@bookwidth}%
        \centering
        \SILmfont\color{\SIL@fgcol}%
        \rotatebox{90}{\vbox to\SIL@bookwidth{%
            \hsize\SIL@heightfortitle
          \null\vfill
          \typeout{Title and author in a vbox to
                   \the\SIL@bookwidth,
                   hsize=\the\SIL@heightfortitle}%
          \raggedright\color{\SIL@fgcol}%
          \ifSIL@titleoneline
            \scalebox{\SIL@scaledtitle}%
                     {{\bfseries\citetitle{#1}}\quad
                       —\ \ \citefullauthor{#1}}%
          \else
            \fontsize{\SIL@scaledtitle}%
                     {\SIL@scaledtitle}\selectfont
                     {\bfseries\citetitle{#1}}\quad
                     —\ \ \citefullauthor{#1}%
          \fi
          \par\vfill}%
        }%
      }%
    \fi
  }%
  \\\fboxsep0pt\fboxrule0pt
  \colorbox{BurlyWood}{\hbox to\hsize{%
      \hfil\vrule height3mm depth6mm width0pt
      \normalfont\scriptsize\theSIL@fontsel\hfil}}%
  }%
\kern-2.2mm}%
\DeclareCiteCommand{\citefullauthor}
  {\boolfalse{citetracker}%
   \boolfalse{pagetracker}%
   \DeclareNameAlias{labelname}{given-family}%
   \usebibmacro{prenote}}
  {\ifciteindex
     {\indexnames{labelname}}
     {}%
   \printnames{labelname}}
  {\multicitedelim}
  {\usebibmacro{postnote}}
%%\DeclareLabeltitle[article]{%
%%  \field{journaltitle}
%%}
%%\DeclareLabeltitle
%%    [inbook,incollection,inproceedings]{%
%%  \field{booktitle}
%%  \field{maintitle}
%%}
\DeclareFieldFormat*{citetitle}{#1}
\let\citeA\textcite
\let\titleref\emph
\def\emdash{~--- }

\endinput
%%
%% End of file `bookshelf.cls'.
