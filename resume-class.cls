 \NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume-class}
\LoadClass{article}

\RequirePackage{xcolor}
\RequirePackage{fontspec}
\RequirePackage{unicode-math}
\RequirePackage{tikz}
\RequirePackage{fontawesome}
\RequirePackage{parskip}
\RequirePackage{longtable}
\RequirePackage[left=2.5cm,top=2.5cm,right=2.5cm,bottom=2cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}

\pagestyle{empty}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\definecolor{white}{RGB}{255,255,255}
\definecolor{black}{RGB}{0,0,0}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\colorlet{fillheader}{gray}
\colorlet{header}{white}

\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\newfontfamily\bodyfont[]{Helvetica Neue}
\newfontfamily\thinfont[]{Helvetica Neue Light}
\newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica Neue Light}


%%%%%%%%%%
% Header %
%%%%%%%%%%

\newcommand{\rolefont}{
	\fontsize{14pt}{16pt}\selectfont
	\thinfont
	\color{white}
}

\newcommand{\header}[5]{
	\begin{tikzpicture}[remember picture,overlay]
		\node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=2.5cm] (box) at (current page.north){};
		\node [anchor=center, align=center] (name) at (box) {
			\fontsize{30pt}{36pt}\color{header}
			\thinfont #1 \bodyfont #2 
			\\
			\fontsize{10pt}{12pt}\color{header}
			\thinfont \faEnvelopeO  \hspace{0.25em} #3 | 
			\href{https://github.com/#5}{\faGithubSquare   \hspace{0.25em} #4} | 
			\href{https://www.linkedin.com/in/#4}{\faLinkedinSquare  \hspace{0.25em} #5}
		};
	\end{tikzpicture}
	\vspace{0.5cm}
	\vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{
	{
		\color{
			\ifcase\value{colorCounter}
				blue\or
				red\or
				orange\or
				green\or
				purple\or
				brown\else
				headercolor\fi
			} #1#2#3%
		}%
		\stepcounter{colorCounter}%
	}
	
\renewcommand{\section}[1]{
	{
		\large\headingfont\color{headercolor}
		\@sectioncolor #1
		\vspace{-1\parskip}
	}
}
	
	
%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{sectionlist}{
	\setlength\LTright{11.5cm}
	\begin{longtable}{@{\extracolsep{\fill}}ll}}{
	\end{longtable}
}

\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{
	\parbox[t]{\textwidth}{
		\textbf{#2}
		\hfill
		{\footnotesize\addfontfeature{Color=gray} #1}\\
		\textbf{#3}\\
		#4\vspace{1.5\parsep}
		}\\}
	
\newcommand{\education}[3]{
	\parbox[t]{\textwidth}{
		\textbf{#2}
		\hfill
		{\footnotesize\addfontfeature{Color=gray} #1}\\
		#3\\
	}\\}
