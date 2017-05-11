# Heritability

The observable phenotype of a trait can be partitioned into a statistical model that considers the unobserved genotype *G* and the unobserved environment *E*:

Phenotype (P) = Genotype (G) + Environment (E)

Equivalently, the observed variance in the phenotype can be expressed as:

σ<sup>2</sup><sub>P</sub> = σ<sup>2</sup><sub>G</sub> + σ<sup>2</sup><sub>E</sub>

Heritability is a term that aims to describe the proportion of the phenotypic variance that is explained by the genotype. We can derive two definitions of heritability. In the broad sense, we can define heritability H<sup>2<sup> as:

H<sup>2<sup> = σ<sup>2</sup><sub>G</sub> / σ<sup>2</sup><sub>P</sub>.

However, we can also partition σ<sup>2</sup><sub>G</sub> into:

σ<sup>2</sup><sub>G</sub> = σ<sup>2</sup><sub>A</sub> + σ<sup>2</sup><sub>D</sub> + σ<sup>2</sup><sub>I</sub>

Which account for the genetic variability due to additive genetic effects (A, breeding values); dominance genetic effects (D, interactions between alleles at the same locus); and epistatic genetic effects (I, interactions between alleles at different loci). Based on this, we can give the narrow definition of heritability h<sup>2</sup>:

h<sup>2<sup> = σ<sup>2</sup><sub>A</sub> / σ<sup>2</sup><sub>P</sub>.

Under this narrow definition, heritability is the proportion of the phenotypic variance that is explained by additive genetic effects.

It is estimated in twin studies.

# The missing heritability problem

Take height. Height is a considered a 'model' trait for quantitative genetics due to it's ease of measurement. It's heritability was assessed more than a century ago, when Galton and Fisher observed a pattern of family resemblance, consistent with a polygenic additive model of inheritance. Actually we estimate an heritability of ~0.8, that is, 80% of the intra-population variability is due to genetic factors. Three studies with a total sample size of ∼63k individuals (14k + 16k + 34k) identified 54 variants that are reliably associated with height. **COMMENTS ON low variability found**

Moreover, there is an alarming low overlap between the causal SNPs identified in the different studies. There are two reasons for this. First, we are dealing with SNPs that have a very limited effect size (% of variation explained). In consequence, we need sample sizes of the order of tens of thousands to reliably identify one causal SNP. Second, we are conducting the hundreds of thousands of association tests. Thus, we need to be very stringent with the significant threshold in order to minimize type I errors (false positives).

## Proposed causes

Several hypotheses have been proposed to explain the missing heritability problem. Some of them are: low n, high p; rare SNPs; epigenetics; epistasis.

# References

* Bahcall, O. Common variation and heritability estimates for breast, ovarian and prostate cancers. Nature iCOGS. Retrieved from https://doi:10.1038/ngicogs.1
* Manolio, T. A., Collins, F. S., Cox, N. J., Goldstein, D. B., Hindorff, L. A., Hunter, D. J., … Visscher, P. M. (2009). Finding the missing heritability of complex diseases. Nature, 461(7265), 747–753. https://doi.org/10.1038/nature08494
* Visscher, P. M. (2008). Sizing up human height variation. Nature Genetics, 40(5), 489–90. https://doi.org/10.1038/ng0508-489
