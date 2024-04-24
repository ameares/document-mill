\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mntemplate}[2022/07/15 v1.0 Template Class]

\LoadClassWithOptions{article} % Base class

% Title, author, and date setup
\newcommand{\docauthor}{Unknown Author}
\newcommand{\docsubject}{Unknown Subject}
\newcommand{\doctitle}{Untitled Document}

\newcommand{\setdocauthor}[1]{\renewcommand{\docauthor}{#1}}
\newcommand{\setdocsubject}[1]{\renewcommand{\docsubject}{#1}}
\newcommand{\setdoctitle}[1]{\renewcommand{\doctitle}{#1}}

% % Page layout
\usepackage[
  letterpaper,
  left=0.65in,
  right=0.65in,
  top=1in,
  bottom=1in,
]{geometry}

\usepackage{hyperref} % for hyperlinks
\usepackage{amsmath} % for math equations
\usepackage{graphicx} % for images
\graphicspath{{./template/images/}{./docs/images/}}
\usepackage{longtable} % for tables that span multiple pages
\usepackage[usenames,dvipsnames]{xcolor} % for color names

\usepackage{enumitem,amssymb} % for checklists
\newlist{checklist}{itemize}{1}
\setlist[checklist]{label=$\square$}

\usepackage{menukeys} % for keyboard keys
\usepackage{amssymb} % for some symbols (checkbox)
\usepackage{tabularx} % for tables
\usepackage{booktabs} % Always booktabs
\usepackage{setspace} % for line spacing
\usepackage{microtype} % Always be kearning
\usepackage{ulem} % for underlining

% Set the style for keys
%\setkeys{shadowedroundedkeys} % Draws keys with a shadow and rounded corners
% Set the style for menu sequences
%\setmenu{angularmenus} % Draws menus with angular corners
\renewmenumacro{\keys}{shadowedroundedkeys}

% Define pzd Dingbats font
\DeclareFontFamily{U}{pzd}{}
\DeclareFontShape{U}{pzd}{m}{n}{
  <-6> pzdr <6-8> pzdr <8-> pzdr
}{}

% Define \rightpointright
\newcommand{\rightpointright}{\scalebox{1.2}{\fontencoding{U}\fontfamily{pzd}\selectfont\char43\,\relax}}

% For the date format
\usepackage{datetime}
\newdateformat{mydate}{\twodigit{\THEMONTH}/\twodigit{\THEDAY}/\twodigit{\THEYEAR}}

% Header and footer
\usepackage{fancyhdr}  
\pagestyle{fancy}
\setlength{\headheight}{15pt}
\setlength{\footskip}{35pt}

% Header Setup
\fancyhead[L]{}
\fancyhead[C]{}
\fancyhead[R]{\mydate\today}

% Footer Setup
% \fancyfoot[L]{%
%   \vbox to 10mm{%
%     \vfill
%     \hbox to \linewidth{\docauthor\hfill}%
%     \vfill
%   }%
% }
\fancyfoot[L]{}
\fancyfoot[C]{\includegraphics[height=10mm]{mnLogo_large.png}}
\fancyfoot[R]{%
  \vbox to 10mm{%
    \vfill
    \hbox to \linewidth{\hfill\thepage}%
    \vfill
  }%
}

\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}

\makeatletter
\renewcommand{\@seccntformat}[1]{}
\makeatother

\newcommand{\makecustomtitle}{
  \begin{center}
  \Large\textbf{\doctitle}
  \end{center}
  \medskip
}

% Define a new command \ra for the right arrow
\newcommand{\ra}{\(\rightarrow\)}

% Define default document type
\newcommand{\doctype}{}

% Command for setting document type
\newcommand{\setdoctype}[1]{\renewcommand{\doctype}{#1}}

% Define commands for product and status document types
\newcommand{\productdoc}{
  \setdoctype{product}
  % Redefine makecustomtitle for product documents
  \renewcommand{\makecustomtitle}{
    \begin{center}
      \Large\textbf{\doctitle}
    \end{center}
    \medskip
  }
}

\newcommand{\statusdoc}{
  \setdoctype{status}
  % Redefine makecustomtitle for status documents
  \renewcommand{\makecustomtitle}{}
  % Adjust headers/footers as needed
  \fancyhead[C]{\doctitle}
  \fancyhead[L]{\docauthor}
  \fancyfoot[L]{}
  \fancyfoot[R]{}
}

\newcommand{\burnreport}[1]{
  \setdoctype{burnreport}
  % Redefine makecustomtitle for status documents
  \renewcommand{\makecustomtitle}{}
  % Adjust headers/footers as needed
  \fancyhead[C]{\doctitle}
  \fancyhead[L]{#1}
  \fancyfoot[L]{}
  \fancyfoot[C]{\includegraphics[height=10mm]{rosie1.png}}
  \fancyfoot[R]{%
  \vbox to 10mm{%
    \vfill
    \hbox to \linewidth{\hfill\thepage / 2}%
    \vfill
  }%
}
}

% Define the macro
\newcommand{\wsinfosection}{
    \begin{spacing}{1.5}
    \noindent Date: \rule{5cm}{0.4pt} \\
    \noindent Device Type: \rule{5cm}{0.4pt} \\
    \noindent Firmware Version: \rule{5cm}{0.4pt} \\
    \noindent Technician: \rule{5cm}{0.4pt}
    \end{spacing}
}

\newcommand{\wspassfail} {
    $\square$ \textbf{Pass} \quad $\square$ \textbf{Fail} \quad
}

\newcommand{\wsentry}[1]{
    #1 \rule{5cm}{0.4pt}
}

\title{\doctitle}
\author{\docauthor}
\date{\today}

\endinput