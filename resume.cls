\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2015/05/25 An elegant Résumé class]
\LoadClass[11pt]{article}

% disable indent globally
\setlength{\parindent}{0pt}
% some general improvements, defines the XeTeX logo
\RequirePackage{xltxtra}
% use xifthen
\RequirePackage{xifthen}
% use hyperlink for email and url
\RequirePackage{hyperref}
\hypersetup{hidelinks}
\RequirePackage{url}
\urlstyle{tt}
% use fontawesome
% \RequirePackage{fontawesome}
% use xcolor for customizing color
%\RequirePackage[usenames,dvipsnames]{xcolor}
% loading fonts
\RequirePackage{fontspec}
% Main document font
\setmainfont[
  Path = fonts/Main/ ,
  Extension = .otf ,
  UprightFont = *-regular ,
  BoldFont = *-bold ,
  ItalicFont = *-italic ,
  BoldItalicFont = *-bolditalic ,
  SmallCapsFont = Fontin-SmallCaps
]{texgyretermes}

\RequirePackage[
	a4paper,
	left=0.6in,
	right=0.6in,
	top=0.35in,
	bottom=0.5in,
  columnsep=0.75cm,
	nohead
]{geometry}

\RequirePackage{titlesec}
\RequirePackage{enumitem}
\setlist{noitemsep} % removes spacing from items but leaves space around the whole list
\setlist{nosep} % removes all vertical spacing within and around the list
\setlist[itemize]{topsep=0.25em, leftmargin=1.5pc}
\setlist[enumerate]{topsep=0.25em, leftmargin=1.5pc}
\RequirePackage[super]{nth}

\titleformat{\section}         % Customise the \section command 
  {\Large\scshape\raggedright\color{verdeolivo}} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [\titlerule]                 % Inserts a horizontal line after the heading
\titlespacing*{\section}{0cm}{*1.8}{*1.8}

\titleformat{\subsection}
  {\large\raggedright}
  {}{0em}
  {}
\titlespacing*{\subsection}{0cm}{*1.8}{*0.6}

\newcommand{\datedsection}[2]{%
  \section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{%
  \subsection[#1]{#1 \hfill #2}%
}
\newcommand{\datedline}[2]{%
  {\par #1 \hfill #2 \par}%
}

\newcommand{\name}[1]{
  \leftline{\Huge\scshape{#1}}
  % {\Huge\scshape{#1}}\\
  \vspace{1.5ex}
}

% defines one's name
% usage: \name{<name>}
\newcommand{\nameTest}[1]{
  {\large\scshape{#1}}
}


\usepackage{xcolor}
\definecolor{bordercolor}{HTML}{A0A0A0} % 深灰色
\definecolor{bgcolor}{HTML}{F0F0F0}     % 浅灰色


% Fork v1.6.5c: A parser for several tags that will reutilize the cvtag component in a less verbose way
\newcommand{\cvtags}[1]{%
  \foreach \tagValue in {#1} {%
      \cvtag{\tagValue}
  }
}

% Fork (before v1.6.5a): Tags now have a more consistent vertican and horizontal separation
% \newcommand{\cvtag}[1]{%
%   \tikz[baseline]\node[anchor=base,draw=body,rounded corners,inner xsep=1ex,inner ysep=0.55ex,text height=1.5ex,text depth=-0.05ex]{#1};
%   \vspace{0.25ex}
% }

\newcommand{\cvtag}[1]{%
  \tikz[baseline]\node[anchor=base,draw=bordercolor,fill=bgcolor,rounded corners,inner xsep=1ex,inner ysep=0.55ex,text height=1.5ex,text depth=-0.05ex]{#1};
  \vspace{0.25ex}
}

\newenvironment{sloppypar*}{\sloppy\ignorespaces\raggedright}{\par}

% defines one's email
% usage: \email{<email>}
\newcommand{\email}[1]{\large{\color{verdeolivo}\faEnvelope}\ \href{mailto:#1}{#1}}
% defines one's phone
% usage: \phone{<phone>}
\newcommand{\phone}[1]{\large{\color{verdeolivo}\faIcon{phone}} \ {#1}}

\newcommand{\institution}[1]{\large{\color{verdeolivo}\faIcon{landmark}} \ {#1}}
% defines one's linkedin
% usage: \linkedin{<linkedin>}
\newcommand{\linkedin}[2][]{\faLinkedin\ 
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}
\newcommand{\linkedinsquare}[2][]{\faLinkedinSquare\ 
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}
% defines one's GitHub
% usage: \github{<github>}
\newcommand{\github}[2][]{\faGithub\ 
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}
% defines one's homepage
% usage: \homepage{<homepage>}
\newcommand{\homepage}[2][]{\faLink\ 
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}

\newcommand{\basicInfo}[1]{
  \leftline{\sffamily\large{#1}}
  \vspace{1.5ex}
}

\newcommand{\role}[2]{
  {\par \textit{#1} ~ #2 \par}
  \vspace{0.85ex}
}

\newcommand{\cvskill}[2]{
  \textcolor{black}{#1}\hfill
  \foreach \x in {1,...,5}{%
    \space{\ifnumgreater{\x}{#2}{\color{black!80!white!20}}{\color{verdeolivo}}\faSquare}}\par%
  \vspace{-2pt}
}

