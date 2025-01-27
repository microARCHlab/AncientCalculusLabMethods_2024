# Project Overview
Archaeological dental calculus serves as a valuable source of ancient DNA, offering insights into the oral microbiome, diet, and health of ancient populations. However, ensuring results are reproducible and robust is a must. The project for this repository systematically compares multiple DNA extraction and library preparation protocols to determine their effectiveness in recovering endogenous ancient DNA.

The study focuses on:

- Evaluating DNA yield and quality across protocols.
- Assessing the level of contamination and microbial diversity.
- Comparing the efficiency of library preparation methods for ancient samples.

├── data/
│   ├── raw/               # Raw sequencing data and metadata
│   ├── processed/         # Processed data files (e.g., filtered sequences, feature tables)
├── results/
│   ├── figures/           # Figures generated from analysis
│   ├── tables/            # Summary tables of results
├── scripts/
│   ├── preprocessing/     # Scripts for preprocessing raw data
│   ├── analysis/          # Scripts for comparative analysis
│   ├── visualization/     # Scripts for generating figures
├── docs/
│   ├── protocol/          # Protocols for DNA extraction and library preparation
│   ├── references/        # Relevant references and literature
├── README.md              # Project overview and instructions
└── LICENSE                # Licensing information

## Installation and Dependencies
To reproduce the analyses and run the scripts in this repository, you will need the following software and packages:

### Required Software
QIIME 2: For microbiome analysis and taxonomic classification.
R: For statistical analyses and visualization.

##### R packages 
install.packages(c("ggplot2", "dplyr", "phyloseq", "vegan", "reshape2"))

## Key Results
1. DNA Yield: Comparison of DNA yield across protocols.
2. Endogenous Content: Proportion of host vs. microbial DNA recovered.
3. Contamination Levels: Evaluation of modern contamination in samples.
4. Microbial Diversity: Differences in microbial profiles across protocols.

## Citation
If you use this repository or its resources in your research, please cite:
XYZ



