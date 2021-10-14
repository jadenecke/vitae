\ProvidesClass{twentysecondcvMod}[2018/11/24 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

% Adapted for use with the Rmarkdown template by
% Rob J Hyndman. 24 November 2018

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{fontawesome}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
%\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
\RequirePackage{tabularx}
\RequirePackage{enumitem}
\RequirePackage[left=7.6cm,top=0.1cm,right=1cm,bottom=0.1cm,nohead,nofoot]{geometry}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\RequirePackage[export]{adjustbox}

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{2e2e2e}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{858585}

%----------------------------------------------------------------------------------------
%	 From AwesomeCV
%----------------------------------------------------------------------------------------
% Text colors
%\definecolor{darktext}{HTML}{414141}
\definecolor{awesome-red}{HTML}{DC3522}
%\definecolor{darkgray}{HTML}{333333}
%\definecolor{lightgray}{HTML}{999999}

\colorlet{text}{gray}
\colorlet{graytext}{maingray}
\colorlet{lighttext}{sidecolor}
\colorlet{awesome}{mainblue}
\colorlet{darktext}{gray}

% For elements of entry
\newcommand*{\entrytitlestyle}[1]{{\fontsize{5pt}{5pt}\bfseries\color{darktext} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{8pt}{1em}\scshape\color{graytext} #1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{8pt}{1em}\slshape\color{graytext} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{9pt}{1em}\slshape\color{awesome} #1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{7pt}{8pt}\upshape\color{text} #1}}
\newcommand*{\descriptionstylegray}[1]{{\fontsize{7pt}{8pt}\upshape\color{graytext} #1}}

% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}


%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\renewcommand{\bfseries}{\color{gray}} % Make \textbf produce coloured text instead
\def\endfirstpage{\newpage\newgeometry{left=1.5cm,top=1.5cm,right=1.5cm,bottom=1.5cm}}
\usepackage{fancyhdr}
\pagestyle{fancy}
\lfoot{\sf\textcolor[gray]{0.4}{Curriculum Vitae: \@name}}
\rfoot{\sf\textcolor[gray]{0.4}{\thepage}}
\cfoot{}
\def\headrule{}
\def\footrule{{\color[gray]{0.4}\hrule\@height\headrulewidth\@width\headwidth \vskip 3pt}}
\setlength{\parindent}{0pt} % Disable paragraph indentation


%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newlength{\TotalSectionLength} % Define a new length to hold the remaining line width after the section title is 
%printed
\newlength{\SectionTitleLength} % Define a new length to hold the width of the section title
\newcommand{\profilesection}[1]{%
	\setlength\TotalSectionLength{\linewidth}% Set the total line width
	\settowidth{\SectionTitleLength}{\huge #1 }% Calculate the width of the section title
	\addtolength\TotalSectionLength{-\SectionTitleLength}% Subtract the section title width from the total width
	\addtolength\TotalSectionLength{-2.22221pt}% Modifier to remove overfull box warning
	\vspace{8pt}% Whitespace before the section title
	{\color{black!80} \huge #1 \rule[0.15\baselineskip]{\TotalSectionLength}{1pt}}% Print the title and auto-width rule
}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvtwitter}[1]{\renewcommand{\cvtwitter}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}
\newcommand{\languages}[1]{\renewcommand{\languages}{#1}}
\newcommand{\skills}[1]{\renewcommand{\skills}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, 
		fill=mainblue,mainblue,text=white] (char) {#1};}}

% Command for printing skill progress bars
%\newcommand\skills[1]{
%	\renewcommand{\skills}{
%		\begin{tikzpicture}
%		\foreach [count=\i] \x/\y in {#1}{
%			\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
%			\draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.4);
%			\node [above right] at (0,\i+0.4) {\x};
%		}
%		\end{tikzpicture}
%	}
%}
%
%% Command for printing skills text
%\newcommand\skillstext[1]{
%	\renewcommand{\skillstext}{
%		\begin{flushleft}
%			\foreach [count=\i] \x/\y in {#1}{
%				\x$ \star $\y
%			}
%		\end{flushleft}
%	}
%}

%----------------------------------------------------------------------------------------
%	 SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
	\thispagestyle{empty}
	\begin{tikzpicture}[remember picture,overlay]
	\node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at 
	(-5cm,0.5cm){};
	\end{tikzpicture}
	
	%------------------------------------------------
	
	\begin{textblock}{6}(0.5, 0.2)
		
		%------------------------------------------------
		
		\ifthenelse{\equal{\profilepic}{}}{\vspace*{0.5cm}}{
			\begin{center}
				\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
				\clip (600/2, 567/2) circle (567/2);
				\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) 
				{\includegraphics[width=\imagewidth]{\profilepic}};
				\end{tikzpicture}
			\end{center}
		}
		
		%------------------------------------------------
		
		{\raggedright\huge\textcolor{mainblue}{\textbf{\cvname}}}
		
		%------------------------------------------------
		
		{\Large\color{black!80}\cvjobtitle}
		
		\ifthenelse{\equal{\cvdate}{}}{}{\cvdate}
		\vspace*{0.2cm}
		%------------------------------------------------
		
		\renewcommand{\arraystretch}{1.4}
		\begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
			\ifthenelse{\equal{\cvaddress}{}}{}{\Large\faicon{map-marker} & \cvaddress\\}
			\ifthenelse{\equal{\cvnumberphone}{}}{}{\Large\faicon{phone} & \cvnumberphone\\}
			\ifthenelse{\equal{\cvmail}{}}{}{\Large\faicon{envelope} & \cvmail\\}			
			\ifthenelse{\equal{\cvsite}{}}{}{\Large\faicon{home} & \cvsite\\}
			\ifthenelse{\equal{\cvtwitter}{}}{}{\Large\faicon{twitter} & \cvtwitter\\}
			\ifthenelse{\equal{\cvgithub}{}}{}{\Large\faicon{github} & \cvgithub\\}
			\ifthenelse{\equal{\cvlinkedin}{}}{}{\Large\faicon{linkedin} & \cvlinkedin}
		\end{tabular}
		
		%------------------------------------------------
		
		\ifthenelse{\equal{\aboutme}{}}{}{
			\profilesection{About me}
			\begin{flushleft}
				\aboutme
			\end{flushleft}
		}
		
		\ifthenelse{\equal{\languages}{}}{}{
			\profilesection{Languages}
			\begin{flushleft}
				\languages
			\end{flushleft}
		}
		
		\ifthenelse{\equal{\skills}{}}{}{
			\profilesection{Skills}
			\begin{flushleft}
				\skills
			\end{flushleft}
		}
		
		%		\ifx{\equal{\languages}{}}
		%			EMPTY\\
		%		\else
		%			\profilesection{Languages}
		%			\begin{flushleft}
		%				\languages
		%			\end{flushleft}
		%		\fi
		
		%------------------------------------------------
		
		%		\profilesection{Skills}
		
		%		\skills
		%		\skillstext
		%		\scriptsize
		%		(*)[The skill scale is from 0 (Fundamental Awareness) to 6 (Expert).]
		
		%------------------------------------------------
		
	\end{textblock}
	%\AddThispageHook{\newpage\restoregeometry}
}

%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

% Command to create the rounded boxes around the first three letters of section titles
\newcommand*\round[2]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle,% rounded corners,
	inner sep=1.6pt, minimum 
	size=5.5mm, text height=3.6mm, fill=#2,#2,text=white](char){#1};%
}

\newcounter{colorCounter}
\newcommand{\sectioncolor}[1]{%
	{%
		\round{#1}{
			\ifcase\value{colorCounter}%
			mainblue\or%
			mainblue\or%
			mainblue\or%
			mainblue\or%
			mainblue\or%
			mainblue\or%
			mainblue\or%
			mainblue\or%
			mainblue\or%
			mainblue\else%
			mainblue\fi%
		}%
	}%
	\stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
	{%
		\color{gray}%
		\Large\sectioncolor{#1}%
	}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\large\color{gray} #1%
	}
	\par\vspace{.25\parskip}%
}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}
%\renewcommand{\arraystretch}{.5}
% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
	}{%
	\end{tabular*}
}

%\renewcommand{\tabularxcolumn}[1]{m{#1}}
\newcommand{\twentyitem}[5]{%
	\ifempty{#5}{
		\ifempty{#2#4}{
			\setlength\tabcolsep{0pt}%
			%\setlength{\extrarowheight}{-4pt}%
			{\renewcommand{\arraystretch}{0.6}
				\begin{tabularx}{\textwidth}{Xr}
					\noindent\parbox[c]{\hsize}{\entrypositionstyle{#3}} & \entrydatestyle{#1}\vspace{2mm}\\
				\end{tabularx}
			}\\
		}{
			\setlength\tabcolsep{0pt}%
			%\setlength{\extrarowheight}{-4pt}%
			{\renewcommand{\arraystretch}{0.6}
				\begin{tabularx}{\textwidth}{Xr}
					\noindent\parbox[c]{\hsize}{\entrytitlestyle{#2}} & \entrylocationstyle{#4} \\
					\noindent\parbox[c]{\hsize}{\entrypositionstyle{#3}} &\entrydatestyle{#1}\vspace{2mm}\\
				\end{tabularx}
			}\\
		}
	}{
		\ifempty{#2#4}{
			\setlength\tabcolsep{3pt}%
			%\setlength{\extrarowheight}{2pt}%
			{\renewcommand{\arraystretch}{0.6}
				\begin{tabularx}{\textwidth}{Xr}
					\adjustbox{valign=t}{\noindent\parbox[c]{\hsize}{\entrytitlestyle{#3}}} & 
					\adjustbox{valign=t}{\entrydatestyle{#1}}\vspace{0.5mm}\\
					\multicolumn{2}{l}{\descriptionstylegray{#5}}\vspace{2mm}\\
				\end{tabularx}
			}\\
		}{
			\setlength\tabcolsep{0pt}%
			%\setlength{\extrarowheight}{-4pt}%
			{\renewcommand{\arraystretch}{0.6}
				\begin{tabularx}{\textwidth}{Xr}
					\noindent\parbox[c]{\hsize}{\entrytitlestyle{#2}} & \entrylocationstyle{#4} \\
					\noindent\parbox[c]{\hsize}{\entrypositionstyle{#3}} & \entrydatestyle{#1} \\
					\multicolumn{2}{l}{\descriptionstyle{#5}}\vspace{2mm}\\
				\end{tabularx}
			}\\
		}
	}
}


%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------


% New environment for the small list
\newenvironment{twentyshort}{%
	\setlength\tabcolsep{3pt}%
	\tabularx{\textwidth}{lX}
}{%
	\endtabularx
}

\newcommand{\twentyitemshort}[2]{%
	\noindent\parbox[t]{2.6cm}{\entrydatestyle{#1}} & \noindent\parbox[t]{\hsize}{\entrytitlestyle{#2}} \\
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[hidelinks]{hyperref}
