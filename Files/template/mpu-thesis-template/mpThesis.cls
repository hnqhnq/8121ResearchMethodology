%%
%% MPU Doctoral Thesis Class
%% by Ka-Hou Chan and Wei Ke
%%

\NeedsTeXFormat{LaTeX2e}
\gdef\mp@thesis@class@version{7.8.1}
\gdef\mp@thesis@class@date{2026-05-06}
\gdef\mp@thesis@class@disp@code{MPU Thesis Template v\mp@thesis@class@version}
\ProvidesClass{mpThesis}[\mp@thesis@class@date, MPU Doctoral Thesis Class, Version \mp@thesis@class@version]

\global\edef\InsertThesisClassVersion{\mp@thesis@class@version}
\global\edef\InsertThesisClassDate{\mp@thesis@class@date}
\global\edef\InsertThesisClassDisplayCode{\mp@thesis@class@disp@code}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% font families

\newif\ifCM
\newif\ifTimes
\newif\ifUtopia
\newif\ifGaramond
\newif\ifPalatino
\newif\ifLibertine

\Libertinetrue % default

\DeclareOption{CM}{\CMtrue \Timesfalse \Utopiafalse \Garamondfalse \Palatinofalse \Libertinefalse}
\DeclareOption{Times}{\CMfalse \Timestrue \Utopiafalse \Garamondfalse \Palatinofalse \Libertinefalse}
\DeclareOption{Utopia}{\CMfalse \Timesfalse \Utopiatrue \Garamondfalse \Palatinofalse \Libertinefalse}
\DeclareOption{Garamond}{\CMfalse \Timesfalse \Utopiafalse \Garamondtrue \Palatinofalse \Libertinefalse}
\DeclareOption{Palatino}{\CMfalse \Timesfalse \Utopiafalse \Garamondfalse \Palatinotrue \Libertinefalse}
\DeclareOption{Libertine}{\CMfalse \Timesfalse \Utopiafalse \Garamondfalse \Palatinofalse \Libertinetrue}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% programme

\newif\ifPrgPCOM
\newif\ifPrgPAIDD
\newif\ifPrgPETI
\newif\ifPrgJUC
\newif\ifPrgJUB
\newif\ifPrgJoint

\PrgPCOMtrue % default

\DeclareOption{PCOM}{\PrgPCOMtrue \PrgPAIDDfalse \PrgPETIfalse \PrgJUCfalse \PrgJUBfalse \PrgJointfalse}
\DeclareOption{PAIDD}{\PrgPCOMfalse \PrgPAIDDtrue \PrgPETIfalse \PrgJUCfalse \PrgJUBfalse \PrgJointfalse}
\DeclareOption{PETI}{\PrgPCOMfalse \PrgPAIDDfalse \PrgPETItrue \PrgJUCfalse \PrgJUBfalse \PrgJointfalse}
\DeclareOption{JUC}{\PrgPCOMfalse \PrgPAIDDfalse \PrgPETIfalse \PrgJUCtrue \PrgJUBfalse \PrgJointtrue}
\DeclareOption{JUB}{\PrgPCOMfalse \PrgPAIDDfalse \PrgPETIfalse \PrgJUCfalse \PrgJUBtrue \PrgJointtrue}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% thesis types

\newif\ifProposal
\newif\ifThesis

\Proposaltrue % default

\DeclareOption{Thesis}{\Thesistrue \Proposalfalse}
\DeclareOption{Proposal}{\Thesisfalse \Proposaltrue}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% produce modes

\newif\ifReview
\newif\ifFinal
\newif\ifScreen
\newif\ifBlind

\Reviewtrue  % default
\Screentrue
\Blindfalse

\DeclareOption{Review}{\Reviewtrue \Finalfalse}
\DeclareOption{Screen}{\Screentrue}
\DeclareOption{Print}{\Screenfalse}
\DeclareOption{Final}{\Reviewfalse \Finaltrue}
\DeclareOption{Blind}{\Blindtrue}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% hardback

\newif\ifHardback

\Hardbackfalse % default

\DeclareOption{Hardback}{\Hardbacktrue \Screenfalse}
\DeclareOption{NoHardback}{\Hardbackfalse}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% line spacing

\newif\ifOneHalfSpacing
\newif\ifDoubleSpacing

\OneHalfSpacingtrue % default

\DeclareOption{OneHalfSpacing}{\OneHalfSpacingtrue \DoubleSpacingfalse}
\DeclareOption{DoubleSpacing}{\OneHalfSpacingfalse \DoubleSpacingtrue}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ph.D. after name on hardback cover

\newif\ifPhDAfterName

\PhDAfterNametrue % default

\DeclareOption{PhDAfterName}{\PhDAfterNametrue}
\DeclareOption{NoPhDAfterName}{\PhDAfterNamefalse}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Algorithms and MathPars

\newif\ifAlgoMic
\newif\ifAlgoX
\newif\ifAlgoIIe
\newif\ifMathPar

\AlgoMicfalse
\AlgoXfalse
\AlgoIIefalse
\MathParfalse

\DeclareOption{AlgoMic}{\AlgoMictrue\AlgoXfalse\AlgoIIefalse}
\DeclareOption{AlgoX}{\AlgoXtrue\AlgoMicfalse\AlgoIIefalse}
\DeclareOption{AlgoIIe}{\AlgoIIetrue\AlgoMicfalse\AlgoXfalse}
\DeclareOption{MathPar}{\MathPartrue}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions

\LoadClass[12pt,a4paper]{book}

\newcommand\hide[1]{}

\RequirePackage[%
\ifScreen
  left=30mm, right=30mm,
\else
  left=35mm, right=25mm,
\fi
  top=25mm, bottom=25mm, heightrounded, head=9mm]{geometry}

\RequirePackage[T1]{fontenc}
\RequirePackage{CJKutf8}
\RequirePackage{amsmath,amsthm,amssymb}
\RequirePackage{mathtools}
\RequirePackage{makecell}
\RequirePackage{array}
\RequirePackage{bm}

\ifTimes
  \RequirePackage{newtxtext,newtxmath}
\else\ifUtopia
  \RequirePackage{utopia}
  \RequirePackage[utopia]{newtxmath}
\else\ifPalatino
  \RequirePackage{mathpazo}
\else\ifGaramond
  \RequirePackage{ebgaramond}
  \RequirePackage[cmintegrals,cmbraces]{newtxmath}
  \RequirePackage{ebgaramond-maths}
  \DeclareSymbolFont{ntxletters}{OML}{ntxmi}{m}{it}
  \SetSymbolFont{ntxletters}{bold}{OML}{ntxmi}{b}{it}
  \re@DeclareMathSymbol{\leftharpoonup}{\mathrel}{ntxletters}{"28}
  \re@DeclareMathSymbol{\leftharpoondown}{\mathrel}{ntxletters}{"29}
  \re@DeclareMathSymbol{\rightharpoonup}{\mathrel}{ntxletters}{"2A}
  \re@DeclareMathSymbol{\rightharpoondown}{\mathrel}{ntxletters}{"2B}
  \re@DeclareMathSymbol{\triangleleft}{\mathbin}{ntxletters}{"2F}
  \re@DeclareMathSymbol{\triangleright}{\mathbin}{ntxletters}{"2E}
  \re@DeclareMathSymbol{\partial}{\mathord}{ntxletters}{"40}
  \re@DeclareMathSymbol{\flat}{\mathord}{ntxletters}{"5B}
  \re@DeclareMathSymbol{\natural}{\mathord}{ntxletters}{"5C}
  \re@DeclareMathSymbol{\star}{\mathbin}{ntxletters}{"3F}
  \re@DeclareMathSymbol{\smile}{\mathrel}{ntxletters}{"5E}
  \re@DeclareMathSymbol{\frown}{\mathrel}{ntxletters}{"5F}
  \re@DeclareMathSymbol{\sharp}{\mathord}{ntxletters}{"5D}
  \re@DeclareMathAccent{\vec}{\mathord}{ntxletters}{"7E}
\else\ifLibertine
  \RequirePackage{libertine}
  \RequirePackage[varqu,varl]{zi4}
  \RequirePackage[libertine]{newtxmath}
\fi\fi\fi\fi\fi

\RequirePackage[dvipsnames,x11names,svgnames]{xcolor}
\definecolor{MPUGreen}{HTML}{046A38}

\ifReview
  \RequirePackage[pdftex,colorlinks]{hyperref}
  \hypersetup{
    linkcolor = Maroon,
    citecolor = SteelBlue,
    filecolor = NavyBlue,
    urlcolor  = NavyBlue,
  }
\else
  \RequirePackage[pdftex,hidelinks]{hyperref}
\fi

\ifHardback
  \RequirePackage{eso-pic}
\fi

\ifReview
  \RequirePackage{fgruler}
  \newcommand{\PageRulerR}{\rlap{\hspace*{\textwidth+1.5cm}\ruler[\fgrulerunit]{downright}{\textheight}}}
  \newcommand{\PageRulerL}{\llap{\ruler[\fgrulerunit]{downleft}{\textheight}\hspace*{1.5cm}}}

  \fgrulerdefuser{
    \AtTextLowerLeft{
      \rulerparamsfromfg
      \rulernorotatenum
      \ifScreen
        \PageRulerR
      \else
        \ifodd\value{page}\PageRulerR\else\PageRulerL\fi
      \fi
    }
  }
  \setfgruler{type=user,color=magenta}
  \fgrulernoborderline
\fi

\RequirePackage{multirow,multicol}

\RequirePackage{wrapfig}
\RequirePackage{graphicx}
\RequirePackage{caption,subcaption}

\RequirePackage{minitoc}
\let\orig@minitoc\minitoc
\renewcommand{\minitoc}{{\singlespacing\orig@minitoc}}

\RequirePackage[style=long4col,toc,automake]{glossaries}
\makeglossaries
\newglossaryentry{MPU}{name={MPU}, description={Macao Polytechnic University}}
\newglossaryentry{FCA}{name={FCA}, description={Faculty of Applied Sciences}}
\newglossaryentry{PhD}{name={Ph.~D.}, description={Doctor of Philosophy}}

\RequirePackage[noindentafter]{titlesec}
\RequirePackage{titletoc}
\RequirePackage{tocbibind}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\setcounter{minitocdepth}{3}
\RequirePackage{notoccite}

\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{etoolbox}

\RequirePackage{stmaryrd}
\RequirePackage{marvosym}
\RequirePackage{enumitem}
\RequirePackage[en-GB,calc]{datetime2}
\RequirePackage{varwidth}
\RequirePackage{keyval}
\RequirePackage{qrcode}

\RequirePackage{bibentry}
\nobibliography*

\ifAlgoMic
  \RequirePackage{algorithm}
  \RequirePackage{algorithmic}
  \renewcommand{\listalgorithmname}{List of Algorithms}
  \newcommand{\algorithmautorefname}{Algorithm}
\fi

\ifAlgoX
  \RequirePackage{algorithm}
  \RequirePackage{algorithmicx}
  \RequirePackage{algpseudocode}
  \renewcommand{\listalgorithmname}{List of Algorithms}
  \newcommand{\algorithmautorefname}{Algorithm}
\fi

\ifAlgoIIe
  \RequirePackage[algochapter]{algorithm2e}
  \newcommand{\listalgorithmname}{List of Algorithms}
  \renewcommand{\algorithmautorefname}{Algorithm}
\fi

\ifMathPar
  \RequirePackage{mathpartir}
  \mprset{sep=1.25em}
  \def\MathparLineskip{\lineskiplimit=1.5ex\lineskip=1.5ex plus 0.3ex}
\fi

%%
%% commands to define variables
%%

\newif\ifCoSup
\CoSupfalse

\ifBlind
  \newcommand{\StudentName}[2][]{%
    \author{--}%
    \gdef\mp@student@name{--}%
    \gdef\mp@student@name@break{--}%
  }
  \newcommand{\StudentNumber}[1]{\gdef\mp@student@number{--}}
  \newcommand{\Supervisor}[1]{\gdef\mp@supervisor{--}}
  \newcommand{\JointSupervisor}[1]{\gdef\mp@joint@supervisor{--}}
  \newcommand{\CoSupervisor}[1]{\gdef\mp@co@supervisor{--}}
\else
  \newcommand{\StudentName}[2][]{%
    \author{#2}%
    \gdef\mp@student@name{#2}%
    \gdef\mp@student@name@break{\ifstrempty{#1}{#2}{#1}}%
  }
  \newcommand{\StudentNumber}[1]{\gdef\mp@student@number{#1}}
  \newcommand{\Supervisor}[1]{\gdef\mp@supervisor{#1}}
  \newcommand{\JointSupervisor}[1]{\gdef\mp@joint@supervisor{#1}}
  \newcommand{\CoSupervisor}[1]{\CoSuptrue\gdef\mp@co@supervisor{#1}}
\fi

\newcommand{\University}[1]{\gdef\mp@university{#1}}
\newcommand{\JointUniversity}[1]{\gdef\mp@joint@university{#1}}
\newcommand{\AcademicUnit}[1]{\gdef\mp@academic@unit{#1}}
\newcommand{\AcademicShort}[1]{\gdef\mp@academic@short{#1}}
\newcommand{\Programme}[2][]{%
	\gdef\mp@programme{#2}%
	\gdef\mp@programme@break{\ifstrempty{#1}{#2}{#1}}%
}
\newcommand{\JointProgramme}[2][]{%
	\gdef\mp@joint@programme{#2}%
	\gdef\mp@joint@programme@break{\ifstrempty{#1}{#2}{#1}}%
}
\newcommand{\ProgrammeCode}[1]{\gdef\mp@programme@code{#1}}
\newcommand{\Date}[1]{\DTMsavedate{mp@date}{#1}}
\newcommand{\DateToday}{%
  \DTMsavenow{mp@date}%
  \DTMsavenow{mp@defence@datetime}%
}
\newcommand{\DefenceDateTime}[2]{%
  \DTMsavedate{mp@defence@datetime}{#1}%
  \DTMsavetime{mp@defence@datetime}{#2}%
}
\newcommand{\Title}[2][]{%
	\gdef\mp@title{#2}%
	\gdef\mp@title@break{\ifstrempty{#1}{#2}{#1}}%
}

\newcommand{\ThesisNumber}[5]{%
  \ifThesis\gdef\mp@thesis@number@ty{TH}\else\gdef\mp@thesis@number@ty{RP}\fi%
  \gdef\mp@thesis@number@seq{#1}%
  \gdef\mp@thesis@number@prg{#2}%
  \gdef\mp@thesis@number@acu{#3}%
  \lowercase{\gdef\mp@thesis@number@acu@lo{#3}}%
  \gdef\mp@thesis@number@lna{#4}%
  \gdef\mp@thesis@number@ftw{#5}%
}

\newcommand{\ThesisKeywords}[1]{\gdef\mp@thesis@keywords{#1}}
\newcommand{\ThesisChsKeywords}[1]{\gdef\mp@thesis@chs@keywords{#1}}
\newcommand{\ThesisChtKeywords}[1]{\gdef\mp@thesis@cht@keywords{#1}}
\newcommand{\ChsTitle}[1]{\gdef\mp@chs@title{#1}}
\newcommand{\ChtTitle}[1]{\gdef\mp@cht@title{#1}}

\newcommand{\PanelChair}[1]{\gdef\mp@panel@chair{#1}}
\newcommand{\PanelExternal}[1]{\gdef\mp@panel@external@a{#1}}
\newcommand{\PanelJointExternal}[1]{\gdef\mp@panel@external@b{#1}}
\newcommand{\PanelExternalA}[1]{\gdef\mp@panel@external@a{#1}}
\newcommand{\PanelExternalB}[1]{\gdef\mp@panel@external@b{#1}}
\newcommand{\PanelInternal}[1]{\gdef\mp@panel@internal@a{#1}}
\newcommand{\PanelJointInternal}[1]{\gdef\mp@panel@internal@b{#1}}
\newcommand{\PanelInternalA}[1]{\gdef\mp@panel@internal@a{#1}}
\newcommand{\PanelInternalB}[1]{\gdef\mp@panel@internal@b{#1}}
\newcommand{\PanelExaminer}[1]{\gdef\mp@panel@internal@a{#1}}
\newcommand{\PanelExaminerA}[1]{\gdef\mp@panel@internal@a{#1}}
\newcommand{\PanelExaminerB}[1]{\gdef\mp@panel@internal@b{#1}}

\newcommand{\InsertThesisType}{%
  \ifProposal%
    Research Proposal%
  \else\ifThesis%
    Thesis%
  \fi\fi}

\newcommand{\InsertStudentName}{\mp@student@name}
\newcommand{\InsertStudentNameBreak}{\makecell[l]{\mp@student@name@break}}
\newcommand{\InsertStudentNumber}{\mp@student@number}
\newcommand{\InsertUniversity}{\mp@university}
\newcommand{\InsertJointUniversity}{\mp@joint@university}
\newcommand{\InsertAcademicUnit}{\mp@academic@unit}
\newcommand{\InsertAcademicShort}{\mp@academic@short}
\newcommand{\InsertProgramme}{\mp@programme}
\newcommand{\InsertProgrammeBreak}{\makecell[l]{\mp@programme@break}}
\newcommand{\InsertJointProgramme}{\mp@joint@programme}
\newcommand{\InsertJointProgrammeBreak}{\makecell[l]{\mp@joint@programme@break}}
\newcommand{\InsertProgrammeCode}{\mp@programme@code}
\newcommand{\InsertSupervisor}{\mp@supervisor}
\newcommand{\InsertJointSupervisor}{\mp@joint@supervisor}
\newcommand{\InsertCoSupervisor}{\mp@co@supervisor}
\newcommand{\InsertDefenceDate}{\DTMsetstyle{en-GB}\DTMlangsetup{showdayofmonth=true,ord=raise}\DTMusedate{mp@defence@datetime}}
\newcommand{\InsertDefenceTime}{\DTMsettimestyle{default}\DTMsetup{showseconds=false}\DTMusetime{mp@defence@datetime}}
\newcommand{\InsertLongDate}{\DTMsetstyle{en-GB}\DTMlangsetup{showdayofmonth=true,ord=raise}\DTMusedate{mp@date}}
\newcommand{\InsertMonthYear}{\DTMsetstyle{en-GB}\DTMlangsetup{showdayofmonth=false}\DTMusedate{mp@date}}
\newcommand{\InsertYear}{\DTMfetchyear{mp@date}}
\newcommand{\InsertDate}{\DTMsetstyle{default}\DTMusedate{mp@date}}
\newcommand{\InsertTitle}{\mp@title}
\newcommand{\InsertTitleBreak}{\makecell[l]{\mp@title@break}}
\newcommand{\InsertThesisNumber}{\mp@thesis@number@ty\mp@thesis@number@seq/\mp@thesis@number@prg/\mp@thesis@number@acu/\InsertYear}
\newcommand{\InsertThesisNumberBreak}{\mp@thesis@number@ty\mp@thesis@number@seq/\mp@thesis@number@prg\linebreak\mp@thesis@number@acu/\InsertYear}
\newcommand{\InsertThesisNumberStyle}{{\small\fontfamily{zi4}\selectfont\InsertThesisNumber}}
\newcommand{\InsertThesisNumberBreakStyle}{{\small\fontfamily{zi4}\selectfont\InsertThesisNumberBreak}}
\newcommand{\InsertThesisUrl}{https://\mp@thesis@number@acu@lo.mpu.edu.mo/doc-db?%
  ty=\mp@thesis@number@ty\&%
  seq=\mp@thesis@number@seq\&%
  prg=\mp@thesis@number@prg\&%
  acu=\mp@thesis@number@acu\&%
  year=\InsertYear\&%
  lna=\mp@thesis@number@lna\&%
  ftw=\mp@thesis@number@ftw%
}
\newcommand{\InsertThesisKeywords}{\mp@thesis@keywords}
\newcommand{\InsertThesisChsKeywords}{\mp@thesis@chs@keywords}
\newcommand{\InsertThesisChtKeywords}{\mp@thesis@cht@keywords}
\newcommand{\InsertPanelChair}{\mp@panel@chair}
\newcommand{\InsertPanelExternal}{\mp@panel@external@a}
\newcommand{\InsertPanelJointExternal}{\mp@panel@external@b}
\newcommand{\InsertPanelExternalA}{\mp@panel@external@a}
\newcommand{\InsertPanelExternalB}{\mp@panel@external@b}
\newcommand{\InsertPanelInternal}{\mp@panel@internal@a}
\newcommand{\InsertPanelJointInternal}{\mp@panel@internal@b}
\newcommand{\InsertPanelInternalA}{\mp@panel@internal@a}
\newcommand{\InsertPanelInternalB}{\mp@panel@internal@b}
\newcommand{\InsertPanelExaminer}{\mp@panel@internal@a}
\newcommand{\InsertPanelExaminerA}{\mp@panel@internal@a}
\newcommand{\InsertPanelExaminerB}{\mp@panel@internal@b}

\StudentName[<<Student Name>>]{<<Student Name>>}
\StudentNumber{<<Student Number>>} %P-XX-XXXX-X
\Supervisor{<<Supervisor>>}
\JointSupervisor{<<JointSupervisor>>}
\DateToday

\Title{<<Title>>}
\ThesisNumber{0000}{\InsertProgrammeCode}{\InsertAcademicShort}{lastname}{titlefirst}
\ThesisKeywords{}
\Date{9999-01-02} %Submission Date

\DefenceDateTime{9999-01-02}{23:59:00} %Defence Date and Time YYYY-MM-DD, hh:mm:ss
\PanelChair{<<Chair>>}
\PanelExternal{<<External Examiner>>}
\PanelJointExternal{<<Joint External Examiner>>}
\PanelInternal{<<Internal Examiner>>}
\PanelJointInternal{<<Joint Internal Examiner>>}

\ifPrgPCOM
  \University{Macao Polytechnic University}
  \AcademicUnit{Faculty of Applied Sciences}
  \AcademicShort{FCA}
  \Programme%
  [Doctor of Philosophy in\\Computer Applied Technology]%
  {Doctor of Philosophy in Computer Applied Technology}
  \ProgrammeCode{PCOM}
\fi

\ifPrgPAIDD
  \University{Macao Polytechnic University}
  \AcademicUnit{Faculty of Applied Sciences}
  \AcademicShort{FCA}
  \Programme%
  [Doctor of Philosophy in\\Artificial Intelligence driven Drug Discovery]%
  {Doctor of Philosophy in Artificial Intelligence driven Drug Discovery}
  \ProgrammeCode{PAIDD}
\fi

\ifPrgPETI
  \University{Macao Polytechnic University}
  \AcademicUnit{Faculty of Applied Sciences}
  \AcademicShort{FCA}
  \Programme%
  [Doctor of Philosophy in\\Educational Technology and Innovation]%
  {Doctor of Philosophy in Educational Technology and Innovation}
  \ProgrammeCode{PETI}
\fi

\ifPrgJUC
  \University{Macao Polytechnic University}
  \AcademicUnit{Faculty of Applied Sciences}
  \AcademicShort{FCA}
  \Programme%
  [Doctor of Philosophy in\\Computer Applied Technology]%
  {Doctor of Philosophy in Computer Applied Technology}
  \JointUniversity{University of Coimbra}
  \JointProgramme%
  [Doutoramento em Engenharia Inform\'{a}tica\\(Doctor of Philosophy in Informatics Engineering)]%
  {Doutoramento em Engenharia Inform\'{a}tica (Doctor of Philosophy in Informatics Engineering)}
  \ProgrammeCode{PCOM}
\fi

\ifPrgJUB
  \University{Macao Polytechnic University}
  \AcademicUnit{Faculty of Applied Sciences}
  \AcademicShort{FCA}
  \Programme%
  [Doctor of Philosophy in\\Computer Applied Technology]%
  {Doctor of Philosophy in Computer Applied Technology}
  \JointUniversity{Universit\`{a} di Bologna}
  \JointProgramme%
  [Doctor of Philosophy in\\Computer Science and Engineering /\\Automotive Engineering for Intelligent Mobility]%
  {Doctor of Philosophy in Computer Science and Engineering / Automotive Engineering for Intelligent Mobility}
  \ProgrammeCode{PCOM}
\fi

%%
%% emphasize bib names
%%

\newcommand{\EmphasizeAuthors}[1]{\nocite{#1}}

%%
%% redefine cross-reference prefix
%%

\def\equationautorefname~#1\null{(#1)\null}
\def\chapterautorefname{Chapter}
\def\sectionautorefname{Section}
\def\subsectionautorefname{\sectionautorefname}
\def\subsubsectionautorefname{\sectionautorefname}
\def\figureautorefname{Figure}
\def\tableautorefname{Table}
\def\pageautorefname{Page}

%%
%% format section titles
%%

\titlespacing{\chapter}{0pt}{-2.5em}{1.5em}
\titleformat{\section}{\Large}{\thesection}{2ex}{\sc}
\titleformat{\subsection}{\large\it}{\thesubsection}{1ex}{}
\titleformat{\chapter}[display]{\doublespacing\filcenter\LARGE\scshape}{\chaptertitlename~\thechapter.}{0ex}{\bf\MakeUppercase}

%%
%% page no. of logos
%%

\def\mp@pn@mpu@calligraphy{1}
\def\mp@pn@mpu@calligraphy@ol{2}
\def\mp@pn@mpu@fca@logo{3}
\def\mp@pn@mpu@logo{4}
\def\mp@pn@mpu@logo@bw{5}
\def\mp@pn@mpu@logo@green@small{6}
\def\mp@pn@mpu@ub@logo{7}
\def\mp@pn@mpu@uc@logo{8}
\def\mp@pn@ub@logo{9}
\def\mp@pn@ub@logo@bw{10}
\def\mp@pn@ub@logo@color@small{11}
\def\mp@pn@uc@logo{12}
\def\mp@pn@uc@logo@bw{13}
\def\mp@pn@uc@logo@color@small{14}

%%
%% preloaded logo boxes
%%

\newsavebox{\mp@double@text@logo@box}
\sbox{\mp@double@text@logo@box}{\raisebox{-0.225\headheight}[0pt][0pt]{\includegraphics[page=\mp@pn@mpu@calligraphy,height=\headheight]{mpLogos.pdf}}}
\ifPrgJUC
  \sbox{\mp@double@text@logo@box}{\includegraphics[page=\mp@pn@mpu@uc@logo]{mpLogos.pdf}}
\else\ifPrgJUB
  \sbox{\mp@double@text@logo@box}{\includegraphics[page=\mp@pn@mpu@ub@logo]{mpLogos.pdf}}
\else
  \sbox{\mp@double@text@logo@box}{\includegraphics[page=\mp@pn@mpu@fca@logo]{mpLogos.pdf}}
\fi\fi
\gdef\mp@double@text@logo{\usebox{\mp@double@text@logo@box}}

%%
%% Hardback
%%
\newlength{\mp@logo@height}
\setlength{\mp@logo@height}{2in}
%%
%%
\newcommand{\HardbackFontStyle}{\fontfamily{ntxtlf}\selectfont\bfseries\large}
\newcommand{\MakeHardback}{%
%%
%%
\vspace*{0.25in}
\begin{center}
\raisebox{-0.02\mp@logo@height}[0.98\mp@logo@height][0.02\mp@logo@height]{\includegraphics[page=\mp@pn@mpu@logo@bw,height=\mp@logo@height]{mpLogos.pdf}}
%
\ifPrgJUC
  \hfill
  \raisebox{0pt}[0.914\mp@logo@height][0pt]{\includegraphics[page=\mp@pn@uc@logo@bw,height=0.914\mp@logo@height]{mpLogos.pdf}}
\else\ifPrgJUB
  \hfill
  \raisebox{0pt}[0.854\mp@logo@height][0pt]{\includegraphics[page=\mp@pn@ub@logo@bw,height=0.880\mp@logo@height]{mpLogos.pdf}}
\fi\fi
%
\vfill
{\HardbackFontStyle\InsertTitle}
\vfill
{\HardbackFontStyle\InsertStudentName\ifPhDAfterName\par\mbox{Ph.~D.}\fi}
\vspace*{1.0in}
\end{center}
\cleardoublepage

\singlespacing
\ifScreen
  \newgeometry{left=30mm, right=30mm, top=20mm, bottom=20mm}
\else
  \newgeometry{left=35mm, right=25mm, top=20mm, bottom=20mm}
\fi
\setbox0\hbox{f}% use the current font to measure the top-baseline height
\centerline{%
\raisebox{\ht0}{% lift the box from baseline to top
\rotatebox[origin=c]{-90}{\HardbackFontStyle% the relative box height is [297 (A4 paperheight) - 20x2]/paperheight = 0.865
\begin{tabular}{
  @{}
  >{\raggedright\arraybackslash}m{0.40\paperheight}
  @{}
  >{\raggedleft\arraybackslash}m{0.315\paperheight}
  @{}
  >{\raggedleft\arraybackslash}m{0.15\paperheight}
  @{}
}
\InsertTitleBreak & \InsertStudentName & \InsertYear
\end{tabular}%
}}}
\restoregeometry
\cleardoublepage
%%
%%
\null
\clearpage
\AddToShipoutPictureBG*{
  \hspace*{15cm}
  \rotatebox[y=0.5\paperheight]{-90}{
    \includegraphics[page=\mp@pn@mpu@calligraphy@ol,width=0.98\paperheight]{mpLogos.pdf}
  }
}
\cleardoublepage
%%
%%
}%% end of \MakeHardback

%%
%% Cover Page
%%
\newcommand{\MakeCover}{%
\begin{center}
\raisebox{-0.02\mp@logo@height}[0.98\mp@logo@height][0.02\mp@logo@height]{\includegraphics[page=\mp@pn@mpu@logo,height=\mp@logo@height]{mpLogos.pdf}}
%
\ifPrgJUC
  \hfill
  \raisebox{0pt}[0.914\mp@logo@height][0pt]{\includegraphics[page=\mp@pn@uc@logo,height=0.914\mp@logo@height]{mpLogos.pdf}}
\else\ifPrgJUB
  \hfill
  \raisebox{0pt}[0.854\mp@logo@height][0pt]{\includegraphics[page=\mp@pn@ub@logo,height=0.880\mp@logo@height]{mpLogos.pdf}}
\fi\fi
%
\vfill
{\Large\bf\InsertAcademicUnit}
\vfill
{\large\bf\InsertTitle}
\vfill
\large\InsertStudentName
\vfill
{\par\setstretch{1.5}\it\normalsize
A \textbf{\InsertThesisType} submitted for the Examination \\
in partial fulfillment of the requirements for the
\ifPrgJoint
  dual
\fi
degree of \\
\InsertProgramme, \InsertUniversity \\
\ifPrgJoint
  and \\
  \InsertJointProgramme, \InsertJointUniversity
\fi
\par}
\vfill
\InsertMonthYear
\end{center}%
%%
%%
}%% end of \MakeCover

\newlength{\left@col@width}
\newlength{\left@col@maxwidth}
\newlength{\name@col@width}
\newlength{\name@col@maxwidth}

%%
%% Copyright Page
%%
\newcommand{\MakeCopyright}{%
%%
%%
\noindent%
\begin{minipage}[t]{0.45\textwidth}
\vspace{0pt}%
\raggedright\InsertThesisNumberStyle \\
{\it Copyright \copyright{} \InsertStudentName, \InsertYear.}
\end{minipage}%
\hfill%
\begin{minipage}[t]{0.45\textwidth}
\vspace{0pt}%
\raggedleft\qrcode[hyperlink,height=1in]{\InsertThesisUrl}%
\end{minipage}

\vspace{-0.25in}%

\begin{center}
\singlespacing
\resizebox{\linewidth}{!}{\mp@double@text@logo}

\vspace*{0.25in}

%%
\ifPrgJoint
  \def\left@programme{Programmes}
\else
  \def\left@programme{Programme}
\fi

\def\left@thesis{\InsertThesisType}
\def\left@student@name{Name}
\def\left@student@number{Student Number}

\ifPrgJoint
  \def\left@supervisor{Supervisors}
\else
  \def\left@supervisor{Supervisor}
\fi
\ifCoSup
  \def\left@co@supervisor{Co-supervisor}
\else
  \def\left@co@supervisor{\ }
\fi
\def\left@chair{Chair}
\def\left@examiners{\ifThesis{Examiners}\else{Examiner}\fi}
\def\left@defence@date{\ifThesis{Oral Defence Date}\else{Examination Date}\fi}
\def\left@defence@time{Time}
\def\left@signatures{Signatures}
\def\left@date{Date}
\setlength{\left@col@maxwidth}{0.39\linewidth}
%%
\setlength{\left@col@width}{\widthof{%
\begin{varwidth}{\left@col@maxwidth}
\raggedleft%
{\it\left@programme}\\
{\it\left@thesis}\\
{\it\left@student@name}\\
{\it\left@student@number}\\
{\it\left@supervisor}\\
{\it\left@co@supervisor}\\
{\it\left@defence@date}\\
{\it\left@defence@time}\\
{\it\left@chair}\\
{\it\left@examiners}\\
{\it\left@signatures}\\
{\it\left@date}\\
\end{varwidth}}}
\setlength{\name@col@width}{0.6\linewidth}
%%

\onehalfspacing
\renewcommand\arraystretch{1.125}
\begin{tabular}{
  >{\it\raggedleft\arraybackslash}b{\left@col@width}
  >{\raggedright\arraybackslash}b{\name@col@width}
}
\left@programme & \InsertProgrammeBreak \\
\ifPrgJoint
\cline{2-2}
& \InsertJointProgrammeBreak \\
\fi
\hline%\cline{2-2}
\end{tabular}
\vfill
\begin{tabular}{
  >{\it\raggedleft\arraybackslash}b{\left@col@width}
  >{\raggedright\arraybackslash}b{\name@col@width}
}
\left@thesis & \InsertTitleBreak \\
\cline{2-2}
\left@student@name & \InsertStudentName \\
\cline{2-2}
\left@student@number & \InsertStudentNumber \\
\cline{2-2}
\left@supervisor & \InsertSupervisor \\
\ifPrgJoint
\cline{2-2}
& \InsertJointSupervisor \\
\fi
\ifCoSup
\cline{2-2}
\left@co@supervisor & \InsertCoSupervisor \\
\fi
\hline%\cline{2-2}
\end{tabular}
\vfill
\begin{tabular}{
  >{\it\raggedleft\arraybackslash}b{\left@col@width}
  >{\raggedright\arraybackslash}b{\name@col@width}
}
\left@defence@date & \InsertDefenceDate \\
\cline{2-2}
\left@defence@time & \InsertDefenceTime \\
\cline{2-2}
\left@chair & \InsertPanelChair \\
\cline{2-2}
\ifThesis
  \left@examiners & \InsertPanelExternalA \\
  \ifPrgJoint
    \cline{2-2}
    & \InsertPanelExternalB \\
  \fi
  \cline{2-2}
  & \InsertPanelInternalA \\
  \cline{2-2}
  & \InsertPanelInternalB \\
\else
  \left@examiners & \InsertPanelExaminer \\
\fi
\hline%\cline{2-2}
\end{tabular}
\vfill
\vspace{0.125in}
\begin{tabular}{
  >{\it\raggedleft\arraybackslash}b{\left@col@width}
  >{\raggedright\arraybackslash}b{\name@col@width}
}
\left@signatures &  \\[1ex]
\cline{2-2}
& \multicolumn{1}{r}{\small(\InsertStudentName)} \\[3ex]
&  \\[-3ex]
\cline{2-2}
& \multicolumn{1}{r}{\small(\InsertSupervisor)} \\[3ex]
\ifPrgJoint
  &  \\[-3ex]
  \cline{2-2}
  & \multicolumn{1}{r}{\small(\InsertJointSupervisor)} \\[3ex]
\fi
\end{tabular}
\vfill
\begin{tabular}{
  >{\it\raggedleft\arraybackslash}b{\left@col@width}
  >{\raggedright\arraybackslash}b{\name@col@width}
}
\left@date & \InsertLongDate \\
\cline{2-2}
\end{tabular}
\end{center}
%%
%%
}%% end of \MakeCopyright

%%
%% Title Page
%%
\newcommand{\MakeTitle}{%
%%
%%
\setlength{\name@col@maxwidth}{0.55\linewidth}
%%
\setlength{\name@col@width}{\widthof{
  \begin{varwidth}{\name@col@maxwidth}
    \InsertStudentNameBreak\\
    \InsertStudentNumber\\
    \InsertAcademicUnit\\
    \InsertSupervisor\\
\ifPrgJoint
    \InsertJointSupervisor\\
\fi
\ifCoSup
    \InsertCoSupervisor\\
\fi
  \end{varwidth}}
}
%%
\def\left@student@name{Name}
\def\left@student@number{Student Number}
\def\left@academic@unit{Academic Unit}
\ifPrgJoint
  \def\left@programme{Programmes}
  \def\left@supervisor{Supervisors}
\else
  \def\left@programme{Programme}
  \def\left@supervisor{Supervisor}
\fi
\ifCoSup
  \def\left@co@supervisor{Co-supervisor}
\else
  \def\left@co@supervisor{\ }
\fi
%\def\left@mp@submission@date{Submission Date}
%\def\left@mp@defence@date{Defence Date}
\def\left@date{Date}
\setlength{\left@col@maxwidth}{0.4\linewidth}
%%
\setlength{\left@col@width}{\widthof{%
\begin{varwidth}{\left@col@maxwidth}
\raggedleft%
{\it\left@student@name}\\
{\it\left@student@number}\\
{\it\left@academic@unit}\\
{\it\left@programme}\\
{\it\left@supervisor}\\
{\it\left@co@supervisor}\\
{\it\left@date}
\end{varwidth}}}
%%
%%
\newlength{\mp@logo@green@height}
\setlength{\mp@logo@green@height}{1.75in}
%%
\begin{center}
\begin{minipage}[b]{0.475\textwidth}%
\centering%
\raisebox{-0.0147\mp@logo@green@height}[0.9853\mp@logo@green@height][0.0147\mp@logo@green@height]{\includegraphics[page=\mp@pn@mpu@logo@green@small,height=\mp@logo@green@height]{mpLogos.pdf}}%
\end{minipage}%
\ifPrgJUC%
  \hfill%
  \begin{minipage}[b]{0.475\textwidth}%
  \centering%
  \raisebox{0pt}[0.909\mp@logo@green@height][0pt]{\includegraphics[page=\mp@pn@uc@logo@color@small,height=0.909\mp@logo@green@height]{mpLogos.pdf}}%
  \end{minipage}%
\else\ifPrgJUB%
  \hfill%
  \begin{minipage}[b]{0.475\textwidth}%
  \centering%
  \raisebox{0pt}[0.8777\mp@logo@green@height][0pt]{\includegraphics[page=\mp@pn@ub@logo@color@small,height=0.8777\mp@logo@green@height]{mpLogos.pdf}}%
  \end{minipage}%
\fi\fi

\vspace*{1in}
{\Large\sc\InsertThesisType}%
\vfill
{\Large \InsertTitle}
\vfill
\onehalfspacing
\renewcommand\arraystretch{1.275}
\hspace*{0.4\linewidth-\left@col@width}
\begin{tabular}{
  >{\it\raggedleft\arraybackslash}b{\left@col@width}|
  >{\raggedright\arraybackslash}b{0.6\linewidth}
}
\left@student@name & \InsertStudentNameBreak \\
\hline
\left@student@number & \InsertStudentNumber \\
\hline
\left@academic@unit & \InsertAcademicUnit \\
\hline
\left@programme & \InsertProgrammeBreak \\
\ifPrgJoint
  \cline{2-2}
  & \InsertJointProgrammeBreak \\
\fi
\hline
\left@supervisor & \InsertSupervisor \\
\ifPrgJoint
  \cline{2-2}
  & \InsertJointSupervisor \\
\fi
\ifCoSup
  \hline
  \left@co@supervisor & \InsertCoSupervisor \\
\fi
\hline
\left@date & \InsertLongDate
\end{tabular}
\end{center}%
%%
%%
}%% end of \MakeTitle

%%
%% MPU calligraphy
%%

\newsavebox{\mp@calligraphy@box}
\sbox{\mp@calligraphy@box}{\raisebox{-2.7pt}[0pt][0pt]{\includegraphics[page=\mp@pn@mpu@calligraphy,height=11pt]{mpLogos.pdf}}}
\gdef\mp@calligraphy{\usebox{\mp@calligraphy@box}}

%%
%% begin document
%%

\AtBeginDocument{%
%%
%%
\hypersetup{
  pdftitle={\InsertTitle},
  pdfauthor={\InsertStudentName},
  pdfsubject={\InsertProgramme, \InsertThesisType},
  pdfkeywords={\InsertThesisKeywords}
}

\appto\appendix{\addtocontents{toc}{\gdef\protect\@chapapp{\protect\appendixname}}}
\appto\contentsfinish{\gdef\@chapapp{\chaptername}}
\titlecontents{chapter}[0pt]{\addvspace{1.0pc}}{\bf\chaptertitlename~\thecontentslabel.\quad}{\bf}{\hfill\contentspage}

\DeclareRobustCommand{\template@mark}{\makebox[0pt][l]{\hspace*{-1.75cm}\sffamily\scriptsize\color{SeaGreen}\raisebox{-0.85cm}{\mp@thesis@class@disp@code}}}

\fancypagestyle{cover}{
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[LE]{\template@mark}%
}

\fancypagestyle{empty}{
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[LE]{\ifReview\template@mark\fi}%
}

\fancypagestyle{plain}{
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{\small\thepage}%
\fancyfoot[LE]{\ifReview\template@mark\fi}%
}

\fancypagestyle{main}{
\fancyhf{}
\fancyhead[LE]{}
\fancyhead[CE]{\small\sc\nouppercase\leftmark}
\fancyhead[RE]{}
\fancyhead[LO]{\mp@calligraphy}
\fancyhead[CO]{}
\fancyhead[RO]{\small\rm\nouppercase\rightmark}
\fancyfoot[C]{\small\thepage}%
\fancyfoot[LE]{\ifReview\template@mark\fi}%
}

\pagestyle{main}
%%
%%
}%% end of \AtBeginDocument

\newcommand{\ChsTitleFont}[1]{\gdef\mp@chs@title@font{#1}}
\newcommand{\ChtTitleFont}[1]{\gdef\mp@cht@title@font{#1}}
\newcommand{\ChsHeaderFont}[1]{\gdef\mp@chs@header@font{#1}}
\newcommand{\ChtHeaderFont}[1]{\gdef\mp@cht@header@font{#1}}
\newcommand{\ChsTextFont}[1]{\gdef\mp@chs@text@font{#1}}
\newcommand{\ChtTextFont}[1]{\gdef\mp@cht@text@font{#1}}

\ChsTitleFont{gkai}
\ChtTitleFont{bkai}
\ChsHeaderFont{gkai}
\ChtHeaderFont{bkai}
\ChsTextFont{gbsn}
\ChtTextFont{bsmi}

\newcommand{\ChsTitleA}[1]{\begin{CJK}{UTF8}{\mp@chs@title@font}#1\end{CJK}}
\newcommand{\ChtTitleA}[1]{\begin{CJK}{UTF8}{\mp@cht@title@font}#1\end{CJK}}
\newcommand{\ChsHeaderA}[1]{\begin{CJK}{UTF8}{\mp@chs@header@font}#1\end{CJK}}
\newcommand{\ChtHeaderA}[1]{\begin{CJK}{UTF8}{\mp@cht@header@font}#1\end{CJK}}
\newcommand{\ChsTextA}[1]{\begin{CJK}{UTF8}{\mp@chs@text@font}#1\end{CJK}}
\newcommand{\ChtTextA}[1]{\begin{CJK}{UTF8}{\mp@cht@text@font}#1\end{CJK}}

\newcommand{\Keywords}[1]{\par\noindent{\bfseries\itshape Keywords} --- #1}
\newcommand{\ChsKeywords}[1]{\par\noindent\ChsHeaderA{关键字} --- \ChsTextA{#1}}
\newcommand{\ChtKeywords}[1]{\par\noindent\ChtHeaderA{關鍵字} --- \ChtTextA{#1}}

%%
%% document parts (matters)
%%

\let\IfFigureList\iftrue
\define@key{FrontMatter}{FigLs}[true]{\ifstrequal{#1}{true}{\let\IfFigureList\iftrue}{\let\IfFigureList\iffalse}}
\let\IfTableList\iftrue
\define@key{FrontMatter}{TabLs}[true]{\ifstrequal{#1}{true}{\let\IfTableList\iftrue}{\let\IfTableList\iffalse}}
\let\IfAlgorithmList\iffalse
\define@key{FrontMatter}{AlgoLs}[true]{\ifstrequal{#1}{true}{\let\IfAlgorithmList\iftrue}{\let\IfAlgorithmList\iffalse}}
\let\IfAbbreviationList\iftrue
\define@key{FrontMatter}{AbbreLs}[true]{\ifstrequal{#1}{true}{\let\IfAbbreviationList\iftrue}{\let\IfAbbreviationList\iffalse}}

\newenvironment{FrontMatter}[1][]{%
%%
%%
\setkeys{FrontMatter}{#1}%

\begin{titlepage}
\ifHardback\ifReview\else
\pagestyle{empty}
\doublespacing\MakeHardback \cleardoublepage
\fi\fi
\pagestyle{cover}
\doublespacing\MakeCover \cleardoublepage
\ifReview\else%
\pagestyle{empty}
\doublespacing\MakeCopyright \cleardoublepage%
\fi
\pagestyle{empty}
\doublespacing\MakeTitle \cleardoublepage
\end{titlepage}

\dominitoc

\frontmatter
%%
%%
\pagenumbering{roman}
\renewcommand{\chaptermark}[1]{\markboth{##1}{}}
\renewcommand{\contentsname}{Table of Contents}
\doublespacing
%%
%%
}{
%%
%%
\onehalfspacing
\tableofcontents\markboth{\contentsname}{}%
\IfFigureList%
  \listoffigures\adjustmtc
\fi%
\IfTableList%
  \listoftables\adjustmtc
\fi%
\IfAlgorithmList%
  \listofalgorithms\addcontentsline{toc}{chapter}{\listalgorithmname}\markboth{\listalgorithmname}{}\adjustmtc
\fi%
\IfAbbreviationList%
  \printglossary[nopostdot,nonumberlist,title={List of Abbreviations}]\adjustmtc
\fi%
\mtcfixglossary%
%%
%%
}%% end of FrontMatter

\newenvironment{ChsAbstract}{%
%%
%%
\cleardoublepage\thispagestyle{plain}
\vspace*{20pt}
\begin{center}
\ChsTitleA{\large\mp@chs@title}
\end{center}
\vspace*{30pt}
\begin{center}
\ChsHeaderA{\large 摘要}
\end{center}
\vspace*{20pt}
\par\noindent%
\begin{CJK}{UTF8}{\mp@chs@text@font}\ignorespaces
%%
%%
}{
%%
%%
\end{CJK}
%%
%%
}%% end of ChsAbstract

\newenvironment{ChtAbstract}{%
%%
%%
\cleardoublepage\thispagestyle{plain}
\vspace*{20pt}
\begin{center}
\ChtTitleA{\large\mp@cht@title}
\end{center}
\vspace*{30pt}
\begin{center}
\ChtHeaderA{\large 摘要}
\end{center}
\vspace*{20pt}
\par\noindent%
\begin{CJK}{UTF8}{\mp@cht@text@font}\ignorespaces
%%
%%
}{
%%
%%
\end{CJK}
%%
%%
}%% end of ChtAbstract

\newenvironment{MainMatter}{%
%%
%%
\mainmatter
%%
%%
\pagenumbering{arabic}
\ifOneHalfSpacing%
  \onehalfspacing%
\else%
  \doublespacing%
\fi%
%%
%%
}{
%%
%%
}%% end of MainMatter

\newenvironment{BackMatter}{%
%%
%%
\pagestyle{fancy}
\backmatter
%%
%%
\renewcommand{\chaptermark}[1]{\markboth{##1}{}}
\onehalfspacing
%%
%%
}{
%%
%%
}%% end of BackMatter

\newenvironment{Appendix}{
%%
%%
\appendix
\onehalfspacing
%%
%%
}{
%%
%%
\clearpage\pagestyle{empty}
%%
%%
}%% end of Appendix

\AtEndDocument{
  \cleardoublepage\pagestyle{cover}
  \vspace*{\fill}
  \begin{flushright}
    \resizebox{3in}{!}{\mp@double@text@logo}
  \end{flushright}
  \cleardoublepage
}

\newenvironment{BlindRegion}{}{}
\newcommand{\BlindText}[1]{#1}

\ifBlind
  \ifPrgJoint
    \PrgPCOMtrue \PrgPAIDDfalse \PrgPETIfalse \PrgJUCfalse \PrgJUBfalse \PrgJointfalse
  \fi

  \renewcommand{\EmphasizeAuthors}[1]{}
  \renewcommand{\BlindText}[1]{}

  \RequirePackage{comment}
  \excludecomment{BlindRegion}
\fi

\endinput

%%
%% $Id: mpThesis.cls 9221 2026-05-06 10:54:45Z wke@IPM.EDU.MO $
