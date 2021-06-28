%%
%% This is file `verifica.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% verifica.dtx  (with options: `class')
%% 
%%  Copyright 2020 Riccardo Dossena
%% 
%%  This program is provided under the terms of the
%%  LaTeX Project Public License distributed from CTAN
%%  archives in directory macros/latex/base/lppl.txt.
%% 
%%  Author: Riccardo Dossena
%% 
%%  This work has the LPPL maintenance status `maintained'.
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{verifica}
    [2020/10/10 v1.3 Riccardo Dossena]
\newif\if@blacktriangleright
\newif\if@intestrighe
\newif\if@intestsemplice
\newif\if@extrasize
\newif\if@senzagrazie
\DeclareOption{10pt}{\def\ver@ptsize{0}}
\DeclareOption{11pt}{\def\ver@ptsize{1}}
\DeclareOption{12pt}{\def\ver@ptsize{2}}
\DeclareOption{14pt}{\@extrasizetrue}
\DeclareOption{default}{\@blacktrianglerighttrue}
\DeclareOption{itembullet}{\@blacktrianglerightfalse}
\DeclareOption{intestazionerighe}{\@intestrighetrue}
\DeclareOption{intestazionesemplice}{\@intestsemplicetrue}
\DeclareOption{senzagrazie}{\@senzagrazietrue}
\ExecuteOptions{default,11pt}
\ProcessOptions
\if@extrasize
  \LoadClass[a4paper,14pt]{extarticle}
\else
  \LoadClass[a4paper,1\ver@ptsize pt]{article}
\fi
\RequirePackage[shortlabels,inline]{enumitem}
\RequirePackage{graphicx}
\RequirePackage{mathtools}
\RequirePackage{amssymb}
\RequirePackage{geometry}
\RequirePackage{nccmath}
\RequirePackage{multido}
\RequirePackage{setspace}
\RequirePackage{multicol}
\RequirePackage{gensymb}
\RequirePackage{newunicodechar}
\RequirePackage{textcomp}
\RequirePackage{tabto}
\RequirePackage{tabularx}
\RequirePackage[running]{lineno}
\geometry{top=1cm,bottom=1.5cm,left=1.5cm,right=1.5cm}
\pagestyle{empty}
\if@senzagrazie
  \AtBeginDocument{%
    \RequirePackage{cmbright}
}
\fi
\AtBeginDocument{%
\@ifpackagewith{babel}{italian}{%
  \setISOcompliance
  \IntelligentComma
\relax}{}
\@ifpackageloaded{cmbright}{%
  \SetSymbolFont{operators}{bold}{OT1}{cmbr}{b}{n}
\relax}{}
\RequirePackage{eurosym}
\RequirePackage{bm}
\let\@tempvarphi\phi
\let\@tempvartheta\theta
\renewcommand{\phi}{\varphi}
\renewcommand{\theta}{\vartheta}
\newcommand{\restorephi}{\renewcommand{\phi}{\@tempvarphi}}
\newcommand{\restoretheta}{\renewcommand{\theta}{\@tempvartheta}}
}
\DeclarePairedDelimiter\abs{\lvert}{\rvert}
\def\@tipologia{verifica}
  \newcommand{\tipologia}[1]{\def\@tipologia{#1}}
\def\@disciplina{matematica}
  \newcommand{\disciplina}[1]{\def\@disciplina{#1}}
\def\@istituto{Liceo ``G. Novello'' -- Codogno}
  \newcommand{\istituto}[1]{\def\@istituto{#1}}
\def\@data{\today}
  \newcommand{\data}[1]{\def\@data{#1}}
\let\@classe\undefined
  \newcommand{\classe}[1]{\def\@classe{Classe~#1}}
\let\@tempo\undefined
  \newcommand{\tempo}[1]{\def\@tempo{#1}}
\let\@lineanome\undefined
  \newcommand{\lineanome}{\def\@lineanome{\relax}}
\newlength{\@prima}
\newlength{\@seconda}
\def\intestazionedefault{%
  \def\@tabellauno{%
    \begin{tabular}{|c|}
    \hline \\[-.2cm]
    \textbf{\MakeUppercase{\@tipologia} DI \MakeUppercase{\@disciplina}}\\[.2cm]
    \textbf{\@istituto}\\[.2cm]
    \textbf{\@data}\\[.2cm]
    \hline
    \end{tabular}}
  \setlength{\@prima}{\widthof{\@tabellauno}}
  \setlength{\@seconda}{\textwidth-\@prima-.7cm}
  \ifdefined\@classe
    \def\@@classe{\@classe}
  \else
    \def\@@classe{}
  \fi
  \ifdefined\@lineanome
    \def\@@lineanome{\raisebox{-4pt}{\dotrule{\linewidth}}}
  \else
    \def\@@lineanome{\relax}
  \fi
  \def\@tabelladue{%
    \begin{tabular}{|p{\@seconda}|}
    \hline \\[-.2cm]
    Cognome e nome  \\[.2cm]
    \@@lineanome    \\[.2cm]
    \@@classe       \\[.2cm]
    \hline
  \end{tabular}}
  \ifdefined\@tempo
    \def\tempo@ad{\begin{center}%
      \textit{Tempo a disposizione: \@tempo}\end{center}}
  \else
    \def\tempo@ad{\vspace{.5cm}}
  \fi
\noindent\@tabellauno\hfill\@tabelladue\tempo@ad}
\def\intestazionerighe{%
\ifdefined\@classe
  \def\@@classe{\@classe}
\else
  \def\@@classe{}
\fi
\ifdefined\@lineanome
  \def\@@lineanome{%
    \noindent {\small Cognome e nome} \dotrule{.3\textwidth}\par\vskip6pt}
\else
  \def\@@lineanome{\relax}
\fi
\ifdefined\@tempo
  \def\tempo@ad{{\centering%
    \textit{Tempo a disposizione: \@tempo}\par}\vspace{.5em}}
\else
  \def\tempo@ad{\vspace{.1em}}
\fi
\@@lineanome
\null\vspace{-1cm}
\noindent\hrulefill \\
\noindent\makebox[.3\linewidth][l]{\small\@istituto} \hfill%
\makebox[.3\linewidth]{\@@classe} \hfill%
\makebox[.3\linewidth][r]{\small\@data}%
\begin{center}
  \textbf{\MakeUppercase{\@tipologia} DI \MakeUppercase{\@disciplina}}\\[-.5em]
  \hrulefill
\end{center}
\tempo@ad}
\def\intestazionesemplice{%
\ifdefined\@classe
  \def\@@classe{\@classe}
\else
  \def\@@classe{}
\fi
\ifdefined\@lineanome
  \def\@@lineanome{%
    \noindent {\small Cognome e nome} \dotrule{.3\textwidth}\par\vskip4pt}
\else
  \def\@@lineanome{\relax}
\fi
\ifdefined\@tempo
  \def\tempo@ad{{\centering%
    \textit{Tempo a disposizione: \@tempo}\par}\vspace{.5em}}
\else
   \def\tempo@ad{\vspace{.1em}}
\fi
\@@lineanome
\noindent\makebox[.3\linewidth][l]{\small\@istituto} \hfill%
\makebox[.3\linewidth]{\@@classe} \hfill%
\makebox[.3\linewidth][r]{\small\@data}%
\begin{center}
  \textbf{\MakeUppercase{\@tipologia} DI \MakeUppercase{\@disciplina}}\\[-.5em]
\end{center}
\tempo@ad}
\if@intestrighe
  \def\intestazione{\intestazionerighe}
\else
  \if@intestsemplice
    \def\intestazione{\intestazionesemplice}
  \else
    \def\intestazione{\intestazionedefault}
  \fi
\fi
\newunicodechar{°}{\ensuremath{^\circ}}
\newcommand{\tsa}{\textsuperscript{a}\,}
\newcommand{\tso}{\textsuperscript{o}\,}
\newcommand{\eps}{\varepsilon}
\newcommand{\del}{\delta}
\newcommand{\Del}{\Delta}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\dss}[1]{\displaystyle{#1}}
\DeclareFontFamily{U}{tipa}{}
\DeclareFontShape{U}{tipa}{m}{n}{<->tipa10}{}
\newcommand{\arc@char}{{\usefont{U}{tipa}{m}{n}\symbol{62}}}
\newcommand{\arc}[1]{\mathpalette\arc@arc{#1}}
\newcommand{\arc@arc}[2]{%
  \sbox0{$\m@th#1#2$}%
  \vbox{%
    \hbox{\resizebox{\wd0}{\height}{\arc@char}}
    \nointerlineskip
    \box0
  }
}
\DeclareFontFamily{OMX}{yhex}{}
\DeclareFontShape{OMX}{yhex}{m}{n}{<->yhcmex10}{}
\DeclareSymbolFont{yhlargesymbols}{OMX}{yhex}{m}{n}
\DeclareMathAccent{\vararc}{\mathord}{yhlargesymbols}{"F3}
\newcommand\ddfrac[2]{\frac{\,\displaystyle #1\,}{\,\displaystyle #2\,}}
\newcommand\numfrac[2]{\frac{#1}{#2\mathstrut}}
\newcommand\denfrac[2]{\frac{\mathstrut#1}{#2}}
\newcommand{\unitx}[1]{\ensuremath{\,\mathrm{#1}}}
\if@blacktriangleright
  \def\labelitemi{\small $\blacktriangleright$}
\fi
\if@senzagrazie
  \def\@labelstyle{\textup}
\else
  \def\@labelstyle{\textit}
\fi
\newcommand{\labelbox}[1]{\fbox{\parbox[][.2cm][c]{.2cm}{#1}}}
\newcommand{\biglabelbox}[1]{\fbox{\parbox[b][.25cm][c]{.25cm}{#1}}}
\if@extrasize
  \renewcommand{\labelbox}[1]{\fbox{\parbox[][.3cm][c]{.3cm}{#1}}}
  \renewcommand{\biglabelbox}[1]{\fbox{\parbox[b][.35cm][c]{.35cm}{#1}}}
\fi
\def\@risp{\labelbox{\@labelstyle{\alph*}}}
\newlist{esercizi}{enumerate}{1}
  \setlist[esercizi]{\bfseries 1.,itemsep=2em,leftmargin=*}
\newlist{test}{enumerate}{1}
  \setlist[test]{\@risp,leftmargin=*}
\newlist{test-orizz}{enumerate*}{1}
  \setlist[test-orizz]{%
    \@risp,before=\hspace{1em},itemjoin=\hspace{1.2em},afterlabel=~~}
\newcommand{\labeltest}[1]{%
  \renewlist{test}{enumerate}{1}
    \setlist[test]{#1,leftmargin=*}
  \renewlist{test-orizz}{enumerate*}{1}
    \setlist[test-orizz]{%
      #1,before=\hspace{1em},itemjoin=\hspace{1.2em},afterlabel=~~}
}
\newenvironment{test-orizz-newline}[1][]{%
  \par\begin{test-orizz}[before=\noindent,#1]}{\end{test-orizz}}
\newcommand{\vf}{%
  \iflanguage{english}{%
    \hfill{\small\biglabelbox{T}~\biglabelbox{F}}}{%
    \hfill{\small\biglabelbox{V}~\biglabelbox{F}}}%
}
\def\@fattorevf{.75}
\def\@fattorevferror{%
    \ClassError{verifica}{%
    \protect\fattorevf\space e fattorevf devono avere come argomento
    un\MessageBreak numero compreso tra 0 e 1}{%
    Riprova scrivendo \protect\fattorevf{.85} o fattorevf=.85
    o qualcosa di simile. Ciao ;) \MessageBreak}%
}
\newcommand{\fattorevf}[1]{%
  \ifdim0pt<#1pt\relax
    \ifdim1pt>#1pt\relax
      \def\@fattorevf{#1}
    \else
      \@fattorevferror
    \fi
  \else
      \@fattorevferror
  \fi
}
\newcounter{mylines}
\newsavebox{\@boxcountlines}
\newcommand{\CalcNumber}[2]{%
\savebox{\@boxcountlines}{%
  \begin{minipage}{\linewidth}\linenumbers*
    \begin{internallinenumbers}
      #1\par
      \setcounter{mylines}{\thelinenumber}\addtocounter{mylines}{-1}
    \end{internallinenumbers}
  \end{minipage}}
  \let#2=\themylines
}
\newcommand{\Repeat}{\multido{\i=1+1}}
\newcounter{numrighe}
\newcommand{\verofalso}[2][\@fattorevf]{%
  \renewcommand{\tabcolsep}{0em}%
  \begin{tabularx}{\linewidth}[b]{p{#1\linewidth}X}%
    {#2}\CalcNumber{#2}{\myx}\setcounter{numrighe}{\myx-1}%
    & \phantom{e}\Repeat{\value{numrighe}}\newline\phantom{e}\vf \\
  \end{tabularx}
}
\enitkv@key{}{fattorevf}{\fattorevf{#1}}
\newlist{test-vf}{enumerate}{1}
  \setlist[test-vf]{label=\alph*)}
\newcommand{\vfitem}[1]{\item\verofalso{#1}}
\newenvironment{test-verofalso}[1][]{%
  \begin{test-vf}[#1]}{\end{test-vf}}
\newcommand{\@leadersbox}{.45em}
\newcommand{\@tratto}{.}
\newcommand{\@completeleaders}{%
  \leavevmode\leaders\hbox to \@leadersbox{\hss\@tratto\hss}\hfill\kern0pt}
\newcommand{\dotrule}[1]{%
  \parbox[t]{#1}{\@completeleaders}}
\newcommand{\dotword}[1]{%
  \parbox[t]{\widthof{#1} * \real{2}}{\@completeleaders}}
\newcommand{\@rigaleaders}{%
  \leavevmode\leaders\hbox to \@leadersbox{\hss\@tratto\hss}\hfill\kern0pt\par}
\newcommand{\riga}[1]{%
  \doublespacing\Repeat{#1}{\noindent\@rigaleaders}\singlespacing}
\newcommand{\@punteggio}{Punti}
\newcommand{\punti}[2][\@nil]{%
  \hfill\vphantom{,}\nolinebreak[1]\null~\hfill%
  [\textsc{\@punteggio~#2%
    \def\tmp{#1}%
      \ifx\tmp\@nnil
        \relax
      \else
        ~\mbox{#1}%
      \fi}]%
}
\newcommand{\puntiman}[2][\@nil]{%
  \hfill%
  [\textsc{\@punteggio~#2%
    \def\tmp{#1}%
      \ifx\tmp\@nnil
        \relax
      \else
        ~\mbox{#1}%
      \fi}]%
}
\newcommand{\punti@dx}[2][\@nil]{%
  \hfill\vphantom{,}\nolinebreak[1]\null~\hfill%
    [\textsc{#2~\@punteggio%
    \def\tmp{#1}%
      \ifx\tmp\@nnil
        \relax
      \else
        ~\mbox{#1}%
      \fi}]%
}
\newcommand{\puntiman@dx}[2][\@nil]{%
  \hfill%
    [\textsc{#2~\@punteggio%
    \def\tmp{#1}%
      \ifx\tmp\@nnil
        \relax
      \else
        ~\mbox{#1}%
      \fi}]%
}
\def\puntiadestra{%
  \renewcommand{\punti}{\punti@dx}
  \renewcommand{\puntiman}{\puntiman@dx}
}
\def\puntipt{%
  \renewcommand{\@punteggio}{Pt.}}
\newcommand{\totpunti}[1][/10 + 1]{%
  \vfill
  \begin{flushright}
  {\renewcommand{\arraystretch}{1.5}
    \begin{tabular}{|cc|}
      \hline
        & {\hspace{-7pt}\textbf{VOTO}} \\
      {\textbf{Totale punti} \fbox{\phantom{\LARGE MM}} $\bm{#1=}$}%
        & \hspace{-7pt}\fbox{\phantom{\Huge MM}} \\
      \hline
    \end{tabular}}
  \end{flushright}}
\newcommand{\vartotpunti}[1][/10 + 1]{%
  \begin{flushright}
  {\renewcommand{\arraystretch}{1.5}
    \begin{tabular}{|cc|}
      \hline
        & {\hspace{-7pt}\textbf{VOTO}} \\
      {\textbf{Totale punti} \fbox{\phantom{\LARGE MM}} $\bm{#1=}$}%
        & \hspace{-7pt}\fbox{\phantom{\Huge MM}} \\
      \hline
    \end{tabular}}
  \end{flushright}}
\endinput
%%
%% End of file `verifica.cls'.
