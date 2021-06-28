%%
%% This is file `idcc.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% dccpaper.dtx  (with options: `idcc')
%% 
%% ----------------------------------------------------------------
%% The dccpaper bundle: Classes for submissions to IJDC and IDCC
%% Author:  Alex Ball
%% E-mail:  a.ball@ukoln.ac.uk
%% License: Released under the LaTeX Project Public License v1.3c or later
%% See:     http://www.latex-project.org/lppl.txt
%% ----------------------------------------------------------------
%% 
\def\Version{2017/10/20 v1.6}
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{idcc}
    [\Version\space Class for submissions to the International Digital Curation Conference.]
\def\dccp@publ@long{International Digital Curation Conference}
\def\dccp@publ@short{IDCC}
\def\dccp@publ@msg{The \dccp@publ@long\ takes place on [TBC] in [TBC]. URL:
\url{http://www.dcc.ac.uk/events/international-digital-curation-conference-idcc}}
\def\dccp@subject{\dccp@publ@long}

\def\dccp@type{Practice Paper}
\DeclareOption{research}{\def\dccp@type{Research Paper}}
\DeclareOption{data}{\def\dccp@type{Data Paper}}
\DeclareOption{poster}{\def\dccp@type{Poster}}
\DeclareOption{demo}{\def\dccp@type{Demonstration}}
\DeclareOption{bof}{\def\dccp@type{Birds of a Feather}}
\DeclareOption{workshop}{\def\dccp@type{Workshop}}
\DeclareOption{practice}{\def\dccp@type{Practice Paper}}
\DeclareOption{15}{%
  \def\dccp@publ@short{IDCC15}
  \def\dccp@publ@msg{The 10th \dccp@publ@long\ takes place on 9--12 February
  2015 in London. URL: \url{http://www.dcc.ac.uk/events/idcc15/}}
  \def\dccp@subject{10th \dccp@publ@long, 2015}
}
\DeclareOption{16}{%
  \def\dccp@publ@short{IDCC16}
  \def\dccp@publ@msg{The 11th \dccp@publ@long\ takes place on 22--25 February
  2016 in Amsterdam. URL: \url{http://www.dcc.ac.uk/events/idcc16/}}
  \def\dccp@subject{11th \dccp@publ@long, 2016}
}
\DeclareOption{17}{%
  \def\dccp@publ@short{IDCC17}
  \def\dccp@publ@msg{The 12th \dccp@publ@long\ takes place on 20--23 February
  2017 in Edinburgh. URL: \url{http://www.dcc.ac.uk/events/idcc17/}}
  \def\dccp@subject{12th \dccp@publ@long, 2017}
}
\DeclareOption{18}{%
  \def\dccp@publ@short{IDCC18}
  \def\dccp@publ@msg{The 13th \dccp@publ@long\ takes place on 19--22 February
    2018 in Barcelona. URL: \url{http://www.dcc.ac.uk/events/idcc18/}}
  \def\dccp@subject{13th \dccp@publ@long, 2018}
}
\ProcessOptions\relax

\def\@clearglobaloption#1{%
  \def\@tempa{#1}%
  \def\@tempb{\@gobble}%
  \@for\next:=\@classoptionslist\do{%
    \ifx\next\@tempa
      \message{Option \next\space has been hidden from subsequent packages}%
    \else
      \edef\@tempb{\@tempb,\next}%
    \fi
  }%
  \let\@classoptionslist\@tempb
  \expandafter\ifx\@tempb\@gobble
    \let\@classoptionslist\@empty
  \fi
}
\@clearglobaloption{demo}

\LoadClass[a4paper,12pt,twoside]{article}

\usepackage{dccpaper-base}
%% 
%% Copyright (C) 2015 Digital Curation Centre, University of Edinburgh
%% <info@dcc.ac.uk>
%%
%% End of file `idcc.cls'.
