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

template |list.itemize|
\begin{itemize}
____
\end{itemize}
endtemplate

template |list.enumerate|
\begin{enumerate}
____
\end{enumerate}
endtemplate

template |list.labelstyle|
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

template |\includegraphic|
\includegraphics[____]{____}
endtemplate
