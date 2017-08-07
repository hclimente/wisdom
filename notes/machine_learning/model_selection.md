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

# Model selection

> *All models are wrong; some are useful.* Abraham Lincoln

Model selection is the problem of choosing the *best* model among a set of competing models. There are several dimensions that can help us define what *best* means, such as:

* Sensitivity: we want all the important parameters to capture all the complexity of the data.
* Specificity/parsimony: we favor simpler models, with fewer parameters, to avoid overfitting.
* Future predictive ability: we want the model to generalize well.
* Selection consistency: the model size converges in probability to the true model size.

Usually we require a trade-off between different terms. That is because different approaches take emphasize different dimensions: cross-validation, for instance, focuses on future predictive ability. For example, we typically balance goodness of fit (how well the model describes the data) and parsimony (to avoid over-fitting). It can be interpreted as the trade-off between the bias introduced by a model too small and the variance that comes by a model too large. It's worth mentioning that the true model is unbiased and only has the necessary variance.

# References

* Hastie, T., Tibshirani, R., & Friedman, J. (2009). The Elements of Statistical Learning. New York, NY: Springer New York. https://doi.org/10.1007/978-0-387-84858-7
