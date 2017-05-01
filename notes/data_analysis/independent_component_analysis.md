Deconvolution: simplify multidimensional datasets into a reduced number of factors (usually a linear combination of them). E.g. gene expression can be expressed as the combination of factors that regulate them. Some methogs to deconvolute: PCA, ICA, NMF.

Difference PCA - ICA: PCA approximate your data as ellipsoids, so it doesn't take into account the particular data substructures of the data.

Cocktail party problem (signal processing): in a cocktail many things are happening, and some spies try to get everything that's happening through microphones. Each microphone will get a mixture of all the signals. But they want to separate them. They use ICA for that. Equivalently, gene expression is a mixture of many individual sources.

In ICA, we identify different non-gaussian tails of the distribution.

FastICA: one of the most popular algorithms.

1. Define data dimensionality *k*.
2. Whitening of the data: remove all gaussian signals. The variance in all dimensions become unity. We are assuming that everything that is Gaussian is noise of some kind
3. ...

We rank the independent components according to their consistency (apparently there is a random step?).

X is an approximation of the data.

X = AS

A table of metagenes.
S table of metasamples.

Metagene interpretation: geneset enrichment analysis, hypergeometric test, correlations with properties of the genes...
Metasample interpretation: look at data of the patients e.g. match known cancer subtypes, study other tests on the same patient e.g. histopathological samples (e.g. rank them by the weight and checking if there is any trend).

Implementations in R: there are several, although they are rather slow, and sometimes they just crash (e.g. FastICA). That's one of the reasons ICA isn't that used in comparison to PCA, despite finding more interesting genesets.
