# Project Overview
Archaeological dental calculus serves as a valuable source of ancient DNA, offering insights into the oral microbiome, diet, and health of ancient populations. However, ensuring results are reproducible and robust is a must. The project for this repository systematically compares multiple DNA extraction and library preparation protocols to determine their effectiveness in recovering endogenous ancient DNA.

The study focuses on:

- Evaluating DNA yield and quality across protocols.
- Assessing the level of contamination and microbial diversity.
- Comparing the efficiency of library preparation methods for ancient samples.

## Folders 
- 01_data/
- 02_results/
- 03_scripts/
- 04_docs/

## Installation and Dependencies
To reproduce the analyses and run the scripts in this repository, you will need the following software and packages:

### Required Software
QIIME 2: For microbiome analysis and taxonomic classification.

R: For statistical analyses and visualization.

##### R packages 
install.packages(c("ggplot2", "phyloseq", "vegan", "reshape2"))
library(phyloseq); packageVersion("phyloseq") # Version ‘1.50.0’
library(ggplot2);packageVersion("ggplot2") # Version ‘3.5.1’)
library(vegan); packageVersion("vegan") # Version ‘2.6.10’
library(decontam); packageVersion("decontam") # Version ‘1.26.0’


## Key Results
1. DNA Yield: DNA varies according to wet lab protocol. 
2. Endogenous Content: Preservation state of sample and wet lab protocol employed impacts aDNA recovery.
3. Microbial Diversity: Differences in microbial profiles across protocols for poorly preserved samples, not for well-preserved samples.

## Citation
If you use this repository or its resources in your research, please cite:
XYZ

### Acknowledgments 

We extend our gratitude to Professor Alan Cooper for his contributions to this study. We also thank Kitt Köhler, Anett Osztás, Eszter Bánffy, Tibor Marton and Krisztián Oross from the Research Centre of the Humanities, Institute of Archaeology, for their assistance and support. A. O., E. B., T. M., and K. O. played pivotal roles in the excavation of the samples from Hungary. 


