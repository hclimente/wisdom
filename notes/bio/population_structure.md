# Population structure

Population structure refers to the situation when a population contains several, genetically distinct, subgroups (as opposed to homogeneity). (Patterson et al., 2006) In genetic studies, when this stratification causes different allele frequencies between cases and controls due to ancestry differences, spurious associations can appear (Price et al., 2006).

# EIGENSTRAT

EIGENSTRAT is a method to detect and correct for population stratification (Price et al., 2006). First it infers continuous axis of genetic variation by applying a PCA to the genotype data. Then it adjusts through linear regressions genotypes and phenotypes attributable to ancestry along each axis. Lastly, it computes association statistics using ancestry-adjusted genotypes and phenotypes.

# References

* Patterson, N., Price, A. L., & Reich, D. (2006). Population structure and eigenanalysis. PLoS Genetics, 2(12), 2074–2093. https://doi.org/10.1371/journal.pgen.0020190
* Price, A. L., Patterson, N. J., Plenge, R. M., Weinblatt, M. E., Shadick, N. A., & Reich, D. (2006). Principal components analysis corrects for stratification in genome-wide association studies. Nature Genetics, 38(8), 904–9. https://doi.org/10.1038/ng1847
