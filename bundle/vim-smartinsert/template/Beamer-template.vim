template |new-presentation|
\documentclass{beamer}
\usepackage{xcolor}

\title{____}
\author{____}
\setbeamertemplate{navigation symbols}{}    %remove navigation symbols

\begin{document}
\maketitle

\begin{frame}
\frametitle{____}
____
\end{frame}

\end{document}
endtemplate

template |frame|
\begin{frame}[fragile]
\frametitle{____}
____
\end{frame}
endtemplate

template |theme|
\usetheme{____}
endtemplate

template |ps|
\pause
endtemplate

template |column|
\begin{columns}
\column{____\textwidth}
____
\column{____\textwidth}
____
\end{columns}
endtemplate

template |frequent-header|
\usepackage[latin1]{inputenc}
\usefonttheme{professionalfonts}
\usepackage{times}
\usepackage{tikz}
\usepackage{amsmath}
\usepackage{verbatim}
\usetikzlibrary{arrows,shapes}
endtemplate

template |textblock|
\begin{textblock}{12.5}(0.5,0.5)
\centering
____
\end{textblock}
endtemplate
