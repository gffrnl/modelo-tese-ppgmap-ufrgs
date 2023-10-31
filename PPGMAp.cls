% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%
%	CLASSE PPGMAp.cls PARA TESES E DISSERTACOES EM LaTeX
%  ----------------------------------------------------
%
%	Informacoes
%
%		Classe base: report.cls
%
%		Pacotes nativos da classe:
%		
%			inputenc   (utf8 encoding)
%			fontenc    (T1 encoding)
%			babel      (default: brazil - english, portuguese, french, spanish,
%					      german, russian)
%			etoolbox
%			nomencl    (intoc option)
%			lipsum
%			atbegshi
%			calc
%
%	Creditos
%
%		Autor: Guilherme F. Fornel (guilherme.fornel@ufrgs.br)
%	
%		! Se encontrar bugs envie um e-mail relatando !
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ppgmap/PPGMAp}

\newcommand{\@doctype}{0}
\newcommand{\@printoption}{}


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%
%	Definicao da classe PPGMAp
%
%

\LoadClass[12pt,a4paper,twoside,openright]{report}

%
%	Definicao de um novo "\today":
%
\newcommand{\PPGMAptoday}{
	\iflanguage{english}{
		\ifcase \month 
			\or January % 01
			\or February % 02
			\or March % 03
			\or April % 04
			\or May % 05
			\or June % 06
			\or July % 07
			\or August % 08
			\or September % 09
			\or October % 10
			\or November % 11
			\or December % 12
		\fi, \number \year
	}{
		\ifcase \month 
			\or janeiro % 01
			\or fevereiro % 02
			\or mar\c co % 03
			\or abril % 04
			\or maio % 05
			\or junho % 06
			\or julho % 07
			\or agosto % 08
			\or setembro % 09
			\or outubro % 10
			\or novembro % 11
			\or dezembro % 12
		\fi de \number \year
	}
}

%
%	Redefinicao de \end{document} para nomear a ultima pagina (TeX nativo):
%
\let\fim@doc\enddocument
\def\enddocument{\label{last-page}\fim@doc}

%
%	Pacotes nativos da classe:
%
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[english,portuguese,french,spanish,german,brazil]{babel}
\RequirePackage{etoolbox}
\RequirePackage[intoc]{nomencl}
\RequirePackage{lipsum}
\RequirePackage{atbegshi}
\RequirePackage{calc}

%
%	Opcoes da classe:
%
\DeclareOption{qualification}{\renewcommand{\@doctype}{1}}
\DeclareOption{masters}{\renewcommand{\@doctype}{2}}
\DeclareOption{english}{\AtBeginDocument{\selectlanguage{english}}}
\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{print}{
	\@twosidefalse
	\renewcommand{\@printoption}{
		\AtBeginShipout{%
			\AtBeginShipoutOriginalShipout\null
	  	}%
	}
}
\DeclareOption*{\OptionNotUsed}
\ProcessOptions\relax

%
%	Formatacao das paginas:
%
\pagestyle{plain}
\setlength{\evensidemargin}{4.6mm}
\setlength{\oddsidemargin}{4.6mm}
\setlength{\topmargin}{-1.54cm}
\setlength{\headheight}{1cm}
\setlength{\headsep}{2cm}
\setlength{\footskip}{30pt}
\setlength{\textheight}{222mm}
\setlength{\textwidth}{150mm}
\setlength{\parskip}{2ex}
\setlength{\parindent}{5.5em}
\setlength{\leftmargini}{\parindent}
\setlength{\partopsep}{0pt}
\clubpenalty=10000
\widowpenalty=10000
\skip\footins 20pt plus4pt minus4pt
\setlength{\parskip}{2ex}
\setlength{\parindent}{5.5em}
\renewcommand{\baselinestretch}{1.5}

%
%	Comandos para formatacao do espacamento entre linhas:
%
\newcommand{\@SingleSpacing}{\renewcommand{\baselinestretch}{1}}
\newcommand{\@OneHalfSpacing}{\renewcommand{\baselinestretch}{1.5}}
\newenvironment{singlespace}{\renewcommand{\baselinestretch}{1.5}\normalfont}%
	{\renewcommand{\baselinestretch}{1}\normalfont}

%
%	Estilos de numeracao das paginas:
%
\newcommand{\frontmatter}{\frenchspacing\pagenumbering{roman}}
\newcommand{\mainmatter}{
	\frenchspacing\setcounter{page}{1}\pagenumbering{arabic}
}


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%
%	Declaracao de comandos para as informacoes necessarias aos elementos 
%	pre-textuais
%
%

\newcommand{\@month}{}
\newcommand{\@year}{}
\renewcommand{\date}[2]{
	\renewcommand{\@month}{#1}\renewcommand{\@year}{#2}
}

\newcommand{\@authors}{}
\newcommand{\@authorf}{}
\newcommand{\@authorl}{}
\renewcommand{\author}[3][]{
	\renewcommand{\@authors}{#1}\renewcommand{\@authorf}{#2}
	\renewcommand{\@authorl}{#3}
}

\newcommand{\@advisors}{}
\newcommand{\@advisort}{}
\newcommand{\@advisorf}{}
\newcommand{\@advisorl}{}
\newcommand{\advisor}[4][]{
	\renewcommand{\@advisors}{#1}\renewcommand{\@advisort}{#2}
	\renewcommand{\@advisorf}{#3}\renewcommand{\@advisorl}{#4}
}


\newcommand{\coadvisor}[4][]{
	\newcommand{\@coadvisors}{#1}\newcommand{\@coadvisort}{#2}
	\newcommand{\@coadvisorf}{#3}\newcommand{\@coadvisorl}{#4}
}

\newcommand{\@area}{}
\newcommand{\area}[1]{\renewcommand{\@area}{#1}}

\newcommand{\@keyworda}{}
\newcommand{\@keywordb}{}
\newcommand{\@keywordc}{}
\newcommand{\@keywordd}{}
\newcommand{\keywords}[4]{
	\renewcommand{\@keyworda}{#1}\renewcommand{\@keywordb}{#2}
	\renewcommand{\@keywordc}{#3}\renewcommand{\@keywordd}{#4}
}

\newcommand{\@memberas}{}
\newcommand{\@memberat}{}
\newcommand{\@memberaf}{}
\newcommand{\@memberal}{}
\newcommand{\@insta}{}
\newcommand{\membera}[5][]{
	\renewcommand{\@memberas}{#1}
	\renewcommand{\@memberat}{#2}\renewcommand{\@memberaf}{#3}
	\renewcommand{\@memberal}{#4}\renewcommand{\@insta}{#5}
}

\newcommand{\@memberbs}{}
\newcommand{\@memberbt}{}
\newcommand{\@memberbf}{}
\newcommand{\@memberbl}{}
\newcommand{\@instb}{}
\newcommand{\memberb}[5][]{
	\renewcommand{\@memberbs}{#1}
	\renewcommand{\@memberbt}{#2}\renewcommand{\@memberbf}{#3}
	\renewcommand{\@memberbl}{#4}\renewcommand{\@instb}{#5}
}

\newcommand{\@membercs}{}
\newcommand{\@memberct}{}
\newcommand{\@membercf}{}
\newcommand{\@membercl}{}
\newcommand{\@instc}{}
\newcommand{\memberc}[5][]{
	\renewcommand{\@membercs}{#1}
	\renewcommand{\@memberct}{#2}\renewcommand{\@membercf}{#3}
	\renewcommand{\@membercl}{#4}\renewcommand{\@instc}{#5}
}

\newcommand{\memberd}[5][]{
	\newcommand{\@memberds}{#1}
	\newcommand{\@memberdt}{#2}\newcommand{\@memberdf}{#3}
	\newcommand{\@memberdl}{#4}\newcommand{\@instd}{#5}
}

\newcommand{\@PPGMApcoords}{}
\newcommand{\@PPGMApcoordt}{}
\newcommand{\@PPGMApcoordf}{}
\newcommand{\@PPGMApcoordl}{}
\newcommand{\PPGMApcoord}[4][]{
	\renewcommand{\@PPGMApcoords}{#1}\renewcommand{\@PPGMApcoordt}{#2}
	\renewcommand{\@PPGMApcoordf}{#3}\renewcommand{\@PPGMApcoordl}{#4}
}


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%
%	Redefinicao de cabecalhos
%
%

%
%	Redefinicao do cabecalho de capitulos:
%
%		\z@ == 0pt, \p@ == 1pt, \@m == 1000, \@M == 10000, \@MM == 20000
%
\newcommand{\show@chapapp}{\thechapter\hspace*{26\p@}}
\renewcommand{\@makechapterhead}[1]{%
	%\vspace*{-38\p@}%
	{%
		\parindent\z@ \raggedright \normalfont%
		\ifnum \c@secnumdepth > \m@ne%
			\Large\bfseries\show@chapapp%
		\fi%
		\interlinepenalty\@M \Large\bfseries\MakeUppercase{#1}%
		\par \nobreak \vskip 12\p@%
	}%
}%
\renewcommand{\@makeschapterhead}[1]{%
	%\vspace*{-38\p@}%
	{%
		\parindent\z@ \raggedright \normalfont%
		\interlinepenalty\@M \centering\Large\bfseries\MakeUppercase{#1}%
		\par \nobreak \vskip 12\p@%
	}%
}%

%
%	Modificacao de \@afterindentfalse para \@afterindenttrue para identacao 
%	do texto apos cabecalho dos capitulos:
%
\renewcommand{\chapter}{%
	\if@openright%
		\cleardoublepage%
	\else%
		\clearpage%
	\fi%
	\thispagestyle{plain}%
	\global\@topnum\z@ \@afterindenttrue%
	\secdef\@chapter\@schapter%
}%

%
%	Redefinicao do cabecalho de secoes:
%
\renewcommand{\section}{
	\@startsection{section}{1}{\z@}{3ex}{2ex}
		{\normalfont\large\raggedright\bfseries}
}
\renewcommand{\subsection}{
	\@startsection{subsection}{2}{\z@}{3ex}{2ex}
		{\normalfont\large\raggedright\singlespace}
}
\renewcommand{\subsubsection}{
	\@startsection{subsubsection}{3}{\z@}{3ex}{2ex}
		{\itshape\raggedright\singlespace}
}


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%
%	Redefinicao das entradas de capitulos nao numerados no sumario
%
%

\renewcommand{\l@chapter}[2]{%
	\ifnum \c@tocdepth >\m@ne%
		\addpenalty{-\@highpenalty}%
		\vskip \z@%
		\setlength{\@tempdima}{1.5em}%
		\begingroup%
			\parindent\z@%
			\rightskip \@pnumwidth%
			\parfillskip -\@pnumwidth%
			\leavevmode \bfseries \advance%
			\leftskip \@tempdima%
			\hskip -\leftskip%
			\MakeUppercase{#1} \nobreak
				\leaders\hbox{$\m@th \mkern \@dotsep mu\hbox {.}\mkern \@dotsep mu$}
				\hfill%
			\nobreak% 
			\hb@xt@ \@pnumwidth {\hss #2}%
			\par \penalty \@highpenalty%
		\endgroup
	\fi
}%


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%
%	Comandos e ambientes para construcao dos elementos pre-textuais
%
%

%
%	Folha de rosto:
%
\newcommand{\coversheet}{
	\begin{titlepage}
		\thispagestyle{empty}
		\let\footnotesize\small 
		\let\footnoterule\relax 
		\let\footnote\thanks
		\vfill
		\vskip 60\p@
		\begin{center}
			{
				\@SingleSpacing\normalsize
				\iflanguage{english}{
					FEDERAL UNIVERSITY OF RIO GRANDE DO SUL \\
					INSTITUTE OF MATHEMATICS AND STATISTICS \\
					\vskip -2mm
					GRADUATE PROGRAM FOR APPLIED MATHEMATICS
				}{
					UNIVERSIDADE FEDERAL DO RIO GRANDE DO SUL \\
					INSTITUTO DE MATEM\'ATICA E ESTAT\'ISTICA \\
					\vskip -2mm
					PROGRAMA DE P\'OS-GRADUA\c C\~AO EM MATEM\'ATICA APLICADA
				}			
			}
			\vskip 3cm
			{
				\setlength{\unitlength}{1cm}
				\makebox(13,6.5){
					\parbox[c]{13cm}{
						\setlength{\parskip}{0.8cm}
						\center
						\vskip -1.0cm
						\Large{\bf\@title}
						\par\normalsize \iflanguage{english}{by}{por}
						\par\large \@authorf\ \@authorl
					}
				}
			}
			\@ifundefined{@coadvisorf}{\vskip 2.6cm}{\vskip 1.8cm}
			\@SingleSpacing\normalsize
			\if \@doctype 2
				\iflanguage{english}{
					Dissertation submitted as a partial requirement\\
					for obtaining the degree of\\
					Master in Applied Mathematics
				}{
					Disserta\c c\~ao submetida como requisito parcial\\
					para a obten\c c\~ao do grau de\\
					Mestre em Matem\' atica Aplicada
				}
			\else
				\if \@doctype 1
					\iflanguage{english}{
						Qualification submitted as a partial requirement\\
						for obtaining the degree of\\
						Doctor in Applied Mathematics
					}{
						Qualifica\c c\~ao submetida como requisito parcial\\
						para a obten\c c\~ao do título de\\
							\if \@authors a Doutora \else 
							\if \@authors A Doutora \else
							\if \@authors f Doutora \else
							\if \@authors F Doutora \else
							Doutor \fi\fi\fi\fi
						em Matem\' atica Aplicada
					}
				\else
					\iflanguage{english}{
						Thesis submitted as a partial requirement\\
						for obtaining the degree of\\
						Doctor in Applied Mathematics
					}{
						Tese submetida como requisito parcial\\
						para a obten\c c\~ao do título de\\
							\if \@authors a Doutora \else 
							\if \@authors A Doutora \else
							\if \@authors f Doutora \else
							\if \@authors F Doutora \else
							Doutor \fi\fi\fi\fi
						em Matem\' atica Aplicada
					}
				\fi		
			\fi
			\@OneHalfSpacing\normalsize
			\vskip 2cm
			\@advisort\ \@advisorf\ \@advisorl \\
			\vskip -3mm
				\iflanguage{english}{
					Advisor
				}{
					\if \@advisors a Orientadora\else 
					\if \@advisors A Orientadora\else
					\if \@advisors f Orientadora\else
					\if \@advisors F Orientadora\else
					Orientador\fi\fi\fi\fi
				}
			\par 
			\@ifundefined{@coadvisorf}{}{
				\@coadvisort\ \@coadvisorf\ \@coadvisorl \\
				\vskip -3mm
				\iflanguage{english}{
					Co-advisor
				}{
					\if \@coadvisors a Co-orientadora\else 
					\if \@coadvisors A Co-orientadora\else
					\if \@coadvisors f Co-orientadora\else
					\if \@coadvisors F Co-orientadora\else
					Co-orientador\fi\fi\fi\fi
				}
				\par
			}
			\vfill
			{Porto Alegre, \PPGMAptoday}
		\end{center}
	\end{titlepage}
}
\renewcommand{\maketitle}{\coversheet}

%
%	Ficha catalografica:
%
\newcommand{\catalogsheet}{
	\newpage
	\null\vfill
	\begin{center}
		\@SingleSpacing\normalsize
		{
			\bf CIP - CATALOGA\c C\~AO NA PUBLICA\c C\~AO
		}
		\vskip 1cm
		\framebox[12cm]{
			\parbox{11cm}{
				\vskip 4mm
				\setlength{\parskip}{2ex}
				\@authorl, \@authorf
				\par
				\setlength{\parindent}{1.5em}
				\@title\ / \@authorf\ \@authorl.---Porto~Alegre: 
				PPGMAp da UFRGS, \number\year.
				\par
				\pageref{last-page} p.: il.\par
				\par
					\if \@doctype 2 Disserta\c c\~ao (mestrado)\else
					\if \@doctype 1 Qualifica\c c\~ao (doutorado)\else
					Tese (doutorado)\fi\fi --- Universidade Federal do 
					Rio Grande do Sul, Programa de P\'os-Gradua\c c\~ao em 
					Matem\' atica Aplicada, Porto~Alegre, \number\year.\\
					\if \@advisors a Orientadora\else 
					\if \@advisors A Orientadora\else
					\if \@advisors f Orientadora\else
					\if \@advisors F Orientadora\else
					Orientador\fi\fi\fi\fi: \@advisorl, \@advisorf 
					\@ifundefined{@coadvisorf}{}{;\\
						\if \@coadvisors a Co-orientadora\else 
						\if \@coadvisors A Co-orientadora\else
						\if \@coadvisors f Co-orientadora\else
						\if \@coadvisors F Co-orientadora\else
						Co-orientador\fi\fi\fi\fi: \@coadvisorl, \@coadvisorf
					}
				\par
				\setlength{\parindent}{0pt}
				\if \@doctype 2 Disserta\c c\~ao\else
				\if \@doctype 1 Qualifica\c c\~ao\else
				Tese\fi\fi: Matem\' atica Aplicada: \@area, \\
				\@keyworda, \@keywordb, \@keywordc, \@keywordd
				\par
				\vskip 4mm
			}
		}
	\end{center}
	\clearpage
}

%
%	Folha de aprovacao:
%
\newcommand{\approvalsheet}{
	\newpage
	\vfill
	\begin{center}
	{
		\setlength{\unitlength}{1cm}
		\makebox(15,5){
			\parbox[c]{15cm}{
				\setlength{\parskip}{0.5cm}
				\center
				\vskip -1.2cm
				\LARGE{\bf\@title}
				\par 
				\normalsize por
				\par 
				\large \@authorf\ \@authorl
				\par
			}
		}
	}
	{
		\large
		\if \@doctype 2
			Disserta\c c\~ao submetida ao Programa~de~P\' os-Gradua\c c\~ ao em 
			Matem\' atica~Aplicada do Instituto~de~Matem\' atica~e~Estatística da 
			Universidade~Federal~do~Rio Grande do Sul, como requisito parcial para 
			a obten\c c\~ao do grau de\else
		\if \@doctype 1
			Qualifica\c c\~ao submetida ao Programa~de~P\' os-Gradua\c c\~ ao em 
			Matem\' atica~Aplicada do Instituto~de~Matem\' atica~e~Estatística da 
			Universidade~Federal~do~Rio Grande do Sul, como requisito parcial para 
			a obten\c c\~ao do título de\else
			Tese submetida ao Programa~de~P\' os-Gradua\c c\~ ao em 
			Matem\' atica~Aplicada do Instituto~de~Matem\' atica~e~Estatística da 
			Universidade~Federal~do~Rio Grande do Sul, como requisito parcial para 
			a obten\c c\~ao do título de\fi\fi
	}
	\vfill
	{
	\Large\bf 
	\if \@doctype 2 Mestre \else
		\if \@authors a Doutora \else 
		\if \@authors A Doutora \else
		\if \@authors f Doutora \else
		\if \@authors F Doutora \else
		Doutor \fi\fi\fi\fi
	\fi em Matem\' atica Aplicada
	}
	\end{center}
	\vfill
	{
	\@SingleSpacing\normalsize
		\par
		Linha de Pesquisa: \@area \par

		% Orientador
		\if \@advisors a Orientadora\else 
		\if \@advisors A Orientadora\else
		\if \@advisors f Orientadora\else
		\if \@advisors F Orientadora\else
		Orientador\fi\fi\fi\fi: \@advisort\ \@advisorf\ \@advisorl
		\par
		%
		\@ifundefined{@coadvisorf}{}{
		\if \@coadvisors a Co-orientadora\else 
		\if \@coadvisors A Co-orientadora\else
		\if \@coadvisors f Co-orientadora\else
		\if \@coadvisors F Co-orientadora\else
		Co-orientador\fi\fi\fi\fi: \@coadvisort\ \@coadvisorf\ \@coadvisorl
		\par
		}

		Banca examinadora:
		\par
		\vskip 0.3cm
		\hspace{1cm} {
			\setlength{\unitlength}{1cm}
			\makebox(9,1){
				\parbox[c]{9cm}{
					\centering
					\@memberat\ \@memberaf\ \@memberal \\
					\@insta
				}
			}
		}
		\par
		\hspace{1cm} {
			\setlength{\unitlength}{1cm}
			\makebox(9,1){
				\parbox[c]{9cm}{
					\centering
					\@memberbt\ \@memberbf\ \@memberbl \\
					\@instb
				}
			}
		}
		\par
		\hspace{1cm} {
			\setlength{\unitlength}{1cm}
			\makebox(9,1){
				\parbox[c]{9cm}{
					\centering
					\@memberct\ \@membercf\ \@membercl \\
					\@instc
				}
			}
		}
		\@ifundefined{@memberdf}{
			\vskip 1cm
		}
		{
			\par
			\hspace{1cm} {
				\setlength{\unitlength}{1cm}
				\makebox(9,1){
					\parbox[c]{9cm}{
						\centering
						\@memberdt\ \@memberdf\ \@memberdl \\
						\@instd
					}
				}
			}
			\vskip 0.5cm
		}
		\vfill
		\hfill{
			\setlength{\unitlength}{1cm}
			\makebox(9,2.5){
				\parbox[c]{9cm}{
					\setlength{\parskip}{0.8cm}
					\centering
					\vskip -1.2cm
					\if \@doctype 2 Disserta\c c\~ao \else
					\if \@doctype 1 Qualifica\c c\~ao \else
					Tese \fi\fi apresentada e aprovada em \\
					\@month\ de \@year.
					\par
					\@PPGMApcoordt\ \@PPGMApcoordf\ \@PPGMApcoordl \\ 
					\if \@PPGMApcoords a Coordenadora\else 
					\if \@PPGMApcoords A Coordenadora\else
					\if \@PPGMApcoords f Coordenadora\else
					\if \@PPGMApcoords F Coordenadora\else
					Coordenador\fi\fi\fi\fi 
				}
			}
		}
	}
	\clearpage
	\@printoption
}

%
%	Ambiente para epigrafe:
%
\newenvironment{epigraph}[1][0.4]{
	\chapter*{}\mbox{}\vfill\hfill
	\begin{minipage}{#1\linewidth}
		\centering\renewcommand{\baselinestretch}{2.5}\itshape
}{\end{minipage}\vskip 1cm \clearpage}

%
%	Ambiente para os agradecimentos:
%
\newenvironment{acknowledgments}{
	\iflanguage{english}{
		\chapter*{Acknowledgments}
	}{
		\chapter*{Agradecimentos}
	}
}{\clearpage}


%
%	Listas de figuras e tabelas no sumario:
%
\renewcommand{\listoffigures}{%
	\if@twocolumn \@restonecoltrue \onecolumn \else \@restonecolfalse \fi%
	\chapter*{\listfigurename}%
	\addcontentsline{toc}{chapter}{\MakeUppercase\listfigurename}%
	\@mkboth{\MakeUppercase\listfigurename}{\MakeUppercase \listfigurename}%
	\@starttoc{lof}%
	\if@restonecol \twocolumn \fi%
}%
\renewcommand{\listoftables}{%
	\if@twocolumn \@restonecoltrue \onecolumn \else \@restonecolfalse \fi%
	\chapter*{\listtablename}%
	\addcontentsline{toc}{chapter}{\MakeUppercase\listtablename}%
	\@mkboth{\MakeUppercase\listtablename}{\MakeUppercase\listtablename}%
	\@starttoc{lot}%
	\if@restonecol \twocolumn \fi%
}

%
%	Titulos da lista de siglas e simbolos:
%
\makenomenclature
\newlength{\@nomtitlewidth}
\let\old@printnomenclature\printnomenclature
\renewcommand{\printnomenclature}[1][2]{%
	\setlength{\@nomtitlewidth}{#1cm + 5pt}
	\renewcommand{\nomlabelwidth}{#1 cm} \old@printnomenclature%
}%
\renewcommand{\nomname}{%
	\iflanguage{english}{LIST OF ABBREVIATIONS AND SYMBOLS}%
		{LISTA DE SIGLAS E S\'IMBOLOS}%
}%
\renewcommand\nomgroup[1]{
	\vskip 24\p@%
	\item[\bfseries%
		\iflanguage{english}{%
			\ifstrequal{#1}{A}{\hskip \@nomtitlewidth List of Abbreviations}{%
			\ifstrequal{#1}{B}{\hskip \@nomtitlewidth List of Symbols}{%
			\ifstrequal{#1}{C}{\hskip \@nomtitlewidth Physical Constants}{}}}%
		}{%
			\ifstrequal{#1}{A}{\hskip \@nomtitlewidth Lista de Siglas}{%
			\ifstrequal{#1}{B}{\hskip \@nomtitlewidth Lista de S\'imbolos}{%
			\ifstrequal{#1}{C}{\hskip \@nomtitlewidth Constantes F\'isicas}{}}}%
		}%
	]%
}%
\renewcommand{\nomlabel}{\large}%
\newcommand{\Abbrev}[2]{%
	\nomenclature[A]{#1}{#2}%
}%
\newcommand{\Symbol}[2]{%
	\nomenclature[B]{#1}{#2}%
}%
\newcommand{\PConst}[3]{%
	\nomenclature[C]{#1}{#2\hspace*{\fill}#3}%
}%

%
%	Ambientes para os resumos:
%
\newenvironment{resumo}{
	\chapter*{Resumo}
	\addcontentsline{toc}{chapter}{RESUMO}
}{\clearpage}

\renewenvironment{abstract}{
	\chapter*{Abstract}
	\addcontentsline{toc}{chapter}{ABSTRACT}
}{\clearpage}


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%
%	Comandos e ambientes para construcao dos elementos pos-textuais
%
%

%
%	Referencias bibliograficas no sumario:
%
%	Ambiente nativo:
\newcommand{\addbibtocontents}{
	\addcontentsline{toc}{chapter}{
		\iflanguage{english}{BIBLIOGRAPHY}{REFER\^ENCIAS BIBLIOGR\'AFICAS}
	}
}

%	BibTeX:
\renewcommand{\bibliography}[1]{
	\if@filesw \immediate \write \@auxout {\string \bibdata
{#1}}\fi \@input@ {\jobname .bbl}
	\addcontentsline{toc}{chapter}{
		\iflanguage{english}{BIBLIOGRAPHY}{REFER\^ENCIAS BIBLIOGR\'AFICAS}
	}
}

%
%	Etiqueta dos apendices no sumario:
%
\gdef\appendix{%
	\renewcommand{\show@chapapp}{%
		\MakeUppercase{\@chapapp}\space\thechapter\vskip -20\p@%
	}%
	\par \setcounter{chapter}{0} \setcounter{section}{0}%
	\gdef\@chapapp{\appendixname}%
	\gdef\thechapter{\@Alph\c@chapter}%
	\addtocontents{toc}{%
 		\protect\contentsline{part}{
			\iflanguage{english}{APPENDICES}{AP\^ENDICES}
		}{}
	}
}%
