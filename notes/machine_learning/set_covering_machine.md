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

The Set Covering Machine (SCM) was developed with the goal of providing models as generalizable as SVM with sparser models. It does so by selecting the junction (or disjunction) of a subset of Boolean features. The requirement of Boolean features requires a function that converts features to Boolean-valued, if they are not in that form. The main improvement of SCM over previous methods is that it allows to control the trade-off between complexity and accuracy. The VC dimension of the SCM is not defined whenever it uses data-dependent features.

# The Set Covering Machine

We won't usually start from Boolean features, but more likely from an input space $X$ in $\rm I\!R^n$. $x$ represents an n-dimensional vector in $X$ containing all the values for a particular feature. We define functions $h_i(x)$ that map $x$ onto $\{0,1\}$. The goal is, given any set $H = \{h_i(x)\}_{i=1}^{|H|}$ that return a small subset $R \subset H$ of features. Given the subset $R$ and an arbitrary input vector $x$, the output $f(x)$ of the SCM is defined to be

$$f(x) =
\begin{cases}
\lor_{i \in R}h_i(x) \text{ for a disjunction} \\
\land_{i \in R}h_i(x) \text{ for a conjunction}
\end{cases}$$

We will say that a feature is *consistent* with a set of examples if it correctly classifies all the examples in that set.

Valiant defined an algorithm which, given a set of $m$ training examples and a set $H$ of features, found the subset $C \subseteq H$ of all the features which are consistent with all the *positive* training examples and, in consequence, $\land_{i\in C}h_i(x)$ is consistent with them too. In order for $\land_{i\in C}h_i(x)$ to be consistent with *all* $m$ training examples, there must exist a subset $E$ of $C$ such that $\land_{i\in E}h_i(x)$ is consistent with *all* $m$ training examples. However, as $|C|$ is likely to be large, we might find subsets of $C$ that return smaller generalization errors.

# References

* Marchand, M., & Shawe-Taylor, J. (2002). The Set Covering Machine. Journal of Machine Learning Research, 3, 723–746. https://doi.org/10.1162/jmlr.2003.3.4-5.723
