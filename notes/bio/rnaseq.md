Genomics data analysis: the goal is to identify regions of interest through different methodologies.

Differential analysis aims to identify differences in expression between two biological conditions. Usually it's tested against the null hypothesis of no difference through a statistical test. In order to do that, we need:

* Some data
* A model: negative binomial distribution describes well gene expression.
* Two competing hypothesis

Then, we define a statistic, derive the distribution of statistics under H0, and calculate a p-value. After choosing a alpha, we decide wether to accept or reject the null-hypothesis. Likely, we will commit type I and II errors. In fact, because usually we are making thousands of tests, we should apply some multiple-test correction.

Challenges:

* Discrete, non-negative and skewed data.
* Very large dynamic range
* Sequencing depth varies among experiment
* Number of reads for a gene depends on the expression level and on the length.

# Assessing the quality of differential expression analysis

We will evaluate three statistical frameworks to model gene expression:

* Negative binomial distribution: edgeR, DESeq
* NB generalized linear model: glm edgeR, DESeq2
* A linear model: limma-voom

What do we want to know:

* do we filter genes with low expression?
* How do we model gene expression?
* How do we estimate the variance of gene expression?

How are we going to evaluate the models:

* Study the distribution of p-values: how similar is is to a uniform distribution.
* Do p-values discriminate between DE and NDE? Check ROC curves.
* Do we have too many FP?
* Is the method powerful?

Dataset:

* Experimental: often involves doing a PCR. We cant doubt about the data, but we cant be extensive.
* Simulated data: ....
* Synthetic data: somewhere between the two. We have two datasets from the same platform. In one of them we expect no differences (eg we compare the same tissue); in the other, we do, and we even have some of them that are validated. We randomly select genes from each subset to create the synthetic dataset. Our goal is to recover validated genes from the dataset with differences, but also we expect some other genes to appear. We combine the two datasets in different proportions, and study how we perform.
