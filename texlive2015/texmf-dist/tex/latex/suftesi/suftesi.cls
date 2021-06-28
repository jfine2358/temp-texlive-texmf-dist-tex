%%
%% This is file `suftesi.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% suftesi.dtx  (with options: `class')
%% 
%%  Copyright 2009-2015 by Ivan Valbusa
%% 
%%  This program is provided under the terms of the
%%  LaTeX Project Public License distributed from CTAN
%%  archives in directory macros/latex/base/lppl.txt.
%% 
%%  Author: Ivan Valbusa
%%          ivan dot valbusa at univr dot it
%% 
%%  This work has the LPPL maintenance status "author-maintained".
%% 
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{suftesi}
    [2015/03/31 v2.0.1 A class for typesetting theses, books and articles]
\ClassWarningNoLine{suftesi}{%
  ******************************************\MessageBreak
  * DO NOT MODIFY THE STYLES OF THIS CLASS\MessageBreak
  * WITH PACKAGES AND/OR COMMANDS WHICH\MessageBreak
  * MAY CHANGE THE LAYOUT OF THE DOCUMENT.\MessageBreak
  * SEE DOCUMENTATION FOR DETAILS.\MessageBreak
  * ANYWAY, DON'T WORRY!\MessageBreak
  * THIS IS A HARMLESS MESSAGE :-)\MessageBreak
  ******************************************}{}%
\RequirePackage{xkeyval}
\newif\ifsuftesi@standardfont
\newif\ifsuftesi@porson
\newif\ifsuftesi@centerheader
\newif\ifsuftesi@sufplain
\newif\ifsuftesi@article
\newif\ifsuftesi@authortitle
\newif\ifsuftesi@periodical
\newif\ifsuftesi@periodicalaureo
\newif\ifsuftesi@compact
\newif\ifsuftesi@compactaureo
\newif\ifsuftesi@supercompact
\newif\ifsuftesi@supercompactaureo
\newif\ifsuftesi@sufelements
\newif\ifsuftesi@nocrop
\newif\ifsuftesi@dottedtoc
\newif\ifsuftesi@raggedtoc
\newif\ifsuftesi@numparpart
\newif\ifsuftesi@numparchap
\newif\ifsuftesi@numparsec
\newif\ifsuftesi@numparsubsec
\newif\ifsuftesi@numparsubsubsec
\newif\ifsuftesi@smallcapspart
\newif\ifsuftesi@smallcapschap
\newif\ifsuftesi@smallcapssec
\newif\ifsuftesi@elementschap
\newif\ifsuftesi@elementsheader
\newif\ifsuftesi@elementsstructure
\newif\ifsuftesi@elementspagelayout
\newif\ifsuftesi@draftdate
\newif\ifsuftesi@fewfootnotes
\newif\ifsuftesi@partpage
\newif\ifsuftesi@FSPL
\newif\ifsuftesi@screen
\newif\ifsuftesi@pagelefttoc
\newif\ifsuftesi@twocolumntoc
\newif\ifsuftesi@twocolumnlof
\newif\ifsuftesi@twocolumnlot
\newif\ifsuftesi@reverseauthortitle
\newif\ifsuftesi@collection
\DeclareOption{a5paper}{%
  \ClassError{suftesi}{Option 'a5paper' not available}}
\DeclareOption{b5paper}{%
  \ClassError{suftesi}{Option 'b5paper' not available}}
\DeclareOption{legalpaper}{%
  \ClassError{suftesi}{Option 'legalpaper' not available}}
\DeclareOption{executivepaper}{%
  \ClassError{suftesi}{Option 'executivepaper' not available}}
\DeclareOption{landscape}{%
  \ClassError{suftesi}{Option 'landscape' not available}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\relax
\LoadClass{book}
\define@choicekey{}{documentstructure}[\val\nr]
    {book,article,collection}[book]{%
\ifcase\nr\relax
\disable@keys{}{secnumstyle}
\or
\suftesi@articletrue
\@titlepagefalse
\or
\suftesi@collectiontrue
  \setkeys{}{headerstyle=authortitleinner}
\fi}
\RequirePackage{geometry}
\define@choicekey{}{pagelayout}[\val\nr]
    {standard,standardaureo,periodical,compact,compactaureo,supercompact,
    supercompactaureo,elements,periodicalaureo}[standard]{%
\ifcase\nr\relax
  \DeclareRobustCommand{\SUF@chaptersize}{\Large}
  \geometry{%
    heightrounded,
    a4paper,
    includeheadfoot=true,
    textwidth=      110mm,
    textheight=     220mm,
    marginratio=    1:2,
    marginparwidth= 30mm,
    marginparsep=   12pt}
\or
  \DeclareRobustCommand{\SUF@chaptersize}{\Large}
  \geometry{%
    heightrounded,
    a4paper,
    includeheadfoot=true,
    textwidth=      136mm,
    textheight=     220mm,
    marginratio=    2:3,
    marginparwidth= 30mm,
    marginparsep=   12pt}
\or
\suftesi@periodicaltrue
  \DeclareRobustCommand{\SUF@chaptersize}{\large}
  \geometry{
    heightrounded,
    includeheadfoot=false,
    textheight=     165mm,
    textwidth=      110mm,
    paperwidth=     170mm,
    paperheight=    240mm,
    marginratio=    2:3,
    marginparwidth= 26mm,
    marginparsep=   10pt}
\or
\suftesi@compacttrue
  \DeclareRobustCommand{\SUF@chaptersize}{\large}
  \geometry{
    heightrounded,
    includeheadfoot=false,
    textheight=     165mm,
    textwidth=      110mm,
    paperwidth=     160mm,
    paperheight=    240mm,
    marginratio=    2:3,
    marginparwidth= 22mm,
    marginparsep=   9pt}
\or
\suftesi@compactaureotrue
  \DeclareRobustCommand{\SUF@chaptersize}{\large}
  \geometry{
    heightrounded,
    includeheadfoot=false,
    textheight=     191mm,
    textwidth=      118mm,
    paperwidth=     160mm,
    paperheight=    240mm,
    marginratio=    2:3,
    marginparwidth= 19mm,
    marginparsep=   9pt}
\or
\suftesi@supercompacttrue
  \DeclareRobustCommand{\SUF@chaptersize}{\large}
  \geometry{
    heightrounded,
    includeheadfoot=false,
    textheight=     150mm,
    textwidth=      100mm,
    paperwidth=     140mm,
    paperheight=    210mm,
    marginratio=    2:3,
    marginparwidth= 18mm,
    marginparsep=   8pt}
\or
\suftesi@supercompactaureotrue
  \DeclareRobustCommand{\SUF@chaptersize}{\large}
  \geometry{
    heightrounded,
    includeheadfoot=false,
    textheight=     175mm,
    textwidth=      108mm,
    paperwidth=     140mm,
    paperheight=    210mm,
    marginratio=    1:1,
    marginparwidth= 11mm,
    marginparsep=   7pt}\or
\suftesi@elementspagelayouttrue
  \geometry{%
    heightrounded,
    includeheadfoot=false,
    textwidth=      251pt,
    textheight=     502pt,
    paperwidth=     374pt,
    paperheight=    648pt,
    vmarginratio=   1:2,
    marginparwidth= 60pt,
    marginparsep=   18pt,
    outer=          90pt}
\or
\suftesi@periodicalaureotrue
  \DeclareRobustCommand{\SUF@chaptersize}{\large}
  \geometry{%
    heightrounded,
    includeheadfoot=true,
    textwidth=      120mm,
    textheight=     194mm,
    paperwidth=     17cm,
    paperheight=    24cm,
    marginratio=    2:3,
    marginparwidth= 62pt,
    marginparsep=   10pt}
\or
\fi}
\define@choicekey{}{partstyle}[\val\nr]{%
    left,center,right,parleft,parcenter,parright}[left]{%
\ifcase\nr\relax
  \def\SUF@lr@PARTSwitch{\filright}
\or
  \def\SUF@lr@PARTSwitch{\filcenter}
\or
  \def\SUF@lr@PARTSwitch{\filleft}
\or%numpar
  \def\SUF@lr@PARTSwitch{\filright}
  \suftesi@numparparttrue
\or
  \def\SUF@lr@PARTSwitch{\filcenter}
  \suftesi@numparparttrue
\or
  \def\SUF@lr@PARTSwitch{\filleft}
  \suftesi@numparparttrue
\fi}
\define@choicekey{}{chapstyle}[\val\nr]{%
    left,center,right,parleft,parcenter,parright,elements}[left]{%
\ifcase\nr\relax
  \def\SUF@lr@CHAPSwitch{\filright}
\or
  \def\SUF@lr@CHAPSwitch{\filcenter}
\or
  \def\SUF@lr@CHAPSwitch{\filleft}
\or%numparchap
  \def\SUF@lr@CHAPSwitch{\filright}
  \suftesi@numparchaptrue
\or
  \def\SUF@lr@CHAPSwitch{\filcenter}
  \suftesi@numparchaptrue
\or
  \def\SUF@lr@CHAPSwitch{\filleft}
  \suftesi@numparchaptrue
\or
  \suftesi@elementschaptrue
\fi}
\define@choicekey{}{secstyle}[\val\nr]{%
    left,center,right,parleft,parcenter,parright}[left]{%
\ifcase\nr\relax
  \def\SUF@lr@SECSwitch{\filright}
\or
  \def\SUF@lr@SECSwitch{\filcenter}
\or
  \def\SUF@lr@SECSwitch{\filleft}
\or%numparsec
  \def\SUF@lr@SECSwitch{\filright}
  \suftesi@numparsectrue
\or
  \def\SUF@lr@SECSwitch{\filcenter}
  \suftesi@numparsectrue
\or
  \def\SUF@lr@SECSwitch{\filleft}
  \suftesi@numparsectrue
\fi}
\define@choicekey{}{subsecstyle}[\val\nr]{left,center,right}[left]{%
\ifcase\nr\relax
  \def\SUF@lr@SUBSECSwitch{\filright}
\or
  \def\SUF@lr@SUBSECSwitch{\filcenter}
\or
  \def\SUF@lr@SUBSECSwitch{\filleft}
\fi}
\define@choicekey{}{subsubsecstyle}[\val\nr]{left,center,right}[left]{%
\ifcase\nr\relax
  \def\SUF@lr@SUBSUBSECSwitch{\filright}
\or
  \def\SUF@lr@SUBSUBSECSwitch{\filcenter}
\or
  \def\SUF@lr@SUBSUBSECSwitch{\filleft}
\fi}
\define@choicekey{}{partfont}[\val\nr]{roman,italic,smallcaps}[roman]{%
\ifcase\nr\relax
\def\SUF@PART@StyleSwitch{\relax}
\or
\def\SUF@PART@StyleSwitch{\itshape}
\or
\def\SUF@PART@StyleSwitch{\expandafter\SUF@titlesmallcaps}
\fi}
\define@choicekey{}{chapfont}[\val\nr]{roman,italic,smallcaps}[roman]{%
\ifcase\nr\relax
\def\SUF@CHAP@StyleSwitch{\relax}
\or
\def\SUF@CHAP@StyleSwitch{\itshape}
\or
\def\SUF@CHAP@StyleSwitch{\expandafter\SUF@titlesmallcaps}
\fi}
\define@choicekey{}{secfont}[\val\nr]{roman,italic,smallcaps}[italic]{%
\ifcase\nr\relax
\def\SUF@SEC@StyleSwitch{\relax}
\or
\def\SUF@SEC@StyleSwitch{\itshape}
\or
\def\SUF@SEC@StyleSwitch{\expandafter\SUF@titlesmallcaps}
\fi}
\define@choicekey{}{subsecfont}[\val\nr]{roman,italic,smallcaps}[roman]{%
\ifcase\nr\relax
\def\SUF@SUBSEC@StyleSwitch{\relax}
\or
\def\SUF@SUBSEC@StyleSwitch{\itshape}
\or
\def\SUF@SUBSEC@StyleSwitch{\expandafter\SUF@titlesmallcaps}
\fi}
\define@choicekey{}{subsubsecfont}[\val\nr]{roman,italic,smallcaps}[roman]{%
\ifcase\nr\relax
\def\SUF@SUBSUBSEC@StyleSwitch{\relax}
\or
\def\SUF@SUBSUBSEC@StyleSwitch{\itshape}
\or
\def\SUF@SUBSUBSEC@StyleSwitch{\expandafter\SUF@titlesmallcaps}
\fi}
\define@choicekey{}{partnumstyle}[\val\nr]
    {arabic,roman,Roman,dotarabic,dotroman,dotRoman}[arabic]{%
\ifcase\nr\relax
  \def\SUF@thepart{\arabic{part}}
  \def\SUF@dotpart{}
  \def\SUF@toclabelnum{}
\or
  \def\SUF@thepart{\textsc{\roman{part}}}
  \def\SUF@dotpart{}
  \def\SUF@toclabelnum{\scshape\@roman}
\or
  \def\SUF@thepart{\Roman{part}}
  \def\SUF@dotpart{}
  \def\SUF@toclabelnum{\@Roman}
\or
  \def\SUF@thepart{\arabic{part}}
  \def\SUF@dotpart{.}
  \def\SUF@toclabelnum{}
\or
  \def\SUF@thepart{\textsc{\roman{part}}}
  \def\SUF@dotpart{.}
  \def\SUF@toclabelnum{\scshape\@roman}
\or
  \def\SUF@thepart{\Roman{part}}
  \def\SUF@dotpart{.}
  \def\SUF@toclabelnum{\@Roman}
\fi}
\define@choicekey{}{chapnumstyle}[\val\nr]{arabic,roman,Roman,
dotarabic,dotroman,dotRoman}[arabic]{%
\ifcase\nr\relax
  \def\SUF@thechapter{\arabic{chapter}}
  \def\SUF@dotchap{}
  \def\SUF@toclabelnum{}
\or
  \def\SUF@thechapter{\textsc{\roman{chapter}}}
  \def\SUF@dotchap{}
  \def\SUF@toclabelnum{\scshape\@roman}
\or
  \def\SUF@thechapter{\Roman{chapter}}
  \def\SUF@dotchap{}
  \def\SUF@toclabelnum{\@Roman}
\or
  \def\SUF@thechapter{\arabic{chapter}}
  \def\SUF@dotchap{.}
  \def\SUF@toclabelnum{}
\or
  \def\SUF@thechapter{\textsc{\roman{chapter}}}
  \def\SUF@dotchap{.}
  \def\SUF@toclabelnum{\scshape\@roman}
\or
  \def\SUF@thechapter{\Roman{chapter}}
  \def\SUF@dotchap{.}
  \def\SUF@toclabelnum{\@Roman}
\fi}
\define@choicekey{}{secnumstyle}[\val\nr]
    {arabic,roman,Roman,dotarabic,dotroman,dotRoman}[arabic]{%
\ifcase\nr\relax
  \def\SUF@thesection{\arabic{section}}
  \def\SUF@dotsec{}
  \def\SUF@toclabelnum{}
\or
  \def\SUF@thesection{\textsc{\roman{section}}}
  \def\SUF@dotsec{}
  \def\SUF@toclabelnum{\scshape\@roman}
\or
  \def\SUF@thesection{\Roman{section}}
  \def\SUF@dotsec{}
  \def\SUF@toclabelnum{\@Roman}
\or
  \def\SUF@thesection{\arabic{section}}
  \def\SUF@dotsec{.}
  \def\SUF@toclabelnum{}
\or
  \def\SUF@thesection{\textsc{\roman{section}}}
  \def\SUF@dotsec{.}
  \def\SUF@toclabelnum{\scshape\@roman}
\or
  \def\SUF@thesection{\Roman{section}}
  \def\SUF@dotsec{.}
  \def\SUF@toclabelnum{\@Roman}
\fi}
\define@choicekey{}{smallcapsstyle}[\val\nr]
    {low,upper}[low]{%
\ifcase\nr\relax
  \def\suftesi@MakeTextLowercase{\MakeTextLowercase}
\or
  \def\suftesi@MakeTextLowercase{\relax}
\fi}
\define@choicekey{}{headerstyle}[\val\nr]
    {inner,center,plain,authortitleinner,
     authortitlecenter,elements}[inner]{%
\ifcase\nr\relax
  \def\SUF@rightmark{\SUF@Rheadstyle{\rightmark}}
  \def\SUF@leftmark{\SUF@Lheadstyle{\SUF@leftrightmark}}
\or
  \suftesi@centerheadertrue
  \def\SUF@rightmark{\SUF@Rheadstyle{\rightmark}}
  \def\SUF@leftmark{\SUF@Lheadstyle{\SUF@leftrightmark}}
\or
  \suftesi@sufplaintrue
\or
  \suftesi@authortitletrue
  \def\SUF@rightmark{\let\thanks\@gobble\SUF@Rheadstyle{\@headtitle}}
  \def\SUF@leftmark{\let\thanks\@gobble\SUF@Lheadstyle{\@author}}
\or
  \suftesi@authortitletrue
  \def\SUF@rightmark{\let\thanks\@gobble\SUF@Rheadstyle{\@headtitle}}
  \def\SUF@leftmark{\let\thanks\@gobble\SUF@Lheadstyle{\@author}}
  \suftesi@centerheadertrue
\or
  \suftesi@elementsheadertrue
\fi}
\define@choicekey{}{headerfont}[\val\nr]
    {roman,italic,smallcaps}[roman]{%
\ifcase\nr\relax
  \def\SUF@Rheadstyle{}
  \def\SUF@Lheadstyle{}
  \def\SUF@thepage{\thepage}
\or
  \def\SUF@Rheadstyle{\itshape}
  \def\SUF@Lheadstyle{\itshape}
  \def\SUF@thepage{\thepage}
\or
  \def\SUF@Rheadstyle{\SUF@headingsmallcaps}
  \def\SUF@Lheadstyle{\SUF@headingsmallcaps}
  \def\SUF@thepage{\SUF@headingsmallcaps{\thepage}}
\fi}
\RequirePackage[inline]{enumitem}
\renewcommand\labelitemi{\color{sufgray}\textbullet}
\setlist{itemsep=.5ex,parsep=0pt,listparindent=\parindent}
\setlist[description]{font=\normalfont\itshape}
\define@choicekey{}{liststyle}[\val\nr]
    {bulged,aligned,indented}[bulged]{%
\ifcase\nr\relax
    \setlist[enumerate,1]{leftmargin=0pt,label=\arabic*.}
    \setlist[enumerate,2]{leftmargin= 1.3\parindent,label=\alph*.}
    \setlist[enumerate,3]{leftmargin= 1.3\parindent,label=\roman*.}
    \setlist[itemize,1]{leftmargin=0pt}
    \setlist[itemize,2]{leftmargin=1.3\parindent}
    \setlist[itemize,3]{leftmargin=1.3\parindent}
\or
    \setlist[enumerate,1]{leftmargin=1\parindent,label=\arabic*.}
    \setlist[enumerate,2]{leftmargin= 1.5\parindent,label=\alph*.}
    \setlist[enumerate,3]{leftmargin= 1.5\parindent,label=\roman*.}
    \setlist[itemize,1]{leftmargin=1\parindent}
    \setlist[itemize,2]{leftmargin=1.5\parindent}
    \setlist[itemize,3]{leftmargin=1.5\parindent}
\or
    \setlist[enumerate,1]{leftmargin=2\parindent,label=\arabic*.}
    \setlist[enumerate,2]{leftmargin= 2.5\parindent,label=\alph*.}
    \setlist[enumerate,3]{leftmargin= 2.5\parindent,label=\roman*.}
    \setlist[itemize,1]{leftmargin=2\parindent}
    \setlist[itemize,2]{leftmargin=2.5\parindent}
    \setlist[itemize,3]{leftmargin=2.5\parindent}
\fi}
\define@choicekey{}{quotestyle}[\val\nr]
    {center,right}[center]{%
\ifcase\nr\relax
\def\SUF@quote@style{\rightmargin=\parindent}
\or
\def\SUF@quote@style{}
\fi}
\define@choicekey{}{quotesize}[\val\nr]
    {footnotesize,small}[footnotesize]{%
\ifcase\nr\relax
\def\SUF@quotation@size{\footnotesize}
\or
\def\SUF@quotation@size{\small}
\fi}
\define@choicekey{}{footnotestyle}[\val\nr]
    {bulged,hung,dotted,superscript}[bulged]{%
\ifcase\nr\relax
    \renewcommand\@makefntext{%
      \hskip-2.5em\makebox[2em][r]{\@thefnmark}\hskip.5em}
\or
    \renewcommand\@makefntext{%
      \leftskip=1em\hskip-1.5em%
        \makebox[1em][r]{\@thefnmark}\hskip.5em}
\or
    \renewcommand\@makefntext{%
         \@thefnmark.\hskip.5em}
\or
  \renewcommand\@makefntext{%
    \textsuperscript{\@thefnmark}\hskip.3em}
\fi}
\define@choicekey{}{fewfootnotes}[\val\nr]
    {true,false}[true]{%
\ifcase\nr\relax
  \suftesi@fewfootnotestrue
\or
  \relax
\fi}
\RequirePackage{caption}
\define@choicekey{}{captionstyle}[\val\nr]
    {standard,sanserif,italic,smallcaps,elements}[standard]{%
\ifcase\nr\relax
   \captionsetup{labelsep=period,font=small}
\or
   \captionsetup{labelsep=period,font=small}
   \captionsetup{font+=sf}
\or
   \captionsetup{labelsep=period,font=small}
   \captionsetup{font+=it}
\or
   \captionsetup{labelsep=period,font=small,labelfont=sc}
\or
   \captionsetup{labelsep=period,font=small}
   \captionsetup{font+=sf}
\fi
}
\define@choicekey{}{marginpar}[\val\nr]
    {true,false}[true]{%
\ifcase\nr\relax
\or
  \renewcommand\marginpar[2][]{}
\fi}
\define@choicekey{}{tocstyle}[\val\nr]{%
    standard,dotted,ragged,leftpage}[standard]{%
\ifcase\nr\relax
  \def\SUF@titlerule{\titlerule*{}}
  \def\SUF@chaptitlerule{\titlerule*{}}
\or
\suftesi@dottedtoctrue
  \def\SUF@titlerule{\titlerule*{\footnotesize .\ }}
  \def\SUF@chaptitlerule{\titlerule*{}}
\or
\suftesi@raggedtoctrue
  \def\SUF@titlerule{\hspace{1em}}
  \def\SUF@chaptitlerule{\hspace{1em}}
\or
\suftesi@pagelefttoctrue
\fi}
\define@choicekey{}{twocolcontents}[\val\nr]{%
    toc,lof,lot,toclof,toclot,loflot,all}[all]{%
\ifcase\nr\relax
  \suftesi@twocolumntoctrue
  \setkeys{}{tocstyle=ragged}
\or
  \suftesi@twocolumnloftrue
  \setkeys{}{tocstyle=ragged}
\or
  \suftesi@twocolumnlottrue
  \setkeys{}{tocstyle=ragged}
\or
  \suftesi@twocolumntoctrue
  \suftesi@twocolumnloftrue
  \setkeys{}{tocstyle=ragged}
\or
  \suftesi@twocolumntoctrue
  \suftesi@twocolumnlottrue
  \setkeys{}{tocstyle=ragged}
\or
  \suftesi@twocolumnloftrue
  \suftesi@twocolumnlottrue
  \setkeys{}{tocstyle=ragged}
\or
  \suftesi@twocolumntoctrue
  \suftesi@twocolumnloftrue
  \suftesi@twocolumnlottrue
  \setkeys{}{tocstyle=ragged}
\fi
}
\define@choicekey{}{defaultfont}[\val\nr]{%
    palatino,standard}[palatino]{%
\ifcase\nr\relax
\or
  \suftesi@standardfonttrue
\def\SUF@greekfamily{lmr}
\fi}
\define@choicekey{}{greekfont}[\val\nr]{%
    artemisia,porson,cbgreek}[artemisia]{%
\ifcase\nr\relax
\def\SUF@greekfamily{artemisiaeuler}
\or
\def\SUF@greekfamily{porson}
\suftesi@porsontrue
\or
\def\SUF@greekfamily{lmr}
\fi}
\define@choicekey{}{parindent}[\val\nr]
    {compact,wide}[compact]{%
\ifcase\nr\relax
\setlength\parindent{1em}
\or
\setlength\parindent{1.5em}
\fi}
\define@choicekey{}{partpage}[\val\nr]{true,false}[true]{%
\ifcase\nr\relax
  \suftesi@partpagetrue
\or
  \relax
\fi}
\define@choicekey{}{crop}[\val\nr]
    {true,false}[true]{%
\ifcase\nr\relax
\or
  \suftesi@nocroptrue
  \newcommand*\crop[1][]{}
\fi}
\define@choicekey{}{draftdate}[\val\nr]
    {true,false}[true]{%
\ifcase\nr\relax
  \suftesi@draftdatetrue
\or
\fi}
\define@choicekey{}{version}[\val\nr]
    {screen,draft,final}[draft]{%
\ifcase\nr\relax
  \@twosidefalse
  \suftesi@nocroptrue
  \newcommand*\crop[1][]{}
\or
\or
  \AtBeginDocument{\crop[off]}
\fi}
\define@choicekey{}{titlepage}[\val\nr]
    {true,false}[true]{%
\ifcase\nr\relax
  \@titlepagetrue
\or
  \@titlepagefalse
\fi}
\define@choicekey{}{style}[\val\nr]
  {roman1,roman2,roman3,roman4,roman5,roman6,
  italic1,italic2,italic3,italic4,italic5,italic6,
  italic7,italic8,italic9,italic10,italic11,italic12,
  smallcaps1,smallcaps2,smallcaps3,smallcaps4,smallcaps5,smallcaps6,
  smallcaps7,smallcaps8,smallcaps9,smallcaps10,smallcaps11,smallcaps12,
  elements,sufelements,FSPLa,FSPLb,FSPLc}
  [roman1]{%
\ifcase\nr\relax
  \setkeys{}{chapstyle=left}
\or
  \setkeys{}{chapstyle=center}
\or
  \setkeys{}{chapstyle=right}
\or
  \setkeys{}{chapstyle=parleft}
\or
  \setkeys{}{chapstyle=parcenter}
\or
  \setkeys{}{chapstyle=parright}
\or
  \setkeys{}{
  chapstyle=left,
  chapfont=italic,
  headerfont=italic}
\or
  \setkeys{}{
  chapstyle=center,
  chapfont=italic,
  headerfont=italic}
\or
  \setkeys{}{
  chapstyle=right,
  chapfont=italic,
  headerfont=italic}
\or
  \setkeys{}{
  chapstyle=parleft,
  chapfont=italic,
  headerfont=italic}
\or
  \setkeys{}{
  chapstyle=parcenter,
  chapfont=italic,
  headerfont=italic}
\or
  \setkeys{}{
  chapstyle=parright,
  chapfont=italic,
  headerfont=italic}
\or
  \setkeys{}{
  chapstyle=left,
  chapfont=italic,
  secfont=smallcaps,
  headerfont=italic}
\or
  \setkeys{}{
  chapstyle=center,
  chapfont=italic,
  secfont=smallcaps,
  headerfont=italic}
\or
  \setkeys{}{
    chapstyle=right,
    chapfont=italic,
    secfont=smallcaps,
    headerfont=italic}
\or
  \setkeys{}{
   chapstyle=parleft,
   chapfont=italic,
   secfont=smallcaps,
   headerfont=italic}
\or
  \setkeys{}{
    chapstyle=parcenter,
    chapfont=italic,
    secfont=smallcaps,
    headerfont=italic}
\or
  \setkeys{}{
    chapstyle=parright,
    chapfont=italic,
    secfont=smallcaps,
    headerfont=italic}
\or
  \setkeys{}{
  chapstyle=left,
  chapfont=smallcaps,
  headerfont=smallcaps}
\or
  \setkeys{}{
  chapstyle=center,
  chapfont=smallcaps,
  headerfont=smallcaps}
\or
  \setkeys{}{
  chapstyle=right,
  chapfont=smallcaps,
  headerfont=smallcaps}
\or
  \setkeys{}{
  chapstyle=parleft,
  chapfont=smallcaps,
  headerfont=smallcaps}
\or
  \setkeys{}{
  chapstyle=parcenter,
  chapfont=smallcaps,
  headerfont=smallcaps}
\or
  \setkeys{}{
  chapstyle=parright,
  chapfont=smallcaps,
  headerfont=smallcaps}
\or
  \setkeys{}{
  chapstyle=left,
  chapfont=smallcaps,
  secfont=smallcaps,
  headerfont=smallcaps}
\or
  \setkeys{}{
  chapstyle=center,
  chapfont=smallcaps,
  secfont=smallcaps,
  headerfont=smallcaps}
\or
  \setkeys{}{
  chapstyle=right,
  chapfont=smallcaps,
  secfont=smallcaps,
  headerfont=smallcaps}
\or
  \setkeys{}{
  chapstyle=parleft,
  chapfont=smallcaps,
  secfont=smallcaps,
  headerfont=smallcaps}
\or
  \setkeys{}{
  chapstyle=parcenter,
  chapfont=smallcaps,
  secfont=smallcaps,
  headerfont=smallcaps}
\or
  \setkeys{}{
  chapstyle=parright,
  chapfont=smallcaps,
  secfont=smallcaps,
  headerfont=smallcaps}
\or
  \setkeys{}{
    pagelayout=elements,
    headerstyle=elements,
    chapstyle=elements,
    secfont=smallcaps,
    subsecfont=italic,
    captionstyle=elements}
\disable@keys{}
    {pagelayout,headerstyle,chapstyle,secfont,subsecfont,captionstyle}
\or
  \setkeys{}{
    chapstyle=elements,
    headerfont=smallcaps,
    secfont=smallcaps,
    subsecfont=italic}
\disable@keys{}
    {headerstyle,chapstyle,secfont,subsecfont}
\or
\suftesi@periodicalaureotrue
\suftesi@FSPLtrue
  \setkeys{}{%
    pagelayout=periodicalaureo,
    style=roman5,
    chapnumstyle=roman,
    headerstyle=inner,
    footnotestyle=hung,
    liststyle=indented,
    tocstyle=leftpage}
\disable@keys{}
{documentstructure,pagelayout,partfont,chapfont,secfont,%
subsecfont,subsubsecfont,partstyle,chapstyle,secstyle,%
subsecstyle,subsubsecstyle,partnumstyle,chapnumstyle,%
secnumstyle,tocstyle,headerstyle,headerfont,quotestyle,%
quotesize,footnotestyle,liststyle,captionstyle,parindent}
\or
\suftesi@periodicalaureotrue
\suftesi@FSPLtrue
  \setkeys{}{%
    pagelayout=periodicalaureo,
    style=italic5,
    chapnumstyle=roman,
    headerstyle=inner,
    headerfont=italic,
    footnotestyle=hung,
    liststyle=indented,
    tocstyle=leftpage}
\disable@keys{}
{documentstructure,pagelayout,partfont,chapfont,secfont,%
subsecfont,subsubsecfont,partstyle,chapstyle,secstyle,%
subsecstyle,subsubsecstyle,partnumstyle,chapnumstyle,%
secnumstyle,tocstyle,headerstyle,headerfont,quotestyle,%
quotesize,footnotestyle,liststyle,captionstyle,parindent}
\or
\suftesi@periodicalaureotrue
\suftesi@FSPLtrue
  \setkeys{}{%
    pagelayout=periodicalaureo,
    style=smallcaps5,
    chapnumstyle=roman,
    headerstyle=inner,
    headerfont=smallcaps,
    secfont=smallcaps,
    footnotestyle=hung,
    liststyle=indented,
    tocstyle=leftpage}
\disable@keys{}
{documentstructure,pagelayout,partfont,chapfont,secfont,%
subsecfont,subsubsecfont,partstyle,chapstyle,secstyle,%
subsecstyle,subsubsecstyle,partnumstyle,chapnumstyle,%
secnumstyle,tocstyle,headerstyle,headerfont,quotestyle,%
quotesize,footnotestyle,liststyle,captionstyle,parindent}
\fi}
\define@choicekey{}{papertitlestyle}[\val\nr]{%
    left,center,right}[left]{%
\ifcase\nr\relax
  \def\SUF@lr@coll@titleSwitch{\filright}
\or
  \def\SUF@lr@coll@titleSwitch{\filcenter}
\or
  \def\SUF@lr@coll@titleSwitch{\filleft}
\fi}
\define@choicekey{}{revauthortitle}[\val\nr]
    {true,false}[false]{%
\ifcase\nr\relax
\suftesi@reverseauthortitletrue
\or\relax
\fi}
\define@choicekey{}{titlefont}[\val\nr]{roman,italic,smallcaps}[roman]{%
\ifcase\nr\relax
\def\SUF@titlefont@Switch{\relax}
\or
\def\SUF@titlefont@Switch{\itshape}
\or
\def\SUF@titlefont@Switch{\expandafter\SUF@titlesmallcaps}
\fi}

\define@choicekey{}{authorfont}[\val\nr]{roman,italic,smallcaps}[roman]{%
\ifcase\nr\relax
\def\SUF@authorfont@Switch{\relax}
\or
\def\SUF@authorfont@Switch{\itshape}
\or
\def\SUF@authorfont@Switch{\expandafter\SUF@titlesmallcaps}
\fi}
\ExecuteOptionsX<>{
  captionstyle=standard,
  marginpar=true,
  parindent=compact,
  tocstyle=standard,
  greekfont=artemisia,
  pagelayout=standard,
  headerstyle=inner,
  liststyle=bulged,
  footnotestyle=bulged,
  quotesize=footnotesize,
  quotestyle=center,
  partstyle=left,
  chapstyle=left,
  secstyle=left,
  subsecstyle=left,
  subsubsecstyle=left,
  partfont=roman,
  chapfont=roman,
  secfont=italic,
  subsecfont=roman,
  subsubsecfont=roman,
  headerfont=roman,
  secnumstyle=arabic,
  partnumstyle=Roman,
  chapnumstyle=arabic,
  smallcapsstyle=low,
  titlefont=italic,
  authorfont=roman,
  revauthortitle=false,
  papertitlestyle=left,
  authorfont=roman,
  titlefont=italic}
\ProcessOptionsX<>\relax
\XKV@useoption{a4paper}   \XKV@useoption{10pt}
\XKV@useoption{11pt}      \XKV@useoption{12pt}
\XKV@useoption{oneside}   \XKV@useoption{twoside}
\XKV@useoption{onecolumn} \XKV@useoption{twocolumn}
\XKV@useoption{titlepage} \XKV@useoption{notitlepage}
\XKV@useoption{openright} \XKV@useoption{openany}
\XKV@useoption{leqno}     \XKV@useoption{fleqn}
\XKV@useoption{a5paper}   \XKV@useoption{b5paper}
\XKV@useoption{legalpaper}\XKV@useoption{executivepaper}
\XKV@useoption{landscape}
\def\XKV@classoptionslist{}
\RequirePackage{color}
    \definecolor{sufred}{rgb}{0.5,0,0}
    \definecolor{sufgray}{rgb}{0.5,0.5,0.5}
\RequirePackage{multicol}
\RequirePackage{emptypage}
\RequirePackage{textcase}
\RequirePackage{ifxetex}
\RequirePackage{ifluatex}
\RequirePackage{ifthen}
\RequirePackage{microtype}
\newcommand{\versionstring}[1]{\def\version@string{#1}}
\versionstring{Version of}
\ifsuftesi@FSPL
  \RequirePackage{cclicenses}
 \else
\fi
\ifthenelse{\boolean{xetex}\or\boolean{luatex}}
{% if xetex or luatex
\AtBeginDocument{%
\@ifpackageloaded{fontspec}
  {\relax}
  {\ClassError{suftesi}
    {***********************************\MessageBreak
    * For using suftesi with XeLaTeX\MessageBreak
    * load either 'fontspec' or 'mathspec'\MessageBreak
    * For using suftesi with LuaLaTeX\MessageBreak
    * load 'fontspec' \MessageBreak
    ************************************}
    {***********************************\MessageBreak
    * For using suftesi with XeLaTeX\MessageBreak
    * load either 'fontspec' or 'mathspec'\MessageBreak
    * For using suftesi with LuaLaTeX\MessageBreak
    * load 'fontspec' \MessageBreak
    ************************************}}
  }
  }
{% if pdftex
\RequirePackage[LGR,T1]{fontenc}
\RequirePackage{substitutefont}
\AtBeginDocument{\fontencoding{T1}\selectfont}
\ifsuftesi@standardfont
     \RequirePackage{lmodern}
  \relax
   \else
     \RequirePackage[osf,sc]{mathpazo}
     \RequirePackage[scaled=0.8]{beramono}
       \renewcommand{\sfdefault}{iwona}
\AtBeginDocument{
\substitutefont{LGR}{\rmdefault}{\SUF@greekfamily}
  \DeclareRobustCommand{\greektext}{%
     \usefont{LGR}{\SUF@greekfamily}{\f@series}{\f@shape}
     \def\encodingdefault{LGR}}
  \DeclareTextFontCommand{\textgreek}{\greektext}
    }
 \DeclareFontFamily{LGR}{pplj}{}
 \DeclareFontShape{LGR}{pplj}{m}{n}{<->ssub * lmr/m/n}{}
 \DeclareFontShape{LGR}{pplj}{m}{it}{<->ssub * lmr/m/it}{}
 \DeclareFontShape{LGR}{pplj}{m}{sl}{<->ssub * lmr/m/sl}{}
 \DeclareFontShape{LGR}{pplj}{m}{sc}{<->ssub * lmr/m/sc}{}
 \DeclareFontShape{LGR}{pplj}{b}{n}{<->ssub * lmr/bx/n}{}
 \DeclareFontShape{LGR}{pplj}{b}{it}{<->ssub * lmr/bx/it}{}
 \DeclareFontShape{LGR}{pplj}{b}{sl}{<->ssub * lmr/bx/sl}{}
 \DeclareFontShape{LGR}{pplj}{b}{sc}{<->ssub * lmr/bx/sc}{}
 \DeclareFontShape{LGR}{pplj}{bx}{n}{<->ssub * lmr/bx/n}{}
 \DeclareFontShape{LGR}{pplj}{bx}{it}{<->ssub * lmr/bx/it}{}
 \DeclareFontShape{LGR}{pplj}{bx}{sl}{<->ssub * lmr/bx/sl}{}
 \DeclareFontShape{LGR}{pplj}{bx}{sc}{<->ssub * lmr/bx/sc}{}
 \DeclareFontShape{LGR}{pplj}{m}{li}{<->ssub * lmr/m/li}{}
 \DeclareFontShape{LGR}{pplj}{b}{li}{<->ssub * lmr/b/li}{}
 \DeclareFontShape{LGR}{pplj}{bx}{li}{<->ssub * lmr/bx/li}{}
 \DeclareFontShape{LGR}{pplj}{m}{ui}{<->ssub * lmr/m/ui}{}
 \DeclareFontShape{LGR}{pplj}{b}{ui}{<->ssub * lmr/m/ui}{}
 \DeclareFontShape{LGR}{pplj}{bx}{ui}{<->ssub * lmr/bx/ui}{}
 \DeclareFontShape{LGR}{pplj}{m}{rs}{<->ssub * lmr/m/rs}{}
 \DeclareFontShape{LGR}{pplj}{b}{rs}{<->ssub * lmr/m/rs}{}
 \DeclareFontShape{LGR}{pplj}{bx}{rs}{<->ssub * lmr/bx/rs}{}
\fi
\ifsuftesi@porson
\sbox\z@{\fontsize{10}{10}\normalfont A}
\sbox\tw@{\font\temp=gporsonrg6a at 10pt \temp A}
\dimen@=\dimexpr \p@*\ht\z@/\ht\tw@\relax
\sbox\z@{\normalfont\fontsize{10}{10}\selectfont a}
\sbox\tw@{\font\temp=gporsonrg6a at 10pt \temp a}
\dimen2=\dimexpr \p@*\ht\z@/\ht\tw@\relax
\dimen4= 0.6\p@
\dimen@=\dimexpr \dimen@ - \dimen4*\dimen@/\p@+\dimen4*\dimen2/\p@\relax
\edef\art@scale{\strip@pt\dimen@}
\DeclareFontFamily{LGR}{porson}{}
\DeclareFontShape{LGR}{porson}{m}{n}  {<-> s * [\art@scale] gporsonrg6a}{}
\DeclareFontShape{LGR}{porson}{m}{it} {<-> ssub * porson/m/n}{}
\DeclareFontShape{LGR}{porson}{b}{n}  {<-> ssub * porson/m/n}{}
\DeclareFontShape{LGR}{porson}{b}{it} {<-> ssub * porson/m/n}{}
\DeclareFontShape{LGR}{porson}{m}{sl} {<-> ssub * porson/m/n}{}
\DeclareFontShape{LGR}{porson}{b}{sl} {<-> ssub * porson/m/n}{}
\DeclareFontShape{LGR}{porson}{m}{sc} {<-> ssub * porson/m/n}{}
\DeclareFontShape{LGR}{porson}{bx}{n} {<-> ssub * porson/m/n}{}
\DeclareFontShape{LGR}{porson}{bx}{it}{<-> ssub * porson/m/n}{}
\DeclareFontShape{LGR}{porson}{bx}{sl}{<-> ssub * porson/m/n}{}
   \fi
}
\ifsuftesi@nocrop
  \relax
    \else
  \RequirePackage[a4,cam,center]{crop}
\fi
 \if@twoside
   \relax
     \else
   \geometry{hmarginratio=1:1}
\fi
\RequirePackage{titlesec}
    \newlength{\sectionsep}
    \setlength{\sectionsep}{\dimexpr(\baselineskip) plus 1pt minus 1pt}
\ifthenelse{\boolean{xetex}\or\boolean{luatex}}
  {% if xetex or luatex
  \DeclareRobustCommand{\SUF@titlesmallcaps}[1]{%
    \addfontfeature{LetterSpace=6}\scshape\suftesi@MakeTextLowercase{#1}}
  \DeclareRobustCommand{\SUF@headingsmallcaps}[1]{%
    \addfontfeature{LetterSpace=6}\scshape\suftesi@MakeTextLowercase{#1}}
    \newcommand{\chapnumfont}[1]{%
      \def\SUF@chapnumfont{#1}}
      \chapnumfont{\relax}%
  }
  {% if pdftex
  \DeclareRobustCommand{\SUF@titlesmallcaps}[1]{%
    \scshape\suftesi@MakeTextLowercase{\lsstyle #1}}%
  \DeclareRobustCommand{\SUF@headingsmallcaps}[1]{%
    \scshape\suftesi@MakeTextLowercase{\lsstyle #1}}%
  \newcommand{\chapnumfont}[1]{%
    \def\SUF@chapnumfont{\fontfamily{#1}}}
    \chapnumfont{pplj}
  }
\define@key[SUF]{elements}{chapsize}[90]{%
  \def\cmdSUF@elements@chapsize{\fontsize{#1}{#1}\selectfont}}
\define@key[SUF]{elements}{chapposition}[-83]{%
  \def\cmdSUF@elements@chapposition{#1}}
\def\SUF@elements@CHAPTER{%
  \titleformat{\chapter}[block]
     {\Large}%
     {\begin{picture}(0,0)
     \setlength{\unitlength}{1pt}
     \SUF@chapnumfont%
     \cmdSUF@elements@chapsize
      \put(0,\cmdSUF@elements@chapposition){%
       \hskip\dimexpr(\textwidth+0.9\marginparsep)%
        \textcolor{sufgray}{\SUF@thechapter}}%
   \end{picture}}%
  {0pt}
  {\SUF@titlesmallcaps}
  [\vspace*{-6pt}\rule{\textwidth}{.1pt}]
  }
\def\SUF@elements@SECTIONS{
\titleformat{\section}[block]
  {\extramarks{}{}\filright}
  {\textnormal\thesection}
  {1em}
  {\SUF@titlesmallcaps}
\titlespacing*{\section}{0em}{1em}{1em}[0em]
\titleformat{\subsection}[block]
  {\filright\normalsize\itshape}
  {\textnormal\thesubsection}
  {1em}
  {}
  \titlespacing*{\subsection}{0em}{\baselineskip}{\baselineskip}[0em]
\titleformat{\subsubsection}[block]
  {\filright\normalsize}
  {\textnormal\thesubsubsection}
  {1em}
  {}
  \titlespacing*{\subsubsection}{0em}{\baselineskip}{\baselineskip}[0em]
}
\newlength\SUF@ADJnumparchap
\def\SUF@default@CHAPTER{
\ifsuftesi@numparchap
  \titleformat{\chapter}[display]
    {\SUF@chaptersize\SUF@lr@CHAPSwitch}
    {\SUF@thechapter\SUF@dotchap}
    {2ex}
    {\SUF@CHAP@StyleSwitch}
  \else
  \titleformat{\chapter}[hang]
    {\SUF@chaptersize\SUF@lr@CHAPSwitch}
    {\SUF@thechapter\SUF@dotchap}
    {3em}
    {\SUF@CHAP@StyleSwitch}
  \fi
\ifsuftesi@numparchap
  \setlength{\SUF@ADJnumparchap}{-2.5\baselineskip}
    \else
  \setlength{\SUF@ADJnumparchap}{0pt}
\fi}
\def\SUF@default@SECTIONS{
\ifsuftesi@numparsec
\titleformat{\section}[display]
  {\SUF@lr@SECSwitch}
  {\ifsuftesi@article\SUF@thesection
    \else\thesection\fi\SUF@dotsec}
  {0ex}
  {\SUF@SEC@StyleSwitch}
\titlespacing*{\section}{0em}{\sectionsep}{\sectionsep}[0em]
\else
\titleformat{\section}[hang]
  {\SUF@lr@SECSwitch}
  {\ifsuftesi@article\SUF@thesection
    \else\thesection\fi\SUF@dotsec}
  {1em}
  {\SUF@SEC@StyleSwitch}
\titlespacing*{\section}{0ex}{\sectionsep}{\sectionsep}[0ex]
\fi
\ifsuftesi@numparsubsec
\titleformat{\subsection}[display]
  {\SUF@lr@SUBSECSwitch}
  {\textnormal\thesubsection}
  {0ex}
  {\SUF@SUBSEC@StyleSwitch}
\titlespacing*{\subsection}{0em}{\sectionsep}{\sectionsep}[0em]
\else
\titleformat{\subsection}[hang]
  {\SUF@lr@SUBSECSwitch}
  {\textnormal\thesubsection}
  {1em}
  {\SUF@SUBSEC@StyleSwitch}
\titlespacing*{\subsection}{\parindent}{\sectionsep}{\sectionsep}[0ex]
\fi
\ifsuftesi@numparsubsubsec
\titleformat{\subsubsection}[display]
  {\SUF@lr@SUBSUBSECSwitch}
  {\textnormal\thesubsubsection}
  {0ex}
  {\SUF@SUBSUBSEC@StyleSwitch}
\titlespacing*{\subsubsection}{0em}{\sectionsep}{\sectionsep}[0em]
\else
\titleformat{\subsubsection}[hang]
  {\SUF@lr@SUBSUBSECSwitch}
  {\textnormal\thesubsubsection}
  {1em}
  {\SUF@SUBSUBSEC@StyleSwitch}
\titlespacing*{\subsubsection}{\parindent}{\sectionsep}{\sectionsep}[0ex]
  \fi
}
\ifsuftesi@elementschap
\RequirePackage{extramarks}
  \SUF@elements@CHAPTER
  \SUF@elements@SECTIONS
\ifsuftesi@periodical
  \titlespacing*{\chapter}{0em}{-\baselineskip}{10pt}[0pt]
    \setkeys[SUF]{elements}{chapsize=80,chapposition=-83}
\else
\ifsuftesi@periodicalaureo
  \titlespacing*{\chapter}{0em}{-\baselineskip}{10pt}[0pt]
    \setkeys[SUF]{elements}{chapsize=80,chapposition=-83}
\else
\ifsuftesi@compact
  \titlespacing*{\chapter}{0em}{-1\baselineskip}{10pt}[0pt]
    \setkeys[SUF]{elements}{chapsize=75,chapposition=-83}
\else
\ifsuftesi@compactaureo
  \titlespacing*{\chapter}{0em}{-1\baselineskip}{10pt}[0pt]
    \setkeys[SUF]{elements}{chapsize=75,chapposition=-83}
\else
\ifsuftesi@supercompact
  \titlespacing*{\chapter}{0em}{-1\baselineskip}{10pt}[0pt]
    \setkeys[SUF]{elements}{chapsize=70,chapposition=-73}
\else
\ifsuftesi@supercompactaureo
  \titlespacing*{\chapter}{0em}{-1\baselineskip}{10pt}[0pt]
    \setkeys[SUF]{elements}{chapsize=70,chapposition=-73}
\else
\ifsuftesi@elementspagelayout
  \titlespacing*{\chapter}{0em}{-\baselineskip}{10pt}[0pt]
    \setkeys[SUF]{elements}{chapsize=60,chapposition=-73}
\else
  \titlespacing*{\chapter}{0em}{-\baselineskip}{10pt}[0pt]
    \setkeys[SUF]{elements}{chapsize=90,chapposition=-83}
            \fi
          \fi
        \fi
      \fi
    \fi
  \fi
\fi
\else
  \SUF@default@CHAPTER
  \SUF@default@SECTIONS
\ifsuftesi@periodicalaureo
  \titlespacing*{\chapter}{0em}{0\SUF@ADJnumparchap}{18ex}
  \titlespacing*{name=\chapter,numberless}{0em}{0pt}{18ex}
\else
\ifsuftesi@periodical
  \titlespacing*{\chapter}{0em}{\SUF@ADJnumparchap}{18ex}
  \titlespacing*{name=\chapter,numberless}{0em}{0pt}{18ex}
    \else
      \ifsuftesi@compact
        \titlespacing*{\chapter}{0em}{\SUF@ADJnumparchap}{18ex}
        \titlespacing*{name=\chapter,numberless}{0em}{0pt}{18ex}
         \else
           \ifsuftesi@supercompact
            \titlespacing*{\chapter}{0em}{\SUF@ADJnumparchap}{18ex}
            \titlespacing*{name=\chapter,numberless}{0em}{0pt}{18ex}
          \else
        \titlespacing*{\chapter}{0em}{%
     \dimexpr(6ex+\SUF@ADJnumparchap)}{18ex}
        \titlespacing*{name=\chapter,numberless}{0em}{6ex}{18ex}
        \fi
      \fi
    \fi
  \fi
\fi
\ifsuftesi@article
\def\chapter#1{\ClassError{suftesi}
  {\noexpand\chapter level is undefined
     using 'documentstructure=article'}
  {\noexpand\chapter level is undefined
     using 'documentstructure=article'}}
  \setcounter{tocdepth}{3}
    \setcounter{secnumdepth}{3}
    \renewcommand\thesection{%
          \@arabic\c@section}
  \renewcommand\thesubsection{%
          \thesection.\@arabic\c@subsection}
  \renewcommand\thesubsubsection{%
          \thesubsection.\@arabic\c@subsubsection}
  \renewcommand\theparagraph{%
          \thesubsubsection.\@arabic\c@paragraph}
  \renewcommand\thesubparagraph{%
          \theparagraph.\@arabic\c@subparagraph}
\ifsuftesi@partpage
  \relax
    \else
  \titleclass{\part}{straight}
  \titlespacing*{\part}{0ex}{2\sectionsep}{2\sectionsep}[0ex]
\fi
\ifsuftesi@numparpart
\titleformat{\part}[display]
  {\SUF@chaptersize\SUF@lr@PARTSwitch}
  {\SUF@PART@StyleSwitch\partname\hskip.5em\SUF@thepart\SUF@dotpart}
  {2ex}
  {\SUF@PART@StyleSwitch}
\else
\titleformat{\part}[hang]
  {\SUF@chaptersize\SUF@lr@PARTSwitch}
  {\SUF@PART@StyleSwitch\partname\hskip.5em\SUF@thepart\SUF@dotpart}
  {1em}
  {\SUF@PART@StyleSwitch}
\fi
\else
\ifsuftesi@numparpart
\titleformat{\part}[display]
  {\SUF@chaptersize\SUF@lr@PARTSwitch}
  {\SUF@PART@StyleSwitch\partname\hskip.5em\SUF@thepart\SUF@dotpart}
  {2ex}
  {\SUF@PART@StyleSwitch}
\else
\titleformat{\part}[hang]
  {\SUF@chaptersize\SUF@lr@PARTSwitch}
  {\SUF@PART@StyleSwitch\partname\hskip.5em\SUF@thepart\SUF@dotpart}
  {1em}
  {\SUF@PART@StyleSwitch}
\fi
\fi

\titleformat{\paragraph}[runin]
  {}
  {\theparagraph}
  {.5em}
  {\itshape}
  [{.}\hspace*{1em}]
\titlespacing*{\paragraph}{\parindent}{.5\sectionsep}{.5\sectionsep}
\titleformat{\subparagraph}[runin]
  {}
  {\thesubparagraph}
  {.5em}
  {}
  [{.}\hspace*{1em}]
\titlespacing*{\subparagraph}{\parindent}{.5\sectionsep}{.5\sectionsep}
\ifsuftesi@article
\AtBeginDocument{%
\@ifpackageloaded{biblatex}{%
  \defbibheading{bibliography}[\refname]{%
    \section*{#1}%
    \markboth{#1}{#1}}
  \defbibheading{shorthands}[\losname]{%
    \section*{#1}%
    \markboth{#1}{#1}}
  \defbibheading{bibintoc}[\refname]{%
    \section*{#1}%
    \addcontentsline{toc}{section}{#1}%
    \markboth{#1}{#1}}
  \defbibheading{losintoc}[\losname]{%
    \section*{#1}%
    \addcontentsline{toc}{section}{#1}%
    \markboth{#1}{#1}}
  \defbibheading{bibnumbered}[\refname]{%
    \section{#1}%
    \if@twoside\markright{#1}\fi}
  \defbibheading{losnumbered}[\losname]{%
    \section{#1}%
    \if@twoside\markright{#1}\fi}
  \defbibheading{subbibliography}[\refname]{%
    \subsection*{#1}}
  \defbibheading{subbibintoc}[\refname]{%
    \subsection*{#1}%
    \addcontentsline{toc}{subsection}{#1}}
  \defbibheading{subbibnumbered}[\refname]{%
    \subsection{#1}}}%
    {\relax}%
}%
\else
\AtBeginDocument{%
\@ifpackageloaded{biblatex}{%
  \defbibheading{bibliography}[\bibname]{%
    \chapter*{#1}%
    \markboth{#1}{#1}}
  \defbibheading{shorthands}[\losname]{%
    \chapter*{#1}%
    \markboth{#1}{#1}}
  \defbibheading{bibintoc}[\bibname]{%
    \chapter*{#1}%
    \addcontentsline{toc}{chapter}{#1}%
    \markboth{#1}{#1}}
  \defbibheading{losintoc}[\losname]{%
    \chapter*{#1}%
    \addcontentsline{toc}{chapter}{#1}%
    \markboth{#1}{#1}}
  \defbibheading{bibnumbered}[\bibname]{%
    \chapter{#1}%
    \if@twoside\markright{#1}\fi}
  \defbibheading{losnumbered}[\losname]{%
    \chapter{#1}%
    \if@twoside\markright{#1}\fi}
  \defbibheading{subbibliography}[\refname]{%
    \section*{#1}%
    \if@twoside\markright{#1}\fi}
  \defbibheading{subbibintoc}[\refname]{%
    \section*{#1}%
    \addcontentsline{toc}{section}{#1}%
    \if@twoside\markright{#1}\fi}
  \defbibheading{subbibnumbered}[\refname]{%
    \section{#1}}}
    {\relax}%
}%
\fi
\renewcommand*{\title}[2][]{\gdef\@headtitle{#1}\gdef\@title{#2}}
    \edef\title{\noexpand\@dblarg
  \expandafter\noexpand\csname\string\title\endcsname}
    \def\@headtitle{--missing title--%
        \protect\ClassWarningNoLine{suftesi}{%
            No \string\title\space given \MessageBreak%
            See the class documentation for explanation}}
    \def\@title{--missing title--%
        \protect\ClassWarningNoLine{suftesi}{%
            No \string\title\space given\MessageBreak%
            See the class documentation for explanation}}
    \def\@author{--missing author--%
        \protect\ClassWarningNoLine{suftesi}{%
            No \string\author\space given\MessageBreak%
            See the class documentation for explanation}}
\if@titlepage% titlepage
  \renewcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\SUF@chaptersize\color{sufred}\sffamily%
    \ifsuftesi@smallcapschap%
     \SUF@titlesmallcaps{\@title}
      \else
      \ifsuftesi@article
       \ifsuftesi@smallcapssec
        \SUF@titlesmallcaps{\@title}
         \else
          \@title
        \fi
       \else
      \@title
     \fi
    \fi\par}%
    \vskip 3em%
    {\small\lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\small\@date\par}%
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
     \global\let\@date\@empty
  \global\let\date\relax
  \global\let\and\relax}
\newcommand\standardtitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
     \global\let\@date\@empty
  \global\let\date\relax
  \global\let\and\relax}
\else
\renewcommand\maketitle{\par
   \begingroup
     \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
     \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
     \long\def\@makefntext##1{\parindent 1em\noindent
             \hb@xt@1.8em{%
                 \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
     \if@twocolumn
       \ifnum \col@number=\@ne
         \@maketitle
       \else
         \twocolumn[\@maketitle]%
       \fi
     \else
       \newpage
       \global\@topnum\z@% Prevents figures from going at top of page.
       \@maketitle
     \fi
     \thispagestyle{plain}\@thanks
   \endgroup
   \setcounter{footnote}{0}%
   \global\let\thanks\relax
   \global\let\maketitle\relax
   \global\let\@maketitle\relax
   \global\let\@thanks\@empty
   \global\let\@date\@empty
   \global\let\date\relax
   \global\let\and\relax}
     \def\@maketitle{%
   \newpage
   \null
   \vskip 2em%
   \begin{center}%
   \let \footnote \thanks
     {\SUF@chaptersize\color{sufred}\sffamily%
    \ifsuftesi@smallcapschap%
     \SUF@titlesmallcaps{\@title}
      \else
      \ifsuftesi@article
       \ifsuftesi@smallcapssec
        \SUF@titlesmallcaps{\@title}
         \else
          \@title
        \fi
       \else
      \@title
     \fi
  \fi\par}%
     \vskip 1.5em%
     {\small\lineskip .5em%
       \begin{tabular}[t]{c}%
        \@author\par
       \end{tabular}\par}%
     \vskip 1em%
     {\small\@date\par}%
   \end{center}%
   \par
   \vskip 1.5em}
\newcommand\standardtitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@standardmaketitle
      \else
        \twocolumn[\@standardmaketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@
      \@standardmaketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
   \setcounter{footnote}{0}%
   \global\let\thanks\relax
   \global\let\maketitle\relax
   \global\let\@standardmaketitle\relax
   \global\let\@thanks\@empty
   \global\let\@date\@empty
   \global\let\date\relax
   \global\let\and\relax}
\def\@standardmaketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi
\ifsuftesi@collection
\newcounter{journalnumber}
\newcounter{journalvolume}
\newcounter{issue}
\newcounter{title}
\setcounter{title}{1}
\newcounter{article}
\setcounter{article}{0}
\setcounter{journalnumber}{0}
\setcounter{tocdepth}{0}
\def\journalname#1{\gdef\@journalname{#1}}
  \def\@journalname{\@latex@warning@no@line{%
    No \noexpand\journalname given}}
\def\issn#1{\gdef\@issn{#1}}
  \def\@issn{\@latex@warning@no@line{%
    No \noexpand\issn given}}
\def\doi#1{\gdef\@doi{#1}}
  \def\@doi{\@latex@warning@no@line{%
    No \noexpand\doi given}}
\def\journalvolume#1{\gdef\@journalvolume{#1}}
  \def\@journalvolume{\@latex@warning@no@line{%
    No \noexpand\journalvolume given}}
\def\journalnumber#1{\gdef\@journalnumber{#1}}
  \def\@journalnumber{\@latex@warning@no@line{%
    No \noexpand\journalnumber given}}
\def\issue#1{\gdef\@issue{#1}}
  \def\@issue{\@latex@warning@no@line{%
    No \noexpand\issue given}}
\def\journalyear#1{\gdef\@journalyear{#1}}
  \def\@journalyear{\@latex@warning@no@line{%
    No \noexpand\journalyear given}}
\def\journalwebsite#1{\gdef\@journalwebsite{\url{#1}}}
  \def\@journalwebsite{\@latex@warning@no@line{%
    No \noexpand\journalwebsite given}}
\def\thanks#1{\footnotemark\ \protected@xdef\@thanks{%
  \@thanks\protect\footnotetext[\the\c@footnote]{#1}}}
\def\fulljournal{\emph{\@journalname} \@journalnumber, %
  \@issue{} \@journalyear}
\def\issuename#1{\gdef\@issuename{#1}}
\def\collectiontitle#1{\gdef\@collectiontitle{#1}}
  \def\@collectiontitle{\@latex@warning@no@line{%
    No \noexpand\collectiontitle given}}
\def\collectioneditor#1{\gdef\@collectioneditor{#1}}
  \def\@collectioneditor{\@latex@warning@no@line{%
    No \noexpand\collectioneditor given}}
\newcommand*\l@title[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0ex \@plus\p@
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \advance\leftskip1em
      \hskip -\leftskip
      #1\nobreak%
    \ifsuftesi@dottedtoc\dotfill%
      \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
        \else
          \ifsuftesi@raggedtoc%
            \nobreak\hskip1em #2 \hfill\null\par
              \else
                \ifsuftesi@pagelefttoc
              \ClassError{suftesi}
                {\MessageBreak
                You can not use tocstyle=leftpage\MessageBreak
                  with documentstructure=collection}
                {You can not use tocstyle=leftpage\MessageBreak
                  with documentstructure=collection}
            \else
          \nobreak\hfill #2\par
        \fi
      \fi
    \fi
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks%
  \endgroup
  \setcounter{footnote}{0}%
  \setcounter{section}{0}%
  \global\let\and\relax
  \let\thanks\@gobble}
\AtBeginDocument{\def\@maketitle{%
  \SUF@chaptersize
   \SUF@lr@coll@titleSwitch
    \let\footnote\thanks
     \parindent=0pt
    \refstepcounter{title}%
    {\ifsuftesi@reverseauthortitle
      \SUF@titlefont@Switch{\@title}%
        \else\SUF@authorfont@Switch{\@author}\fi}%
    \begingroup%
    \let\thanks\@gobble
    \addcontentsline{toc}{title}{\normalfont{\@author}\newline%
      \itshape\@headtitle}
    \endgroup%
    \vspace{2ex}\par
    {\ifsuftesi@reverseauthortitle
      \SUF@authorfont@Switch{\@author}%
        \else
      \SUF@titlefont@Switch{\@title}%
    \fi\\}
    \vskip1.5cm}}
\newenvironment{article}
  {\begingroup
  \global\let\@thanks\@empty
  \setcounter{footnote}{0}
  \refstepcounter{article}
  \label{begin:\thearticle}
}
  {\label{end:\thearticle}\endgroup
  }
\newcommand{\includeart}[1]{%
    \clearpage
    \input{#1}
}
\newcommand{\frontispiece}{%
  \thispagestyle{empty}%
    \begingroup
     \centering
       \null\vspace{\stretch{1}}

       {\SUF@chaptersize\@collectiontitle\par}
         \vskip5ex

       \@collectioneditor
       \vspace{\stretch{2}}

     \@date

  \endgroup
  \clearpage}
  \setcounter{tocdepth}{0}
  \renewcommand\thesection{%
          \@arabic\c@section}
  \renewcommand\thesubsection{%
          \thesection.\@arabic\c@subsection}
  \renewcommand\thesubsubsection{%
          \thesubsection.\@arabic\c@subsubsection}
  \renewcommand\theparagraph{%
          \thesubsubsection.\@arabic\c@paragraph}
  \renewcommand\thesubparagraph{%
          \theparagraph.\@arabic\c@subparagraph}
  \else
\fi
\AtBeginDocument{%
\@ifpackagewith{frontespizio}{suftesi}
     {\ifsuftesi@periodical
          \Margini {5.5cm}{7cm}{4.5cm}{0cm}
        \else
      \ifsuftesi@compact
          \Margini {4.5cm}{7cm}{4.5cm}{0cm}
        \else
          \ifsuftesi@supercompact
          \Margini {4.5cm}{10cm}{6cm}{1cm}
        \else
      \ifsuftesi@periodicalaureo
          \Margini {5.5cm}{7cm}{4.5cm}{0cm}
      \fi
    \fi
  \fi
\fi}
{\@ifpackageloaded{frontespizio}
     {\ifsuftesi@periodical
          \Margini {1cm}{7cm}{5cm}{1cm}
          \Rientro{1cm}
        \else
      \ifsuftesi@compact
          \Margini {1cm}{7cm}{6cm}{1cm}
          \Rientro{1cm}
        \else
          \ifsuftesi@supercompact
          \Margini {1cm}{10cm}{8cm}{1cm}
          \Rientro{1cm}
        \else
          \ifsuftesi@periodicalaureo
          \Margini {1cm}{7cm}{5cm}{1cm}
          \Rientro{1cm}
        \fi
     \fi
  \fi
\fi}
{\relax}}}
\renewenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \ifsuftesi@article
                \twocolumn[\section*{\indexname}]%
                \else
                \twocolumn[\@makeschapterhead{\indexname}]%
                \fi
                \@mkboth{\indexname}{\indexname}%
                \thispagestyle{plain}%
                \raggedright%
                \parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand{\appendicesname}[1]{\def\SUF@appendices{#1}}
    \appendicesname{Appendici}
    \newcommand{\appendixpage}{\SUF@appendixpage}
\def\SUF@appendixpage{%
  \@mainmattertrue
    \titlecontents{part}
      [0em]
      {\addvspace{3ex}}
      {}
      {}
      {}
      [\addvspace{1ex}]
\let\contentspage\relax
    \cleardoublepage
       \thispagestyle{empty}
         \addcontentsline{toc}{part}{\SUF@appendices}
     \begingroup
       \centering
          \null\vfil
        {\LARGE\SUF@appendices\par}
          \vfil
   \endgroup
    \cleardoublepage
\titlecontents{part}
   [0em]
  {\addvspace{3ex}\partname~}
  {\makebox[\SUF@label@part][l]{%
    \SUF@toclabelnum\thecontentslabel}\hspace*{1em}}
  {}
  {}
  [\addvspace{1ex}]
}
\ifsuftesi@sufelements
\renewcommand\appendix{\par
    \setcounter{chapter}{0}%
    \setcounter{section}{0}%
    \gdef\@chapapp{\appendixname}%
    \gdef\thechapter{\@Alph\c@chapter}
    \titleformat{\chapter}[block]
      {\vskip-22pt}%
      {\small%
      \SUF@titlesmallcaps{\appendixname}~\Alph{chapter}:\hskip.5em}
      {0pt}
      {\small\SUF@titlesmallcaps}
      [\rule{\textwidth}{.4pt}]
      \titlespacing*{\chapter}{0em}{-16pt}{10pt}[0em]}
    \else
      \ifsuftesi@article
          \renewcommand\appendix{\par
              \setcounter{section}{0}%
              \setcounter{subsection}{0}%
              \gdef\SUF@thesection{\@Alph\c@section}}
   \else
         \renewcommand\appendix{\par
             \setcounter{chapter}{0}%
             \setcounter{section}{0}%
             \gdef\@chapapp{\appendixname}%
             \gdef\SUF@thechapter{\@Alph\c@chapter}}
    \fi
\fi
\RequirePackage{fancyhdr}
\AtBeginDocument{%
 \pagestyle{fancy}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footnoterule}{}
\def\SUF@versionstring{\texttt{\version@string{} \today}}
\ifsuftesi@elementsheader%
  \renewcommand{\chaptermark}[1]{\markboth{#1}{#1}}
  \renewcommand{\sectionmark}[1]{\markright{#1}}
 \fancypagestyle{elements}{%
  \setlength{\unitlength}{1pt}
   \fancyhf{}
   \fancyfoot[LE,RO]{\thepage}
   \fancyhead[RO]{%
    \begin{picture}(0,0)
      \put(0,-104){%
      \hskip\marginparsep
      \parbox[t]{\marginparwidth}{\itshape\raggedright\leftmark}}%
    \end{picture}}
   \fancyhead[LE]{%
     \begin{picture}(0,0)
       \put(0,-104){%
       \hskip-\dimexpr(\marginparwidth+\marginparsep)
       \parbox[t]{\marginparwidth}{\itshape\raggedleft\rightmark}}%
    \end{picture}}%
  }%
\else
\renewcommand{\chaptermark}[1]{%
    \markboth{\chaptertitlename\ \SUF@thechapter}{#1}}
\ifsuftesi@article
  \renewcommand{\sectionmark}[1]{\markright{\SUF@thesection.\ #1}}
    \else
  \renewcommand{\sectionmark}[1]{}
\fi
\fi
\fancypagestyle{plain}{\fancyhf{}}
\fancypagestyle{sufplain}{%
 \fancyhf{}%
 \fancyfoot[RE,LO]{%
   \ifsuftesi@draftdate\footnotesize\SUF@versionstring\else\fi}
 \fancyfoot[C]{\footnotesize\SUF@thepage}}
\fancypagestyle{centerheader}{%
  \fancyhf{}%
  \fancyfoot[RE,LO]{%
    \ifsuftesi@draftdate\footnotesize\SUF@versionstring\else\fi}
  \fancyhead[CO]{\footnotesize\xheadbreakfalse\SUF@rightmark}
  \fancyhead[CE]{\footnotesize\xheadbreakfalse%
    \SUF@LR@MarkSwitch}
  \fancyfoot[C]{\footnotesize\SUF@thepage}%
  }%
\fancypagestyle{sufdefault}{%
  \fancyhf{}%
  \fancyfoot[RE,LO]{%
    \ifsuftesi@draftdate\footnotesize\SUF@versionstring\else\fi}
  \fancyhead[LE,RO]{\footnotesize\SUF@thepage}
  \fancyhead[LO]{\footnotesize\xheadbreakfalse\SUF@rightmark}
  \fancyhead[RE]{\footnotesize\xheadbreakfalse%
    \SUF@LR@MarkSwitch}
  }%
\ifsuftesi@article
\ifsuftesi@authortitle
\def\SUF@LR@MarkSwitch{\SUF@leftmark}
\else
\def\SUF@LR@MarkSwitch{\SUF@rightmark}
\fi
\else
        \def\SUF@LR@MarkSwitch{\SUF@leftmark}
\fi
\def\SUF@leftrightmark{%
 \if@mainmatter\leftmark\else\rightmark\fi}
\pagestyle{sufdefault}
  \ifsuftesi@centerheader\pagestyle{centerheader}\else\fi
  \ifsuftesi@sufplain\pagestyle{sufplain}\else\fi
  \ifsuftesi@elementsheader\pagestyle{elements}\else\fi
}
\renewenvironment{quotation}
            {\list{}{\listparindent\parindent%
                     \itemindent    \listparindent
                     \leftmargin     \parindent
                     \SUF@quote@style
                     \parsep        \z@ \@plus\p@}%
               \item\relax%
                 \SUF@quotation@size%
                 \noindent\ignorespaces}
               {\endlist}
\renewenvironment{quote}
            {\list{}{\leftmargin \parindent
            \SUF@quote@style}%
               \item\relax%
                 \SUF@quotation@size}%\ignorespaces?
               {\endlist}
\renewenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax
                 \SUF@quotation@size}
               {\endlist}
\ifsuftesi@fewfootnotes
\AtBeginDocument{%
\def\@fnsymbol#1{\ensuremath{\ifcase#1\or*\or{*}{*}\or{*}{*}{*}\or%
  \ClassError{suftesi}%
  {Too many footnotes\MessageBreak
  Remove the class option 'fewfootnote'}
  {Too many footnotes\MessageBreak
  Remove the class option 'fewfootnote'}
  \else\@ctrerr\fi}}}
\def\thefootnote{\@fnsymbol\c@footnote}%
\else\fi
\newcommand*\xfootnote[1][*]{%
    \xdef\@thefnmark{#1}%
    \@footnotemark\@footnotetext}
\def\SUF@mpsetup{%
    \ifsuftesi@elementsheader\relax
      \else\itshape\fi
    \footnotesize%
    \parindent=0pt \lineskip=0pt \lineskiplimit=0pt %
    \tolerance=2000 \hyphenpenalty=300 \exhyphenpenalty=300%
    \doublehyphendemerits=100000%
    \finalhyphendemerits=\doublehyphendemerits}
  \let\oldmarginpar\marginpar
  \renewcommand{\marginpar}[1]{\oldmarginpar%
     [\SUF@mpsetup\raggedleft\hspace{0pt}{#1}]%
     {\SUF@mpsetup\raggedright\hspace{0pt}{#1}}}
\AtBeginDocument{%
\@ifpackageloaded{todonotes}{%
\renewcommand{\@todonotes@drawMarginNoteWithLine}{%
\begin{tikzpicture}[remember picture, overlay, baseline=-0.75ex]%
    \node [coordinate] (inText) {};%
\end{tikzpicture}%
\oldmarginpar[{% Draw note in left margin
    \@todonotes@drawMarginNote%
    \@todonotes@drawLineToLeftMargin%
}]{% Draw note in right margin
    \@todonotes@drawMarginNote%
    \@todonotes@drawLineToRightMargin%
}%
}%
}
{\relax}}
\ifsuftesi@collection
  \newenvironment{abstract}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \small
        \begin{center}%
          {\abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi\vspace{6ex}}
\else
\if@titlepage
  \newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
         \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{abstract}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \small
        \begin{center}%
          {\abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi
\fi
\newcommand\abstractname{Abstract}
\newcommand{\colophon}[3][]{%
  \thispagestyle{empty}
  \null
    \vfill
     \def\next{#2}
         \ifx\next\@empty\else
            \noindent Copyright \copyright{} \the\year~#2\\[1ex]
          Tutti i diritti riservati
        \fi
  \vfill
  {\small\noindent Questo lavoro \`e stato composto con \LaTeX{}%
     \def\next{#1}
        \ifx\next\@empty\else su #1
      \fi usando la classe \textsf{suftesi} di
      Ivan Valbusa\index{Valbusa, Ivan}. #3\par}
      \cleardoublepage}
\newcommand{\bookcolophon}[2]{%
  \thispagestyle{empty}
  \null
    \vfill
            \noindent #1
  \vfill
  {\small\noindent #2\par}
      \cleardoublepage}
\newcommand{\artcolophon}[1]{%
\thispagestyle{empty}
  \null
    \vfill
  {\small\noindent #1\par}}
\newcommand{\finalcolophon}[1]{%
\thispagestyle{empty}
  \null\vspace*{\stretch{1}}
  \begin{center}
  \begin{minipage}{.5\textwidth}
  \centering\small #1
  \end{minipage}
  \end{center}
    \vspace*{\stretch{6}}}
\ifsuftesi@FSPL
\newcommand{\FSPLcolophon}[1][\the\year]{%
\begingroup
\thispagestyle{empty}
\null\vspace{\stretch{1}}
\noindent \hskip-.5em\cc #1 \@author%
\vskip1ex

\small\noindent This work is licensed under the Creative Commons
Attribution-NonCommercial-NoDerivs 3.0 Unported License.
To view a copy of this license,
visit http://creativecom mons.org/licenses/by-nc-nd/3.0/.

\endgroup

\begingroup
\footnotesize

\null\vspace{\stretch{1}}

\noindent Typeset with \LaTeX{} in collaboration with the Joint Project
\emph{Formal Style for PhD Theses with \LaTeX{}} (University of Verona,
Italy) using the \textsf{suftesi} class by Ivan Valbusa. The text face
is Palatino, designed by Hermann Zapf. The sans serif font is Iwona by
Janusz M. Nowacki.

\endgroup

\clearpage}
\else
\def\FSPLcolophon{%
 \ClassError{suftesi}
   {\noexpand\FSPLcolophon is defined\MessageBreak
     only for the FSPL styles}
   {\noexpand\FSPLcolophon is defined\MessageBreak
     only for the FSPL styles}}
\fi
\RequirePackage{titletoc}
\newlength\SUF@label@chap
\setlength\SUF@label@chap{.5em}
\newcommand*{\toclabelwidth}[2]{%
  \AtBeginDocument{
    \addtolength{\csname SUF@label@#1\endcsname}{#2}%
    \addtolength{\csname SUF@tocindent@#1\endcsname}{#2}%
  }
}
\newcommand{\toclabelspace}{%
  \ClassError{suftesi}
    {\MessageBreak
    \noexpand\toclabelspace is not more defined\MessageBreak
    Use \noexpand\toclabelwidth instead.\MessageBreak
    See package documentation for details}
    {\MessageBreak
    \noexpand\toclabelspace is not more defined\MessageBreak
    Use \noexpand\toclabelwidth instead.\MessageBreak
    See package documentation for details}}
\newlength{\SUF@tochang}
\setlength{\SUF@tochang}{3em}
\AtBeginDocument{
\newlength\SUF@label@part
\newlength\SUF@label@sec
\newlength\SUF@label@subsec
\newlength\SUF@label@subsubsec
\newlength\SUF@label@par
\newlength\SUF@label@subpar
\newlength\SUF@label@fig
\newlength\SUF@label@tab
\setlength\SUF@label@part
    {\SUF@label@chap}
\setlength\SUF@label@sec
    {\dimexpr(\SUF@label@chap+.5em)}
\setlength\SUF@label@subsec
    {\dimexpr(\SUF@label@sec+.5em)}
\setlength\SUF@label@subsubsec
    {\dimexpr(\SUF@label@subsec+.5em)}
\setlength\SUF@label@par
    {\dimexpr(\SUF@label@subsubsec+.5em)}
\setlength\SUF@label@subpar
    {\dimexpr(\SUF@label@par+.5em)}
\setlength\SUF@label@fig
    {\SUF@label@sec}
\setlength\SUF@label@tab
    {\SUF@label@sec}
}
\titlecontents{part}
  [0em]
  {\addvspace{3ex}\partname\hspace*{.5em}}
  {\makebox[\SUF@label@part][l]{%
    \SUF@toclabelnum\thecontentslabel}\hspace*{1em}}
  {}
  {}
  [\addvspace{1ex}]
\ifsuftesi@pagelefttoc
\contentsmargin{0pt}
\AtBeginDocument{
\newlength\SUF@tochang@chap
\newlength\SUF@tochang@sec
\newlength\SUF@tochang@subsec
\newlength\SUF@tochang@subsubsec
\newlength\SUF@tochang@par
\newlength\SUF@tochang@subpar
\newlength\SUF@tochang@fig
\newlength\SUF@tochang@tab
\newlength\SUF@addto@tochang@chap
\newlength\SUF@addto@tochang@sec
\newlength\SUF@addto@tochang@subsec
\newlength\SUF@addto@tochang@subsubsec
\newlength\SUF@addto@tochang@par
\newlength\SUF@addto@tochang@subpar
\newlength\SUF@addto@tochang@fig
\newlength\SUF@addto@tochang@tab
\setlength\SUF@tochang@chap
    {\dimexpr(1em+\SUF@tochang+\SUF@label@chap+1em)}
\setlength\SUF@tochang@sec
    {\dimexpr(\SUF@tochang@chap+\SUF@label@sec+1em)}
\setlength\SUF@tochang@subsec
    {\dimexpr(\SUF@tochang@sec+\SUF@label@subsec+1em)}
\setlength\SUF@tochang@subsubsec
    {\dimexpr(\SUF@tochang@subsec+\SUF@label@subsubsec+1em)}
\setlength\SUF@tochang@par
    {\dimexpr(\SUF@tochang@subsubsec+\SUF@label@par+1em)}
\setlength\SUF@tochang@subpar
    {\dimexpr(\SUF@tochang@par+\SUF@label@subpar+1em)}
\setlength\SUF@tochang@fig
    {\SUF@tochang@chap}
\setlength\SUF@tochang@tab
    {\SUF@tochang@chap}
\setlength\SUF@addto@tochang@chap
    {\SUF@tochang}
\setlength\SUF@addto@tochang@sec
    {\dimexpr(\SUF@addto@tochang@chap+\SUF@label@sec+.5em)}
\setlength\SUF@addto@tochang@subsec
    {\dimexpr(\SUF@addto@tochang@sec+\SUF@label@subsec+.5em)}
\setlength\SUF@addto@tochang@subsubsec
    {\dimexpr(\SUF@addto@tochang@subsec+\SUF@label@subsubsec+.5em)}
\setlength\SUF@addto@tochang@par
    {\dimexpr(\SUF@addto@tochang@subsubsec+\SUF@label@par+.5em)}
\setlength\SUF@addto@tochang@subpar
    {\dimexpr(\SUF@addto@tochang@par+\SUF@label@subpar+.5em)}
\setlength\SUF@addto@tochang@fig
    {\dimexpr(\SUF@addto@tochang@chap-\SUF@label@sec+\SUF@label@chap)}
\setlength\SUF@addto@tochang@tab
    {\dimexpr(\SUF@addto@tochang@chap-\SUF@label@sec+\SUF@label@chap)}
}
\titlecontents{chapter}
  [\SUF@tochang@chap]
  {\addvspace{2ex}}
  {\hskip-\SUF@tochang@chap%
   \makebox[1em][l]{\thecontentspage}%
    \hskip\SUF@addto@tochang@chap%
      \makebox[\SUF@label@chap][l]{%
        \SUF@toclabelnum\thecontentslabel}\hspace*{1em}}
  {\hskip-\SUF@tochang@chap%
     \makebox[1em][l]{\thecontentspage}%
       \hskip\SUF@addto@tochang@chap}
  {}
  [\addvspace{1ex}]
\titlecontents{section}
  [\SUF@tochang@sec]
  {}
  {\hskip-\SUF@tochang@sec%
   \makebox[1em][l]{\thecontentspage}\hskip\SUF@addto@tochang@sec%
    \makebox[\SUF@label@sec][l]{%
    \ifsuftesi@article\SUF@toclabelnum%
     \else\fi\thecontentslabel}\hspace*{1em}}
  {\hskip-\SUF@tochang@sec%
   \makebox[1em][l]{\thecontentspage}\hskip\SUF@addto@tochang@sec}
  {}
\titlecontents{subsection}
  [\SUF@tochang@subsec]
  {}
  {\hskip-\SUF@tochang@subsec%
   \makebox[1em][l]{\thecontentspage}\hskip\SUF@addto@tochang@subsec%
    \makebox[\SUF@label@subsec][l]{\thecontentslabel}\hspace*{1em}}
  {\hskip-\SUF@tochang@subsec%
   \makebox[1em][l]{\thecontentspage}\hskip\SUF@addto@tochang@subsec}
  {}
\titlecontents{subsubsection}
  [\SUF@tochang@subsubsec]
  {}
  {\hskip-\SUF@tochang@subsubsec%
   \makebox[1em][l]{\thecontentspage}\hskip\SUF@addto@tochang@subsubsec%
    \makebox[\SUF@label@subsubsec][l]{\thecontentslabel}\hspace*{1em}}
  {\hskip-\SUF@tochang@subsubsec%
   \makebox[1em][l]{\thecontentspage}\hskip\SUF@addto@tochang@subsubsec}
  {}
\titlecontents{paragraph}
  [\SUF@tochang@par]
  {}
  {\hskip-\SUF@tochang@par%
   \makebox[1em][l]{\thecontentspage}\hskip\SUF@addto@tochang@par%
    \makebox[\SUF@label@par][l]{\thecontentslabel}\hspace*{1em}}
  {\hskip-\SUF@tochang@par%
   \makebox[1em][l]{\thecontentspage}\hskip\SUF@addto@tochang@par}
  {}
\titlecontents{subparagraph}
  [\SUF@tochang@subpar]
  {}
  {\hskip-\SUF@tochang@subpar%
   \makebox[1em][l]{\thecontentspage}\hskip\SUF@addto@tochang@subpar%
    \makebox[\SUF@label@subpar][l]{\thecontentslabel}\hspace*{1em}}
  {\hskip-\SUF@tochang@subpar%
   \makebox[1em][l]{\thecontentspage}\hskip\SUF@addto@tochang@subpar}
  {}
\titlecontents{figure}
  [\SUF@tochang@fig]
  {}
  {\hskip-\SUF@tochang@fig%
   \makebox[1em][l]{\thecontentspage}\hskip\SUF@addto@tochang@fig%
     \makebox[\SUF@label@tab][l]{\thecontentslabel}\hspace*{1em}}
  {}
  {}
\titlecontents{table}
  [\SUF@tochang@tab]
  {}
  {\hskip-\SUF@tochang@tab%
   \makebox[1em][l]{\thecontentspage}\hskip\SUF@addto@tochang@tab%
     \makebox[\SUF@label@tab][l]{\thecontentslabel}\hspace*{1em}}
  {}
  {}
\else
\AtBeginDocument{
\newlength\SUF@tocindent@chap
\newlength\SUF@tocindent@sec
\newlength\SUF@tocindent@subsec
\newlength\SUF@tocindent@subsubsec
\newlength\SUF@tocindent@par
\newlength\SUF@tocindent@subpar
\newlength\SUF@tocindent@fig
\newlength\SUF@tocindent@tab
\ifsuftesi@article
\setlength\SUF@tocindent@sec
    {\dimexpr(\SUF@label@chap+1.5em)}
\setlength\SUF@tocindent@subsec
    {\dimexpr(\SUF@tocindent@sec+\SUF@label@subsec+1em)}
\setlength\SUF@tocindent@subsubsec
    {\dimexpr(\SUF@tocindent@subsec+\SUF@label@subsubsec+1em)}
\setlength\SUF@tocindent@par
    {\dimexpr(\SUF@tocindent@subsubsec+\SUF@label@par+1em)}
\setlength\SUF@tocindent@subpar
    {\dimexpr(\SUF@tocindent@par+\SUF@label@subpar+1em)}
\setlength\SUF@tocindent@fig
    {\dimexpr(\SUF@label@chap+1.5em)}
\setlength\SUF@tocindent@tab
    {\dimexpr(\SUF@label@chap+1.5em)}
\else
\setlength\SUF@tocindent@chap
    {\dimexpr(\SUF@label@chap+1em)}
\setlength\SUF@tocindent@sec
    {\dimexpr(\SUF@tocindent@chap+\SUF@label@sec+1em)}
\setlength\SUF@tocindent@subsec
    {\dimexpr(\SUF@tocindent@sec+\SUF@label@subsec+1em)}
\setlength\SUF@tocindent@subsubsec
    {\dimexpr(\SUF@tocindent@subsec+\SUF@label@subsubsec+1em)}
\setlength\SUF@tocindent@par
    {\dimexpr(\SUF@tocindent@subsubsec+\SUF@label@par+1em)}
\setlength\SUF@tocindent@subpar
    {\dimexpr(\SUF@tocindent@par+\SUF@label@subpar+1em)}
\setlength\SUF@tocindent@fig
    {\dimexpr(\SUF@tocindent@chap+\SUF@label@sec-\SUF@label@chap)}
\setlength\SUF@tocindent@tab
    {\dimexpr(\SUF@tocindent@chap+\SUF@label@sec-\SUF@label@chap)}
\fi
}
\titlecontents{chapter}
  [\SUF@tocindent@chap]
  {\addvspace{2ex}}
  {\hskip-\SUF@tocindent@chap%
    \makebox[\SUF@label@chap][l]{\SUF@toclabelnum\thecontentslabel}%
    \hspace*{1em}}
  {\hskip-\SUF@tocindent@chap}
  {\SUF@chaptitlerule\contentspage}
  [\addvspace{1ex}]
\titlecontents{section}
  [\SUF@tocindent@sec]
  {}
  {\hskip-\dimexpr(\SUF@label@sec+1em)%
    \makebox[\SUF@label@sec][l]{%
    \ifsuftesi@article\SUF@toclabelnum%
      \else\fi\thecontentslabel}\hspace*{1em}}
  {\hskip-\dimexpr(\SUF@label@sec+1em)}
  {\ifsuftesi@article\SUF@chaptitlerule%
       \else\SUF@titlerule\fi\contentspage}
\titlecontents{subsection}
  [\SUF@tocindent@subsec]
  {}
  {\hskip-\dimexpr(\SUF@label@subsec+1em)%
    \makebox[\SUF@label@subsec][l]{\thecontentslabel}\hspace*{1em}}
  {\hskip-\dimexpr(\SUF@label@subsec+1em)}
  {\SUF@titlerule\contentspage}
\titlecontents{subsubsection}
  [\SUF@tocindent@subsubsec]
  {}
  {\hskip-\dimexpr(\SUF@label@subsubsec+1em)%
    \makebox[\SUF@label@subsubsec][l]{\thecontentslabel}\hspace*{1em}}
  {\hskip-\dimexpr(\SUF@label@subsubsec+1em)}
  {\SUF@titlerule\contentspage}
\titlecontents{paragraph}
  [\SUF@tocindent@par]
  {}
  {\hskip-\dimexpr(\SUF@label@par+1em)%
    \makebox[\SUF@label@par][l]{\thecontentslabel}\hspace*{1em}}
  {\hskip-\dimexpr(\SUF@label@par+1em)}
  {\SUF@titlerule\contentspage}
\titlecontents{subparagraph}
  [\SUF@tocindent@subpar]
  {}
  {\hskip-\dimexpr(\SUF@label@subpar+1em)%
    \makebox[\SUF@label@subpar][l]{\thecontentslabel}\hspace*{1em}}
  {\hskip-\dimexpr(\SUF@label@subpar+1em)}
  {\SUF@titlerule\contentspage}
\titlecontents{figure}
  [\SUF@tocindent@fig]
  {}
  {\hskip-\SUF@tocindent@fig%
    \makebox[\SUF@label@fig][l]{\thecontentslabel}\hspace*{1em}}
  {}
  {\SUF@titlerule\contentspage}
\titlecontents{table}
  [\SUF@tocindent@tab]
  {}
  {\hskip-\SUF@tocindent@tab%
    \makebox[\SUF@label@tab][l]{\thecontentslabel}\hspace*{1em}}
  {}
  {\SUF@titlerule\contentspage}
\fi
\ifsuftesi@article
\renewcommand\tableofcontents{%
    \vspace{2ex}%
    \section*{\contentsname}%
      \@mkboth{\contentsname}{\contentsname}%
        \thispagestyle{empty}
        \ifsuftesi@twocolumntoc
          \begin{multicols}{2}
          \@starttoc{toc}%
        \end{multicols}
      \else
         \@starttoc{toc}%
      \fi
    \vspace{2ex}%
   }
\renewcommand\listoffigures{%
    \vspace{2ex}%
    \section*{\listfigurename}%
       \@mkboth{\listfigurename}{\listfigurename}%
     \thispagestyle{empty}
        \ifsuftesi@twocolumnlof
          \begin{multicols}{2}
          \@starttoc{lof}%
        \end{multicols}
      \else
         \@starttoc{lof}%
      \fi
    \vspace{2ex}%
    }
\renewcommand\listoftables{%
    \vspace{2ex}%
    \section*{\listtablename}%
        \@mkboth{\listtablename}{\listtablename}%
      \thispagestyle{empty}
        \ifsuftesi@twocolumnlot
          \begin{multicols}{2}
          \@starttoc{lot}%
        \end{multicols}
      \else
         \@starttoc{lot}%
      \fi
    \vspace{2ex}%
    }
\else
\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname}%
        \@mkboth{%
            \contentsname}
           {\contentsname}%
      \thispagestyle{empty}
        \ifsuftesi@twocolumntoc
          \begin{multicols}{2}
          \@starttoc{toc}%
        \end{multicols}
      \else
         \@starttoc{toc}%
      \fi
    \if@restonecol\twocolumn\fi
   }
\renewcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
      \@mkboth{\listfigurename}%
              {\listfigurename}%
     \thispagestyle{empty}
        \ifsuftesi@twocolumnlof
          \begin{multicols}{2}
          \@starttoc{lof}%
        \end{multicols}
      \else
         \@starttoc{lof}%
      \fi
    \if@restonecol\twocolumn\fi
    }
\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
      \@mkboth{%
          \listtablename}%
         {\listtablename}%
     \thispagestyle{empty}
        \ifsuftesi@twocolumnlot
          \begin{multicols}{2}
          \@starttoc{lot}%
        \end{multicols}
      \else
         \@starttoc{lot}%
      \fi
    \if@restonecol\twocolumn\fi
    }
\fi
\ifsuftesi@article
\def\chapterintro{%
\ClassError{suftesi}
  {Command \noexpand\chapterintro is undefined\MessageBreak
     using 'documentstructure=article'}
  {Command \noexpand\chapterintro is undefined\MessageBreak
     using 'documentstructure=article'}}
\else
\def\chapterintro{
  \@ifstar{\@tempswafalse\@chapterintro}{\@tempswatrue\@chapterintro}}
\def\@chapterintro{\phantomsection
  \if@tempswa\section*{\SUF@fchapterintroname}\fi
  \addcontentsline{toc}{section}{\SUF@fchapterintroname}}
\newcommand{\chapterintroname}[1]{\def\SUF@fchapterintroname{#1}}
\chapterintroname{Introduzione}
\fi
\newif\ifheadbreak\headbreakfalse
  \DeclareRobustCommand{\headbreak}
    {\ifheadbreak\\\else\fi}
\newif\ifxheadbreak\xheadbreaktrue
  \DeclareRobustCommand{\xheadbreak}
    {\ifxheadbreak\\\else\fi}
\let\origtableofcontents\tableofcontents
  \renewcommand{\tableofcontents}{%
    \begingroup\headbreaktrue\xheadbreakfalse%
  \origtableofcontents\endgroup}
\ifsuftesi@article
\renewcommand\frontmatter{\ClassError{suftesi}
  {Command \noexpand\frontmatter is undefined\MessageBreak
     using 'documentstructure=article'}
  {Command \noexpand\frontmatter is undefined\MessageBreak
     using 'documentstructure=article'}}
\renewcommand\mainmatter{\ClassError{suftesi}
  {Command \noexpand\mainmatter is undefined\MessageBreak
     using 'documentstructure=article'}
  {Command \noexpand\mainmatter is undefined\MessageBreak
     using 'documentstructure=article'}}
\renewcommand\backmatter{\ClassError{suftesi}
  {Command \noexpand\backmatter is undefined\MessageBreak
     using 'documentstructure=article'}
  {Command \noexpand\backmatter is undefined\MessageBreak
     using 'documentstructure=article'}}
\else
\renewcommand\frontmatter{\cleardoublepage\@mainmatterfalse}
\renewcommand\mainmatter{\cleardoublepage\@mainmattertrue}
\fi
\newenvironment{bibliografia}{%
  \ifsuftesi@article
    \section*{\refname}
     \addcontentsline{toc}{section}{\refname}
  \else
  \chapter{\bibname}%
  \fi
      \normalfont \list{}{%
      \setlength{\itemindent}{-\parindent}
      \setlength{\leftmargin}{\parindent}
      \setlength{\labelwidth}{0pt}
      \setlength{\parsep}{\parskip}
      \let\makelabel}}
  {\endlist}
\newcommand{\losname}{Sigle}
\newcommand{\itlabel}[1]{\itshape\hbox to 6em{#1}}
\newenvironment{sigle}{%
  \chapter{\losname}
    \normalfont \list{}{%
      \setlength{\labelsep}{0.5em}
      \setlength{\itemindent}{0pt}
      \setlength{\leftmargin}{6em}
      \setlength{\labelwidth}{\leftmargin}
      \setlength{\listparindent}{\parindent}
      \setlength{\parsep}{\parskip}
      \let\makelabel\itlabel}}
  {\endlist}
\AtBeginDocument{\RequirePackage{fixltxhyph}}
\let\hemph\emph
\ifthenelse{\boolean{xetex}\or\boolean{luatex}}
  {\let\@afterindenttrue\@afterindentfalse}
  {\relax}
\frenchspacing
\endinput
%%
%% End of file `suftesi.cls'.
