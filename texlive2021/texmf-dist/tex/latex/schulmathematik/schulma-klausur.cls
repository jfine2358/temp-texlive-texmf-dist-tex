% schulmathematik bundle: document class schulma-klausur
% Version 1.1
% 13. März 2021
\NeedsTeXFormat{LaTeX2e}
\ProvidesExplClass{schulma-klausur}{2021-03-13}{1.1}{Dokumentenklasse fuer Klausuren}

\RequirePackage {xparse}
\RequirePackage {etoolbox}

\str_new:N \g_schulma_klausur_datum_str
\str_new:N \g_schulma_klausur_titel_str
\str_new:N \g_schulma_klausur_teiltitel_str
\str_new:N \g_schulma_klausur_bearbeitungszeit_str

\tl_new:N \g_schulma_klausur_kurs_tl
\tl_new:N \g_schulma_klausur_nummer_tl
\tl_new:N \g_schulma_klausur_untertitel_tl
\tl_new:N \g_schulma_klausur_hilfsmittel_tl
\tl_new:N \l_schulma_klausur_aufgabentitel_tl

\bool_new:N \g_schulma_klausur_oesterreich_bool
\bool_new:N \g_schulma_klausur_afuenfquer_bool
\bool_new:N \g_schulma_klausur_schriftliche_lernkontrolle_bool
\bool_new:N \g_schulma_klausur_zwei_gruppen_bool
\bool_new:N \g_schulma_klausur_gruppe_a_bool
\bool_new:N \g_schulma_klausur_pqformel_bool
\bool_new:N \g_schulma_klausur_differenzenquotient_bool
\bool_new:N \g_schulma_klausur_differentialquotient_bool
\bool_new:N \g_schulma_klausur_musterloesung_bool

\int_new:N \g_schulma_klausur_anzahl_hilfen_int

\clist_new:N \l_schulma_klausur_notenliste_clist

\tl_const:Nn \c_schulma_klausur_pqformel_tl
  {
    $p$-$q$-Formel:
    \[ x\sb{1;2} = - \frac{p}{2} \pm \sqrt { \left(\frac{p}{2}\right)^2-q } \]
  }

\tl_const:Nn \c_schulma_klausur_differenzenquotient_tl
  {
    Differenzenquotient:
    \[ m = \frac {f(x\sb{2})-f(x\sb{1})} {x\sb{2}-x\sb{1}} \]
  }

\tl_const:Nn \c_schulma_klausur_differentialquotient_tl
  {
    Differentialquotient:
    \[ f' ( x\sb{0} ) = \lim \sb { x \rightarrow x\sb{0} }
    \frac {f(x)-f(x\sb{0})} {x-x\sb{0}} \]
  }

\tl_set:Nn \l_schulma_klausur_aufgabentitel_tl {Aufgabe}

\bool_gset_true:N \g_schulma_klausur_gruppe_a_bool

\DeclareOption {SLK}
  {
    \bool_gset_true:N \g_schulma_klausur_schriftliche_lernkontrolle_bool
  }

\DeclareOption {p-q-Formel}
  {
    \int_incr:N \g_schulma_klausur_anzahl_hilfen_int
    \bool_set_true:N \g_schulma_klausur_pqformel_bool
  }

\DeclareOption {Differenzenquotient}
  {
    \int_incr:N \g_schulma_klausur_anzahl_hilfen_int
    \bool_set_true:N \g_schulma_klausur_differenzenquotient_bool
  }

\DeclareOption {Differentialquotient}
  {
    \int_incr:N \g_schulma_klausur_anzahl_hilfen_int
    \bool_set_true:N \g_schulma_klausur_differentialquotient_bool
  }

\DeclareOption {A5quer}
  {
    \PassOptionsToClass {a5paper} {scrartcl}
    \bool_gset_true:N \g_schulma_klausur_afuenfquer_bool
  }

\DeclareOption {AT}
  {
    \bool_gset_true:N \g_schulma_klausur_oesterreich_bool
  }

\DeclareOption {GruppeA}
  {
    \bool_gset_true:N \g_schulma_klausur_zwei_gruppen_bool
  }

\DeclareOption {GruppeB}
  {
    \bool_gset_true:N \g_schulma_klausur_zwei_gruppen_bool
    \bool_gset_false:N \g_schulma_klausur_gruppe_a_bool
  }

\DeclareOption {Musterloesung}
  {
    \bool_gset_true:N \g_schulma_klausur_musterloesung_bool
  }

\DeclareOption*
  {
    \PassOptionsToClass {\CurrentOption} {scrartcl}
    \PassOptionsToClass {\CurrentOption} {schulma-praes}
  }

\ProcessOptions \relax

\bool_if:NTF \g_schulma_klausur_schriftliche_lernkontrolle_bool
  {
    \str_gset:Nn \g_schulma_klausur_titel_str {Schriftliche~Lernkontrolle}
  }
  {
    \str_gset:Nn \g_schulma_klausur_titel_str {Klausur}
  }

\PassOptionsToPackage {override} {xcolor}

\NewDocumentCommand \Nr {m}
  {
    \tl_gset:Nn \g_schulma_klausur_nummer_tl {#1}
  }

\newcounter {Aufgabe}
\newcounter {Teilaufgabe} [Aufgabe]

\newlength \Aufgabenabstand
\setlength \Aufgabenabstand {24pt plus12pt minus8pt}

\newlength \Teilaufgabenabstand
\setlength \Teilaufgabenabstand {4.5pt plus2pt minus1pt}

\bool_if:NTF \g_schulma_klausur_musterloesung_bool
  {
    \LoadClass [t] {schulma-praes}

    \tl_set:Nn \g_schulma_praes_nummer_tl
      {
        Musterl\"osung~der~
        \tl_if_empty:NF \g_schulma_klausur_nummer_tl
          {
            \g_schulma_klausur_nummer_tl.~
          }
        \bool_if:NTF \g_schulma_klausur_schriftliche_lernkontrolle_bool
          {
            schriftlichen~Lernkontrolle
          }
          {
            \g_schulma_klausur_titel_str
          }
        \DTMifsaveddate {g_schulma_klausur_klausurdatum}
          {
            \c_space_tl
            vom~
            \DTMusedate {g_schulma_klausur_klausurdatum}
          }
          {} % \DTMifsaveddate hat drei Argumente
        \str_if_empty:NF \g_schulma_klausur_teiltitel_str
          {
            \\ [1ex]
            \textit { \g_schulma_klausur_teiltitel_str }
          }
      }

    \resetcounteronoverlays {Aufgabe}

    \NewDocumentCommand \Aufgabe {s o d()}
      {
        \stepcounter {Aufgabe}
        \frametitle
          {
            \l_schulma_klausur_aufgabentitel_tl
            \c_space_tl
            \arabic {Aufgabe}
            \IfValueT {#2} { \c_colon_str \c_space_tl #2 }
          }
        \FarbeAufgabe
      }

    \resetcounteronoverlays {Teilaufgabe}

    \NewDocumentEnvironment {Teilaufgaben} { }
      {
        \begin {list} { \stepcounter {Teilaufgabe} \alph {Teilaufgabe} ) }
          {
            \setlength \topsep {\Teilaufgabenabstand}
            \setlength \itemsep {\Teilaufgabenabstand}
            \FarbeAufgabe
          }
      }
      {
        \end {list}
      }

    \NewDocumentEnvironment {Lsg} {s}
    % Stern: Lösung beginnt mit einer Gleichung, kein Abstand erforderlich
      {
        \IfBooleanF {#1}
          {
            \par
            \medskip
          }
    
        \FarbeLoesung
      }
      {
      }  

    \RenewDocumentCommand \Datum {m}
      {
        \DTMsavedate {g_schulma_klausur_klausurdatum} {#1}
      }
  }
  {
    \LoadClass {scrartcl}
    \RequirePackage {scrlayer-scrpage}

    \BeforeClosingMainAux
      {
        \addtocounter{page}{-1}
        \label{LastPage}
      }

    \NewDocumentCommand \Kurs {m}
      {
        \tl_gset:Nn \g_schulma_klausur_kurs_tl {#1}
      }

    \NewDocumentCommand \Datum {m}
      {
        \str_set:Nn \g_schulma_klausur_datum_str {#1}
      }

    \NewDocumentEnvironment {Teilaufgaben} { }
      {
        \renewcommand \labelenumi { ( \roman {enumi} ) }

        \begin {list} { \stepcounter {Teilaufgabe} \alph {Teilaufgabe} ) }
          {
            \setlength \topsep {\Teilaufgabenabstand}
            \setlength \itemsep {\Teilaufgabenabstand}
          }
      }
      {
        \end {list}
      }

    \AfterEndPreamble
      {
        \begin {list} { }
          {
            \setlength \leftmargin {0pt}
            \setlength \partopsep {0pt}
            \setlength \topsep {0.75\Aufgabenabstand}
            \setlength \itemsep {\Aufgabenabstand}
          }
        % innerhalb der Liste Originalwert verwenden
        \setlength \topsep {9pt plus3pt minus5pt}
      }

    \AtBeginDocument {\schulma_klausur_kopf:}

    \pretocmd {\enddocument}
      {
        \end {list}
        \par  
        \int_compare:nNnT {\g_schulma_klausur_anzahl_hilfen_int} > {1}
          {
            \vfill
            \noindent
            \textsl {Hilfen:}
            \begin {itemize}
    
            \bool_if:NT \g_schulma_klausur_pqformel_bool
              {
                \item
                \c_schulma_klausur_pqformel_tl
              }
            \bool_if:NT \g_schulma_klausur_differenzenquotient_bool
              {
                \item
                \c_schulma_klausur_differenzenquotient_tl
              }
            \bool_if:NT \g_schulma_klausur_differentialquotient_bool
              {
                \item
                \c_schulma_klausur_differentialquotient_tl
              }
    
            \end {itemize}
          }
        \int_compare:nNnT {\g_schulma_klausur_anzahl_hilfen_int} = {1}
          {
            \vfill
            \noindent
            \textsl {Hilfe:} ~
    
            \bool_if:NT \g_schulma_klausur_pqformel_bool
              {
                \c_schulma_klausur_pqformel_tl
              }
            \bool_if:NT \g_schulma_klausur_differenzenquotient_bool
              {
                \c_schulma_klausur_differenzenquotient_tl
              }
            \bool_if:NT \g_schulma_klausur_differentialquotient_bool
              {
                \c_schulma_klausur_differentialquotient_tl
              }
          }
      }{}{} % pretocmd hat vier Argumente

    \NewDocumentCommand \Aufgabe {s o d()}
      {
        \item
        \stepcounter {Aufgabe}
        \group_begin:
        \sffamily \bfseries
        \l_schulma_klausur_aufgabentitel_tl
        \c_space_tl
        \arabic {Aufgabe}
        \IfValueT {#3}
          {
            \mdseries
            \rmfamily
            \slshape
            \c_space_tl
            (#3~Punkte)
          }
        \IfBooleanF {#1} {.}
        \group_end:
        \peek_catcode:NF \c_space_token {\c_space_tl}
      }

    \bool_if:NTF \g_schulma_klausur_afuenfquer_bool
      {
        \RequirePackage [top=2.7cm, bottom=3cm, hmargin=2.5cm] {geometry}
      }
      {
        \RequirePackage [top=2.7cm, hmargin=2.5cm] {geometry}
      }

    \addtokomafont {pagefoot} {\slshape}
    \addtokomafont {pagenumber} {\slshape}
    \rohead { Name:~ \raisebox {-1mm} { \rule {7cm} {0,4pt} } }
    \cfoot { Seite~ \pagemark \c_space_tl von~ \pageref {LastPage} }

    \RequirePackage {comment}
    \excludecomment {Lsg}
    \RequirePackage {beamerarticle}
    \RequirePackage {tasks}

% tasks: j überspringen
\newcommand*\@schulmaalph[1]{\ifnum #1>9 \@alph{\numexpr #1+1}\else \@alph{#1}\fi}
\newcommand*\schulmaalph[1]{\@schulmaalph{\value{#1}}}

\settasks{label-align=right,
  item-indent=2.2em,
  label-offset=0.5em,
  label-width=1.3em,
  label=\schulmaalph*),
  after-skip=4.5pt plus2pt minus1pt}

\settasks{before-skip=4.5pt plus2pt minus1pt}
  }

\cs_new:Npn \schulma_klausur_notentabelle:n #1
  {
    \clist_set:Nn \l_schulma_klausur_notenliste_clist {#1}
    \begin {tabular} { * {5} {c|} c }
      1 & 2 & 3 & 4 & 5 & 6
      \tabularnewline
      \hline
      \int_step_inline:nnnn {1} {1} {6}
        {
          \int_zero:N \l_tmpa_int
          \clist_map_inline:Nn \l_schulma_klausur_notenliste_clist
            {
              \int_compare:nNnT {####1} = {##1}
                {
                  \int_incr:N \l_tmpa_int
                }
            }
          \int_compare:nNnF {\l_tmpa_int} = {0} {\int_use:N \l_tmpa_int}
          \int_compare:nNnF {##1} = {6} {&}
        }
      \end {tabular}
  }

\cs_new:Npn \schulma_klausur_notenpunkttabelle:n #1
  {
    \clist_set:Nn \l_schulma_klausur_notenliste_clist {#1}
    \setlength \tabcolsep {0pt}
    \begin {tabular}
      {
        * {5}
          {
            > {\centering} p{0,06\linewidth}
            > {\centering} p{0,06\linewidth}
            > {\centering} p{0,06\linewidth} |
          }
        > {\centering} p{0,06\linewidth}
      }
      15 & 14 & 13 & 12 & 11 & 10 & 9 & 8 & 7 & 6 & 5 & 4 & 3 & 2 & 1 & 0
      \tabularnewline
      \hline
      \int_step_inline:nnnn {15} {-1} {0}
        {
          \int_zero:N \l_tmpa_int
          \clist_map_inline:Nn \l_schulma_klausur_notenliste_clist
            {
              \int_compare:nNnT {####1} = {##1}
                {
                  \int_incr:N \l_tmpa_int
                }
            }
          \int_compare:nNnF {\l_tmpa_int} = {0} {\int_use:N \l_tmpa_int}
          \int_compare:nNnF {##1} = {0} {&}
        }
      \end {tabular}
  }

\RequirePackage {adjustbox}
\RequirePackage {schulma}
\RequirePackage {schulma-physik}

\bool_if:NTF \g_schulma_klausur_oesterreich_bool
  {
    \RequirePackage [naustrian] {babel}
  }
  {
    \RequirePackage [ngerman] {babel}
  }

\RequirePackage [useregional=text] {datetime2}

\NewDocumentCommand \Klausurtitel {m}
  {
    \str_gset:Nn \g_schulma_klausur_titel_str {#1}
  }

\NewDocumentCommand \Klausuruntertitel {m}
  {
    \tl_gset:Nn \g_schulma_klausur_untertitel_tl {#1}
  }

\NewDocumentCommand \Klausurteiltitel {m}
  {
    \str_gset:Nn \g_schulma_klausur_teiltitel_str {#1}
  }

\NewDocumentCommand \Bearbeitungszeit {m}
  {
    \str_gset:Nn \g_schulma_klausur_bearbeitungszeit_str {#1}
  }

\NewDocumentCommand \Hilfsmittel {m}
  {
    \tl_gset:Nn \g_schulma_klausur_hilfsmittel_tl {#1}
  }

\NewDocumentCommand \Loesungsdatum {m}
  {
    % \date { \DTMdate {#1} }
    \date { \printdate {#1} } % isodate-Befehl
  }

\NewDocumentCommand \Gruppen {mm}
  {
    \bool_if:NTF \g_schulma_klausur_gruppe_a_bool {#1} {#2}
  }

\DeclareDocumentCommand \Aufgabentitel {m}
  {
    \tl_set:Nn \l_schulma_klausur_aufgabentitel_tl {#1}
  }

\NewDocumentCommand \Notenspiegel {m}
  {
    \bool_if:NT \g_schulma_klausur_musterloesung_bool
      {
        \begin {frame}
        \frametitle {Notenspiegel}
        \begin {center}
        \LARGE
        \schulma_klausur_notentabelle:n {#1}
        \end {center}
        \end {frame}
      }
  }

\NewDocumentCommand \Notenpunktspiegel {m}
  {
    \bool_if:NT \g_schulma_klausur_musterloesung_bool
      {
        \begin {frame}
        \begin {center}
        \frametitle {Notenspiegel}
        \large
        \schulma_klausur_notenpunkttabelle:n {#1}
        \end {center}
        \end {frame}
      }
  }

\cs_set:Npn \schulma_klausur_kopf:
  {
    \noindent
    \parbox [t] {5cm} {\g_schulma_klausur_kurs_tl}
    \hfill
    \str_if_empty:NF \g_schulma_klausur_datum_str
      {
        \DTMdate {\g_schulma_klausur_datum_str}
      }

    \begin {center}
    \sffamily
    \bfseries
    \Large
    \g_schulma_klausur_titel_str
    \tl_if_empty:NF \g_schulma_klausur_nummer_tl
      {
        \c_space_tl
        Nr.~
        \g_schulma_klausur_nummer_tl
      }

    \bool_if:NT \g_schulma_klausur_zwei_gruppen_bool
      {
        \c_space_tl
        \bool_if:NTF \g_schulma_klausur_gruppe_a_bool {(A)} {(B)}
      }

    \tl_if_empty:NF \g_schulma_klausur_untertitel_tl
      {
        \par \smallskip
        \normalsize
        \g_schulma_klausur_untertitel_tl
      }

    \str_if_empty:NF \g_schulma_klausur_teiltitel_str
      {
        \par \vspace {3ex}
        \large
        \textit {\g_schulma_klausur_teiltitel_str}
      }

    \str_if_empty:NF \g_schulma_klausur_bearbeitungszeit_str
      {
        \par \smallskip
        \normalsize
        \rmfamily
        \mdseries
        \textsl {Bearbeitungszeit:} ~
        \g_schulma_klausur_bearbeitungszeit_str \, min
      }

    \tl_if_empty:NF \g_schulma_klausur_hilfsmittel_tl
      {
        \par \smallskip
        \normalsize
        \rmfamily
        \mdseries
        \textsl {Hilfsmittel:} ~
        \g_schulma_klausur_hilfsmittel_tl
      }

    \end {center}
  }

\NewDocumentCommand \FarbeAufgabe { }
  {
    \usebeamercolor [fg] {frametitle}
  }

\NewDocumentCommand \FarbeLoesung { }
  {
    \usebeamercolor [fg] {normal~text}
  }

\NewDocumentCommand \NurAufgabe {+m}
  {
    \bool_if:NF \g_schulma_klausur_musterloesung_bool {#1}
  }

\NewDocumentCommand \NurLoesung {+m}
  {
    \bool_if:NT \g_schulma_klausur_musterloesung_bool {#1}
  }
