template |code|
```
____
```
endtemplate


template |figure|
\begin{figure}[h] 
\centering 
\includegraphics[____=____]{____}
\caption{____} 
\label{____} 
\end{figure}
endtemplate

template |equation|
\begin{equation} 
____
\end{equation}
endtemplate

template |align|
\begin{aligned}
____ & ____ \\
____ & ____ 
\end{aligned}
endtemplate

template |split|
\begin{split}
____ & ____ \\
____ & ____
\end{split}
endtemplate

template |cases|
\begin{cases}
____ & ____ \\
____ & ____
\end{cases}
endtemplate

template |comment|
<!--
____
-->
endtemplate

template |multicol|
\begin{multicols}{____}
    ____ \par 
    ____ \par 
\end{multicols}
endtemplate

template |code|
```
____
```
endtemplate

template |ft|
[^____]

[^____]: ____
endtemplate


template |dfrac|
\dfrac{____}{____}
endtemplate

# latex only templates...
template |documentclass|
\documentclass{____}
endtemplate

template |beginblock|
\begin{$1:____}
____
\end{$1:____}
endtemplate

template |author|
\author{____}
endtemplate

template |begindoc|
\begin{document}
____
\end{document}
endtemplate

template |title|
\title{____}
endtemplate

template |maketitle|
\maketitle
endtemplate

template |callop|
{____}
endtemplate

template |section|
\section{____}
endtemplate

template |subsection|
\subsection{____}
endtemplate

template |bold|
\textbf{____}
endtemplate

template |geometry|
\usepackage[margin=____]{geometry}
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

template |im|
\item ____
endtemplate 

template |verb|
\texttt{____}
endtemplate 

template |verbatimize|
\usepackage{verbatim}
endtemplate 

template |use|
\usepackage{____}
endtemplate 

template |new-doc|
\documentclass{article} 
\usepackage[margin=0.5in]{geometry} 
\usepackage{graphicx} 

\begin{document}

____

\end{document}
endtemplate

template |subsubsection|
\subsubsection{____}
endtemplate
