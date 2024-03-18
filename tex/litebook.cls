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
\ProvidesClass{litebook}[2024/03/18 v0.2a LiteBook document class]
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=LITE, prefix=LITE@, setkeys=\kvsetkeys}
\def\ekv#1{\kvsetkeys{LITE}{#1}}

\DeclareStringOption[newtx]{math}
\DeclareVoidOption{newtx}{\ekv{math=newtx}}
\DeclareVoidOption{mtpro2}{\ekv{math=mtpro2}}

\DeclareStringOption[mdframed]{thmstyle}
\DeclareVoidOption{mdframed}{\ekv{thmstyle=mdframed}}
\DeclareVoidOption{amsthm}{\ekv{thmstyle=amsthm}}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax
\LoadClass[letterpaper,11pt,openany]{book}

\RequirePackage{geometry,indentfirst,setspace,enumitem,booktabs,tabularx,diagbox,multicol,multirow}
\geometry{lmargin = .8 in,rmargin = 1.2 in,tmargin= 1 in,bmargin= 1 in}
\setlength{\headheight}{13.6pt}

\RequirePackage{lipsum,hologo}
\hologoFontSetup{general=\sffamily}
\RequirePackage{ifxetex}
\ifXeTeX
  \RequirePackage[quiet]{xeCJK}
  \RequirePackage[quiet,no-math]{fontspec}
  \RequirePackage{zhlipsum}
  \setlength{\parindent}{2em}
\else
  \setlength{\parindent}{2ex}
\fi

\RequirePackage{graphics,graphicx}
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

\RequirePackage[labelsep=period,labelfont={bf,sf},font=small]{caption}
\RequirePackage[nokeyprefix]{refstyle}
\newref{eq}{refcmd=(\ref{#1}),name={\sffamily Eq.~}}
\newref{fig}{name={\sffamily\bfseries Figure~}}
\newref{tab}{name={\sffamily\bfseries Table~}}

\RequirePackage{tocloft}
\setlength{\cftbeforetoctitleskip}{6\p@}
\setlength{\cftaftertoctitleskip}{24\p@}
\setlength{\cftbeforesecskip}{3\p@}
\def\contentsname{\sffamily\scshape\hfill Contents\hfill}
\setcounter{tocdepth}{1}

\def\@makechapterhead#1{%
  \vspace*{\p@}{%
  \parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
            \if@mainmatter
        \parbox{1 in}
        {\centering\HUGE\normalfont\bfseries\textcolor{darkgray}\thechapter\vskip10\p@\normalsize\bfseries\textcolor{darkgray}{\bfseries\sffamily\scshape \@chapapp}}%
        \tikz[baseline,overlay]
          \draw[line width=3pt,dotted,dash pattern=on 0pt off 8pt, gray](0,-.8)--(0,1.2);
            \fi
    \fi
    \interlinepenalty\@M\hspace*{2em}
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

\let\cleardoublepage=\clearpage
\makeatletter
\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
  \vspace*{\fill}
    {\centering\itshape\Large This page was intentionally left blank.\par}
  \vspace{\fill}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
  \fancyhead[OL]{\textsc{\sffamily\nouppercase\leftmark}}
  \fancyhead[OR]{\sffamily\thepage}
  \fancyhead[ER]{\textsc{\sffamily\nouppercase\rightmark}}
  \fancyhead[EL]{\sffamily\thepage}
  \lfoot{}\cfoot{}\rfoot{}

\RequirePackage{tikz}
\usetikzlibrary{arrows,tikzmark,patterns,calc}
\RequirePackage{fadingimage}
\tikzset{>=stealth',
every picture/.append style={%
    line join=round,
    line cap=round,
    thick
  }
}

\RequirePackage[fixed]{fontawesome5}
\AddToHook{cmd/faIcon/before}{%
  \begingroup\fontsize{\fpeval{\f@size*.9}}{0}\selectfont
}
\AddToHook{cmd/faIcon/after}{\endgroup}

\RequirePackage[svgnames]{xcolor}
\definecolor{pkgcolor}{Hsb}{103,.8,.5}
\definecolor{moducolor}{Hsb}{290,.8,.5}
\definecolor{cmdcolor}{Hsb}{188,.8,.5}
\RequirePackage[colorlinks,linkcolor=cmdcolor,urlcolor=pkgcolor]{hyperref}
\def\pkg#1{\texorpdfstring{\textcolor{pkgcolor}{%
    \href{https://ctan.org/pkg/#1}{\textsf{#1}}}}{“#1”}}
\def\mode#1{\texorpdfstring{\textcolor{moducolor}{\textsf{#1}}}{“#1”}}
\def\cmd#1{\texorpdfstring{\textcolor{cmdcolor}{\textsf{#1}}}{“#1”}}

\RequirePackage{datetime}\yyyymmdddate
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\cover#1{\gdef\@cover{#1}}
\def\bioinfo#1{\gdef\@bioinfo{#1}}
\def\press#1{\gdef\@press{#1}}
\RequirePackage{anyfontsize}
\def\HUGE{\@setfontsize\HUGE{40}{50}}
\def\HUge{\@setfontsize\HUGE{35}{45}}

\renewcommand*\maketitle{%
\begin{titlepage}
  \newgeometry{margin = 0 in}
    \ifcsname @cover\endcsname
      \@cover\vskip75\p@
    \else
      \vspace*{75\p@}
    \fi
    \parindent=0pt
    \centering\sffamily\bfseries
    \HUge\@title\normalfont
    \ifcsname @subtitle\endcsname
      \vskip2ex\LARGE\sffamily\bfseries\@subtitle\normalfont\fi
    \ifcsname @author\endcsname
      \vskip4ex\LARGE\sffamily\bfseries\@author\normalfont\fi
    \ifcsname @bioinfo\endcsname
      \vskip2ex\Large\sffamily\bfseries\@bioinfo\normalfont\fi
    \ifcsname @press\endcsname\vfill
      \parbox[t]{\textwidth}{\centering
        \sffamily\bfseries\large\@press\normalfont\vskip75\p@}\fi
    \clearpage
    \vspace*{\fill}\normalfont
      {\centering \Huge\sffamily\bfseries\itshape\@title\par}
    \vspace{\fill}
  \restoregeometry
\end{titlepage}}

\ifdefstring{\LITE@math}{mtpro2}{%
  \RequirePackage{amssymb}
  \let\Bbbk\relax
  \RequirePackage[mtpscr,mtpccal,mtpfrak]{mtpro2}
  \RequirePackage[mono=false]{libertine}
}{\relax}

\ifdefstring{\LITE@math}{newtx}{%
  \RequirePackage[libertine,mono=false]{newtx}
}{\relax}

\let\openbox\relax\def\hmmax{0}\def\bmmax{0}
\RequirePackage{physics2,bm,fixdif,derivative,cancel,extarrows,siunitx,nicefrac,nicematrix}
\usephysicsmodule{ab,braket,diagmat,doubleprod,xmat,ab.legacy,op.legacy}
\RequirePackage[e]{esvect}
\def\i{\mathrm i}\def\e{\mathrm e}\def\T{\mathsf T}
\numberwithin{equation}{section}

\RequirePackage{amsthm,mdframed,listofitems}
\setsepchar{;/,}\ignoreemptyitems
\theoremstyle{definition}
\def\th@definition{\thm@notefont{}\normalfont}
\readlist*\thmlist{%
  theorem,   lemma,        definition,   corollary, proposition, postulate, axiom,  remark;
  DarkGreen, MidnightBlue, MidnightBlue, Olive,     Olive,       Indigo,    Indigo, DarkRed
}
\ifnum \listlen\thmlist[1]<\listlen\thmlist[2]
  \def\thmnum{\listlen\thmlist[1]}
\else
  \def\thmnum{\listlen\thmlist[2]}
\fi

\ifdefstring{\LITE@thmstyle}{mdframed}{%
  \foreach \x in {1,...,\thmnum}{\expandafter\xdef\csname\x\x\endcsname{\noexpand
  \newmdtheoremenv[
    skipabove=0pt,          skipbelow=0pt,
    hidealllines=true,      leftline=true,
    linewidth=.5ex,         linecolor=\thmlist[2,\x],
    innerleftmargin=1.5ex,  innerrightmargin=0pt,
    innertopmargin=-1.5ex,  innerbottommargin=.5ex]
  {\thmlist[1,\x]}
  {\noexpand\color{\thmlist[2,\x]}\noexpand\sffamily\expandafter\MakeUppercase\expanded{\thmlist[1,\x]}}[chapter]
}}
}{\relax}

\ifdefstring{\LITE@thmstyle}{amsthm}{%
  \foreach \x in {1,...,\thmnum}{\expandafter\xdef\csname\x\x\endcsname{\noexpand
  \newtheorem
  {\thmlist[1,\x]}
  {\noexpand\color{\thmlist[2,\x]}\noexpand\sffamily\expandafter\MakeUppercase\expanded{\thmlist[1,\x]}}[chapter]
}}
}{\relax}

\foreach \x in {1,...,\thmnum}{\csname\x\x\endcsname}
\let\theremark=\relax

\newtheorem{example}{\sffamily\color{Teal} Example}[chapter]
\def\theexample{\arabic{example}}
\newtheorem{problem}{\sffamily Problem}[chapter]
\def\theproblem{\arabic{problem}}
\newtheorem*{solution}{\sffamily Solution}