%%
%% This is file `beamerswitch.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% beamerswitch.dtx  (with options: `class')
%% ----------------------------------------------------------------
%% beamerswitch --- Convenient mode selection in Beamer documents
%% Author:  Alex Ball
%% E-mail:  a.j.ball@bath.ac.uk
%% License: Released under the LaTeX Project Public License v1.3c or later
%% See:     http://www.latex-project.org/lppl.txt
%% ----------------------------------------------------------------
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{beamerswitch}
    [2017/12/10 v1.3 Convenient mode selection in Beamer documents]
\RequirePackage{xkeyval,xkvltxp,etoolbox,xstring,shellesc,iftex}
\define@boolkey[DC]{beamerswitch}{beamer}[true]{%
  \ifbool{DC@beamerswitch@beamer}{%
    \setkeys[DC]{beamerswitch}{trans=false}
    \setkeys[DC]{beamerswitch}{handout=false}
    \setkeys[DC]{beamerswitch}{article=false}
  }{}%
}
\define@boolkey[DC]{beamerswitch}{trans}[true]{%
  \ifbool{DC@beamerswitch@trans}{%
    \setkeys[DC]{beamerswitch}{beamer=false}
    \setkeys[DC]{beamerswitch}{handout=false}
    \setkeys[DC]{beamerswitch}{article=false}
  }{}%
}
\define@boolkey[DC]{beamerswitch}{handout}[true]{%
  \ifbool{DC@beamerswitch@handout}{%
    \setkeys[DC]{beamerswitch}{beamer=false}
    \setkeys[DC]{beamerswitch}{trans=false}
    \setkeys[DC]{beamerswitch}{article=false}
  }{}%
}
\define@boolkey[DC]{beamerswitch}{article}[true]{%
  \ifbool{DC@beamerswitch@article}{%
    \setkeys[DC]{beamerswitch}{beamer=false}
    \setkeys[DC]{beamerswitch}{trans=false}
    \setkeys[DC]{beamerswitch}{handout=false}
  }{}%
}
\define@boolkey[DC]{beamerswitch}{alsobeamer}[true]{}
\define@boolkey[DC]{beamerswitch}{alsotrans}[true]{}
\define@boolkey[DC]{beamerswitch}{alsohandout}[true]{}
\define@boolkey[DC]{beamerswitch}{alsoarticle}[true]{}
\newcommand{\beamerswitch@SetAlso}[1]{%
  \key@ifundefined[DC]{beamerswitch}{also#1}{%
    \ClassWarning{beamerswitch}{`#1' is not a valid value for option `also'}%
  }{%
    \setkeys[DC]{beamerswitch}{also#1}%
  }%
}
\define@key[DC]{beamerswitch}{also}{%
  \forcsvlist{\beamerswitch@SetAlso}{#1}%
}
\define@boolkey[DC]{beamerswitch}{nohyperref}[true]{}
\define@boolkey[DC]{beamerswitch}{textinst}[true]{}
\setkeys[DC]{beamerswitch}{beamer=true,alsobeamer=false,alsotrans=false,%
  alsohandout=false,alsoarticle=false}
\ProcessOptionsX[DC]<beamerswitch>
\providecommand*{\BeamerSuffix}{-slides}
\providecommand*{\TransSuffix}{-trans}
\providecommand*{\HandoutSuffix}{-handout}
\providecommand*{\ArticleSuffix}{-article}
\providecommand{\SpawnedCompiler}{latexmk -silent -synctex=1 -interaction=batchmode }
\providecommand{\SpawnedTeX}{\SpawnedCompiler}
\providecommand{\SpawnedPDFTeX}{\SpawnedCompiler -pdf }
\providecommand{\SpawnedLuaTeX}{\SpawnedCompiler -pdflua }
\providecommand{\SpawnedXeTeX}{\SpawnedCompiler -pdfxe }
\providecommand{\BeamerswitchSpawn}[1]{%
  \ifbool{PDFTeX}{%
    \ShellEscape{\SpawnedPDFTeX -jobname=\jobname#1 \jobname}
  }{%
    \ifbool{LuaTeX}{%
      \ShellEscape{\SpawnedLuaTeX -jobname=\jobname#1 \jobname}
    }{%
      \ifbool{XeTeX}{%
        \ShellEscape{\SpawnedXeTeX -jobname=\jobname#1 \jobname}
      }{%
        \ShellEscape{\SpawnedTeX -jobname=\jobname#1 \jobname}
      }%
    }%
  }%
}
\IfEndWith*{\jobname}{\BeamerSuffix}{%
  \setkeys[DC]{beamerswitch}{beamer=true}
}{%
  \IfEndWith*{\jobname}{\TransSuffix}{%
    \setkeys[DC]{beamerswitch}{trans=true}
  }{%
    \IfEndWith*{\jobname}{\HandoutSuffix}{%
      \setkeys[DC]{beamerswitch}{handout=true}
    }{%
      \IfEndWith*{\jobname}{\ArticleSuffix}{%
        \setkeys[DC]{beamerswitch}{article=true}
      }{%
        \ifbool{DC@beamerswitch@alsobeamer}{%
          \BeamerswitchSpawn{\BeamerSuffix}%
        }{}
        \ifbool{DC@beamerswitch@alsotrans}{%
          \BeamerswitchSpawn{\TransSuffix}%
        }{}
        \ifbool{DC@beamerswitch@alsohandout}{%
          \BeamerswitchSpawn{\HandoutSuffix}%
        }{}
        \ifbool{DC@beamerswitch@alsoarticle}{%
          \BeamerswitchSpawn{\ArticleSuffix}%
        }{}
      }%
    }%
  }%
}%
\ifbool{DC@beamerswitch@article}{%
  \LoadClass{article}
  \RequirePackage{beamerarticle}
  \ifbool{DC@beamerswitch@nohyperref}{}{%
    \RequirePackage[bookmarks=true,%
    bookmarksopen=true,%
    pdfborder={0 0 0},%
    pdfhighlight={/N},%
    linkbordercolor={.5 .5 .5}]{hyperref}%
  }
  \AtBeginDocument{%
    \@ifpackageloaded{hyperref}{%
      \pdfstringdefDisableCommands{\def\\<#1>#2{ - #2}}
      \begingroup
      \hypersetup{pdftitle={\@title}}%
      \def\and{\unskip, }%
      \let\thanks=\@gobble
      \let\inst=\@gobble
      \hypersetup{pdfauthor={\@author}}%
      \endgroup
    }{}%
  }
}{%
  \ifbool{DC@beamerswitch@handout}{%
    \LoadClass[ignorenonframetext,handout]{beamer}
    \RequirePackage{pgfpages}
  }{%
    \ifbool{DC@beamerswitch@trans}{%
      \LoadClass[ignorenonframetext,trans]{beamer}
    }{%
      \LoadClass[ignorenonframetext]{beamer}
    }%
  }
}
\ifbool{DC@beamerswitch@textinst}{%
  \def\beamer@insttitle#1{\textsuperscript{#1}}
  \def\beamer@instinst#1{\textsuperscript{#1}\ignorespaces}
}{}
\newcommand*{\beamerswitch@Border}{\relax}
\mode<handout>{%
  \pgfpagesdeclarelayout{1 by 2}
  {
    \edef\pgfpageoptionheight{\the\paperwidth} % landscaped by default
    \edef\pgfpageoptionwidth{\the\paperheight}
    \def\pgfpageoptionborder{0pt}
    \def\pgfpageoptionfirstshipout{1}
  }
  {
    \pgfpagesphysicalpageoptions
    {%
      logical pages=2,%
      physical height=\pgfpageoptionheight,%
      physical width=\pgfpageoptionwidth,%
      current logical shipout=\pgfpageoptionfirstshipout%
    }
    \ifdim\paperheight>\paperwidth\relax
    % put side-by-side
    \pgfpageslogicalpageoptions{1}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=\pgfphysicalheight,%
      center=\pgfpoint{.25\pgfphysicalwidth}{.5\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{2}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=\pgfphysicalheight,%
      center=\pgfpoint{.75\pgfphysicalwidth}{.5\pgfphysicalheight}%
    }%
    \else
    % stack on top of one another
    \pgfpageslogicalpageoptions{1}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.5\pgfphysicalwidth}{.75\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{2}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.5\pgfphysicalwidth}{.25\pgfphysicalheight}%
    }%
    \fi
  }
  \pgfpagesdeclarelayout{1 by 3}
  {
    \edef\pgfpageoptionheight{\the\paperwidth} % landscaped by default
    \edef\pgfpageoptionwidth{\the\paperheight}
    \def\pgfpageoptionborder{0pt}
    \def\pgfpageoptionfirstshipout{1}
  }
  {
    \pgfpagesphysicalpageoptions
    {%
      logical pages=3,%
      physical height=\pgfpageoptionheight,%
      physical width=\pgfpageoptionwidth,%
      current logical shipout=\pgfpageoptionfirstshipout%
    }
    \ifdim\paperheight>\paperwidth\relax
    % put side-by-side
    \pgfpageslogicalpageoptions{1}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.333\pgfphysicalwidth,%
      resized height=\pgfphysicalheight,%
      center=\pgfpoint{.167\pgfphysicalwidth}{.5\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{2}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.333\pgfphysicalwidth,%
      resized height=\pgfphysicalheight,%
      center=\pgfpoint{.5\pgfphysicalwidth}{.5\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{3}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.333\pgfphysicalwidth,%
      resized height=\pgfphysicalheight,%
      center=\pgfpoint{.833\pgfphysicalwidth}{.5\pgfphysicalheight}%
    }%
    \else
    % stack on top of one another
    \pgfpageslogicalpageoptions{1}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=\pgfphysicalwidth,%
      resized height=.333\pgfphysicalheight,%
      center=\pgfpoint{.5\pgfphysicalwidth}{.833\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{2}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=\pgfphysicalwidth,%
      resized height=.333\pgfphysicalheight,%
      center=\pgfpoint{.5\pgfphysicalwidth}{.5\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{3}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=\pgfphysicalwidth,%
      resized height=.333\pgfphysicalheight,%
      center=\pgfpoint{.5\pgfphysicalwidth}{.167\pgfphysicalheight}%
    }%
    \fi
  }
  \pgfpagesdeclarelayout{1 by 3 narrow}
  {
    \edef\pgfpageoptionheight{\the\paperwidth} % landscaped by default
    \edef\pgfpageoptionwidth{\the\paperheight}
    \def\pgfpageoptionborder{0pt}
    \def\pgfpageoptionfirstshipout{1}
  }
  {
    \pgfpagesphysicalpageoptions
    {%
      logical pages=3,%
      physical height=\pgfpageoptionheight,%
      physical width=\pgfpageoptionwidth,%
      current logical shipout=\pgfpageoptionfirstshipout%
    }
    \ifdim\paperheight>\paperwidth\relax
    % put side-by-side
    \pgfpageslogicalpageoptions{1}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.333\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.167\pgfphysicalwidth}{.75\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{2}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.333\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.5\pgfphysicalwidth}{.75\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{3}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.333\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.833\pgfphysicalwidth}{.75\pgfphysicalheight}%
    }%
    \else
    % stack on top of one another
    \pgfpageslogicalpageoptions{1}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.333\pgfphysicalheight,%
      center=\pgfpoint{.25\pgfphysicalwidth}{.833\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{2}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.333\pgfphysicalheight,%
      center=\pgfpoint{.25\pgfphysicalwidth}{.5\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{3}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.333\pgfphysicalheight,%
      center=\pgfpoint{.25\pgfphysicalwidth}{.167\pgfphysicalheight}%
    }%
    \fi
  }
  \pgfpagesdeclarelayout{2 by 2}
  {
    \edef\pgfpageoptionheight{\the\paperheight}
    \edef\pgfpageoptionwidth{\the\paperwidth}
    \edef\pgfpageoptionborder{0pt}
  }
  {
    \pgfpagesphysicalpageoptions
    {%
      logical pages=4,%
      physical height=\pgfpageoptionheight,%
      physical width=\pgfpageoptionwidth%
    }
    \pgfpageslogicalpageoptions{1}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.25\pgfphysicalwidth}{.75\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{2}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.75\pgfphysicalwidth}{.75\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{3}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.25\pgfphysicalwidth}{.25\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{4}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.75\pgfphysicalwidth}{.25\pgfphysicalheight}%
    }%
  }
  \pgfpagesdeclarelayout{1 by 4 narrow}
  {
    \edef\pgfpageoptionheight{\the\paperwidth} % landscaped by default
    \edef\pgfpageoptionwidth{\the\paperheight}
    \def\pgfpageoptionborder{0pt}
    \def\pgfpageoptionfirstshipout{1}
  }
  {
    \pgfpagesphysicalpageoptions
    {%
      logical pages=4,%
      physical height=\pgfpageoptionheight,%
      physical width=\pgfpageoptionwidth,%
      current logical shipout=\pgfpageoptionfirstshipout%
    }
    \ifdim\paperheight>\paperwidth\relax
    % put side-by-side
    \pgfpageslogicalpageoptions{1}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.25\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.125\pgfphysicalwidth}{.75\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{2}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.25\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.375\pgfphysicalwidth}{.75\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{3}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.25\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.625\pgfphysicalwidth}{.75\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{4}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.25\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.875\pgfphysicalwidth}{.75\pgfphysicalheight}%
    }%
    \else
    % stack on top of one another
    \pgfpageslogicalpageoptions{1}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.25\pgfphysicalheight,%
      center=\pgfpoint{.25\pgfphysicalwidth}{.875\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{2}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.25\pgfphysicalheight,%
      center=\pgfpoint{.25\pgfphysicalwidth}{.625\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{3}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.25 \pgfphysicalheight,%
      center=\pgfpoint{.25\pgfphysicalwidth}{.375\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{4}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.25 \pgfphysicalheight,%
      center=\pgfpoint{.25\pgfphysicalwidth}{.125\pgfphysicalheight}%
    }%
    \fi
  }
  \pgfpagesdeclarelayout{2 by 3}
  {
    \edef\pgfpageoptionheight{\the\paperwidth} % landscaped by default
    \edef\pgfpageoptionwidth{\the\paperheight}
    \def\pgfpageoptionborder{0pt}
    \def\pgfpageoptionfirstshipout{1}
  }
  {
    \pgfpagesphysicalpageoptions
    {%
      logical pages=6,%
      physical height=\pgfpageoptionheight,%
      physical width=\pgfpageoptionwidth,%
      current logical shipout=\pgfpageoptionfirstshipout%
    }
    \ifdim\paperheight>\paperwidth\relax
    % put side-by-side
    \pgfpageslogicalpageoptions{1}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.333\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.167\pgfphysicalwidth}{.75\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{2}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.333\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.5\pgfphysicalwidth}{.75\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{3}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.333\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.833\pgfphysicalwidth}{.75\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{4}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.333\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.167\pgfphysicalwidth}{.25\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{5}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.333\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.5\pgfphysicalwidth}{.25\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{6}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.333\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.833\pgfphysicalwidth}{.25\pgfphysicalheight}%
    }%
    \else
    % stack on top of one another
    \pgfpageslogicalpageoptions{1}
    {%
      border shrink=\pgfpageoptionborder,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.333\pgfphysicalheight,%
      center=\pgfpoint{.25\pgfphysicalwidth}{.833\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{2}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.333\pgfphysicalheight,%
      center=\pgfpoint{.75\pgfphysicalwidth}{.833\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{3}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.333\pgfphysicalheight,%
      center=\pgfpoint{.25\pgfphysicalwidth}{.5\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{4}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.333\pgfphysicalheight,%
      center=\pgfpoint{.75\pgfphysicalwidth}{.5\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{5}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.333\pgfphysicalheight,%
      center=\pgfpoint{.25\pgfphysicalwidth}{.167\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{6}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.333\pgfphysicalheight,%
      center=\pgfpoint{.75\pgfphysicalwidth}{.167\pgfphysicalheight}%
    }%
    \fi
  }
  \pgfpagesdeclarelayout{2 by 4}
  {
    \edef\pgfpageoptionheight{\the\paperwidth} % landscaped by default
    \edef\pgfpageoptionwidth{\the\paperheight}
    \def\pgfpageoptionborder{0pt}
    \def\pgfpageoptionfirstshipout{1}
  }
  {
    \pgfpagesphysicalpageoptions
    {%
      logical pages=8,%
      physical height=\pgfpageoptionheight,%
      physical width=\pgfpageoptionwidth,%
      current logical shipout=\pgfpageoptionfirstshipout%
    }
    \ifdim\paperheight>\paperwidth\relax
    % put side-by-side
    \pgfpageslogicalpageoptions{1}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.25\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.125\pgfphysicalwidth}{.75\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{2}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.25\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.375\pgfphysicalwidth}{.75\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{3}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.25\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.625\pgfphysicalwidth}{.75\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{4}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.25\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.875\pgfphysicalwidth}{.75\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{5}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.25\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.125\pgfphysicalwidth}{.25\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{6}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.25\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.375\pgfphysicalwidth}{.25\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{7}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.25\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.625\pgfphysicalwidth}{.25\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{8}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.25\pgfphysicalwidth,%
      resized height=.5\pgfphysicalheight,%
      center=\pgfpoint{.875\pgfphysicalwidth}{.25\pgfphysicalheight}%
    }%
    \else
    % stack on top of one another
    \pgfpageslogicalpageoptions{1}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.25\pgfphysicalheight,%
      center=\pgfpoint{.25\pgfphysicalwidth}{.875\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{2}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.25\pgfphysicalheight,%
      center=\pgfpoint{.75\pgfphysicalwidth}{.875\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{3}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.25\pgfphysicalheight,%
      center=\pgfpoint{.25\pgfphysicalwidth}{.625\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{4}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.25\pgfphysicalheight,%
      center=\pgfpoint{.75\pgfphysicalwidth}{.625\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{5}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.25 \pgfphysicalheight,%
      center=\pgfpoint{.25\pgfphysicalwidth}{.375\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{6}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.25 \pgfphysicalheight,%
      center=\pgfpoint{.75\pgfphysicalwidth}{.375\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{7}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.25 \pgfphysicalheight,%
      center=\pgfpoint{.25\pgfphysicalwidth}{.125\pgfphysicalheight}%
    }%
    \pgfpageslogicalpageoptions{8}
    {%
      border shrink=\pgfpageoptionborder,%
      border code=\beamerswitch@Border,%
      resized width=.5\pgfphysicalwidth,%
      resized height=.25 \pgfphysicalheight,%
      center=\pgfpoint{.75\pgfphysicalwidth}{.125\pgfphysicalheight}%
    }%
    \fi
  }
}
\define@key[HL]{beamerswitch}{paper}{%
  \def\beamerswitch@handoutpaper{#1}%
}
\newcounter{beamerswitch@nupcase}
\define@choicekey+[HL]{beamerswitch}{nup}[\val\nr]{2, 3, 3plus, 4, 4plus, 6, 8}{%
  \setcounter{beamerswitch@nupcase}{\nr}
}{%
  \ClassWarning{beamerswitch}{Value of `nup' not recognized.
    Allowed values are 2, 3, 3plus, 4, 4plus, 6, and 8.}%
}
\define@key[HL]{beamerswitch}{border}[0.4pt]{%
  \RequirePackage{pgf}%
  \renewcommand*{\beamerswitch@Border}{\pgfsetlinewidth{#1}\pgfstroke}%
}
\define@boolkey[HL]{beamerswitch}{pnos}[true]{}
\newcommand*{\handoutlayout}[1]{%
  \only<handout>{%
    \setkeys[HL]{beamerswitch}{#1}%
    \ifcase\value{beamerswitch@nupcase}\relax
      \def\beamerswitch@nup{2}
      \pgfpagesuselayout{1 by 2}[\beamerswitch@handoutpaper,border shrink=5mm]%
    \or
      \def\beamerswitch@nup{3}
      \pgfpagesuselayout{1 by 3}[\beamerswitch@handoutpaper,border shrink=5mm]%
    \or
      \def\beamerswitch@nup{3}
      \pgfpagesuselayout{1 by 3 narrow}[\beamerswitch@handoutpaper,border shrink=5mm]%
    \or
      \def\beamerswitch@nup{4}
      \pgfpagesuselayout{2 by 2}[\beamerswitch@handoutpaper,landscape,border shrink=5mm]%
    \or
      \def\beamerswitch@nup{4}
      \pgfpagesuselayout{1 by 4 narrow}[\beamerswitch@handoutpaper,border shrink=5mm]%
    \or
      \def\beamerswitch@nup{6}
      \pgfpagesuselayout{2 by 3}[\beamerswitch@handoutpaper,border shrink=5mm]%
    \or
      \def\beamerswitch@nup{8}
      \pgfpagesuselayout{2 by 4}[\beamerswitch@handoutpaper,border shrink=5mm]%
    \fi
    \ifbool{HL@beamerswitch@pnos}{%
      \def\pgfsys@endpicture{%
        \raisebox{5mm}[0pt][0pt]{%
          \makebox[\pgfphysicalwidth]{%
            \the\numexpr\value{page}/\beamerswitch@nup\relax
          }%
        }%
      }%
    }{}%
  }%
}
\handoutlayout{paper=a4paper,nup=6}
\define@boolkey[AL]{beamerswitch}{maketitle}[true]{}
\newtoggle{titlepunct}
\IfFileExists{xparse.sty}{\@tempswatrue}{\@tempswafalse}
\if@tempswa
  \RequirePackage{xparse}
  \ExplSyntaxOn
  \NewDocumentCommand{\bsw@punct@test}{m}{\l_bsw_punct_test:n {#1}}
  \cs_new_protected:Nn \l_bsw_punct_test:n
  {
    \str_case_x:nnTF { \str_item:nn {#1} {-1} }
      {
        { , } { }
        { ; } { }
        { : } { }
        { . } { }
        { ! } { }
        { ? } { }
      }
      { \global\toggletrue{titlepunct} }
      { \global\togglefalse{titlepunct} }
  }
  \ExplSyntaxOff
  \mode<article>{%
    \renewcommand{\title}[2][]{\beamer@origtitle{#2}\bsw@punct@test{#2}}
  }
  \mode<presentation>{%
    \long\def\beamer@title[#1]#2{%
      \def\inserttitle{#2}%
      \def\beamer@shorttitle{#1}%
      \bsw@punct@test{#2}%
    }
  }
\else
  \wlog{Beamerswitch: Auto-detection of title punctuation not available.}
\fi
\define@choicekey+[AL]{beamerswitch}{frametitles}{para, margin, none}{%
  \def\beamerswitch@articleframetitles{#1}%
}{%
  \ClassWarning{beamerswitch}{Value of `frametitles' not recognized.
    Allowed values are para, margin, and none.}%
}
\newcommand{\articlelayout}[1]{%
  \setkeys[AL]{beamerswitch}{#1}%
  \mode<article>{%
    \ifcsstring{beamerswitch@articleframetitles}{margin}{%
      \setbeamertemplate{frametitle}{%
        \marginpar[%
          \raggedleft\noindent\emshape\textbf{\insertframetitle}\par
          \noindent\insertframesubtitle\par
        ]{%
          \raggedright\noindent\emshape\textbf{\insertframetitle}\par
          \noindent\insertframesubtitle\par
        }%
      }
    }{%
      \ifcsstring{beamerswitch@articleframetitles}{none}{%
        \setbeamertemplate{frametitle}{}
      }{%
        \ifcsstring{beamerswitch@articleframetitles}{para}{%
          \setbeamertemplate{frametitle}[default]
        }{}%
      }%
    }
    \ifbool{AL@beamerswitch@maketitle}{%
      \renewcommand{\subtitle}[2][]{%
        \def\insertsubtitle{##2}\gappto\@title{\iftoggle{titlepunct}{}{:} ##2}%
      }
      \ifundef{\beamer@originstitute}{%
        \renewcommand{\institute}[2][]{\def\insertinstitute{##2}}%
      }{%
        \renewcommand{\institute}[2][]{\def\insertinstitute{##2}\beamer@originstitute{##2}}%
      }%
      \def\@maketitle{%
        \newpage
        \null
        \begin{center}%
          \let\footnote\thanks
          {\LARGE \@title \par}%
          \vskip 1.5em%
          {%
            \large\lineskip .5em%
            \begin{tabular}[t]{c}%
              \@author
            \end{tabular}\par
          }%
          \ifdefvoid{\insertinstitute}{}{%
            {%
              \normalsize\lineskip .5em%
              \begin{tabular}[t]{c}%
                \insertinstitute
              \end{tabular}\par
            }%
          }%
          \vskip 1em%
          {\large \@date}%
        \end{center}%
        \par\vskip 1.5em%
      }%
    }{}%
  }%
  \mode<presentation>{%
    \ifbool{AL@beamerswitch@maketitle}{%
      \ifbool{beamer@autopdfinfo}{%
        \patchcmd{\beamer@firstminutepatches}{%
          \inserttitle\ifx\insertsubtitle\@empty\else\ - \insertsubtitle\fi
        }{%
          \inserttitle\ifx\insertsubtitle\@empty\else\iftoggle{titlepunct}{}{:} \insertsubtitle\fi
        }{}{}%
      }{}%
    }{}%
  }%
}
%% 
%% Copyright (C) 2016-2017 by Alex Ball <a.j.ball@bath.ac.uk>
%%
%% End of file `beamerswitch.cls'.
