# Feature selection

Feature selection is the process of selecting a subset of relevant features for use in model construction (Guyon and Elisseff, 2003). This does not necessarily involve selecting all the relevant variables (e.g. if they are correlated). There are three goals behind it: understanding better the process that generated the data, improving the performance of the predictors and creating faster and more cost-effective predictors.

We will use the following notation for a supervised learning setup: we will have a set of m examples {x<sub>k</sub>, y<sub>k</sub>} (k = 1,...m), consisting of n input variables x<sub>k,i</sub> (i = 1,...n) and one output variable y<sub>k</sub>. If the input vector x can be interpreted to come from an underlying, unknown, random distribution, , X<sub>i</sub> is the random variable corresponding to the i-th component of x. Equivalently, y is the realization of the Y random variable.

In the following sections, we will present methods for feature selection in increasing complexity.

# Variable ranking

In a variable ranking, a scoring function S(x<sub>k,i</sub>, y<sub>k</sub>) evaluates the relevance of feature i. This relevance can be used to decide if a feature will make it to the predictor or not. Variable ranking is usually a preprocessing step, independent of the predictor of choice, that is followed by a filtering. Regarding S(i) can be:

* Correlation criteria: they detect dependencies between X<sub>i</sub> and Y, linear or not. Some examples are Pearson correlation, T-test criterion and Fisher's criterion.
* Single variable classifiers: we select variables based on their individual predictive power, according to the performance (e.g. AUC) of a classifier built with that variable only.
* Information criteria: we study the mutual information between each variable and the target. It is especially useful for qualitative variables, as quantitative ones require knowledge on the densities p(x<sub>i</sub>), p(y) and P(x<sub>i</sub>,y).

# References
