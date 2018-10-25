% -- Encoding UTF-8 without BOM

\ProvidesClass{cv-style}[2015/02/27 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{espanol}{\def\@cv@espanol{}}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%----------------------------------------------------------------------------------------
% Colors %
%----------------------------------------------------------------------------------------

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5A5A5A}
\definecolor{black}{HTML}{000000}
\definecolor{lightgray}{HTML}{818181}
\definecolor{midgray}{HTML}{787878}
\definecolor{darkteal}{HTML}{03434B}
\definecolor{teal}{HTML}{056571}
\definecolor{lightteal}{HTML}{50939B}
\definecolor{dark}{HTML}{565656}
\definecolor{light}{HTML}{f7f7f7}
\definecolor{maroon}{HTML}{711105}
\definecolor{seafoam}{HTML}{5AA2AA}
\definecolor{date}{HTML}{A4A4A4}


%%% Grayscale
% \colorlet{secondary}{black}
% \colorlet{tertiary}{black}
% \colorlet{linc}{black}
% \colorlet{header}{black}
% \colorlet{fillheader}{white}
% \colorlet{textcolor}{black}
% \colorlet{headercolor}{black}

%%% Teal palette
\colorlet{secondary}{darkteal}
\colorlet{tertiary}{teal}
\colorlet{linc}{lightteal}
\colorlet{header}{white}
\colorlet{fillheader}{teal}
\colorlet{textcolor}{darkgray}
\colorlet{headercolor}{darkteal}



%----------------------------------------------------------------------------------------
% Fonts %
%----------------------------------------------------------------------------------------

\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}
\newfontfamily\bodyfont{Roboto-Regular}[Path=fonts/]
\newfontfamily\bodyfontitreg{Roboto-Italic}[Path=fonts/]
\newfontfamily\bodyfontit{Roboto-LightItalic}[Path=fonts/]
\newfontfamily\bodyfontbfit{Roboto-BoldItalic}[Path=fonts/]
\newfontfamily\thinfont{Roboto-Thin}[Path=fonts/]
\newfontfamily\headingfont{RobotoCondensed-Bold}[Path=fonts/]
\newfontfamily\headingit{RobotoCondensed-BoldItalic}[Path=fonts/]

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor, Path = fonts/]{Roboto-Light}

\newcommand{\bodycolor}[1]{%
  {\color{secondary}\bodyfont #1}%
}

\newcommand{\italicasecond}[1]{%
    {\color{secondary}\bodyfontit #1}%
}

\newcommand{\italicasecondbf}[1]{%
    {\color{secondary}\headingit #1}%
}

\newcommand{\italicabodycolor}[1]{%
    {\color{secondary}\bodyfontitreg #1}%
}

\newcommand{\italica}[1]{%
    {\color{gray}\bodyfontit #1}%
}
%----------------------------------------------------------------------------------------
% Header %
%----------------------------------------------------------------------------------------

\RequirePackage{tikz}

\newcommand{\header}[2]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=2cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{65pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
  \end{tikzpicture}
  \vspace{1cm}
  \vspace{-2\parskip}
}

%----------------------------------------------------------------------------------------
%	Last updated command %
%----------------------------------------------------------------------------------------

\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{polyglossia}

\newcommand{\sethyphenation}[3][]{%
  \sbox0{\begin{otherlanguage}[#1]{#2}
    \hyphenation{#3}\end{otherlanguage}}}
%\sethyphenation[<options>]{<language>}{<list of words separated by spaces>}

\ifdefined\@cv@espanol
  \setdefaultlanguage{spanish}
  \def\lastupdatedtext{Última Actualización el}
\else
  \setdefaultlanguage[variant=british]{english}
  \def\lastupdatedtext{Last Updated on}
\fi

\setlength{\TPHorizModule}{0.01\paperwidth}
\setlength{\TPVertModule}{0.01\paperwidth}

\newcommand{\lastupdated}{ 
  \begin{textblock}{10}(9, 27)
    \raggedleft
    \fontsize{8pt}{10pt}\color{date}\thinfont 
    \lastupdatedtext{} \today
  \end{textblock}}

%----------------------------------------------------------------------------------------
% Structure %
%----------------------------------------------------------------------------------------
\RequirePackage{parskip}

% \newcounter{colorCounter}
\def\@sectioncolor{%
    \color{headercolor}%
%   \stepcounter{colorCounter}%
}

\def\@subsectioncolor{%
    \color{tertiary}%
%   \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  {\par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}}
}



\renewcommand{\subsection}[1]{
  {\par\vspace{.1\parskip}
  {%
    \Large\headingfont\color{tertiary}%
    \@subsectioncolor #1%
  }
  \par\vspace{.25\parskip}}
}


\newcommand{\jobtitle}[1]{%
    {\color{gray}\bodyfontit #1}%
}

\pagestyle{empty}

%----------------------------------------------------------------------------------------
% List environment %
%----------------------------------------------------------------------------------------
\RequirePackage{longtable}
\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \setlength{\LTpre}{5pt}
  \setlength{\LTpost}{0pt}
  \setlength\LTleft{0pt}
  \setlength\LTright{0pt}
  \begin{longtable}{@{\extracolsep{\fill}}ll}
}{%
  \end{longtable}
}
\renewcommand{\bfseries}{\headingfont\color{secondary}}
\newcommand{\entry}[5]{%
  #2&\parbox[t]{#1cm}{%
    \textbf{#3}%
    \hfill%
    {\footnotesize\addfontfeature{Color=secondary} #4}\\%
    #5\vspace{\parsep}%
  }\\}
%----------------------------------------------------------------------------------------
% Side block %
%----------------------------------------------------------------------------------------
\TPMargin{.2cm}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{secondary} ##1}
  }
    \renewcommand{\subsection}[1]{
    \par\vspace{\baselineskip}{\large\headingfont\color{tertiary} ##1}
  }
  \begin{textblock}{5.3}(.5, 2.01)
 
  \textblockcolour{light}
  \begin{flushleft}
  \obeycr
}{%
  \restorecr
  \end{flushleft}
  \end{textblock}
  \let\section\oldsection
}

%----------------------------------------------------------------------------------------
% Other tweaks %
%----------------------------------------------------------------------------------------

\RequirePackage[left=6.5cm,top=1cm,right=1.5cm,bottom=1cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\hypersetup{
    pdftitle={CV/Resume \textbar{} Tara Furstenau},
    pdfauthor={Tara Furstenau},
    pdfsubject={CV/Resume},
    colorlinks=true,
    urlcolor=linc
    }