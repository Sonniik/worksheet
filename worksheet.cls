%
% @author Soňa Husáková <so.husakova@gmail.com>
% @date 8.12.2021
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{worksheet}

% -- Create new options --
% show solution if wanted
%\newif\if@hassolution \@hassolutionfalse
%\DeclareOption{solution}{\@hassolutiontrue}
\newif\ifhassolution \hassolutionfalse
\DeclareOption{solution}{\hassolutiontrue}

% -- inherit from article class --
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[10pt]{article}


% -- Load packages --
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern} % specify used font
\RequirePackage[
	pdftex,
	margin=2cm,
	a4paper,
	headsep=0.8cm,
	headheight=14pt]{geometry}
\RequirePackage{fancyhdr} % enable changing header and footer
\RequirePackage{lastpage} % get number of pages
\RequirePackage[
	pdfusetitle,
	pdfproducer={Latex, or other tool},
	pdfcreator={pdflatex, or other tool}
]{hyperref} % create links in file


\RequirePackage{graphics}
\graphicspath{{graphics}}

% -- define problem parts --
\newcommand\@probtask{Problem task}
\newcommand\probtask[1]{\renewcommand\@probtask{#1}}

\newcommand\@probsolution{Problem solution}
\newcommand\probsolution[1]{\renewcommand\@probsolution{#1}}

\newlength\@probsolskip
\setlength\@probsolskip{144pt plus 12pt minus 12pt}
\newcommand\probsolskip[1]{\setlength\@probsolskip{#1}}

\newcounter{probnumber}
\setcounter{probnumber}{0}

\newcommand\problem[1]{
	\input{#1}
	\begin{enumerate}
		\setcounter{enumi}{\theprobnumber}
		\item\textsl{\@probtask}
	\end{enumerate}
	\stepcounter{probnumber}
	\ifhassolution
		\noindent\@probsolution\par\medskip
	\else
		\vspace{\@probsolskip}
	\fi
}


% -- specify header and footer --
\fancyhf{}
\ifhassolution
	\fancyhead[R]{\bfseries Vzorové řešení}
	\fancyhead[L]{\parbox{0.8\textwidth}{\bfseries\@title}}
	\fancyfoot[C]{\thepage/\pageref{LastPage}}
	\pagestyle{fancy}

	\fancypagestyle{titlepage}{
		\renewcommand{\headrulewidth}{0pt}%
		\fancyhead[L]{}
	}
\else
	\fancyhead[R]{Hodnocení:\hspace{1.25cm}}
	\fancyhead[L]{Jm\'eno:}
	\fancyhead[C]{\parbox{0.45\textwidth}{\centering\bfseries\@title}}
	\fancyfoot[C]{\thepage/\pageref{LastPage}}
	\pagestyle{fancy}

	\fancypagestyle{titlepage}{
		\renewcommand{\headrulewidth}{0pt}%
		\fancyhead[L]{}
	}
\fi

\renewcommand{\theenumiii}{\Roman{enumiii}}
