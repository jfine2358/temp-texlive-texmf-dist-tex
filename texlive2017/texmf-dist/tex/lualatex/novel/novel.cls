%%
%% This is file `novel.cls', part of class `novel'.
%% Copyright 2017 Robert Allgeyer.
%% anytthree [at] gmail.com
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% 
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
% Actually needs LuaLaTeX, at least version 0.95 from TeXLive 2016.
\ProvidesClass{novel}[2017/05/04 v1.2 LaTeX document class]
%%


%% DESCRIPTION:
%% Class `novel' is designed for print fiction: novels or short stories.
%% It cannot be used for e-books or for journal publication.
%% It is not suitable for most non-fiction, because routine academic features
%% such as bibiography and automatic sectioning are defeated.
%%
%% There are pre-configured layouts for the most commonly used choices of
%% trim size (finished book width and height), and internal layout consistent
%% with fiction. The user can over-ride the pre-configured settings.
%%
%% The class will automatically create PDF/X compliant files upon request,
%% using a self-contained command structure.
%%
%% LuaLaTeX is required, and input files must be encoded utf-8.
%%
%% Fonts are loaded by luaotfload and fontspec, and massaged by microtype.
%% For best results, use modern Open Type fonts, or TrueType fonts.
%%
%% The Libertinus font family, a fork of [Linux] Libertine/Biolinum,
%% is the default. Actually, I recommend it! In addition, an included
%% custom font, NovelDeco.otf, is used for special purposes.
%%


%% REQUIRE LUATEX and do some preliminary setup.
%% -----------------------------------------------------------------------------
%% These are not user settings.
%
\RequirePackage{ifluatex} % LuaTeX is required. Not XeTeX, dvips, or pdfTeX.
\RequirePackage{luatex85} % Needed for compatibility when using LuaTeX 0.95 etc.
\RequirePackage{pdftexcmds} % compatibility
\ifluatex
  % New with TeXlive 2016. Removes unnecessary File Data:
  \pdfvariable suppressoptionalinfo 511 % writes only ID to PDF Catalog
\else
  \ClassError{novel}{Must compile with LuaLaTeX 0.95+}{Sorry, LuaLaTeX only.%
    No pdfTeX, dvips, or XeTeX.}
\fi
%
\RequirePackage{etoolbox} % general good stuff
\RequirePackage{xifthen} % improved ifthenelse handling
\RequirePackage{xstring} % parses strings
\RequirePackage{fp} % used everywhere for math calculations
\FPmessagesfalse % eliminates numerous friendly messages from the log
%
\pdfminorversion=3 % might be reset later, depending on settings
\gdef\thepdfminorversion{\pdfminorversion}
%
\RequirePackage{silence} % Used here:
% hyperref draft mode is always on, even when novel is not in draft mode:
\WarningFilter{hyperref}{Draft mode on} % So, get rid of the hyperref warning.
% Prevent complaints about no protrusion list for cmr, cmm, etc. in decimal pts:
\WarningFilter{microtype}{I cannot find a protrusion list} % It's not there!
%
\WarningsOff[Fancyhdr,fancyhdr] % complains about headheight when no header
\RequirePackage[relative]{textpos} % for inserting images
\RequirePackage{noindentafter} % for unindented chapter and scene starts
\RequirePackage{calc} % allows length expression calculations
\RequirePackage{changepage} % block indents, etc.
\RequirePackage{atbegshi} % for one-page header changes. Also used by hyperref.
\RequirePackage{letltxmacro} % for re-defining some macros
\RequirePackage{magaz} % special treatment of first lines
\RequirePackage{changepage} % for adjusted text widths. Do not use strict!
\RequirePackage{xparse} % for writing cool-looking commands
%
% In addition, the following packages are required, but they are not loaded now.
% They must wait for something else to happen first. They will be loaded
% with suitable arguments, when the time comes:
% fontspec -- in novel-LayoutSettings.sty
% unicode-math -- in novel-LayoutSettings.sty
% eso-pic -- in novel-CalculateLayout.sty
% polyglossia -- in novel-FontDefaults.sty
% microtype -- in novel-FontDefaults.sty
% hyperref -- in novel-pdfx.sty
% fancyhdr -- in novel.HeadFootStyles.sty
% xcolor -- lower in this page
% adjustbox -- lower on this page
% eso-pic -- lower on this page
% lipsum -- later on this page
%%


%% Process document class options.
%% -----------------------------------------------------------------------------
% Allowed option list:
%   draft xml shademargins graytext greytext cropmarks cropview closecrop
%   New in version 1.2: coverart
% Yes, I realize that this could have been done another way:
\gdef\@mycol{\@classoptionslist}
\StrDel{\@mycol}{ }[\@mycola]
\StrDel{\@mycola}{,}[\@mycolb]
\StrDel{\@mycolb}{draft}[\@mycolc]
\StrDel{\@mycolc}{xml}[\@mycold]
\StrDel{\@mycold}{shademargins}[\@mycole]
\StrDel{\@mycole}{graytext}[\@mycolf]
\StrDel{\@mycolf}{greytext}[\@mycolg]
\StrDel{\@mycolg}{cropmarks}[\@mycolh]
\StrDel{\@mycolh}{cropview}[\@mycoli]
\StrDel{\@mycoli}{closecrop}[\@mycolj]
\StrDel{\@mycolj}{coverart}[\@mycolk]
%
\gdef\@mycolzzz{\@mycolk} % modify if others added
\ifthenelse{\equal{\@mycolzzz}{}}{}{
  \ClassWarning{novel}{Unrecognized class option: \@mycolzzz\space^^J%
   The unrecognized option was ignored!^^J}%
}
%
% If used, option `draft' shows overflow rule.
\newif \if@useDraftMode
\setlength\overfullrule{0pt}
\DeclareOption{draft}{
  \setlength\overfullrule{6pt}
  \@useDraftModetrue
  \ClassWarning{novel}{Compiled using draft mode. Not for final release!^^J}
}
% If used, option `xml' creates a file `\jobname-XMPasXML.xml` that contains
% the XMP metadata with an xml declaration and comments at top.
% Only works when \SetPDFX is not `off'.
\newif \if@wantXMPasXML
\DeclareOption{xml}{
  \@wantXMPasXMLtrue
}
\DeclareOption{xmp}{ % in case you mis-type.
  \ClassError{novel}{No class option `xmp'. Want `xml' ?^^J}%
   {There is no class option named `xmp'. It is `xml'.^^J}
}
% Option `shademargins' does just that. Ignored unless in draft mode.
% Does not matter if `graytext' option in use.
\newif \if@shademargins
\DeclareOption{shademargins}{
  \@shademarginstrue
}
% Option `graytext' allows text in grayscale. Images unaffected.
% If this option is not used, all text will be K black.
\newif \if@graytext
\DeclareOption{graytext}{
  \@graytexttrue
}
% For the Brits:
\DeclareOption{greytext}{
  \@graytexttrue
}
% Usually you do NOT want crop (trim) marks. Configurable by \SetCropMarks[]{}.
\newif \if@cropmarks
\DeclareOption{cropmarks}{
  \@cropmarkstrue
}
% The cropview sets PDF CropBox equal to TrimBox instead of MediaBox.
% Only makes a difference when MediaBox is larger than TrimBox.
% Ignored unless in draft mode.
\newif \if@cropview
\DeclareOption{cropview}{
  \@cropviewtrue
}
% With closecrop, the TrimSize and margins are re-sized, to preserve the
% live area, but with reduced margins on all sides (same for verso/recto).
% This option is available only in draft mode, and disables shademargins.
% The purpose is to create a PDF that is more easily read on a handheld device,
% so you can think about edits while traveling. It is NOT an e-book, since
% it has no hyperlinks and is missing some features that an e-book should have.
\newif \if@closecrop
\DeclareOption{closecrop}{
  \@cropviewtrue\@closecroptrue
}
% New in version 1.2: coverart option.
% This is used to create a 1-page file with no text, just an image.
% Intended purpose is PDF/X for novel cover. See docs page 10.
\newif \if@coverart
\DeclareOption{coverart}{
  \@coverarttrue
}
%% Note that document size and normal font size are not class options.
%% They are set by commands in the Preamble, and have default values.
%
\ProcessOptions\relax
% Disable some options, depending on compatibilities:
\if@useDraftMode\else
  \global\@shademarginsfalse
  \global\@cropviewfalse
  \global\@closecropfalse
\fi
%
\if@cropview
  \global\@cropmarksfalse
\fi
%
\if@closecrop
  \global\@cropviewtrue
  \global\@shademarginsfalse
  \global\@cropmarksfalse
\fi
%
\if@coverart
  \global\@useDraftModefalse
  \global\@shademarginsfalse
  \global\@cropviewfalse
  \global\@closecropfalse
  \global\@graytextfalse
\fi
%% end class options



%% Activate xcolor, adjustbox, and eso-pic:
%% -----------------------------------------------------------------------------
% The final book must be monochrome (black and white only) for all text
%   and vector graphics, unless option `graytext' is used.
% Vector graphics are discouraged, in any case. See Page 9.
% You can use grayscale (single channel, not RGB gray) raster images.
% In draft mode only, the `shademargins' option
%   requires grayscale, so it is temporarily enabled.
\newif \if@grayenabled
%
\if@useDraftMode
  \RequirePackage[gray,hyperref]{xcolor} % allows some layout checks
  \global\@grayenabledtrue
\else
  \if@graytext
    \RequirePackage[gray,hyperref]{xcolor} % black/white book block
    \global\@grayenabledtrue
  \else
    \RequirePackage[monochrome,hyperref]{xcolor} % black/white book block
  \fi
\fi
% adjustbox and eso-pic cannot precede xcolor.
\RequirePackage{adjustbox} % for scaling and moving
\RequirePackage{eso-pic} % background effects in draft mode
%
%% end activate xcolor and adjustbox



%% Temporary normal font size
%% -----------------------------------------------------------------------------
%% This normalsize is temporary, so that packages can load without complaint.
%% It will be modified later, during layout calculations.
\def\Current@FontSizeNum{10}
\def\Current@BaselineSkipNum{13}
\def\normalsize{%
  \@setfontsize\normalsize{\Current@FontSizeNum}{\Current@BaselineSkipNum}%
}
\normalsize
%
\RequirePackage{lipsum} % for examples
%
%% end temporary normal point size and baselineskip



%% Define commands used for File Data, including PDF/X Settings.
%% -----------------------------------------------------------------------------
%% As used here, `File Data' refers to PDF metadata as found in PDF/Info
%% and in XMP. This class does not write it to the Catalog.
%% Defines commands such as \title{}, not necessarily the same as other TeX.
\RequirePackage{novel-FileData}
%
%%


%% Physical Layout Commands and Settings.
%% -----------------------------------------------------------------------------
%% Define commands that over-ride the class option pre-configured settings.
%% Variety of miscellaneous layout settings such as \parsep, \parindent, etc.
\RequirePackage{novel-LayoutSettings}
%
%%


%% Additional Preamble Settings and Commands.
%% -----------------------------------------------------------------------------
%%
% Macros for use in document body:
\input{novel-TextMacros.sty}
% Standard `fancyhdr' header footer styles:
\input{novel-HeadFootStyles.sty}
% Chapter and Scene styles:
\input{novel-ChapterScene.sty}
% Image placement:
\input{novel-Images.sty}
% Footnotes and endnotes:
\input{novel-Footnotes.sty}
%%


%% \AtEndPreamble sets defaults and calculates layout
%% -----------------------------------------------------------------------------
%
\AtEndPreamble{
  \makeatletter % Necessary. Why? Who knows.
  \input{novel-CalculateLayout.sty}
  \input{novel-FontDefaults.sty}
  \input{novel-pdfx.sty}
  \AtBeginShipout{\gdef\@fnafter{}}
  \makeatother
}
%%


%% \AtBeginDocument finishes the setup
%% -----------------------------------------------------------------------------
%
% Error if certain packages were requested in the Preamble.
% This macro is invoked \AtBeginDocument.
\newif \ifshutoffblock % part of incompatible package blocking
%
\AtBeginDocument{ %
  \defaultfontfeatures{} % reset
  % Any other fonts will use these defaults:
  \defaultfontfeatures{%
    SmallCapsFeatures={Renderer=Basic},Kerning=On,%
    Ligatures=TeX,%
  }%
  %
  % Find some useful measurements:
  \gdef\@normalxheight{\heightof{x}}
  \setlength\normalxheight{\@normalxheight}
  \global\normalxheight=\normalxheight
  \gdef\@normalXheight{\heightof{X}}
  \setlength\normalXheight{\@normalXheight}
  \global\normalXheight=\normalXheight
  % Activate user choice of whether or not to indent after scenebreak commands:
  \if@indentAfterScenebreak\else
    \NoIndentAfterCmd{\scenebreak}
    \NoIndentAfterCmd{\sceneline}
    \NoIndentAfterCmd{\scenestars}
  \fi
  %
  \@activateHeadFootStyles % in file `novel-HeadFootStyles.sty'
  \@novelPDFinfo % in file `novel-pdfx.sty'.
  % Commands that cannot be used after Preamble:
  \let\indentAfterScenebreak\relax
  \let\title\relax
  \let\author\relax
  \let\subtitle\relax
  % Disallow incompatible packages:
  \ifshutoffblock
    \gdef\sorry@no#1{}
  \else
    \gdef\sorry@no#1{\@ifpackageloaded{#1}{%
      \ClassError{novel}{Sorry, package `#1' cannot be used}%
      {The `novel' class does not allow use of package `#1'.^^J%
      You must remove it from the Preamble, and also remove its commands^^J%
        from the body of your document. In rare cases, the offending package^^J%
        was loaded by some other package.^^J}%
      }{}%
    }
  \fi
  %
  \sorry@no{pdfx}
  \sorry@no{xmpincl}
  \sorry@no{hyperxmp}
  \sorry@no{pdfxmult}
  \sorry@no{inputenc}
  \sorry@no{fontenc}
  \sorry@no{showkeys}
  \sorry@no{wrapfigure}
  \sorry@no{wrapfig}
  \sorry@no{float}
  \sorry@no{morefloats}
  \sorry@no{footmisc}
  \sorry@no{footnote}
  \sorry@no{manyfoot}
  \sorry@no{caption}
  \sorry@no{subcaption}
  \sorry@no{multirow}
  \sorry@no{tabu}
  \sorry@no{tabularx}
  \sorry@no{tabulary}
  \sorry@no{array}
  \sorry@no{booktabs}
  \sorry@no{eqparbox}
  \sorry@no{pdfpages}
  \sorry@no{nth}
  \sorry@no{engord}
  \sorry@no{endnotes}
}
%%

%% New in version 1.2, coverart option. See docs page 10.
\if@coverart
  \AfterEndPreamble{
    \AddToShipoutPictureBG{%
      \AtPageUpperLeft{%
        \InlineImage*{\novelcoverimage}%
      }%
    }
    \null% without this, page has no "content"
  }
\else\fi
%%


%%
%% End of file `novel.cls'

