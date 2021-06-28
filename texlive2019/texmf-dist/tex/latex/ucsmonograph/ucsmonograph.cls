%%
%% This is file `ucsmonograph.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ucsmonograph.dtx  (with options: `class')
%% 
%% Copyright 2018 Henrique Baron
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Henrique Baron.
%% 
%% This work consists of the files ucsmonograph.dtx and ucsmonograph.ins
%% and the derived file ucsmonograph.cls.
%% 
%% Classe ucsmonograph
%% Formata um documento da classe abnTeX2 para o padrao exigido pela Universidade de Caxias do Sul para monografias.
%% 
%% DUVIDAS E SUGESTOES: Abra uma issue na pagina do projeto
%% https://github.com/HenriqueBaron/ucsmonograph
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ucsmonograph}
[2018/12/10 v1.2.1 Padrao de monografias da UCS]


\RequirePackage{ifthen}

\newboolean{@lmodernAtivo}
\setboolean{@lmodernAtivo}{false}

\newboolean{@siglasAtivo}
\setboolean{@siglasAtivo}{false}

\newboolean{@simbolosAtivo}
\setboolean{@simbolosAtivo}{false}

\RequirePackage{kvoptions}
\DeclareStringOption[alf]{cite}
\ProcessKeyvalOptions*
\DeclareOption{lmodern}{%
\setboolean{@lmodernAtivo}{true}%
}

\DeclareOption{siglas}{%
\setboolean{@siglasAtivo}{true}%
}

\DeclareOption{simbolos}{%
\setboolean{@simbolosAtivo}{true}%
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}
\ProcessOptions\relax
\LoadClass[openright,a4paper,chapter=TITLE,section=TITLE]{abntex2}%

\RequirePackage{ifluatex}
\ifluatex
\RequirePackage[math-style=upright]{unicode-math}
\setboolean{@lmodernAtivo}{true}
\fi

\RequirePackage[\ucsmonograph@cite,abnt-etal-list=3,abnt-etal-text=it,%
abnt-full-initials=no]{abntex2cite}

\ifthenelse{\equal{\ucsmonograph@cite}{num}}{%
\citebrackets[]%
\RequirePackage{cite}%
}{}

\let\su@ExpandTwoArgs\relax
\let\IfSubStringInString\relax
\let\su@IfSubStringInString\relax

\hypersetup{%
unicode=true,
pdfcreator={LaTeX with ucsmonograph},
colorlinks=true,
linkcolor=black,
citecolor=black,
}

\ifthenelse{\boolean{@lmodernAtivo}}{%
\RequirePackage{lmodern}
}{}

\RequirePackage{caption}

\RequirePackage[top=3cm,left=3cm,bottom=2cm,right=2cm]{geometry}
\raggedbottom

\RequirePackage{etoolbox}
\RequirePackage{indentfirst}
\RequirePackage[absolute]{textpos}
\RequirePackage{calc}

\RequirePackage{amsmath}
\allowdisplaybreaks

\RequirePackage{xparse}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{icomma}

\RequirePackage{adjustbox}
\newlength\larguraimagem
\newlength\larguratabular
\newlength\largurafonte

\RequirePackage{chngcntr}
\counterwithout{equation}{chapter}

\RequirePackage{suffix}

\ifthenelse{\boolean{@siglasAtivo}}{%
\PassOptionsToPackage{acronyms}{glossaries-extra}%
}

\ifthenelse{\boolean{@simbolosAtivo}}{%
\PassOptionsToPackage{symbols}{glossaries-extra}%
}

\ifthenelse{\boolean{@siglasAtivo} \OR \boolean{@simbolosAtivo}}{%
\PassOptionsToPackage{record,toc=false,nonumberlist,style=long}{glossaries-extra}%
}{}

\RequirePackage{glossaries-extra}
\setlength\glsdescwidth\linewidth%

\ifthenelse{\boolean{@siglasAtivo}}{%
\setabbreviationstyle[acronym]{long-short}%
\setabbreviationstyle[foreignabbreviation]{long-short-user}%
}{}

\newcommand{\quadroname}{Quadro}
\newcommand{\listquadroname}{Lista de quadros}

\newfloat{quadro}{\quadroname}{loq}[chapter]
\restylefloat*{quadro}
\setfloatadjustment{quadro}{\centering}
\setfloatlocations{quadro}{hbtp}

\newlistof{listofquadros}{loq}{\listquadroname}
\newlistentry{quadro}{loq}{0}
\renewcommand{\cftquadroname}{\quadroname\space}
\renewcommand*{\cftquadroaftersnum}{\hfill\textendash\hfill}

\renewcommand{\fnum@quadro}{\quadroname\ \thequadro}

\counterwithout{quadro}{chapter}

\let\@oldlistofquadros\listofquadros
\def\listofquadros{%
\pdfbookmark[0]{\listquadroname}{loq}
\@oldlistofquadros
}

\makepagestyle{abntheadings}
\makeevenhead{abntheadings}{\ABNTEXfontereduzida\thepage}{}{}
\makeoddhead{abntheadings}{}{}{\ABNTEXfontereduzida\thepage}

\addto\captionsbrazil{%
\renewcommand{\listfigurename}{Lista de figuras}%
\renewcommand{\listadesimbolosname}{Lista de s\'{i}mbolos}%
}

\renewcommand{\ABNTEXchapterfont}{\bfseries}
\renewcommand{\ABNTEXchapterfontsize}{\normalsize}

\renewcommand{\ABNTEXsectionfont}{\ABNTEXchapterfont\mdseries}
\renewcommand{\ABNTEXsectionfontsize}{\normalsize}

\renewcommand{\ABNTEXsubsectionfont}{\ABNTEXsectionfont\bfseries}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}

\renewcommand{\ABNTEXsubsubsectionfont}{\ABNTEXsubsectionfont\mdseries}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}

\renewcommand{\ABNTEXsubsubsubsectionfont}{\ABNTEXsubsubsectionfont\itshape}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}

\renewcommand{\cftchapterfont}{\ABNTEXchapterfont}
\renewcommand{\cftsectionfont}{\ABNTEXsectionfont}
\renewcommand{\cftsubsectionfont}{\ABNTEXsubsectionfont}
\renewcommand{\cftsubsubsectionfont}{\ABNTEXsubsubsectionfont}
\renewcommand{\cftparagraphfont}{\ABNTEXsubsubsubsectionfont}

\linespread{1.4}
\setlength\parskip{0pt}
\setlength\parindent{1.5cm}

\setlength\afterchapskip\baselineskip
\setaftersecskip\baselineskip
\setaftersubsecskip\baselineskip
\setaftersubsubsecskip\baselineskip
\setafterparaskip\baselineskip

\setlength\textfloatsep{1.5\baselineskip}
\setlength\floatsep{1.5\baselineskip}
\setlength\intextsep{1.5\baselineskip}
\AtBeginDocument{%
\setlength\abovedisplayskip{1\baselineskip plus 5pt minus 5pt}
\setlength\belowdisplayskip{1\baselineskip plus 5pt minus 5pt}
\setlength\abovedisplayshortskip{1\baselineskip plus 5pt minus 5pt}
\setlength\belowdisplayshortskip{1\baselineskip plus 5pt minus 5pt}
\setlength\jot{2ex}
}

\newlength\@enumerateindent
\setlength\@enumerateindent{\parindent+0.6cm}
\setlist[enumerate,1]{labelindent=\parindent,leftmargin=\@enumerateindent,nosep,label=\alph*)}
\setlist[itemize,1]{nosep,label=--}

\let\@oldthebibliography\thebibliography
\def\thebibliography#1{%
\@oldthebibliography{#1}
\setlength\parskip{0pt}
\setlength\itemsep\baselineskip
}

\renewcommand{\printchapternum}{%
\tocprintchapter
\setboolean{abntex@innonumchapter}{false}
\chapnumfont%
\space\thechapter%
\ifthenelse{\boolean{abntex@apendiceousecao}}{%
\tocinnonumchapter
\ABNTEXcaptiondelim%
}{}
}

\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname\  }

\renewcommand{\imprimircapa}{%
\pdfbookmark[0]{Capa}{Capa}%
\begin{capa}%
\bfseries\centering%
\expandafter\uppercase\expandafter{\imprimirinstituicao}\\%
\expandafter\uppercase\expandafter{\@areadoconhecimento}
\vfill
\begin{textblock*}{160mm}(30mm, 297mm/4+15mm)%
\expandafter\uppercase\expandafter{\theauthor}%
\end{textblock*}%
\begin{textblock*}{160mm}(30mm, 297mm/2)%
\expandafter\uppercase\expandafter{\thetitle}%
\end{textblock*}%
\vfill
\expandafter\uppercase\expandafter{\imprimirlocal}\\
\expandafter\uppercase\expandafter{\thedate}%
\end{capa}%
}

\renewcommand{\folhaderostocontent}{%
\bfseries\centering%
\expandafter\uppercase\expandafter{\theauthor}%
\vfill
\vfill
\begin{textblock*}{160mm}(30mm, 297mm/2)%
\expandafter\uppercase\expandafter{\thetitle}%
\end{textblock*}%
\vfill
\abntex@ifnotempty{\imprimirpreambulo}{%
\hspace{.45\textwidth}%
\begin{minipage}{.5\textwidth}%
\mdseries%
\SingleSpacing%
\imprimirpreambulo%
\vspace{\onelineskip}%

\imprimirorientadorRotulo~\imprimirorientador%
\end{minipage}%
}%
\vfill
\bfseries
\expandafter\uppercase\expandafter{\imprimirlocal}\\
\expandafter\uppercase\expandafter{\thedate}%
}

\renewcommand{\ABNTEXcaptionfontedelim}{: }
\renewcommand{\fonte}[2][\larguratabular]{%
\ifthenelse{\equal{\strip@pt#1}{0}}{%
\setlength\largurafonte\linewidth
}{%
\setlength\largurafonte{#1}
}
\centering%
\begin{minipage}[h]{\largurafonte}
\vspace{2pt}
\raggedright\footnotesize\fontename%
\ABNTEXcaptionfontedelim\ignorespaces #2
\end{minipage}
}

\let\@olddedicatoria\dedicatoria
\let\@oldenddedicatoria\enddedicatoria
\def\dedicatoria{%
\@olddedicatoria%
\vspace*{\fill}%
\hspace{.5\textwidth}%
\begin{minipage}[b]{.45\textwidth}%
\SingleSpacing%
}
\def\enddedicatoria{%
\end{minipage}%
\@oldenddedicatoria%
}

\let\@oldtitulo\titulo
\renewcommand{\titulo}[1]{%
\@oldtitulo{#1}
\hypersetup{%
pdftitle={#1}
}
}
\let\@oldautor\autor
\renewcommand{\autor}[1]{%
\@oldautor{#1}
\hypersetup{%
pdfauthor={#1}
}
}
\let\@oldpreambulo\preambulo
\renewcommand{\preambulo}[1]{%
\@oldpreambulo{#1}
\hypersetup{%
pdfsubject={#1}
}
}

\let\@oldtabular\tabular
\let\@oldendtabular\endtabular
\def\tabular{%
\begin{adjustbox}{gstore width=\larguratabular}
\@oldtabular
}
\def\endtabular{%
\@oldendtabular
\end{adjustbox}
}

\let\@oldlistoffigures\listoffigures
\def\listoffigures{%
\pdfbookmark[0]{\listfigurename}{lof}
\@oldlistoffigures
}

\let\@oldlistoftables\listoftables
\def\listoftables{%
\pdfbookmark[0]{\listtablename}{lot}
\@oldlistoftables
}

\let\@oldtableofcontents\tableofcontents
\def\tableofcontents{%
\pdfbookmark[0]{\contentsname}{toc}
\@oldtableofcontents
}

\ifthenelse{\boolean{@siglasAtivo}}{%
\renewcommand{\glsxtruserparen}[2]{%
\glsxtrfullsep{#2}%
\glsxtrparen
{#1\ifglshasfield{\glsxtruserfield}{#2}{, \emph{\glscurrentfieldvalue}}{}}%
}%
\renewcommand{\glsuserdescription}[2]{%
\ifglshasfield{\glsxtruserfield}{#2}{\emph{\glscurrentfieldvalue}}{#1}%
}
}{}

\let\@oldcontentsline\contentsline
\def\contentsline#1#2{%
\expandafter\ifx\csname l@#1\endcsname\l@section
\expandafter\@firstoftwo
\else
\expandafter\@secondoftwo
\fi
{%
\@oldcontentsline{#1}{\MakeTextUppercase{#2}}%
}{%
\@oldcontentsline{#1}{#2}%
}%
}

\let\@oldforeignlanguage\foreignlanguage
\renewcommand{\foreignlanguage}[2]{\@oldforeignlanguage{#1}{\emph{#2}}}

\newcommand{\@palavraschave}{}
\newcommand{\palavraschave}[1]{%
\renewcommand{\@palavraschave}{#1}
\hypersetup{%
pdfkeywords={#1}
}
}

\newcommand\@areadoconhecimento{}
\newcommand\areadoconhecimento[1]{%
\renewcommand\@areadoconhecimento{#1}
}

\newcommand\@avaliadori{}
\newcommand\avaliadori[1]{%
\renewcommand\@avaliadori{#1}
}

\newcommand\@avaliadorii{}
\newcommand\avaliadorii[1]{%
\renewcommand\@avaliadorii{#1}
}

\newcommand\@avaliadorext{}
\newcommand\avaliadorext[1]{%
\renewcommand\@avaliadorext{#1}
}

\newcommand{\imprimirfolhadeaprovacao}[2][\imprimirinstituicao]{%
\begin{folhadeaprovacao}%
\begin{center}%
\bfseries %
\ABNTEXchapterfont %
\expandafter\uppercase\expandafter{\theauthor} \par %
\vfill
\expandafter\uppercase\expandafter{\thetitle}\par %
\end{center}
\abntex@ifnotempty{\imprimirpreambulo}{%
\hspace{.45\textwidth} %
\begin{minipage}{.5\textwidth}%
\mdseries%
\SingleSpacing%
\imprimirpreambulo%
\vspace{24pt} \par %
\bfseries Aprovado(a) em #2 %
\end{minipage}%
}
\vfill 
\flushbottom
\noindent\textbf{Banca Examinadora} %
\begin{SingleSpace} %
\vspace*{\ABNTEXsignskip}%
\noindent%
\imprimirorientador\\
\imprimirinstituicao
\ifthenelse{\not\equal{\@avaliadori}{}}{%
\par
\vspace*{\ABNTEXsignskip}%
\noindent\@avaliadori\\
\imprimirinstituicao
}{}
\ifthenelse{\not\equal{\@avaliadorii}{}}{%
\par
\vspace*{\ABNTEXsignskip}%
\noindent\@avaliadorii\\
\imprimirinstituicao
}{}
\ifthenelse{\not\equal{\@avaliadorext}{}}{%
\par
\vspace*{\ABNTEXsignskip}
\noindent\@avaliadorext\\
#1 %
}{}
\end{SingleSpace} %
\end{folhadeaprovacao} %
}

\newcommand{\incluirimagem}[4][1]{%
\caption{#3}%
\adjustimage{scale=#1,fbox=1.5pt {\fboxsep} 1pt,gstore width=\larguraimagem,center}{#2}
\fonte[\larguraimagem-14pt]{#4}
}

\WithSuffix\newcommand\incluirimagem*[3][1]{%
\adjustimage{scale=#1,fbox=1.5pt {\fboxsep} 1pt,gstore
width=\larguraimagem,center}{#2}
\fonte[\larguraimagem-14pt]{#3}
}

\ifthenelse{\boolean{@siglasAtivo}}{%
\newcommand{\incluirsiglas}[1]{%
\GlsXtrLoadResources[%
src  = {#1},
sort = {pt-BR},
type = {acronym},
entry-type-aliases={% make @foreignabbreviation act like @abbreviation
foreignabbreviation=abbreviation},
field-aliases={%
foreignlong=user1,
nativelong=long},
category={same as original entry}% requires bib2gls v1.4+
]
}%
\WithSuffix\newcommand\listofsiglas*{%
\pdfbookmark[0]{\listadesiglasname}{loa}
\printunsrtglossary[type=acronym,title=\listadesiglasname]%
\addtocounter{table}{-1}%
}%
}{}

\ifthenelse{\boolean{@simbolosAtivo}}{%
\newcommand{\incluirsimbolos}[1]{%
\GlsXtrLoadResources[%
src = {#1},
sort = {use},
type = {symbols}
]%
}%
\WithSuffix\newcommand\listofsimbolos*{%
\pdfbookmark[0]{\listadesimbolosname}{los}
\printunsrtglossary[type=symbols,title=\listadesimbolosname]%
\addtocounter{table}{-1}%
}%
}{}
\endinput
%%
%% End of file `ucsmonograph.cls'.
