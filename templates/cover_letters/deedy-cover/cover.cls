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
\usepackage[hmargin=2.3cm, vmargin=2.3cm]{geometry}
\usepackage[hidelinks]{hyperref}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage{titlesec}
\usepackage[absolute]{textpos}
\usepackage{fontspec,xltxtra,xunicode}

% Publications
\usepackage{cite}
\renewcommand\refname{\vskip -1.5cm}

% Color definitions
\definecolor{date}{HTML}{333333}
\definecolor{primary}{HTML}{000000}
\definecolor{headings}{HTML}{000000}
\definecolor{subheadings}{HTML}{000000}

% Set main fonts
\setmainfont[Color=primary, Path = OpenFonts/fonts/lato/,BoldItalicFont=Lato-RegIta,BoldFont=Lato-Reg,ItalicFont=Lato-LigIta]{Lato-Lig}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = OpenFonts/fonts/raleway/]{Raleway-ExtraLight}

% Date command
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\newcommand{\lastupdated}{\begin{textblock}{60}(155,5)
\color{date}\fontspec[Path = OpenFonts/fonts/raleway/]{Raleway-ExtraLight}\fontsize{8pt}{10pt}\selectfont 
Last Updated on \today
\end{textblock}}

% Name command
\newcommand{\namesection}[3]{
\begin{center}
{\fontsize{40pt}{48pt}\fontspec[Path = OpenFonts/fonts/lato/]{Lato-Hai}\selectfont #1 \fontspec[Path = OpenFonts/fonts/lato/]{Lato-Lig}\selectfont #2}\par\vspace{5pt}
{\color{headings}\fontspec[Path = OpenFonts/fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{14pt}\selectfont #3}\par\vspace{10pt}
\end{center}
}

% Section seperators
\titlespacing{\section}{0pt}{0pt}{0pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\newcommand{\sectionsep}{\vspace{8pt}}

% Headings command
\titleformat{\section}{\color{headings}
\scshape\fontspec[Path = OpenFonts/fonts/lato/]{Lato-Lig}\fontsize{16pt}{24pt}\selectfont \raggedright\uppercase}{}{0em}{}

% Subeadings command
\titleformat{\subsection}{
\color{subheadings}\fontspec[Path = OpenFonts/fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase}{}{0em}{}

\newcommand{\runsubsection}[1]{
\color{subheadings}\fontspec[Path = OpenFonts/fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase {#1} \normalfont}

% Descriptors command
\newcommand{\descript}[1]{
\color{subheadings}\raggedright\scshape\fontspec[Path = OpenFonts/fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont {#1 \\} \normalfont}

% Location command
\newcommand{\location}[1]{
\color{headings}\raggedright\fontspec[Path = OpenFonts/fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {#1\\} \normalfont}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{
\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}
{\end{itemize}\vspace{-\topsep}}

% Cover Letter
\newcommand{\companyname}[1]{{\color{headings}\raggedright\fontspec[Path = OpenFonts/fonts/lato/]{Lato-Bol}\fontsize{12pt}{14pt}\selectfont\relax #1\par}\vspace{2pt}}

\newcommand{\companyaddress}[1]{{\color{primary}\raggedright\fontspec[Path = OpenFonts/fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont\relax #1\par}\vspace{4pt}}

\newcommand{\currentdate}[1]{{\color{primary}\raggedleft\fontspec[Path = OpenFonts/fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont\relax #1\par}}

\newcommand{\lettertitle}[1]{{\color{headings}\raggedright\fontspec[Path = OpenFonts/fonts/lato/]{Lato-Bol}\fontsize{12pt}{14pt}\selectfont\relax #1\par}\vspace{6pt}}

% Letter content command
\newcommand{\lettercontent}[1]{{\color{primary}\raggedright\fontspec[Path = OpenFonts/fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont\relax #1\par}\vspace{8pt}}

\newcommand{\closing}[1]{{\color{primary}\raggedright\fontspec[Path = OpenFonts/fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont\relax #1\par}\vspace{6pt}}

\newcommand{\signature}[1]{{\color{primary}\raggedright\fontspec[Path = OpenFonts/fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont\relax #1\par}}