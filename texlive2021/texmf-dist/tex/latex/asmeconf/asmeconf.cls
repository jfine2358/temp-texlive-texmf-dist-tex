% !TEX encoding = UTF-8 Unicode
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  This file provides the asmeconf LaTeX class for formatting conference papers according to 
%%  ASME conference requirements as represented on ASME's conference web pages in 2020.
%%
%%  This file's version and date:
	\def\versionno{1.26}
	\def\versiondate{2021/02/20\space}
%%
%%  Author: John H. Lienhard, V
%%          Department of Mechanical Engineering
%%          Massachusetts Institute of Technology
%%          Cambridge, MA 02139-4307 USA
%%
%%  This LaTeX template was designed to approach the following aims:
%%
%%          1. Match ASME's current layout and font specifications
%%          2. With amseconf.bst, match ASME's reference formats and support DOI & URL fields
%%          3. Provide hyperref compatibility for hyperlinks, pdf bookmarks, and metadata
%%          4. Set author names in either the traditional grid or the more recent inline style
%%          5. Support citations, footnotes, and bold face, sans serif math in section headings
%%			6. Provide line numbers for editing and review
%%			7. Support balancing length of columns on last page
%%			8. Provide copyright footer for federal employees and contractors
%%			9. Support the archival PDF/A standards 1b, 2b, 2u, 3b, and 3u
%%		   10. Enable various math and text features from the newtxmath and newtxtext packages
%%		   11. Support inclusion of passages in languages other than English
%%
%%  This class is compatible with either pdfLaTeX or LuaLaTeX. FontSpec may be loaded as an option (to 
%%  access language-specific fonts), but the class does not support unicode-math. All packages required
%%  by the class are in TeXLive and CTAN (https://ctan.org/). 
%%
%%  Commands for entering conference headers and author names are specific to this class.
%%  See asmeconf-template.tex for details.
%%
%%  The \section[]{} command's optional argument is changed to better support pdf bookmarks, 
%%  and \section* is modified similarly.
%%
%%  The class defines abstract (with keywords), abstract* (no keywords), and nomenclature environments. 
%%  The latter has an optional argument to control the space between the entries and the definitions.
%%
% =========================================================
%%
%% LICENSE:
%%
%% Copyright (c) 2021 John H. Lienhard
%%
%% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and 
%% associated documentation files (the "Software"), to deal in the Software without restriction, 
%% including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
%% and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, 
%% subject to the following conditions:
%%
%% The above copyright notice and this permission notice shall be included in all copies or 
%% substantial portions of the Software.
%%
%% The software is provided "as is", without warranty of any kind, express or implied, including but 
%% not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. 
%% In no event shall the authors or copyright holders be liable for any claim, damages or other liability, 
%% whether in an action of contract, tort or otherwise, arising from, out of or in connection with the 
%% software or the use or other dealings in the software.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{asmeconf}[\versiondate ASME Conference Paper LaTeX Template (JHL)]

\LoadClass[twoside,twocolumn,10pt]{article}
% Even/odd page layout is not used in ASME's specs, although the papers are printed in two-sided format.

%%%%%%%%%%%%%% Options for the class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xparse} % access features not yet moved into the LaTeX kernel
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage{iftex} 	% check whether pdftex or another engine is used

\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=asmeconf,
  prefix=asmeconf@,
  family=pdfaopt,
  prefix=pdafopt@,
  setkeys=\kvsetkeys,
}

%%% for mathalfa, we may now pass options in this format:  mathalfa=cal=euler, mathalfa=frak=boondox
\define@key{asmeconf}{mathalfa}{%
  \PassOptionsToPackage{#1}{mathalfa}%
}

%%% set key [nodefaultsups] to obtain newtx superiors font for footnotes.
\newboolean{DefaultSups}\setboolean{DefaultSups}{true}
\define@key{asmeconf}{nodefaultsups}[false]{%
      \setboolean{DefaultSups}{#1}
}

%%% Use these switches to load other alphabets for Cyrillic, Greek, Japanese, and Vietnamese text
\newif\ifac@cyrillic\ac@cyrillicfalse
\newif\ifac@greek\ac@greekfalse
\newif\ifac@japanese\ac@japanesefalse
\newif\ifac@vietnamese\ac@vietnamesefalse
\newif\ifac@mainset\ac@mainsetfalse

\providecommand\ac@TtwoA{}
\providecommand\ac@LGR{}
\providecommand\ac@Tfive{}

%%% Test whether main language is from a group that use the Cyrillic alphabet
\NewDocumentCommand\@FindCyr{>{\SplitList{;}}m}{\ProcessList{#1}{\@FlagCyr}}
\providecommand{\ac@main}{\relax}
\NewDocumentCommand\@FlagCyr{m}{%
	\ifthenelse{\equal{#1}{\ac@main}}{\ac@cyrillictrue\def\ac@TtwoA{T2A}}{\relax}% comparing strings
}

\define@key{asmeconf}{main}[english]{%
	  \PassOptionsToPackage{main=#1,#1}{babel}% added #1 resolves conflict of russianb.ldf & ukrainianb.ldf under "main=".
	  \ac@mainsettrue
	  \ifthenelse{\equal{#1}{english}}{%
			\PassOptionsToPackage{pdflang=en}{hyperref}}{%
		  	\ClassWarningNoLine{asmeconf}{Selecting #1 as the primary language}%
			\ifthenelse{\equal{#1}{greek}}{%
				\ac@greektrue
				\def\ac@LGR{LGR}%
			}{\relax}%
			\ifthenelse{\equal{#1}{vietnamese}}{%
				\ac@vietnamesetrue
				\def\ac@Tfive{T5}%
				\RequirePackage[vietnamese=nohyphenation]{hyphsubst}% Eliminates babel warning
			}{\relax}%				
			\def\ac@main{#1}%
			\@FindCyr{russian;belarusian;bulgarian;macedonian;serbianc;ukrainian}
	  }%
}
\define@key{asmeconf}{vietnamese}[]{%
	\RequirePackage[vietnamese=nohyphenation]{hyphsubst}% using key, not option, to allow loading package w/o babel warning.
	\PassOptionsToPackage{vietnamese}{babel}%
	\ac@vietnamesetrue
	\def\ac@Tfive{T5}%
}

%%% only main= is actually needed, but keeping these legacy commands for backward compatibility
\define@key{asmeconf}{lang}[english]{%  deprecated option
	  \PassOptionsToPackage{main=#1,#1}{babel}%
      \PassOptionsToPackage{pdflang=en}{hyperref}
	  \ac@mainsettrue%
	  \ifthenelse{\equal{#1}{english}}{%
			\relax}{%
		  	\ClassWarningNoLine{asmeconf}{Selecting #1 as the primary language}%
	  }%
}
\define@key{asmeconf}{lang-second}[english]{% deprecated option
      \PassOptionsToPackage{#1}{babel}%
}
\define@key{asmeconf}{lang-third}[english]{%  deprecated option
      \PassOptionsToPackage{#1}{babel}%
}

\ProcessKeyvalOptions{asmeconf}

%% if main language was not chosen explicitly, default to English
\ifac@mainset\relax\else
	\PassOptionsToPackage{main=english}{babel}%
	\PassOptionsToPackage{pdflang=en}{hyperref}
	%\ClassWarningNoLine{asmeconf}{Selecting English as the primary language, since main= not set}%
\fi

%% Turn off these keys now that we're done with them
\def\@KeyFamily{asmeconf}
\NewDocumentCommand\ac@DisableOption{m}{%
  \DisableKeyvalOption[%
    action=ignore,%
    class=asmeconf%
  ]{#1}{\@KeyFamily}%
}
\NewDocumentCommand\@DisableKeys{>{\SplitList{;}}m}{\ProcessList{#1}{\ac@DisableOption}}

\@DisableKeys{main;lang;nodefaultsups;mathalfa;lang-second;lang-third}

%%%%%%%%%%%%%   More Language options  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% option to use fontspec [fontspec] (e.g, if you need complex language-specific fonts)
\newif\ifac@fontspec\ac@fontspecfalse
\newif\iffontspecloaded\fontspecloadedfalse% so user can test in .tex file
\DeclareOption{fontspec}{%
	\ifpdftex
		\ClassWarningNoLine{asmeconf}{fontspec option requires LuaLaTeX, will be ignored under pdfLaTeX}%
	\else
		\ac@fontspectrue
		\fontspecloadedtrue
	    \def\ssztwo{}% for Inconsolatazi4; default uses slashed zero, +ss02 uses regular zero
	    \def\MonoNotMono{WordSpace={1,1.33,1.67}}% for Inconsolatazi4; default allows word spacing (is not mono)	
	\fi
}

\DeclareOption{greek}{%
	\PassOptionsToPackage{greek}{babel}%
	\ac@greektrue
	\def\ac@LGR{LGR}%
}

\DeclareOption{japanese}{% mainly to control loading of fontspec options
	\ifac@fontspec	
		\PassOptionsToPackage{japanese}{babel}%
		\ac@japanesetrue
	\else
		\ClassWarningNoLine{asmeconf}{japanese option is supported only with the [fontspec] option + LuaLaTeX. It will be ignored}%
	\fi
}

%% Cyrillic languages
\NewDocumentCommand\@CyrOptions{>{\SplitList{;}}m}{\ProcessList{#1}{\@CyrOptSet}}
\NewDocumentCommand\@CyrOptSet{m}{%
	\DeclareOption{#1}{%
		\PassOptionsToPackage{#1}{babel}%
		\ac@cyrillictrue
		\def\ac@TtwoA{T2A}%
	}
}
\@CyrOptions{russian;belarusian;bulgarian;macedonian;serbianc;ukrainian}

% Several languages do not have .ldf files to load. Babel will call these on demand.
%
\DeclareOption{arabic}{\ClassError{asmeconf}{Do not specify "arabic" as a class option}{Instead, give the option [bidi=basic] and specify "arabic" when you call the language within your document.}}
%
\DeclareOption{bengali}{\ClassError{asmeconf}{Do not specify "bengali" as a class option}{Babel does not have an ldf file for Bengali. Instead, specify "bengali" when you call the language within your document. No class option is needed.}}
%
\DeclareOption{chinese-simplified}{\ClassError{asmeconf}{Do not specify "chinese-simplified" as class option}{Babel does not have an ldf file for simplified Chinese. Instead, specify "chinese-simplified" when you call the language within your document. No class option is needed.}}
%
\DeclareOption{chinese-traditional}{\ClassError{asmeconf}{Do not specify "chinese-traditional" as class option}{Babel does not have an ldf file for traditional Chinese. Instead, specify "chinese-traditional" when you call the language within your document. No class option is needed.}}
%
\DeclareOption{chinese}{\ClassError{asmeconf}{Do not specify "chinese" as a class option}{Instead, specify either "chinese-simplified" or "chinese-traditional" when you call the language within your document. No class option is needed.}}
%
\DeclareOption{hindi}{\ClassError{asmeconf}{Do not specify "hindi" as a class option}{Babel does not have an ldf file for Hindi. Instead, specify "hindi" when you call the language within your document. No class option is needed.}}
%
\DeclareOption{marathi}{\ClassError{asmeconf}{Do not specify "marathi" as a class option}{Babel does not have an ldf file for Marathi. Instead, specify "marathi" when you call the language within your document. No class option is needed.}}
%
\DeclareOption{korean}{\ClassError{asmeconf}{Do not specify "korean" as class option}{Babel does not have an ldf file for Korean. Instead, specify "korean"when you call the language within your document. No class option is needed.}}
%
\DeclareOption{tamil}{\ClassError{asmeconf}{Do not specify "tamil" as a class option}{Babel does not have an ldf file for Tamil. Instead, specify "tamil" when you call the language within your document. No class option is needed.}}


%%%%%%%   PDF/A Compliance Options  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\ifac@setpdfa\ac@setpdfafalse
\newif\ifac@pdfaone\ac@pdfaonefalse

\ifpdftex %% PDF/A compliance has only been configured for pdflatex
%
%%% set key [pdfa] to activate pdf/a compliance (default is pdf/A-3u)
	\define@key{pdfaopt}{pdf-a}[true]{%
      \ac@setpdfatrue
      \PassOptionsToPackage{pdfa,pdfapart=3,pdfaconformance=u}{hyperref}%
	}
%%% to select part 1, 2 or 3 
	\define@key{pdfaopt}{pdfapart}[3]{%
      \PassOptionsToPackage{pdfapart=#1}{hyperref}%
	  \ifthenelse{\equal{#1}{1}}{\ac@pdfaonetrue}{\relax}%
	}
%%% to select conformance b or u.  NB: a is not possible with pdfLaTeX, and u is not possible with 1.
	\define@key{pdfaopt}{pdfaconformance}[u]{%
      \PassOptionsToPackage{pdfaconformance=#1}{hyperref}%
	}
	\ProcessKeyvalOptions{pdfaopt}%
\else
	\ifac@pdfaone\ClassWarningNoLine{asmeconf}{PDF/A compliance option requires pdfLaTeX engine}\fi
\fi

%% Done with these keys, so we can now disable them
\def\@KeyFamily{pdfaopt}
\@DisableKeys{pdf-a;pdfapart;pdfaconformance}


%%%%%%%%%  Miscellaneous options  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% option to balance column height on last page [balance] 
\newif\ifac@balance\ac@balancefalse
\DeclareOption{balance}{%
      \ac@balancetrue
	  \ClassWarningNoLine{asmeconf}{Loading flushend package to balance column height on last page}%
}

%%% option to obtain line numbers [lineno] 
\newif\ifac@lineno\ac@linenofalse
\DeclareOption{lineno}{\ac@linenotrue}

%% option to omit ASME footer [nofoot]
\DeclareOption{nofoot}{%
   \AtBeginDocument{\pagestyle{plain}}%
}

%%% option [contractor] to obtain government contractor copyright notice.
\newif\ifac@contractor\ac@contractorfalse
\DeclareOption{contractor}{\ac@contractortrue}

%%% option [govt] to obtain government employee copyright notice.
\newif\ifac@govt\ac@govtfalse
\DeclareOption{govt}{\ac@govttrue}

%% option to use grid of authors
\newboolean{Oldauthors}\setboolean{Oldauthors}{false}
\DeclareOption{authorgrid}{%
      \setboolean{Oldauthors}{true}%
	  \ClassWarningNoLine{asmeconf}{Selected option for a grid of author blocks}%
}
\DeclareOption{oldauthors}{%% deprecated, but retained for backward compatibility
      \setboolean{Oldauthors}{true}%
	  \ClassWarningNoLine{asmeconf}{Selected option for a grid of author blocks}%
}

%% option for slightly larger small capitals font, via newtxtext
\DeclareOption{largesc}{%
	\ifac@fontspec
		\ClassWarningNoLine{asmeconf}{largesc option is not available under fontspec, will be ignored}%
	\else
		\PassOptionsToPackage{largesc=true}{newtxtext}% largesc is a boolean key in newtxtext
	\fi
}

%% Disable newtxtext osf option, which is not appropriate for documents in this class
\DeclareOption{osf}{%
	\PassOptionsToPackage{lining}{newtxtext}%
}

%% option to hyphenate the typewriter font [hyphenate] and to issue a warning when that's done.
\DeclareOption{hyphenate}{%
	\ifac@fontspec
		\ClassWarningNoLine{asmeconf}{hyphenate option is not supported by fontspec, will be ignored}%
	\else
		\PassOptionsToPackage{hyphenate}{inconsolata}% hyphenate is a key via xkeyval in inconsolata
		\ClassWarningNoLine{asmeconf}{Allowing hyphenation of typewriter font}%
	\fi
}
%% option for monospacing in typewriter font [mono].
\DeclareOption{mono}{%
	\ifac@fontspec
		\def\MonoNotMono{}%
	\else
		\PassOptionsToPackage{mono}{inconsolata}% mono is a key via xkeyval in inconsolata
	\fi
}
%% option for unslashed zero typewriter font [var0].
\DeclareOption{var0}{%
	\ifac@fontspec
		\def\ssztwo{+ss02}% stylistic alternate for regular zero
	\else
		\PassOptionsToPackage{var0}{inconsolata}% var0 is a key via xkeyval in inconsolata
	\fi
}

\ifthenelse{\boolean{DefaultSups}}{%
		\ifac@fontspec\relax\else
			\PassOptionsToPackage{defaultsups=true}{newtxtext}% defaultsups is a boolean key in newtxtext
		\fi}{\relax}

%% Suppress warnings about unused global options
\DeclareOption*{}

\ProcessOptions \relax

%%%%%%%%%%%%%  Geometry, bibliography, graphics, colors %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[letterpaper, left=0.5in, right=0.5in, top=0.5in, bottom = 1.in, footskip=0.5in, columnsep=0.38in]{geometry}
% conforms to ASME required margins
\setlength\parindent{0.25in}

\RequirePackage[sort&compress,numbers]{natbib} 
\setlength\bibsep{1pt plus 1pt minus 1pt}

\RequirePackage{graphicx} 
\ifpdf\def\MyColorOption{fixpdftex}\else\ifluatex\def\MyColorOption{luatex}\else\def\MyColorOption{}\fi\fi
\RequirePackage[hyperref,\MyColorOption,dvipsnames,svgnames,x11names]{xcolor}

%%%%%%%%%%%%  Table related %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{booktabs}
\RequirePackage{array} 

\RequirePackage{dcolumn}% alignment on decimal places 
\newcolumntype{d}[1]{D{.}{.}{#1}}% NB: This conflicts with babel's spanish language option which makes "." an active character.
								 % To use "," separator, put this in preamble: \newcolumntype{d}[1]{D{,}{,}{#1}}

%%%%%%%%%%%%  Font related  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifpdftex % moved fontenc 31 Jan 2021
	\ifac@pdfaone
		\pdfminorversion=4 % for pdf/a-1 need version 4, not 7
	\else
  		\pdfminorversion=7 % this selection is not essential.
	\fi
	\RequirePackage[T1,\ac@TtwoA,\ac@LGR,\ac@Tfive]{fontenc}% T2A to support Cyrillic (w/o babel warning); LGR - Greek; T5 - Vietnamese
  	\RequirePackage[utf8]{inputenc} % for backward compatibility with pre-2018 LaTeX distributions
\else
  	\ifluatex
		\relax
	\else 
  		\ClassError{asmeconf}{Please use either pdfLaTeX or LuaLaTeX}{This class has NOT been configured to support other engines, and the results will be unpredictable. Your best course of action is to exit and rerun using either pdfLaTeX or LuaLaTeX.}%
	\fi
\fi

\RequirePackage{mathtools}% loads and extends amsmath
\RequirePackage[]{babel}

\ifpdftex
    \RequirePackage[]{newtxtext}
    \RequirePackage[varqu,varl]{inconsolata}% sans typewriter font
    \RequirePackage[]{newtxmath}
\else
    \ifac@fontspec
        \RequirePackage[varqu,varl]{inconsolata}% typewriter font for math
        \renewcommand*{\sfdefault}{qhv}         % sans font for math
        \renewcommand{\rmdefault}{ntxtlf}       % roman font for math
        \RequirePackage[]{newtxmath}			% newtxmath still handles mathematics
        
        \RequirePackage[no-math]{fontspec}
        \defaultfontfeatures{Ligatures= TeX,}
%        
        \setmainfont{TeXGyreTermesX}[% Presumes these are system fonts! Available at: http://www.gust.org.pl/projects/e-foundry/tex-gyre
 			WordSpace = {1,1.4,1},%% This stretch matches newtxtext a little better.
        	Extension = .otf,
        	UprightFont = *-Regular,
        	ItalicFont = *-Italic,
        	BoldFont = *-Bold,
        	BoldItalicFont = *-BoldItalic,
        	Ligatures= TeX,
			Numbers = Lining,
			]
        \setsansfont{texgyreheros}[% Presumes these are system fonts! Available at: http://www.gust.org.pl/projects/e-foundry/tex-gyre
 			WordSpace = {1,1.4,1},
			Extension = .otf,
        	UprightFont = *-regular,
        	ItalicFont = *-italic,
        	BoldFont = *-bold,
        	BoldItalicFont = *-bolditalic,
        	Ligatures = TeX,
			Numbers = Lining,
        	Scale=0.9,
			]        
       \setmonofont{Inconsolatazi4}[% This otf font ships with the LaTeX Inconsolata package (it's in TeX Live)
            \MonoNotMono,% match newtxtext if we enable wordspacing
            Scale=1,
            Extension = .otf,
            UprightFont = *-Regular,
            ItalicFont = *-Regular,% has no italic face
            BoldFont = *-Bold, 
        	BoldItalicFont = *-Bold,% has no italic face
	        Ligatures = TeX,
            RawFeature = {+ss01,\ssztwo,+ss03},
            ]          
%    
        % For many languages, using babel commands helps font loading. 
        % Noto fonts are available at https://github.com/googlefonts
    	\def\Noto@scale{0.92}
	   	\def\NotoAra@scale{0.91}% The serif font only
    	\def\NotoBan@scale{0.92}% 1.} should probably stay consistent within the Noto family.
    	\def\NotoDev@scale{0.92}% 1.} should probably stay consistent within the Noto family.
    	\def\NotoTam@scale{0.92}
		\def\Noto@color{black}	
%
        \babelprovide[import, language=Default]{arabic}
        \babelfont [arabic]{rm}[Scale=\NotoAra@scale,
	 		 Renderer=HarfBuzz,
             Extension = .ttf,
			 UprightFont = *-Regular,
			 ItalicFont = *-Regular,% don't use italic face, I am told
			 BoldFont = *-Bold,%
        	 BoldItalicFont = *-Bold,% don't use italic face, I am told
			 ]{Amiri}% NotoNaskhArabic}% Some readers prefer Amiri font
        \babelfont [arabic]{sf}[Scale=\Noto@scale,
	 		 Renderer=HarfBuzz,
             Extension =.ttf,
			 UprightFont = *-Regular,
			 ItalicFont = *-Regular,% font has no italic face
			 BoldFont = *-SemiBold,% I'm told that legibility better than Bold
        	 BoldItalicFont = *-SemiBold,% font has no italic face
			 ]{NotoSansArabic}%DejaVuSans}%NotoKufiArabic}% .otf,%
        \babelfont [arabic]{tt}[%
	 		 Renderer=HarfBuzz,
             Extension =.ttf,
			 UprightFont = *-Regular,
			 ItalicFont = *-Regular,% has no italic face
			 BoldFont = *-SemiBold,% I'm told that legibility is better than Bold
        	 BoldItalicFont = *-SemiBold,% has no italic face
			 ]{NotoSansArabic}%same as above!
        \providecommand\arabicabstractname{ملخص}% NB: utf-8
%
        \babelprovide[import,language=Default,script=Bangla]{bengali}
        \babelfont [bengali]{rm}[%
	 		 Renderer=HarfBuzz,
             Scale=\NotoBan@scale,% same as Devanagari
             Color=\Noto@color,
             Extension = .ttf,
			 UprightFont = *-Regular,
			 ItalicFont = *-Regular,% has no italic face
			 BoldFont = *-Bold, 
        	 BoldItalicFont = *-Bold,% has no italic face
        ]{NotoSerifBengali}
        \babelfont [bengali]{sf}[%
	 		 Renderer=HarfBuzz,
             Scale=\NotoBan@scale,
             Color=\Noto@color,
             Extension = .ttf,
			 UprightFont = *-Regular,
			 ItalicFont = *-Regular,% has no italic face
			 BoldFont = *-Bold, 
        	 BoldItalicFont = *-Bold,% has no italic face
        ]{NotoSansBengali}
        \babelfont [bengali]{tt}[
	 		 Renderer=HarfBuzz,
			 Scale=\NotoBan@scale,
             Color=\Noto@color,
             Extension = .ttf,
			 UprightFont = *-Regular,
			 ItalicFont = *-Regular,% has no italic face
			 BoldFont = *-Bold, 
        	 BoldItalicFont = *-Bold,% has no italic face
		]{NotoSansBengali}		
%
        % Cyrillic languages
		\NewDocumentCommand\@LoadBabelCyr{>{\SplitList{;}}m}{\ProcessList{#1}{\@CyrillicBabel}}
		\NewDocumentCommand\@CyrillicBabel{m}{%
        	\babelprovide[import,language=Default,script=Cyrillic]{#1}
            \babelfont [#1]{rm}[Scale=\Noto@scale,Color=\Noto@color]{NotoSerif}
            \babelfont [#1]{sf}[Scale=\Noto@scale,Color=\Noto@color]{NotoSans}
            \babelfont [#1]{tt}[Scale=\Noto@scale,Color=\Noto@color]{NotoSansMono}
		}
		\@LoadBabelCyr{russian;belarusian;bulgarian;macedonian;serbian-cyrillic;ukrainian}% serbianc has no .ini under fontspec
		\setlocalecaption{serbian-cyrillic}{abstract}{Сажетак}% NB: utf-8
%
        % Devanagari languages
        \newfontscript{Devanagari}{deva}% HarfBuzz has some problems in Hindi, see babel manual Sect. 1.13 (main issue is ra)
		\NewDocumentCommand\@LoadBabelDev{>{\SplitList{;}}m}{\ProcessList{#1}{\@DevBabel}}
		\NewDocumentCommand\@DevBabel{m}{%
        	\babelprovide[import,language=Default]{#1}
            \babelfont [#1]{rm}[%
%		 		 Renderer=HarfBuzz,% works for Marathi, throws errors in Hindi...
                 Scale=\NotoDev@scale,
                 Color=\Noto@color,
                 Extension = .ttf,
    			 UprightFont = *-Regular,
    			 ItalicFont = *-Regular,% has no italic face
    			 BoldFont = *-Bold, 
            	 BoldItalicFont = *-Bold,% has no italic face
             ]{NotoSerifDevanagari}
            \babelfont [#1]{sf}[%
%		 		 Renderer=HarfBuzz,% works for Marathi, throws errors in Hindi...
                 Scale=\NotoDev@scale,
                 Color=\Noto@color,
                 Extension = .ttf,
    			 UprightFont = *-Regular,
    			 ItalicFont = *-Regular,% has no italic face
    			 BoldFont = *-Bold, 
            	 BoldItalicFont = *-Bold,% has no italic face
             ]{NotoSansDevanagari}
            \babelfont [#1]{tt}[
%		 		 Renderer=HarfBuzz,% works for Marathi, throws errors in Hindi...
                 Scale=\NotoDev@scale,
                 Color=\Noto@color,
                 Extension = .ttf,
    			 UprightFont = *-Regular,
    			 ItalicFont = *-Regular,% has no italic face
    			 BoldFont = *-Bold, 
            	 BoldItalicFont = *-Bold,% has no italic face
			 ]{NotoSansDevanagari}		
		}
		\@LoadBabelDev{hindi;marathi;kashmiri;nepali;sanskrit}% no .ldf files for these languages, but they do have .ini. Nepali: no abstractname
%
		% Greek
		\babelprovide[import,language=Default]{greek}
        \babelfont [greek]{rm}[Scale=\Noto@scale,WordSpace={1.1},Color=\Noto@color]{NotoSerif}% increase word spacing slightly
        \babelfont [greek]{sf}[Scale=\Noto@scale,WordSpace={1.1},Color=\Noto@color]{NotoSans}
        \babelfont [greek]{tt}[Scale=\Noto@scale,Color=\Noto@color]{NotoSansMono}
%      
        % Japanese
        \ifac@japanese
        	\RequirePackage[match]{luatexja-fontspec}% japanese typesets *much* better with this loaded
            \setmainjfont{NotoSerifCJKjp}[Scale=\Noto@scale,Color=\Noto@color]
            \setsansjfont{NotoSansCJKjp}[Scale=\Noto@scale,Color=\Noto@color]
            \setmonojfont{NotoSansMonoCJKjp}[Scale=\Noto@scale,Color=\Noto@color]
            \ltjsetparameter{jacharrange={-1, -2, +3, -4, -5, +6, +7, +8}}% this prevents luatexja from breaking Russian and Greek.
            % see: https://tex.stackexchange.com/questions/222320/russian-in-document-with-japanese-as-main-language-lualatex-ltjsarticle
    		% Need at least one of the following to load the Japanese dictionary.
    		\babelfont [japanese]{rm}[%
    			Scale=\Noto@scale,
    			Color=\Noto@color,
    			Extension = .otf,
    			UprightFont = *-Regular,
    			ItalicFont = *-Regular,% has no italic face
    			BoldFont = *-Bold, 
            	BoldItalicFont = *-Bold,% has no italic face
    			]{NotoSerifCJKjp}% Scale estimated
        	\babelfont [japanese]{sf}[%
            	Scale=\Noto@scale,
    			Color=\Noto@color,
    			Extension = .ttc,
    			UprightFont = *-Regular,
    			ItalicFont = *-Regular,%  has no italic face
    			BoldFont = *-Bold, 
            	BoldItalicFont = *-Bold,% has no italic face
			]{NotoSansCJK}
            \babelfont [japanese]{tt}[Scale=\Noto@scale,Color=\Noto@color]{NotoSansMonoCJKjp}% renders same as Sans!
		\fi
		% Note: \japaneseabstractname is not defined if japanese is not called as a package option.
				
		% Korean
		\babelprovide[import,language=Default]{korean}
        \babelfont [korean]{rm}[%
        	Scale=\Noto@scale,
			Color=\Noto@color,
			Extension = .otf,
			UprightFont = *-Regular,
			ItalicFont = *-Regular,%  has no italic face
			BoldFont = *-Bold, 
        	BoldItalicFont = *-Bold,% has no italic face
        ]{NotoSerifCJKkr}
        \babelfont [korean]{sf}[%
        	Scale=\Noto@scale,
			Color=\Noto@color,
			Extension = .ttc,
			UprightFont = *-Regular,
			ItalicFont = *-Regular,%  has no italic face
			BoldFont = *-Bold, 
        	BoldItalicFont = *-Bold,% has no italic face
		]{NotoSansCJK}
        \babelfont [korean]{tt}[Scale=\Noto@scale,Color=\Noto@color]{NotoSansMonoCJKkr}
        \renewcommand\koreanabstractname{초록}% NB: utf-8

		% Simplified Chinese
		\babelprovide[import,language=Default]{chinese-simplified}
        \babelfont [chinese-simplified]{rm}[%
        	Scale=\Noto@scale,
        	Color=\Noto@color,
        	Extension = .otf,
			UprightFont = *-Regular,
			ItalicFont = *-Regular,%  has no italic face
			BoldFont = *-Bold, 
        	BoldItalicFont = *-Bold,% has no italic face
		]{NotoSerifCJKsc}
        \babelfont [chinese-simplified]{sf}[%
        	Scale=\Noto@scale,
			Color=\Noto@color,
			Extension = .ttc,
			UprightFont = *-Regular,
			ItalicFont = *-Regular,%  has no italic face
			BoldFont = *-Bold, 
        	BoldItalicFont = *-Bold,% has no italic face
		]{NotoSansCJK}
        \babelfont [chinese-simplified]{tt}[Scale=\Noto@scale,Color=\Noto@color]{NotoSansMonoCJKsc}
%
		% Traditional Chinese (includes characters for Cantonese also)
		\babelprovide[import,language=Default]{chinese-traditional}
        \babelfont [chinese-tradiational]{rm}[%
        	Scale=\Noto@scale,
        	Color=\Noto@color,
        	Extension = .otf,
			UprightFont = *-Regular,
			ItalicFont = *-Regular,%  has no italic face
			BoldFont = *-Bold, 
        	BoldItalicFont = *-Bold,% has no italic face
		]{NotoSerifCJKtc}
        \babelfont [chinese-traditional]{sf}[%
        	Scale=\Noto@scale,
			Color=\Noto@color,
			Extension = .ttc,
			UprightFont = *-Regular,
			ItalicFont = *-Regular,%  has no italic face
			BoldFont = *-Bold, 
        	BoldItalicFont = *-Bold,% has no italic face
		]{NotoSansCJK}
        \babelfont [chinese-traditional]{tt}[Scale=\Noto@scale,Color=\Noto@color]{NotoSansMonoCJKtc}
%
        \babelprovide[import,language=Default]{tamil}
        \babelfont [tamil]{rm}[%
	 		 Renderer=HarfBuzz,
             Scale=\NotoTam@scale,
             Color=\Noto@color,
             Extension = .ttf,
			 UprightFont = *-Regular,
			 ItalicFont = *-Regular,% has no italic face
			 BoldFont = *-Bold, 
        	 BoldItalicFont = *-Bold,% has no italic face
        ]{NotoSerifTamil}
        \babelfont [tamil]{sf}[%
	 		 Renderer=HarfBuzz,
             Scale=\NotoTam@scale,
             Color=\Noto@color,
             Extension = .ttf,
			 UprightFont = *-Regular,
			 ItalicFont = *-Regular,% has no italic face
			 BoldFont = *-Bold, 
        	 BoldItalicFont = *-Bold,% has no italic face
        ]{NotoSansTamil}
        \babelfont [tamil]{tt}[
	 		 Renderer=HarfBuzz,
			 Scale=\NotoTam@scale,
             Color=\Noto@color,
             Extension = .ttf,
			 UprightFont = *-Regular,
			 ItalicFont = *-Regular,% has no italic face
			 BoldFont = *-Bold, 
        	 BoldItalicFont = *-Bold,% has no italic face
		]{NotoSansTamil}		
%
	\babelprovide[import, captions/abstract = Muhtasari, language = Default]{swahili}
%	
    \else % use lualatex without font support for other languages (easier set-up and still enables luacode for numerics)
        \RequirePackage[]{newtxtext}% will lose some accented characters this way ... better to use fontspec
        \RequirePackage[varqu,varl]{inconsolata}% sans typewriter font
        \RequirePackage[]{newtxmath}
    \fi
\fi

\RequirePackage[]{mathalfa}% load optional fonts for Calligraphy, Script, Fraktur. Key format: mathalfa=cal=euler (etc.)
\RequirePackage{bm}%   		 load after all math to give further access to bold math

%% option not to use latex default superscripts; if fontspec loaded, use the superiors package.
\ifthenelse{\boolean{DefaultSups}}{\relax}{%
	\ifac@fontspec
		\RequirePackage{superiors}% must come after text font is loaded			
	\else
		\relax
	\fi
}

%% override \textsu if using default superiors
\ifthenelse{\boolean{DefaultSups}}{\let\textsu\textsuperscript}{\relax}

%% Ensure that the current font is used for equation tags, not \normalfont as set by amsmath
\def\maketag@@@#1{\hbox{\m@th#1}}

% The article class calls \sloppy in two-column mode (\tolerance 9999, \emergencystretch 3em)
% The following adjustments affect line breaking; the values below are intended to produce
% fewer lines with large spaces, without creating the problems of using \fussy in two-column mode.
\tolerance 2500
\emergencystretch 3em 

\RequirePackage{metalogo,hologo}% Access various LaTeX logos if needed

%% font size selection  
%% ASME's specs differ slightly from latex standard article-10 class 

\renewcommand\LARGE{\@setfontsize\LARGE{16}{19.2}}              %{18}{21.6}}  updated 7/7/19 to match new ASME spec.  
                                                                % ...default is 17.28/22 ... used for paper#
\renewcommand\large{\@setfontsize\large{11}{13.6}}              % default is 12/14 ... used for headings

%\renewcommand\Large{\@setfontsize\Large{14.4}{18}}             % same as default
%\renewcommand\normalsize{\@setfontsize\normalsize{10}{12}}     % same as default
%\renewcommand\small{\@setfontsize\small{9}{11}}                % same as default
%\renewcommand\footnotesize{\@setfontsize\footnotesize{8}{9.5}} % same as default


%% This provides sans-serif italic and sans-serif bold italic math.
%% These fonts are for use in the figure captions and section headings. 
%% Use \mathbf{..}, \mathversion{bold}, or \bm{..} elsewhere.
\DeclareMathVersion{sansbold}
\SetSymbolFont{letters}{sansbold}{OML}{ntxsfmi}{b}{it}
\SetSymbolFont{lettersA}{sansbold}{U}{ntxsfmia}{b}{it}
\SetSymbolFont{symbols}{sansbold}{LMS}{ntxsy}{b}{n}
\SetSymbolFont{largesymbols}{sansbold}{LMX}{ntxexx}{b}{n}%  added 25 Jan 2021
\SetSymbolFont{largesymbolsTXA}{sansbold}{U}{ntxexa}{b}{n}% added 25 Jan 2021
\SetSymbolFont{operators}{sansbold}{\encodingdefault}{\sfdefault}{\bfdefault}{n}
\SetMathAlphabet{\mathsf}{sansbold}{\encodingdefault}{\sfdefault}{b}{n}% changed from it 31 Jan 2021, \mathsf is upright.


% Nice solution from DPC to prevent aux file errors (due to active characters from babel) when switching from pdflatex to lualatex.
\ifx\directlua\undefined
	\AtBeginDocument{\immediate\write\@auxout{\detokenize{%
	 \ifx\directlua\undefined\else\endinput\fi}}}
\fi

%%%%%%%%  Footers and Footnotes  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{fancyhdr}
\pagestyle{fancy}

\AtBeginDocument{\edef\@EncodingMain{\encodingdefault}}
\NewDocumentCommand\@SetFont{}{\fontencoding\@EncodingMain\selectfont}

\fancyfoot{}
\fancyhead{}
\fancyfoot[CE,CO]{\@SetFont\thepage}% force encoding so that passages in some languages won't switch footer font from the main font.
\fancyfoot[RO,RE]{\@SetFont Copyright~\textcopyright~\the\year\ by ASME}
\renewcommand{\headrulewidth}{0pt} 
\renewcommand{\footrulewidth}{0pt}

\ifac@govt
	\newgeometry{left=0.5in, right=0.5in, top=0.5in, bottom = 1.in, footskip = 0.3in, columnsep = 0.38in}
	\fancyfoot[RO,RE]{}
	\fancyfoot[CE,CO]{\@SetFont\thepage\\[1ex]\small This material is declared a work of the U.\ S.~Government and is not subject to copyright protection in the United States.\\Approved for public release; distribution is unlimited.}
\fi

\ifac@contractor
	\newgeometry{left=0.5in, right=0.5in, top=0.5in, bottom = 1.in, footskip = 0.3in, columnsep = 0.38in}
	\fancyfoot[RO,RE]{}
	\fancyfoot[CE,CO]{\@SetFont\thepage\\[1ex]\footnotesize The United States Government retains, and by accepting the article for publication, the publisher acknowledges that the United States Government retains, a non-exclusive, paid-up, irrevocable, worldwide license to publish or reproduce the published form of this work, or allow others to do so, for United States Government purposes.}
\fi

%%%%%% footnotes %%%%%%%

\RequirePackage{fnpos}
\makeFNbottom
\makeFNbelow

\setlength{\skip\footins}{\baselineskip}% <=== per ASME, 1 extra line

\renewcommand{\footnoterule}{%
  \kern -3pt
  \hrule width 0.5in height 0.4pt
  \kern 2pt
}

%% reduce indentation of footnotes
\RenewDocumentCommand\@makefntext{m}{%
  \noindent\makebox[2ex][r]{\@makefnmark}#1}% <== To discourage hyphenation, do \hyphenpenalty=300\exhyphenpenalty=300 before #1

%%%%%%%%%  Caption related  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[labelfont={sf,bf},hypcap=false]{caption}
\RequirePackage[hypcap=false,list=true]{subcaption}

\DeclareCaptionLabelFormat{uppercase}{\MakeTextUppercase{#1} #2}
\DeclareCaptionTextFormat{boldmath}{\mathversion{sansbold}#1}
\captionsetup[figure]{labelformat=uppercase, labelfont={sf,bf,small},textfont={sf,bf,small},textformat=boldmath, labelsep=colon}
\captionsetup[table]{labelformat=uppercase, labelfont={sf,bf,small},textfont={sf,bf,small},textformat=boldmath, labelsep=colon,skip=0.5\baselineskip} %name=TABLE,

%% This construction avoids a failure of hyperref in relation to uppercase caption
%% Discussion: https://tex.stackexchange.com/questions/375695/maketextuppercase-inside-table-captions
\AtBeginDocument{
   \let\scaption\caption
   \renewcommand*{\caption}[2][\shortcaption]{\def\shortcaption{#2}\scaption[#1]{\MakeTextUppercase{#2}}}%
}
  
%%%%%%%%%  Section headings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% wish to accommodate hyperref

\RequirePackage{textcase} %% Allows uppercase titles and captions without errors from math and citations

\RequirePackage[raggedright,indentafter]{titlesec}

%% ASME specifies 10 pt headings
\titleformat{\section}{\mathversion{sansbold}\bfseries\sffamily\raggedright}{\thesection .}{0.5em}{\MakeTextUppercase}

\titleformat{\subsection}{\mathversion{sansbold}\bfseries\sffamily\raggedright}{\thesubsection}{0.5em}{}
\titleformat{\subsubsection}[runin]{\mathversion{sansbold}\bfseries\sffamily}{\thesubsubsection}{0.5em}{}[.\hspace*{0.5em}]

\titlespacing\section{0pt}{12pt plus 4pt minus 2pt}{1pt plus 1pt minus 1pt} % from 2 pt 2 pt 1 pt, 7/7/19
\titlespacing\subsection{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 1pt}
\titlespacing\subsubsection{\parindent}{6pt plus 3pt minus 2pt}{0pt plus 2pt minus 1pt} % from 12 4 3, 7/7/19

%%  Special handling of the appendices            
%%  Assumes that appendices are the last content in paper 
\RenewDocumentCommand{\appendix}{}{%
    \setcounter{section}{0}
    \pdfbookmark[0]{\appendicesname}{appendices}
    \renewcommand\thesection{\Alph{section}}
    \titleformat{\section}{\mathversion{sansbold}\bfseries\sffamily\raggedright}{\MakeTextUppercase{\appendixname}\ \thesection.}{0.5em}{\MakeTextUppercase}
}

%%%%%%%%%%  Hyperref, bookmarks, and PDF/A  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifac@setpdfa
	%%% to assist with unicode glyph mapping, following M. Sharpe's recommendation in the newtx documentation.
	\pdfgentounicode=1  							%% enable CMaps
	\input glyphtounicode.tex 						%% lists of mappings
	\InputIfFileExists{glyphtounicode-cmr.tex}{}{} 	%% additional mappings
	\InputIfFileExists{glyphtounicode-ntx.tex}{}{} 	%% additional mappings
%
	%%% a fairly generic RGB color profile, aimed at on-screen rendering (not print production)
	\immediate\pdfobj stream attr{/N 3} file{sRGB.icc}
	\pdfcatalog{%
	   /OutputIntents [
	    <<
	      /Type /OutputIntent
	      /S /GTS_PDFA1
	      /DestOutputProfile \the\pdflastobj\space 0 R
	      /OutputConditionIdentifier (sRGB)
	      /Info (sRGB)
	    >>
	   ]
	 }%
\fi

\RequirePackage{hyperxmp}% improve transfer of metadata to pdf 

\RequirePackage[%
    unicode,        % Unicode encoded PDF strings
    psdextra,       % additional support for math in pdf bookmarks
	pdfborder={0 0 0},% 
	bookmarks=true, %
	bookmarksnumbered=true,%
	bookmarksopen=true,%
	bookmarksopenlevel=1,%
%	colorlinks=true,%%% <=== set true to get colored type, but do so via package options
	linkcolor=blue, %
	citecolor=blue, % 
	urlcolor=blue,  % 
	breaklinks=true,%
	pdftitle={},    % <=== add in .tex file
	pdfkeywords={}, % <=== add in .tex file
	pdfnewwindow=true,%
	pdfpagelayout=SinglePage, %TwoPageRight,% changed this 08/12/20
	pdfauthor={},   % <=== add in .tex file
	pdfdisplaydoctitle=true%
	]{hyperref}
	
\urlstyle{same}     		  % don't switch to typewriter font for urls
\RequirePackage{doi}          % supports the nasty characters in some doi's
\renewcommand{\doitext}{DOI } % change to this from default value, {doi:}, per ASME specification
\RequirePackage{bookmark}     % improves handling of pdf bookmarks

%% Since \bm may be useful in headings, this fix will reduce frequency with which
%%    alternate pdfstrings must be given in revised section command as \section[pdfstring]{texstring}
\pdfstringdefDisableCommands{%
    \def\bm#1#{\relax}%
}

%% Let's disable \( and \) in pdf bookmarks, 28/2/20
\pdfstringdefDisableCommands{%
    \def\({\relax}%
    \def\){\relax}%
}

%% Let's also make sure \NoCaseChange in section headings won't break pdf bookmarks
\pdfstringdefDisableCommands{%
      \let\NoCaseChange\relax%
}

%% Let's just remove citations from pdf bookmarks
\pdfstringdefDisableCommands{%
    \def\cite{\@gobble}%
}

%% Let's make sure footnotes in section headings don't break pdf bookmarks.
\robustify{\footnote}
% \patchcmd{\section}{\sectionmark}{\let\footnote\@gobble\sectionmark}{}{}% <== not really needed in this context 28/2/20
\pdfstringdefDisableCommands{%
  \def\footnote#1{}%
}

%% Let's also add \footnote to the \TextUppercase exception list, so that footnote text won't be capitalized
%% if given in section headings. Ditto for \eqref
%
\patchcmd{\@uclcnotmath}{\@nonchangecase\ref}{\@nonchangecase\ref\@nonchangecase\footnote}{}{}
\patchcmd{\@uclcnotmath}{\@nonchangecase\ref}{\@nonchangecase\ref\@nonchangecase\eqref}{}{} %% corrected 24 Jan 2020
     

%%% Create an optional argument for unnumbered sections and set pdf bookmark (thru \addcontentsline).
%%% The optional argument will manually set the pdf bookmark for that section; can be used to avoid hyperref 
%%%     errors when macros are in section titles.
%%% There should not be errors for $, \cite, \ref, \eqref, \label, \footnote, \NoCaseChange, or \bm with current constructions.
\let\svsection\section
\RenewDocumentCommand{\section}{s o m}{%
	    \IfBooleanTF {#1}
		{\svsection*{#3}\phantomsection%
					{\IfNoValueTF {#2}
					{\addcontentsline{toc}{section}{#3}}
					{\addcontentsline{toc}{section}{#2}}% removed trailing space 28/2/20
					}%
		}%
		{\IfNoValueTF {#2}
			{\svsection{#3}}
			{\svsection[#2]{#3}}%
		}%
}

%%%%%%%%%%%%%  Line numbering and balancing columns on last page  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Allow line numbering in AMS math environments.
%%% postdisplaypenalty adjusted to avoid extra line number at end, see discussion here: https://tex.stackexchange.com/a/461192/ 
%%% multline has some additional problem that puts an extra line number above it.

\NewDocumentCommand{\@losepostpenalty}{}{\patchcmd{\linenomathWithnumbers}{\advance\postdisplaypenalty\linenopenalty}{}{}{}}

\NewDocumentCommand{\@FixAMSMath}{m}{%
	\AtBeginEnvironment{#1}{\@losepostpenalty\linenomath}%
	\AtEndEnvironment{#1}{\endlinenomath}%
	\AtBeginEnvironment{#1*}{\@losepostpenalty\linenomath}%
	\AtEndEnvironment{#1*}{\endlinenomath}%
}

\NewDocumentCommand{\@FixAll}{>{\SplitList{;}}m}{\ProcessList{#1}{\@FixAMSMath}}

%%% Adjustments when lineno option is used
\ifac@lineno%
    \RequirePackage[switch,mathlines]{lineno}    
    \renewcommand{\linenumberfont}{\normalfont\footnotesize\color{red}} 
    \AtBeginDocument{\linenumbers}
    \ClassWarningNoLine{asmeconf}{Package lineno loaded, so final column balancing is disabled}
	\@FixAll{align;alignat;gather;flalign;multline}
    \else
    \ifac@balance\RequirePackage{flushend}\fi % flushend is NOT compatible with lineno
\fi
%%% Enable dropping lineno option without trashing .aux file
\providecommand{\@LN@col}[1]{\relax}
\providecommand{\@LN}[2]{\relax}


%%%%%%%%%%%%%  Define special environments  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% Introduce some special section and other names %%%%%%%%%%%

\providecommand{\nomname}{Nomenclature}  
\providecommand{\keywordname}{Keywords}
\providecommand{\appendicesname}{APPENDICES}
\providecommand{\JAwords}{Joint first authors}
\providecommand{\CAwords}{Corresponding author}

%%   Abstract environment  %%%%%%%%%%%%%%%%%%
%%   \keywords command should be given someplace before the \end{abstract} command.

\providecommand{\@keywords}{\relax}

% \ifblank is from etoolbox
\NewDocumentCommand{\keywords}{m}{%
	\ifblank{#1}{\def\@keywords{\relax}}{
	    \long\def\@keywords{\par\smallskip\noindent{\bfseries\sffamily \keywordname: #1}}%
	}
}

\DeclareDocumentEnvironment{abstract}{}{% Overwrites existing abstract environment
	\section*{\abstractname}\itshape
	}
	{\upshape\@keywords
}
\NewDocumentEnvironment{abstract*}{}{% Abstract with no keywords (same as using empty \keywords{} with first abstract)
	\section*{\abstractname}\itshape
	}
	{\ignorespacesafterend
}

%%   Nomenclature environment  %%%%%%%%%%%%%%%%%%
%%
%%   Increase first optional argument to a dimension > 2em if wide entries cause undesired misalignment of columns. 
%%   Second optional argument can be used to rename the environment, e.g., to List of Symbols.

\newlength\nomenwidth
\newlength\savitemsep

%% If second argument of \entry is omitted, will produce an italicized heading (e.g. "Greek letters")
\NewDocumentCommand\entry{m g}{%
 \IfNoValueTF{#2}{%
 			 \itemsep3\p@ plus 1\p@ minus 1\p@%
             \goodbreak\item[\itshape#1\hfill]\setlength\itemsep\savitemsep\@itempenalty=1000%
             }{%
             \item[#1\hfill]#2%
             \@itempenalty=-\@lowpenalty%
             }%
}

%% A separate command command for nomenclature subheadings (xparse "g" argument used in \entry is deprecated)
\NewDocumentCommand\EntryHeading{m}{%
	\itemsep3\p@ plus 1\p@ minus 1\p@%
    \goodbreak\item[\itshape#1\hfill]\setlength\itemsep\savitemsep\@itempenalty=1000%
}

\NewDocumentEnvironment{nomenclature}{O{2em} O{\nomname}}{%
        \setlength\columnsep{2em} 
        \setlength{\nomenwidth}{#1}
        \section*{#2}
        \raggedright
        \begin{list}{}{%
             \setlength{\itemsep}{0pt}%
             \setlength{\parsep}{\itemsep}%
             \setlength{\labelsep}{1em}%
             \setlength{\labelwidth}{\nomenwidth}%
             \setlength{\leftmargin}{\labelwidth}%
             \addtolength{\leftmargin}{\labelsep}%
			 \setlength\savitemsep\itemsep%
        }%
}{\end{list}\ignorespacesafterend} 
       

%%%%%%%%%%%%%%%%%  Headers and Title  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NewDocumentCommand\ConfName{m}{\long\gdef\@ConfName{#1}}
\providecommand\@ConfName{\hbox{ }}

\NewDocumentCommand\ConfAcronym{m}{\gdef\@ConfAcronym{#1}}
\providecommand\@ConfAcronym{\hbox{ }}

\NewDocumentCommand\ConfDate{m}{\gdef\@ConfDate{#1,\space}}
\providecommand\@ConfDate{\space}

\NewDocumentCommand\ConfCity{m}{\gdef\@ConfCity{#1}}
\providecommand\@ConfCity{\hbox{ }}

\NewDocumentCommand\HeaderConfName{}{%
	\parbox{\linewidth}{%
		\raggedleft\bfseries\sffamily%
		\@ConfName\par%
		\MakeTextUppercase{\@ConfAcronym}\par
		\@ConfDate\@ConfCity%
    }%
}

\NewDocumentCommand\PaperNo{m}{\gdef\@PaperNo{#1}}
\providecommand\@PaperNo{\protect\phantom{NO.}}

\NewDocumentCommand\paperno{}{%
	\vspace*{2\baselineskip}
	\parbox{\linewidth}{\raggedleft\bfseries\sffamily\LARGE%
		\MakeTextUppercase{\@PaperNo}%
    }%
}

\NewDocumentCommand\PaperTitle{m}{\gdef\@PaperTitle{#1}}
\providecommand\@PaperTitle{\hbox{ }}

\NewDocumentCommand\papertitle{}{%
\vspace*{3\baselineskip}
\parbox{\linewidth}{\mathversion{sansbold}\centering{\bfseries\sffamily\large%
\MakeTextUppercase{\@PaperTitle}\par}%%% <=== extra \par to make leading stick. See adjustment in \MakeTitle
     }%
}

%%%%%%%%%%%   Author and affiliation block  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xcoffins}

%% To maintain compatibility with newtxtext superiors option, if used, save the definition (inline author style resets it)
\let\savethefootnote\thefootnote
\let\savemakefnmark\@makefnmark

%% Flag for joint first authors (two or more)
\newif\ifac@JA\ac@JAfalse

\NewDocumentCommand{\JointFirstAuthor}{}{%
	\global\ac@JAtrue%
  	$\bm{^\dagger}$%
}
%% Flag for corresponding author (expecting just one, but if two enter both email addresses and flag both authors)
\newif\ifac@CA\ac@CAfalse

\NewDocumentCommand\CorrespondingAuthor{m}{% Revised this command 29/12/20, to make the CA email mandatory but possibly empty
   \ignorespaces$\bm{^\ast}$%
   \global\ac@CAtrue%
   \ifblank{#1}{%
         \gdef\@CAsep{\relax}%
         \gdef\@CAemail{\relax}%
         }{%
         \gdef\@CAsep{:\space}%
         \gdef\@CAemail{#1}%
   }%
}

%%%% option to use the traditional grid layout of authors or the inline style

\ifthenelse{\boolean{Oldauthors}}{% This command works better than \if... in this context.

	%%%%%%%%%%%%%%%%%%%%  Gridded author layout  %%%%%%%%%%%%%%%%%%%%%%%%%

    \NewCoffin{\authorblock}
    
    %% Allows for up to fifteen author groups... if you need more authors, the edits should be obvious
    %% You can put multiple authors above a single affiliation to reduce number of author blocks needed.
    \NewCoffin{\firstrowauthorblock}
    \SetHorizontalCoffin\firstrowauthorblock{}
    \NewCoffin{\secondrowauthorblock}
    \SetHorizontalCoffin\secondrowauthorblock{}
    \NewCoffin{\thirdrowauthorblock}
    \SetHorizontalCoffin\thirdrowauthorblock{}
    \NewCoffin{\fourthrowauthorblock}
    \SetHorizontalCoffin\fourthrowauthorblock{}
    \NewCoffin{\fifthrowauthorblock}
    \SetHorizontalCoffin\fifthrowauthorblock{}
    
    \newcounter{authorno}
    \setcounter{authorno}{0}
    
    \newlength{\coffinsep}% horizontal space between coffins
    \setlength{\coffinsep}{0.03\textwidth}
    
    \NewDocumentCommand\SetAuthorBlock{mm}{%
       \addtocounter{authorno}{1}%
       \SetVerticalCoffin{\authorblock}{0.3\textwidth}{%
       \centering\sffamily%
       \textbf{\ignorespaces#1\ignorespaces}\\
       #2%
    	}
        \ifnum\value{authorno}=1
             \JoinCoffins\firstrowauthorblock[r,t]\authorblock[l,t]
         \else
            \ifnum\value{authorno}=2
               \JoinCoffins\firstrowauthorblock[r,t]\authorblock[l,t](\coffinsep,0pt)
            \else
              \ifnum\value{authorno}=3
                 \JoinCoffins\firstrowauthorblock[r,t]\authorblock[l,t](\coffinsep,0pt)
              \fi
            \fi 
        \fi
        \ifnum\value{authorno}=4
           \JoinCoffins\secondrowauthorblock[r,t]\authorblock[l,t]
        \else
           \ifnum\value{authorno}=5
                \JoinCoffins\secondrowauthorblock[r,t]\authorblock[l,t](\coffinsep,0pt)
           \else
                \ifnum\value{authorno}=6
                   \JoinCoffins\secondrowauthorblock[r,t]\authorblock[l,t](\coffinsep,0pt)
                \fi
           \fi 
        \fi
        \ifnum\value{authorno}=7
           \JoinCoffins\thirdrowauthorblock[r,t]\authorblock[l,t]	
        \else
           \ifnum\value{authorno}=8
                \JoinCoffins\thirdrowauthorblock[r,t]\authorblock[l,t](\coffinsep,0pt)
           \else
                \ifnum\value{authorno}=9
                   \JoinCoffins\thirdrowauthorblock[r,t]\authorblock[l,t](\coffinsep,0pt)
                \fi
           \fi 
        \fi
        \ifnum\value{authorno}=10
           \JoinCoffins\fourthrowauthorblock[r,t]\authorblock[l,t]	
        \else
           \ifnum\value{authorno}=11
                \JoinCoffins\fourthrowauthorblock[r,t]\authorblock[l,t](\coffinsep,0pt)
           \else
                \ifnum\value{authorno}=12
                   \JoinCoffins\fourthrowauthorblock[r,t]\authorblock[l,t](\coffinsep,0pt)
                \fi
           \fi 
        \fi
        \ifnum\value{authorno}=13
           \JoinCoffins\fifthrowauthorblock[r,t]\authorblock[l,t]	
        \else
           \ifnum\value{authorno}=14
                \JoinCoffins\fifthrowauthorblock[r,t]\authorblock[l,t](\coffinsep,0pt)
           \else
                \ifnum\value{authorno}=15
                   \JoinCoffins\fifthrowauthorblock[r,t]\authorblock[l,t](\coffinsep,0pt)
                \fi
           \fi 
        \fi
        \ifnum\value{authorno}>15
        	\ClassWarningNoLine{asmeconf}{The class is programmed for up to 15 author blocks. If some of your authors are at the same institution, %
			you may put more than one name above a single address.  If you need more than 15 author blocks, try using the in-line author style %
			instead of the [authorgrid] option}
		\fi
    }
    
    \NewDocumentCommand\ConstructAuthorBlock{}{%
        \ifnum\value{authorno}>3
           \JoinCoffins\firstrowauthorblock[hc,b]\secondrowauthorblock[hc,t](0pt, -1.5\baselineskip)     
        \fi
        \ifnum\value{authorno}>6
           \JoinCoffins\firstrowauthorblock[hc,b]\thirdrowauthorblock[hc,t](0pt, -1.5\baselineskip)  
        \fi
        \ifnum\value{authorno}>9
           \JoinCoffins\firstrowauthorblock[hc,b]\fourthrowauthorblock[hc,t](0pt, -1.5\baselineskip)  
        \fi
        \ifnum\value{authorno}>12
           \JoinCoffins\firstrowauthorblock[hc,b]\fifthrowauthorblock[hc,t](0pt, -1.5\baselineskip)  
        \fi
        \centerline{\TypesetCoffin\firstrowauthorblock}%% in this instance, \centerline is better than \centering
    }   
 
    % Changed to follow syntax of the inline style, which is much easier to use! 29/12/2020  
    %    % allow for NO email address to be given by omitting second argument
    %    \NewDocumentCommand{\CorrespondingAuthor}{m g}{%
    %       \global\ac@CAtrue%
    %       \IfNoValueTF{#2}{%
    %             \gdef\@CAsep{\relax}%
    %             \gdef\@CAemail{\relax}%
    %             }{%
    %             \gdef\@CAsep{:\space}%
    %             \gdef\@CAemail{#2}%
    %             }%
    %       \ignorespaces#1\ignorespaces$\bm{^\ast}$%\footnotemark[1]%
    %   }

	%%% to deal with sequential notes as, e.g., "1,*", or "1,2,*" %%%%%%%%%%
	% 	bug fixed 29/12/2020
    \newcommand\nextToken\relax
    
    \newcommand\isOthernote{%
        \ifx\CorrespondingAuthor\nextToken\textsuperscript{\sffamily\bfseries,}%
        \else%
            \ifx\JointFirstAuthor\nextToken\textsuperscript{\sffamily\bfseries,}%
            \fi%
        \fi%
        \ignorespaces% 
    }
    
    \let\oldCorrespondingAuthor\CorrespondingAuthor
    \renewcommand\CorrespondingAuthor[1]{%
        \oldCorrespondingAuthor{#1}\futurelet\nextToken\isOthernote}
        
    \let\oldJointFirstAuthor\JointFirstAuthor
    \renewcommand\JointFirstAuthor{%
        \oldJointFirstAuthor\futurelet\nextToken\isOthernote}
    
    \let\oldfootnote\footnote
    \renewcommand\footnote[1]{%
        \oldfootnote{#1}\futurelet\nextToken\isOtherfnote}
        
    \newcommand\isOtherfnote{%
        \ifx\footnote\nextToken\textsu{\mdseries,}%
        \fi%
    }    
     
%%% otherwise use the new compact layout of authors
}{%  i.e., this begins "else"

	%%%%%%%%%%%%%%%%%%%%%%   New author layout (inline)  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \NewCoffin{\AuthorBlock}
    \NewCoffin{\AffiliationBlock}
    \NewCoffin{\AffiliationsBlock}
    
	%% NB: \parbox width to \textwidth (full page) not \linewidth (single column)
    \SetHorizontalCoffin\AffiliationsBlock{}
    \NewDocumentCommand\SetAuthors{m}{%
         \SetHorizontalCoffin\AuthorBlock{%
         \parbox{\textwidth}{\centering\sffamily\bfseries\ignorespaces#1\ignorespaces}%
         }
    }
    
    \def\@makefnmark{\hbox{\@textsuperscript{\sffamily\@thefnmark}}}%
    
    \NewDocumentCommand\SetAffiliation{mm}{%
       \SetVerticalCoffin\AffiliationBlock{\textwidth}{%
          \centering\sffamily\footnotemark[#1]#2\ignorespaces%
       }
       \JoinCoffins\AffiliationsBlock[hc,b]\AffiliationBlock[hc,t](0pt,-1pt) 
    }
            
	%%% Affiliation mark
    \NewDocumentCommand{\affil}{m}{%
       {\bfseries\footnotemark[#1]}%
    }
          
	%%% to deal with sequential notes as, e.g., "1,*", or "1,2,*" %%%%%%%%%%
    \let\oldaffil\affil
    \newcommand\nextToken\relax
    
    \renewcommand\affil[1]{%
        \oldaffil{#1}\futurelet\nextToken\isOthernote}
    
    \newcommand\isOthernote{%
        \ifx\CorrespondingAuthor\nextToken\textsuperscript{\sffamily\bfseries,}%
        \else%
            \ifx\JointFirstAuthor\nextToken\textsuperscript{\sffamily\bfseries,}%
            \else
                \ifx\affil\nextToken\textsuperscript{\sffamily\bfseries,}%
                \fi%
            \fi%
        \fi%
        \ignorespaces% 
    }
    
    \let\oldCorrespondingAuthor\CorrespondingAuthor
    \renewcommand\CorrespondingAuthor[1]{%
        \oldCorrespondingAuthor{#1}\futurelet\nextToken\isOthernote}
        
    \let\oldJointFirstAuthor\JointFirstAuthor
    \renewcommand\JointFirstAuthor{%
        \oldJointFirstAuthor\futurelet\nextToken\isOthernote}
    
    \let\oldfootnote\footnote
    \renewcommand\footnote[1]{%
        \oldfootnote{#1}\futurelet\nextToken\isOtherfnote}
        
    \newcommand\isOtherfnote{%
        \ifx\footnote\nextToken\textsu{\mdseries,}%
        \fi%
    }    
%%%    
    \NewDocumentCommand\SetAuthorBlock{}{%
       \let\savethefootnote\thefootnote
       \JoinCoffins\AuthorBlock[hc,b]\AffiliationsBlock[hc,t](0pt,-\baselineskip)
       \centerline{\TypesetCoffin\AuthorBlock}
    }
} %% end ifthenelse for Oldauthors

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Make the title and author section
\NewDocumentCommand\MakeTitlePage{}{%
    \twocolumn[
       \begin{@twocolumnfalse}
          \HeaderConfName  
          \paperno 
          \papertitle
          \vspace*{2\baselineskip}
          \ifthenelse{\boolean{Oldauthors}}{%
             \ConstructAuthorBlock}{%
             \SetAuthorBlock}
          \vspace*{3\baselineskip} 
       \end{@twocolumnfalse} 
    ]
    \let\@makefnmark\savemakefnmark
    \renewcommand*{\thefootnote}{\fnsymbol{footnote}}
    \ifac@JA
        \ifDefaultSups\relax\else\ifac@fontspec\def\f@@tn@te{blub}\fi\fi% https://tex.stackexchange.com/a/565263/46356
        \footnotetext[2]{\JAwords}
    \fi
    \ifac@CA
        \footnotetext[1]{\CAwords\@CAsep\@CAemail}
    \fi
    \ifDefaultSups\relax\else
    	\ifac@fontspec\def\f@@tn@te{footnote}\fi
    \fi
    \let\thefootnote\savethefootnote
}

%%%%%%%%%%

%% Provide compatibility with titling commands from standard LaTeX article class
\RenewDocumentCommand{\maketitle}{}{\MakeTitlePage}
\RenewDocumentCommand{\title}{}{\PaperTitle}

\RenewDocumentCommand{\thanks}{m}{\relax}% disabling this standard command (inconsistent with this format)

%% Produces an unmarked footnote about the version date, to replace "date"
%% This tool is for editing and should not be used in the final draft
\NewDocumentCommand\versionfootnote{m}{\begin{NoHyper}\gdef\@thefnmark{}\@footnotetext{#1}\end{NoHyper}} 

\RenewDocumentCommand{\date}{m}{\versionfootnote{#1}}% if one wants to use \date this same way; fixed bug 14/01/2021


%%%%%%%%%%%%%%  Sans serif upright greek and sans mathversion  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Provide sans-serif *upright* Greek letters, following a suggestion by Michael Sharpe (March 2019).
%% Following Sharpe's newtxsf implementation of the STIX fonts, under the LaTeX Project Public License.
%% (Note that \mathversion{sansbold} provides sans-serif *italic* Greek letters.) Various edits 25 Jan 2021

\DeclareSymbolFont{lettersAB}{U}{ntxsfmia}{m}{it}
\SetSymbolFont{lettersAB}{normal}{U}{ntxsfmia}{m}{it}
\SetSymbolFont{lettersAB}{bold}{U}{ntxsfmia}{b}{it}
\SetSymbolFont{lettersAB}{sansbold}{U}{ntxsfmia}{b}{it}% added 25/01/2021, to get this bold in captions, etc.
\DeclareFontSubstitution{U}{ntxsfmia}{m}{it}

\DeclareMathSymbol{\sfGamma}{\mathalpha}{lettersAB}{0}% adjust to avoid overwriting newtxmath commands 25/01/2021
\DeclareMathSymbol{\sfDelta}{\mathalpha}{lettersAB}{1}
\DeclareMathSymbol{\sfTheta}{\mathalpha}{lettersAB}{2}
\DeclareMathSymbol{\sfLambda}{\mathalpha}{lettersAB}{3}
\DeclareMathSymbol{\sfXi}{\mathalpha}{lettersAB}{4}
\DeclareMathSymbol{\sfPi}{\mathalpha}{lettersAB}{5}

\DeclareMathSymbol{\sfSigma}{\mathalpha}{lettersAB}{6}
\DeclareMathSymbol{\sfUpsilon}{\mathalpha}{lettersAB}{7}
\DeclareMathSymbol{\sfPhi}{\mathalpha}{lettersAB}{8}
\DeclareMathSymbol{\sfPsi}{\mathalpha}{lettersAB}{9}
\DeclareMathSymbol{\sfOmega}{\mathalpha}{lettersAB}{10}

\DeclareMathSymbol{\sfalpha}{\mathalpha}{lettersAB}{11}
\DeclareMathSymbol{\sfbeta}{\mathalpha}{lettersAB}{12}
\DeclareMathSymbol{\sfgamma}{\mathalpha}{lettersAB}{13}
\DeclareMathSymbol{\sfdelta}{\mathalpha}{lettersAB}{14}
\DeclareMathSymbol{\sfepsilon}{\mathalpha}{lettersAB}{15}

\DeclareMathSymbol{\sfzeta}{\mathalpha}{lettersAB}{16}
\DeclareMathSymbol{\sfeta}{\mathalpha}{lettersAB}{17}
\DeclareMathSymbol{\sftheta}{\mathalpha}{lettersAB}{18}
\DeclareMathSymbol{\sfiota}{\mathalpha}{lettersAB}{19}
\DeclareMathSymbol{\sfkappa}{\mathalpha}{lettersAB}{20}

\DeclareMathSymbol{\sflambda}{\mathalpha}{lettersAB}{21}
\DeclareMathSymbol{\sfmu}{\mathalpha}{lettersAB}{22}
\DeclareMathSymbol{\sfnu}{\mathalpha}{lettersAB}{23}
\DeclareMathSymbol{\sfxi}{\mathalpha}{lettersAB}{24}
\DeclareMathSymbol{\sfpi}{\mathalpha}{lettersAB}{25}

\DeclareMathSymbol{\sfrho}{\mathalpha}{lettersAB}{26}
\DeclareMathSymbol{\sfsigma}{\mathalpha}{lettersAB}{27}
\DeclareMathSymbol{\sftau}{\mathalpha}{lettersAB}{28}
\DeclareMathSymbol{\sfUpsilon}{\mathalpha}{lettersAB}{29}
\DeclareMathSymbol{\sfphi}{\mathalpha}{lettersAB}{30}

\DeclareMathSymbol{\sfchi}{\mathalpha}{lettersAB}{31}
\DeclareMathSymbol{\sfpsi}{\mathalpha}{lettersAB}{32}
\DeclareMathSymbol{\sfomega}{\mathalpha}{lettersAB}{33}
\DeclareMathSymbol{\sfvarepsilon}{\mathalpha}{lettersAB}{34}
\DeclareMathSymbol{\sfvartheta}{\mathalpha}{lettersAB}{35}

\DeclareMathSymbol{\sfvarpi}{\mathord}{lettersAB}{36}% added these 25/01/2021
\DeclareMathSymbol{\sfvarrho}{\mathord}{lettersAB}{37}
\DeclareMathSymbol{\sfvarsigma}{\mathord}{lettersAB}{38}
\DeclareMathSymbol{\sfvarphi}{\mathord}{lettersAB}{39}
\DeclareMathSymbol{\sfitvarkappa}{\mathalpha}{lettersAB}{40}
\DeclareMathSymbol{\sfvarkappa}{\mathalpha}{lettersAB}{40}
\DeclareMathSymbol{\sfitnabla}{\mathalpha}{lettersAB}{42}
\DeclareMathSymbol{\sfnabla}{\mathalpha}{lettersAB}{43}
\DeclareMathSymbol{\sfhslash}{\mathalpha}{lettersAB}{52}% this is not upright
\DeclareMathSymbol{\sfhbar}{\mathalpha}{lettersAB}{53}%   this is not upright

\DeclareMathAccent{\grave}{\mathord}{lettersAB}{254}% added these after bug report 24/01/2021
\DeclareMathAccent{\acute}{\mathord}{lettersAB}{255}
\DeclareMathAccent{\check}{\mathord}{lettersAB}{186}
\DeclareMathAccent{\breve}{\mathord}{lettersAB}{187}
\DeclareMathAccent{\bar}{\mathord}{lettersAB}{221}
\DeclareMathAccent{\mathring}{\mathord}{lettersAB}{222}
\DeclareMathAccent{\hat}{\mathord}{lettersAB}{223}
\DeclareMathAccent{\dot}{\mathord}{lettersAB}{224}
\DeclareMathAccent{\tilde}{\mathord}{lettersAB}{219}

%%% sans math version, potential value with PGFPlots, e.g., not for use in main text. 25/01/2021 %%%
\DeclareMathVersion{sans}
\SetSymbolFont{letters}{sans}{OML}{ntxsfmi}{m}{it}
\SetSymbolFont{lettersA}{sans}{U}{ntxsfmia}{m}{it}
\SetSymbolFont{lettersAB}{sans}{U}{ntxsfmia}{m}{it}
\SetSymbolFont{symbols}{sans}{LMS}{ntxsy}{m}{n}
\SetSymbolFont{largesymbols}{sans}{LMX}{ntxexx}{m}{n}
\SetSymbolFont{largesymbolsTXA}{sans}{U}{ntxexa}{m}{n}
\SetSymbolFont{operators}{sans}{\encodingdefault}{\sfdefault}{m}{n}
\SetMathAlphabet{\mathsf}{sans}{\encodingdefault}{\sfdefault}{m}{n}% make upright 31 Jan 2021.

%%%%%%%%%%%%%%%%%%  Times-like fonts for specific languages  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifpdftex % Under lualatex, babel has problems with the following approach. Use [fontspec] option instead.
    \ifac@vietnamese
    	\RequirePackage{substitutefont}%
    	\substitutefont{T5}{\rmdefault}{qtm}% Vietnamese is in T5 encoding, can use Tex Gyre Termes font (qtm); 
    	%\substitutefont{T5}{\sfdefault}{qhv}% qhv = Heros (helvetica). We get the right font w/o loading this.
    	
    	% qcr = Cursor (monospaced) is poor match to inconsolata; qhv (the sf font) matches better, but isn't monospaced.
    	% From TeX Gyre Cursor .fd file by B. Jackowski and J. M. Nowacki, released under the GUST license
        \begingroup
        \nfss@catcodes
        
        \def\qcr@scale{s*[0.95]}
        \DeclareFontFamily{T5}{\ttdefault}{}% not adjusting wordspacing
        \DeclareFontShape{T5}{\ttdefault}{b}{sc}{<-> \qcr@scale t5-qcrb-sc}{}
        \DeclareFontShape{T5}{\ttdefault}{b}{n}{<-> \qcr@scale t5-qcrb}{}
        \DeclareFontShape{T5}{\ttdefault}{b}{scit}{<-> \qcr@scale t5-qcrbi-sc}{}
        \DeclareFontShape{T5}{\ttdefault}{b}{it}{<-> \qcr@scale t5-qcrbi}{}
        \DeclareFontShape{T5}{\ttdefault}{m}{sc}{<-> \qcr@scale t5-qcrr-sc}{}
        \DeclareFontShape{T5}{\ttdefault}{m}{n}{<-> \qcr@scale t5-qcrr}{}
        \DeclareFontShape{T5}{\ttdefault}{m}{scit}{<-> \qcr@scale t5-qcrri-sc}{}
        \DeclareFontShape{T5}{\ttdefault}{m}{it}{<-> \qcr@scale t5-qcrri}{}
        \DeclareFontShape{T5}{\ttdefault}{bx}{sc}{<->ssub * qcr/b/sc}{}
        \DeclareFontShape{T5}{\ttdefault}{bx}{n}{<->ssub * qcr/b/n}{}
        \DeclareFontShape{T5}{\ttdefault}{bx}{scit}{<->ssub * qcr/b/scit}{}
        \DeclareFontShape{T5}{\ttdefault}{bx}{it}{<->ssub * qcr/b/it}{}
        \DeclareFontShape{T5}{\ttdefault}{b}{sl}{<->sub * qcr/b/it}{}
        \DeclareFontShape{T5}{\ttdefault}{m}{sl}{<->sub * qcr/m/it}{}
        \DeclareFontShape{T5}{\ttdefault}{b}{scsl}{<->sub * qcr/b/scit}{}
        \DeclareFontShape{T5}{\ttdefault}{m}{scsl}{<->sub * qcr/m/scit}{}
    	\endgroup
    \fi
    
    \ifac@greek
        %% Based on Artemisia fd files by A. Tsolomitis and ideas from substitutefont package by G. Milde, both LaTeX Public License.
        \begingroup
        \nfss@catcodes
        
        \def\artemisiasc@scaled{s*[0.95]}
        \def\artemisia@scaled{s*[0.93]}
        \DeclareFontFamily{LGR}{\rmdefault}{%
        	\fontdimen2\font=.25em
    		\fontdimen3\font=.2em
    		\fontdimen4\font=.1em
    		}% adjusted word spacing to match newtxtext... this is tighter.
        \DeclareFontShape{LGR}{\rmdefault}{m}{n}{<->  \artemisia@scaled gartemisiarg6a}{}
        \DeclareFontShape{LGR}{\rmdefault}{m}{it}{<-> \artemisia@scaled gartemisiai6a}{}
        \DeclareFontShape{LGR}{\rmdefault}{b}{n}{<->  \artemisia@scaled gartemisiab6a}{}
        \DeclareFontShape{LGR}{\rmdefault}{b}{it}{<-> \artemisia@scaled gartemisiabi6a}{}
        \DeclareFontShape{LGR}{\rmdefault}{m}{sl}{<-> \artemisia@scaled gartemisiao6a}{}
        \DeclareFontShape{LGR}{\rmdefault}{b}{sl}{<-> \artemisia@scaled gartemisiabo6a}{}
        \DeclareFontShape{LGR}{\rmdefault}{m}{sc}{<-> \artemisiasc@scaled gartemisiasc6a}{}
        \DeclareFontShape{LGR}{\rmdefault}{m}{sco}{<->\artemisiasc@scaled gartemisiasco6a}{}
        
        %% nextx names oblique sc as both scit and scsl. ("largesc" option of newtx is different font, not a scaling.) 
        \DeclareFontShape{LGR}{\rmdefault}{m}{scsl}{<->\artemisiasc@scaled gartemisiasco6a}{}% sco
        \DeclareFontShape{LGR}{\rmdefault}{m}{scit}{<->\artemisiasc@scaled gartemisiasco6a}{}% sco
        
        \DeclareFontShape{LGR}{\rmdefault}{bx}{n}{<-> \artemisia@scaled gartemisiab6a}{}
        \DeclareFontShape{LGR}{\rmdefault}{bx}{it}{<->\artemisia@scaled gartemisiabi6a}{}
        \DeclareFontShape{LGR}{\rmdefault}{bx}{sl}{<->\artemisia@scaled gartemisiabo6a}{}
        
        % Sans Serif Greek font Kerkis
        % Based on Kerkis fd file, by Antonis Tsolomitis, under the LaTeX Project Public License
        \def\kerkissf@scaled{s*[0.95]}
        \DeclareFontFamily{LGR}{\sfdefault}{}% not adjusting wordspacing
        \DeclareFontShape{LGR}{\sfdefault}{m}{n}{<-> \kerkissf@scaled gksf7t}{}
        \DeclareFontShape{LGR}{\sfdefault}{m}{it}{<->\kerkissf@scaled gksfi7t}{}  
        \DeclareFontShape{LGR}{\sfdefault}{m}{sl}{<->\kerkissf@scaled gksfi7t}{}
        \DeclareFontShape{LGR}{\sfdefault}{m}{sc}{<->\kerkissf@scaled gksfsc7t}{}
        \DeclareFontShape{LGR}{\sfdefault}{b}{n}{ <->\kerkissf@scaled gksfb7t}{}  
        \DeclareFontShape{LGR}{\sfdefault}{b}{it}{<->\kerkissf@scaled gksfbi7t}{}
        \DeclareFontShape{LGR}{\sfdefault}{b}{sl}{<->\kerkissf@scaled gksfbi7t}{}  
        
        \DeclareFontShape{LGR}{\sfdefault}{bx}{n}{  <-> \kerkissf@scaled gksfb7t}{}
        \DeclareFontShape{LGR}{\sfdefault}{bx}{it}{ <-> \kerkissf@scaled gksfbi7t}{}
        \DeclareFontShape{LGR}{\sfdefault}{bx}{sl}{ <-> \kerkissf@scaled gksfbi7t}{}
    
        %% Greek monospaced font, DejaVuSansMono
        %% Based on DejaVu fd files by Pavel Farar, under the LaTeX Project Public License
        \def\DejaVuSansMono@@scale{s*[0.85]}%
        \DeclareFontFamily{LGR}{\ttdefault}{}% not adjusting wordspacing
        \DeclareFontShape{LGR}{\ttdefault}{b}{it}{<-> \DejaVuSansMono@@scale DejaVuSansMono-BoldOblique-tlf-lgr}{}
        \DeclareFontShape{LGR}{\ttdefault}{b}{n}{ <-> \DejaVuSansMono@@scale DejaVuSansMono-Bold-tlf-lgr}{}
        \DeclareFontShape{LGR}{\ttdefault}{m}{it}{<-> \DejaVuSansMono@@scale DejaVuSansMono-Oblique-tlf-lgr}{}
        \DeclareFontShape{LGR}{\ttdefault}{m}{n}{ <-> \DejaVuSansMono@@scale DejaVuSansMono-tlf-lgr}{}
        
        \DeclareFontShape{LGR}{\ttdefault}{m}{sl}{<-> \DejaVuSansMono@@scale DejaVuSansMono-TLF/m/it}{}
        \DeclareFontShape{LGR}{\ttdefault}{b}{sl}{<-> \DejaVuSansMono@@scale DejaVuSansMono-TLF/b/it}{}
        
        \DeclareFontShape{LGR}{\ttdefault}{bx}{sl}{<->\DejaVuSansMono@@scale DejaVuSansMono-TLF/b/it}{}
        \DeclareFontShape{LGR}{\ttdefault}{bx}{it}{<->\DejaVuSansMono@@scale DejaVuSansMono-TLF/b/it}{}
        \DeclareFontShape{LGR}{\ttdefault}{bx}{n}{ <->\DejaVuSansMono@@scale DejaVuSansMono-TLF/b/n}{}
    
    	\endgroup
    \fi
    
    \ifac@cyrillic
        %% Paratype fonts for cyrillic, maintained by Pavel Farar, under Latex Project Public License
    	\begingroup
        \nfss@catcodes
        
        \def\PTSerif@@scale{s*[0.95]}% had had 0.94...
        \DeclareFontFamily{T2A}{\rmdefault}{}% not adjusting wordspacing, since it matches newtxtext as is
        \DeclareFontShape{T2A}{\rmdefault}{m}{n}{ <->\PTSerif@@scale PTSerif-Regular-tlf-t2a}{}
        \DeclareFontShape{T2A}{\rmdefault}{m}{it}{<->\PTSerif@@scale PTSerif-Italic-tlf-t2a}{}
        \DeclareFontShape{T2A}{\rmdefault}{b}{n}{ <->\PTSerif@@scale PTSerif-Bold-tlf-t2a}{}
        \DeclareFontShape{T2A}{\rmdefault}{b}{it}{<->\PTSerif@@scale PTSerif-BoldItalic-tlf-t2a}{}
        \DeclareFontShape{T2A}{\rmdefault}{m}{ui}{<->\PTSerif@@scale PTSerif-UprightItalic-tlf-t2a}{}
        \DeclareFontShape{T2A}{\rmdefault}{m}{sl}{<->\PTSerif@@scale PTSerif-Slanted-tlf-t2a}{}
        \DeclareFontShape{T2A}{\rmdefault}{b}{ui}{<->\PTSerif@@scale PTSerif-BoldUprightItalic-tlf-t2a}{}
        \DeclareFontShape{T2A}{\rmdefault}{b}{sl}{<->\PTSerif@@scale PTSerif-BoldSlanted-tlf-t2a}{}
        
        \DeclareFontShape{T2A}{\rmdefault}{bx}{n}{<->ssub * PTSerif-TLF/b/n}{}
        \DeclareFontShape{T2A}{\rmdefault}{bx}{it}{<->ssub * PTSerif-TLF/b/it}{}
        \DeclareFontShape{T2A}{\rmdefault}{bx}{ui}{<->ssub * PTSerif-TLF/b/ui}{}
        \DeclareFontShape{T2A}{\rmdefault}{bx}{sl}{<->ssub * PTSerif-TLF/b/sl}{}
        
        \def\PTSans@@scale{s*[0.94]}%
        \DeclareFontFamily{T2A}{\sfdefault}{}% not adjusting wordspacing
        \DeclareFontShape{T2A}{\sfdefault}{b}{it}{<->\PTSans@@scale PTSans-BoldItalic-tlf-t2a}{}
        \DeclareFontShape{T2A}{\sfdefault}{b}{n}{<-> \PTSans@@scale PTSans-Bold-tlf-t2a}{}
        \DeclareFontShape{T2A}{\sfdefault}{m}{it}{<->\PTSans@@scale PTSans-Italic-tlf-t2a}{}
        \DeclareFontShape{T2A}{\sfdefault}{m}{n}{<-> \PTSans@@scale PTSans-Regular-tlf-t2a}{}
        \DeclareFontShape{T2A}{\sfdefault}{c}{n}{<-> \PTSans@@scale PTSans-Narrow-tlf-t2a}{}
        \DeclareFontShape{T2A}{\sfdefault}{bc}{n}{<->\PTSans@@scale PTSans-NarrowBold-tlf-t2a}{}
        
        \DeclareFontShape{T2A}{\sfdefault}{m}{sl}{<->ssub * PTSans-TLF/m/it}{}
        \DeclareFontShape{T2A}{\sfdefault}{b}{sl}{<->ssub * PTSans-TLF/b/it}{}
        \DeclareFontShape{T2A}{\sfdefault}{bx}{sl}{<->ssub * PTSans-TLF/b/it}{}
        \DeclareFontShape{T2A}{\sfdefault}{bx}{it}{<->ssub * PTSans-TLF/b/it}{}
        \DeclareFontShape{T2A}{\sfdefault}{bx}{n}{<->ssub * PTSans-TLF/b/n}{}
    
        %% the tt cyrillic is slightly larger than the latin characters.    
        \def\PTMono@@scale{s*[0.92]}%
        \DeclareFontFamily{T2A}{\ttdefault}{}% not adjusting wordspacing
        \DeclareFontShape{T2A}{\ttdefault}{m}{n}{<-> \PTMono@@scale PTMono-Regular-tlf-t2a}{}
        \DeclareFontShape{T2A}{\ttdefault}{b}{n}{<-> \PTMono@@scale PTMono-Bold-tlf-t2a}{}
        \DeclareFontShape{T2A}{\ttdefault}{m}{sl}{<->\PTMono@@scale PTMono-Slanted-tlf-t2a}{}
        \DeclareFontShape{T2A}{\ttdefault}{b}{sl}{<->\PTMono@@scale PTMono-BoldSlanted-tlf-t2a}{}
        
        \DeclareFontShape{T2A}{\ttdefault}{bx}{n}{<->ssub * PTMono-TLF/b/n}{}
        \DeclareFontShape{T2A}{\ttdefault}{bx}{sl}{<->ssub * PTMono-TLF/b/sl}{}
    
        \endgroup    
    \fi
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput
%%
%% End of file `asmeconf.cls'.

