# GWAS

Genome-wide association studies (GWAS) aim to find genetic risk factors for complex phenotypes. This is achieved by systematically surveying a high number of genetic variants (from hundred thousands to a million) in many samples, often above the thousands. In the classical GWAS setting, a statistical test for association is conducted between each variant and the phenotype of interest. It is usually followed up by a statistical validation by genotyping of the "best hits" in independent samples.

Usually the phenotype of interest is a common, complex disease such as type II diabetes or schizophrenia. In this case, the ultimate goal is to be able to identify individuals at genetic risk, as well as understand the molecular basis of the disease. Due to its low cost and widespread availability, GWAS has been pushed beyond this realm. Many fields that profit from this ability to survey a sample genome are using GWAS, specially in personalized medicine (e.g. pharmacogenomics). In consequence, GWAS has become a paragon of translational bioinformatics.


allowed to quantify and identify the SNPs required to find associations between common variants and a trait in a hypothesis-free environment. Then 'SNP chips', microarrays that explored most of these variants, appeared, allowing to do so in a cheap way.


# Background

GWAS became possible thanks to the convergence of scientific effort and technological development.

## Human variation

GWAS rely on a the hypothesis of *common disease, common variant* (CD/CV), which postulates that common diseases are partly attributable to allelic variants, present in more than 1-5% of the population. These variants cause, by itself or in combinations, small increments in risk (1.1 - 1.5-fold). Due to this limited effect size, only partial correlations between causal variants and phenotypes are expected. This notion is radically different from rare diseases associated to rare variants with big effect sizes, where every carrier of the risk allele develops the disease (complete correlation). *** say that's why they haven't been removed by natural selection ***

![../figures/genetic_studies.png]()

The modern unit of genetic variation are single-nucleotide polymorphisms (SNPs). SNPs are single base-pair changes in the DNA sequence that occur with high frequency in the human genome. They are, by far, the most common form of genetic variation in humans. SNPs usually involve two alleles ie in a population there are two possible base-pairs for a genetic position. SNPs are characterized by the minor-allele frequency (MAF), that is, the frequency in the population of the least common allele.

SNPs can have functional consequences by themselves (e.g. change an amino acid in the protein). However, in the context of genetic studies, SNPs are used as markers of a chromosomic region. In consequence, the SNPs associated with a disease are not necessarily causal: they might just be close and in linkage disequilibrium with the causal variant.

### Linkage disequilibrium

Linkage disequilibrium refers to the fact that contiguous SNP

*** how human variation changes from population to population ***

### Capturing common variation

After the human genome was sequenced, international projects using sequencing technologies sprouted to characterize divergences from the reference genome. Possibly the best-known are HapMap and 1000 Genomes. The utility of these projects for genetic studies is two-fold: they allow to identify the genomic regions to survey and describe the population-specific differences.

# Challenges

# References

* Bush, W. S., & Moore, J. H. (2012). Chapter 11: Genome-wide association studies. PLoS Computational Biology, 8(12), e1002822. https://doi.org/10.1371/journal.pcbi.1002822
