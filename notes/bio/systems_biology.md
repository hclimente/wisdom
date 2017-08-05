# Biomarker discovery

Many approaches use the protein-protein interaction network (PPIN) for better biomarker discovery, which have an edge if two proteins interact, and map high-throughput data of the gene to the corresponding protein (Robinson et al., 2017). The goal is to end up with a shorter list of biomarkers to further study.

  - Guilt by association approaches: non-hit genes that are associated to many hits are considered hits themselves.
  - Feature extraction from the PPIN: some approaches extract a similarity matrix based on adjacency, common neighbors, shortest path, diffusion kernel, etc. which then use to weight the scores.
  - Subgraph of hits: the subgraph is expected to contain hits with high scores, but also some hits with lower scores. Although the latter might add a suboptimal weight, they might allow for the inclusion of other high-score genes through their edges.

# References

* Robinson, S., Nevalainen, J., Pinna, G., Campalans, A., & Radicella, J. P. (2017). Incorporating interaction networks into the determination of functionally related hit genes in genomic experiments with Markov random fields, 170–179. https://doi.org/10.1093/bioinformatics/btx244
