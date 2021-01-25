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
%Slide
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

template |layout.column2|
\begin{columns}
    % Column left
    \column{____\textwidth}
    ____

    % Column right
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


template |tikz.picture|
\begin{tikzpicture}
____
\end{tikzpicture}
endtemplate


template |tikz.node.figure|
\node[] (__var_name__) at (__-2.9__,__0.0__) { 
    \includegraphics[width=__35mm__,keepaspectratio]{__figure__}
};
endtemplate


template |tikz.node.text|
\node[] (__var_name__) at (__2.9__,__0.0__) { 
    \begin{minipage}{0.50\textwidth}
        \fontsize{5}{6}\selectfont 
        __text__
    \end{minipage}
};
endtemplate


template |minipage|
\begin{minipage}
    ____
\end{minipage}
endtemplate


template |\begin|
\begin{__tag__}
    ____
\end{__tag__}
endtemplate


template |picture|
\begin{picture}(0,__100mm__)
    \put(0,0) {
        __content__
    }
\end{picture}
endtemplate


template |column1|
\begin{columns}
    \column{\dimexpr\paperwidth-10pt}
    ____
\end{columns}
endtemplate


template |figure.full|
\begin{figure}[!ht]
    \centering
    \includegraphics[width=__1.0\textwidth,keepaspectratio__]{__./figures/ESTMs.png__}
\end{figure}
endtemplate


template |figure.half|
\begin{figure}[!ht]
    \centering
    \includegraphics[height=__0.8\textheight,keepaspectratio__]{__./figures/ESTMs.png__}
\end{figure}
endtemplate


template |layout.guideline|
\begin{frame}[fragile]
\frametitle{Title}
\begin{picture}(6.665in,3.75in)
    % Sample code to include a graphic
    %\put(0in,0.4in){\includegraphics[height=0.9\textheight,keepaspectratio]{./figures/u02.intracellular.eps}}

    % Display the framebox
    \put(0in, 0.4in){\framebox(\textwidth,\textheight){}}

    % Display the guideline
    \put(0in, 0.0in){\line(1,0){6.0in}}
    \put(0in, 0.5in){\line(1,0){6.0in}}
    \put(0in, 1.0in){\line(1,0){6.0in}}
    \put(0in, 1.5in){\line(1,0){6.0in}}
    \put(0in, 2.0in){\line(1,0){6.0in}}
\end{picture}
\end{frame}
endtemplate
