#====[Macro]========
% Quick create a new doc
template |new-doc|
\documentclass{$article:____} 
\usepackage[margin=____in]{geometry} 
\usepackage{graphicx} 

\begin{document}

____

\end{document}
endtemplate

template |newcommand|
\newcommand{$\command:____}[$num:____]{$definition(#1,#2 as args):____}
endtemplate

#====[Layout]========
template |section|
\section{____}
endtemplate

template |subsection|
\subsection{____}
endtemplate

template |begin|
\begin{$1:____}
____
\end{$1:____}
endtemplate

template |enumerate|
\begin{enumerate}
____
\end{enumerate} 
endtemplate 

template |itemize|
\begin{itemize}
    ____
\end{itemize}
endtemplate

template |i|
\item ____
endtemplate

template |item|
\item ____
endtemplate

template |align|
\begin{aligned}
____ & ____ \\
____ & ____ 
\end{aligned}
endtemplate

template |minipage|
\begin{minipage}[b]{____\textwidth}
____
\end{minipage}
endtemplate

template |comment.section|
%====[____]========
endtemplate


#====[Markup]========
template |bold|
\textbf{____}
endtemplate

template |equation|
\begin{equation} 
____
\end{equation}
endtemplate

template |figure|
\begin{figure}[h] 
\centering 
\includegraphics[$width:____=$textwidth:____]{$path:____}
\caption{____} 
\end{figure}
endtemplate


#====[Modulize LaTeX]========
template |usepack|
\usepackage{____}
endtemplate

template |input|
\input{$file:____}
endtemplate

template |include|
\include{$file:____}
endtemplate


