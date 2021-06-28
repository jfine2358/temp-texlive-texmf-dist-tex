% US Commercial Invoice Class
% Copyright 2008-2019 by Alan Munn amunn@msu.edu
%
% This class may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This package has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this package is Alan Munn amunn@msu.edu
%
\def\invc@date{2019/01/17}
\def\invc@version{1.0}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{invoice-class}[\invc@date\space  Commercial Invoice \invc@version]
\LoadClass[11pt]{article}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{datatool}
\RequirePackage{multicol}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{dcolumn}
\RequirePackage{fancyhdr}
% internal commands
\renewcommand{\rmdefault}{\sfdefault} 
\newcommand*{\invc@BL}[1]{\rule{#1}{.5pt}} % signature rule
\newcommand*\invc@NL{\tabularnewline} 
\newcolumntype{d}{D{.}{.}{6.2}} % decimal columns for amounts
\newcommand*{\invc@mc}{\multicolumn{1}{c|}} % column header 
\newcommand*{\invc@waybill}{% format waybill in a box
\fbox{\textbf{Waybill Number:} \invc@waybillnum}}
%
% user commands
%
\newcommand*{\ConfigPrefix}[1]{\gdef\invc@configprefix{#1}}
\newcommand*{\InputFile}[1]{\gdef\invc@inputfile{#1}}
\newcommand*{\waybill}[1]{\gdef\invc@waybillnum{#1}}
\newcommand*{\shippingdate}[1]{\gdef\invc@shippingdate{#1}}
\newcommand{\toaddress}[1]{\gdef\invc@toaddress{#1}}
\newcommand*{\destination}[1]{\gdef\invc@destination{#1}}
\newcommand*{\carrier}[1]{\gdef\invc@carrier{#1}}
\newcommand*{\weight}[2]{\gdef\invc@pounds{#1}\gdef\invc@oz{#2}}
\newcommand*{\packages}[1]{\gdef\invc@packages{#1}}
\newcommand*{\packingcost}[1]{\gdef\invc@packingcost{#1}}
\newcommand*{\shippingcost}[1]{\gdef\invc@shippingcost{#1}}
\newcommand*{\insurancecost}[1]{\gdef\invc@insurancecost{#1}}
\newcommand{\fromaddress}[1]{\long\gdef\invc@fromaddress{#1}}
\newcommand*{\shipper}[1]{\gdef\invc@shipper{#1}}
\newcommand*{\location}[1]{\gdef\invc@location{#1}}
%
% defaults
%
\packingcost{0}
\shippingcost{0}
\insurancecost{0}
\shippingdate{\today}
\ConfigPrefix{}
%
% Configuration file scheme:
% \ConfigPrefix{} sets a prefix for config files and allows multiple configuration files
% invoice.cfg should contain the commands \fromaddress, \shipper and \location
% these will generally be fixed values, but can be set on a per document basis too.
%
\AtBeginDocument{
\InputIfFileExists{\invc@configprefix invoice.cfg}{\ClassInfo{invoice-class}{Loading configuration file \invc@configprefix invoice.cfg }\typeout{Loading configuration file \invc@configprefix invoice.cfg}}
{\ClassInfo{invoice-class}{Config file not loaded. Using class default}\typeout{Config file not loaded. Using class default}
\fromaddress{%
The Duck Company\\
Some Avenue\\
Somewhere MI 48823\\
USA\\
Tel. 555-555-5555\\
}
\shipper{Prof. van Duck}
\location{Somewhere, MI}
}}
%
\pagestyle{fancy}
\parindent=0pt
\lhead{}
\chead{\Large \sffamily \bfseries Commercial Invoice }
\rhead{}
\lfoot{}
\cfoot{\sffamily\thepage}
\rfoot{}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}
\setlength{\headheight}{18pt}
\thispagestyle{fancy}
\sffamily
\newcommand{\printinvoice}{%
\invc@waybill
\begin{multicols}{2}

{\Large\bfseries From:}

\invc@fromaddress

\columnbreak

{\Large\bfseries To:}

\invc@toaddress
\end{multicols}

\setlength{\extrarowheight}{9pt}
\begin{tabularx}{\linewidth}{|*{4}{>{\centering}X|}}
\hline
\textbf{\scriptsize Country of ultimate destination:} & \textbf{\scriptsize Exporting Carrier} & \textbf{\scriptsize Total number of packages} & \textbf{\scriptsize Gross Weight} \invc@NL
\invc@destination & \invc@carrier &
\invc@packages & \invc@pounds~lb \invc@oz~oz \invc@NL
\hline
\end{tabularx}
%
\DTLloaddb{invoice}{\invc@inputfile}
\DTLsumcolumn{invoice}{Amount}{\invc@total}
\setlength{\extrarowheight}{3pt}
\begin{longtable}{|p{2.1381in}|>{\centering}p{1in}|r|d|d|}
\hline
\centering\bfseries Description & \centering\bfseries Country of Origin & \centering \bfseries Quantity &\invc@mc{\bfseries Unit Value\$} & \invc@mc{\bfseries Amount (USD)}\invc@NL
\hline
\endhead
\hline
\endfoot
\DTLforeach{invoice}{%
\description=Description,\country=Country,\quantity=Quantity,\unitvalue=UnitValue,\amount=Amount}{%
\description & \country & \quantity & \unitvalue & \amount \invc@NL} & & & & \invc@NL
\hline
\multicolumn{4}{|r|}{\bfseries Currency type and amount}& \DTLdecimaltocurrency{\invc@total}{\invc@subtotal}\invc@subtotal   \invc@NL
\multicolumn{4}{|r|}{\bfseries Packing cost} & \DTLdecimaltocurrency{\invc@packingcost}{\invc@pcost}\invc@pcost\invc@NL
\multicolumn{4}{|r|}{\bfseries Shipping cost} & \DTLdecimaltocurrency{\invc@shippingcost}{\invc@scost}\invc@scost\invc@NL
\multicolumn{4}{|r|}{\bfseries Insurance cost} & \DTLdecimaltocurrency{\invc@insurancecost}{\invc@icost}\invc@icost\invc@NL
\hline\hline
\multicolumn{4}{|r|}{\bfseries Total Invoice Value} &\DTLaddall{\invc@grandtotal}{\invc@total,\invc@packingcost,\invc@shippingcost,\invc@insurancecost}
\DTLconverttodecimal{\invc@grandtotal}{\invc@gtotal}
\DTLdecimaltocurrency{\invc@gtotal}{\invc@ctotal}\invc@ctotal \invc@NL
\hline
\end{longtable}
\vskip 5ex
{\Large\bfseries Notes:}

{\footnotesize These commodities, technologies, or software were exported from the United States of
America in accordance with the Export Administration regulations. Diversion contrary to
U.S. law is prohibited.

It is hereby certified that this invoice shows: (1) the actual price of the goods described,
(2) that no other invoice has been or will be issued, and (3) that all particulars are true
and correct.}

\bigskip
\setlength{\extrarowheight}{18pt}
\begin{tabular}{|p{3in}|p{1.75in}|}
\hline
\textbf{\scriptsize Name:} \hskip 2em \invc@shipper & \textbf{\scriptsize Date:} \invc@shippingdate \invc@NL

\hline
\multicolumn{2}{|l|}{\textbf{\scriptsize Location:} \hskip 1em \invc@location}\invc@NL
\hline
\multicolumn{2}{|l|}{ \textbf{\scriptsize Signature:}}\invc@NL
\hline
\end{tabular}
}
\endinput