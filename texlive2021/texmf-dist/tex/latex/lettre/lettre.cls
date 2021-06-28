%^^A file name   : `lettre.cls'.
%^^A package name: lettre
%^^A maintenance : Vincent Belaïche (vincentb1@users.sourceforge.net)
%^^A author      : Denis Mégevand - Observatoire de Genève
%^^A email       : vincentb1@users.sourceforge.net
%^^A version     : v3.002
%^^A date        : 
%^^A
%^^A This file is part of the "lettre" package.
%^^A This work may be distributed and/or modified under the conditions of the
%^^A LaTeX Project Public License, either version 1.3 of this license or (at your
%^^A option) any later version.  The latest version of this license is in
%^^A http://www.latex-project.org/lppl.txt and version 1.3 or later is part of all
%^^A distributions of LaTeX version 2005/12/01 or later.
%^^A
%^^A This work has the LPPL maintenance status `maintained'.
%^^A
%^^A The Current Maintainer of this work is Vincent Belaïche.
%^^A
%^^A This work consists of all files listed in file README
%^^A
%
%\subsection{Préambule}
%    \begin{macrocode}
\NeedsTeXFormat{LaTeX2e}
%    \end{macrocode}
%\changes{2.354}{2014-09-19}{Ajout \texttt{etoolbox} requis: c'est pour avoir \cs{ifcsundef}}%
%    \begin{macrocode}
\RequirePackage{etoolbox}
%    \end{macrocode}
%    \begin{macrocode}
\RequirePackage{graphicx}
%    \end{macrocode}
%    \begin{macrocode}
\ProvidesClass{lettre}[ v3.002]%
\typeout{Copyleft Denis Megevand - Observatoire de Geneve}%
%    \end{macrocode}
%\subsection{Déclaration des options de paquetage}
%\subsubsection{Options pour la mise en forme}
%    \begin{macrocode}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
%    \end{macrocode}
% \changes{2.351}{2014-07-26}{Ajout option \texttt{a4paper}}%
% \changes{2.354}{2014-10-02}{Ajout options \texttt{letterpaper},
% \texttt{legalpaper}, \texttt{executivepaper}, \texttt{b5paper} et
% \texttt{a5paper}, pour cela on définit les longueurs \cs{lettre@x@mm}
% et \cs{lettre@y@mm}}%
% La longueur \cs{lettre@x@mm} et \cs{lettre@y@mm} permettent de
% ramener les longueurs données pour du format A4 dans le format
% courant. C'est à dire que la longueur \cs{lettre@x@mm} est telle
% que~:
% \[\cs{lettre@x@mm} =
% \frac{\cs{paperwidth}}{\SI{210}{\milli\metre}}\si{\milli\metre}\]
% De même la longueur \cs{lettre@y@mm} est telle que~:
% \[\cs{lettre@y@mm} =
% \frac{\cs{paperheight}}{\SI{297}{\milli\metre}}\si{\milli\metre}\]
%    \begin{macrocode}
\newlength\lettre@x@mm
\setlength\lettre@x@mm{1mm}%
\newlength\lettre@y@mm
\setlength\lettre@y@mm{1mm}
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}%
    \lettre@x@mm=1mm%
    \lettre@y@mm=1mm%
  }
%    \end{macrocode}
%    \begin{macrocode}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11.00in}%
    \setlength\paperwidth  {8.50in}%
    \lettre@y@mm=0.94074074074mm%
    \lettre@x@mm=1.0280952381mm%
  }
\DeclareOption{legalpaper}
   {\setlength\paperheight {14.00in}%
    \setlength\paperwidth  {8.50in}%
    \lettre@y@mm=1.19730639731mm%
    \lettre@x@mm=1.0280952381mm%
  }
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.50in}%
    \setlength\paperwidth  {7.25in}%
    \lettre@y@mm=0.897979797979mm%
    \lettre@x@mm=0.876904761905mm%
}
\DeclareOption{b5paper}
   {\setlength\paperheight {250.00mm}%
    \setlength\paperwidth  {176.00mm}%
    \lettre@y@mm=0.841750841751mm%
    \lettre@x@mm=0.838095238095mm%
}
\DeclareOption{a5paper}
   {\setlength\paperheight {210.00mm}%
    \setlength\paperwidth  {148.00mm}%
    \lettre@y@mm=0.707070707071mm%
    \lettre@x@mm=0.704761904762mm%
}
\fi
\if@compatibility
  \DeclareOption{twoside}{\ClassError{lettre}{No `twoside' layout for letters}%
     {LaTeX2e is running in compatibility mode, in this mode there is no `twoside'
     layout for letters}}
\else
  \DeclareOption{twoside}{\@twosidetrue}
\fi
\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{origdate}{\@origdatetrue\l@@info{Mode `origdate'}}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
%    \end{macrocode}
%\changes{3.000}{2015-12-28}{Ajout option \texttt{keep envs}}%
%\changes{3.001}{2019-07-23}{Refonte implémentation option \texttt{keep envs}, pour prendre en charge détection auto.}%
%    \begin{macrocode}
\DeclareOption{keepenvs=true}{\lettre@keep@envs1}%
\DeclareOption{keepenvs=false}{\lettre@keep@envs2}%
\DeclareOption{keepenvs}{\ExecuteOptions{keepenvs=true}}%
%    \end{macrocode}
%\subsubsection{Options pour la langue}
% Tout d'abord on se fait un petit itérateur, histoire de gérer l'ensemble des langues de façon
% programatique. Le principe c'est que si on appelle
% \cs{lettre@iterate}\meta{liste}\texttt{,}\cs{@nil}\texttt{,}, alors \cs{lettre@iterate@body} est appelé sur
% chaque élément de la liste \meta{liste} qui est une liste dont les items sont séparés par des virgules.
%    \begin{macrocode}
\def\lettre@iterate#1,{%
    {%
      \def\@tempa{#1}%
      \ifx\@tempa\@nnil
        \let\@tempa\@empty
      \else
        \def\@tempa{%
          \lettre@iterate@body{#1}%
          \lettre@iterate
        }%
      \fi
      \expandafter
    }\@tempa
}%
%    \end{macrocode}
%\begin{macro}{\lettre@supported@language@list}
%  Liste des langues prises en charge par la classe \texttt{lettre}. C'est une liste dont les éléments sont
%  séparés par des virgules (sans espaces ni éléments vides). Chaque élément de la liste est un langage pour
%  lequel \texttt{lettre} a une option de langue et est capable de charger les définitions
%  correspondantes. La raison d'être de cette liste est de factoriser les itérations pour les cas suivants:
% \begin{itemize}
% \item charger les définitions lorsque le langage en question est utilisé par \texttt{babel} ou \texttt{mlp}~;
% \item charger les définitions lorsque le langage est demandé par une option de classe.
% \end{itemize}
%    \begin{macrocode}
\newcommand*\lettre@supported@language@list{%
  francais,french,frenchb,romand,%
  allemand,german,germanb,ngerman,ngermanb,%
  americain,american,USenglish,%
  anglais,english,british,UKenglish%
}%
%    \end{macrocode}
%\end{macro}
% Cependant, toutes les langues \meta{langue} dans \cs{lettre@supported@language@list} ne correspondent pas à
% un fichier \texttt{lettre-}\meta{langue}\texttt{.ldf}, car certaines ne sont que des alias. Aussi on commence
% par définir que par défaut une langue n'a pas d'alias (en d'autres termes elle est l'alias d'elle-même).
%    \begin{macrocode}
\newcommand*\lettre@iterate@body[1]{%
  \expandafter\def\csname lettre@#1@alias@of\endcsname{#1}}%
\expandafter\lettre@iterate\lettre@supported@language@list,\@nil,%
%    \end{macrocode}
%  Ceci étant fait, on définit celles des langues qui sont des alias d'une autre langue~:
%    \begin{macrocode}
\def\@tempa#1#2{\expandafter\def\csname lettre@#1@alias@of\endcsname{#2}}%
\@tempa{frenchb}{french}
\@tempa{francais}{french}
\@tempa{allemand}{german}
\@tempa{germanb}{german}
\@tempa{ngermanb}{german}
\@tempa{ngerman}{german}
\@tempa{anglais}{english}
\@tempa{british}{english}
\@tempa{american}{USenglish}
\@tempa{americain}{USenglish}
%    \end{macrocode}
% \DescribeMacro{\lettre@languages} \cs{lettre@languages} contient la liste des langues pour lesquelles les
% définitions ont été chargées. Le chargement ne se fait pas immédiatement, mais après le \cs{ProcessOption} de
% sorte à rendre possible que dans le fichier de définitions il y ait un \cs{RequirePackage}. Cette
% possibilité n'est pas utilisée actuellement.
%    \begin{macrocode}
\newcommand*\lettre@languages{}%
%    \end{macrocode}
% \DescribeMacro{\lettre@mainlang}\cs{lettre@mainlang} est la langue demandée par l'utilisateur. C'est
% nécessairement un élément de la liste \cs{lettre@supported@language@list}.
%    \begin{macrocode}
\newcommand*\lettre@mainlang{}%
%    \end{macrocode}
% \DescribeMacro{\lettre@ldf@version} \cs{lettre@ldf@version}\marg{lang} est la version de chaque fichier
% \texttt{lettre-}\meta{langue}\texttt{.ldf}
%    \begin{macrocode}
\newcommand*\lettre@ldf@filename[1]{lettre-#1.ldf}%
\newcommand*\lettre@ldf@version[1]{ver@\lettre@ldf@filename{#1}}%
%    \end{macrocode}
% Toutes ces langues \meta{langue} n'ont pas leur propre fichier de définition
% \texttt{lettre-\meta{langue}.ldf}, en effet certaines de ces langues ne sont juste que des alias.
% \changes{3.000}{2015-12-20}{Listage des options de langue dans \cs{lettre@languages} dans l'ordre de
% déclaration au sein de \cs{documentclass}}%
%
% Par contre pour chacune des ces \meta{langue} une option \meta{langue} est définie, c'est l'une des façons
% dont l'utilisateur peut charger les définitions correspondant à cette langue. La dernière options passée
% donne la langue par défaut au début du document.
%    \begin{macrocode}
\def\lettre@iterate@body#1{%
  \DeclareOption{#1}{%
    \edef\@tempa{\csname lettre@#1@alias@of\endcsname}%
    \ifcsundef{\lettre@ldf@version{\@tempa}}{%
      \expandafter\def\csname \lettre@ldf@version{\@tempa}\endcsname{To be loaded}%
       \ifx\lettre@languages\@empty
          \def\lettre@languages{#1}%
       \else
          {%
            \toks0{#1}%
            \toks1\expandafter{\lettre@languages}%
            \edef\@tempa{\noexpand\def\noexpand\lettre@languages{\the\toks0,\the\toks1}}%
          \expandafter
          }\@tempa
       \fi
       \def\lettre@mainlang{#1}%
    }{%
      \l@@info{Langage `#1' deja charge par option}%
    }%
  }%
}%
\expandafter\lettre@iterate\lettre@supported@language@list,\@nil,%
%    \end{macrocode}
% \changes{3.000}{2015-12-20}{Ajout option \texttt{pass lang}}%
%    \begin{macrocode}
\DeclareOption{passlang=true}{\lettre@pass@langtrue}%
\DeclareOption{passlang=false}{\lettre@pass@langfalse}%
\DeclareOption{passlang}{\ExecuteOptions{pass lang=true}}%
%    \end{macrocode}
%\changes{2.354}{2014-10-04}{Ajout des options \texttt{noinfo}, \texttt{loghighlight}, et \texttt{strict}}%
%\subsubsection{Options pour la gestion des relevés du journal de compliation}
% Le journal de compilation est le fichier \meta{jobname}\texttt{.log} produit par la compilation. Il contient
% des relevés de trois types : erreur, avertissement, et info.
%
% Suppression des relevés d'info dans le journal, on peut aussi faire ça avec la commande \cs{noinfo} mais dans
% ce cas on aura quand même, s'il en est, les relevés d'info provoqués par le traitement des options.
%    \begin{macrocode}
\DeclareOption{noinfo}{\c@infos=0}
%    \end{macrocode}
% Désactive ou active les traces de type \texttt{LETTRE INFO ===} ou \texttt{LETTRE AVERTISSEMENT ===} placé au
% début des relevés. Elles ne sont pas utiles dans un environnement de développement qui colorise le journal.
%\changes{2.354}{2015-11-30}{Remplacement option `nologhighlight' par `loghighlight=false'}%
%    \begin{macrocode}
\DeclareOption{loghighlight=false}{\lettre@loghighlightfalse}
\DeclareOption{loghighlight=true}{\lettre@loghighlighttrue}
\DeclareOption{loghighlight}{\ExecuteOptions{loghighlight=true}}
%    \end{macrocode}
%    Mue certains relevés d'avertissement en relevés d'erreur, rendant ainsi la classe moins permissive.
%\changes{2.354}{2015-11-30}{Ajout options `strict=false' \& `strict=true'}%
%    \begin{macrocode}
\DeclareOption{strict}{\ExecuteOptions{strict=true}}
\DeclareOption{strict=true}{\lettre@stricttrue\l@@info{Mode `strict': traite certains avertissements comme des erreurs}}
\DeclareOption{strict=false}{\lettre@strictfalse\l@@info{Mode `strict' desactive}}
%    \end{macrocode}
%\subsubsection{Options par défaut}
%    \begin{macrocode}
\if@compatibility\else
  \DeclareOption*{\l@@warning{Option inconnue : `\CurrentOption', assurez-vous que
    c'est une option globale passee aux paquetages utilises dans votre document}}
\fi
%    \end{macrocode}
%\subsection{Messages et avertissements}
% Envoyés à la console et dans le fichier journal \meta{jobname}\texttt{.log}.
%
% On peut supprimer allumer ou éteindre en tout temps les
% relevés d'informations par les commandes \cs{infos} et \cs{noinfos}.
% Les avertissements ne peuvent être supprimés.  L'option \texttt{strict} fait que les avertissements causent
% une erreur en appelant \cs{ClassError} au lieu de \cs{ClassWarning}.
%\changes{2.354}{2014-10-04}{Ajout des options \texttt{noinfo}, \texttt{nologhighlight}, et \texttt{strict}}%
%    \begin{macrocode}
\def\l@@error#1{\ClassError{lettre}{#1}}%
\def\infos{\c@infos=1\relax}
\def\noinfos{\c@infos=0\relax}
\def\l@@warning{%
  \iflettre@loghighlight
  \typeout{LETTRE AVERTISSEMENT ===============================================}%
  \fi
  \ClassWarning{lettre}%
}
\def\l@@warning@strictable#1{%
  \iflettre@loghighlight
  \typeout{LETTRE AVERTISSEMENT ===============================================}%
  \fi
  \iflettre@strict
     \l@@error{#1}{#1\MessageBreak\space 
     Cette erreur est causee par un avertissement en mode strict}%
  \else
     \ClassWarning{lettre}{#1}%
  \fi
}
\def\l@@info#1{%
  \ifnum\c@infos=1 %
    \iflettre@loghighlight
    \typeout{LETTRE INFO ================================================}%
    \fi
    \GenericWarning{%
      (lettre)\space\space\space\space
    }{%
      Class lettre Message: #1\@gobble}%
  \fi}%
%    \end{macrocode}
%\subsection{Macros utiles aux fichier de définitions de langue}
% \DescribeMacro{\LettreProvidesLanguage}
%    \begin{macrocode}
\newcommand*{\LettreProvidesLanguage}[1]{%
  \ProvidesFile{lettre-#1.ldf}%
}%
%    \end{macrocode}
% \begin{macro}{\LettreDeclareLanguage}\cs{LettreDeclareLanguage}\marg{dialècte}\oarg{langue-de-base}\marg{définitions},
%   cette macro définit globalement soit une, soit deux macros~:
%   \begin{itemize}
%   \item La macro \cs{lettre@select@\meta{dialecte}@labels} est définie pour se développer en \meta{définitions}, et
%   \item La macro \cs{lettre@lmp@\meta{dialecte}@use} (où \og \texttt{lmp}\fg{} veut dire \og language for
%     multilang processor\fg) n'est définie que si l'argument optionnel \meta{langue-de-base} est fourni, et
%     auquel cas est définie pour se développer en \meta{langue-de-base}.
%   \end{itemize}
%    \begin{macrocode}
\newcommand*{\LettreDeclareLanguage}[1]{%
  \begingroup
%    \end{macrocode}
% La première chose qu'on fait c'est de mettre \meta{dialecte} dans \cs{toks0}. Quant à \cs{toks2} il
% contiendra le code définissant ou non la macro \cs{lettre@lmp@\meta{dialecte}@use}. La macro
% \cs{lettre@declare@language@arg@ii} sert à récupérer l'argument \meta{langue-de-base} lorsqu'il est présent.
%    \begin{macrocode}
     \toks0{#1}%
     \@ifnextchar[\lettre@declare@language@arg@ii
     {%
%    \end{macrocode}
% En cas d'absence de l'argument optionnel \meta{langue-de-base} \cs{toks2} est donc vide, puisqu'on ne
% définit pas \cs{lettre@lmp@\meta{dialecte}@use}~:
%    \begin{macrocode}
       \toks2{}%
%    \end{macrocode}
% La macro \cs{lettre@declare@language@arg@iii} sert à récupérer l'argument \meta{définitions}~:
%    \begin{macrocode}
       \lettre@declare@language@arg@iii
     }%
}%
\ifcsdef{lettre@declare@language@arg@ii}{%
  \l@@error{Macro \protect\lettre@declare@language@arg@ii\space dej'a d'efinie}%
}{}%
\def\lettre@declare@language@arg@ii[#1]{%
   \def\@tempa##1{%
     \toks2{\gdef##1{#1}}
   }%
   \expandafter\@tempa\csname lettre@lmp@\the\toks0@use\endcsname
  \lettre@declare@language@arg@iii}
\newcommand*\lettre@declare@language@arg@iii[1]{%
  \toks3{#1}%
  \edef\@tempa{%
    \noexpand\ifcsdef{lettre@select@\the\toks0 @labels}{%
      \noexpand\l@@error{Macro `\string\lettre@select@\the\toks0 @labels\space
        d'ej`a d'efinie}%
    }{%
      \noexpand\gdef
      \expandafter\noexpand\csname lettre@select@\the\toks0@labels\endcsname{%
        \the\toks3}%
      \the\toks2 %
    }%
  }%
  \expandafter\endgroup\@tempa
}%
%    \end{macrocode}
% \end{macro}
% 
%\subsection{Déclaration des sorties des options de paquetage, et exécutions des options}
%\label{sec:sortie-opt-pako}
%    \begin{macrocode}
\newcommand\@ptsize{}
\newcount\c@infos\c@infos=1\relax
\newif\if@origdate\@origdatefalse
\newif\if@etiq\@etiqfalse
%    \end{macrocode}
% \changes{3.000}{2015-12-20}{Ajout option \texttt{pass lang}}%
%    \begin{macrocode}
\newif\iflettre@pass@lang\lettre@pass@langtrue
%    \end{macrocode}
% \changes{3.001}{2019-07-23}{Option \texttt{keep envs} avec détection par défaut}%
% L'option \texttt{keep envs} se traduit dans le compteur \cs{lettre@keep@envs} de la manière suivante~:\\
% \begin{tabular}{>{\rrab}p{3cm}p{\dimexpr\linewidth-3cm-4\tabcolsep}}\toprule
%     \cs{lettre@keep@envs}&Signification\\\midrule
%     0&Détection automatique du comportement \texttt{keep envs=true}, ou \texttt{keep envs=false}\\
%     1&Correspond à \texttt{keep envs=true}, c.-à-d.\  que \texttt{lettre} ne redéfinit pas les
%          environnements \texttt{itemize} et consorts\\
%     2&Correspond à \texttt{keep envs=false}, c.-à-d.\  que \texttt{lettre} redéfinit selon la langue les
%          environnements \texttt{itemize} et consorts\\\bottomrule
% \end{tabular}
%    \begin{macrocode}
\newcount\lettre@keep@envs
\lettre@keep@envs0 %
\newif\iflettre@strict\lettre@strictfalse
\newif\iflettre@loghighlight\lettre@loghighlightfalse
\ExecuteOptions{10pt,oneside,final}
\ProcessOptions
%    \end{macrocode}
% Chargement des définitions de langue. On fait un \cs{input} de tous les fichiers \meta{nomfic} dont la macro
% version \cs{ver@}\meta{nomfic} a été durant le traitements des options configurée à \og To be loaded\fg.
%    \begin{macrocode}
\def\lettre@iterate@body#1{%
  \edef\@tempa{\csname lettre@#1@alias@of\endcsname}%
  \def\@tempb{To be loaded}%
  \edef\@tempc{\lettre@ldf@version{\@tempa}}%
  \expandafter\ifx\csname\@tempc\endcsname\@tempb
     \expandafter\let\csname\@tempc\endcsname\undefined
     \input{\lettre@ldf@filename{\@tempa}}
  \fi
}%
\expandafter\lettre@iterate\lettre@supported@language@list,\@nil,%
%    \end{macrocode}
% Passage des options de langue au paquetages tels
% \texttt{babel}.\newline\DescribeMacro{\lettre@languageable@packages}Tout d'abord on se fait une liste de
% paquetages auxquels passer les options de langues. C'est à dire qu'on gère ces options comme si elles étaient
% globales vis à vis de ces paquetages là seulement.
%    \begin{macrocode}
\newcommand\lettre@languageable@packages{babel,fmtcount,mlp}%
%    \end{macrocode}
% Maintenant on passe toutes les options stockées dans \cs{lettre@languages} à tous les paquetage listés dans
% \cs{lettre@languageable@packages}.
%    \begin{macrocode}
\ifx\lettre@languages\@empty\else
%    \end{macrocode}
% \changes{3.000}{2015-12-20}{Ajout option \texttt{pass lang}}%
%    \begin{macrocode}
  \iflettre@pass@lang
    \def\lettre@iterate@body#1{%
      \let\@tempb\lettre@iterate@body
      \def\lettre@iterate@body##1{\PassOptionsToPackage{#1}{##1}%
        \l@@info{Option `#1' pass'ee au paquetage `##1'}%
      }%
      \expandafter\lettre@iterate\lettre@languageable@packages,\@nil,%
      \let\lettre@iterate@body\@tempb
    }%
    \expandafter\lettre@iterate\lettre@languages,\@nil,%
  \fi
\fi
%    \end{macrocode}
%\subsection{Polices}
%    \begin{macrocode}
\input{size1\@ptsize.clo}
\DeclareOldFontCommand{\rm}{\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sl}{\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\it}{\itshape}{\mathit}
\DeclareOldFontCommand{\sc}{\scshape}{\@nomath\sc}
\DeclareOldFontCommand{\bf}{\bfseries}{\mathbf}
\DeclareOldFontCommand{\sf}{\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\ttfamily}{\mathtt}
\DeclareRobustCommand*{\cal}{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand*{\mit}{\@fontswitch{\relax}{\mathnormal}}
%    \end{macrocode}
%\subsubsection{Paramètres pour le contrôle des paragraphes}
%    \begin{macrocode}
\lineskip  1pt%
\normallineskip 1pt%
\parskip  .7em%
\parindent 0pt%
\topsep   .2em%
\partopsep 0pt%
\itemsep  .2em%
\renewcommand\baselinestretch{1}
%    \end{macrocode}
%
%    \begin{macrocode}
\@lowpenalty   51\relax
\@medpenalty  151\relax
\@highpenalty 301\relax
\@beginparpenalty -\@lowpenalty 
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
%    \end{macrocode}
%\subsubsection{Paramètres pour le contrôle de la mise en page}
%\changes{2.354}{2014-10-04}{Utilisation des longueurs \cs{lettre@x@mm} et \cs{lettre@y@mm} pour la prise en
% charge des options \texttt{letterpaper}, \texttt{legalpaper}, \texttt{executivepaper}, \texttt{b5paper} et
% \texttt{a5paper}.}%
% Marge supérieure
%    \begin{macrocode}
\topmargin        25\lettre@y@mm
%    \end{macrocode}
% suppression de l'offset vertical
%    \begin{macrocode}
\advance\topmargin by -1in
%    \end{macrocode}
% Separation d'entête   \SI{4}{\milli\metre}
%    \begin{macrocode}
\headheight        0pt%
\headsep           4\lettre@y@mm
%    \end{macrocode}
% hauteur texte  \SI{250}{\milli\metre}
%    \begin{macrocode}
\textheight      250\lettre@y@mm
%    \end{macrocode}
% sep d'embase     \SI{9}{\milli\metre}
%    \begin{macrocode}
\footskip          9\lettre@y@mm
%    \end{macrocode}
% Total vertical \(25+4+250+9=\SI{288}{\milli\metre}\), reste \SI{9}{\milli\metre} sur A4 = 297 mm.
%    \begin{macrocode}
\footnotesep       5\lettre@y@mm
\marginparpush     1\lettre@x@mm
%    \end{macrocode}
% marge gauche    \SI{25}{\milli\metre}
%    \begin{macrocode}
\oddsidemargin    25\lettre@x@mm
\evensidemargin   25\lettre@x@mm
%    \end{macrocode}
% suppression de l'offset horizontal
%    \begin{macrocode}
\advance\oddsidemargin by -1in
\advance\evensidemargin by -1in
%    \end{macrocode}
% largeur texte  160mm
%    \begin{macrocode}
\textwidth       160\lettre@x@mm
%    \end{macrocode}
% sep. note lat.  4mm
%    \begin{macrocode}
\marginparsep      4\lettre@x@mm
%    \end{macrocode}
% larg. note lat 15mm
%    \begin{macrocode}
\marginparwidth   15\lettre@x@mm
%    \end{macrocode}
%    Total horizontal \(25+160+4+15=\SI{204}{\milli\metre}\), reste \SI{6}{\milli\metre} sur A4 =
%    \SI{210}{\milli\metre}.
%    \begin{macrocode}
\skip\footins    4mm plus 2pt minus 4pt%
%    \end{macrocode}
%
%\subsection{Le format lettre et fax de l'observatoire de Genève}
%
%\subsubsection{newcounts, newdimens, newifs, et newwrite}
% Il y a aussi un \cs{newcount} dans la \S~\ref{sec:sortie-opt-pako}.
%    \begin{macrocode}
\newcount\auxcount
\newcount\c@labelstart
\newcount\c@lettre
\newcount\c@telefax
\newcount\emailcount
\newcount\faxpage
\newcount\sigflag
\newcount\signum
%
\newdimen\letterwidth
\newdimen\openingspace
\newdimen\openingindent
\newdimen\lettermargin
\newdimen\listmargin
\newdimen\sigspace
\newdimen\ssigindent
\newdimen\ssigwidth
\newdimen\msigwidth
\newdimen\fromaddress@let@width
\newdimen\fromlieu@let@width
\newdimen\toaddress@let@width
\newdimen\fromaddress@fax@width
\newdimen\faxstring@width
\newdimen\faxbox@width
\newdimen\toaddress@fax@width
\newdimen\fromname@fax@width
%    \end{macrocode}
%\changes{2.354}{2014-10-21}{Ajout \cs{lettre@vref@width} et \cs{lettre@nref@width}}%
%    \begin{macrocode}
\newlength\lettre@vref@width
\newlength\lettre@nref@width
%    \end{macrocode}
%Il y a aussi des \cs{newif} dans la \S~\ref{sec:sortie-opt-pako}.
%    \begin{macrocode}
\newif\if@letter\@lettertrue
\newif\if@detail\@detailfalse 
%    \end{macrocode}
% Fichiers auxiliaires
%    \begin{macrocode}
\newwrite\@tensionaux
\newwrite\@dateaux
\newwrite\@etiqaux
\newwrite\@faxaux
%    \end{macrocode}
%\subsubsection{Macros internes}
%\label{sec:macros-internes}
%    \begin{macrocode}
\let\lettre@par\@par
\@ifundefined{lettre@t}{}{\ClassError{lettre}{Definition en double}%
  {Redefinition de la macro \protect\lettre@t}}
\def\lettre@t#1#2{\begin{list}{#1}{\setlength{\labelsep}{10pt}%
      \setlength{\labelwidth}{\listmargin}%
      \setlength{\leftmargin}{\listmargin}%
      \setlength{\listparindent}{0pt}}%
  \item\relax #2%
  \end{list}}
\def\detailledaddress{\@detailtrue}%
%    \end{macrocode}
%    \begin{macrocode}
\def\stopletter{\vskip0ptplus1filll}%
\def\stopfax{\vskip0ptplus1filll}%
%    \end{macrocode}
%    \begin{macrocode}
\def\resetopenenv{%
        \faxpage=0\relax
        \csuse{\lettre@mainlang}%
        \def\concdecl{}%
        \def\fromlocation{}%
        }%
\def\resetcloseenv{
        \def\fromsig{}\def\fromssig{}\def\fromtsig{}
        \ps@plain
        \pagenumbering{arabic}       
        \onecolumn                   
        \signum=0\relax
        }
\def\resetauxenv{
        \def\auxflag{}
        \auxcount=0\relax
%    \end{macrocode}
% Les macro \cs{toref} et \cs{fromref} sont intialisé à \cs{space} de sorte à ce que par défaut la
% configuration de l'une des deux références entraîne l'affichage des deux boîtes de référence, avec
% éventuellement l'autre boîte à blanc (c.-à-d. contenant juste un espace).%
% \changes{2.354}{2014-10-21}{Un argument vide à \cs{Vref} ou \cs{Nref} supprime la référence}%
%    \begin{macrocode}
        \let\toref\space\let\fromref\space
        \def\telexnum{}\def\ccpnum{}
        }
\def\resetemailenv{
        \def\emailflag{}
        \emailcount=0\relax
        \def\@username{}
        \def\ccittnum{}\def\internetnum{}\def\bitnetnum{}%
        \def\telepacnum{}\def\decnetnum{}
        }
%    \end{macrocode}
% \DescribeMacro{\lettre@processto}\cs{lettre@processto} extrait \cs{toname} et \cs{toaddress} de l'argument
% adresse passé aux environnements \texttt{letter} ou \texttt{telefax}.
% \changes{3.001}{2017-08-10}{Renommage \cs{@processto}, \cs{@xproc} et \cs{yproc} pour préfixer par
% \texttt{lettre} afin d'être à l'épreuve du temps contre des conflits de nommage potentiels. Utilisation
% \cs{@nil} comme terminateur plutôt que \texttt{@@@} que l'utilisateur pourrait utiliser dans son adresse.}
%    \begin{macrocode}
\long\def\lettre@processto#1{\lettre@xproc #1\\\@nil\ifx\toaddress\@empty 
    \else \lettre@yproc #1\@nil\fi}%
\long\def\lettre@xproc #1\\#2\@nil{\def\toname{#1}\def\toaddress{#2}}%
\long\def\lettre@yproc #1\\#2\@nil{\def\toaddress{#2}}%
%    \end{macrocode}
% \DescribeMacro{\lettre@stopbreaks}La macro \cs{lettre@stopbreaks} fait rentrer dans un mode où l'on empèche
% les sauts de ligne.
% \changes{3.001}{2019-06-30}{Correction anomalie
% \href{https://puszcza.gnu.org.ua/bugs/index.php?428}{\#428}. Les
% \og\cs{def}\cs{par}\texttt{\{}\ldots\texttt{\}}\fg\ sont remplacés par des
% \og\cs{@setpar}\texttt{\{}\ldots\texttt{\}}\fg}
%    \begin{macrocode}
\def\lettre@stopbreaks{%
  \interlinepenalty \@M
   \@setpar{\@@par\nobreak\lettre@parshape}\let\\=\@nobreakcr
   \let\vspace\@nobreakvspace}%
\def\@nobreakvspace{\@ifstar{\@nobreakvspacex}{\@nobreakvspacex}}%
\def\@nobreakvspacex#1{\ifvmode\nobreak\vskip #1\relax\else
               \@bsphack\vadjust{\nobreak\vskip #1}\@esphack\fi}%
\def\@nobreakcr{\vadjust{\penalty\@M}\@ifstar{\@xnewline}{\@xnewline}}%
%    \end{macrocode}
% \DescribeMacro{\lettre@startbreaks}La macro \cs{lettre@startbreaks} fait rentrer dans un mode où l'on
% autorise les sauts de ligne.
%    \begin{macrocode}
\def\lettre@startbreaks{%
   \let\\=\@normalcr
   \interlinepenalty 200\relax
   \@setpar{\@@par\penalty -100\relax
   \lettre@parshape}}%
%    \end{macrocode}
%\subsection{Étiquettes}
% La commande \cs{startlabels} suivante définit des pages A4 de 2 colonnes d'étiquettes avec
% \SI{15}{\milli\metre} de marges gauche et droite sur chaque étiquette.  Si l'on change le nombre
% d'étiquettes sur une page, il faut aussi modifier la macro \cs{@startlabels}.
%\DescribeMacro{\startlabels}
%    \begin{macrocode}
\def\startlabels{%
\baselineskip=0pt\lineskip=0pt%
\pagestyle{empty}%
\let\@texttop=\relax
\topmargin=0pt\headsep=0pt%
\oddsidemargin=15mm\evensidemargin=15mm%
%    \end{macrocode}
% modifications des dimensions de la page à faire ici
%    \begin{macrocode}
\textheight=297mm\textwidth=180mm\columnsep=30mm%
\@colht=\textheight\@colroom=\textheight\vsize=\textheight
\small
\baselineskip=0pt\lineskip=0pt%
\boxmaxdepth=0pt%
\twocolumn\relax}%
%    \end{macrocode}
% La commande \cs{@startlabels} suivante définit la position de la 
% première étiquette sur la page, à partir de la valeur du 
% compteur \texttt{labelstart}.
%    \begin{macrocode}
\def\@startlabels{%
\l@@info{Position de la premiere etiquette: \the\c@labelstart}%
\ifnum\c@labelstart>\z@
    \ifnum\c@labelstart>16\relax 
        \l@@warning@strictable{Position de la premiere etiquette ignoree}%
    \else
    \@whilenum\c@labelstart>\@ne\do
        {\immediate\write\@etiqaux{\string\mlabel{~\string\\~}}%
         \advance\c@labelstart\m@ne}%
    \fi%
\else
    \l@@warning@strictable{Position de la premiere etiquette ignoree}%
\fi
}%
%    \end{macrocode}
%    \DescribeMacro{\mlabel}La commande \cs{mlabel}\marg{l'étiquette} fabrique une étiquette de
%    \SI{37}{\milli\metre} de hauteur, la largeur étant définie dans \cs{startlabels}
%    (\(\SI{105}{\milli\metre}-\SI{30}{\milli\metre}\) de marges) chacune contenant \SI{70}{\milli\metre} de
%    texte \meta{l'étiquette} au centre de l'étiquette.
%    \begin{macrocode}
\def\mlabel#1{\setbox0\vbox{\parbox[b]{70mm}{\rm\strut\ignorespaces #1}}%
         \vbox to 37mm{\vskip5mmplus1fil \box0 \vskip5mmplus1fil}}%
%    \end{macrocode}
%    \DescribeMacro{\makelabels}\cs{makelabels}\oarg{num label} demande à \verb+\begin{document}+ d'imprimer
%      sur le fichier auxiliaire \verb+.etq+ l'ordre de préparer les étiquettes.  Son argument optionnel
%      \meta{num label} est un numéro définissant quelle est la prochaine étiquette libre sur la page en
%      partant du numéro \(1\), de manière à utiliser des feuilles déjà partiellement utilisées. Dans ce cas,
%      \verb+\begin{document}+ imprime autant d'étiquettes vides que nécessaire.
%    \begin{macrocode}
\def\makelabels{%
    \@etiqtrue
    \l@@info{On demande des etiquettes}%
    \@ifnextchar [{\i@makelabels}{\i@makelabels[1]}}%
\def\i@makelabels[#1]{\c@labelstart=#1}%
%    \end{macrocode}
%\subsection{Interface utilisateur}
%\subsubsection{Adaptations des paramètres par défaut}
%\DescribeMacro{\institut}
% \changes{3.000}{2015-10-21}{Nom fichier institut en \texttt{lettre-\meta{institut}.cfg}}
%    \begin{macrocode}
\newcommand*\lettre@institut[1]{%
  \l@@info{Fichier de defaut: #1}%
  \def\lettre@input@institut{\makeatletter
                 \input{#1}%
                 \makeatother}}%
%    \end{macrocode}
% On prend en compte le cas où l'utilisateur malicieux aurait mis un chemin à l'institut. C'est surtout pour
% être rétro-compatible avec l'utilisation de l'extention \textsf{.ins} pour les fichiers instituts qu'on fait
% ça. On utilise la macro \cs{filename@parse} du noyeau \LaTeX\ dont le résultat l'analyse va dans les macros
% \cs{filename@area}, \cs{filename@base} et \cs{filename@ext}. On détourne \cs{filename@area} pour recevoir le
% nom du fichier insititut en \texttt{.cfg}.
%    \begin{macrocode}
\newcommand*\lettre@institut@parse[1]{%
  \filename@parse{#1}%
  \edef\filename@area{\filename@area lettre-\filename@base
    \unless\ifx\filename@ext\relax.\filename@ext\fi.cfg}%
}%
%    \end{macrocode}
% Avec l'option \texttt{strict} le fichier institut doit se nommer que \texttt{lettre-\meta{institut}.cfg}.
%    \begin{macrocode}
\iflettre@strict
\newcommand*\institut[1]{%
  \lettre@institut@parse{#1}%
  \expandafter\lettre@institut\expandafter{\filename@area}}%
\else
%    \end{macrocode}
% Sans l'option \texttt{strict} le fichier institut peut se nommer soit \texttt{lettre-\meta{institut}.cfg},
% soit \texttt{\meta{institut}.ins}, on teste la première possibilité en premier.
%    \begin{macrocode}
\newcommand*\institut[1]{%
  \lettre@institut@parse{#1}%
  \IfFileExists{\filename@area}{%
    \expandafter\lettre@institut\expandafter{\filename@area}}{%
    \l@@warning{Le nommage des fichiers instituts en `<institut>.ins' est obsolete,
      veuillez les nommer en `lettre-<institut>.cfg'}%
    \lettre@institut{#1.ins}}%
}
\fi
%    \end{macrocode}
%
%\subsubsection{Environnements letter et fax}
%
%\DescribeEnv{letter} L'environnement \cs{begin\{letter\}}\marg{adresse}\ldots\cs{end\{letter\}} définit une
% lettre
% \changes{2.354}{2014-09-19}{Utilisation de \protect\ifcsundef\space pour tester \protect\csname
% letter\protect\the\expandafter\protect\csname c@lettre\endcsname\protect\endcsname}
%    \begin{macrocode}
\long\def\letter#1{%
  \global\let\lettre@tns@vspace\lettre@letter@tns@vspace
  \rm
  \global\advance\c@lettre\@ne
  \l@@info{Lettre \the\c@lettre}%
  \ifcsundef{newletter\the\c@lettre}{%
     \expandafter\def\csname letter\the\c@lettre\endcsname{2}%
  }{%
     \expandafter\def\csname letter\the\c@lettre\endcsname{%
		\csname newletter\the\c@lettre\endcsname}%
  }%
  \ifodd\c@page%
  \else
    \if@twoside
      \l@@info{Saut de page force pour commencer la lettre sur une page impaire.}%
      \thispagestyle{empty}
      \hbox{}\penalty-10000\relax
    \fi
  \fi
  \c@page\@ne
%    \end{macrocode}
% \changes{2.354}{2014-10-22}{Correction bug \href{https://gna.org/bugs/?23959}{\#23959}~: \og\cs{c@footnote}
% n'est pas re-initialisé au début de chaque lettre\fg}
%    \begin{macrocode}
  \c@footnote0 %
  \resetopenenv\resetcloseenv\resetauxenv\resetemailenv
  \@lettertrue
  \lettre@input@institut
  \let\opening=\letteropening
  \interlinepenalty=200\relax
  \lettre@processto{#1}
}%
%    \end{macrocode}
%\DescribeEnv{endletter}
%    \begin{macrocode}
\def\endletter{\par
  \ifdim\pagetotal < 50pt
    \immediate\write\@tensionaux{%
          \string\expandafter\string\def%
          \string\csname\space newletter\the\c@lettre\string\endcsname{-2}}%
    \l@@warning{Longueur de la derniere page : \the\pagetotal < 50pt\MessageBreak
      tension de page modifiee a -2, veuillez recompiler}%
  \else
  \ifdim\pagetotal < 90pt
    \immediate\write\@tensionaux{%
          \string\expandafter\string\def%
          \string\csname\space newletter\the\c@lettre\string\endcsname{-4}}%
    \l@@warning{Longueur de la derniere page : \the\pagetotal < 90pt\MessageBreak
      tension de page modifiee a -4, veuillez recompiler}%
  \else
  \ifdim\pagetotal < 130pt
    \immediate\write\@tensionaux{%
          \string\expandafter\string\def%
          \string\csname\space newletter\the\c@lettre\string\endcsname{-5}}%
    \l@@warning{Longueur de la derniere page : \the\pagetotal < 130pt\MessageBreak
      tension de page modifiee a -5, veuillez recompiler}%
  \else
  \ifdim\pagetotal < 170pt
    \immediate\write\@tensionaux{%
          \string\expandafter\string\def%
          \string\csname\space newletter\the\c@lettre\string\endcsname{-6}}%
    \l@@warning{Longueur de la derniere page : \the\pagetotal < 170pt\MessageBreak
      tension de page modifiee a -6, veuillez recompiler}%
  \else
  \ifdim\pagetotal < 210pt
    \immediate\write\@tensionaux{%
          \string\expandafter\string\def%
          \string\csname\space newletter\the\c@lettre\string\endcsname{4}}%
    \l@@warning{Longueur de la derniere page : \the\pagetotal < 210pt\MessageBreak
      tension de page modifiee a 4, veuillez recompiler}%
  \else
  \ifdim\pagetotal < 250pt
    \immediate\write\@tensionaux{%
          \string\expandafter\string\def%
          \string\csname\space newletter\the\c@lettre\string\endcsname{6}}%
    \l@@warning{Longueur de la derniere page : \the\pagetotal < 250pt\MessageBreak
      tension de page modifiee a 6, veuillez recompiler}%
  \else
    \immediate\write\@tensionaux{%
          \string\expandafter\string\def%
          \string\csname\space newletter\the\c@lettre\string\endcsname{%
          \csname letter\the\c@lettre\endcsname}}%
    \l@@info{Longueur de la derniere page : \the\pagetotal >= 250pt}%
  \fi
  \fi
  \fi
  \fi
  \fi
  \fi
  \stopletter
  \@@par\pagebreak\@@par
  \if@etiq 
    \ifodd\c@page%
    \else
      \if@twoside
  	\l@@info{Saut de page force pour commencer les etiquettes sur une page impaire.}%
  	\thispagestyle{empty}
  	\hbox{}\penalty-10000\relax
      \fi
    \fi
    \begingroup 
      \def\protect{\string}%
      \let\\=\relax
      \def\protect##1{\string##1\space}%
      \immediate\write\@etiqaux{\string\mlabel{\toname
           \\\toaddress}}%
    \endgroup 
  \fi}%
%    \end{macrocode}
% \DescribeEnv{telefax}L'environnement \texttt{telefax} permet de formater une télécopie. Liste des
% arguments~:\newline
% \begin{tabular}{@{\#}l@{ : }l@{}}
%     1&Numéro du destinataire\\
%     2&Nom+adresse du destinataire\\
%   \end{tabular}
%    \begin{macrocode}
\long\def\telefax#1#2{%
  \global\let\lettre@tns@vspace\@empty
  \rm
  \global\advance\c@telefax\@ne
  \l@@info{Telefax \the\c@telefax}%
  \ifnum\c@telefax=\@ne
  \else
    \l@@warning@strictable{Un seul telefax par fichier, s.v.p.,\MessageBreak
      sinon le nombre de pages du fax est incorrect !}
  \fi
  \ifodd\c@page%
  \else
    \if@twoside
      \l@@info{Saut de page force pour commencer le telefax sur une page impaire.}%
      \thispagestyle{empty}
      \hbox{}\penalty-10000\relax
    \fi
  \fi
  \c@page\@ne
  \resetopenenv\resetcloseenv\resetauxenv\resetemailenv
  \@letterfalse
  \lettre@input@institut
  \def\tofaxnum{#1}%
  \let\opening=\faxopening
  \interlinepenalty=200\relax
  \makeatletter
  \@input{\jobname.fax}%
  \l@@info{Lecture du fichier auxiliaire de fax: Nombre total de pages=\totalpages}%
  \makeatother
  \lettre@processto{#2}
}%
%    \end{macrocode}
% \DescribeMacro{\endtelefax}
%    \begin{macrocode}
\def\endtelefax{%
  \stopfax
  \begingroup 
    \advance\faxpage by\c@page
    \def\protect{\string}%
    \let\\=\relax
    \def\protect##1{\string##1\space}%
    \immediate\openout\@faxaux=\jobname.fax%
    \immediate\write\@faxaux{\string\def\string\totalpages{\the\faxpage}}%
    \ifx\totalpages\@empty
      \let\@tempa\@firstoftwo
    \else\ifnum\totalpages=\the\faxpage
      \let\@tempa\@firstoftwo
    \else
      \let\@tempa\@secondoftwo
    \fi\fi
    \@tempa
    {}{\l@@warning{Le nombre de pages du fax a change, \MessageBreak
     (ancien=\totalpages, nouveau=\the\faxpage) \MessageBreak
     veuillez recompiler pour le corriger dans l'entete}}%
  \endgroup
  \@@par\pagebreak\@@par
}%
%    \end{macrocode}
%\subsubsection{Les commandes \cs{opening} et \cs{closing}}
% \DescribeMacro{\lettre@write@pdate@to@dateaux}\cs{lettre@write@pdate@to@dateaux} permet d'écrire dans le
% fichier \cs{jobname}\texttt{.odt} la date de première compilation en cas de mode \texttt{origdate}. Cette
% action est effectuée au moment de la commande \cs{opening}.
% \changes{2.352}{2014-08-02}{Création macro \cs{lettre@write@pdate@to@dateaux} pour correction \href{https://gna.org/bugs/index.php?22423}{bogue\#22423}}
%    \begin{macrocode}
\def\lettre@write@pdate@to@dateaux{%
  \l@@info{`\pdate' ecrit dans \jobname.odt}%
  {%
    \let\protect\string
    \immediate\write\@dateaux{%
      \string\expandafter\string\def%
      \string\csname\space origdate\the\c@lettre
      \string\endcsname{\pdate}}}}
%    \end{macrocode}
% \DescribeMacro{\lettre@get@date}\cs{lettre@get@date} permet de relire la date à partir de
% \cs{jobname}\texttt{.odt} lorsqu'elle y est disponible.
% \changes{2.352}{2014-08-06}{Nouvelle macro \cs{lettre@get@date}}
% \changes{2.354}{2014-09-19}{Utilisation de \protect\ifcsundef\space pour tester \protect\csname
% origdate\protect\the\expandafter\protect\csname c@lettre\endcsname\protect\endcsname}
%    \begin{macrocode}
\def\lettre@get@date{%
   \if@origdate
     \ifcsundef{origdate\the\c@lettre}{}{%
        \l@@info{Date originale lue dans \jobname.odt}%
        \def\pdate{\csname origdate\the\c@lettre\endcsname}%
     }%
%    \end{macrocode}
% On re-écrit systématiquement dans le fichier \cs{jobname}\texttt{.odt} même lorsque la date n'a pas changé,
% ce qui fait que son horodate change à chaque compilation même si le contenu peut rester inchangé. La raison
% c'est que~:
% \begin{enumerate}
% \item l'implémentation est plus simple (on ouvre systématiquement le \cs{write})
% \item dans le cas où il y a plusieurs plusieurs lettres dans le même document, disons deux, il se peut que
%   la seconde soit ajoutée au document alors que la première y était déjà, dans ce cas il faut quand même
%   re-écrire \cs{pdate} dans le \cs{jobname}\texttt{.odt} pour la première lettre, même si c'est inchangé, à
%   cause de la nouvelle lettre.
% \end{enumerate}
% \changes{2.352}{2014-08-02}{Correction \href{https://gna.org/bugs/index.php?22423}{bug\#22423} avec macro
% \cs{lettre@write@pdate@to@dateaux}}
%    \begin{macrocode}
     \lettre@write@pdate@to@dateaux
  \fi
}
%    \end{macrocode}
% \DescribeMacro{\lettre@put@fromlieu@date}La macro \cs{lettre@put@fromlieu@date} place \cs{fromlieu} et la
% date \cs{pdate} séparés d'une virgule. La virgule n'est présente que si ni l'un ni l'autre n'est vide.
% \changes{2.352}{2014-08-02}{Correction \href{https://gna.org/bugs/index.php?22383}{bug\#22383}, la virgule
% après \cs{fromlieu} est rendue conditionnelle à ce que \cs{fromlieu} soit non-vide. Lorsqu'il n'y a pas de
% date on ne met rien, et non plus un espace insécable}%
%    \begin{macrocode}
\def\lettre@put@fromlieu@date{%
  \ifx\@empty\fromlieu
   \else
     \fromlieu
     \ifx\@empty\pdate\else, \fi
   \fi 
  \ifx\@empty\pdate\else\pdate\fi}
%    \end{macrocode}
%\paragraph{Dans le cas d'une lettre, \cs{opening}}
%\label{sec:lettre-opening}
%
%\DescribeMacro{\letteropening}La macro \cs{opening} pointe par un \cs{let} sur \cs{letteropening} dans le cas
% de l'environnement \texttt{letter}.
%    \begin{macrocode}
\def\letteropening#1{%
%    \end{macrocode}
% \changes{2.352}{2014-08-06}{Factorisation du code entre \cs{faxopening} et \cs{letteropening} avec la macro
% \cs{lettre@get@date}}
%    \begin{macrocode}
   \lettre@get@date
   \hbadness=10000\relax
   \thispagestyle{empty}% 
   \setlength{\unitlength}{1mm}%
   \begin{picture}(\pict@let@width,\pict@let@height)%
                  (\pict@let@hoffset,\pict@let@voffset)%
     \put(\rule@hpos,\rule@vpos){\line(1,0){\rule@length}}%
     \put(\fromaddress@let@hpos,\fromaddress@let@vpos){\makebox(0,0)[tl]{%
          \parbox[t]{\fromaddress@let@width}{%
                  \fromaddress\\[3mm]%
                  \ifx\@empty\fromlocation
                  \else \fromlocation \\%
                  \fi 
                  \ifx\@empty\telephonenum
                  \else \tellabelname \telephonenum \\
                  \fi
                  \ifx\@empty\faxnum
                  \else \faxlabelname \faxnum \\
                  \fi
                  \ifx\@empty\emailnum
                  \else \mbox{\emaillabelname\ttfamily\emailnum} \\
                  \fi}}}
     \put(\fromlieu@let@hpos,\fromlieu@let@vpos){\makebox(0,0)[bl]{%
          \parbox[t]{\fromlieu@let@width}{%
%    \end{macrocode}
% \changes{2.352}{2014-08-06}{Factorisation du code entre \cs{faxopening} et \cs{letteropening} avec la macro
% \cs{lettre@put@fromlieu@date}}
%    \begin{macrocode}
            \lettre@put@fromlieu@date
              }}}%
     \put(\toaddress@let@hpos,\toaddress@let@vpos){\makebox(0,0)[tl]{%
          \parbox{\toaddress@let@width}{%
                 \toname\\\toaddress}}}%
   \end{picture}%
   \par
%    \end{macrocode}
% Espacement vertical lu dans le fichier \texttt{.tns} destiné à optimiser la mise en page.
%    \begin{macrocode}
   \lettre@letter@tns@vspace
%    \end{macrocode}
% \changes{3.001}{2017-08-05}{Correction de l'anomalie \href{http://gna.org/bugs/?25373}{GNA\No 25373}; aka
% \href{https://puszcza.gnu.org.ua/bugs/index.php?397}{\No 397}, on corrige la gestion de la marge}%
%    \begin{macrocode}
   \lettre@adjust@margin
%    \end{macrocode}
% Références, Télex, \& CCP de la lettre, s'il en est.
%    \begin{macrocode}
   \ifx\@empty\auxflag
     \vspace{2\openingspace}%
   \else 
     \vspace{\openingspace}\auxline\vspace{\openingspace}%
   \fi
%    \end{macrocode}
% Espacement vertical lu dans le fichier \texttt{.tns} destiné à optimiser la mise en page.
%    \begin{macrocode}
   \lettre@letter@tns@vspace
%    \end{macrocode}
% Objet de la lettre, s'il en est, suivi de la formule de salutation.
% \changes{3.001}{2017-11-28}{Factorisation de code entre \cs{faxopening} et \cs{letteropening} avec la macro
% \cs{lettre@start@body}.}
%    \begin{macrocode}
   \lettre@start@body{#1}%
}%
%    \end{macrocode}
%\paragraph{Dans le cas d'une télécopie, \cs{opening}}
%\label{sec:fax-opening}
%
%\DescribeMacro{\faxopening}\cs{opening} pointe par un \cs{let} sur \cs{faxopening} dans le cas d'une
% télécopie.
%    \begin{macrocode}
\def\faxopening#1{%
   \hbadness=10000\relax
   \thispagestyle{empty}%
   \setlength{\unitlength}{1mm}%
   \begin{picture}(\pict@fax@width,\pict@fax@height)
                   (\pict@fax@hoffset,\pict@fax@voffset)%
     \put(\fromaddress@fax@hpos,\fromaddress@fax@vpos){\makebox(0,0)[tl]{
          \parbox[t]{\fromaddress@fax@width}{\fromaddress}}}%
     \put(\faxstring@hpos,\faxstring@vpos){\makebox(0,0)[bl]{%
          \parbox[t]{\faxstring@width}{\telefaxstring}}}
   \end{picture}\par%
 \par\vspace{5mm}%
  \makebox[\faxbox@width]{\scriptsize\telephonelabelname\telephonenum
   \hfill\telefaxlabelname\faxnum
   \ifx\@empty\emailnum\else\hfill\emaillabelname{\ttfamily\emailnum}\fi
   \ifx\@empty\telexnum\else\hfill\telexlabelname\telexnum\fi}%
 \par
 \begin{tabular*}{\faxbox@width}[t]{l@{\hspace{5mm}}p{70mm}@{\hfill}r}%
    \hline
    \multicolumn{3}{@{}c@{}}{\vrule height 0pt depth 0pt width \faxbox@width}\\
    \headtoname
       &\parbox[t]{\toaddress@fax@width}{\toname\\\toaddress}%
       &\telefaxname\tofaxnum\\%
    \\%
    \headfromname
       &\parbox[t]{\fromname@fax@width}{\ifx\@empty\fromlocation
                                       \fromname
                                   \else
                                       \fromlocation
                                   \fi}%
       &\pagetotalname\totalpages\\%
 \end{tabular*}\par%
 \begin{tabular*}{\faxbox@width}[t]{@{\hfill}c@{\hfill}}%
    \hline
    \vrule height 3ex depth 7pt width 0pt\faxwarning\\%
    \hline
 \end{tabular*}\par%
 \begin{tabular*}{\faxbox@width}[t]{@{}r@{}}%
    \vrule height 0pt depth 0pt width \faxbox@width\\
    \multicolumn{1}{r}{%
%    \end{macrocode}
% \changes{2.352}{2014-08-06}{Factorisation du code entre \cs{faxopening} et \cs{letteropening} avec les macro
% \cs{lettre@get@date} et \cs{lettre@put@fromlieu@date}}%
%    \begin{macrocode}
       \lettre@get@date
       \lettre@put@fromlieu@date
           }\\%
 \end{tabular*}%
 \par
   \vspace{\openingspace}%
   \lettre@adjust@margin
%    \end{macrocode}
% Objet du fax, s'il en est, suivi de la formule de salutation.
% \changes{3.001}{2017-11-28}{Factorisation de code entre \cs{faxopening} et \cs{letteropening} avec la macro
% \cs{lettre@start@body}.}
%    \begin{macrocode}
   \lettre@start@body{#1}%
}%
%    \end{macrocode}
%\paragraph{\cs{closing}}
%\label{sec:closing}
%\DescribeMacro{\closing}
%    \begin{macrocode}
\long\def\closing#1{%
  \let\center=\normalcenter
  \let\centering=\normalcentering
  \let\flushleft=\normalflushleft
  \let\raggedright=\normalraggedright
  \par\lettre@stopbreaks
%    \end{macrocode}
% Espacement vertical lu dans le fichier \texttt{.tns} destiné à optimiser la mise en page, seulement dans le
% cas d'une lettre et non d'une télécopie.
%    \begin{macrocode}
  \lettre@tns@vspace
%    \end{macrocode}
% \strut
%    \begin{macrocode}
  \par\vspace{2\parskip}%
  \nobreak
  \noindent
  \l@@info{Signature \ifcase\signum manquante\or simple\or double\or triple\fi}%
%    \end{macrocode}
% Dans le cas où \cs{signum} est nul, la signature est générée à partir de \cs{fromname}. Il est donc
% nécessaire que \cs{name}\marg{Mon nom} ait été appelé dans le préambule ou indirectement via la commande
% \cs{institut}.
% \changes{3.000}{2016-02-26}{Message d'erreur explicite en cas d'absence de \cs{name}\marg{Mon nom}.}
%    \begin{macrocode}
  \ifnum\signum=0\space\ifx\fromname\undefined
    \l@@error{\protect\fromname\space non d'efini, vous avez sans
     doute omis de sp'ecifier \protect\name\space ou
     \protect\institut\space!}
  \fi\fi
%    \end{macrocode}
% Le compteur \cs{sigflag} permet de sélectionner une présentation de la signature en fonction de la locale.
% \changes{3.001}{2017-08-05}{Factorisation de code dans \cs{closing} sur le \cs{ifcase}\cs{sigflag}.}
%    \begin{macrocode}
  \ifcase\sigflag
    \parbox[t]{\letterwidth}{#1}%
    \par\vspace*{4\parskip}%
        \vspace*{\sigspace}%
    \ifcase\signum
       \hspace*{\ssigindent}%
       \noindent
       \parbox[t]{\ssigwidth}{\centering \ignorespaces\fromname}%
    \or
       \hspace*{\ssigindent}%
       \noindent
       \parbox[t]{\ssigwidth}{\centering \ignorespaces\fromsig}%
    \or
       \msigwidth=\letterwidth
       \divide\msigwidth by 2\relax
       \advance\msigwidth -3pt%
       \noindent
       \mbox{\parbox[t]{\msigwidth}{\centering\ignorespaces\fromsig}%
             \parbox[t]{\msigwidth}{\centering\ignorespaces\fromssig}}%
    \or
       \msigwidth=\letterwidth
       \divide\msigwidth by 3\relax
       \advance\msigwidth -3pt%
       \noindent
       \mbox{\parbox[t]{\msigwidth}{\centering\ignorespaces\fromsig}%
             \parbox[t]{\msigwidth}{\centering\ignorespaces\fromssig}%
             \parbox[t]{\msigwidth}{\centering\ignorespaces\fromtsig}}%
    \fi
  \or
    \ifcase\signum
        \hspace*{\ssigindent}%
        \parbox[t]{\ssigwidth}%
        {\centering \ignorespaces
        #1%
        \par\vspace*{4\parskip}%
            \vspace*{\sigspace}%
        \fromname}%
    \or
        \hspace*{\ssigindent}%
        \parbox[t]{\ssigwidth}%
        {\centering \ignorespaces
        #1%
        \par\vspace*{4\parskip}%
            \vspace*{\sigspace}%
        \fromsig}%
    \or
       \parbox[t]{\letterwidth}{#1}%
       \par\vspace*{4\parskip}%
           \vspace*{\sigspace}%
       \msigwidth=\letterwidth
       \divide\msigwidth by 2\relax
       \advance\msigwidth -3pt%
       \noindent
       \mbox{\parbox[t]{\msigwidth}{\centering\ignorespaces\fromsig}%
             \parbox[t]{\msigwidth}{\centering\ignorespaces\fromssig}}%
    \or
       \parbox[t]{\letterwidth}{#1}%
       \par\vspace*{4\parskip}%
           \vspace*{\sigspace}%
       \msigwidth=\letterwidth
       \divide\msigwidth by 3\relax
       \advance\msigwidth -3pt%
       \noindent
       \mbox{\parbox[t]{\msigwidth}{\centering\ignorespaces\fromsig}%
             \parbox[t]{\msigwidth}{\centering\ignorespaces\fromssig}%
             \parbox[t]{\msigwidth}{\centering\ignorespaces\fromtsig}}%
    \fi
  \fi
  \par\vfill
%    \end{macrocode}
% Fin du corps de la lettre sous la marge définie par \cs{marge}.
%    \begin{macrocode}
  \lettre@endadjust@margin
  \lettre@startbreaks
  \let\@par\lettre@par
  \let\lettre@parshape\@empty
%    \end{macrocode}
% Fin de la macro \cs{closing}.
%    \begin{macrocode}
}%
\newdimen\lettre@save@leftmargin
\newdimen\lettre@save@leftskip
\newdimen\lettre@leftmargin
%    \end{macrocode}
% \DescribeMacro{\lettre@adjust@margin}Début du corps de lettre dans lequel la marge est réglée selon la
% commande \cs{marge} qui a été passée avant le \cs{opening}.
%    \begin{macrocode}
\newcommand*\lettre@adjust@margin{%
    \@setpar{\@@par\lettre@parshape}%
    \lettre@save@leftmargin\leftmargin
    \lettre@leftmargin\lettermargin
    \advance\@totalleftmargin by \lettre@leftmargin
    \leftmargin\lettre@leftmargin
    \advance\linewidth by -\lettre@leftmargin
    \lettre@save@leftskip\leftskip
    \def\lettre@parshape{\parshape \@ne\@totalleftmargin \linewidth}%
    \lettre@parshape
}
%    \end{macrocode}
% \DescribeMacro{\lettre@endadjust@margin}Fin du corps de lettre. Après cette commande la marge n'est plus
% contrôlée selon le réglage fait pas la commande \cs{marge}.
%    \begin{macrocode}
\newcommand*\lettre@endadjust@margin{%
    \advance\@totalleftmargin by -\lettre@leftmargin
    \advance\linewidth by \lettre@leftmargin
    \leftmargin\lettre@save@leftmargin
    \leftskip\lettre@save@leftskip
  }
%    \end{macrocode}
% \DescribeMacro{\lettre@letter@tns@vspace}La macro \cs{lettre@letter@tns@vspace} insère l'espace vertical
% utilisé pour optimiser la mise en page des lettres via le fichier \texttt{.tns}. Cette macro n'est utilisée
% que dans le cas des lettres, et pas dans celui des télécopies.
%    \begin{macrocode}
\newcommand*\lettre@letter@tns@vspace{%
  \vskip\csname letter\the\c@lettre\endcsname mm}
%    \end{macrocode}
% \DescribeMacro{\lettre@tns@vspace}La macro \cs{lettre@tns@vspace} pointe en fait sur
% \cs{lettre@letter@tns@vspace} dans le cas des lettres, ou sur \cs{@empty} dans celui d'une télécopie. Elle
% permet d'appeler l'une ou l'autre macro dans les parties communes aux deux types de missives, par ex.\ au
% sein de \cs{closing} ou de \cs{lettre@start@body}.
%    \begin{macrocode}
\newcommand*\lettre@tns@vspace{}
%    \end{macrocode}
% \DescribeMacro{\lettre@start@body}La macro \cs{lettre@start@body} insère l'objet, s'il en est, suivi de la
% formule de salutation, puis débute le corps de la lettre en terminant \cs{opening} par l'espacement
% nécessaire et en redéfinissant les environnement \texttt{center} et consorts de manière adéquate.
%    \begin{macrocode}
\newcommand*\lettre@start@body[1]{%
   \ifx\@empty\concdecl 
     \vspace{\openingspace}%
   \else 
     \concline\vspace{\openingspace}%
   \fi
   \lettre@tns@vspace
   \hbadness=1000\relax
   {\parindent=\openingindent
   #1}\par\lettre@startbreaks\nobreak
   \let\flushleft=\letterflushleft
   \let\raggedright=\letterraggedright
   \let\center=\lettercenter
   \let\centering=\lettercentering  
}
%    \end{macrocode}
% \DescribeMacro{\marge}La macro \cs{marge} règle la marge du corps de la lettre. Elle est à appelé entre le
% \cs{begin\{letter\}} et le \cs{opening}.
%    \begin{macrocode}
\def\marge#1{%
 \lettermargin=#1%
 \listmargin=#1%
 \letterwidth=\textwidth
 \advance\letterwidth by -\lettermargin
}%
%    \end{macrocode}
%\DescribeMacro{\basdepage}
%    \begin{macrocode}
\def\basdepage#1{%
  \def\bdp{#1}}%
%    \end{macrocode}
%\DescribeMacro{\tension}
%    \begin{macrocode}
\def\tension#1{%
  \if@letter
    \expandafter\def\csname letter\the\c@lettre\endcsname{#1}%
  \fi
}%
%    \end{macrocode}
%\DescribeMacro{\addpages}
%    \begin{macrocode}
\def\addpages#1{%
  \l@@info{Pages additionnelles: #1}%
  \advance\faxpage by #1}%
%    \end{macrocode}
%\DescribeMacro{\name}
%    \begin{macrocode}
\def\name#1{\def\fromname{#1}}%
%    \end{macrocode}
%\DescribeMacro{\signature}
%    \begin{macrocode}
\def\signature#1{%
  \ifnum\signum=0\relax
    \def\fromsig{#1}\signum=1\relax
  \else
    \l@@warning@strictable{Signature deja definie}%
  \fi
}%
%    \end{macrocode}
%\DescribeMacro{\secondsignature}
%    \begin{macrocode}
\def\secondsignature#1{%
  \ifnum\signum=1\relax
    \def\fromssig{#1}\signum=2\relax
  \else
    \l@@warning@strictable{Seconde signature illegale ou deja definie}%
  \fi
}%
%    \end{macrocode}
%\DescribeMacro{\thirdsignature}
%    \begin{macrocode}
\def\thirdsignature#1{%
  \ifnum\signum=2\relax
    \def\fromtsig{#1}\signum=3\relax
  \else
    \l@@warning@strictable{Troisieme signature illegale ou deja definie}%
  \fi
}%
%    \end{macrocode}
%\DescribeMacro{\vref}
%    \begin{macrocode}
\def\vref{\l@@warning@strictable{La commande \protect\Vref\space devrait etre
    utilisee}\Vref}
%    \end{macrocode}
%\DescribeMacro{\Vref}
%\changes{2.354}{2014-10-21}{Ajout \cs{lettre@vref@width}}%
%\changes{2.354}{2014-10-21}{Un argument vide à \cs{Vref} supprime la référence}%
%    \begin{macrocode}
\def\Vref#1{%
  \def\@tempa{#1}%
  \ifx\@empty\@tempa
     \let\toref\@empty
  \else
     \def\auxflag{.}%
     \def\toref{\parbox[t]{\lettre@vref@width}{#1}}%
  \fi
}%
%    \end{macrocode}
%\DescribeMacro{\nref}
%    \begin{macrocode}
\def\nref{\l@@warning@strictable{La commande \protect\Nref\space devrait etre
  utilisee}\Nref}
%    \end{macrocode}
%\DescribeMacro{\Nref}
%\changes{2.354}{2014-10-21}{Ajout \cs{lettre@nref@width}}%
%\changes{2.354}{2014-10-21}{Un argument vide à \cs{Nref} supprime la référence}%
%    \begin{macrocode}
\def\Nref#1{%
  \def\@tempa{#1}%
  \ifx\@empty\@tempa
     \let\fromref\@empty
  \else
     \def\auxflag{.}%
     \def\fromref{\parbox[t]{\lettre@nref@width}{#1}}%
  \fi
}%
%    \end{macrocode}
%\DescribeMacro{\concline}La macro \cs{concline}  contient l'objet de la lettre ou du fax.
%    \begin{macrocode}
\def\concline{%
         \noindent\parbox[t]{\letterwidth}%
           {\@hangfrom{\textrm{\concname}}\ignorespaces\concdecl\strut}%
         \par}%
%    \end{macrocode}
% \DescribeMacro{\auxline}La macro \cs{auxline} contient les références, ainsi que les numéro télex ou
% \textsc{ccp}.
%    \begin{macrocode}
\def\auxline{%
  \l@@info{Ligne auxiliaire demandee}%
  {\scriptsize
    \ifx\@empty\toref\else
      \vrefname
      \ifx\space\toref
        \hspace{\lettre@vref@width}%
      \else 
        {\small\toref}%
      \fi
      \hfill
   \fi
   \ifx\@empty\fromref\else
     \nrefname
     \ifx\space\fromref
       \hspace{\lettre@nref@width}%
     \else 
      {\small\fromref}%
     \fi
     \hfill
   \fi
   \ifx\@empty \telexnum
      \hfill
   \else 
      T\'ELEX\ \telexnum
      \hspace{5mm}%
    \fi
    \ifx\@empty \ccpnum
      \hfill
    \else 
      C.C.P.\ \ccpnum\hspace{5mm}%
    \fi}\par}%
%    \end{macrocode}
%\DescribeMacro{\emailine}
%    \begin{macrocode}
\def\emailine{%
  \l@@info{Ligne d'E-Mail demandee}%
  {\scriptsize
    \emaillabelname\hfill\ttfamily
    \ifx\@empty \ccittnum
    \else
     \hfill \ccittnum\hfill
    \fi
    \ifx\@empty \internetnum
    \else
     \hfill \internetnum\hfill
    \fi
    \ifx\@empty \bitnetnum
    \else
     \hfill \bitnetnum\hfill
    \fi
    \ifx\@empty \telepacnum
    \else 
     \hfill \telepacnum\hfill
    \fi
    \ifx\@empty \decnetnum
    \else 
     \hfill \decnetnum\hfill
    \fi
    \ifnum\emailcount<3\relax
     \hfill\mbox{}%
    \fi}}%
%    \end{macrocode}
%\DescribeMacro{\address}
%    \begin{macrocode}
\long\def\address#1{\l@@info{Adresse precisee}\def\fromaddress{#1}}%
%\long\def\address*#1{\if@letter
%                        \l@@info{Adresse avec nom precisee}%
%                        \def\fromaddress{\fromname\\#1}
%                     \else
%                        \l@@warning@strictable{Commande illegale dans un fax}
%                     \fi}%
%    \end{macrocode}
%\DescribeMacro{\nodate}
%    \begin{macrocode}
\def\nodate{\l@@info{Date supprimee}\def\pdate{}}%
\def\date#1{\l@@info{Date precisee}\def\pdate{#1}}%
%    \end{macrocode}
%\DescribeMacro{\nolieu}
%    \begin{macrocode}
\def\nolieu{\l@@info{Lieu supprime}\def\fromlieu{}}%
%    \end{macrocode}
%\DescribeMacro{\lieu}
%    \begin{macrocode}
\def\lieu#1{\l@@info{Lieu precise}\def\fromlieu{#1}}%
%    \end{macrocode}
%\DescribeMacro{\conc}
%    \begin{macrocode}
\def\conc#1{\l@@info{Champ d'objet defini}\def\concdecl{#1}}%
%    \end{macrocode}
%\DescribeMacro{\location}
%    \begin{macrocode}
\def\location#1{\l@@info{Precision d'adresse definie}\def\fromlocation{#1}}%
%    \end{macrocode}
%\DescribeMacro{\notelephone}
%    \begin{macrocode}
\def\notelephone{\l@@info{Numero de telephone supprime}\def\telephonenum{}}%
%    \end{macrocode}
%\DescribeMacro{\telephone}
%    \begin{macrocode}
\def\telephone#1{\l@@info{Numero de telephone precise}\def\telephonenum{#1}}%
%    \end{macrocode}
%\DescribeMacro{\nofax}
%    \begin{macrocode}
\def\nofax{\l@@info{Numero de fax supprime}\def\faxnum{}}%
%    \end{macrocode}
%\DescribeMacro{\fax}
%    \begin{macrocode}
\def\fax#1{\l@@info{Numero de fax precise}\def\faxnum{#1}}%
%    \end{macrocode}
%\DescribeMacro{\email}
%    \begin{macrocode}
\def\email#1{\l@@info{Numero d'E-Mail precise}\def\emailnum{#1}}%
%    \end{macrocode}
%\DescribeMacro{\username}
%    \begin{macrocode}
\def\username#1{\def\@username{#1}}%
%    \end{macrocode}
%\DescribeMacro{\ccitt}
%    \begin{macrocode}
\def\ccitt#1{%
  \ifnum\emailcount<3\relax
    \def\emailflag{.}%
    \advance\emailcount by 1\relax
    \def\ccittnum{%
      \ifx\@empty \@username
        \l@@warning@strictable{<<username>> indefini}
        #1%
      \else
        S=\@username;#1%
      \fi}%
  \else
    \def\ccittnum{}%
  \fi}%
%    \end{macrocode}
%\DescribeMacro{\internet}
%    \begin{macrocode}
\def\internet#1{%
  \ifnum\emailcount<3\relax
    \def\emailflag{.}%
    \advance\emailcount by 1\relax
    \def\internetnum{%
      \ifx\@empty\@username
        \l@@warning@strictable{<<username>> indefini}
        #1\relax
      \else
        \@username @#1\relax
      \fi}%
  \else
    \def\internetnum{}%
  \fi}%
%    \end{macrocode}
%\DescribeMacro{\bitnet}
%    \begin{macrocode}
\def\bitnet#1{%
  \ifnum\emailcount<3\relax
    \def\emailflag{.}%
    \advance\emailcount by 1\relax
    \def\bitnetnum{%
      \ifx\@empty \@username
        \l@@warning@strictable{<<username>> indefini}
        #1\relax
      \else
        \@username\ at #1\relax
      \fi}%
    \else
      \def\bitnetnum{}%
    \fi}%
%    \end{macrocode}
%\DescribeMacro{\telepac}
%    \begin{macrocode}
\def\telepac#1{%
  \ifnum\emailcount<3\relax
    \def\emailflag{.}%
    \advance\emailcount by 1\relax
    \def\telepacnum{%
      \ifx\@empty \@username
        \l@@warning@strictable{<<username>> indefini}
        #1\relax
      \else
        #1::\@username
      \fi}%
    \else
      \def\telepacnum{}%
    \fi}%
%    \end{macrocode}
%\DescribeMacro{\decnet}
%    \begin{macrocode}
\def\decnet#1{%
  \ifnum\emailcount<3\relax
  \def\emailflag{.}%
  \advance\emailcount by 1\relax
  \def\decnetnum{%
    \ifx\@empty \@username
      \l@@warning@strictable{<<username>> indefini}
      #1\relax
    \else
      #1::\@username
    \fi}%
  \else
    \def\decnetnum{}%
  \fi}%
%    \end{macrocode}
%\DescribeMacro{\telex}
%    \begin{macrocode}
\def\telex#1{\ifnum\auxcount<2\relax
	       \def\auxflag{.}%
	       \advance\auxcount by 1\relax
	       \def\telexnum{#1}%
	     \else
	       \def\telexnum{}%
	     \fi}%
%    \end{macrocode}
%\DescribeMacro{\ccp}
%    \begin{macrocode}
\def\ccp#1{\ifnum\auxcount<2\relax
             \def\auxflag{.}%
             \advance\auxcount by 1\relax
             \def\ccpnum{#1}%
           \else
             \def\ccpnum{}%
           \fi}%
%    \end{macrocode}
%\DescribeMacro{\ps}
%    \begin{macrocode}
\def\ps#1#2{\penalty100\relax
  \lettre@tns@vspace
  \l@@info{Post-scriptum defini}%
  \noindent\lettre@t{#1}{#2\\}\vfill\penalty-100\relax}%
%    \end{macrocode}
%\DescribeMacro{\cc}
%    \begin{macrocode}
\def\cc#1{\penalty100\relax
  \lettre@tns@vspace
  \l@@info{Copies declarees}%
  \noindent\lettre@t{\ccname}{#1\\}\vfill\penalty-100\relax}%
%    \end{macrocode}
%\DescribeMacro{\encl}
%    \begin{macrocode}
\def\encl#1{\penalty100\relax
  \lettre@tns@vspace
  \l@@info{Annexes declarees}%
  \noindent\lettre@t{\enclname}{#1\\}\vfill\penalty-100\relax}%
%    \end{macrocode}
%\DescribeMacro{\mencl}
%    \begin{macrocode}
\def\mencl{\penalty100\relax
  \lettre@tns@vspace
  \l@@info{Annexes mentionnees}%
  \noindent\lettre@t{\mentionname\\}{~}\vfill\penalty-100\relax}%
%    \end{macrocode}
%
%\subsubsection{Définitions dépendant du langage}
%
%\DescribeMacro{\lettrelmpselectlanguage}La macro \cs{lettrelmpselectlanguage} permet, lorsque une langue est
% chargée dans dans un processeur multilingue (par ex.\ \texttt{babel}) de sélectionner cette langue et de
% redéfinir les environnements de liste tels qu'\texttt{itemize} pour le français.
%    \begin{macrocode}
\newcommand*{\lettrelmpselectlanguage}[1]{%
%    \end{macrocode}
% Si l'utilisateur n'a pas chargé les définitions de cette langue, on essaie de le faire ici :
%    \begin{macrocode}
  \lettreloadlang{#1}%
%    \end{macrocode}
% Ensuite, en premier lieu on vérifie que la langue \texttt{\#1} est bien prise en charge.
%    \begin{macrocode}
  {%
    \ifcsundef{lettre@#1@alias@of}{%
      \l@@warning@strictable{Langue #1 non ger'ee par lettre}%
      \let\@tempa\@empty
    }{%
%    \end{macrocode}
% Ensuite, il s'agit d'appeler \cs{lettre@lmp@selectlanguage}. En fait si l'on pose que
% \meta{lang}$=$\texttt{\#1}, alors on ne veut pas appeler
% \cs{lettre@lmp@selectlanguage}\texttt{\{}\meta{lang}\texttt{\}} mais
% \cs{lettre@lmp@selectlanguage}\texttt{\{}\meta{lang$^{\prime\prime}$}\texttt{\}}, où ci-après on déduit
% \meta{lang$^{\prime}$} de \meta{lang}, puis \meta{lang$^{\prime\prime}$} de \meta{lang$^{\prime}$}. On
% regarde donc d'abord de quoi \meta{lang}$=$\texttt{\#1} est l'alias, et on met le résultat dans
% \meta{lang$^\prime$}$=$\cs{toks}$0$. Par ex.\ si \meta{lang}$=$\texttt{french}, alors on a aussi
% \meta{lang$^\prime$}$=$\texttt{french}, parce que \texttt{french} est l'alias de lui-même (en d'autre terme ce
% n'est pas un alias d'autre chose), mais si \meta{lang}$=$\texttt{francais}, alors on aura
% \meta{lang$^\prime$}$=$\texttt{french}, parce que \texttt{francais} est un alias de \texttt{french}.
%    \begin{macrocode}
      \toks0\expandafter\expandafter\expandafter
        {\csname lettre@#1@alias@of\endcsname}%
%    \end{macrocode}
% Puis, si pour cette langue \meta{lang$^\prime$}, par ex.\ \texttt{romand}, on a déclaré d'utiliser une autre
% langue pour le gestionnaire de langue, par ex.\ \texttt{french}, on utilise celle-là au lieu de celle-ci, on
% met le résultat dans \meta{lang$^{\prime\prime}$}$=$\cs{toks}$1$.
%    \begin{macrocode}
      \ifcsundef{lettre@lmp@\the\toks0@use}{%
        \toks1\toks0 %
      }{%
        \toks1\expandafter\expandafter\expandafter
          {\csname lettre@lmp@\the\toks0@use\endcsname}%
      }%
%    \end{macrocode}
% En définitive, on va appeler \cs{lettre@lmp@selectlanguage}\texttt{\{}\meta
% {lang$^{\prime\prime}$}\texttt{\}}, et cet appel est préparé dans \cs{toks}$4$. Mais pas tout à fait, on
% gère en plus la modification par \texttt{lettre} des environnements de base (par ex.\ \texttt{itemize}) en
% fonction de la langue, de sorte qu'en fin de compte c'est la séquence
% \cs{the}\cs{toks}$3$\cs{the}\cs{toks}$4$\cs{the}\cs{toks}$5$ qui sera appelé.
%    \begin{macrocode}
      \toks4\expandafter{%
        \expandafter\lettre@lmp@selectlanguage\expandafter{%
          \the\toks1}}%
%    \end{macrocode}
% Il y a trois cas possibles. Le premier c'est que la gestion des environnements par \texttt{lettre} est
% désactivée, ou en d'autres termes que le compteur \cs{lettre@keep@envs} est à 1. Dans ce cas on ne
% fait rien de plus qu'appeler \cs{lettre@lmp@selectlanguage}\texttt{\{}\meta
% {lang$^{\prime\prime}$}\texttt{\}}, c.-à-d.\ que \cs{toks}$3$ et \cs{toks}$5$ sont vide.
%    \begin{macrocode}
      \ifnum\lettre@keep@envs=1 %
         \toks3{}%
         \toks5{}%
      \else
%    \end{macrocode}
% Dans le deuxième cas, la gestion des environnements par \texttt{lettre} est activée, mais il n'y a pas de
% redéfinition d'environnements disponible pour la langue \meta{lang$^{\prime\prime}$}. Dans ce cas on
% appelle \cs{lettre@restore@orig@envs} avant \cs{lettre@lmp@selectlanguage}\texttt{\{}\meta
% {lang$^{\prime\prime}$}\texttt{\}}, et \cs{lettre@store@orig@envs}. Si \meta{lang$^{\prime\prime}$} est la
% seule langue utilisée dans tout le document, cela ne sert à rien, mais au cas où le document contiendrait
% avant la lettre utilisant \meta{lang$^{\prime\prime}$} une lettre qui aurait redéfini les environnements,
% on a besoin du \cs{lettre@restore@orig@envs} pour ne pas perturber le paquetage de gestion de langue.
%    \begin{macrocode}
         \toks3{\lettre@restore@orig@envs}%
         \ifcsundef{lettre@set@\the\toks1@envs}{%
           \toks5{\lettre@store@orig@envs}%
         }{%
%    \end{macrocode}
% Dans le troisième cas, une redéfinition d'environnements est disponible pour la langue
% \meta{lang$^{\prime\prime}$}. Dans ce cas on fait la même chose que dans le deuxième cas, à ceci près
% qu'on appelle en tout dernier lieu \cs{lettre@set@}\meta{lang$^{\prime\prime}$}\texttt{@envs}.
%    \begin{macrocode}
            \toks5\expandafter{\expandafter\lettre@store@orig@envs
              \csname lettre@set@\the\toks1 @envs\endcsname}%
         }%
      \fi
%    \end{macrocode}
% Il ne reste plus qu'à appeler ce qu'on a préparé dans les \cs{toks} allant de $3$ à $5$.
%    \begin{macrocode}
      \edef\@tempa{%
        \the\toks3 %
        \the\toks4 %
        \the\toks5}%
    }%
    \expandafter
  }\@tempa
}%
%    \end{macrocode}
%\DescribeMacro{\FAXSTR}
%    \begin{macrocode}
\def\FAXSTR{\fontfamily{cmdh}\fontseries{m}\fontshape{n}\selectfont}%
%    \end{macrocode}
%\DescribeMacro{\lettre@lmp@selectlanguage}La macro \cs{lettrelmpselectlanguage} n'est en fait qu'un pointeur
% qui appelle le \cs{selectlanguage} ou son équivalent selon le processeur multilingue utilisé (typiquement
% \texttt{mlp}, \texttt{babel},  ou \texttt{polyglossia}). Ici on définit une implémentation par défaut qui ne
% fait rien en attendant un \cs{let} vers la bonne macro.
%    \begin{macrocode}
\newcommand*\lettre@lmp@selectlanguage[1]{%
  \l@@warning{ `\string\lettre@lmp@selectlanguage{#1}' appel'e, mais ne
    fait rien. Vous n'avez charg'e ni babel, ni mlp, ni polyglossia, ni
    french}}
%    \end{macrocode}
%\DescribeMacro{\lettrelabelselectlanguage}\cs{lettrelabelselectlanguage} change la langue des étiquettes de
% la lettre, ainsi que la disposition de la signature.
%    \begin{macrocode}
\newcommand*\lettrelabelselectlanguage[1]{%
%    \end{macrocode}
% Si l'utilisateur n'a pas chargé les définitions de cette langue, on essaie de le faire ici :
%    \begin{macrocode}
  \lettreloadlang{#1}%
%    \end{macrocode}
% Et maintenant on sélectionne la langue \meta{langue}$=$\texttt{\#1}, ce qui correspond à appeler la macro
% \cs{lettre@select@\meta{langue}@labels} avec quelques gardefous. Au-passage, si aucun des gardefous n'est
% franchi, \cs{lettre@mainlang} est redéfini à \texttt{\#1}.
%    \begin{macrocode}
  {%
     \ifcsundef{lettre@#1@alias@of}{%
       \l@@warning@strictable{La langue <<#1>> n'est pas prise en charge par lettre}%
       \let\@tempa\@empty
     }{%
        \expandafter\let\expandafter\@tempa\csname lettre@#1@alias@of\endcsname
        \ifcsundef{lettre@select@\@tempa @labels}{%
          \l@@warning@strictable{Les d'efinitions de la langue <<\@tempa>> n'ont pas pu etre charg'ees}%
          \let\@tempa\@empty
        }{%
          \expandafter\def\expandafter\@tempa\expandafter{%
            \csname lettre@select@\@tempa @labels\endcsname
            \def\lettre@mainlang{#1}}%
        }%
     }%
     \expandafter
  }\@tempa
}%
%    \end{macrocode}
% \DescribeMacro{\lettreloadlang}La macro \cs{lettreloadlang}\marg{langue} charge les définitions pour la
% langue \meta{langue}. Ceci revient à faire un \cs{input} du fichier nommé \texttt{lettre-\meta{langue}.ldf}.
%    \begin{macrocode}
\newcommand*\lettreloadlang[1]{%
%    \end{macrocode}
% On ouvre un groupe pour pouvoir y faire des définitions locales.
%    \begin{macrocode}
  {%
%    \end{macrocode}
% On vérifie tout d'abord si la langue \texttt{\#1} fait partie des langues prises en charge par
% \texttt{lettre}. On met dans \cs{@tempa} la valeur \meta{lang$^{\prime}$} à laquelle \texttt{\#1} est égale,
% ou en est l'alias. On met dans \cs{toks0} tout traitement éventuel de redéfinition de
% \cs{lettre@\#1@alias@of}.
%    \begin{macrocode}
     \newif\iflettre@lang@not@supported
     \ifcsundef{lettre@#1@alias@of}{%
       \lettre@lang@not@supportedtrue
       \l@@warning@strictable{La langue <<#1>> ne fait pas partie des
         langues prises en charge par lettre}%
%    \end{macrocode}
% Le code suivant consiste à définir \cs{lettre@\#1@alias@of} comme \texttt{\#1}, de sorte que la langue
% \texttt{\#1} soit dorénavant considérée comme prise en charge.
%    \begin{macrocode}
       \def\@tempb##1{\toks0{\def##1{#1}}}%
       \expandafter\@tempb\csname lettre@#1@alias@of\endcsname
       \def\@tempa{#1}%
     }{%
       \lettre@lang@not@supportedfalse
       \toks0{}%
       \expandafter\let\expandafter\@tempa\csname lettre@#1@alias@of\endcsname
     }%
     \edef\@tempc{\lettre@ldf@filename{\@tempa}}%
     \IfFileExists{\@tempc}{%
       \iflettre@lang@not@supported
         \l@@info{Un fichier `\@tempc' ne faisant pas partie de lettre a 'et'e
           trouv'e, et va etre charg'e.}%
       \fi
       \ifcsundef{\lettre@ldf@version{\@tempa}}{%
         \edef\@tempa{%
           \noexpand\l@@info{Chargement du fichier de definition de langue `\@tempc'}%
           \noexpand\input{\@tempc}%
           \the\toks0
         }}{\edef\@tempa{\the\toks0}}%
     }{%
       \let\@tempa\@empty
     }
     \expandafter
  }\@tempa
}%
%    \end{macrocode}
% \DescribeMacro{\lettreselectlanguage} \cs{lettreselectlanguage} Sélectionne la langue à la fois pour le
% paquetage de gestion de langue (césure, environnements liste, etc\ldots) en appelant
% \cs{lettrelmpselectlanguage} et pour la présentation de la lettre (étiquettes, disposition signature) en
% appelant \cs{lettrelabelselectlanguage}. L'ordre d'appel est important, parce que certains paquetages de
% gestion de langue redéfinissent certaines des macros de l'environnement \texttt{letter}. Notamment pour le
% romand avec le paquetage de gestion de langue \texttt{french}, ce dernier définit \cs{enclname} (l'étiquette
% introduisant la pièce jointe) comme \texttt{P. j.~:}, c-à-d.\ à la française, au lieu de le définir comme
% \texttt{Ann.~:}, c-à-d.\ à la romande, ce que fait \texttt{lettre}.
%    \begin{macrocode}
\newcommand*\lettreselectlanguage[1]{%
  \lettrelmpselectlanguage{#1}%
  \lettrelabelselectlanguage{#1}%
}%
%    \end{macrocode}
% \begin{macro}{\lettre@babel@selectlanguage}La macro \cs{lettre@babel@selectlanguage} est une émulation de
%   la macro \cs{selectlanguage} quand le paquetage \texttt{babel} est chargé. Le but est de faire un
%   traitement particulier pour le cas \texttt{german}.
%    \begin{macrocode}
\newcommand*\lettre@babel@selectlanguage[1]{%
  \ifcsdef{lettre@babel@#1}{\csname lettre@babel@#1\endcsname}{\selectlanguage{#1}}%
}%
%    \end{macrocode}
% Le traitement particulier pour \texttt{german} est effectué par \cs{lettre@babel@german}, et c'est le
% suivant :
% \begin{itemize}
% \item si \texttt{babel} a chargé \texttt{ngerman}, ce que l'on teste avec
%   \cs{ifcsdef}\texttt{\{ver@ngerman.ldf\}\ldots}, alors on appelle \cs{selectlanguage}\texttt{\{ngerman\}},
% \item sinon, on appelle \cs{selectlanguage}\texttt{\{german\}}
% \end{itemize}
% 
%    \begin{macrocode}
\newcommand*\lettre@babel@german{%
  \ifcsdef{ver@ngerman.ldf}{\selectlanguage{ngerman}}%
    {\selectlanguage{german}}%
}
%    \end{macrocode}
% \end{macro}
% \begin{macro}{\lettre@efrench@selectlanguage} La macro \cs{lettre@efrench@selectlanguage} est une émulation de la
% macro \cs{selectlanguage} quand le paquetage \texttt{french} est chargé.
%    \begin{macrocode}
\newcommand*\lettre@efrench@selectlanguage[1]{%
  \ifx\undefined\frenchname
    \l@@warning@strictable{L'un des paquetages mlp ou french n'a pas 'et'e
      charg'e correctement}%
  \else
%    \end{macrocode}
% Préparation d'un avertissement, au cas où \texttt{\#1} ne serait pas l'une des langues prises en charge par \texttt{mlp}.
%    \begin{macrocode}
    \def\@tempb{\l@@warning@strictable{La langue  `#1' n'est pas dans
      \string{french, german, english\string} qui sont les trois seules
       langues que lettre peut demander `a mlp}}%
    \def\@tempc{#1}%
    \def\lettre@iterate@body##1{%
      \def\@tempd{##1}%
      \ifx\@tempc\@tempd
%    \end{macrocode}
% Suppression de l'avertissement, car \texttt{\#1} est bien l'une des langues prises en charge par \texttt{mlp}.
%    \begin{macrocode}
         \let\@tempb\@empty
%    \end{macrocode}
% Ici on sélectionne la langue avec une macro enveloppante de la commande correspondante de \texttt{mlp}.
%    \begin{macrocode}
        \l@@info{Selection de la langue `#1' dans le paquetage french ou
          mlp d'efrench}%
        \csname lettre@efr@#1\endcsname
%    \end{macrocode}
% Le \cs{@tempc} permet de casser la boucle en gobant le \cs{lettre@iterate} qui suit, ainsi que ses arguments restants.
%    \begin{macrocode}
        \def\@tempc####1\@nil,{}%
        \expandafter\@tempc
      \fi
    }%
    \lettre@iterate french,english,german,\@nil,%
    \@tempb
  \fi
}%
%    \end{macrocode}
% \end{macro}
% Définition des macros enveloppantes des langues prises en charge par \texttt{mlp}. 
%
% \DescribeMacro{\lettre@efr@german} Pour \texttt{german}, on fait en sorte que l'allemand moderne (le seul
% utilisé par \texttt{babel}) l'emporte sur le vieil allemand.
%    \begin{macrocode}
\newcommand*\lettre@efr@german{%
  \ifx\undefined\ngermanTeXmods
    \ifx\undefined\germanTeXmods
      \l@@warning@strictable{Ni \protect\german\space ni \protect\ngerman\space
        ne sont d'efinis !}
    \else
      \german
     \fi
  \else
     \ngerman
  \fi
}
%    \end{macrocode}
% \begin{macro}{\lettre@efr@french}Pour \cs{french} il faut prendre deux précautions avant d'appeler la
%   macro.
%   \begin{itemize}
%   \item La première est qu'appeler \cs{french} alors qu'on est déjà en français cause une erreur. Pour
%     éviter cela, on fait le test \cs{ifFrench}.
%   \item La seconde est que si on appelle \cs{lettre@efr@french} dans le \cs{AtBeginDocument}, alors
%     \cs{french} ne sera pas encore défini. Donc on teste que \cs{french} est défini avant de rappeler
%     \cs{lettre@efr@french} avec une nouvelle définition <<\verb+\ifFrench\else\french\fi+>>.
%   \end{itemize}
%   
%    \begin{macrocode}
\newcommand*\lettre@efr@french{\ifcsdef{french}{%
    \def\lettre@efr@french{\ifFrench\else\french\fi}\lettre@efr@french
  }{\l@@warning@strictable{La commande \protect\french\space n'est pas
      d'efinie.}}}
%    \end{macrocode}
% \end{macro}
% \begin{macro}{\lettre@efr@english}Pour \cs{english}, le wrapper ne fait qu'appeler la macro \cs{english}
%   correspondante du paquetage \texttt{mlp} ou \texttt{french}.
%    \begin{macrocode}
\newcommand*\lettre@efr@english{\english}
%    \end{macrocode}
% \end{macro}
% Définitions des macros telles que \cs{francais}, \cs{anglais}, etc\ldots
%    \begin{macrocode}
\def\@tempa#1{%
  \expandafter\newcommand\expandafter*\csname #1\endcsname{%
    {%
      \def\@tempa{#1}%
      \ifx\lettre@mainlang\@tempa\else\l@@info{Langage modifie: #1}\fi
    }%
    \lettreselectlanguage{#1}%
  }%
}%
\@tempa{romand}%
\@tempa{francais}%
\@tempa{allemand}%
\@tempa{anglais}%
\@tempa{americain}%
%    \end{macrocode}
% Crochet \cs{begin\{document\}}~:
%    \begin{macrocode}
\AtBeginDocument{%
  \makeatletter
  \@input{\jobname.tns}%
  \@input{\jobname.odt}%
  \begingroup\@floatplacement\@dblfloatplacement
  \immediate\openout\@tensionaux=\jobname.tns%
  \if@origdate
    \immediate\openout\@dateaux=\jobname.odt%
  \fi
  \endgroup
%    \end{macrocode}
% Pour écrire \og\cs{startlabels}\fg\ sur le fichier \verb+.etq+ et exécuter \cs{@startlabels}.
%    \begin{macrocode}
  \if@etiq
    \immediate\openout\@etiqaux=\jobname.etq%
    \immediate\write\@etiqaux{\string\startlabels}%
    \@startlabels
  \fi
%    \end{macrocode}
% On ouvre un groupe pour pouvoir bidouiller des définitions locales comme \cs{toks0}, etc.
%    \begin{macrocode}
    {%
%    \end{macrocode}
% On met dans \cs{@tempa} un traitement systématique à faire pour tout paquetage de gestion de langue chargé. En
% l'occurrence on désactive la rédéfinition des environnements \texttt{itemize} et consorts par
% \texttt{lettre} si un tel paquetage est chargé et qu'on n'a pas explicitement \texttt{keep envs=false}.
%    \begin{macrocode}
      \def\@tempa{%
        \ifnum\lettre@keep@envs=0 %
          \lettre@keep@envs=1 %
        \fi
      }%
%    \end{macrocode}
% Maintenant, redéfinition de la macro \cs{lettre@lmp@selectlanguage} selon le paquetage de gestion de
% langue\footnote{\emph{lmp} dans le nom de la macro veut dire \og Language Managagement Package\fg, c-à-d.\
% \og Paquetage de Gestion de Lange\fg.} utilisé. On va faire une boucle qui va scruter une liste
% d'association dont chaque élément sera de la forme \meta{paquetage}\texttt{:}\meta{cas}, où \meta{cas} est
% un nombre.\newline Tout d'abord on définit le traitement à appliquer à chacun des cas et on le place dans le
% registre \cs{toks}\meta{cas}. Premier cas possible, c.-à-d.\ $\meta{cas}=0$, c'est le cas par défaut où on
% ne trouve aucun \meta{paquetage} de gestion de langue, alors on ne fait rien, c'est à dire qu'on reste sur
% la définition par défaut de \cs{lettre@lmp@selectlanguage}.\\
% Mais encore, toujours dans ce $\meta{cas}=0$, c'est à dire dans le cas où l'on n'a détecté le chargement
% d'aucun paquetage de gestion de langue, si \cs{lettre@keep@envs} est à 0, c'est que de surcroît l'option
% \texttt{keep envs=true} n'a pas été donnée, alors on fait comme si on avait eu l'option \texttt{keep
% envs=false}, c'est à dire que \texttt{lettre} redéfinit les environnemnts \texttt{itemize} et consorts selon
% la langue~:
%    \begin{macrocode}
    \toks0{%
      \ifnum\lettre@keep@envs=0 %
	\lettre@keep@envs=2 %
      \fi
    }%
%    \end{macrocode}
% Deuxième cas possible, c.-à-d.\ $\meta{cas}=1$, on trouve un paquetage de gestion de langue qui fournit la
% macro \cs{selectlanguage}, alors \cs{lettre@lmp@selectlanguage} appelle \cs{selectlanguage} --- à noter que
% dans chaque cas on développe le traitement par défaut défini dans \cs{@tempa}~:
%    \begin{macrocode}
    \toks1\expandafter{\@tempa
      \def\lettre@lmp@selectlanguage#1{\selectlanguage{#1}}}%
%    \end{macrocode}
% Troisième cas possible, c.-à-d.\ $\meta{cas}=2$, le paquetage de gestion de langue fait partie
% d'\texttt{e-french}, on utilise \cs{lettre@efrench@selectlanguage} qui fait les traitements ad-hoc pour ce
% cas :
%    \begin{macrocode}
    \toks2\expandafter{\@tempa
      \let\lettre@lmp@selectlanguage\lettre@efrench@selectlanguage}%
%    \end{macrocode}
% Quatrième cas possible, c.-à-d.\ $\meta{cas}=3$, le paquetage de gestion de langue fait partie
% de \texttt{babel}, on utilise \cs{lettre@babel@selectlanguage} qui fait les traitements ad-hoc pour ce
% cas :
%    \begin{macrocode}
    \toks3\expandafter{\@tempa
      \let\lettre@lmp@selectlanguage\lettre@babel@selectlanguage}%
%    \end{macrocode}
% Le \meta{cas} sélectionné va être mis dans \cs{count}\texttt{0}, par défaut on initialise au premier cas :
%    \begin{macrocode}
    \count0=0 %
%    \end{macrocode}
% Et maintenant on se fait un macro \cs{@tempb} qui va analyser chaque élément de la liste d'association,
% c'est à dire qui va pour chaque \meta{paquetage} \texttt{\#1} testé, si ce paquetage est chargé sélectionner
% le bon \meta{cas} \texttt{\#2} :
%    \begin{macrocode}
  \def\lettre@iterate@body#1{\@tempb#1\@nil}%
  \def\@tempb#1:#2\@nil{%
    \@ifpackageloaded{#1}{%
      \l@@info{Le paquetage `#1' est charg'e}%
      \count0=#2 %
%    \end{macrocode}
% On redéfinit \cs{lettre@iterate} pour casser la boucle de scrutation de la liste d'association, de toute
% façon on est au sein d'un groupe, donc l'effet de cette re-définition est local :
%    \begin{macrocode}
      \def\lettre@iterate##1\@nil,{}%
    }{%
      \l@@info{Le paquetage `#1' n'est pas charg'e}%
    }%
  }%
%    \end{macrocode}
% Et voici la boucle elle-même, avec pour chaque paquetage le cas correspondant :
%    \begin{macrocode}
  \l@@info{Scrutation des paquetages de gestion de langue}%
  \lettre@iterate%
    babel:3,%
    polyglossia:1,%
    french:2,%
    mlp:2,%
    \@nil,%
%    \end{macrocode}
% Il n'y a plus qu'à appliquer le traitement correspondant au cas sélectionné :
%    \begin{macrocode}
  \expandafter
  }\the\toks\count0 %
  \makeatother
%    \end{macrocode}
% Fin du \cs{AtBeginDocument}.
%    \begin{macrocode}
}%
%    \end{macrocode}
% Crochet \cs{end\{document\}} pour sortir la page d'étiquettes, si nécessaire.
%    \begin{macrocode}
\AtEndDocument{%
  \l@@info{Nombre de lettres :\the\c@lettre}%
  \l@@info{Nombre de telefax :\the\c@telefax}%
  \newpage\begingroup 
  \immediate\closeout\@tensionaux%
  \if@origdate
    \immediate\closeout\@dateaux%
  \fi
  \if@letter
    \if@etiq 
      \immediate\closeout\@etiqaux%
      \makeatletter
      \@input{\jobname.etq}%
      \makeatother
      \clearpage
    \fi
  \else
    \immediate\closeout\@faxaux%
  \fi
  \endgroup
}%
%    \end{macrocode}
%
%\subsubsection{Styles de page}
%
%    \begin{macrocode}
\def\@texttop{\ifnum\c@page=1\vskip 0pt plus .00001fil\relax\fi}%
%    \end{macrocode}
%
%    \begin{macrocode}
\if@twoside
  \def\ps@headings{%
    \headheight 12pt%
    \headsep 25pt%
    \def\@oddhead{{\hspace{15mm}\ifx\@empty\fromlieu\else\fromlieu , \fi
                                  \pdate\hfill Page \thepage}}%
    \def\@oddfoot{}%
    \def\@evenhead{{Page \thepage\hfill\ifx\@empty\fromlieu\else\fromlieu , \fi
                                  \pdate\hspace{15mm}}}%
    \def\@evenfoot{}}%
\else
  \def\ps@headings{%
    \headheight 12pt%
    \headsep 25pt%
    \def\@oddhead{{\hspace{15mm}\ifx\@empty\fromlieu\else\fromlieu , \fi
                                  \pdate\hfill Page \thepage}}%
    \def\@oddfoot{}%
    \def\@evenhead{}%
    \def\@evenfoot{}}%
\fi
%    \end{macrocode}
% \DescribeMacro{\ps@empty}
%    \begin{macrocode}
\def\ps@empty{%
   \headheight 0pt%
   \headsep 9pt%
   \def\@oddhead{}%
   \def\@oddfoot{%
       \ifnum\c@page=1\relax
          \ifx\@empty\emailflag
             \ifx\@empty\bdp
             \else
                \hbadness=10000\relax
                \rlap{\parbox{\textwidth}{\mbox{}\\\rule{\textwidth}{.4pt}\\\bdp}}
                ~\hfill~
                \hbadness=1000\relax
             \fi
          \else
             \hbadness=10000\relax
             \rlap{\parbox{\textwidth}{\mbox{}\\\rule{\textwidth}{.4pt}\\\emailine}}%
             ~\hfill~
             \hbadness=1000\relax
          \fi
       \fi}%
   \def\@evenhead{}%
   \def\@evenfoot{}}%
%    \end{macrocode}
% \DescribeMacro{\ps@firstpage}
%    \begin{macrocode}
\def\ps@firstpage{%
   \headheight 12pt%
   \headsep 25pt%
   \def\@oddhead{}%
   \def\@oddfoot{}%
   \def\@evenhead{}%
   \def\@evenfoot{}}%
%    \end{macrocode}
% \DescribeMacro{\ps@plain}
%    \begin{macrocode}
\def\ps@plain{%
   \headheight 0pt%
   \headsep 9pt%
   \def\@oddhead{}%
   \def\@oddfoot{\textrm{\hfill\thepage\hfill}}%
   \def\@evenhead{}%
   \def\@evenfoot{\textrm{\hfill\thepage\hfill}}}%
%    \end{macrocode}
%
%\subsubsection{\texttt{center} et \texttt{flushleft}}
%
%    \begin{macrocode}
\def\normalcenter{\trivlist \normalcentering\item[]}%
\def\lettercenter{\trivlist \lettercentering\item[]}%
\def\normalcentering{\let\\=\@centercr\rightskip\@flushglue
                     \leftskip\@flushglue
                     \parindent\z@\parfillskip\z@}%
\def\lettercentering{\let\\=\@centercr\rightskip\@flushglue
                     \leftskip\@flushglue
                     \parindent\z@\parfillskip\z@}%
\let\endcenter=\endtrivlist
%    \end{macrocode}
% \DescribeMacro{\normalflushleft}
%    \begin{macrocode}
\def\normalflushleft{\trivlist \normalraggedright\item[]}%
\def\letterflushleft{\trivlist \letterraggedright\item[]}%
\def\normalraggedright{\let\\=\@centercr\leftskip\z@
                       \@rightskip\@flushglue\rightskip\@rightskip
                       \parindent\z@}%
\def\letterraggedright{\let\\=\@centercr\leftskip\z@
                       \@rightskip\@flushglue\rightskip\@rightskip
                       \parindent\z@}%
\let\endflushleft=\endtrivlist
%    \end{macrocode}
%
%\subsubsection{Listes}
%
% \DescribeMacro{\lettre@store@orig@envs}Tout d'abord on définit \cs{lettre@store@orig@envs} qui prend note de
% l'environnement \texttt{itemize} d'origine fourni par \LaTeX, et qui sera appelé \cs{AtBeginDocument}, et
% immédiatement après chaque changement de langue effectué par le paquetage de gestion de langue.
%    \begin{macrocode}
\newcommand*{\lettre@store@orig@envs}{%
\let\lettre@orig@itemize\itemize
\let\lettre@orig@enditemize\enditemize
}%
\AtBeginDocument{\lettre@store@orig@envs}%
%    \end{macrocode}
% \DescribeMacro{\lettre@restore@orig@envs}La macro \cs{lettre@restore@orig@envs} permet de restaurer les
% environnments \LaTeX\ que \texttt{lettre} redéfinit selon la langue. Notamment l'environnement
% \texttt{itemize} redéfini en français.
%    \begin{macrocode}
\newcommand*{\lettre@restore@orig@envs}{%
\let\itemize\lettre@orig@itemize
\let\enditemize\lettre@orig@enditemize}%
%    \end{macrocode}
% \DescribeMacro{\reset@frenchitemize}La macro \cs{reset@frenchitemize} est obsolète, appelez plutôt
% \cs{lettre@set@french@envs} définie dans \texttt{lettre-french.ldf}.
%    \begin{macrocode}
\newcommand*{\reset@frenchitemize}{\l@@warning@strictable
  {\protect\reset@frenchitemize\space est obsolete, utilisez
   plutot \protect\lettre@set@french@envs}\lettre@set@french@envs}
%    \end{macrocode}
%
%    \begin{macrocode}
\rightmargin   25mm%
\advance\rightmargin   5pt%
\leftmargini   1.5em%
\leftmarginii  2.2em%
\leftmarginiii 1.87em%
\leftmarginiv  1.7em%
\leftmarginv   1em%
\leftmarginvi  1em%
\labelsep 5pt%
\parsep 0pt%
\def\@listi{\leftmargin\leftmargini\labelwidth\leftmargin
   \advance\labelwidth-\labelsep}%
\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii\advance\labelwidth-\labelsep}%
\def\@listiii{\leftmargin\leftmarginiii
    \labelwidth\leftmarginiii\advance\labelwidth-\labelsep
    \topsep .1em% 
    \itemsep \topsep}%
\def\@listiv{\leftmargin\leftmarginiv
     \labelwidth\leftmarginiv\advance\labelwidth-\labelsep}%
\def\@listv{\leftmargin\leftmarginv
     \labelwidth\leftmarginv\advance\labelwidth-\labelsep}%
\def\@listvi{\leftmargin\leftmarginvi
     \labelwidth\leftmarginvi\advance\labelwidth-\labelsep}%
%    \end{macrocode}
%
%    \begin{macrocode}
\def\labelitemi{$\bullet$}%
\def\labelitemii{\bfseries --}%
\def\labelitemiii{$\ast$}%
\def\labelitemiv{$\cdot$}%
%    \end{macrocode}
%
%    \begin{macrocode}
\def\labelenumi{\arabic{enumi}.}%
\def\theenumi{\arabic{enumi}}%     
\def\labelenumii{(\alph{enumii})}%
\def\theenumii{\alph{enumii}}%
\def\p@enumii{\theenumi}%
\def\labelenumiii{\roman{enumiii}.}%
\def\theenumiii{\roman{enumiii}}%
\def\p@enumiii{\theenumi(\theenumii)}%
\def\labelenumiv{\Alph{enumiv}.}%
\def\theenumiv{\Alph{enumiv}}%
\def\p@enumiv{\p@enumiii\theenumiii}%
%    \end{macrocode}
% \DescribeEnv{verse}
%    \begin{macrocode}
\def\verse{\let\\=\@centercr  
  \list{}{\itemsep\z@ \itemindent -15pt\listparindent \itemindent 
          \rightmargin\leftmargin\advance\leftmargin 15pt}\item[]}%
\let\endverse\endlist
%    \end{macrocode}
% \DescribeEnv{quotation}
%    \begin{macrocode}
\def\quotation{\list{}{\listparindent 1.5em%
    \itemindent\listparindent
    \rightmargin\leftmargin}\item[]}%
\let\endquotation=\endlist
%    \end{macrocode}
% \DescribeEnv{quote}
%    \begin{macrocode}
\def\quote{\list{}{\rightmargin\leftmargin}\item[]}%
\let\endquote=\endlist
%    \end{macrocode}
% \DescribeMacro{\descriptionlabel}Format des étiquettes de listes de type \texttt{description}.
% \changes{3.001}{2020-02-25}{Étiquettes de liste \texttt{description} en gras.}
%    \begin{macrocode}
\def\descriptionlabel#1{\bfseries #1}%
%    \end{macrocode}
% \DescribeEnv{description}
%    \begin{macrocode}
\def\description{\list{}{\advance\leftmargin by 5.75em
       \labelwidth\leftmargin \advance\labelwidth -\labelsep 
       \let\makelabel\descriptionlabel}}%
\let\enddescription\endlist
%    \end{macrocode}
%
%\subsubsection{Divers}
%
%    \begin{macrocode}
\def\@begintheorem#1#2{\itshape \trivlist \item[\hskip \labelsep{\bfseries #1\ #2}]}%
\def\@endtheorem{\endtrivlist}%
%    \end{macrocode}
% \DescribeMacro{\theequation}
%    \begin{macrocode}
\def\theequation{\arabic{equation}}%
%    \end{macrocode}
%
%    \begin{macrocode}
\arraycolsep 5pt%
\tabcolsep 5pt%
\arrayrulewidth .4pt%
\doublerulesep 2pt%
\tabbingsep\labelsep
\skip\@mpfootins=\skip\footins
%    \end{macrocode}
% Espace laissé entre la boîte et le texte par \cs{fbox} et \cs{framebox}.
%    \begin{macrocode}
\fboxsep = 3pt
%    \end{macrocode}
% Épaisseur des filets faits par \cs{fbox} et \cs{framebox}.
%    \begin{macrocode}
\fboxrule = .4pt
%    \end{macrocode}
%\changes{3.000}{2015-12-20}{Ajout \cs{today} nécessaire à \texttt{e-french}.}%
%    \begin{macrocode}
\newcommand*\today{\cejour}
%    \end{macrocode}
%
%\subsubsection{Notes en bas de page}
%
%    \begin{macrocode}
\def\footnoterule{\kern-1\p@   
  \hrule width .4\columnwidth 
  \kern .6\p@}%
%    \end{macrocode}
% \DescribeMacro{\@makefntext}
%    \begin{macrocode}
\long\def\@makefntext#1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}#1}%
%    \end{macrocode}
%
%\subsection{Initialisations}
%\subsubsection{Initialisation des valeurs par défauts}
%
%    \begin{macrocode}
\def\pict@let@width{185}%
\def\pict@let@height{65}%
\def\pict@let@hoffset{0}%
\def\pict@let@voffset{0}%
\def\rule@hpos{-25}%
\def\rule@vpos{-15}%
\def\rule@length{10}%
\def\fromaddress@let@hpos{-10}%
\def\fromaddress@let@vpos{70}%
\fromaddress@let@width=69mm
\def\fromlieu@let@hpos{90}%
\def\fromlieu@let@vpos{62}%
\fromlieu@let@width=69mm
\def\toaddress@let@hpos{90}%
\def\toaddress@let@vpos{40}%
\toaddress@let@width=80mm
%    \end{macrocode}
%
%    \begin{macrocode}
\def\pict@fax@width{185}%
\def\pict@fax@height{30}%
\def\pict@fax@hoffset{0}%
\def\pict@fax@voffset{0}%
\def\fromaddress@fax@hpos{-10}%
\def\fromaddress@fax@vpos{30}%
\fromaddress@fax@width=69mm
\def\faxstring@hpos{90}%
\def\faxstring@vpos{20}%
\faxstring@width=69mm%
\faxbox@width=170mm%
\toaddress@fax@width=69mm%
\fromname@fax@width=69mm%
%    \end{macrocode}
%\changes{2.354}{2014-10-21}{Ajout \cs{lettre@vref@width} et \cs{lettre@nref@width}}%
%    \begin{macrocode}
\lettre@vref@width=21mm%
\lettre@nref@width=21mm%
%    \end{macrocode}
% \DescribeMacro{\lettre@input@institut}Définition par défaut de \cs{lettre@input@institut}, cette définition
% peut être changée par l'appel à \cs{institut}.
% \changes{3.000}{2015-10-30}{Nom fichier institut par défaut en
% \texttt{lettre-default.cfg}}
%    \begin{macrocode}
\def\lettre@input@institut{\makeatletter
         \input{lettre-default.cfg}%
         \makeatother}%
%    \end{macrocode}
%
%    \begin{macrocode}
\smallskipamount=.5\parskip
\medskipamount=\parskip
\bigskipamount=2\parskip
%    \end{macrocode}
%
%    \begin{macrocode}
\ps@plain
\pagenumbering{arabic}%
\raggedbottom
\onecolumn
%    \end{macrocode}
% \subsubsection{Initialisations des variables de la lettre}
%    \begin{macrocode}
\def\pdate{\cejour}%
%    \end{macrocode}
%    \begin{macrocode}
\def\emailnum{}%
%    \end{macrocode}
%    \begin{macrocode}
\def\fromlocation{}%
\signum=0\relax
\def\fromsig{}%
\def\fromssig{}%
\def\fromtsig{}%
%    \end{macrocode}
% Langue française par défaut, si rien d'autre n'a été demandé.
%    \begin{macrocode}
\ifx\lettre@mainlang\@empty
   \def\lettre@mainlang{francais}%
   \lettreloadlang{french}%
\fi
%    \end{macrocode}
% Sélection de la langue principale au début du document.
%    \begin{macrocode}
{%
  \edef\@tempa{%
    \noexpand\AtBeginDocument{%
      \noexpand\lettreselectlanguage{\lettre@mainlang}%
      \noexpand\l@@info{Langage par defaut: \lettre@mainlang}}%
  }%
\expandafter}\@tempa
%    \end{macrocode}
%    \begin{macrocode}
\def\concdecl{}%
\marge{15mm}%
\msigwidth=\letterwidth
\ssigindent=0.5\letterwidth
\ssigwidth=\letterwidth
  \advance\ssigwidth by -\ssigindent
  \advance\ssigwidth by -5pt
\sigspace=1.5cm
\openingspace=1cm
\openingindent=0pt
%    \end{macrocode}
%    \begin{macrocode}
\@lettertrue        
\faxpage=0\relax
\def\totalpages{}%
%    \end{macrocode}
%    \begin{macrocode}
\def\auxflag{}%
\auxcount=0\relax
%    \end{macrocode}
% \changes{2.354}{2014-10-21}{Un argument vide à \cs{Vref} ou \cs{Nref} supprime la référence}%
%    \begin{macrocode}
\let\toref\space
\let\fromref\space
\def\telexnum{}%
\def\ccpnum{}%
%    \end{macrocode}
%    \begin{macrocode}
\def\emailflag{}%
\emailcount=0\relax
\def\@username{}%
\def\ccittnum{}%
\def\internetnum{}%
\def\bitnetnum{}%
\def\telepacnum{}%
\def\decnetnum{}%
%    \end{macrocode}
%    \begin{macrocode}
\def\bdp{}%
\endinput
%    \end{macrocode}
%^^A End of file `lettre.cls'.
\iffalse Local Variables: \fi
\iffalse mode: DocTeX\fi
\iffalse ispell-dictionary: "francais"\fi
\iffalse End: \fi
