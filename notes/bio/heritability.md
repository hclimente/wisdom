# Heritability

Take an observable phenotype P. Take height. Height is a considered a 'model' trait for quantitative genetics due to it's ease of measurement (Visscher, 2008). Height can be partitioned into a statistical model that considers the unobserved genotype *G* and the unobserved environment *E*: P = G + E (Visscher et al., 2008). (This definition ignores both the genotype-environment covariation as well as genotype-environment interactions, which usually cannot be estimated.) As G and E are different among individuals, height also variable. Specifically, it has a standard deviation of 7 cms in the population. As before, we can decompose the variance in height σ<sup>2</sup><sub>P</sub> as:

σ<sup>2</sup><sub>P</sub> = σ<sup>2</sup><sub>G</sub> + σ<sup>2</sup><sub>E</sub>

σ<sup>2</sup><sub>P</sub> includes the total observed variation, usually excluding variation due to known fixed factors and covariates (age, sex, cohort...). Heritability is a term that aims to describe the proportion of the phenotypic variance that is explained by the genotype. The heritability of height was assessed more than a century ago, when Galton and Fisher observed a pattern of family resemblance, consistent with a polygenic additive model of inheritance (Visscher, 2008).

There are two definitions of heritability:

* Broad-sense heritability H<sup>2<sup>:

  H<sup>2</sup> = σ<sup>2</sup><sub>G</sub> / σ<sup>2</sup><sub>P</sub>.

* Narrow-sense heritability h<sup>2</sup>: heritability is the proportion of the phenotypic variance that is explained by additive genetic effects:

  h<sup>2</sup> = σ<sup>2</sup><sub>A</sub> / σ<sup>2</sup><sub>P</sub>.

  It comes up by partitioning again σ<sup>2</sup><sub>G</sub> into

  σ<sup>2</sup><sub>G</sub> = σ<sup>2</sup><sub>A</sub> + σ<sup>2</sup><sub>D</sub> + σ<sup>2</sup><sub>I</sub>,

  which accounts for the genetic variability of additive genetic effects (A, breeding values); of dominance genetic effects (D, interactions between alleles at the same locus); and of epistatic genetic effects (I, interactions between alleles at different loci).

Narrow-sense heritability is the estimate that applies in most of situations, and hence, the most widely used. This is because non-additive effects such as dominance do not contribute to genotypic resemblance, as only one copy of each parent is transmitted to their offspring. For height, h<sup>2</sup> = 0.8. Taking into account the standard variation of 7 cm in the population, the standard deviation of height in adult offspring around the mean value of the parents is 5.4 cm ( = \sqrt{7<sup>2</sup>(1 – 0.8/2)}). This is the expected standard-deviation of height in adult offspring around the mean value of the parents, which is pretty similar to the standard deviation in the population. That is, tall parents expect tall children, although with a considerable variation around the parental mean.

# Estimation of heritability

Heritability is calculated from empirical data of related individuals, where we compare the expected and the observed resemblance. To estimate it, we need to calculate both the variance in additive genetic effects, and the phenotypic variance. The latter must be corrected by known fixed effects such as age, sex or cohort. For example, men and women have in average a 15 cm difference in height. If it was not taken into account, the estimated h<sup>2</sup> would be 0.6 instead. It also must be taken into account that heritability is population specific, as both the variance in genetic factors and in environment are population-dependent. However, we have found heritabilities in similar traits to be similar across populations and even species.

When it is possible, it is estimated in simple and balanced experiments. For example, by regressing the offspring on parental phenotypes, the correlation of full or half siblings, and the difference in the correlation of monozygotic and dizygotic twin pairs (identical and non-identical, respectively). In cases where this is not possible, and we are stuck with individuals with a mixture of relationships, unbalanced designs, etc. heritability is estimated from linear mixed models.

# The missing heritability problem

As stated previously, 80% of the intra-population variability in height is due to genetic factors (Visscher, 2008). Three studies with a total sample size of ∼63k individuals (14k + 16k + 34k) identified 54 variants that are reliably associated with height. However, they only get to explain 5% of the phenotypic variance (Manolio et al., 2009). The rest of the genetic component is something alike the 'dark matter": we know it's there, as we can see its effects, we just cannot see it or know what it is exactly. This situation is actually common to many complex phenotypes, in what has been called the missing heritability problem. There are several candidates out there to conform this dark matter: a larger than expected number of SNPs with mild effects (difficult to find in the low n, high p setting of GWAS); rarer SNPs with strong effects; but also an overestimation of h<sup>2</sup> by unconsidered epigenetics, dominance and epistatic effects. or even an inadequate accounting of shared environment among relatives. Of course, different traits will have different allelic architectures (number of variants, effects, type...). But even then, our knowledge is too limited to really assess it. The enigma of missing heritability is especially relevant when we deal with complex diseases.

Of the main suspects of missing heritability, variants not covered by standard experiment designs are regarded as the main suspects. Specially the effect of low MAF SNPs ( MAF < 0.05) is the explanation that gathers more support. First, they are often not included in the genotyping arrays, while their mild effect sizes (say, relative risks of 2-3) make them difficult to find in classical linkage analysis. Increased sample sizes and more exhaustive arrays could potentially help find these variants. Structural variants, and CNV in particular, which for a long time had a hard time getting detected are another candidate.

# References

* Bahcall, O. Common variation and heritability estimates for breast, ovarian and prostate cancers. Nature iCOGS. Retrieved from https://doi:10.1038/ngicogs.1
* Manolio, T. A., Collins, F. S., Cox, N. J., Goldstein, D. B., Hindorff, L. A., Hunter, D. J., … Visscher, P. M. (2009). Finding the missing heritability of complex diseases. Nature, 461(7265), 747–753. https://doi.org/10.1038/nature08494
* Visscher, P. M. (2008). Sizing up human height variation. Nature Genetics, 40(5), 489–90. https://doi.org/10.1038/ng0508-489
* Visscher, P. M., Hill, W. G., & Wray, N. R. (2008). Heritability in the genomics era--concepts and misconceptions. Nature Reviews. Genetics, 9(4), 255–66. https://doi.org/10.1038/nrg2322
