# Linear models

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
