template |go|
\documentclass[a4paper]{report}    
\usepackage[a4paper,left=2.6cm,right=2.4cm,top=2.54cm,bottom=2.54cm]{geometry} % ...set margin
\usepackage[utf8]{inputenc}                                                    % ...unicode enable
\usepackage{graphicx}                                                          % ...graphic support
\usepackage{bm}                                                                % ...bold face in equation
\usepackage{fancyhdr}                                                          % ...header and footer
\usepackage{amsmath}                                                           % ...math
\usepackage{listings}                                                          % ...code
\usepackage{xcolor}                                                            % ...text color
\usepackage{xparse}                                                            % ...parse syntax

% Constants...
\setlength\parindent{0pt}

% Macro...
% ...code
\NewDocumentCommand{\codeword}{v}{\texttt{\textcolor{blue}{#1}}}

\title{____}

\begin{document}
____
\end{document}
endtemplate


template |\documentclass|
\documentclass[____]{____}
endtemplate

template |\usepackage|
\usepackage{____}
endtemplate

template |\setlength|
\setlength{__var__}{__val__}
endtemplate

template |\renewcommand|
\renewcommand{__command__}{__val__}
endtemplate

template |\hspace|
\hspace{____}
endtemplate

template |\vspace|
\vspace{____}
endtemplate

template |\parskip|
\parskip
endtemplate

template |\parindent|
\parindent
endtemplate

template |\indent|
\indent
endtemplate

template |\noindent|
\noindent
endtemplate

template |\pagebreak|
\pagebreak[____]
endtemplate

template |\newpage|
\newpage
endtemplate

template |\clearpage|
\clearpage
endtemplate

template |\cleardoublepage|
\cleardoublepage
endtemplate

template |\textwidth|
\textwidth
endtemplate

template |\textheight|
\textheight
endtemplate

template |align.center|
\begin{center}
    ____
\end{center}
endtemplate

template |itemize|
\begin{itemize}

    ____

\end{itemize}
endtemplate

template |enumerate|
\begin{enumerate}
    ____
\end{enumerate}
endtemplate

template |labelstyle|
\renewcommand{\labelitem__level:i__}{__label:*__}
endtemplate

template |bibliography|
\begin{bibliography}
____
\end{bibliography}
endtemplate

template |\bibitem|
\bibitem{__key__} __content__
endtemplate

template |\cite|
\cite{__key__}
endtemplate

template |\makebox|
\makebox[__width__][__pos__]{__text__}
endtemplate

template |\begin|
\begin{__name__}
____
\end{__name__}
endtemplate

template |\put|
\put(____,____){____}
endtemplate

template |\framebox|
\framebox(____,____)[____]{____}
endtemplate

template |\section|
\section{____}
endtemplate


template |figure.include|
\includegraphics[__width=\textwidth,height=0.8\textheight,keepaspectratio__]{__figures/IP.PNG__}
endtemplate


template |\includegraphic|
\includegraphics[__width=\textwidth,height=0.8\textheight,keepaspectratio__]{__figures/IP.PNG__}
endtemplate


template |graphics_include|
\includegraphics[__width=\textwidth,height=0.8\textheight,keepaspectratio__]{__figures/IP.PNG__}
endtemplate


template |equation|
\begin{equation}
    ____
\end{equation}
endtemplate


template |aligned|
\begin{aligned}
    ____
\end{aligned}
endtemplate


template |\pagecolor|
\pagecolor{green!30}
endtemplate


template |beamer.frame|
%%%%
\begin{frame}
\frametitle{____}

____

\end{frame}
endtemplate


template |2columns|
\begin{columns}
\begin{column}{0.5\textwidth}
    \begin{center}
    \includegraphics[width=0.8\textwidth,height=\textheight,keepaspectratio]{figures/____}
    \end{center}
\end{column}
\begin{column}{0.5\textwidth}  %%<--- here
    \begin{center}
    \includegraphics[width=0.8\textwidth,height=\textheight,keepaspectratio]{figures/____}
    \end{center}
\end{column}
\end{columns}

endtemplate


template |line.dot|
\dotfill
endtemplate


template |line.solid|
\hrulefill
endtemplate


template |figure.example|
% Insert the figure HERE and TOP..
\begin{figure}[!ht]    
\includegraphics[__width=\textwidth,height=0.8\textheight,keepaspectratio__]{__./figures/eulerangles.png__}
\caption{__An illustration of Euler angles.  __}
\label{__fig:eulerangle__}
\end{figure}
endtemplate


template |center|
\centering
endtemplate


template |code.block|
\begin{lstlisting}[language=__bash__,breaklines=true]
__code__
\end{lstlisting}
endtemplate


template |code.inline|
\lstinline{__code__}
endtemplate


template |code.mint.block|
\begin{minted}[bgcolor=codebg,autogobble,breaklines,escapeinside=||]{__python__}
____
\end{minted}
endtemplate

template |code.mint.inline|
\mintinline[bgcolor=codebg,escapeinside=||]{text}{____}
endtemplate
