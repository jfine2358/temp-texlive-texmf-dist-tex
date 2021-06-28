%%
%% This is file `factura.cls',
%% *NOT* generated with the docstrip utility.
%%
%% Copyright 2013 Emilio Lazo Zaia
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status "maintained".
%%
%% This Current Maintainer of this work is Emilio Lazo Zaia.
%%
%% This work consists of the files factura.cls, factura.def,
%% and factura-modelo.tex, factura-modelo-ya.tex and README.
%%
%% Emilio Lazo Zaia <emiliolazozaia@gmail.com>
%%
%% This file is in UTF-8 format with Unix-like line breaks (LF only).
%% Commands and commentaries are in spanish.
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{factura}[2013/04/29 v1.0
^^J^^J
Clase para elaborar facturas legales en la
República Bolivariana de Venezuela.]

\newif\if@prefactura \@prefacturafalse
\newif\if@presupuesto \@presupuestofalse
\newif\if@spanish \@spanishtrue
\newif\if@marco \@marcofalse
\newif\if@ivaexplicito \@ivaexplicitotrue
\newif\if@todosiva \@todosivafalse
\newif\if@confirmas \@confirmastrue
\newif\if@concondiciones \@concondicionestrue
\newif\if@filas \@filasfalse
\newif\if@centrado \@centradofalse
\newif\if@denom \@denomfalse
\newif\if@lineaitem \@lineaitemfalse
\newif\if@linea \@lineafalse
\newif\if@G \@Gfalse
\newif\if@BIA \@BIAfalse
\newif\if@BIR \@BIRfalse
\newif\if@Exento \@Exentofalse
\newif\if@csv \@csvfalse

\LoadClass[12pt]{article}

\RequirePackage[absolute]{textpos}%  Es necesario 'textpos' para colocar texto en ubicaciones arbitrarias.
\RequirePackage{geometry}%  'geometry' para ajustar el tamaño de la página.
\RequirePackage{calc}%  'calc' para hacer aritmética con las dimensiones.
\RequirePackage{fp-upn}%  Fundamental el paquete 'fp-upn' para todos los cálculos.
\RequirePackage{numprint}%  Con 'numprint' expresamos los totales en el formato requerido.
\RequirePackage{fancybox}%  El cuadro de la descripción lo hacemos con 'fancybox'.
\RequirePackage[dvipsnames]{xcolor}%  Para el color en la numeración.
\RequirePackage{xifthen}%  'xifthen' para algunos de los condicionales.
\RequirePackage{etoolbox}%  'etoolbox' para los condicionales binarios.
\RequirePackage{expl3}%  Para poder hacer el loop que uso en las líneas en blanco.
\RequirePackage{tabularx}%  Con 'tabularx' hacemos la tabla.
\RequirePackage{environ}%  Con 'environ' podemos usar tabularx dentro del ambiente de la factura y colocar texto en el enddef.

% Gracias a Joseph Wright (Thanks to Joseph Wright):
% http://tex.stackexchange.com/questions/16189/repeat-command-n-times
\ExplSyntaxOn
\cs_new_eq:NN \Repeat \prg_replicate:nn
\ExplSyntaxOff

\newboolean{Separado} \boolfalse{Separado}
\newboolean{SinCantidad} \boolfalse{SinCantidad}
\newboolean{Filas} \boolfalse{Filas}
\newboolean{G} \boolfalse{G}
\newboolean{SinLineasV} \boolfalse{SinLineasV}
% Condicional binario auxiliar para el separado en el estido 'sinlineasv'.
\newboolean{SeparadoSinLineasV} \boolfalse{SeparadoSinLineasV}
% Condicional auxiliar para hacer que la línea oblicua vaya desde el campo de la cantidad, en los casos de los estilos 'sinlineasv' y 'separado'.
\newboolean{LineaDesdeCantidad}
% Otro para que la línea vaya hasta el precio total, en el caso de 'sinlineasv' con 'filas'.
\newboolean{LineaHastaPT}

% Se utiliza '\@Impuesto' como el factor del impuesto, el cual viene predefinido en '\@Alicuota'.
\def\@ImpuestoG{\@AlicuotaG}
\def\@ImpuestoR{\@AlicuotaR}
\def\@ImpuestoA{\@AlicuotaA}

\DeclareOption{prefactura}{\@prefacturatrue}%  La prefactura; con el diseño de la forma libre... para enviar por correo electrónico, fax o imprimir preliminarmente.
\DeclareOption{presupuesto}{\@presupuestotrue}%  Cambia la denominación a 'PRESUPUESTO' y no 'FACTURA'.
\DeclareOption{nospanish}{\@spanishfalse}% No carga babel en castellano ni la codificación T1 de las letras.
\DeclareOption{sinfirmas}{\@confirmasfalse}%  No agrega los espacios para firmar.
\DeclareOption{sincantidad}{\booltrue{SinCantidad}}%  Para no colocar el campo de la cantidad.
\DeclareOption{sincond}{\@concondicionesfalse}%  No agrega la línea de las condiciones de pago.
\DeclareOption{denom}{\@denomtrue}%  Agrega el texto con la denominación del documento, para las formas libres que no tienen el número de factura.
\DeclareOption{siniva}{\gdef\@ImpuestoG{0}\gdef\@ImpuestoR{0}\gdef\@ImpuestoA{0}}%  No cobra IVA.
\DeclareOption{todosiva}{\@todosivatrue}%  Con esta opción salen todos los IVA así valgan cero.
\DeclareOption{ivanoexplicito}{\@ivaexplicitofalse}%  Cuando no se cobra IVA y tampoco se quiere que aparezca la totalización del IVA.
% Para la 'G' del IVA general y el porcentaje en su base imponible.
\DeclareOption{G}{\@Gtrue\booltrue{G}}%  Con esta opción sale la letra 'G' en los items con IVA general, y sale el porcentaje en la base imponible general.
\DeclareOption{lineaitem}{\@lineaitemtrue}%  Una línea en cada ítem.
\DeclareOption{linea}{\@lineatrue}%  Para la línea que protege el espacio en blanco.
\DeclareOption{separado}{\booltrue{LineaDesdeCantidad}\booltrue{Separado}\booltrue{SeparadoSinLineasV}}%  Encierra en un separado los totales de los items.
\DeclareOption{filas}{%  Estilo de totalización en filas.
 \ifbool{Separado}{\ClassWarning{factura}{La opción 'filas' no es compatible con la opción 'separado'. Sin efecto opción 'separado'}{}}{}%
 \if@ivaexplicito\else%
  \ClassWarning{factura}{La opción 'filas' no es compatible con la opción 'ivanoexplicito'. Sin efecto opción 'ivanoexplicito'.}{}%
  \@ivaexplicitotrue%
 \fi%
 \@filastrue\booltrue{Filas}%
 \boolfalse{LineaDesdeCantidad}%  Quitamos esto porque la línea diagonal se coloca dentro del renglón de la factura en el modo 'filas', entonces es desde la descripción a menos que se use 'sinlineasv'.
}
\DeclareOption{centrado}{%  Total y exento 'centrado'; sólo para estilo 'filas'
 \if@filas%
  \@centradotrue%
 \else%
  \ClassWarning{factura}{La opción 'centrado' no es compatible con el modo de totalización en columnas. Sin efecto opción 'centrado'.}{}
 \fi}
\DeclareOption{sinlineasv}{%  Estilo 'sinlineasv'.
 \booltrue{SinLineasV}%
 \booltrue{LineaDesdeCantidad}%
 \boolfalse{Separado}%
 \if@filas\booltrue{LineaHastaPT}\fi}
\DeclareOption{csv}{\@csvtrue}%  Para la salida en modo csv también.

\ProcessOptions\relax

\AtBeginDocument{%
 % Da error si algún campo necesario no está definido.
 \ifx \@undefined \@Nombre \ClassError{factura}{** Hay que definir la razón social **}{} \fi%
 \ifx \@undefined \@RIF \ClassError{factura}{** Hay que definir el R.I.F. **}{} \fi%
 \ifx \@undefined \@Direccion \ClassError{factura}{** Hay que definir la dirección fiscal **}{} \fi%
 \ifx \@undefined \@Tel \ClassError{factura}{** Hay que definir un número telefónico **}{} \fi%
 \ifx \@undefined \@Email \ClassWarning{factura}{** Pudiera definirse una dirección de correo electrónico **}{} \fi%
 \ifx \@undefined \@Fecha \ClassError{factura}{** Hay que definir la fecha de emisión **}{} \fi
 \if@concondiciones%
  \ifx \@undefined \@Condiciones \ClassError{factura}{** Hay que definir las condiciones de pago o usar la opción 'sincond' **}{} \fi%
 \fi%
 \if@confirmas%
  \ifx \@undefined \@Emisor \ClassError{factura}{** Hay que definir el nombre del emisor cuando no se omite (con la opción 'sinfirmas') el espacio para firmar. **}{} \fi%
 \fi%
 \if@marco%
  \ifx \@undefined \@Marco \ClassError{factura}{** Hay que definir el marco **}{} \fi%
 \fi%
 \if@denom%
  \ifx \@undefined \@Num \ClassError{factura}{** Hay que definir el número de la factura **}{} \fi%
 \fi}

% Tamaño de la página con 'geometry', página limpia y sin sangre.
\pagestyle{empty}
\setlength\parindent{0pt}

% \Fecha, \Nombre (\RS), \RIF, \CI, \Dirección, \Tel, \Email, \Emisor.
\def\Fecha#1{\gdef\@Fecha{#1}}
\def\Nombre#1{\gdef\@Nombre{#1}}
\let\RS\Nombre
\def\RIF#1{\gdef\@RIF{#1}}
\def\CI#1{\let\@@RIF\@@CI\gdef\@RIF{#1}}
\def\Direccion#1{\gdef\@Direccion{#1}}
\def\Tel#1{\gdef\@Tel{#1}}
\def\Email#1{\gdef\@Email{#1}}
\def\Emisor#1{\gdef\@Emisor{#1}}

\def\Resumen#1{\gdef\@Resumen{#1}}%  Resumen opcional que va colocado a la derecha en un óvalo.
\def\Marco#1{\gdef\@Marco{#1}}%  Con \Marco le damos el nombre del archivo que contiene el formato de la factura para compilaciones con 'prefactura', 'presupuesto'.
\def\Denom#1{\gdef\@Denominacion{#1}}%  La denominación puede ser 'FACTURA', 'PRESUPUESTO' u otra.
\def\@Denominacion{\@@DenomFactura}%  Se predetermina la factura.

% Número de la factura con \Num.
\def\Num#1{\gdef\@Num{\nplpadding{\@DigitosNumeracion}\npthousandsep{}\numprint{#1}}}
% También puede escribirse el número de control (\NumControl), sólo en las 'prefacturas', y el número de serie de control puede fijarse con \NumSerieControl.
% Si el número de control no se especifica, toma el mismo que el de la factura, y si el número de serie de control no se especifica, toma '00'.
\def\NumControl#1{\gdef\@NumControl{\nplpadding{\@DigitosNumeracion}\npthousandsep{}\numprint{#1}}}
\def\NumSerieControl#1{\gdef\@NumSerieControl{#1}}
\AtBeginDocument{%
 \ifx\@undefined\@NumControl\let\@NumControl\@Num\fi%
 \ifx\@undefined\@NumSerieControl\gdef\@NumSerieControl{00}\fi}

% Cantidad de líneas en blanco al final del renglón de la factura.
\def\Lineas#1{\setcounter{Lineas}{#1}}

% Texto que esclarece las condiciones de pago.
\def\Condiciones#1{\gdef\@Condiciones{#1}}

% Longitudes para uso interno.
\newlength{\TamDatos}
\newlength{\TamResumen}
\newlength{\TamFinalOvalos}
\newlength{\TamLineaFirmas}
\newlength{\EspesorLineaFirmas}
\newlength{\NodoX}
\newlength{\NodoY}
\newlength{\NodoXX}
\newlength{\NodoYY}
\newlength{\SepTotales}

% Longitudes que podemos cambiar, para la posición de varios elementos en la factura.
\newlength{\XInicioFecha}
\newlength{\YInicioFecha}
\newlength{\XInicioDenom}
\newlength{\YInicioDenom}
\newlength{\XInicioFirmas}
\newlength{\XFinFirmas}
\newlength{\YInicioFirmas}
\newlength{\XInicioCond}
\newlength{\XFinCond}
\newlength{\YInicioCond}
\newlength{\XInicioControl}
\newlength{\YInicioControl}
\newlength{\TamControl}
\newlength{\SepOvalos}
\newlength{\SepElementos}
\newlength{\SepMinTotales}

% Cajas para uso interno.
\newbox{\CajaDatos}
\newbox{\CajaResumen}
\newbox{\CajaFirma}

% Para las líneas en blanco en la factura.
\newcounter{Lineas}%

% '1' cuando hay IVA R o IVA A, y '2' cuando hay ambos.
\newcounter{IVANoGeneral}%

\input{factura.def}%  Cargamos los valores predeterminados.

% Establecemos los porcentajes de las alícuotas a través del factor, tomado del archivo .def.
\FPupn\@AlicuotaGPorc{\@AlicuotaG{} 100 * 2 round clip}
\FPupn\@AlicuotaRPorc{\@AlicuotaR{} 100 * 2 round clip}
\FPupn\@AlicuotaAPorc{\@AlicuotaA{} 100 * 2 round clip}

% \SepMinTotales es el mínimo espacio entre los totales en el modo 'filas', y SepTotales es una dimensión estirable, con ese como su mínimo.
\expandafter\setlength{\SepTotales}{\the\SepMinTotales plus 1fill}

\if@todosiva
 \@BIRtrue
 \@BIAtrue
 \@Exentotrue
 \@Gtrue
\fi

\if@spanish
 \RequirePackage[spanish]{babel}%  Babel en castellano.
 \RequirePackage[T1]{fontenc}%  Codificación T1 para las tipografías.
\fi

\if@linea
 \RequirePackage{tikz}%  Para la línea.
 \RequirePackage{zref-savepos}%  También determinar las coordenadas de la línea.
 \AtEndDocument{\@Linea}
\fi

\if@prefactura
 \@marcotrue
 \RequirePackage{graphicx}
 \AtEndDocument{\@MARCO\@NUMCONTROL}
 \@denomtrue
\fi

\if@presupuesto
 \@marcotrue
 \RequirePackage{graphicx}
 \AtEndDocument{\@MARCO}
 \@denomtrue
 \def\@Denominacion{\@@DenomPresupuesto}
\fi

\AtBeginDocument{\@Encabezado}

\if@denom%  Coloca el texto de la denominación.
 \AtEndDocument{\@DENOMINACION}
\fi

\if@confirmas%  Coloca las firmas.
 \AtEndDocument{\@FIRMAS}
\fi

\if@concondiciones%  Coloca las condiciones de pago.
 \AtEndDocument{\@CONDICIONES}
\fi

\if@csv%  Abre el archivo csv.
 \newwrite\csv
 \immediate\openout\csv=\jobname.csv
\fi

\AtBeginDocument{\AtEndDocument{%
 % La factura no puede ocupar más que una página.
 \clearpage\ifthenelse{\value{page}>2}{\ClassError{factura}{** La factura ocupa más que una página **}{}}{\relax}
 % Escribimos los totales al archivo csv.
 \if@csv%
  \if@Exento \write\csv{Totales: \space\space \@@BIE: \@Moneda \BIE} \fi%
  \if@BIR%
   \write\csv{Totales: \space\space \@@BIR: \@Moneda \BIR}%
   \write\csv{Totales: \space\space\space \@@AlicuotaR: \@Moneda \AlicuotaR}%
  \fi%
  \write\csv{Totales:  \space\space \@@BIG: \@Moneda \BIG}%
  \write\csv{Totales: \space\space\space \@@AlicuotaG: \@Moneda \AlicuotaG}%
  \if@BIA%
   \write\csv{Totales: \space\space \@@BIA: \@Moneda \BIA}%
   \write\csv{Totales: \space\space\space \@@AlicuotaA: \@Moneda \AlicuotaA}%
  \fi%
  \write\csv{Totales: \space\space\space \@@Total: \@Moneda \Total}%
  \closeout\csv%
 \fi}}

% Comando para incluir la firma escaneada en el puesto donde va la línea de la firma del emisor.
% El primer parámetro es la posición en X, el segundo parámetro es la posición en Y, y
% el tercer parámeto deberá ser la inclusión del gráfico.
\newcommand{\Firma}[3]{%
 \RequirePackage{graphicx}%
 \def\tempX{#1}%
 \def\tempY{#2}%
 \ifthenelse{\equal{\tempX}{\empty}}{\def\tempX{0pt}}{}%
 \ifthenelse{\equal{\tempY}{\empty}}{\def\tempY{0pt}}{}%
 \savebox{\CajaFirma}{#3}%
 \AtEndDocument{%
  \begin{textblock*}{\TamLineaFirmas}(\textwidth+\oddsidemargin+1in-\TamLineaFirmas/2-\wd\CajaFirma/2-\XFinFirmas+\tempX,\YInicioFirmas-\ht\CajaFirma-\dp\CajaFirma+\tempY)%
   \usebox{\CajaFirma}%
  \end{textblock*}}}%

\newcommand{\cliente}[1]{\input{#1.def}}%  Para cada cliente se puede tener un archivo .def con su nombre y alguna macro cargada. Ese archivo lo ponemos incluir con '\cliente' en lugar de usar \input o \include, y la extensión deberá ser .def.

% El ambiente 'factura', usando el paquete 'environ' para su definición, y el comando auxiliar \facturaauxcmd.
% Gracias a Heiko Oberdiek y David Carlisle (Thanks to Heiko Oberdiek and David Carlisle).
% http://tex.stackexchange.com/questions/108565/know-the-cell-width-with-tabular-or-include-a-paragraph-box-without-specifying
\NewEnviron{factura}{%
 \expandafter\facturaauxcmd\expandafter{\BODY}%
}

% Comando auxiliar para la definición del ambiente de la factura; al final de este comando está el texto que va en el enddef del ambiente de la factura.
\newcommand{\facturaauxcmd}[1]
{%
 \ifx\undefined\Total\relax\else\ClassError{factura}{** Parece ya haber un renglón de montos **}{}\fi%
 %
 \renewcommand{\tabularxcolumn}[1]{m{##1}}% TODO: Alineación vertical cuando hay más de una línea.
 % http://tex.stackexchange.com/questions/111203/tabularx-bottom-alignment-on-r-or-l-columns-when-x-column-wraps
 % Comando para poner en cero los contadores de los totales porque el ambiente de la factura se evalúa tres veces y los totales se sumarían todos tres veces.
 \newcommand{\@ZERO}{%
  \FPset\BIG{0}\global\let\BIG\BIG%
  \FPset\BIR{0}\global\let\BIR\BIR%
  \FPset\BIA{0}\global\let\BIA\BIA%
  \FPset\BIE{0}\global\let\BIE\BIE%
  \FPset\AlicuotaG{0}\global\let\AlicuotaG\AlicuotaG%
  \FPset\AlicuotaR{0}\global\let\AlicuotaR\AlicuotaR%
  \FPset\AlicuotaA{0}\global\let\AlicuotaA\AlicuotaA%
 }%
 %
 % Escribe la letra que designa al tipo de impuesto que aplica al ítem.
 \newcommand\EscribeTipoDeImpuesto[1]{%
  \if@G\letratipoiva\ \fi% El espacio antes de la letra.
  \ifthenelse{\equal{##1}{E}}{\@DenomAlicuotaE\hfill}{}% Si está exento, escribimos '(E)' al lado del p/t también.
  \ifthenelse{\equal{##1}{R}}{\@DenomAlicuotaR\hfill}{}% Si tiene IVA reducido, escribimos 'R'.
  \ifthenelse{\equal{##1}{A}}{\@DenomAlicuotaA\hfill}{}% Si tiene IVA adicional, escribimos 'A'.
  \ifthenelse{\equal{##1}{G}}{\if@G\@DenomAlicuotaG\hfill\fi}{}% Una 'G' para IVA general si hace falta.
  \if@G\ \fi} % El espacio entre el tipo de impuesto y el precio.
 %
 % Suma el ítem actual a la base imponible acumulada.
 \newcommand{\@TotalizaItem}[1]{%
  \expandafter\FPupn\csname BI##1\endcsname{\PrecioT{} \expandafter\csname BI##1\endcsname{} + 2 round}% Agregamos a la base imponible.
  \global\expandafter\let\csname BI##1\expandafter\endcsname\csname BI##1\endcsname%
  % Si es un ítem exento, no hay alícuota a agregar.
  \ifthenelse{\equal{##1}{E}}{}{%
   \expandafter\FPupn\csname Alicuota##1\endcsname{\PrecioT{} \expandafter\csname @Impuesto##1\endcsname{} * \expandafter\csname Alicuota##1\endcsname{} + 2 round}% Agregamos al IVA.
   \global\expandafter\let\csname Alicuota##1\expandafter\endcsname\csname Alicuota##1\endcsname}}%
 %
 % Comando para sumar todos los totales y general el total general.
 \newcommand{\@TotalTotal}{%
  \FPupn{\Total}{\BIE{} \BIR{} + \BIG{} + \BIA{} + \AlicuotaR{} + \AlicuotaG{} + \AlicuotaA{} + 2 round}%
  \global\let\Total\Total}%
 %
 % Presentación de totales en modo de columnas.
 \newcommand{\@EscribeTotalColBI}[1]{%
  \ifbool{Separado}{\multicolumn{2}{|c}{}&\multicolumn{1}{r}}{&&}%
  {\ \letratittotales \csname @@BI##1\endcsname%
   \ifthenelse{\equal{##1}{G}}{%
    % Colocamos el porcentaje explícito en la base imponible general si es requerido.
    \if@G\ \hfill(\@AlicuotaGPorc\%)\else\mbox{}\fi}
   {\hfill\ifthenelse{\equal{##1}{E}}{}{\ (\csname @Alicuota##1Porc\endcsname\%)}}}%
  & \letratotales\numprint{\csname BI##1\endcsname} \\}%
 %
 \newcommand{\@EscribeTotalColAlicuota}[1]{%
  \ifbool{Separado}{\multicolumn{2}{|c}{}&\multicolumn{1}{r}}{&&}%
  {\ \letratittotales \csname @@Alicuota##1\endcsname\ \hfill (\csname @Alicuota##1Porc\endcsname\%)}%
  & \letratotales\numprint{\csname Alicuota##1\endcsname} \\}%
 %
 % Presentación de totales en modo filas.
 \newcommand{\@EscribeTotalFilasBI}[1]{%
  \@EscribeTotalFilasBIizq{##1}: & \@EscribeTotalFilasBIder{##1}}%
 %
 \newcommand{\@EscribeTotalFilasSoloBI}[1]{%
  {\letratittotales\@EscribeTotalFilasBIizq{##1}:} {\letratotales\@EscribeTotalFilasBIder{##1}}}%
 %
 \newcommand{\@EscribeTotalFilasBIizq}[1]{%
  \letratittotales\csname @@BI##1\endcsname%
  \ifthenelse{\equal{##1}{G}}%
  {\if@G \ (\@AlicuotaGPorc\%)\fi}%  Si hay otra B.I. que no sea general, colocamos el porcentaje explícito en la general.
  {\ifthenelse{\equal{##1}{E}}{}{\ (\csname @Alicuota##1Porc\endcsname\%)}}}%
 %
 \newcommand{\@EscribeTotalFilasBIder}[1]{%
  \letratotales\numprint{\csname BI##1\endcsname}}%
 %
 \newcommand{\@EscribeTotalFilasAlicuota}[1]{%
  \@EscribeTotalFilasAlicuotaizq{##1}: & \@EscribeTotalFilasAlicuotader{##1}}%
 %
 \newcommand{\@EscribeTotalFilasSoloAlicuota}[1]{%
  {\letratittotales\@EscribeTotalFilasAlicuotaizq{##1}:} {\letratotales\@EscribeTotalFilasAlicuotader{##1}}}%
 %
 \newcommand{\@EscribeTotalFilasAlicuotaizq}[1]{%
  \letratittotales\csname @@Alicuota##1\endcsname \ (\csname @Alicuota##1Porc\endcsname\%)}%
 %
 \newcommand{\@EscribeTotalFilasAlicuotader}[1]{%
  \letratotales\numprint{\csname Alicuota##1\endcsname}}%
 %
 \newcommand{\@EscribeTotalFilas}[2][]{%
  \@EscribeTotalFilasAuxTabla{%
   \csname @EscribeTotalFilasBI\endcsname{##2}%
   \ifthenelse{\equal{##2}{E}}{%
    \ifthenelse{\equal{##1}{T}}{%
     \\%
     \letratittotal\@@Total: & \letratotal\numprint{\Total}}{}}%
    {\\%
    \csname @EscribeTotalFilasAlicuota\endcsname{##2}}}}%
 %
 \newcommand{\@GeneraCajasTotalesFilas}{%
  \if@Exento%
   \newbox{\CajaBIE}\newbox{\CajaBIET}%
   \savebox{\CajaBIE}{\@EscribeTotalFilasSoloBI{E}}%
   \savebox{\CajaBIET}{\@EscribeTotalFilas[T]{E}}%
  \fi%
  \if@BIR%
   \addtocounter{IVANoGeneral}{1}%
   \newbox{\CajaBIR}\newbox{\CajaAliR}\newbox{\CajaBIAliR}%
   \savebox{\CajaBIR}{\@EscribeTotalFilasSoloBI{R}}%
   \savebox{\CajaAliR}{\@EscribeTotalFilasSoloAlicuota{R}}%
   \savebox{\CajaBIAliR}{\@EscribeTotalFilas{R}}%
  \fi%
  \newbox{\CajaBIG}\newbox{\CajaAliG}\newbox{\CajaBIAliG}%
  \savebox{\CajaBIG}{\@EscribeTotalFilasSoloBI{G}}%
  \savebox{\CajaAliG}{\@EscribeTotalFilasSoloAlicuota{G}}%
  \savebox{\CajaBIAliG}{\@EscribeTotalFilas{G}}%
  \if@BIA%
   \addtocounter{IVANoGeneral}{1}%
   \newbox{\CajaBIA}\newbox{\CajaAliA}\newbox{\CajaBIAliA}%
   \savebox{\CajaBIA}{\@EscribeTotalFilasSoloBI{A}}%
   \savebox{\CajaAliA}{\@EscribeTotalFilasSoloAlicuota{A}}%
   \savebox{\CajaBIAliA}{\@EscribeTotalFilas{A}}%
  \fi}%
 %
 \newcommand{\@EscribeTotalesFilasGET}{%
  \hspace*{\SepTotales}\usebox{\CajaBIG}%
  \hspace*{\SepTotales}\usebox{\CajaAliG}%
  \if@Exento\hspace*{\SepTotales}\usebox{\CajaBIE}\fi%
  \hspace*{\SepTotales}\usebox{\CajaTotal}%
  \if@centrado\hspace*{\SepTotales}\fi}%
 %
 \newcommand{\@EscribeTotalesFilasGxET}{%
  \if@BIR\hspace*{\SepTotales}\usebox{\CajaBIAliR}\fi%
  \hspace*{\SepTotales}\usebox{\CajaBIAliG}%
  \if@BIA\hspace*{\SepTotales}\usebox{\CajaBIAliA}\fi%
  \hspace*{\SepTotales}\if@Exento\usebox{\CajaBIET}\else\usebox{\CajaTotal}\fi%
  \if@centrado\hspace*{\SepTotales}\fi}%
 %
 \newcommand{\@EscribeTotalesFilasRGA}{%
  \hspace*{\SepTotales}\usebox{\CajaBIAliR}%
  \hspace*{\SepTotales}\usebox{\CajaBIAliG}%
  \hspace*{\SepTotales}\usebox{\CajaBIAliA}%
  \hspace*{\SepTotales}}%
 %
 \newcommand{\@EscribeTotalesFilasRGAET}{%
  \@EscribeTotalesFilasRGA%
  \if@Exento\usebox{\CajaBIET}\else\usebox{\CajaTotal}\fi%
  \if@centrado\hspace*{\SepTotales}\fi}%
 %
 \newcommand{\@EscribeTotalFilasAuxTabla}[1]{%
  \begin{tabular}{@{}l@{\extracolsep{4pt}}r@{}}%
   ##1%
  \end{tabular}}%
 %
 % Comando interno para el ítem.
 \newcommand{\@ITEM}[4]{% 1. [R|G|A|E]; 2. cantidad; 3. descripción; 4. p/u.
  \ifbool{SinCantidad}{}{%
   \letranumeros\numprint{##2}}% Se escribe la cantidad.
  &%
  ##3% Se escribe la descripción.
  &%
  \FPupn\PrecioU{##4 2 round}%
  % Advertimos si el precio unitario tiene tres decimales.
  \FPifeq\PrecioU{##4}\else\ClassWarning{factura}{** Se está introduciendo un precio con tres decimales: (##3 -> ##4) **}{}\fi%
  \ifbool{SinCantidad}{}{%
   {\EscribeTipoDeImpuesto{##1}}%
   \letranumeros\numprint{\PrecioU}}%
  &%
  {\EscribeTipoDeImpuesto{##1}}%
  \FPupn\PrecioT{##2 ##4 * 2 round}%
  \global\let\PrecioT\PrecioT%
  \letranumeros\numprint{\PrecioT}%
  \ifbool{SinCantidad}
  % Escribimos al .log el ítem.
  {\if@csv\write\csv{"##3","##1","\PrecioT"}\fi}%
  {\if@csv\write\csv{"##2","##3","##1 ##4","##1 \PrecioT"}\fi}%
  %
  \@TotalizaItem{##1}%
  \\%
  \if@lineaitem\hline\fi}%
 %
 \ifbool{SinCantidad}
 {%
  % Ítem normal.
  \newcommand{\Item}[2]{\@ITEM{G}{1}{##1}{##2}}%
  % Ítem con IVA reducido.
  \newcommand{\ItemR}[2]{\global\@BIRtrue\global\@Gtrue\@ITEM{R}{1}{##1}{##2}}%
  % Ítem con IVA adicional.
  \newcommand{\ItemA}[2]{\global\@BIAtrue\global\@Gtrue\@ITEM{A}{1}{##1}{##2}}%
  % Ítem exento de IVA.
  \newcommand{\ItemE}[2]{\global\@Exentotrue\@ITEM{E}{1}{##1}{##2}}%
  % Ítem sin precio.
  \newcommand{\ItemX}[1]{%
   \if@csv\write\csv{"##1","0"}\fi%
   & ##1 && \hfill ... \hfill\mbox{} \\}}%
 {%
  % Ítem normal.
  \newcommand{\Item}[3]{\@ITEM{G}{##1}{##2}{##3}}%
  % Ítem con IVA reducido.
  \newcommand{\ItemR}[3]{\global\@BIRtrue\global\@Gtrue\@ITEM{R}{##1}{##2}{##3}}%
  % Ítem con IVA adicional.
  \newcommand{\ItemA}[3]{\global\@BIAtrue\global\@Gtrue\@ITEM{A}{##1}{##2}{##3}}%
  % Ítem exento de IVA.
  \newcommand{\ItemE}[3]{\global\@Exentotrue\@ITEM{E}{##1}{##2}{##3}}%
  % Ítem sin precio.
  \newcommand{\ItemX}[2]{%
   \if@csv\write\csv{"##1","##2","0","0"}\fi%
   \letranumeros\numprint{##1} &%
   ##2 & \hfill ... \hfill\mbox{} & \hfill ... \hfill\mbox{} \\}}%
 % Ya definimos todos los comandos; ahora agregamos el espacio dinámico entre los óvalos y el renglón de la factura.
 \vfill%
 % Este es el tipo de letra que tendrán los items, y en este tipo de letra se define el \baselineskip de toda la factura.
 \letraitems%
 \ifbool{SinCantidad}
 {%
  \ifbool{SinLineasV}
  {\begin{tabularx}{\textwidth}{ l@{\extracolsep{0pt}}Xr r }}
  {\begin{tabularx}{\textwidth}{|l@{\extracolsep{0pt}}Xr|r|}}%
   % Antes, con tabular*:
   % \begin{tabular*}{\textwidth}{|l@{\extracolsep{0pt}}l@{\extracolsep{\fill}}cc@{\extracolsep{0pt}}r|r|}%
  \hline%
  \@ZERO%
  \if@csv\write\csv{"\@@Descripcion","\@@Precio (\@Moneda"}\fi%
  &% Avanzamos hasta la descripción.
  % Guardamos la posición X del nodo A de la línea, si hace falta.
  \if@linea\hspace*{-\tabcolsep}\zsaveposx{LineaNodoACoordX}\hspace*{\tabcolsep}\fi%
  \letratitrenglon \@@Descripcion%
  &% Avanzamos hasta la columna fantasma del precio unitario, y guardamos la posición X del nodo B de la línea, si hiciera falta.
  \if@linea%
   \if@filas\hfill\mbox{}\fi% Si el estilo es 'filas' la línea va hasta el precio total.
   \ifbool{LineaHastaPT}{}
    {\hspace*{\tabcolsep}\zsaveposx{LineaNodoBCoordX}\hspace*{-\tabcolsep}}
  \fi%
  \if@filas\else\hfill\mbox{}\fi% Si el estilo no es 'filas' la línea va hasta el principio de la columna fantasma.
  &% Avanzamos hasta el precio total.
  \mbox{}\hfill\letratitrenglon \@@Precio \space (\@Moneda)\hfill\mbox{}%
  \if@linea%
   \ifbool{LineaHastaPT}
   {\hspace*{\tabcolsep}\zsaveposx{LineaNodoBCoordX}\hspace*{-\tabcolsep}}{}%
  \fi%
  \\%
  \hline}
 {%
  \ifbool{SinLineasV}
  {\begin{tabularx}{\textwidth}{ c X r r }}
  {\begin{tabularx}{\textwidth}{|c|X|r|r|}}%
   % Antes, con tabular*:
   % \begin{tabular*}{\textwidth}{|c|l@{\extracolsep{\fill}}cc@{\extracolsep{0pt}}|r|r|}%
  \hline%
  \@ZERO%
  \if@csv\write\csv{"\@@Cantidad","\@@Descripcion","\@@PrecioU \space (\@Moneda)","\@@PrecioT \space (\@Moneda)"}\fi%
  % Guardamos la posición X del nodo A de la línea, si hace falta; y lo hacemos desde aquí si el estilo que se está usando no es 'sinlineasv', así la línea diagonal comienza en la descripción.
  \if@linea\ifbool{LineaDesdeCantidad}{\hspace*{-\tabcolsep}\zsaveposx{LineaNodoACoordX}\hspace*{\tabcolsep}}{}\fi%
  \letratitrenglon \@@Cantidad%
  &% Avanzamos hasta la descripción.
  % Guardamos la posición X del nodo A de la línea, si hace falta; y lo hacemos dsede aquí si el estilo 'sinlineasv' se está usando para que la línea diagonal comience desde la cantidad y no desde la descripción.
  \if@linea\ifbool{LineaDesdeCantidad}{}{\hspace*{-\tabcolsep}\zsaveposx{LineaNodoACoordX}\hspace*{\tabcolsep}}\fi%
  \letratitrenglon \@@Descripcion%
  &% Avanzamos hasta el precio unitario.
  % Guardamos la posición X del nodo B de la línea.
  % Ya que ya estamos en una columna fantasma no usada que es la del precio unitario, debemos retroceder a la columna anterior (-\tabcolsep) atravesando la línea vertical (-\arrayrulewidth).
  \if@linea%
   \ifbool{LineaHastaPT}
   {}{%
    \hspace*{-\tabcolsep}%
    \ifbool{LineaDesdeCantidad}{}{\hspace*{-\arrayrulewidth}}%
    \zsaveposx{LineaNodoBCoordX}%
    \hspace*{\tabcolsep}%
    \ifbool{LineaDesdeCantidad}{}{\hspace*{\arrayrulewidth}}}%
  \fi%
  \mbox{}\hfill%
  \letratitrenglon \@@PrecioU \space (\@Moneda)\hfill\mbox{}%
  &% Avanzamos hasta el precio total.
  \mbox{}\hfill \letratitrenglon \@@PrecioT \space (\@Moneda)\hfill\mbox{}%
  \if@linea%
   \ifbool{LineaHastaPT}
  {\hspace*{\tabcolsep}\zsaveposx{LineaNodoBCoordX}\hspace*{-\tabcolsep}}{}%
  \fi%
  \\%
  \hline%
 }%
 %
 #1% Aquí entran todos los items que el usuario declara dentro del ambiente.
 \if@filas%
  % Si hay líneas en blanco se colocan todas menos la última que debe ponerse a mano para poder fijar las coordenadas.
  \ifnum\value{Lineas}>0
   \Repeat{\value{Lineas}-1}{&&&\\}%
   \if@linea\zsaveposy{LineaNodoBCoordY}\fi% Se guarda la coordenada Y del punto de la derecha de la línea diagonal.
   &&&\\%
  \fi%
  \hline%
 \else%
  % Si usamos el estilo 'separado', o 'sinlineasv' junto con 'separado' debemos cerrar primero con la línea horizontal.
  \ifbool{SeparadoSinLineasV}{\if@lineaitem\else\hline\fi}{}%
  % Agregamos las líneas espúreas.
  \ifbool{Separado}
  {\Repeat{\value{Lineas}}{\multicolumn{4}{|c|}{}\\}}
  {\Repeat{\value{Lineas}}{&&&\\}}%
  \if@ivaexplicito%
   \if@Exento \@EscribeTotalColBI{E}\fi%
   \if@BIR \@EscribeTotalColBI{R} \@EscribeTotalColAlicuota{R}\fi%
   \@EscribeTotalColBI{G} \@EscribeTotalColAlicuota{G}%
   \if@BIA \@EscribeTotalColBI{A} \@EscribeTotalColAlicuota{A}\fi%
   \cline{4-4}%
  \fi% Se acaba el condicional del IVA explícito (\if@ivaexplicito ... \fi).
  \ifbool{Separado}
  {\multicolumn{2}{|c}{}&\multicolumn{1}{r}}{&&}% Si usamos el estilo 'separado' debemos quitar las líneas verticales desde la cantidad hasta el precio total.
   % Guardamos la coordenada Y del nodo B de la línea diagonal, si se pide que aparezca.
  {\if@linea\zsaveposy{LineaNodoBCoordY}\fi%
  \letratittotal\@@Total} & \@TotalTotal\letratotal\numprint{\Total} \\%
  \hline%
 \fi%
 \end{tabularx}%
 %
 \if@filas%
  \vfill%
  \@TotalTotal%
  \@GeneraCajasTotalesFilas%
  \newbox{\CajaTotal}%
  \savebox{\CajaTotal}{{\letratittotal\@@Total}: \letratotal\numprint{\Total}}%
  %
  \ifnum \value{IVANoGeneral}=0%
   \newbox{\CajaGET}%
   \savebox{\CajaGET}{\@EscribeTotalesFilasGET}%
   \ifdim \the\wd\CajaGET < \textwidth%
    \parbox{\textwidth}{\@EscribeTotalesFilasGET}%
   \else%
    \hspace*{\SepTotales}%
    \usebox{\CajaBIAliG}\hspace*{\SepTotales}%
    \if@Exento\usebox{\CajaBIET}\else\usebox{\CajaTotal}\fi%
    \if@centrado\hspace*{\SepTotales}\fi%
   \fi%
  \fi%
  \ifnum \value{IVANoGeneral}=1%
   \newbox{\CajaGxET}%
   \savebox{\CajaGxET}{\@EscribeTotalesFilasGxET}%
   \ifdim \the\wd\CajaGxET < \textwidth%
    \@EscribeTotalesFilasGxET%
   \else%
    \hspace*{\SepTotales}%
    \if@BIR\usebox{\CajaBIAliR}\hspace*{\SepTotales}\fi%
    \usebox{\CajaBIAliG}\hspace*{\SepTotales}%
    \if@BIA\usebox{\CajaBIAliA}\hspace*{\SepTotales}\fi%
    \par%
    \if@centrado\hspace*{\SepTotales}\else\hfill\fi%
    \if@Exento\usebox{\CajaBIE}\hspace*{\SepMinTotales}\fi\usebox{\CajaTotal}%
    \if@centrado\hspace*{\SepTotales}\fi%
   \fi%
  \fi%
  \ifnum \value{IVANoGeneral}=2%
  \newbox{\CajaRGAET}%
  \savebox{\CajaRGAET}{\@EscribeTotalesFilasRGAET}%
   \ifdim \the\wd\CajaRGAET < \textwidth%
    \@EscribeTotalesFilasRGAET%
   \else%
    \newbox{\CajaRGA}%
    \savebox{\CajaRGA}{\@EscribeTotalesFilasRGA}%
    \ifdim \the\wd\CajaRGA < \textwidth%
     \@EscribeTotalesFilasRGA%
     \par%
     \if@centrado\hspace*{\SepTotales}\else\hfill\fi%
     \if@Exento\usebox{\CajaBIE}\hspace*{\SepMinTotales}\fi\usebox{\CajaTotal}%
     \if@centrado\hspace*{\SepTotales}\fi%
    \else% Aquí casi cualquier cosa tiene aspecto feo.
     \ClassWarning{factura}{Es mejor no usar la opción de totalización en filas en este caso, o disminuir los tamaños de los tipos de letra para la totalización}{}%
     \centering{%
      \begin{tabular}{r@{\hspace*{\SepMinTotales}}l}
       \usebox{\CajaBIAliR} & \usebox{\CajaBIAliA} \\
       \usebox{\CajaBIAliG} & \if@Exento\usebox{\CajaBIET}\else\usebox{\CajaTotal}\fi
      \end{tabular}}%
    \fi%
   \fi%
  \fi%
 \fi%
 \vfill%
}

% El comando para la descripción del servicio prestado en esta factura.
\newcommand{\desc}[2][]{%
 \letradescrip%
 \shadowbox{%
  \parbox[t][\textheight-\pagetotal-2\fboxsep-2\fboxrule-\shadowsize-\SepElementos]
  {\textwidth-\shadowsize-\fboxsep*2-\fboxrule*2}{%
   \setlength{\parindent}{0.5cm}%
   \setlength{\parskip}{10pt}%
   \ifthenelse{\equal{#1}{*}}{}{\vfill}%
   #2%
   \ifthenelse{\equal{#1}{*}}{}{\vfill}%
   }}%
 \vspace*{-\baselineskip}%
 \par}

% Comando para escribir el encabezado.
\newcommand\@Encabezado{%
 \@FECHA%
 \ifx\@undefined\@Resumen%
  \@DATOSCLIENTE%
 \else%
  \@DATOSCLIENTERESUMEN%
 \fi}

% Comando para el diseño de la forma libre.
\newcommand\@MARCO{%
 \begin{textblock*}{\paperwidth}(0pt,0pt)%
  \includegraphics{\@Marco}%
 \end{textblock*}}

% Comando que coloca la firma escaneada.
\newcommand\@FIRMAS{%
 \begin{textblock*}{\textwidth+\oddsidemargin+1in-\XInicioFirmas-\XFinFirmas}(\XInicioFirmas,\YInicioFirmas)%
  \letrafirmas%
  \parbox{\TamLineaFirmas}{%
   \rule{\TamLineaFirmas}{\EspesorLineaFirmas}
   \centering \@@Conforme}%
  \hfill%
  \parbox{\TamLineaFirmas}{%
   \rule{\TamLineaFirmas}{\EspesorLineaFirmas}
   \centering \@Emisor}%  La línea de arriba no puede terminar en '%'.
 \end{textblock*}}

% Comando que coloca las condiciones de pago.
\newcommand\@CONDICIONES{%
 \begin{textblock*}{\textwidth+\oddsidemargin+1in-\XInicioCond-\XFinCond}(\XInicioCond,\YInicioCond)%
  \letracondiciones%
  \@Condiciones%
 \end{textblock*}}

% Comando que coloca el número de control.
\newcommand\@NUMCONTROL{%
 \begin{textblock*}{\TamControl}(\XInicioControl,\YInicioControl)%
  {\letradenom \@@Control \par \@NumSerieControl-}\space{\letranumeracion\@NumControl}%
 \end{textblock*}}

% Comando que coloca la denominación del documento.
\newcommand\@DENOMINACION{%
 \begin{textblock*}{\textwidth}(\XInicioDenom,\YInicioDenom)%
  {\letradenom\@Denominacion}\space\space{\letranumeracion N\textordmasculine\space\@Num}%
 \end{textblock*}}

% Comando que coloca la fecha.
\newcommand\@FECHA{%
 \begin{textblock*}{\textwidth}(\XInicioFecha,\YInicioFecha)%
  \hfill\letrafecha\@@Fecha{\ttfamily\ \@Fecha}%
 \end{textblock*}}

% Comando que coloca el óvalo con los datos del cliente.
\newcommand\@DATOSCLIENTE{%
 \letraovalos%
 \ovalbox{%
  \parbox{\textwidth-\fboxsep*2-1pt}{%
   \hfill {\letratitovalos \@@Datos} \hfill \mbox{}\par%
   {\bfseries \@@Nombre} \@Nombre%
   \dotfill%
   {\bfseries \@@RIF} {\ttfamily \@RIF}%
   \par%
   {\bfseries \@@Direccion} \@Direccion%
   \par%
   {\bfseries \@@Tel} {\ttfamily \@Tel}%
   \ifx\@undefined\@Email\relax\else%
    \hspace*{0.2cm}$\diamond$\hspace*{0.2cm}{\bfseries \@@Email} {\ttfamily \@Email}\fi}}%
 \par}%  Para que textblock* esté en modo vertical.

% Comando que coloca los dos óvalos, con los datos del cliente y el resumen.
\newcommand\@DATOSCLIENTERESUMEN{%
 \letraovalos%
 \savebox{\CajaDatos}{%
  \parbox[t]{\textwidth/2-\SepOvalos-\fboxsep*2}{%
   \hfill {\letratitovalos \@@Datos} \hfill \mbox{}\par%
   {\bfseries \@@Nombre} \@Nombre \par%
   {\bfseries \@@RIF} {\ttfamily \@RIF} \par%
   {\bfseries \@@Direccion} \@Direccion \par%
   {\bfseries \@@Tel} {\ttfamily \@Tel} \hfill \par%
   \ifx\@undefined\@Email\relax\else%
    {\bfseries \@@Email} {\ttfamily \@Email}\fi}}%
 \savebox{\CajaResumen}{%
  \parbox[t]{\textwidth/2-\SepOvalos-\fboxsep*2}{%
   \hfill {\letratitovalos \@@Resumen} \hfill \mbox{}\par%
   \null\vfill\@Resumen\vfill\null}}%
 \setlength{\TamDatos}{\ht\CajaDatos+\dp\CajaDatos}%
 \setlength{\TamResumen}{\ht\CajaResumen+\dp\CajaResumen}%
 \ifthenelse{\TamDatos>\TamResumen}
  {\setlength{\TamFinalOvalos}{\TamDatos}}
  {\setlength{\TamFinalOvalos}{\TamResumen}}%
 \ovalbox{\parbox[t][\TamFinalOvalos]{\textwidth/2-\SepOvalos-\fboxsep*2}{\usebox{\CajaDatos}}}%
 \hfill%
 \ovalbox{\parbox[t][\TamFinalOvalos]{\textwidth/2-\SepOvalos-\fboxsep*2}{\usebox{\CajaResumen}}}%
 \par}%  Para que textblock* esté en modo vertical.

% Comando que coloca la línea diagonal.
\newcommand\@Linea{%
 \letraitems%  Volvemos a fijar el \baselineskip de la tabla.
 \setlength{\NodoX}{\zposx{LineaNodoACoordX} sp}%
 \setlength{\NodoY}{\zposy{LineaNodoBCoordY} sp}%
 \setlength{\NodoXX}{\zposx{LineaNodoBCoordX} sp}%
 \setlength{\NodoYY}{\zposy{LineaNodoBCoordY} sp}%
 \addtolength{\NodoY}{\baselineskip/2}%
 \if@filas%
  \addtolength{\NodoY}{\arabic{Lineas}\baselineskip-\baselineskip}%
 \else%
  \addtolength{\NodoY}{\arabic{Lineas}\baselineskip}%
  \if@ivaexplicito%
   \addtolength{\NodoY}{2\baselineskip}%
   \if@Exento\addtolength{\NodoY}{\baselineskip}\fi%
   \if@BIR\addtolength{\NodoY}{2\baselineskip}\fi%
   \if@BIA\addtolength{\NodoY}{2\baselineskip}\fi%
  \fi%
 \fi%
 \begin{textblock*}{\paperwidth-\NodoX}(\NodoX,\paperheight-\NodoY)%
  \begin{tikzpicture}%
   \draw (\NodoX,\NodoY) --(\NodoXX,\NodoYY);%
  \end{tikzpicture}%
 \end{textblock*}}

\endinput