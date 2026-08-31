% Intro Options
\ProvidesClass{cover}[2024/04/30 Cover letter class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

% Package Imports
\usepackage[hmargin=2.0cm, vmargin=1.8cm]{geometry}
\usepackage[hidelinks]{hyperref}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage{titlesec}
\usepackage[absolute]{textpos}
\usepackage{fontspec}

% Color definitions
\definecolor{date}{HTML}{333333}
\definecolor{primary}{HTML}{000000}
\definecolor{headings}{HTML}{000000}
\definecolor{subheadings}{HTML}{000000}

% Set main font to Palatino (TeX Gyre Pagella) matching the CV template
\setmainfont{texgyrepagella}[
  Path = /usr/share/texmf/fonts/opentype/public/tex-gyre/ ,
  Extension = .otf ,
  UprightFont = *-regular ,
  BoldFont = *-bold ,
  ItalicFont = *-italic ,
  BoldItalicFont = *-bolditalic
]

% Date command
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\newcommand{\lastupdated}{\begin{textblock}{60}(155,5)
\color{date}\fontsize{8pt}{10pt}\selectfont 
Last Updated on \today
\end{textblock}}

% Name command
\newcommand{\namesection}[3]{
\begin{center}
{\fontsize{30pt}{36pt}\scshape\bfseries #1 #2}\par\vspace{4pt}
{\color{headings}\fontsize{10.5pt}{14pt}\selectfont #3}\par\vspace{10pt}
\end{center}
}

% Section separators
\titlespacing{\section}{0pt}{0pt}{0pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\newcommand{\sectionsep}{\vspace{8pt}}

% Headings command
\titleformat{\section}{\color{headings}
\scshape\fontsize{14pt}{18pt}\selectfont \raggedright\uppercase}{}{0em}{}

% Subheadings command
\titleformat{\subsection}{
\color{subheadings}\fontsize{11pt}{13pt}\selectfont\bfseries\uppercase}{}{0em}{}

\newcommand{\runsubsection}[1]{
\color{subheadings}\fontsize{11pt}{13pt}\selectfont\bfseries\uppercase {#1} \normalfont}

% Descriptors command
\newcommand{\descript}[1]{
\color{subheadings}\raggedright\scshape\fontsize{10.5pt}{13pt}\selectfont {#1 \\} \normalfont}

% Location command
\newcommand{\location}[1]{
\color{headings}\raggedright\fontsize{10pt}{12pt}\selectfont {#1\\} \normalfont}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{
\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}
{\end{itemize}\vspace{-\topsep}}

% Cover Letter Commands matching CV Palatino styling
\newcommand{\companyname}[1]{{\color{headings}\raggedright\bfseries\fontsize{11.5pt}{15.5pt}\selectfont\relax #1\par}\vspace{2pt}}

\newcommand{\companyaddress}[1]{{\color{primary}\raggedright\fontsize{11pt}{15pt}\selectfont\relax #1\par}\vspace{5pt}}

\newcommand{\currentdate}[1]{{\color{primary}\raggedleft\fontsize{11pt}{15pt}\selectfont\relax #1\par}}

\newcommand{\lettertitle}[1]{{\color{headings}\raggedright\scshape\bfseries\fontsize{11.5pt}{15.5pt}\selectfont\relax #1\par}\vspace{8pt}}

% Letter content command with generous leading
\newcommand{\lettercontent}[1]{{\color{primary}\raggedright\fontsize{11pt}{15.5pt}\selectfont\relax #1\par}\vspace{8pt}}

\newcommand{\closing}[1]{{\color{primary}\raggedright\fontsize{11pt}{15.5pt}\selectfont\relax #1\par}\vspace{6pt}}

\newcommand{\signature}[1]{{\color{primary}\raggedright\fontsize{11pt}{15.5pt}\selectfont\relax #1\par}}
