title: "Linear regression"
use_math: true

Linear regression models assume that the output variable $Y$ can be explained (or reasonably approximated) as a linear combination of the input vector $X$:

$$f(X) = \beta_0 + \sum_{j=1}^pX_j\beta_j$$

where

- $\beta_j$ are the parameters of the model.
- $X_j$ can come from quantitative inputs, interactions between variables, qualitative inputs (in the form of *dummy* variables) or others.

# Least squares method

The most common method to estimate $\beta$ from the training data is the *least squares*, where the coefficients that minimize the residual sum of squares

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

## Variance of the estimates

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

## Gauss-Markov theorem

Let's focus on the estimation of any linear combination of the parameters $\theta=a^T \beta$ (e.g. $f(x_0)=x_0^T\beta$). The least squares estimate is

$$\hat \theta = a^T \hat \beta = a^T (\textbf X^T \textbf X)^{-1} \textbf X^T \textbf y$$

# References

* Hastie, T., Tibshirani, R., & Friedman, J. (2009). The Elements of Statistical Learning. New York, NY: Springer New York. https://doi.org/10.1007/978-0-387-84858-7
