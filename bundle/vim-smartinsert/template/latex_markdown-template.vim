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

template |begin|
\begin{$1:____}
____
\end{$1:____}
endtemplate

template |author|
\author{____}
endtemplate

template |begin-doc|
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

template |item|
\begin{itemize}
____
\end{itemize} 
endtemplate 

template |enumerate|
\begin{enumerate}
____
\end{enumerate} 
endtemplate 

template |i|
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

<<<<<<< HEAD
template |use-tikz|
\usepackage{tikz}
endtemplate

template |tikzpicture|
\begin{tikzpicture}
____
\end{tikzpicture}
endtemplate

template |tikz-step|
____. ____;
endtemplate

template |tikz-draw-line|
% [->, line width=,color], coordinates
\draw [____] (____,____) -- (____,____);
endtemplate

template |tikz-grid|
\draw [____,help lines] (____,____) -- (____,____);
endtemplate

template |tikz-uncover|
\uncover<____>{____}
endtemplate

template |tikz-node|
\draw [____] (____,____) node[below]{____} -- (____,____);
endtemplate

template |tikz-nodetext|
% text alignment, alignment for text wrt dot
node[align=____,____]{____}
endtemplate

template |tikz-draw-curve|
% [->, line width=,color], coordinates
\draw [____] (____,____) to [out=____,in=____] (____,____);
endtemplate
