%% ****************************************************************************************************
%%   Copyright 2024 by Mingyu Hsia <xiamyphys@gmail.com>                                              *
%%                                                                                                    *
%%   This work may be distributed and/or modified under          *           *****       *    *       *
%%   the conditions of the LaTeX Project Public License          *      ** *   *    ***   *  *        *
%%                                                               *     *  **   *   *   *   **         *
%%       http://www.latex-project.org/lppl.txt                   *     *   *   *   *****   **         *
%%                                                               *     *  **   *   *      *  *        *
%%   either version 1.3c of this license or any later            *****  ** *   *    ***  *    *       *
%%   version.                                                                                         *
%%                                                                                                    *
%%   This work has the LPPL maintenance status `maintained'.                                          *
%%                                                                                                    *
%%   The Current Maintainer of this work is Mingyu Hsia.                                              *
%%                                                                                                    *
%%   This work consists of the files litebook.cls,                                                    *
%%                               and README.md.                                                       *
%%   available at https://github.com/xiamyphys/LiteBook                                               *
%% ****************************************************************************************************
% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{litebook}[2024/03/11 v0.1c LiteBook document class]
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax
\LoadClass[letterpaper,11pt,openany]{book}

\RequirePackage{geometry,enumitem,booktabs,tabularx,diagbox,multicol,multirow}
\geometry{rmargin=1.25 in,lmargin=.75 in,tmargin=1 in,bmargin=1 in}

\RequirePackage{graphics,graphicx}
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

\RequirePackage{indentfirst}
\setlength{\parindent}{2ex}

\RequirePackage[labelsep=period,labelfont={bf,sf},font=small]{caption}
\RequirePackage[nokeyprefix]{refstyle}
\newref{fig}{name={\sffamily\bfseries Figure~}}
\newref{tab}{name={\sffamily\bfseries Table~}}

\RequirePackage{tocloft}
\setlength{\cftbeforetoctitleskip}{16\p@}
\setlength{\cftaftertoctitleskip}{24\p@}
\renewcommand{\contentsname}{\sffamily Contents}

\def\@makechapterhead#1{%
  \vspace*{\p@}%
  {
  \parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
            \if@mainmatter
        \parbox{25mm}
        {\centering\HUGE\normalfont\bfseries\textcolor{darkgray}{\thechapter}\\[4mm]\normalsize\bfseries\textcolor{darkgray}{\bfseries\sffamily\scshape \@chapapp}}%
        \tikz[baseline]
          \draw[line width=3pt,dotted,dash pattern=on 0pt off 8pt, gray](0,-.85)--(0,1.35);
            \fi
    \fi
    \interlinepenalty\@M\hspace*{4ex}
    \huge\bfseries\sffamily #1\par\nobreak
    \vskip 36\p@
}}

\def\@makeschapterhead#1{%
  \gdef\s@chapter{#1}
  \addcontentsline{toc}{chapter}{\s@chapter}
  \vspace*{4\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \huge \bfseries \sffamily  #1\par\nobreak
    \vskip 40\p@
}}
\setlength{\headheight}{13.6pt}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
   \let\headrule\relax
   \fancyhead[OL]{\textsc{\sffamily\nouppercase\leftmark}}
   \fancyhead[OR]{\sffamily\thepage}
   \fancyhead[ER]{\textsc{\sffamily\nouppercase\rightmark}}
   \fancyhead[EL]{\sffamily\thepage}
   \lfoot{}\cfoot{}\rfoot{}

\RequirePackage[most]{tcolorbox}
\RequirePackage{tikz,fontawesome5}
\usetikzlibrary{arrows,tikzmark,patterns,calc}
\RequirePackage{fadingimage}
\tikzset{>=stealth',
every picture/.append style={
    line join=round,
    line cap=round,
    thick
  }
}

\RequirePackage{datetime}\yyyymmdddate
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\cover#1{\gdef\@cover{#1}}
\def\bioinfo#1{\gdef\@bioinfo{#1}}
\def\press#1{\gdef\@press{#1}}
\RequirePackage{anyfontsize}
\def\HUGE{\@setfontsize\HUGE{40}{50}}
\def\HUge{\@setfontsize\HUGE{35}{45}}

\renewcommand*\maketitle
{
\begin{titlepage}
    \newgeometry{margin = 0 in}
    \ifcsname @cover\endcsname
    \UPFadingImage[trim={0 {.9\paperheight} 0 0},clip]{\@cover}
    \LOWFadingImage[trim={0 {.5\paperheight} 0 0},clip]{\@cover}
    \fi
    \parindent=0pt\vskip75\p@
    \centering\sffamily\bfseries
    \HUge\@title
    \ifcsname @subtitle\endcsname
    \vskip2ex\LARGE\@subtitle\fi
    \ifcsname @author\endcsname
    \vskip4ex\LARGE\@author\fi
    \ifcsname @bioinfo\endcsname
    \vskip2ex\Large\@bioinfo\fi
    \ifcsname @press\endcsname\vfill
    \parbox[t]{\textwidth}{\centering
        \Large\@press\vskip75\p@}\fi
    \clearpage
    \vspace*{\fill}
        \Huge\itshape\@title
    \vspace*{\fill}
    \restoregeometry
\end{titlepage}
}

\AtBeginDocument{
    \everymath{\displaystyle}
    \setlength{\abovedisplayskip}{3pt}
    \setlength{\belowdisplayskip}{3pt}
    \setcounter{tocdepth}{1}
}

\definecolor{pkgcolor}{Hsb}{103,.8,.5}
\definecolor{moducolor}{Hsb}{290,.8,.5}
\definecolor{cmdcolor}{Hsb}{188,.8,.5}
\RequirePackage[colorlinks,linkcolor=teal,urlcolor=pkgcolor]{hyperref}
\def\pkg#1{\texorpdfstring{\textcolor{pkgcolor}{
    \href{https://ctan.org/pkg/#1}{\textsf{#1}}}}{“#1”}}
\def\mode#1{\texorpdfstring{\textcolor{moducolor}{\textsf{#1}}}{“#1”}}
\def\cmd#1{\texorpdfstring{\textcolor{cmdcolor}{\textsf{#1}}}{“#1”}}

\RequirePackage{lipsum,hologo}
\RequirePackage{ifxetex}
\ifxetex
    \RequirePackage[quiet]{xeCJK}
    \RequirePackage[quiet,no-math]{fontspec}
    \RequirePackage{zhlipsum}
\fi

\def\hmmax{0}\def\bmmax{0}
\RequirePackage{amsmath,amssymb,amsthm,mathrsfs}
\RequirePackage[libertine,mono=false]{newtx}
\RequirePackage[e]{esvect}
\RequirePackage{physics2,bm,fixdif,derivative,cancel,extarrows,siunitx,nicefrac,nicematrix}
\usephysicsmodule{ab,braket,diagmat,doubleprod,xmat,ab.legacy,op.legacy}
\RequirePackage[e]{esvect}
\def\i{\mathrm i}\def\e{\mathrm e}\def\T{\mathsf T}

\theoremstyle{definition}
\newtheorem{definition}{\sffamily\color{pkgcolor} Definition}[section]
\newtheorem{theorem}{\sffamily\color{moducolor} Theorem}[section]
\newtheorem{lemma}{\sffamily\color{moducolor} Lemma}[section]
\newtheorem{corollary}{\sffamily\color{moducolor}Corollary}[section]
\newtheorem{postulate}{\sffamily\color{moducolor}Postulate}[section]
\newtheorem{axiom}{\sffamily\color{moducolor}Axiom}[section]
\newtheorem{proposition}{\sffamily\color{cmdcolor}Proposition}[section]
\newtheorem*{example}{\sffamily Example}
\newtheorem{problem}{\sffamily Problem}[chapter]
\def\theproblem{\arabic{problem}}
\newtheorem*{solution}{\sffamily Solution}
\numberwithin{equation}{section}