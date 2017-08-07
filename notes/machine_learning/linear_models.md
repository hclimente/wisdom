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

Linear regression models assume that the output variable $Y$ can be explained (or reasonably approximated) as a linear combination of the input vector $X$:

$$f(X) = \beta_0 + \sum_{j=1}^pX_j\beta_j$$

where

- $\beta_j$ are the parameters of the model.
- $X_j$ can come from quantitative inputs, interactions between variables, qualitative inputs (in the form of *dummy* variables) or others.

# Least squares method

The most common method to estimate $\beta$ from the training data is the **least squares**, where the coefficients that minimize the residual sum of squares

$$RSS(\beta)=\sum_{i=1}^N(y_i-f(x_i))^2=\sum_{i=1}^N(y_i-\beta_0-\sum_{j=1}^px_{ij}\beta_j)^2.$$

We can rewrite it in matrix form as

$$RSS(\beta)=(\textbf{y}-\textbf{X}\beta)^T(\textbf{y}-\textbf{X}\beta).$$

Differentiating this quadratic function with respect to $\beta$

$$\frac {\partial RSS}{\partial \beta} = -2\textbf X^T(\textbf y-\textbf X \beta)$$

$$\frac {\partial^2 RSS}{\partial \beta} = 2 \textbf X^T \textbf X.$$

Assuming $\textbf X$ has full column rank, and hence $\textbf X^T\textbf X$ is [positive definite](glossary.md), we set the first derivative to zero

$$\textbf X^T(\textbf y-\textbf X\beta)=0$$

and obtain the unique solution

$$\hat \beta = (\textbf X^T \textbf X)^{-1}\textbf X^T \textbf y$$

$$\hat{\textbf y} = \textbf X \hat \beta = \textbf X(\textbf X^T \textbf X)^{-1}\textbf X^T \textbf y.$$

If $\textbf X$ is not full rank ie its columns are not linearly independent, then $\textbf X^T \textbf X$ is singular, and the least squares coefficients $\hat \beta$ are not uniquely defined.

## Least squares as BLUE

### Variance of the estimates

If we assume that the observations $y_i$ are uncorrelated and have constant variance $\sigma^2$, and that the $x_i$ are fixed (non-random), we derive that

$$Var(\hat \beta)=(\textbf X^T \textbf X)^{-1}\sigma^2.$$

An unbiased estimator of $\sigma^2$ is

$$\hat \sigma^2 = \frac {1}{N-p-1}\sum_{i=1}^N(y_i-\hat y_i)^2.$$

If we also assume that the a lineal model is correct for the mean, and that deviations of $y$ around its expectation are additive and Gaussian ($\varepsilon \tilde{} N(0,\sigma^2)$),

$$Y=E(Y|X_1,...,X_p)+\varepsilon = \beta_0 + \sum_{j=1}^pX_j\beta_j+\varepsilon$$

$$\hat \beta \tilde{} N(\beta,(\textbf X^T \textbf X)^{-1}\sigma^2)$$

and $\hat \sigma^2$ follows a $\chi^2$

$$(N-p-1)\hat \sigma^2 \tilde{} \sigma^2 \chi^2_{N-p-1}.$$

With these properties we can define confidence intervals for the parameters $\beta_j$. We do so by testing for each coefficient $\beta_j = 0$ using a Z-score

$$z_j=\frac {\beta_j}{\hat \sigma \sqrt{v_j}}$$

where $v_j$ is the $j$th diagonal element of $(\textbf X^T\textbf X)^{-1}$. $z_j$ is distributed as $t_{N-p-1}$.

### Gauss-Markov theorem

Let's focus on the estimation of any linear combination of the parameters $\theta=a^T \beta$ (e.g. $f(x_0)=x_0^T\beta$). The least squares estimate is

$$\hat \theta = a^T \hat \beta = a^T (\textbf X^T \textbf X)^{-1} \textbf X^T \textbf y.$$

If the model is linear, we can prove that $a^T\hat \beta$ is an unbiased estimator ie the expected value does not differ from the true value of the parameter being estimated:

$$E(a^T\hat \beta)=E(a^T (\textbf X^T \textbf X)^{-1} \textbf X^T \textbf X \beta) = a^T (\textbf X^T \textbf X)^{-1} \textbf X^T \textbf X \beta = a^T \beta.$$

Not only that, but the Gauss-Markov theorem states that the parameters $\hat \beta$ is the best linear unbiased estimator (BLUE), as its variance is the smallest. Let's dig a bit into this. The mean squared error (MSE) of an estimator $\hat \theta$ in estimating $\theta$ is

$$MSE(\hat \theta) = E(\hat \theta - \theta)^2 = Var(\hat \theta) + [E(\hat \theta) - \theta]^2$$

where $Var(\hat \theta)$ is the variance, and $[E(\hat \theta) - \theta]^2$ the squared bias. Hence, among unbiased estimators, least squares estimator is the best one.

## Limitations

There are mainly two reservations against least squares estimates. The first one is about *prediction accuracy*: despite least squared being the best among unbiased estimators, there are biased estimators which trade some variance in exchange for better prediction accuracy (lower MSE). In fact, often least squares estimates have large variances. The second one is *interpretation*: least squares takes all the input variables as predictors, which complicates the understanding of the model.

# Subset selection

Here we present methods that couple variable *subset selection* with linear regression:

- Best-subset selection: finds, for each $k \in \{0,1,...,p\}$ the subset of $k$ variables that gives the smallest residual sum of squares. Choosing $k$ is not trivial; usually the one that minimizes the estimate of the expected predicted error. There is an obvious computational burden, and when $p>40$ this approach becomes unfeasible.
- Forward- and backward-stepwise selection: these are heuristic approaches to the problem of subset selection with high $p$. In forward-stepwise selection we start with an intercept at $\bar y$, and sequentially add the variable that best improves the fit. In the other end, backward-stepwise selection starts with the full model, and sequentially deletes the predictor that has least impact on the fit. In both cases, we end up with a sequence of models of different sizes $k$ that we need to study.
- Forward stagewise selection: it also starts with the intercept, and iteratively, finds the variable most correlated with the current residual. Then, it fits a linear regression of the residual to this variable and the coefficient is added to the model. As opposed to forward-stepwise selection, the coefficients of the rest of the variables are not changed when a new one is added. These steps are repeated until no more variables are correlated with the residuals. Forward stagewise selection is slower, but might present advantages in high dimensional settings.

# Open question

* What's the variance of an estimator? Given a dataset X, Y there should be a unique, best set of betas...

# PUT SOMEWHERE

## Regularization methods

Several regularization methods have been proposed for ill-posed problems ie those where one or more of the following properties don't apply:

* A solution exists
* The solution is unique
* The solution's behavior changes continuously with the initial conditions.

### Ridge regression

# Fitting a logistic reg through an iterative solution

We look for an estimate a parameter vector beta $\hat{\beta}$ that maximizes the likelihood of the model. Iterative solutions follow this algorithm:

1. Select $\hat{\beta}_0$, an initial guess for $\hat{\beta}$.
2. Get a new $\hat{\beta}$ using a polynomial approximation of the likelihood.
3. Calculate $C = \hat{\beta} - \hat{\beta}_0$.
4. Repeat until $C < k$, where $k$ is a convergence criterion.

# References

* Hastie, T., Tibshirani, R., & Friedman, J. (2009). The Elements of Statistical Learning. New York, NY: Springer New York. https://doi.org/10.1007/978-0-387-84858-7
* Wikipedia
  * [Gauss-Markov theorem](https://en.wikipedia.org/wiki/Gauss%E2%80%93Markov_theorem)
