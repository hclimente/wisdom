Here we discover forms of GWAS that go beyond univariate tests, considering the context of the SNP to help in its significance as biomarker.

# Networks

Many approaches use networks to give each SNP a context. Specifically the protein-protein interaction network (PPIN) is widely used in biomarker discovery, where we place an edge if two proteins interact and we map high-throughput data of the gene to the corresponding protein (Robinson et al., 2017). The goal is to find interesting regions in the network, which result in a shorter list of biomarkers to further study.

  - Guilt by association approaches: non-hit genes with a good, albeit non-significant score which are associated to many hits are considered hits themselves.
  - Feature extraction from the PPIN: some approaches extract a similarity matrix based on adjacency, common neighbours, shortest path, diffusion kernel, etc. which then use to weight the scores.
  - Subgraph of hits: the subgraph is expected to contain hits with high scores, but also some hits with lower scores. Although the latter might add a suboptimal weight, they might allow for the inclusion of other high-score genes through their edges.

## Guilt by association

### Undirected graphical models

Robinson *et al.* propose using undirected graphical models a.k.a. Markov random fields (Robinson et al., 2017). They try to guess the true label $X_i$ by minimizing an energy function

$$E(x)=\sum_i \sum_l u_{i;l} I\{x_i = l\} + \sum_{(i,j)} \sum_l \sum_k w_{ij;lk} I\{x_i = l, x_j=k\}$$

$$\hat{x}=argmin_x E(x)$$

where $i$ and $j$ are vertices, $(i,j)$ are connected pairs of vertices, and $l$ and $k$ are labels. This formula contains two kind of potentials:

- Unary potentials $u_{i;l}$ that only depend on the score $z_i$ for that node and the probability density function for a label $l$ $\pi_l$

 	$$u_{i:l} = -log(\pi_l(z_i)).$$

- Pairwise potentials $w_{ij;lk}$ that penalizes neighbours not sharing label

	$$ w_{ij;lk} = \beta \begin{cases} e_{ij} &\text{if } l \ne k, \\ 0 &\text{if } l = k. \end{cases}$$

	where $e_{ij}$ is the weight of the edge.

They tested their approach on an RNAi screen to identify genes implicated in DNA repair. For each RNAi they calculated a $\phi$-score from the fluorescence value of the reporter gene OGG1-GFP. They use STRING to compile a PPI network, in a weighted graph were the edge weight measures the evidence.

# References

* Robinson, S., Nevalainen, J., Pinna, G., Campalans, A., & Radicella, J. P. (2017). Incorporating interaction networks into the determination of functionally related hit genes in genomic experiments with Markov random fields, 170–179. https://doi.org/10.1093/bioinformatics/btx244
