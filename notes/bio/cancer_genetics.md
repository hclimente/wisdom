Cancer is a genetic disease. In consequence, we are interested in surveying the genomes of tumor cells to find out the specific alterations that unregulated them. Some of these alterations will give the tumor a selective growth advantage (driver alterations). Tumor cells accumulate a bigger number of alterations that are biologically inert (passengers). We consider three types of alterations:

* Single nucleotide variants (SNV): substitutions or insertion/deletion.
* Structural variants (SV): duplications, deletions, inversions and translocations.
* Copy number variants (CNV): both loss-of-heterozigosity and increased copy numbers.

# Methodology

Next generation sequencing technologies are the de facto standard in studying genetic alterations in tumors. The process is as follows:

1. Retrieve DNA from the tumor sample and, ideally, also from normal blood.
2. Fragment the DNA, add adapters and sequence the library (WES, WGS of targeted gene screens). Usually pair-ends are the norm, and the usual average coverage is 30x.
3. Align the short reads to the reference genome, and use a variant caller to find the divergences with the reference genome.
4. Identify the somatic variants: those that are present in the tumor and not in the normal sample.

Usually, we need to make some cancer-specific considerations, which might hinder the ability to detect mutations:

* Limited material
* FFPF materials
* DNA quality
* Availability of matched normal DNA
* Aneuploidy (amplifications, deletions...)
* Tumor purity
* Intra-tumor heterogeneity

Trade-off between specificity and sensitivity. We will choose a balance depending on our goals. Different callers give different trade-offs, and we need to understand our tool of choice.

# Mutational signatures (Helen Davies)

Mut signs. Characteristic patters of somatic.... We use passenger mutations to get them.

With every cell division, there will be a probability of error naturally. More errors will happen due to exposure to mutagens. A failing error-correcting mechanism is also a posibility.
We can caracterize each patient as a combination of the sigmatures.

Substitutions:

Non-negative matrix factorization (NMF): developed to find features in photography. Different features from DNA plots to get differemt mutational signatures.

Some of the signatures, we can link to something. For example smokers have a very particular mutational signature. Its the case for sun-exposure too.

Deletion signatures:

Deletions at repeats: tend to be short.
Deletions at microhomology: tend to be larger.

Structural rearrangenent signatures: we can characterize them according to clustered in specific genomic regions and others non-clustered. We can also look at the size. Then perform NMF.

Hypermutators:

# Mutagenic mechanisms

## Breakage-fusion-bridge mechanism

Breakage-fusion-bridge mechanism (BFB): there is a breakage in the chromosome, and a telomere is lost. There is a fusion with another chromosome. During anaphase, opposite centromeres are pulled from different ends, and a new breakage, now mechanical, happens. And this happens again and again, with the chromosome growing in size. This will leave several footprints: only some number of repetitions are possible, we will observe foldback inversion, and it will lead to abnormal read pairs. All in all, we can detect situations compatible with the BRB compatible.

## Chromotripsis

Scatter the chromosomes and rearrange randomly.
