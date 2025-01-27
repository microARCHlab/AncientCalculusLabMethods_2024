


#### load libraries ####
library(pheatmap)
library(tidyr)
library(ComplexHeatmap)
library(ggpubr)
library(biomformat)

setwd("C:/Users/sterl/OneDrive/Desktop/microArch/RA-duties/Summer_2022/Library/Results/")

biom_data<-read.csv("FILTERED_LIBRARY_SPECIES.csv", header = TRUE, row.names = 1)

#### Niger pheatmap ####

Niger_biom_data<-read.csv("Niger-relative-abundance-species.csv", header = TRUE, row.names = 1, check.names = FALSE)
Niger_meta<-read.csv("Library_METADATA.csv", header = TRUE)
Niger.mat<-as.matrix(Niger_biom_data)
color_columns<-Niger_meta[,c("Extraction_Method", "Library_Method")]
sample_ids<- colnames(Niger_biom_data)
plot1<-pheatmap(Niger.mat,fontsize_row = 6, fontsize_col = 6,
         annotation_col = color_columns,
         cluster_cols = FALSE,
         cluster_rows = FALSE)

#### Hungary pheatmap ####

set.seed(123)
Hungary_biom_data<-read.csv("Hungary-relative-frequency-species.csv", header = TRUE, row.names = 1, check.names = FALSE)
Hung_meta<-read.csv("Library_METADATA.csv", header = TRUE)
Hungary.mat<-as.matrix(Hungary_biom_data)
color_columns<-Hung_meta[,c("Extraction_Method", "Library_Method")]

sample_ids<-colnames(Hungary_biom_data)
pheatmap(Hungary.mat,fontsize_row = 6, fontsize_col = 6,
         annotation_col = color_columns,
         cluster_cols = FALSE,
         cluster_rows = FALSE)
