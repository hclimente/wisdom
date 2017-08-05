<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    TeX: {
      equationNumbers: {
        autoNumber: "AMS"
      }
    },
    tex2jax: {
      inlineMath: [ ['$','$'] ],
      displayMath: [ ['$$','$$'] ],
      processEscapes: true,
    }
  });
</script>
<script type="text/javascript"
        src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>

$X$ is a vector $X^T=(X_1, X_2,...,X_p)$).

$\textbf{X}$ is the $N \times (p+1)$ matrix, with each row an input vector with a 1 in the first positions. It is composed by column vectors $\textbf x_0$, $\textbf x_1$, ..., $\textbf x_p$.

\textbf{y} is the N-vector of the outputs.

Training data ($x_1,y_1$), ..., ($x_N,y_N$), where each $x_i = (x_{i1}, x_{i2},...,x_{ip})^T$.

$E(Y|X)$ is the regression function.
