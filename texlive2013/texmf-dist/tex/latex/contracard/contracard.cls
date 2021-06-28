%%
%% This is file `contracard.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% contracard.dtx  (with options: `contracard-cls')
%% 
%%   Copyright 2012 Samuel Whited
%% 
%%   This file may be distributed and/or modified under the
%%   conditions of the LaTeX Project Public License, either
%%   version 1.3c of this license or (at your option) any later
%%   version. The latest version of this license is in:
%% 
%%   http://www.latex-project.org/lppl.txt
%% 
%%   and version 1.3c or later is part of all distributions of
%%   LaTeX version 2008/05/04 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{contracard}[2013/02/20]
\AtEndOfClass{\LoadClass{article}}
\AtEndOfClass{\RequirePackage{geometry}}
\AtEndOfClass{\RequirePackage[compact]{titlesec}}
\AtEndOfClass{\RequirePackage{contracard}}
\DeclareOption{small}{%
  \AtBeginDocument{%
    \titleformat{\section}{\normalsize\bfseries}{\thesection}{1em}{}%
    \titleformat{\subsection}{\normalsize}{\thesection}{1em}{}%
  }
  \PassOptionsToPackage{%
    margin=0.25in,top=0.75in,paperwidth=5in,paperheight=3in%
  }{geometry}%
}
\DeclareOption{medium}{%
  \AtBeginDocument{\large}
  \PassOptionsToPackage{%
    margin=0.5in,top=0.75in,paperwidth=6in,paperheight=4in%
  }{geometry}%
}
\DeclareOption{large}{%
  \AtBeginDocument{\Large}
  \PassOptionsToPackage{%
    margin=0.75in,top=1in,paperwidth=8in,paperheight=5in%
  }{geometry}%
}
\DeclareOption{a7paper}{%
  \AtBeginDocument{%
    \titleformat{\section}{\normalsize\bfseries}{\thesection}{1em}{}%
    \titleformat{\subsection}{\normalsize}{\thesection}{1em}{}%
  }
  \PassOptionsToPackage{%
    margin=5mm,top=15mm,paperwidth=105mm,paperheight=74mm%
  }{geometry}%
}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\AtBeginDocument{\pagestyle{empty}}
\AtBeginDocument{\pagenumbering{gobble}}
\newcommand*{\@ccisclass}{}
\ProcessOptions\relax
%% 
%%   ___________
%%   Maintainer: Sam Whited
%%   Website:    https://samwhited.com
%%   Contact:    sam@samwhited.com
%%   Public key: 0xEC2C9934
%% 
%%   This work consists of this file contracard.dtx
%%             and the derived files contracard.sty
%%                               and contracard.cls
%%                               and contracard.pdf
%% 
%%
%% End of file `contracard.cls'.
