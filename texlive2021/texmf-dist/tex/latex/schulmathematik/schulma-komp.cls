% schulmathematik bundle: document class schulma-komp
% Version 1.1
% 13. März 2021
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{schulma-komp}[2021-03-13 v1.1 Dokumentenklasse fuer Kompetenzlisten]
\ProcessOptions\relax

\LoadClass{schulma-ab}

\ExplSyntaxOn

\dim_const:Nn \c_schulma_komp_abstand_dim {0.5em}
\dim_new:N \g_schulma_komp_einrueckunga_dim
\dim_new:N \g_schulma_komp_einrueckungb_dim

\hbox_set:Nn \l_tmpa_box {9}
\dim_gset:Nn \g_schulma_komp_einrueckunga_dim { \box_wd:N \l_tmpa_box }
\dim_gadd:Nn \g_schulma_komp_einrueckunga_dim {\c_schulma_komp_abstand_dim}

\hbox_set:Nn \l_tmpa_box {9.9}
\dim_gset:Nn \g_schulma_komp_einrueckungb_dim { \box_wd:N \l_tmpa_box }
\dim_gadd:Nn \g_schulma_komp_einrueckungb_dim {\c_schulma_komp_abstand_dim}
\dim_gadd:Nn \g_schulma_komp_einrueckungb_dim {\g_schulma_komp_einrueckunga_dim}

\renewcommand \labelenumi { ( \arabic {enumi} ) }

\cs_new:Npn \schulma_komp_listeneinstellung:
  {
    \setlist
      {
        leftmargin = 2cm,
        topsep = \medskipamount,
        itemsep = \smallskipamount
      }
  }

\NewDocumentCommand \Abschnitt {o m}
  {
    \IfValueTF {#1} { \setcounter {section} {#1} } { \stepcounter {section} }
    \arabic {section}
    \skip_horizontal:N \c_schulma_komp_abstand_dim
    #2
    \par
    \smallskip
  }

\NewDocumentCommand \Unterabschnitt {o m o}
  {
    \IfValueTF {#1} { \setcounter{subsection} {#1} } { \stepcounter{subsection} }
    \setcounter {subsubsection} {0}
    \skip_horizontal:N \g_schulma_komp_einrueckunga_dim
    \arabic {section} .
    \arabic {subsection}
    \skip_horizontal:N \c_schulma_komp_abstand_dim
    #2
    \IfValueT {#3}
      {
        \group_begin:
        \schulma_komp_listeneinstellung:
        \emph {#3}
        \group_end:
      }
    \par
    \smallskip
  }

\NewDocumentCommand \Unterunterabschnitt {o m m}
  {
    \par
    \IfValueTF {#1}
      {
        \setcounter {subsubsection} {#1}
      }
      {
        \stepcounter {subsubsection}
      }
    \skip_horizontal:N \g_schulma_komp_einrueckungb_dim
    \arabic {section} .
    \arabic {subsection} .
    \arabic {subsubsection}
    \skip_horizontal:N \c_schulma_komp_abstand_dim
    #2
    \group_begin:
    \schulma_komp_listeneinstellung:
    \emph {#3}
    \group_end:
    \par
    \smallskip
  }

\ExplSyntaxOff
