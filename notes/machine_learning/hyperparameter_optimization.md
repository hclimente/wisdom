# Hyperparameter optimization

Hyperparameter optimization or model selection is the problem of choosing a set of hyperparameters for a learning algorithm, usually with the goal of optimizing a measure of the algorithm's performance on an independent data set.

* Grid search:  exhaustive searching through a manually specified subset of the hyperparameter space of a learning algorithm.
* Bayesian optimization: develop a statistical model of the function from hyperparameter values to the objective evaluated on a validation set.
* Random search: a randomized search that simply samples parameter settings a fixed number of times.
* Gradient-based optimization: compute the gradient with respect to hyperparameters and then optimize the hyperparameters using gradient descent.

## Bayesian optimization

The learning algorithm's generalization performance is modeled as a sample from a Gaussian process (GP) ie where every point in some continuous input space is associated with a normally distributed random variable (the performance). We pick the hyperparameters for the next experiments by optimizing the expected improvement (EI) over the current best result or the GP upper confidence bound (UCB).

Bayesian optimization aims to minimize a function $f(x)$ in a bounded set $\mathcal{X}$ ( a subset of $R^D$). It does so by building a probabilistic model for $f(x)$, which it uses to make decisions about where in X will be the next evaluation of the function. It actually uses all previously sampled $f(x)$, not simply a local gradient. It allows to evaluate $f(x)$ less times, but requires some computation between runs, so it's convenient for machine learning, where the computations of $f(x)$ are slow.

The Gaussian process is a prior distribution on funtions of the form $f : \mathcal(X) \rightarrow \mathbb{R}$.

## Sources

* [Wikipedia](https://en.wikipedia.org/wiki/Hyperparameter_optimization)
* [Practical Bayesian Optimization of Machine Learning Algorithms Jasper](https://papers.nips.cc/paper/4522-practical-bayesian-optimization-of-machine-learning-algorithms.pdf)
