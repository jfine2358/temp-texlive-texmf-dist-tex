\NeedsTeXFormat{LaTeX2e}[1994/12/01]%
\ProvidesClass{confproc}
  [2007/10/17 v0.4f: Conference Proceedings class (VV)]
\LoadClass{book}
\DeclareOption{a4paper}
  {\setlength\paperheight {297mm}%
  \setlength\paperwidth {210mm}%
  \setlength\oddsidemargin {-4.95truemm}%
  \setlength\evensidemargin {-10.95truemm}%
  \def\shiftsafourpaper{}}
\DeclareOption{letterpaper}
  {\setlength\paperheight {11in}%
  \setlength\paperwidth {8.5in}%
  \setlength\oddsidemargin {-4.95truemm}%
  \setlength\evensidemargin {-4.95truemm}%
  \def\shiftsletterpaper{}}
\PassOptionsToPackage{a4paper,letterpaper}{book}
\PassOptionsToPackage{a4paper,letterpaper}{hyperref}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse%
  \def\conf@WithClearsinglepage{}}
\DeclareOption{twoside}{\@twosidetrue \@mparswitchtrue%
  \def\conf@WithCleardoublepage{}}
\DeclareOption{onesidepapers}{%
  \def\conf@WithClearsinglepagePapers{}}
\DeclareOption{twosidepapers}{%
  \def\conf@WithCleardoublepagePapers{}}
\DeclareOption{compil=bibmerge}
  {\typeout{confproc: LaTeX run-> bib. items only (merging process)}%
  \def\conf@BibMerge{}}
\DeclareOption{compil=bibbackref}
  {\typeout{confproc: LaTeX run-> generating biblio back references}%
  \def\conf@BibBackRef{}}
\DeclareOption{compil=last}
  {\typeout{!!! confproc: LaTeX run-> LAST !!!}%
  \def\conf@FinalVersion{}}
\DeclareOption{draft}
  {\typeout{confproc: not including PDF files}%
  \PassOptionsToPackage{draft}{pdfpages}%
  \def\conf@DoNotIncludePDFs{}}
\DeclareOption{final}
  {\typeout{confproc: including PDF files}%
  \PassOptionsToPackage{final}{pdfpages}%
  \def\conf@IncludePDFs{}}
\DeclareOption{electronic}%
  {\typeout{confproc: adding colors for hyperlinks}%
  \PassOptionsToPackage{colorlinks=true}{hyperref}%
  \def\conf@procWithColors{}}
\DeclareOption{printed}%
  {\typeout{confproc: hyperref with no color for hyperlinks}
  \PassOptionsToPackage{colorlinks=false}{hyperref}%
  \def\conf@procWithoutColors{}}
\DeclareOption{headers=no}%
  {\typeout{confproc: no fancy headers}%
  \def\conf@NoFancyHeaders{}}
\DeclareOption{headers=pdfonly}%
  {\typeout{confproc: fancy headers on inserted PDFs only}%
  \def\conf@FancyHeadersOnPapers{}}
\DeclareOption{headers=exceptpdf}%
  {\typeout{confproc: fancy headers for all pages except PDFs}%
  \def\conf@FancyHeadersExceptPapers{}}
\DeclareOption{headers=allpages}%
  {\typeout{confproc: fancy headers on all pages, PDFs included}%
  \def\conf@FancyHeadersOnPapers{}%
  \def\conf@FancyHeadersExceptPapers{}}
\DeclareOption{twocolindex}
  {\typeout{confproc: 2 columns index}%
  \def\conf@TwoColumnIndex{}}
\DeclareOption{threecolindex}
  {\typeout{confproc: 3 columns index}%
  \def\conf@ThreeColumnIndex{}}
\DeclareOption{twocolbib}
  {\typeout{confproc: 2 columns biblio}%
  \def\conf@TwoColumnBib{}}
\DeclareOption{onecolbib}
  {\typeout{confproc: 1 column biblio}%
  \def\conf@OneColumnBib{}}
\DeclareOption{twocoltoc}
  {\typeout{confproc: 2 columns TOC}%
  \def\conf@TwoColumnTOC{}}
\DeclareOption{onecoltoc}
  {\typeout{confproc: 1 column TOC}%
  \def\conf@OneColumnTOC{}}
\DeclareOption{tocnumleft}
  {\typeout{confproc: TOC numbering on left}%
  \def\conf@TocNumberingLeft{}}
\DeclareOption{tocnumright}
  {\typeout{Confproc: TOC numbering on right}%
  \def\conf@TocNumberingRight{}}
\DeclareOption{movepagenumbers}
  {\typeout{confproc: moving page numbers to check PDFs numbering}%
  \def \conf@TestPageNumbering{}}
\DeclareOption{cleardoublepage}%
  {\typeout{confproc: using double page clearing}%
  \def\conf@WithCleardoublepage{}}
\DeclareOption{clearsinglepage}%
  {\typeout{confproc: using double page clearing}%
  \def\conf@WithClearsinglepage{}}
\DeclareOption{debug}
  {\typeout{Confproc: printing debug for confproc, hyperref}%
  \PassOptionsToPackage{debug}{hyperref}%
  \def\conf@procWithDebug{}}
\DeclareOption{verbose}
  {\typeout{Confproc: printing debug for confproc, hyperref}%
  \PassOptionsToPackage{debug}{hyperref}%
  \def\conf@procWithDebug{}}
\DeclareOption*{\PackageWarning{procconf}%
  {Unknown option `\CurrentOption'; passed to 'hyperref'}%
  \PassOptionsToClass{\CurrentOption}{hyperref}}
\ExecuteOptions{letterpaper,10pt,twoside,%
  twosidepapers,electronic,headers=no,compil=bibbackref,%
  tocnumleft,onecoltoc,threecolindex,twocolbib,%
  colorlinks=true,linkcolor=red,citecolor=blue,pagecolor=red,urlcolor=blue,%
  bookmarksopen=true,bookmarksopenlevel=1}
\ProcessOptions
\RequirePackage{graphicx}
\RequirePackage{pdfpages}
\RequirePackage{fancyhdr}
\RequirePackage[nottoc,notbib,notindex]{tocbibind}
\RequirePackage{titletoc}
\ifdefined\conf@TwoColumnTOC
  \RequirePackage[toc]{multitoc}
\fi
\RequirePackage{index}
\RequirePackage{multicol}
\ifdefined\conf@TwoColumnIndex
  \renewenvironment{theindex}{%
    \if@twocolumn \@restonecolfalse
    \else \@restonecoltrue \fi
    \vspace*{-0.8cm}
    \section*{{\indexname}}
    \let\item\@idxitem
    \columnseprule \z@
    \columnsep 35\p@
    \begin{multicols}{2}[%
      \ifx\index@prologue\@empty\else
        \index@prologue
        \bigskip
      \fi]%
      \parindent\z@
      \parskip\z@ \@plus .3\p@\relax
  }{\end{multicols}%
    \if@restonecol \onecolumn
    \else \clearpage \fi}
\else
    \ifdefined\conf@ThreeColumnIndex%
  \renewenvironment{theindex}{%
    \if@twocolumn \@restonecolfalse
    \else \@restonecoltrue \fi
    \vspace*{-0.8cm}
    \section*{{\indexname}}
    \let\item\@idxitem
    \columnseprule \z@
    \columnsep 35\p@
    \begin{multicols}{3}[%
      \ifx\index@prologue\@empty\else
        \index@prologue
        \bigskip
      \fi]%
      \parindent\z@
      \parskip\z@ \@plus .3\p@\relax
  }{\end{multicols}%
    \if@restonecol \onecolumn
    \else \clearpage \fi }
  \fi
\fi
\RequirePackage{sectsty}
\newcommand{\confcite}[1]{\cite{#1}}
\RequirePackage{newapave}
\RequirePackage{color}
\definecolor{colorforlink}{rgb}{0,0,0.5}
\definecolor{colorforpage}{rgb}{0,0,0.5}
\definecolor{colorforcite}{rgb}{0,0.5,0}
\definecolor{colorforurl}{cmyk}{0,1,0,0}
\RequirePackage[pdftex,raiselinks,hyperindex,backref,pagebackref,%
    plainpages=false,pdfpagelabels,breaklinks,linktocpage,%
    pdfstartview=XYZ]{hyperref}
\RequirePackage[figure,table]{hypcap}
\newcommand{\procpdfauthor}{Proceedings author/editor}
\newcommand{\procpdftitle}{Proceedings title}
\newcommand{\procpdfsubject}{Proceedings description}
\AtBeginDocument{
  \hypersetup{
    pdfauthor = \procpdfauthor,
    pdftitle = \procpdftitle,
    pdfsubject = \procpdfsubject,
    pdfkeywords = {},
    pdfcreator = {LaTeX with `confproc' package},
    pdfproducer = {pdfLaTeX}}}
\topmargin 0truept
\headheight 12truept
\footskip 14mm
\textheight 229truemm
\textwidth 175truemm
\voffset -28truept
\headsep 20truept
\renewcommand{\contentsname}{Conference Program}
\renewcommand{\bibname}{Full Bibliography}
\renewcommand{\indexname}{Index of Authors}
\newcommand{\proclhead}{\em \small Proceedings of the blah blah blah}
\newcommand{\proccfoot}{\small Proc-\thepage}
\pagestyle{fancyplain}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{-5mm}
\lhead{\proclhead}
\rhead{}
\lfoot{}
\rfoot{}
\cfoot{\proccfoot}{}
\ifdefined \conf@FancyHeadersExceptPapers
  \pagestyle{fancy}
\else
  \pagestyle{empty}
\fi
\newlength{\procoptfootskip}
\ifdefined\conf@TestPageNumbering%
  \setlength{\procoptfootskip}{3mm}%
  \cfoot{\vskip \procoptfootskip \proccfoot}%
\else%
  \setlength{\procoptfootskip}{0mm}%
\fi
\ifdefined\conf@TocNumberingRight
  \titlecontents{section}[2.5em]% left margin
    {\vspace*{0.3em}}% space between two papers in the TOC
    {}{}{\contentsmargin{0pt} \hfill \contentspage}% filler and page
\else%
  \dottedcontents{section}[]{\fillright}{}{1pc}
  \titlecontents{section}[2.5em]%
    {\vspace*{0.3em}}%
    {\hspace*{-2.5em}\contentspage\hspace*{2.5em}}% left shifting page num.
    {\hspace*{-2.5em}\contentspage\hspace*{2.5em}}% idem
    {}% filler and page
\fi
\newcommand{\tocmattertocstyle}{
  \titlecontents{part}[-1em]{\addvspace{1pc}}%
    {\contentspage\hspace*{3.2em}\contentsmargin{0pt}%
      \makebox[0pt][r]{\huge\thecontentslabel\enspace}\large}%
    {\contentspage\hspace*{3.2em}\contentsmargin{0pt}\large}%
    {}[\addvspace{.5pc}]
  \titlecontents{chapter}[-1em]{\addvspace{1pc}}%
    {\contentspage\hspace*{3.2em}\contentsmargin{0pt}%
      \makebox[0pt][r]{\huge\thecontentslabel\enspace}\large}%
    {\contentspage\hspace*{3.2em}\contentsmargin{0pt}\large}%
    {}[\addvspace{.5pc}]
}
\ifdefined\conf@TocNumberingRight
  \newcommand{\mainmattertocstyle}{
    \titlecontents{chapter}[0pt]%
      {\addvspace{1pc}\bfseries\itshape}%
      {\contentsmargin{0pt}\bfseries%
        \makebox[0pt][r]{\huge\thecontentslabel\enspace}\large}%
      {\contentsmargin{0pt}\large}{}[\addvspace{.5pc}]%
    \titlecontents{part}[0pt]%
      {\addvspace{1pc}\bfseries}%
      {\contentsmargin{0pt}\bfseries%
        \makebox[0pt][r]{\huge\thecontentslabel\enspace}\large}%
      {\contentsmargin{0pt}\large}{}[\addvspace{.5pc}]%
\else
  \ifdefined\conf@TocNumberingLeft% default
    \newcommand{\mainmattertocstyle}{
      \titlecontents{section}[2.5em]%
        {\vspace*{0.3em}}%
        {\hspace*{-2.5em}\contentspage\hspace*{2.5em}}%
        {\hspace*{-2.5em}\contentspage\hspace*{2.5em}}%
        {}%
      \titlecontents{chapter}[0pt]%
        {\addvspace{1pc}\bfseries\itshape}%
        {\contentsmargin{0pt}\bfseries %
          \makebox[0pt][r]{\huge\thecontentslabel\enspace}\large}%
        {\contentsmargin{0pt}\large}{}[\addvspace{.5pc}]%
      \titlecontents{part}[0pt]%
        {\addvspace{1pc}\bfseries}%
        {\contentsmargin{0pt}\bfseries %
          \makebox[0pt][r]{\huge\thecontentslabel\enspace}\large}%
        {\contentsmargin{0pt}\large}{}[\addvspace{.5pc}]%
   }
  \else
    \newcommand\mainmattertocstyle{}
  \fi
\fi
\renewcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}
  \mainmattertocstyle}
\ifdefined\conf@TocNumberingRight
  \newcommand{\backmattertocstyle}{
    \titlecontents{section}[]{}{}{}{}[]%
    \titlecontents{part}%
      [0pt]{\addvspace{1pc}}{}{}%
      {\contentsmargin{0pt} \large \hfill\contentspage}%
      [\addvspace{.5pc}]%
  }%
\else%
  \ifdefined\conf@TocNumberingLeft%
    \newcommand{\backmattertocstyle}{%
      \titlecontents{section}[]{}{}{}{}[]%
      \titlecontents{part}%
        [0pt]%
        {\addvspace{1pc}}%
        {\contentspage\hspace*{2.5em}\contentsmargin{0pt}%
        \bfseries%
        \makebox[0pt][r]{\huge\thecontentslabel\enspace}%
        \large\bfseries}%
        {\contentspage\hspace*{2.5em}\contentsmargin{0pt} \large\bfseries}%
        {}%
        [\addvspace{.5pc}]%
      }%
  \else%
    \newcommand\backmattertocstyle{}%
  \fi%
\fi
\renewcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse
  \backmattertocstyle}
\ifdefined\conf@FancyHeadersExceptPapers
  \newcommand{\otherpagestyle}{\pagestyle{fancy}}
  \newcommand{\thisotherpagestyle}{\thispagestyle{fancy}}
\else
  \newcommand{\otherpagestyle}{\pagestyle{empty}}
  \newcommand{\thisotherpagestyle}{\thispagestyle{empty}}
\fi
\ifdefined\conf@FancyHeadersOnPapers
  \newcommand{\PDFpagestyle}{\thispagestyle{fancy}}
\else
  \newcommand{\PDFpagestyle}{\thispagestyle{empty}}
\fi
\chapterfont{\thisotherpagestyle}
\ifdefined\conf@WithCleardoublepage
  \newcommand{\clearsingleordoublepage}{\cleardoublepage}
\else
  \ifdefined\conf@WithClearsinglepage
    \newcommand{\clearsingleordoublepage}{\clearpage}
  \else
    \newcommand{\clearsingleordoublepage}{\cleardoublepage}
  \fi
\fi
\ifdefined\conf@FinalVersion
    \newcommand{\UseBackRef}{}
\else
    \newcommand{\CreateBackRef}{}
\fi
\newlength{\LaTeXxShift}
\newlength{\LaTeXyShift}
\newlength{\WordxShift}
\newlength{\WordyShift}
\ifdefined\shiftsafourpaper
  \setlength{\LaTeXxShift}{0pt}
  \setlength{\LaTeXyShift}{28pt}
  \setlength{\WordxShift}{10pt}
  \setlength{\WordyShift}{-40pt}
\else
  \ifdefined\shiftsletterpaper
    \setlength{\LaTeXxShift}{8.45pt}
    \setlength{\LaTeXyShift}{-3pt}
    \setlength{\WordxShift}{10pt}
    \setlength{\WordyShift}{-40pt}
  \fi
\fi
\newcommand{\papertitle}{}
\newcommand{\paperauthors}{}
\newcommand{\paperindex}{}
\newcommand{\paperref}{}
\newcommand{\paperpagenum}{}
\newcommand{\papercite}{}
\newcommand{\papertitlestyle}{}
\newcommand{\paperauthorstyle}{\texorpdfstring{\newline\itshape}{\break}}
\newcounter{paperpagenum}
\newcommand{\proctoctitleauthor}[2]{%
    \texorpdfstring{{\papertitlestyle#1}{\paperauthorstyle#2}}%
      {{\papertitlestyle#1}}}
%%    \begin{macrocode}
\newcommand{\procinsertpaper}[9]{
  \setcounter{paperpagenum}{#2}
  #6%
  \ifnum\thepaperpagenum=1
    \ifdefined\conf@procWithDebug\typeout{confproc: 1-page long paper}\fi
    \ifdefined\UseBackRef
      \includepdf[noautoscale,offset= #1,pages=1,%
        linktodoc,linkname=\PAPERPATH #8.pdf,%
        addtotoc={1, section, 1, \proctoctitleauthor{#4}{#5}, #3},%
        pagecommand = {#9\PDFpagestyle}%
        ]{\PAPERPATH #8.pdf}%
    \else
      \includepdf[noautoscale,offset= #1,pages=1,%
        linktodoc,linkname=\PAPERPATH #8.pdf,%
        addtotoc={1, section, 1, \proctoctitleauthor{#4}{#5}, #3},%
        pagecommand = {#9\PDFpagestyle\vspace*{-1cm}\confcite{#7}}%
        ]{\PAPERPATH #8.pdf}%
    \fi
  \else
    \includepdf[noautoscale,offset= #1,pages=1,%
      linktodoc,linkname=\PAPERPATH #8.pdf,%
      addtotoc={1, section, 1, \proctoctitleauthor{#4}{#5}, #3},%
      pagecommand = {#9\PDFpagestyle}%
      ]{\PAPERPATH #8.pdf}%
    \ifdefined\conf@BibMerge%
      \includepdf[noautoscale,offset= #1,pages=\thepaperpagenum,%
        linktodoc,linkname=\PAPERPATH #8.pdf,%
          pagecommand = {\PDFpagestyle\vspace*{-2cm}\confcite{#7}}%
        ]{\PAPERPATH #8.pdf}%
      \PDFpagestyle{}%
      \ifdefined\conf@procWithDebug
        \typeout{confproc: bibliography insertion only}\fi
    \else
      \addtocounter{paperpagenum}{-1}
      \includepdf[noautoscale,offset= #1,pages=2-\thepaperpagenum,%
        linktodoc,linkname=\PAPERPATH #8.pdf,%
        pagecommand = {\PDFpagestyle}%
        ]{\PAPERPATH #8.pdf}%
      \PDFpagestyle{}%
      \addtocounter{paperpagenum}{1}
      \ifdefined\CreateBackRef
        \includepdf[noautoscale,offset= #1,pages=\thepaperpagenum,%
          linktodoc,linkname=\PAPERPATH #8.pdf,%
          pagecommand = {\PDFpagestyle\vspace*{-2cm}\confcite{#7}}%
          ]{\PAPERPATH #8.pdf}%
      \else
        \ifdefined\UseBackRef
          \includepdf[noautoscale,offset= #1,pages=\thepaperpagenum,%
            linktodoc,linkname=\PAPERPATH #8.pdf,%
            pagecommand = {\PDFpagestyle}%
            ]{\PAPERPATH #8.pdf}%
        \fi
      \fi
    \fi
    \ifdefined\conf@procWithDebug
      \typeout{confproc: partial paper insertion (last page=bib items)}\fi
  \fi
  \ifdefined\conf@procWithDebug
    \typeout{---> file: #8.pdf (#2 pages)}
    \typeout{---> title: #4}
    \typeout{---> author(s): #5}
    \typeout{---> index: #6}
  \fi
  \newpage
  \ifdefined\conf@WithClearsinglepagePapers
    \clearpage
  \else
    \ifdefined\conf@WithCleardoublepagePapers
      \cleardoublepage
    \fi
  \fi
}
\renewcommand\tableofcontents{%
  \tocmattertocstyle
  \clearsingleordoublepage
  \pdfbookmark[0]{\contentsname}{contents}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
  \clearsingleordoublepage
}
\newcommand{\procday}[1]{%
  \phantomsection%
  \addcontentsline{toc}{part}{#1}}
\newcommand{\session}[1]{%
  \phantomsection%
  \addcontentsline{toc}{chapter}{#1}}
\newcommand{\paperswitch}{}
\setlength{\bibhang}{0.5em} %
\renewenvironment{thebibliography}[1]
     {\ifdefined\conf@TwoColumnBib%
        \twocolumn
      \fi
      \ifdefined\conf@BibMerge%
        \nocite{*}%
      \else%
        \clearsingleordoublepage%
      \fi%
      \section*{\bibname}%
      \addcontentsline{toc}{part}{\bibname}
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \procbibintro
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist
      \setlength{\labelsep}{0em}
      \setlength{\itemindent}{-\bibhang}
      \setlength{\leftmargin}{\bibhang}}
\renewcommand\newblock{\hskip 0em plus 0.0em minus .07em}
\newcommand{\procbibintro}{{\it ~~~This bibliography is a compilation
  of all bibliographic  references from each paper. Page numbers that
  appear at the  end of each entry link to the bibliography sections that
  include it. Please click on the URL or on the page number to access
  the linked item.}}
\newcommand{\insertindex}{
  \clearsingleordoublepage
  \onecolumn
  \section*{~~}%
  \addcontentsline{toc}{part}{\indexname}%
  \renewcommand{\proclhead}{}%
  \renewcommand{\proccfoot}{}%
  \printindex}
\InputIfFileExists{confproc.cfg}
  {\typeout{************^^J%
    * Local config file confproc.cfg used *^^J%
    ************}
  }{}%
