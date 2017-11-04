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

# Bijection

A bijection, bijective function or one-to-one correspondence is a function between the elements of two sets, where each element of one set is paired with exactly one element of the other set, and each element of the other set is paired with exactly one element of the first set ([Wikipedia](https://en.wikipedia.org/wiki/Bijection)).

# Indicator function

An indicator function or a characteristic function is a function defined on a set X that indicates membership of an element in a subset A of X, having the value 1 for all elements of A and the value 0 for all elements of X not in A ([Wikipedia](https://en.wikipedia.org/wiki/Indicator_function)).

$$\mathbf{1}_A \colon X \to \{ 0,1 \}$$

defined as

$$\mathbf{1}_A(x) :=
\begin{cases}
1 &\text{if } x \in A, \\
0 &\text{if } x \notin A.
\end{cases}$$

It is also represented as $I_A$.

# Markov random fields

A Markov random field (MRF) is a set of random variables having a Markov property described by an undirected graph ([Wikipedia](https://en.wikipedia.org/wiki/Markov_random_field)). It differs from Bayesian networks, which are directed and acyclic (DAG), while MRF are undirected and might be cyclic.

Given an undirected graph $G=(V,E)$, a set of random variables $X = (X_v)_{v\in V}$ indexed by $V$ form a Markov random field with respect to $G$ if they satisfy three, non-equivalent, local Markov properties:

- Pairwise Markov property: Any two non-adjacent variables are conditionally independent given all other variables:

  $$X_u \perp\!\!\!\perp X_v \mid X_{V \setminus \{u,v\}} \quad \text{if } \{u,v\} \notin E$$

- Local Markov property: A variable is conditionally independent of all other variables given its neighbors:

  $$X_v \perp\!\!\!\perp X_{V\setminus \operatorname{N}[v]} \mid X_{\operatorname{N}(v)}$$

  where $\operatorname{N}(v)$ is the set of neighbors of $v$, and $\operatorname{N}[v] = v \cup \operatorname{N}(v)$ is the closed neighbourhood of $v$.

- Global Markov property: Any two subsets of variables are conditionally independent given a separating subset:

  $$X_A \perp\!\!\!\perp X_B \mid X_S$$

  where every path from a node in $A$ to a node in $B$ passes through $S$.

# Monotonic function

A monotonic function is a function between ordered sets (such as real numbers) that preserves of reverses the given order ([Wikipedia](https://en.wikipedia.org/wiki/Monotonic_function)).

# Positive definite matrix

A symmetric $n \times n$ n real matrix $M$ is said to be positive definite if the scalar $z^T M z$ is positive for every non-zero column vector $z$ of $n$ real numbers ([Wikipedia](https://en.wikipedia.org/wiki/Positive-definite_matrix)).
