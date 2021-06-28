\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{droit-fr}[2014/01/30 v0.4 classe pour droit francais]
\LoadClassWithOptions{memoir} % classe de référence: memoir

%%% OPTIONS %%%

\RequirePackage{kvoptions} % support des options de type clé=valeur
\SetupKeyvalOptions{family=drfr,prefix=drfr@}

\DeclareBoolOption[true]{footnotereset}
\DeclareBoolOption[true]{versetitle}
\ProcessKeyvalOptions{drfr}

\ifdrfr@footnotereset
% reset des notes de bas de page à chaque nouvelle page
\PassOptionsToPackage{perpage}{footmisc}
\else
% numérotation continue des notes de bas de pages du début à la fin
\counterwithout{footnote}{chapter}
\fi

%%% PACKAGES REQUIS %%%
\RequirePackage[utf8]{inputenc} % pour bonne interprétation des caractère spéciaux dans la classe
\RequirePackage{ifdraft} % comportements spécifiques quand l'option de classe draft est présente
\RequirePackage{xifthen} % code conditionnel
\RequirePackage{xstring} % code conditionnel
\RequirePackage{footmisc} % gestion des notes de bas de page
\RequirePackage{engrec} % compteur à symbole grecs
\RequirePackage{filecontents} % génération des fichers de style makeindex
\usepackage{babel} % support des langues
\usepackage[babel]{csquotes} % support des guillemets babel

%%% PAGE DE TITRE %%%

% université
\newcommand{\university}[1]{\def\theuniversity{#1}}

% école doctorante
\newcommand{\school}[1]{\def\theschool{#1}}

% spécialité de la thèse
\newcommand{\speciality}[1]{\def\thespeciality{#1}}

% date de soutenance
\newcommand{\approvaldate}[1]{\def\theapprovaldate{#1}}

% titre
\renewcommand{\title}[1]{\def\thetitle{#1}}

% auteur
\renewcommand{\author}[2]{\def\theauthor{#1 \textsc{#2}}}

% directeur de thèse
% {civilité}{prénom}{nom}{poste}
\newcommand{\director}[4]{%
\def\thedirector{\textbf{#1 #2 \textsc{#3}}}
\def\thedirectorjob{#4}}

% rapporteurs
% {civilité}{prénom}{nom}{poste}
\newcommand{\reportera}[4]{%
\def\thereportera{\textbf{#1 #2 \textsc{#3}}}
\def\thereporterajob{#4}}

\newcommand{\reporterb}[4]{%
\def\thereporterb{\textbf{#1 #2 \textsc{#3}}}
\def\thereporterbjob{#4}}

% autres membres du jury
% {civilité}{prénom}{nom}{poste}
\newcommand{\membera}[4]{%
\def\themembera{\textbf{#1 #2 \textsc{#3}}}
\def\thememberajob{#4}}

\newcommand{\memberb}[4]{%
\def\thememberb{\textbf{#1 #2 \textsc{#3}}}
\def\thememberbjob{#4}}

% page de titre pour la soutenance
\newcommand{\maketitlepage}{{%
\thispagestyle{empty}

\begin{center}
{\LARGE Universit\'e \theuniversity \\[1\onelineskip]}
{\large \'Ecole doctorale de \theschool \\[2\onelineskip]}

{Th\`ese de doctorat en \thespeciality \\
soutenue le \theapprovaldate \\[2\onelineskip]}

{\LARGE\bfseries \thetitle \\[2\onelineskip]}
{\Large \theauthor \\[2\onelineskip]}

\vfill

\begin{tabular}{ll}
Sous la direction de: & \thedirector \\
  & \thedirectorjob \\
  &  \\
Rapporteurs: & \thereportera \\
  & \thereporterajob \\
  & \thereporterb \\
  & \thereporterbjob \\
  &  \\
Membres du jury: & \themembera \\
  & \thememberajob \\
  & \thememberb \\
  & \thememberbjob
\end{tabular}
\end{center}

\cleardoublepage
}}

%%% TEXTE %%%

\OnehalfSpacing % espacement de ligne
\frenchbsetup{PartNameFull=false} % "partie I" préféré à "première partie"

%%% EN-TETES / PIEDS DE PAGE %%%

% date de compilation indiquée en mode draft uniquement
\newcommand{\addversion}{\ifdraft{Imprimé le \today}{}}

% définition du style des headers et footers
\makepagestyle{corpus}
\makeheadrule{corpus}{\textwidth}{\normalrulethickness}
%\makefootrule{corpus}{\textwidth}{\normalrulethickness}{\footruleskip}
\makeevenhead{corpus}{\small\thetitle}{}{\small\addversion}
\makeoddhead{corpus}{}{}{\small\rightmark}
\makeevenfoot{corpus}{}{\small\thepage}{}
\makeoddfoot{corpus}{}{\small\thepage}{}
\makepsmarks{corpus}{%
\nouppercaseheads
\createmark{part}{right}{shownumber}{Titre }{. \ }
\createmark{chapter}{right}{shownumber}{\@chapapp\ }{. \ }
\createmark{section}{right}{shownumber}{}{. \ }
\createmark{subsection}{right}{shownumber}{}{ \ }
\createplainmark{toc}{right}{\contentsname}
\createplainmark{lof}{right}{\listfigurename}
\createplainmark{lot}{right}{\listtablename}
\createplainmark{bib}{right}{\bibname}
\createplainmark{index}{right}{\indexname}
\createplainmark{glossary}{right}{\glossaryname}
}

% hack de la classe memoir: équivalent à \createmark{book}, non disponible
\def\bookpagemark#1{%
  \markright{%
  \ifnum\c@secnumdepth > -2
    \if@mainmatter
      Partie \thebook. \ %
    \fi
  \fi
#1}}

\pagestyle{corpus}


%%% SECTIONS %%%

% [-2] parties ("Première partie")

% macro de conversion compteur => chaine de caractères de genre féminin
\newcommand{\counterToFrenchF}[1]{\ifcase\value{#1}\or Première\or
     Deuxième\or Troisième\or Quatrième\or Cinquième\or
     Sixième\or Septième\or Huitième\or Neuvième\or Dixième\or
     Onzième\or Douzième\or Treizième\or Quatorzième\or Quinzième\or
     Seizième\or Dix-septième\or Dix-huitième\or Dix-neuvième\or Vingtième\fi}
\renewcommand*{\bookname}{\protect\counterToFrenchF{book}~partie}
\renewcommand{\booknamenum}{} % espace entre intitulé et numéro
\renewcommand{\printbooknum}{} % numéro
\newcommand{\partie}{\book}

% [-1] titres (I)

\AtBeginDocument{%
\renewcommand*{\partname}{Titre}
}
\counterwithin*{part}{book}% RAZ du compteur \part dans un nouveau book
\newcommand{\titre}{\part}

% [0] chapitres (1)

\counterwithin*{chapter}{part}% RAZ du compteur \chapter dans une nouvelle part
\newcommand{\chapitre}{\chapter}

% [1] sections (I)

\renewcommand*{\thesection}{Section \Roman{section}}
%\setbeforesecskip{}
%\setsecindent{}
\setaftersecskip{2em}
\setsecheadstyle{\LARGE\bfseries\raggedright}
\setsechook{\needspace{4\baselineskip}}

% [2] paragraphes (§1)

\renewcommand*{\thesubsection}{\S~\arabic{subsection}.}
%\setbeforesubsecskip{}
%\setsubsecindent{}
\setaftersubsecskip{1.5em}
\setsubsecheadstyle{\Large\bfseries\raggedright}
\setsubsechook{\needspace{4\baselineskip}}
\newcommand{\paragraphe}{\subsection}

% [3] sous-paragraphes (A.)

\renewcommand*{\thesubsubsection}{\Alph{subsubsection}.}
%\setbeforesubsubsecskip{}
%\setsubsubsecindent{}
%\setaftersubsubsecskip{}
\setsubsubsecheadstyle{\large\bfseries\raggedright}
\setsubsubsechook{\needspace{4\baselineskip}}
\newcommand{\souspara}{\subsubsection}

% [4] alinéas (1.)

\renewcommand*{\theparagraph}{\arabic{paragraph}.}
%\setbeforeparaskip{}
%\setparaindent{}
%\setafterparaskip{}
\setparaheadstyle{\bfseries\raggedright}
\setparahook{\needspace{4\baselineskip}}
\newcommand{\alinea}{\paragraph}

% [5] sous-alinéas (a.)

\renewcommand*{\thesubparagraph}{\alph{subparagraph}.}
%\setbeforesubparaskip{}
\setsubparaindent{0pt}
%\setaftersubparaskip{} % 
\setsubparaheadstyle{\bfseries\raggedright}
\setsubparahook{\needspace{4\baselineskip}}
\newcommand{\sousalinea}{\subparagraph}

% [6] points (i.)

\newcommand{\subsubparagraph}{\@startsection{subsubparagraph}
  {6}{\parindent}{1\baselineskip plus 0.25\baselineskip}
  {.5em}{\normalsize\bfseries\raggedright}}
\newlistentry[subparagraph]{subsubparagraph}{toc}{5}
\newcommand*{\subsubparagraphmark}[1]{} % gobble heading mark
\renewcommand{\thesubsubparagraph}{\roman{subsubparagraph}.}
\newcommand{\point}{\subsubparagraph}

% [7] souspoints (alpha.)

\newcommand{\subsubsubparagraph}{\@startsection{subsubsubparagraph}
  {7}{\parindent}{1\baselineskip plus 0.25\baselineskip}
  {.5em}{\normalsize\bfseries\raggedright}}
\newlistentry[subsubparagraph]{subsubsubparagraph}{toc}{6}
\newcommand*{\subsubsubparagraphmark}[1]{} % gobble heading mark
\renewcommand{\thesubsubsubparagraph}{\engrec{subsubsubparagraph}.}
\newcommand{\souspoint}{\subsubsubparagraph}

% [8] versets (paragraphes numérotés)

\newcommand{\versetsec}[1]{\@startsection{versetsec}
  {8}{\parindent}{0.5\baselineskip}
  {#1}{\small\textbf}}
\newlistentry{versetsec}{toc}{7}
\newcommand*{\versetsecmark}[1]{} % gobble heading mark
\renewcommand{\theversetsec}{\arabic{versetsec}.}

\newcommand{\versetsecfilled}{\versetsec{-1em}}
\newcommand{\versetsecblank}{\versetsec{-0em}}

% référencement des versets dans l'index
\newcounter{indexv}

% style des versets: caractères séparateur avec le texte
\newcommand{\versetsep}{}
\newcommand{\versetsepifempty}{}
\newcommand{\versetsepspace}{1em}
\newcommand{\versetsepstyle}{\normalfont}

% ajout de point final si nécessaire.
% aucun point n'est ajouté si le verset est déjà fini par "!", "?", "." ou "/ldots".
\newcommand{\versetdot}[1]{%
  \IfEndWith{#1}{.}{}{%
    \IfEndWith{#1}{?}{}{%
      \IfEndWith{#1}{!}{}{%
        \IfEndWith{#1}{\ldots}{}{.}%
      }%
    }%
  }%
}

\newcommand{\versetcontent}[1]{%
  \ifthenelse{\equal{#1}{}}%
    {\versetsecblank{#1}}%
    {\versetsecfilled{#1\protect\versetdot{#1}}}%
}

\newcommand{\verset}[1]{%
  \ifdrfr@versetitle%
    \ifthenelse{\equal{#1}{}}%
      {\ifthenelse{\equal{\versetsepifempty}{}}%
        {\versetcontent{#1}}%
        {\versetcontent{{\versetsepstyle\versetsepifempty}}}}%
      {\ifthenelse{\equal{\versetsep}{}}%
        {\versetcontent{#1}}%
        {\versetcontent{#1\hspace{\versetsepspace}{\versetsepstyle\versetsep}}}}%
  \else%
    \versetcontent{{\versetsepstyle\versetsepifempty}}%
  \fi%
  \addtocounter{indexv}{1}% 
}

% numérotation visible
\setsecnumdepth{all}
\maxsecnumdepth{all}
\setcounter{secnumdepth}{7} % pour points (6) et sous-points (7)

% option pour éviter les pbs d'hyperliens ambigus (de \part et \chapter)
\PassOptionsToPackage{hypertexnames=false}{hyperref}

%%% REFERENCES CROISEES

\AtBeginDocument{%
% autoref est disponible via le package hyperref
\renewcommand*{\bookautorefname}{Partie}
\renewcommand*{\partautorefname}{Titre}
\renewcommand*{\chapterautorefname}{Chapitre}
}


%%% GLOSSAIRE

\renewcommand{\memgloterm}[1]{\textbf{#1}}
\renewcommand{\memglodesc}[1]{\hspace{1ex}#1}
\renewcommand{\memglonum}[1]{}

%%% INDEX %%%

\renewcommand*{\seename}{\textit{voir}}
\renewcommand*{\alsoname}{\textit{v. aussi}}

\ifdraft{\showindexmarks}{}

% index de base par versets
\newcommand{\indexvfilename}{\jobname}
\newcommand{\makeindexv}{\makeindex[\indexvfilename]}
\newcommand{\indexv}[1]{\specialindex{\indexvfilename}{indexv}{#1}}
\newcommand{\printindexv}{\printindex[\indexvfilename]}

% index d'auteur par versets
\newcommand{\indexafilename}{auteurs}
\newcommand{\makeindexa}{\makeindex[\indexafilename]}
\newcommand{\indexa}[1]{\specialindex{\indexafilename}{indexv}{#1}}
\newcommand{\printindexa}{\printindex[\indexafilename]}

% entête de l'index
\newcommand{\idxmark}[1]{#1\markboth{#1}{#1}}

% raccourcis de style pour entrées indexées
\newcommand{\hyperbf}[1]{\textbf{\hyperpage{#1}}}
\newcommand{\hyperit}[1]{\textit{\hyperpage{#1}}}


%%% SOMMAIRE & TABLE DES MATIERES %%%

% paramètres communs
\renewcommand{\cftbookname}{Partie\space}%
\renewcommand{\cftpartname}{Titre\space}%
%
\cftsetindents{subsubparagraph}{4em}{2em}
\cftsetindents{subsubsubparagraph}{5em}{2em}
\cftsetindents{versetsec}{6em}{2em}

% sommaire
\newcommand*{\setupshorttoc}{%
\renewcommand*{\contentsname}{Sommaire}
\let\oldchangetocdepth\changetocdepth
\renewcommand*{\changetocdepth}[1]{}
\let\oldcftchapterfillnum\cftchapterfillnum
\setcounter{tocdepth}{0}% Parties / Titres / Chapitres seulement
%
%\cftpagenumbersoff{book}
%\cftpagenumbersoff{part}
%\cftpagenumbersoff{chapter}
%
\renewcommand{\tocheadstart}{}
%
\renewcommand{\cftbeforebookskip}{1em}%
%\renewcommand{\cftbookfont}{}%
\renewcommand{\cftbookindent}{0em}%
%\renewcommand{\cftbooknumwidth}{}%
\renewcommand{\cftbookpagefont}{\normalfont\bfseries\large}%
%\renewcommand{\cftafterbookskip}{}%
%\renewcommand{\cftbookleader}{\cftdotfill{\cftdotsep}}%
%
\renewcommand{\cftbeforepartskip}{0.5em}%
\renewcommand{\cftpartfont}{\normalfont\scshape}%
\renewcommand{\cftpartindent}{0.5em}%
%\renewcommand{\cftpartnumwidth}{}%
\renewcommand{\cftpartpagefont}{\normalfont\scshape}%
%\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}}%
%
\renewcommand{\cftbeforechapterskip}{0em}%
\renewcommand{\cftchapterfont}{\normalfont}%
\renewcommand{\cftchaptername}{Chapitre\space}%
\renewcommand{\cftchapterindent}{1em}%
%\renewcommand{\cftchapternumwidth}{}%
\renewcommand{\cftchapterpagefont}{\normalfont}%
%\renewcommand{\cftchapterleader}{\cftdotfill{\cftdotsep}}%
}%

\newcommand{\shorttableofcontents}{%
\clearpage
\setupshorttoc
\tableofcontents
}%

% table des matières
\newcommand*{\setuplongtoc}{%
\renewcommand*{\contentsname}{Table des matières}%
\let\changetocdepth\oldchangetocdepth
\setcounter{tocdepth}{7}%
%
% \cftpagenumberson{book}
% \cftpagenumberson{part}
% \cftpagenumberson{chapter}
%
\renewcommand{\tocheadstart}{\chapterheadstart}
%
\renewcommand{\cftbookbreak}{\addpenalty{-\@highpenalty}\clearpage}
\renewcommand{\cftbeforebookskip}{2em}%
\renewcommand{\cftbookfont}{\normalfont\bfseries\Large}%
\renewcommand{\cftbookindent}{0em}%
%\renewcommand{\cftbooknumwidth}{}%
%\renewcommand{\cftafterbookskip}{}%
\renewcommand{\cftbookleader}{\cftdotfill{\cftdotsep}}%
%
\renewcommand{\cftbeforepartskip}{1.5em}%
\renewcommand{\cftpartfont}{\normalfont\bfseries\large}%
\renewcommand{\cftpartindent}{0em}%
%\renewcommand{\cftpartnumwidth}{}%
\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}}%
%
\renewcommand{\cftbeforechapterskip}{1em}%
\renewcommand{\cftchapterfont}{\normalfont\bfseries\large}%
\renewcommand{\cftchaptername}{Chapitre\space}%
\renewcommand{\cftchapterindent}{0em}%
%\renewcommand{\cftchapternumwidth}{}%
\renewcommand{\cftchapterleader}{\cftdotfill{\cftdotsep}}%
%
\renewcommand{\cftbeforesectionskip}{0.5em}%
\renewcommand{\cftsectionfont}{\normalfont\large}%
%\renewcommand{\cftsectionname}{Section\space}%
\renewcommand{\cftsectionindent}{0em}%
\renewcommand{\cftsectionnumwidth}{5.5em}%
%\renewcommand{\cftsectionleader}{\cftdotfill{\cftdotsep}}%
%
\renewcommand{\cftbeforesubsectionskip}{0.5em}%
\renewcommand{\cftsubsectionfont}{\normalfont\scshape}%
%\renewcommand{\cftsubsectionname}{}%
\renewcommand{\cftsubsectionindent}{0em}%
\renewcommand{\cftsubsectionnumwidth}{2em}%
%\renewcommand{\cftsubsectionleader}{\cftdotfill{\cftdotsep}}%
%
%\renewcommand{\cftbeforesubsubsectionskip}{}%
\renewcommand{\cftsubsubsectionfont}{\normalfont\itshape}%
%\renewcommand{\cftsubsubsectionname}{}%
\renewcommand{\cftsubsubsectionindent}{1em}%
\renewcommand{\cftsubsubsectionnumwidth}{2em}%
%\renewcommand{\cftsubsubsectionleader}{\cftdotfill{\cftdotsep}}%
%
%\renewcommand{\cftbeforeparagraphskip}{}%
\renewcommand{\cftparagraphfont}{\normalfont}%
%\renewcommand{\cftparagraphname}{}%
\renewcommand{\cftparagraphindent}{2em}%
\renewcommand{\cftparagraphnumwidth}{2em}%
%\renewcommand{\cftparagraphleader}{\cftdotfill{\cftdotsep}}%
%
%\renewcommand{\cftbeforesubparagraphskip}{}%
\renewcommand{\cftsubparagraphfont}{\normalfont}%
%\renewcommand{\cftsubparagraphname}{}%
\renewcommand{\cftsubparagraphindent}{3em}%
\renewcommand{\cftsubparagraphnumwidth}{2em}%
%\renewcommand{\cftsubparagraphleader}{\cftdotfill{\cftdotsep}}%
%
\renewcommand{\cftsubsubparagraphfont}{\normalfont\small}%
%
\renewcommand{\cftsubsubsubparagraphfont}{\normalfont\small}%
%
}%

\newcommand{\longtableofcontents}{%
\clearpage
\setuplongtoc
\tableofcontents
}%

% génération du fichier de style .ist
\begin{filecontents}{\jobname.ist}
% output main entry <entry> as: \item \idxmark{<entry>}, 
item_0 "\n\\item \\idxmark{"
delim_0 "}, "
% not forgetting the subitem case%    added 2008
item_x1 "} \n \\subitem "
% Wrap and uppercase head letters
heading_prefix "{\\bfseries\\hfil "
heading_suffix "\\hfil}\\nopagebreak\n"
headings_flag 1
\end{filecontents}

% génération du fichier de style .gst
\begin{filecontents}{\jobname.gst}
% Output style parameters
preamble "\\begin{theglossary}"
postamble "\n\\end{theglossary}\n"
item_0 "\n\\glossitem"
delim_0 "{\\memglonum{"
encap_suffix "}}}"
heading_prefix "{\\bfseries\\hfil "
heading_suffix "\\hfil}\\nopagebreak\n"
headings_flag 1
% Input style parameters
keyword "\\glossaryentry"
\end{filecontents}

\endinput

