%%
%% This is file `hecthese.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% hecthese.dtx  (with options: `class')
%% 
%% This is a stripped version of the original file.
%% 
%% Copyright 2017-2020 HEC Montreal
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% 
%% The latest version of this license is in
%% http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2008/05/04 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Benoit Hamel
%% <benoit.2.hamel@hec.ca>.
%% 
%% This work consists of the files hecthese.dtx, hecthese-fr.ins,
%% hecthese-en.ins, hecthese.pdf, hecthese-en.pdf
%% and the derived files listed in the README file.
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hecthese}[2020/08/24 v1.4 Class for dissertations and theses at HEC Montreal]
\RequirePackage{ifthen}

\newboolean{HEC@isPhD} % Le travail est une these ou non
\newboolean{HEC@isClassique} % Le travail est redige de maniere classique ou non
\newboolean{HEC@isPresRappFemme} % President rapporteur femme ou non
\newboolean{HEC@isDirRechFemme} % Directeur de la recherche femme ou non
\newboolean{HEC@isCodirRechFemme} % Codirecteur de la recherche femme ou non
\newboolean{HEC@isExamExtFemme} % Examinateur externe femme ou non
\newboolean{HEC@isRepDirFemme} % Representant du directeur femme ou non

\setboolean{HEC@isPhD}{true}
\setboolean{HEC@isClassique}{true}
\setboolean{HEC@isPresRappFemme}{false}
\setboolean{HEC@isDirRechFemme}{false}
\setboolean{HEC@isCodirRechFemme}{false}
\setboolean{HEC@isExamExtFemme}{false}
\setboolean{HEC@isRepDirFemme}{false}

\DeclareOption{10pt}{%
\PassOptionsToClass{10pt}{memoir}
}
\DeclareOption{11pt}{%
\PassOptionsToClass{11pt}{memoir}
}
\DeclareOption{12pt}{%
\PassOptionsToClass{12pt}{memoir}
}

\DeclareOption{mscclassique}{%
\setboolean{HEC@isPhD}{false}
\setboolean{HEC@isClassique}{true}
}
\DeclareOption{mscarticles}{%
\setboolean{HEC@isPhD}{false}
\setboolean{HEC@isClassique}{false}
}
\DeclareOption{phdclassique}{%
\setboolean{HEC@isPhD}{true}
\setboolean{HEC@isClassique}{true}
}
\DeclareOption{phdarticles}{%
\setboolean{HEC@isPhD}{true}
\setboolean{HEC@isClassique}{false}
}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ExecuteOptions{12pt} % Taille par defaut
\ProcessOptions
\LoadClass{memoir}


\RequirePackage[utf8]{inputenc} % Pour ecrire les diacritiques directement
\RequirePackage[T1]{fontenc} % Utilisation des polices T1
\RequirePackage{natbib} % A inclure avant babel

\ifthenelse{\boolean{HEC@isClassique}}{}{%
\RequirePackage{chapterbib} % Bibliographies multiples pour les articles
}
\RequirePackage{babel} % Support multilingue
\RequirePackage[autolanguage]{numprint}
\RequirePackage{calc} % Necessaire pour la liste des abreviations
\RequirePackage{enumitem} % Necessaire pour la liste des abreviations
\RequirePackage{tocvsec2} % Pour determiner la profondeur de la TDM
\RequirePackage{graphicx} % Insertion de graphiques et d'images
\RequirePackage{color} % Gestion des couleurs
\RequirePackage{amsmath} % Package obligatoire pour les maths
\RequirePackage{iflang} % Detection de la langue


\pagestyle{plain} % Numero de page centre au pied de page
\renewcommand{\baselinestretch}{1.5} % Interligne et demie
\setlength{\topmargin}{0cm} % Marge du haut
\setlength{\oddsidemargin}{1.5cm} % Marge de gauche des pages impaires
\setlength{\evensidemargin}{1.5cm} % Marge de gauche des pages paires
\setlength{\textwidth}{15cm} % Largeur du bloc de texte
\setlength{\textheight}{21.9cm} % Hauteur du bloc de texte
\setlength{\marginparwidth}{0pt} % Suppression des notes de marge
\setlength{\marginparsep}{0pt} % Suppression du separateur de marge
\setlength{\headheight}{0pt} % Suppression de l'entete
\setlength{\headsep}{0pt} % Suppression du separateur d'entete


\newcommand{\HEC@titre}{}
\newcommand{\HEC@sousTitre}{}
\newcommand{\HEC@auteur}{}
\newcommand{\HEC@optionPhD}{}
\newcommand{\HEC@optionMSc}{}
\newcommand{\HEC@moisDepot}{}
\newcommand{\HEC@anneeDepot}{}
\newcommand{\HEC@presidentRapporteur}{}
\newcommand{\HEC@directeurRecherche}{}
\newcommand{\HEC@codirecteurRecherche}{}
\newcommand{\HEC@universiteCodirecteur}{}
\newcommand{\HEC@membreJury}{}
\newcommand{\HEC@universiteMembreJury}{}
\newcommand{\HEC@examinateurExterne}{}
\newcommand{\HEC@universiteExaminateur}{}
\newcommand{\HEC@representantDirecteur}{}

\newcommand{\HECtitre}[1]{%
\renewcommand{\HEC@titre}{#1}
}
\newcommand{\HECtitle}[1]{\HECtitre{#1}}

\newcommand{\HECsoustitre}[1]{%
\renewcommand{\HEC@sousTitre}{#1}
}
\newcommand{\HECsubtitle}[1]{\HECsoustitre{#1}}

\newcommand{\HECauteur}[1]{%
\renewcommand{\HEC@auteur}{#1}
}
\newcommand{\HECauthor}[1]{\HECauteur{#1}}

\newcommand{\HECoption}[1]{%
\ifthenelse{\boolean{HEC@isPhD}}{%
\renewcommand{\HEC@optionPhD}{#1}
}{%
\renewcommand{\HEC@optionMSc}{#1}
}
}

\newcommand{\HECmoisDepot}[1]{%
\renewcommand{\HEC@moisDepot}{#1}
}
\newcommand{\HECsubMonth}[1]{\HECmoisDepot{#1}}

\newcommand{\HECanneeDepot}[1]{%
\renewcommand{\HEC@anneeDepot}{#1}
}
\newcommand{\HECsubYear}[1]{\HECanneeDepot{#1}}

\newcommand{\HECpresidentRapporteur}[2]{%
\renewcommand{\HEC@presidentRapporteur}{#1}
\ifthenelse{\equal{#2}{F}}{%
\setboolean{HEC@isPresRappFemme}{true}
}{%
\setboolean{HEC@isPresRappFemme}{false}
}
}

\newcommand{\HECrapporteurPresident}[2]{\HECpresidentRapporteur{#1}{#2}}
\newcommand{\HECdirecteurRecherche}[2]{%
\renewcommand{\HEC@directeurRecherche}{#1}
\ifthenelse{\equal{#2}{F}}{%
\setboolean{HEC@isDirRechFemme}{true}
}{%
\setboolean{HEC@isDirRechFemme}{false}
}
}
\newcommand{\HECresearchDirector}[2]{\HECdirecteurRecherche{#1}{#2}}

\newcommand{\HECcodirecteurRecherche}[2]{%
\renewcommand{\HEC@codirecteurRecherche}{#1}
\ifthenelse{\equal{#2}{F}}{%
\setboolean{HEC@isCodirRechFemme}{true}
}{%
\setboolean{HEC@isCodirRechFemme}{false}
}
}
\newcommand{\HECresearchCodirector}[2]{\HECcodirecteurRecherche{#1}{#2}}

\newcommand{\HECuniversiteCodirecteur}[1]{%
\renewcommand{\HEC@universiteCodirecteur}{#1}
}
\newcommand{\HECcodirectorUniversity}[1]{\HECuniversiteCodirecteur{#1}}

\newcommand{\HECmembreJury}[1]{%
\renewcommand{\HEC@membreJury}{#1}
}
\newcommand{\HECjuryMember}[1]{\HECmembreJury{#1}}

\newcommand{\HECuniversiteMembreJury}[1]{%
\renewcommand{\HEC@universiteMembreJury}{#1}
}
\newcommand{\HECjuryMemberUniversity}[1]{\HECuniversiteMembreJury{#1}}

\newcommand{\HECexaminateurExterne}[2]{%
\renewcommand{\HEC@examinateurExterne}{#1}
\ifthenelse{\equal{#2}{F}}{%
\setboolean{HEC@isExamExtFemme}{true}
}{%
\setboolean{HEC@isExamExtFemme}{false}
}
}
\newcommand{\HECexternalExaminator}[2]{\HECexaminateurExterne{#1}{#2}}

\newcommand{\HECuniversiteExaminateur}[1]{%
\renewcommand{\HEC@universiteExaminateur}{#1}
}
\newcommand{\HECexaminatorUniversity}[1]{\HECuniversiteExaminateur{#1}}

\newcommand{\HECrepresentantDirecteur}[2]{%
\renewcommand{\HEC@representantDirecteur}{#1}
\ifthenelse{\equal{#2}{F}}{%
\setboolean{HEC@isRepDirFemme}{true}
}{%
\setboolean{HEC@isRepDirFemme}{false}
}
}
\newcommand{\HECdirectorRepresentative}[2]{\HECrepresentantDirecteur{#1}{#2}}


\newcommand{\HECpdfauteur}{\HEC@auteur}
\newcommand{\HECpdftitre}{\HEC@titre}


\newcommand{\HEC@pageTitrePhD}{%
\begin{titlingpage}
\centering
\begin{SingleSpace}
{\Large HEC MONTR\'{E}AL}\\
\'{E}cole affili\'{e}e \`{a} l'Universit\'{e} de Montr\'{e}al
\vfill
{\bfseries\HEC@titre
\ifthenelse{\equal{\HEC@sousTitre}{}}%
{ \\ }%
{~: \\ \HEC@sousTitre} 
\vfill
par \\
\HEC@auteur}
\vfill
Th\`{e}se pr\'{e}sent\'{e}e en vue de l'obtention du grade de Ph. D. en administration \\
(sp\'{e}cialisation \HEC@optionPhD)
\vfill
\HEC@moisDepot~\HEC@anneeDepot
\vfill
\copyright~\HEC@auteur, \HEC@anneeDepot
\end{SingleSpace}
\end{titlingpage}
}


\newcommand{\HEC@pageIdentificationJury}{%
\begin{titlingpage*}
\centering
\begin{SingleSpace}
{\Large HEC MONTR\'{E}AL}\\
\'{E}cole affili\'{e}e \`{a} l'Universit\'{e} de Montr\'{e}al
\vfill
Cette th\`{e}se intitul\'{e}e :
\vfill
{\bfseries\HEC@titre
\ifthenelse{\equal{\HEC@sousTitre}{}}%
{ \\ }%
{~: \\ \HEC@sousTitre}}
\vfill
Pr\'{e}sent\'{e}e par :
\vfill %
{\bfseries \HEC@auteur}
\vfill
a \'{e}t\'{e} \'{e}valu\'{e}e par un jury compos\'{e} des personnes suivantes :
\vfill
\HEC@presidentRapporteur \\
HEC Montr\'{e}al \\
\ifthenelse{\boolean{HEC@isPresRappFemme}}%
{Pr\'{e}sidente-rapportrice}%
{Pr\'{e}sident-rapporteur}
\vfill
\HEC@directeurRecherche \\
HEC Montr\'{e}al \\
\ifthenelse{\boolean{HEC@isDirRechFemme}}%
{Directrice de recherche}%
{Directeur de recherche}
\vfill
\HEC@codirecteurRecherche \\
\HEC@universiteCodirecteur \\
\ifthenelse{\boolean{HEC@isCodirRechFemme}}%
{Codirectrice de recherche}%
{Codirecteur de recherche}
\vfill
\HEC@membreJury \\
\HEC@universiteMembreJury \\
Membre du jury
\vfill
\HEC@examinateurExterne \\
\HEC@universiteExaminateur \\
\ifthenelse{\boolean{HEC@isExamExtFemme}}%
{Examinatrice externe}%
{Examinateur externe}
\vfill
\HEC@representantDirecteur \\
HEC Montr\'{e}al \\
\ifthenelse{\boolean{HEC@isRepDirFemme}}{%
Repr\'{e}sentante du directeur de HEC Montr\'{e}al}{%
Repr\'{e}sentant du directeur de HEC Montr\'{e}al}
\end{SingleSpace}
\end{titlingpage*}
}


\newcommand{\HEC@pageTitreMSc}{%
\begin{titlingpage}
\centering
\begin{SingleSpace}
{\Large HEC MONTR\'{E}AL}
\vfill
{\bfseries\HEC@titre
\ifthenelse{\equal{\HEC@sousTitre}{}}%
{\\[12pt]}%
{~: \\ \HEC@sousTitre \\[12pt]}
par \\[12pt]
\HEC@auteur
\vfill
\HEC@directeurRecherche \\
HEC Montr\'{e}al \\
\ifthenelse{\boolean{HEC@isDirRechFemme}}%
{Directrice de recherche}%
{Directeur de recherche}
\vfill %
Sciences de la gestion \\%
(Sp\'{e}cialisation \HEC@optionMSc)}
\vfill
\emph{M\'{e}moire pr\'{e}sent\'{e} en vue de l'obtention \\ %
du grade de ma\^{i}trise \`{e}s sciences \\ %
(M. Sc.)}
\vfill
\HEC@moisDepot~\HEC@anneeDepot \\ %
\copyright~\HEC@auteur, \HEC@anneeDepot
\end{SingleSpace}
\end{titlingpage}
}


\newcommand{\HECpagestitre}{%
\ifthenelse{\boolean{HEC@isPhD}}{%
\HEC@pageTitrePhD
\HEC@pageIdentificationJury
}{%
\HEC@pageTitreMSc
}
}
\newcommand{\HECtitlepages}{\HECpagestitre}


\newcommand{\HECtitreIntroduction}{Introduction}
\newcommand{\HECtitreConclusion}{Conclusion}
\newcommand{\HECgenererTitres}{%
\ifthenelse{\boolean{HEC@isClassique}}{}{%
\IfLanguageName{english}{%
\renewcommand{\HECtitreIntroduction}{General Introduction}
\renewcommand{\HECtitreConclusion}{General Conclusion}
}{%
\renewcommand{\HECtitreIntroduction}{Introduction g\'{e}n\'{e}rale}
\renewcommand{\HECtitreConclusion}{Conclusion g\'{e}n\'{e}rale}
}
}
}


\newcommand{\HECtdmAbreviations}{%
\IfLanguageName{english}{List of acronyms}{Liste des abr\'{e}viations}
}

\newcommand{\HECtdmRemerciements}{%
\IfLanguageName{english}{Acknowledgements}{Remerciements}
}

\newcommand{\HECtdmAvantPropos}{%
\IfLanguageName{english}{Preface}{Avant-propos}
}

\newcommand{\HECtdmCadreTheorique}{%
\IfLanguageName{english}{Theoretical framework}{Cadre th\'{e}orique}
}

\newcommand{\HECtdmRevueLitterature}{%
\IfLanguageName{english}{Literature review}{Revue de la litt\'{e}rature}
}

\newcommand{\HECtdmResumeArticle}{%
\IfLanguageName{english}{Abstract}{R\'{e}sum\'{e}}
}


\newcommand{\HECbibliographieArticle}{%
\renewcommand{\bibsection}{%
\IfLanguageName{english}{% 
\renewcommand{\bibname}{References}
}{%
\renewcommand{\bibname}{R\'{e}f\'{e}rences}
}
\section*{\bibname}
\bibmark
\ifnobibintoc\else
\phantomsection\addcontentsline{toc}{section}{\bibname}
\fi
\prebibhook
}
}

\newcommand{\HECbibliographieGenerale}{%
\renewcommand{\bibsection}{%
\IfLanguageName{english}{%
\renewcommand{\bibname}{Bibliography}
}{%
\renewcommand{\bibname}{Bibliographie g\'{e}n\'{e}rale}
}
\chapter*{\bibname}
\bibmark
\ifnobibintoc\else
\phantomsection\addcontentsline{toc}{chapter}{\bibname}
\fi
\prebibhook
}
}


\newsavebox{\bibliographieCachee}

\newcommand{\HECreferences}[2]{%
\bibliographystyle{#1}
\savebox\bibliographieCachee{\parbox{\textwidth}{\bibliography{#2}}}
}


\newenvironment{HECdedicace}{%
\vfill
\hfill
\begin{minipage}{0.5\textwidth}
\itshape}%
{%
\end{minipage}
\vfill%
}
\newenvironment{HECdedication}{\begin{HECdedicace}}{\end{HECdedicace}}

\newenvironment{HECabreviations}[1]{%
\begin{description}[leftmargin=!,labelwidth=\widthof{\bfseries #1}]}%
{%
\end{description}%
}
\newenvironment{HECabbreviations}[1]{%
\begin{HECabreviations}{#1}}%
{\end{HECabreviations}}


\addto\captionsfrench{%
\renewcommand{\listfigurename}{Liste des figures}
\renewcommand{\indexname}{Index analytique}
}
\endinput
%%
%% End of file `hecthese.cls'.
