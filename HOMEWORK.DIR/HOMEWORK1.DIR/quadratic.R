\section{5 points}
The quadratic formula (2) is used to solve equations of the form:
  \begin{equation}
ax^2 + bx + c = 0
\end{equation}
\begin{equation}
\text{The quadratic formula is }x = \frac {-b \pm \sqrt {b^2 - 4ac}}{2a} 
\end{equation}
\begin{equation}
\text{The discriminant of this equation is} ~~ b^2 - 4ac
\end{equation}

If the discriminant is equal to zero then the solution(s) to the equation are:
  
  \begin{equation}
root1 = \frac {-b + \sqrt{b^2 - 4ac}}{2a}
\end{equation}
\begin{equation}
root2 = \frac {-b - \sqrt{b^2 - 4ac}}{2a}
\end{equation}

Else, if the discriminant is equal to zero then the solutions to the equation are repeated:
  
  \begin{equation}
root1 = \frac {-b}{2a} ~~ root2 = \frac{-b}{2a}
\end{equation}

Else if the discriminant value is less than zero then there are no solutions to the
equation so we set the roots to NA:
  
  Write a function called myqaud that takes as input a three element numeric vector that represents the coefficients, (a,b,c), of a polynomial. Your function will return a two element vector that contains the roots of the as determined by the logic given above. Also please put in error checking logic up front that looks for values of a and b that are zero. In that case stop the processing with an informative error message such as "a and b are equal to zero - invalid input".


\section{DNA generator and compliment}

\section{median ?}
root1 = NA ~~ root2 = NA