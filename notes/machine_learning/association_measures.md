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

# Univariate tests

Despite GWAS being the approach for the study of complex, polygenic diseases, the *de facto* approach for its statistical analysis has consisted on univariate analysis, one variant at a time.

## Univariate regression

Standard GWAS involves a univariate test under an additive genetic model (Lee *et al.*, 2014), typically linear and logistic regressions, for continuous and discrete traits respectively. We sequence the $m$ variants from the region of interest in $n$ subjects. A subject $i$ has a phenotype $y_i$, coming from a distribution with mean $\mu_i$, a covariate vector $e_i = (e_{i1}, ..., e_{iq})^T$ and a genotype $x_i = (x_{i1}, ..., x_{im})^T$ where $x_{i1}$ is the allele count for variant 1. If $y_i$
 follows a distribution in the quasi-likelihood family and we use the generalized linear model

$$\eta_i = \alpha_0+\alpha^Te_i+\beta^Tx_i.$$

Then $\eta_i$ is transformed into a $\mu_i$ using a *link function*: $\mu = \eta$ for a continuous trait, and $\mu = logit(\eta)$ for a binary trait. We define the score statistic of the marginal model for variant $j$ as

$$S_j=\sum_{i=1}^nx_{ij}(y_i-\hat \mu_i)$$

where $\hat \mu_i$ is the estimated mean of $y_i$ under the null hypothesis $\beta = 0$. $S_j > 0$ when the variant $j$ is associated with increased trait values; $S_j < 0$ when variant $j$ is associated with decreased trait values.

A significant threshold of $5 \times 10^{-8}$ is required, corresponding to a conservative Bonferroni correction.

Univariate regression allows testing the associations of using all the observations, is computationally simple, and avoids problems with partial correlations due to linkage disequilibrium (Sabatti, 2013). However, they also present several drawbacks. There might be a hidden population structure in the data, noticeable looking at all the SNPs at a time, but not looking at them individually. In consequence, there might be a hidden correlation between the tests results, which lead to an inappropriate evaluation of the $\beta_j$. Also, the low power common in GWAS studies is exacerbated when studying rare alleles (Lee *et al.*, 2014).

## Contingency tables

# Multivariate regression

# Aggregation tests

Aggregation tests do not test variants individually, they measure the cumulative effects of multiple variants in a genomic region (e.g. a gene) (Lee *et al.*, 2014). These approaches provide an increase on power when indeed variants can be grouped together. However, come with a decrease in power when only one or a few variants in a gene are causal and/or when they are in low frequencies.

There are many different aggregation tests, which make different assumptions about the genetic model of the phenotype.

## Burden tests

Burden tests collapse information of multiple genetic variants into a single genetic score, then test the association between this score and the trait (Lee *et al.*, 2014). Some of them use the regression framework. In those, the summary genetic score is

$$C_i = \sum_{j=1}^m w_j x_{ij}$$

where $w_j$ is a weight for variant $j$. It can be discrete (e.g. $w_j = \textbf 1_{MAF_j}\{MAF_j < 0.05\}$) or continuous (e.g. $w_j = \frac{1}{\sqrt{MAF_j(1 - MAF_j)}}$). The corresponding score statistic to test the null hypothesis is

$$Q_{burden}=(\sum_{j=1}^m w_j S_j)^2.$$

For example the cohort allelic sum test (CAST) treats $C_j$ as a dichotomous variable ($C_i=0$ if no minor alleles are present in the region, $C_i=1$ if they are).

There are some burden tests outside the regression framework. Such as CMC or WST.

Nonetheless burden methods make the strong assumption that all the rare variants have the same effect magnitude and direction (after adjusting for weights). If this is violated, the test loses statistical power.

## Adaptive burden tests

Adaptive burden tests address these limitations by accounting for variants with null effects or of different magnitudes and directions. These approaches try to estimate if $\beta_j$ is likely to be positive, negative or zero.

## Variance-component tests

Variance-component tests evaluate the distribution of genetic effects for a group of variants. Some examples are the C-alpha test and sequence kernel association test (SKAT), which in absence of covariates is equivalent to the former. SKAT assumes that regression coefficients $\beta_j$ follow a distribution with mean 0 and variance $w_j^2\tau$ and tests the null hypothesis $\tau = 0$ using a variance-component score test. The test statistic

$$Q_{SKAT}=\sum_{j=1}^m w_j^2 S_j^2$$

is a weighted sum of squares of single-variant score statistics $S_j$, and follows a mixture $\chi^2$ distribution. Squaring $S_j$ allows considering variants with different effects.

## Omnibus tests

Omnibus tests combine variance-component and burden tests, to achieve the greater power both when the effect of the variants have the same or opposite directions. Some of the methods that combine these metrics are:

- $Fisher = -2 \log{p_{SKAT}} =2 \log{p_{burden}}$
- $Q_{\rho}=(1-\rho)Q_{SKAT}+\rho Q_{burden}$, where $\rho$ is a parameter $0 \le \rho \le 1$ which measures the correlation among the coefficients $\beta_j$ and needs to be estimated when unknown.

## EC test

The EC test assumes that only one variant in a gene or region is causal. It uses the exponential sum of scores:

$$Q_{EC} = \sum_{j=1}^m \exp{(\frac {S_j^2}{2 var{S_j}})}.$$

It is more powerful than the previously presented when only a small fraction of the variants are causal, due to this exponential increase.

# Open questions

* Find good descriptions of $\chi^2$, trend test. Also, their relationship to regression models.

# References

* Bush, W. S., & Moore, J. H. (2012). Chapter 11: Genome-wide association studies. PLoS Computational Biology, 8(12), e1002822. https://doi.org/10.1371/journal.pcbi.1002822
* Lee, S., Abecasis, G. R., Boehnke, M., & Lin, X. (2014). Rare-variant association analysis: study designs and statistical tests. American Journal of Human Genetics, 95(1), 5–23. https://doi.org/10.1016/j.ajhg.2014.06.009
* Sabatti, C. (2013). Multivariate Linear Models for GWAS. Advances in Statistical Bioinformatics Models and Integrative Inference for High-Throughput Data, (Cambridge University Press), 188–207.
* Wu, M. C., Lee, S., Cai, T., Li, Y., Boehnke, M., & Lin, X. (2011). Rare-Variant Association Testing for Sequencing Data with the Sequence Kernel Association Test. The American Journal of Human Genetics, 89(1), 82–93. https://doi.org/10.1016/j.ajhg.2011.05.029
* Wikipedia
  * [Generalized linear model](https://en.wikipedia.org/wiki/Generalized_linear_model)
