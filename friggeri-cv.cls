 \ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

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

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont[]{Helvetica Neue}
\newfontfamily\thinfont[]{Helvetica Neue Light}
\newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica Neue Light}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
	\fontsize{14pt}{24pt}\selectfont%
	\thinfont%
	\color{white}%
}

\newcommand{\header}[3]{%
	\begin{tikzpicture}[remember picture,overlay]
		\node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=1.8cm] (box) at (current page.north){};
		\node [anchor=center] (name) at (box) {%
			\fontsize{30pt}{72pt}\color{header}%
			{\thinfont #1}{\bodyfont  #2}
		};
	\end{tikzpicture}
	\vspace{0.75cm}
	\vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
	{%
		\color{%
			\ifcase\value{colorCounter}%
				blue\or%
				red\or%
				orange\or%
				green\or%
				purple\or%
				brown\else%
				headercolor\fi%
			} #1#2#3%
		}%
		\stepcounter{colorCounter}%
	}
	
\renewcommand{\section}[1]{
	{%
		\large\headingfont\color{headercolor}%
		\@sectioncolor #1%
		\vspace{-1\parskip}
	}
}

\pagestyle{empty}
	
	
%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%
\RequirePackage{longtable}

\setlength{\tabcolsep}{0pt}
\newenvironment{sectionlist}{%
	\setlength\LTright{11.5cm}
	\begin{longtable}{@{\extracolsep{\fill}}ll}
		}{% 
	\end{longtable}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
	\parbox[t]{14.3cm}{%
		\textbf{#2}%
		\hfill%
		{\footnotesize\addfontfeature{Color=gray} #1}\\%
		\textbf{#3}\\%
		#4\vspace{1.5\parsep}%
		}\\}
	
\newcommand{\education}[3]{%
	\parbox[t]{14.3cm}{%
		\textbf{#2}%
		\hfill%
		{\footnotesize\addfontfeature{Color=gray} #1}\\%
		#3\\%
	}\\}
	
%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{0.62cm}
\newenvironment{aside}{%
	\let\oldsection\section
	\renewcommand{\section}[1]{
		\par\vspace{\parsep}{\large\headingfont\color{headercolor} ##1}
	}
	\begin{textblock}{3.75}(1.0, 3.85)
		\begin{flushright}
			\obeycr
			}{%
			\restorecr
		\end{flushright}
	\end{textblock}
	\let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=5.6cm,top=1.8cm,right=1.5cm,bottom=2cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
