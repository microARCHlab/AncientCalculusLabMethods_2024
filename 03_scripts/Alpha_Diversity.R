####################################
#
#   Maaslin2 results
#   Sterling Wright 
#   Created October 10th, 2023 
####################################

install.packages("rmarkdown")

library(vegan)
library(phyloseq)
library(ggplot2)
library(gridExtra)
library(grid)
library(ggpubr)

#if(!require(devtools)) install.packages("devtools")
#devtools::install_github("kassambara/ggpubr")
#install.packages(c("devtools", "RcppEigen", "RcppParallel", "Rtsne", "ggforce", "units"))
set.seed(1024)

#### Species ####

# Gobero 
Gobero.species.data<-import_biom("Gobero-species-samples.qza.biom")
metadata<-import_qiime_sample_data("../Library_METADATA.txt")
species_phylo<-merge_phyloseq(Gobero.species.data,metadata)

plot1 <-plot_richness(species_phylo, x="LibraryMethod", measures = c("Observed", "Chao1", "Shannon")) +
  geom_boxplot() +
  theme_classic() +
  #scale_fill_manual(values = c("SingleStranded" = "blue", "DoubleStranded" = "orange")) +
  theme(strip.background = element_blank(), axis.text.x.bottom = element_text(angle = -90))

plot2<-plot_richness(species_phylo, x="ExtractionType", measures = c("Observed", "Chao1", "Shannon")) +
  geom_boxplot() +
  theme_classic() +
  theme(strip.background = element_blank(), axis.text.x.bottom = element_text(angle = -90))

# Hungary
Hungary.species.data<-import_biom("Hungary-species-samples.qza.biom")
Hungary.species_phylo<-merge_phyloseq(Hungary.species.data,metadata)

plot3<-plot_richness(Hungary.species_phylo, x="LibraryMethod", measures = c("Observed", "Chao1", "Shannon")) +
  geom_boxplot() +
  theme_classic() +
  theme(strip.background = element_blank(), axis.text.x.bottom = element_text(angle = -90))

plot4<-plot_richness(Hungary.species_phylo, x="ExtractionType", measures = c("Observed", "Chao1", "Shannon")) +
  geom_boxplot() +
  theme_classic() +
  theme(strip.background = element_blank(), axis.text.x.bottom = element_text(angle = -90))

ggarrange(plot4, plot3, plot2, plot1,
labels = c("A", "B", "C", "D"),
ncol=2, nrow=2)

#### Genus ####

Gobero.genus.data<-import_biom("Gobero-genus-samples.qza.biom")
genus_phylo<-merge_phyloseq(Gobero.genus.data,metadata)

plot1 <-plot_richness(genus_phylo, x="LibraryMethod", measures = c("Observed", "Chao1", "Shannon")) +
  geom_boxplot() +
  theme_classic() +
  theme(strip.background = element_blank(), axis.text.x.bottom = element_text(angle = -90))

plot2<-plot_richness(genus_phylo, x="ExtractionType", measures = c("Observed", "Chao1", "Shannon")) +
  geom_boxplot() +
  theme_classic() +
  theme(strip.background = element_blank(), axis.text.x.bottom = element_text(angle = -90))

# Hungary
Hungary.genus.data<-import_biom("Hungary-genus-samples.qza.biom")
Hungary.genus_phylo<-merge_phyloseq(Hungary.genus.data,metadata)

plot3<-plot_richness(Hungary.genus_phylo, x="LibraryMethod", measures = c("Observed", "Chao1", "Shannon")) +
  geom_boxplot() +
  theme_classic() +
  theme(strip.background = element_blank(), axis.text.x.bottom = element_text(angle = -90))

plot4<-plot_richness(Hungary.genus_phylo, x="ExtractionType", measures = c("Observed", "Chao1", "Shannon")) +
  geom_boxplot() +
  theme_classic() +
  theme(strip.background = element_blank(), axis.text.x.bottom = element_text(angle = -90))

ggarrange(plot1, plot2, plot3, plot4,
          labels = c("A", "B", "C", "D"),
          ncol=2, nrow=2)

#### Phylum ####

Gobero.phylum.data<-import_biom("Gobero-phylum-samples.qza.biom")
phylum_phylo<-merge_phyloseq(Gobero.phylum.data,metadata)

plot1 <-plot_richness(phylum_phylo, x="LibraryMethod", measures = c("Observed", "Chao1", "Shannon")) +
  geom_boxplot() +
  theme_classic() +
  theme(strip.background = element_blank(), axis.text.x.bottom = element_text(angle = -90))

plot2<-plot_richness(phylum_phylo, x="ExtractionType", measures = c("Observed", "Chao1", "Shannon")) +
  geom_boxplot() +
  theme_classic() +
  theme(strip.background = element_blank(), axis.text.x.bottom = element_text(angle = -90))

# Hungary
Hungary.phylum.data<-import_biom("Hungary-phylum-samples.qza.biom")
Hungary.phylum_phylo<-merge_phyloseq(Hungary.phylum.data,metadata)

plot3<-plot_richness(Hungary.phylum_phylo, x="LibraryMethod", measures = c("Observed", "Chao1", "Shannon")) +
  geom_boxplot() +
  theme_classic() +
  theme(strip.background = element_blank(), axis.text.x.bottom = element_text(angle = -90))

plot4<-plot_richness(Hungary.phylum_phylo, x="ExtractionType", measures = c("Observed", "Chao1", "Shannon")) +
  geom_boxplot() +
  theme_classic() +
  theme(strip.background = element_blank(), axis.text.x.bottom = element_text(angle = -90))

ggarrange(plot4, plot3, plot2, plot1,
          labels = c("A", "B", "C", "D"),
          ncol=2, nrow=2)

