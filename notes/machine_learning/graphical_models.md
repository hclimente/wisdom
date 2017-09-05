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

Graphical models (GM) are machine learning methods that work in the junction of probabilistic theory and graph theory. First they build declarative knowledge as multivariate distributions among random variables using graphs. These variables are linked by edges, allowing then the model to "reason" on it to reach the output in a computationally tractable manner. This ability to build declarative knowledge makes it different from other machine learning approaches which simply map inputs to outputs. This presents several advantages, like robustness to noise, improved accuracy, and the ability to represent the model compactly and in a visually appealing way.

# Joint probabilities and graphs

Our inputs are a set of random variables $X = {X_1, X_2}$, and the set of their realization vectors (be it real or discrete values) $x = {x_1, x_2}$. We will work with binary $X_i$ for simplicity. In consequence, we will use their probability mass function, the function that gives the probability that a discrete random variable is equal to some value:

$$p(x_1,...,x_n):=P(X_1=x_1,...,X_n=x_n)$$

or

$$p(x)=P(X=x).$$

The joint distribution $p(x)$ is hard to compute and store. The chain rule gives a factorization of the joint distribution:

$$p(x_1,...,x_n)=\prod_{i=1}^n p(x_i|x_1,...,x_i-1).$$

For our example binary we would need an n-dimensional contingency table, whose size grows exponentially with the number of variables. For qualitative, non-binary variables, it also grows exponentially with the number of possible values. Using graphs allows to store joint probabilities in a compact way.

A graph is a pair $G=(V,E)$ where $V$ is a set of nodes and $E$ a set of edges. Each node $i \in V$ is associated with a random variable $X_i$, and both terms will be used interchangeably.

## Directed acyclic graphs

In directed acyclic graphs (DAG) edges have a direction and the graph is acyclic. Every node $i$ has a set of parents $\pi_i$ composed by the nodes directly pointing to that node. In directed graphical models we write the joint distribution only in terms of parents:

$$p(x_1,...,x_n):=\prod_{i=1}^n p(x_i|x_{\pi_i})$$

This joint distribution fulfills the properties of a proper distribution i.e. being non-negative and summing to one. It is also simpler than the factorization obtained above applying the chain rule. By leveraging in local network properties, instead of global properties, the storage cost is exponential to the number of parents.

## Undirected graphs

When edges have no directions, we cannot define parents, and we cannot apply the formula above. There are however approaches to use graphical models on undirected graphs: undirected graphical models or Markov random fields. One apparently straightforward option to define locality properties over each node on the basis of its neighbors. We need to define locality for a compact representation of the joint distribution. While in the DAG context we did it with the "parents", in the undirected we could do it with the neighbors. \REDO{Using conditional probabilities of nodes given their neighbors its hard to use consistency (Check slides i got lost)}. Instead, we are going to define locality in terms of maximal cliques, cliques such that we cannot add any new node and still have a clique. (Note: the simplest possible clique is a single edge.) Let $C$ be indices of a maximal clique in $G$, let $\mathcal{C}$ be the set of all such maximal cliques C.

As we saw in \REDO, we cannot use conditional distributions in the maximal clique to calculate joint probabilities, as they might be inconsistent. We define an arbitrary potential function $\psi_C(x_C)$ that only depends on the values of the maximum clique of X_C:

$$p(x):=\frac{1}{Z} \prod_{C \in \mathcal{C}}\psi_{X_C}(x_c)$$

where Z is a normalization constant to make p(x) between 0 and 1

$$Z:=\sum_x \prod_{C\in\mathcal{C}} \psi_{X_C}(x_c).$$

Can we use marginal probabilities as potential functions? Their product does not equal the joint probability, so we cannot use them either. Hence, potential functions will not have a local probabilistic interpretation, although they often have a pre-probabilistic interpretation, keeping a meaning of "potential", "constraint" or "energy" that favor some configurations and hinder others.

## Conditional independence

The ability of graphical models to compactly store complex multivariate distributions is possible thanks to the assumption of conditional independence between some variables. Specifically, between those variables that are not connected. We say that two variables $X_A$ and $X_B$ are independent ($X_A \perp X_B$) if

$$p(x_A,x_B) = p(x_A)p(x_B).$$

Equivalently, $X_A$ and $X_C$ are independent given $X_B$ ($X_A \perp X_C | X_B$) if

$$p(x_A,x_C|x_B) = p(x_A|x_B)p(x_C|x_B)$$

$$p(x_A|x_B,x_C) = p(x_A|x_B).$$

In other words, $X_A$ does not give new information about $X_C$ once I know $X_B$.

Let's explore these concepts in three simple graphs:

- X -> Y -> Z; $X \perp Z|Y$. "The future (Z) is independent of the past (X) given the present (Y)."

  $$p(x,y,z)=p(x)p(y|x)p(z|y)$$

  which implies that

  $$p(z|x,y)=\frac {p(x,y,z)}{p(x,y)}=\frac {p(x)p(y|x)p(z|y)}{p(x)p(y|z)}=p(z|y).$$

- Y(->X)(->Z); $X \perp Z|Y$. For example, X = lung cancer, Z = lighter in pocket, Y = smoking. Smoking causes lung cancer and also walking with a lighter in the pocket.

  $$p(x,y,z)=p(y)p(x|y)p(z|y)$$

  which implies that

  $$p(z|x,y)=\frac {p(x,y,z)}{p(x,y)}=\frac {p(x)p(y|x)p(z|y)}{p(x)p(y|z)}=p(z|y)$$

- (X->)(Z->)Y; $X \perp Z$. However they become dependent if we condition on Y.

### Independence and d-separation

We try to go from one node variable to another following the edges; f we can't, the variables are conditionally independent. However, there are blocks......

Regarding undirected graphs, we can still use graph separation to get conditional independence.

## Dual characterization of graphical models

### Directed graphical models

1. Probability theory: ... The algebraic form is what allows us to store compactly the information.

2. Graph theory: Give me the set of distributions that match all those conditions.

They both are the same!

* We don't specify the form of the probability function

### Undirected graphical models

The two notions are still equivalent!

# Graph structure

When we learn the graphical model, we create a graph. But What do edges mean? it might mean correlation. But in many interesting systems, everything is correlated to everything and we have useless, very dense graphs. Causation? Hard to assess. A good compromise is conditional (in)dependence: we will only put an edge between conditionally dependent genes.

# Factor functions.

We also create a set of factor functions. These functions are local, and represent multivariate distributions. For that, we usually need to decide which form the factor functions will take (Normal? Bernouilli?), and to parametrize the factor functions. These classical parametric graphical models are useful in bioinformatics, where you don't have enough data to train a model with too many parameters. Usually they focus on cliques of size 2 in order to keep the factors simple/depend on a few values. Some examples are:

- Ising models, a kind of categorical graphical models used when the variables are binary.
- Multinomial/Discrete graphical models.
- Gaussian graphical models: parametrize as multivariate Gaussian distribution. Useful when variables are thin-tailed continuous. In this case, the edge weight have a probabilistic interpretation.

In the univariate case, all of them belong to Exponential family distributions ie they share a form $copy$. The node-conditional node distribution can also be specified in a general form: ... This is very useful when each node follows a different distribution (e.g. many are Gaussian, others are counts and require Poisson, etc.).

Is there a consistent joint distribution? (Joint distributions are dangerous as we saw, they are not guaranteed to be consistent.)

?? We only depend on sufficient statistics from the nodes. We are learning a weighted adjacency matrix and the type of exponential function for each variable.

# Reduced parametrization

The algebraic form of conditional independence allows for many manipulations. However, we can impose more constraints to further reduce parametrization when necessary.

## Example 1

a node with 50 parents require too many values to be stored (2^50). But instead, we can use a logistic regression, that requires only 50 parameters.

## Example 2

Three nodes connected to each other. The maximum clique is the entire graph. ??

# Learning

We have access to iid samples drawn from unknown graphical model distribution. The more assumptions we make on the underlying model, the less data we need. Non-parametric requires lots of data. Constraining to one distribution might be too restrictive. We can give the learner a set of possible functions and it learns which is the best one.

## Learning undirected graphical models

2 step procedure:

1. Model selection: estimate the graph structure.
  - Score-based approaches: we will search over a space of graphs (prior knowledge). Each graph will have a score, representing how well the graph fits the data.
  - Constraint-based approaches: estimate individual edges by hypothesis testing for conditional independences.
2. Parameter inference: given the graph structure, learn the factor functions.

The space of graphs is huge; its an NP-hard problem, so we rely on heuristics, using methods of neighborhood estimation. Usually, methods using high-dimensional ... are more efficient, although we can just go for hypothesis testing.

The computation of just the normalization constant is NP hard... Everything is NP hard lol.

We start by a full graph and check which edge weights are not 0. We compute a sparse logistic regression model to estimate this. We can parallelize this. Then we can use AND or OR operator to decide which edges we keep (i.e. if logistic regressions for both nodes agree, of only one). How do we pick the regularization parameter? Scale it by log p (works well??)

## Learning DAG

Moralization: if the underlying distribution is a DAG, but we learn an undirected graph, we retrieve the moralized graph. It includes all the edges from the DAG, plus maybe some more. So a common approach is to learn the undirected moralized graph, then orient the edges using conditional independence tests. In many cases, though, we cannot retrieve the true DAG, but another DAG that also matches the moralized graph. e.g. if we cannot satisfy the conditional independence between A and B, we don't know if A points to B, or B points to A.

# Inference

Given the input set of symptoms S_1, S_2, is it lupus? Actually, given the symptoms, which is the most likely set of diseases? They are NP-hard, intractable computationally. So we can store all the information really compactly, but we cannot use it in probabilistic reasoning. However we can get good approximations in most real world cases.

Lets start with a single query node (a symptom X1), and a single output (a disease X6). So we want 1 conditioned on 6. Based on the conditional probability we come up with the formula....

But getting sum p(xE,xF,xR) takes a lot of time, as it grows over many variables. Let's exemplify it on the simplest case. p(Y|X) is directly specified from the conditional probability table that we had stored (remember, binary variables for simplicity). p(x|y) we can get using the Bayes graph.  .... So despite having the condition in local information, we still rely on global information, over all the network, that we need to compute and that makes the problem intractable.

There are two kinds:

- Exact algorithms: guarantee to retrieve the exact answer, but usually take so much time.
- Approximate algorithms: approximate a solution for the inference problem.

# Exact algorithm example: variable elimination

The distribution from 1-5 can be reduced to a product of local functions. Most of them are constant, and we compute de local computation over the factor that depends on x6. We can marginalize over other variables, and we get some other local factors.

...

We eliminate all the variables between 1 and 6.

Graph view: we go through the nodes/variables, we connect all of the remaining vectors of Xi and remove X_i from the graph. Until we have just a graph with the nodes we are interested in. So we only do essentially local computations.

Despite only depending on local factors, the computational complexity is still exponential to.... Because we are connecting variables that were previously disconnected, we have this computation to do. Then, the order in which we remove variables is crucial; and finding the best ordering is also NP-hard.

Problem of tree width.

# Approximate algorithm example: sum-product

Nodes pass messages. Its local, as messages are passed between neighbors. A node will only pass a message if he receives from all his neighbors.

Finally, the desired conditional probability is proportional to the potential times all the messages the node has received.

Example: 1. Leaf nodes can pass messages to interior nodes. 2. some interior nodes can pass mesages and leaf nodes still pass messages. 3. ...

Sum-product: sequential:

Maximum a posterior (MAP)

Most probable assignment of variables in F. Is very distinct from the marginalization problem, but algebraically is similar. So the approach is similar, but instead of depending on local sums, we depend on local max. We also have max-product instead of sum-product.
