#################################################
#
#
#     Fastq analyses for methods paper
#     Created by Sterling Wright 
#     April 10th, 2024 
#
#################################################

#### Packages ####
library(dplyr)
library(openxlsx)
library(ggpubr)

#### Set working directory ####
setwd("$PATH")

#### Import the data ####
data.df<-read.csv("fastq_analysis.csv", header = TRUE, check.names = FALSE)

#### Filter tables ####
Hungary.df<- data.df %>% filter(Country == "Hungary")
Niger.df<- data.df %>% filter(Country == "Niger")

#### Fragment Length Analysis ####

#### Niger samples ####

##### PB #####
Niger_pb_average <- Niger.df %>% 
  filter(ExtractionMethod== "PB") %>%
  summarise(Average_PB = mean(Average, na.rm = TRUE),
            StdDev = (sd(Average, na.rm=TRUE)))
Niger_pb_average


##### QG #####
Niger_qg_average <- Niger.df %>% 
  filter(ExtractionMethod== "QG") %>%
  summarise(Average_QG = mean(Average, na.rm = TRUE),
            StdDev = (sd(Average, na.rm=TRUE)))
Niger_qg_average

##### DSL #####
Niger_DSL_average <- Niger.df %>% 
  filter(Library== "DSL") %>%
  summarise(Average_DSL = mean(Average, na.rm = TRUE),
            StdDev = (sd(Average, na.rm=TRUE)))
Niger_DSL_average

##### DSL #####
Niger_SSL_average <- Niger.df %>% 
  filter(Library== "SSL") %>%
  summarise(Average_SSL = mean(Average, na.rm = TRUE),
            StdDev = (sd(Average, na.rm=TRUE)))
Niger_SSL_average

##### SSL + PB #####
Niger_SSL_PB_average <- Niger.df %>% 
  filter(Library== "SSL") %>%
  filter(ExtractionMethod== "PB") %>%
  summarise(Average_SSL_PB = mean(Average, na.rm = TRUE),
            StdDev = (sd(Average, na.rm=TRUE)))
Niger_SSL_PB_average

##### SSL + QG #####
Niger_SSL_QG_average <- Niger.df %>% 
  filter(Library== "SSL") %>%
  filter(ExtractionMethod== "QG") %>%
  summarise(Average_SSL_QG = mean(Average, na.rm = TRUE),
            StdDev = (sd(Average, na.rm=TRUE)))
Niger_SSL_QG_average

##### DSL + QG #####
Niger_DSL_QG_average <- Niger.df %>% 
  filter(Library== "DSL") %>%
  filter(ExtractionMethod== "QG") %>%
  summarise(Average_DSL_QG = mean(Average, na.rm = TRUE),
            StdDev = (sd(Average, na.rm=TRUE)))
Niger_DSL_QG_average

##### DSL + PB #####
Niger_DSL_PB_average <- Niger.df %>% 
  filter(Library== "DSL") %>%
  filter(ExtractionMethod== "PB") %>%
  summarise(Average_DSL_PB = mean(Average, na.rm = TRUE),
            StdDev = (sd(Average, na.rm=TRUE)))
Niger_DSL_PB_average

#### Hungary samples ####

##### PB #####
Hungary_pb_average <- Hungary.df %>% 
  filter(ExtractionMethod== "PB") %>%
  summarise(Average_PB = mean(Average, na.rm = TRUE),
            StdDev = (sd(Average, na.rm=TRUE)))
Hungary_pb_average

##### QG #####
Hungary_qg_average <- Hungary.df %>% 
  filter(ExtractionMethod== "QG") %>%
  summarise(Average_QG = mean(Average, na.rm = TRUE),
            StdDev = (sd(Average, na.rm=TRUE)))
Hungary_qg_average

##### DSL #####
Hungary_DSL_average <- Hungary.df %>% 
  filter(Library== "DSL") %>%
  summarise(Average_DSL = mean(Average, na.rm = TRUE),
            StdDev = (sd(Average, na.rm=TRUE)))
Hungary_DSL_average

##### DSL #####
Hungary_SSL_average <- Hungary.df %>% 
  filter(Library== "SSL") %>%
  summarise(Average_SSL = mean(Average, na.rm = TRUE),
            StdDev = (sd(Average, na.rm=TRUE)))
Hungary_SSL_average

##### SSL + PB #####
Hungary_SSL_PB_average <- Hungary.df %>% 
  filter(Library== "SSL") %>%
  filter(ExtractionMethod== "PB") %>%
  summarise(Average_SSL_PB = mean(Average, na.rm = TRUE),
            StdDev = (sd(Average, na.rm=TRUE)))
Hungary_SSL_PB_average

##### SSL + QG #####
Hungary_SSL_QG_average <- Hungary.df %>% 
  filter(Library== "SSL") %>%
  filter(ExtractionMethod== "QG") %>%
  summarise(Average_SSL_QG = mean(Average, na.rm = TRUE),
            StdDev = (sd(Average, na.rm=TRUE)))
Hungary_SSL_QG_average

##### DSL + QG #####
Hungary_DSL_QG_average <- Hungary.df %>% 
  filter(Library== "DSL") %>%
  filter(ExtractionMethod== "QG") %>%
  summarise(Average_DSL_QG = mean(Average, na.rm = TRUE),
            StdDev = (sd(Average, na.rm=TRUE)))
Hungary_DSL_QG_average

##### DSL + PB #####
Hungary_DSL_PB_average <- Hungary.df %>% 
  filter(Library== "DSL") %>%
  filter(ExtractionMethod== "PB") %>%
  summarise(Average_DSL_PB = mean(Average, na.rm = TRUE),
            StdDev = (sd(Average, na.rm=TRUE)))
Hungary_DSL_PB_average

results<-data.frame(
  Results= c("Niger_pb_average", "Niger_qg_average", "Niger_DSL_average", "Niger_SSL_average",
             "Niger_SSL_PB_average", "Niger_SSL_QG_average", "Niger_DSL_PB_average", "Niger_DSL_QG_average",
             "Hungary_pb_average", "Hungary_qg_average", "Hungary_DSL_average", "Hungary_SSL_average",
             "Hungary_SSL_PB_average", "Hungary_SSL_QG_average", "Hungary_DSL_PB_average", "Hungary_DSL_QG_average"),
  Average= c(Niger_pb_average$Average_PB, Niger_qg_average$Average_QG, Niger_DSL_average$Average_DSL, Niger_SSL_average$Average_SSL,
             Niger_SSL_PB_average$Average_SSL_PB, Niger_SSL_QG_average$Average_SSL_QG, Niger_DSL_PB_average$Average_DSL_PB, Niger_DSL_QG_average$Average_DSL_QG,
             Hungary_pb_average$Average_PB, Hungary_qg_average$Average_QG, Hungary_DSL_average$Average_DSL, Hungary_SSL_average$Average_SSL,
             Hungary_SSL_PB_average$Average_SSL_PB, Hungary_SSL_QG_average$Average_SSL_QG, Hungary_DSL_PB_average$Average_DSL_PB, Hungary_DSL_QG_average$Average_DSL_QG),
  StdDev= c(Niger_pb_average$StdDev, Niger_qg_average$StdDev, Niger_DSL_average$StdDev, Niger_SSL_average$StdDev,
           Niger_SSL_PB_average$StdDev, Niger_SSL_QG_average$StdDev, Niger_DSL_PB_average$StdDev, Niger_DSL_QG_average$StdDev,
           Hungary_pb_average$StdDev, Hungary_qg_average$StdDev, Hungary_DSL_average$StdDev, Hungary_SSL_average$StdDev,
           Hungary_SSL_PB_average$StdDev, Hungary_SSL_QG_average$StdDev, Hungary_DSL_PB_average$StdDev, Hungary_DSL_QG_average$StdDev))


print(results)

write.xlsx(results, "Average_Fragment_Length_Analysis.xlsx", row.names = FALSE)

##### Box plots #####

Niger_Extraction_bp<-ggboxplot(Niger.df, x="ExtractionMethod", y="Average",
          color = "ExtractionMethod", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("QG", "PB"),
          ylab = "Average Fragment Lengths", xlab = "Extraction Method")

Niger_Ext_w<-wilcox.test(Average ~ ExtractionMethod, data = Niger.df, exact =FALSE)

Noger.2<-ggboxplot(Niger.df, x="Library", y="Average",
          color = "Library", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("DSL", "SSL"),
          ylab = "Average Fragment Lengths", xlab = "Library Preparation Method")

Niger_Lib_w<-wilcox.test(Average ~ Library, data = Niger.df, exact =FALSE)

Hungary_Extraction<-ggboxplot(Hungary.df, x="ExtractionMethod", y="Average",
          color = "ExtractionMethod", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("QG", "PB"),
          ylab = "Average Fragment Lengths", xlab = "Extraction Method")

wilcox.test(Average ~ ExtractionMethod, data = Hungary.df, exact =FALSE)

Hungary.Lib.bp<-ggboxplot(Hungary.df, x="Library", y="Average",
          color = "Library", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("DSL", "SSL"),
          ylab = "Average Fragment Lengths", xlab = "Library Preparation Method")

wilcox.test(Average ~ Library, data = Hungary.df, exact =FALSE)

ggarrange(Niger_Extraction_bp, Noger.2 + rremove("x.text"),
             labels = c("A", "B"),
             ncol = 2, nrow = 2)

ggarrange(Hungary_Extraction, Hungary.Lib.bp + rremove("x.text"),
          labels = c("C", "D"),
          ncol = 2, nrow = 2)

#### GC content ####

#### Niger samples ####

##### PB #####
Niger_pb_GC_average <- Niger.df %>% 
  filter(ExtractionMethod== "PB") %>%
  summarise(Average_PB_GC = mean(GC, na.rm = TRUE),
            StdDev = (sd(GC, na.rm=TRUE)))
Niger_pb_GC_average


##### QG #####
Niger_qg_GC_average <- Niger.df %>% 
  filter(ExtractionMethod== "QG") %>%
  summarise(Average_QG_GC = mean(GC, na.rm = TRUE),
            StdDev = (sd(GC, na.rm=TRUE)))
Niger_qg_GC_average

##### DSL #####
Niger_DSL_GC_average <- Niger.df %>% 
  filter(Library== "DSL") %>%
  summarise(Average_DSL = mean(GC, na.rm = TRUE),
            StdDev = (sd(GC, na.rm=TRUE)))
Niger_DSL_GC_average

##### DSL #####
Niger_SSL_GC_average <- Niger.df %>% 
  filter(Library== "SSL") %>%
  summarise(Average_SSL_GC = mean(GC, na.rm = TRUE),
            StdDev = (sd(GC, na.rm=TRUE)))
Niger_SSL_GC_average

##### SSL + PB #####
Niger_SSL_PB_GC_average <- Niger.df %>% 
  filter(Library== "SSL") %>%
  filter(ExtractionMethod== "PB") %>%
  summarise(Average_SSL_PB_GC = mean(GC, na.rm = TRUE),
            StdDev = (sd(GC, na.rm=TRUE)))
Niger_SSL_PB_GC_average

##### SSL + QG #####
Niger_SSL_QG_GC_average <- Niger.df %>% 
  filter(Library== "SSL") %>%
  filter(ExtractionMethod== "QG") %>%
  summarise(Average_SSL_QG_GC = mean(GC, na.rm = TRUE),
            StdDev = (sd(GC, na.rm=TRUE)))
Niger_SSL_QG_GC_average

##### DSL + QG #####
Niger_DSL_QG_GC_average <- Niger.df %>% 
  filter(Library== "DSL") %>%
  filter(ExtractionMethod== "QG") %>%
  summarise(Average_DSL_QG_GC = mean(GC, na.rm = TRUE),
            StdDev = (sd(GC, na.rm=TRUE)))
Niger_DSL_QG_GC_average

##### DSL + PB #####
Niger_DSL_PB_GC_average <- Niger.df %>% 
  filter(Library== "DSL") %>%
  filter(ExtractionMethod== "PB") %>%
  summarise(Average_DSL_PB_GC = mean(GC, na.rm = TRUE),
            StdDev = (sd(GC, na.rm=TRUE)))
Niger_DSL_PB_GC_average

#### Hungary samples ####

##### PB #####
Hungary_pb_GC_average <- Hungary.df %>% 
  filter(ExtractionMethod== "PB") %>%
  summarise(Average_PB_GC = mean(GC, na.rm = TRUE),
            StdDev = (sd(GC, na.rm=TRUE)))
Hungary_pb_GC_average

##### QG #####
Hungary_qg_GC_average <- Hungary.df %>% 
  filter(ExtractionMethod== "QG") %>%
  summarise(Average_QG_GC = mean(GC, na.rm = TRUE),
            StdDev = (sd(GC, na.rm=TRUE)))
Hungary_qg_GC_average

##### DSL #####
Hungary_DSL_GC_average <- Hungary.df %>% 
  filter(Library== "DSL") %>%
  summarise(Average_DSL_GC = mean(GC, na.rm = TRUE),
            StdDev = (sd(GC, na.rm=TRUE)))
Hungary_DSL_GC_average

##### DSL #####
Hungary_SSL_GC_average <- Hungary.df %>% 
  filter(Library== "SSL") %>%
  summarise(Average_SSL_GC = mean(GC, na.rm = TRUE),
            StdDev = (sd(GC, na.rm=TRUE)))
Hungary_SSL_GC_average

##### SSL + PB #####
Hungary_SSL_PB_GC_average <- Hungary.df %>% 
  filter(Library== "SSL") %>%
  filter(ExtractionMethod== "PB") %>%
  summarise(Average_SSL_PB_GC = mean(GC, na.rm = TRUE),
            StdDev = (sd(GC, na.rm=TRUE)))
Hungary_SSL_PB_GC_average

##### SSL + QG #####
Hungary_SSL_QG_GC_average <- Hungary.df %>% 
  filter(Library== "SSL") %>%
  filter(ExtractionMethod== "QG") %>%
  summarise(Average_SSL_QG_GC = mean(GC, na.rm = TRUE),
            StdDev = (sd(GC, na.rm=TRUE)))
Hungary_SSL_QG_GC_average

##### DSL + QG #####
Hungary_DSL_QG_GC_average <- Hungary.df %>% 
  filter(Library== "DSL") %>%
  filter(ExtractionMethod== "QG") %>%
  summarise(Average_DSL_QG_GC = mean(GC, na.rm = TRUE),
            StdDev = (sd(GC, na.rm=TRUE)))
Hungary_DSL_QG_GC_average

##### DSL + PB #####
Hungary_DSL_PB_GC_average <- Hungary.df %>% 
  filter(Library== "DSL") %>%
  filter(ExtractionMethod== "PB") %>%
  summarise(Average_DSL_PB_GC = mean(GC, na.rm = TRUE),
            StdDev = (sd(GC, na.rm=TRUE)))
Hungary_DSL_PB_GC_average

GC_results<-data.frame(
  Results= c("Niger_pb_GC_average", "Niger_qg_GC_average", "Niger_DSL_GC_average", "Niger_SSL_GC_average",
             "Niger_SSL_PB_GC_average", "Niger_SSL_QG_GC_average", "Niger_DSL_PB_GC_average", "Niger_DSL_QG_GC_average",
             "Hungary_pb_GC_average", "Hungary_qg_GC_average", "Hungary_DSL_GC_average", "Hungary_SSL_GC_average",
             "Hungary_SSL_PB_GC_average", "Hungary_SSL_QG_GC_average", "Hungary_DSL_PB_GC_average", "Hungary_DSL_QG_GC_average"),
  Average= c(Niger_pb_GC_average$Average_PB_GC, Niger_qg_GC_average$Average_QG_GC, Niger_DSL_GC_average$Average_DSL, Niger_SSL_GC_average$Average_SSL_GC,
             Niger_SSL_PB_GC_average$Average_SSL_PB_GC, Niger_SSL_QG_GC_average$Average_SSL_QG_GC, Niger_DSL_PB_GC_average$Average_DSL_PB_GC, Niger_DSL_QG_GC_average$Average_DSL_QG_GC,
             Hungary_pb_GC_average$Average_PB_GC, Hungary_qg_GC_average$Average_QG_GC, Hungary_DSL_GC_average$Average_DSL_GC, Hungary_SSL_GC_average$Average_SSL,
             Hungary_SSL_PB_GC_average$Average_SSL_PB, Hungary_SSL_QG_GC_average$Average_SSL_QG_GC, Hungary_DSL_PB_GC_average$Average_DSL_PB_GC, Hungary_DSL_QG_GC_average$Average_DSL_QG_GC),
  StdDev= c(Niger_pb_GC_average$StdDev, Niger_qg_GC_average$StdDev, Niger_DSL_GC_average$StdDev, Niger_SSL_GC_average$StdDev,
            Niger_SSL_PB_GC_average$StdDev, Niger_SSL_QG_GC_average$StdDev, Niger_DSL_PB_GC_average$StdDev, Niger_DSL_QG_GC_average$StdDev,
            Hungary_pb_GC_average$StdDev, Hungary_qg_GC_average$StdDev, Hungary_DSL_GC_average$StdDev, Hungary_SSL_GC_average$StdDev,
            Hungary_SSL_PB_GC_average$StdDev, Hungary_SSL_QG_GC_average$StdDev, Hungary_DSL_PB_GC_average$StdDev, Hungary_DSL_QG_GC_average$StdDev))
GC_results

plot1<-ggboxplot(Niger.df, x="ExtractionMethod", y="GC",
          color = "ExtractionMethod", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("QG", "PB"),
          ylab = "GC (%)", xlab = "Extraction Method")

wilcox.test(GC ~ ExtractionMethod, data = Niger.df, exact =FALSE)

plot2<-ggboxplot(Niger.df, x="Library", y="GC",
          color = "Library", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("DSL", "SSL"),
          ylab = "GC (%)", xlab = "Library Preparation Method")

plot3<-ggboxplot(Hungary.df, x="ExtractionMethod", y="GC",
                 color = "ExtractionMethod", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
                 order = c("QG", "PB"),
                 ylab = "GC (%)", xlab = "Extraction Method")

plot4<-ggboxplot(Hungary.df, x="Library", y="GC",
                 color = "Library", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
                 order = c("DSL", "SSL"),
                 ylab = "GC (%)", xlab = "Library Preparation Method")

wilcox.test(GC ~ Library, data = Niger.df, exact =FALSE)

ggarrange(plot1, plot2, plot3, plot4 + rremove("x.text"),
          labels = c("A", "B", "C", "D"),
          ncol = 2, nrow = 2)
#### Clonality ####

##### PB #####
Niger_pb_average_uniq <- Niger.df %>% 
  filter(ExtractionMethod== "PB") %>%
  summarise(Average_PB_uniq = mean(Percentage_unique, na.rm = TRUE),
            StdDev = (sd(Percentage_unique, na.rm=TRUE)))
Niger_pb_average_uniq


##### QG #####
Niger_qg_average_uniq <- Niger.df %>% 
  filter(ExtractionMethod== "QG") %>%
  summarise(Average_QG_uniq = mean(Percentage_unique, na.rm = TRUE),
            StdDev = (sd(Percentage_unique, na.rm=TRUE)))
Niger_qg_average_uniq

##### DSL #####
Niger_DSL_average_uniq <- Niger.df %>% 
  filter(Library== "DSL") %>%
  summarise(Average_DSL_uniq = mean(Percentage_unique, na.rm = TRUE),
            StdDev = (sd(Percentage_unique, na.rm=TRUE)))
Niger_DSL_average_uniq

##### DSL #####
Niger_SSL_average_uniq <- Niger.df %>% 
  filter(Library== "SSL") %>%
  summarise(Average_SSL_uniq = mean(Percentage_unique, na.rm = TRUE),
            StdDev = (sd(Percentage_unique, na.rm=TRUE)))
Niger_SSL_average_uniq

##### SSL + PB #####
Niger_SSL_PB_average_uniq <- Niger.df %>% 
  filter(Library== "SSL") %>%
  filter(ExtractionMethod== "PB") %>%
  summarise(Average_SSL_PB_uniq = mean(Percentage_unique, na.rm = TRUE),
            StdDev = (sd(Percentage_unique, na.rm=TRUE)))
Niger_SSL_PB_average_uniq

##### SSL + QG #####
Niger_SSL_QG_average_uniq <- Niger.df %>% 
  filter(Library== "SSL") %>%
  filter(ExtractionMethod== "QG") %>%
  summarise(Average_SSL_QG_uniq = mean(Percentage_unique, na.rm = TRUE),
            StdDev = (sd(Percentage_unique, na.rm=TRUE)))
Niger_SSL_QG_average_uniq

##### DSL + QG #####
Niger_DSL_QG_average_uniq <- Niger.df %>% 
  filter(Library== "DSL") %>%
  filter(ExtractionMethod== "QG") %>%
  summarise(Average_DSL_QG_uniq = mean(Percentage_unique, na.rm = TRUE),
            StdDev = (sd(Percentage_unique, na.rm=TRUE)))
Niger_DSL_QG_average_uniq

##### DSL + PB #####
Niger_DSL_PB_average_uniq <- Niger.df %>% 
  filter(Library== "DSL") %>%
  filter(ExtractionMethod== "PB") %>%
  summarise(Average_DSL_PB_uniq = mean(Percentage_unique, na.rm = TRUE),
            StdDev = (sd(Percentage_unique, na.rm=TRUE)))
Niger_DSL_PB_average_uniq

#### Hungary samples ####

##### PB #####
Hungary_pb_average_uniq <- Hungary.df %>% 
  filter(ExtractionMethod== "PB") %>%
  summarise(Average_PB_uniq = mean(Percentage_unique, na.rm = TRUE),
            StdDev = (sd(Percentage_unique, na.rm=TRUE)))
Hungary_pb_average_uniq

##### QG #####
Hungary_qg_average_uniq <- Hungary.df %>% 
  filter(ExtractionMethod== "QG") %>%
  summarise(Average_QG_uniq = mean(Percentage_unique, na.rm = TRUE),
            StdDev = (sd(Percentage_unique, na.rm=TRUE)))
Hungary_qg_average_uniq

##### DSL #####
Hungary_DSL_average_uniq <- Hungary.df %>% 
  filter(Library== "DSL") %>%
  summarise(Average_DSL_uniq = mean(Percentage_unique, na.rm = TRUE),
            StdDev = (sd(Percentage_unique, na.rm=TRUE)))
Hungary_DSL_average_uniq

##### DSL #####
Hungary_SSL_average_uniq <- Hungary.df %>% 
  filter(Library== "SSL") %>%
  summarise(Average_SSL_uniq = mean(Percentage_unique, na.rm = TRUE),
            StdDev = (sd(Percentage_unique, na.rm=TRUE)))
Hungary_SSL_average_uniq

##### SSL + PB #####
Hungary_SSL_PB_average_uniq <- Hungary.df %>% 
  filter(Library== "SSL") %>%
  filter(ExtractionMethod== "PB") %>%
  summarise(Average_SSL_PB_uniq = mean(Percentage_unique, na.rm = TRUE),
            StdDev = (sd(Percentage_unique, na.rm=TRUE)))
Hungary_SSL_PB_average_uniq

##### SSL + QG #####
Hungary_SSL_QG_average_uniq <- Hungary.df %>% 
  filter(Library== "SSL") %>%
  filter(ExtractionMethod== "QG") %>%
  summarise(Average_SSL_QG_uniq = mean(Percentage_unique, na.rm = TRUE),
            StdDev = (sd(Percentage_unique, na.rm=TRUE)))
Hungary_SSL_QG_average_uniq

##### DSL + QG #####
Hungary_DSL_QG_average_uniq <- Hungary.df %>% 
  filter(Library== "DSL") %>%
  filter(ExtractionMethod== "QG") %>%
  summarise(Average_DSL_QG_uniq = mean(Percentage_unique, na.rm = TRUE),
            StdDev = (sd(Percentage_unique, na.rm=TRUE)))
Hungary_DSL_QG_average_uniq

##### DSL + PB #####
Hungary_DSL_PB_average_uniq <- Hungary.df %>% 
  filter(Library== "DSL") %>%
  filter(ExtractionMethod== "PB") %>%
  summarise(Average_DSL_PB_uniq = mean(Percentage_unique, na.rm = TRUE),
            StdDev = (sd(Percentage_unique, na.rm=TRUE)))
Hungary_DSL_PB_average_uniq

results<-data.frame(
  Results= c("Niger_pb_average_uniq", "Niger_qg_average_uniq", "Niger_DSL_average_uniq", "Niger_SSL_average_uniq",
             "Niger_SSL_PB_average_uniq", "Niger_SSL_QG_average_uniq", "Niger_DSL_PB_average_uniq", "Niger_DSL_QG_average_uniq",
             "Hungary_pb_average_uniq", "Hungary_qg_average_uniq", "Hungary_DSL_average_uniq", "Hungary_SSL_average_uniq",
             "Hungary_SSL_PB_average_uniq", "Hungary_SSL_QG_average_uniq", "Hungary_DSL_PB_average_uniq", "Hungary_DSL_QG_average_uniq"),
  Average= c(Niger_pb_average_uniq$Average_PB_uniq, Niger_qg_average_uniq$Average_QG_uniq, Niger_DSL_average_uniq$Average_DSL_uniq, Niger_SSL_average_uniq$Average_SSL_uniq,
             Niger_SSL_PB_average_uniq$Average_SSL_PB_uniq, Niger_SSL_QG_average_uniq$Average_SSL_QG_uniq, Niger_DSL_PB_average_uniq$Average_DSL_PB_uniq, Niger_DSL_QG_average_uniq$Average_DSL_QG_uniq,
             Hungary_pb_average_uniq$Average_PB_uniq, Hungary_qg_average_uniq$Average_QG, Hungary_DSL_average_uniq$Average_DSL_uniq, Hungary_SSL_average_uniq$Average_SSL_uniq,
             Hungary_SSL_PB_average_uniq$Average_SSL_PB_uniq, Hungary_SSL_QG_average_uniq$Average_SSL_QG_uniq, Hungary_DSL_PB_average_uniq$Average_DSL_PB_uniq, Hungary_DSL_QG_average_uniq$Average_DSL_QG_uniq),
  StdDev= c(Niger_pb_average_uniq$StdDev, Niger_qg_average_uniq$StdDev, Niger_DSL_average_uniq$StdDev, Niger_SSL_average_uniq$StdDev,
            Niger_SSL_PB_average_uniq$StdDev, Niger_SSL_QG_average_uniq$StdDev, Niger_DSL_PB_average_uniq$StdDev, Niger_DSL_QG_average_uniq$StdDev,
            Hungary_pb_average_uniq$StdDev, Hungary_qg_average_uniq$StdDev, Hungary_DSL_average_uniq$StdDev, Hungary_SSL_average_uniq$StdDev,
            Hungary_SSL_PB_average_uniq$StdDev, Hungary_SSL_QG_average_uniq$StdDev, Hungary_DSL_PB_average_uniq$StdDev, Hungary_DSL_QG_average_uniq$StdDev))

print(results)

write.xlsx(results, "Clonality_Analysis_11DEC23.xlsx", rowNames = FALSE)

plot1<-ggboxplot(Niger.df, x="ExtractionMethod", y="Percentage_unique",
                 color = "ExtractionMethod", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
                 order = c("QG", "PB"),
                 ylab = "Percentage Unique (%)", xlab = "Extraction Method")

plot2<-ggboxplot(Niger.df, x="Library", y="Percentage_unique",
                 color = "Library", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
                 order = c("DSL", "SSL"),
                 ylab = "Percentage Unique (%)", xlab = "Library Preparation Method")

plot3<-ggboxplot(Hungary.df, x="ExtractionMethod", y="Percentage_unique",
                 color = "ExtractionMethod", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
                 order = c("QG", "PB"),
                 ylab = "Percentage Unique (%)", xlab = "Extraction Method")

plot4<-ggboxplot(Hungary.df, x="Library", y="Percentage_unique",
                 color = "Library", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
                 order = c("DSL", "SSL"),
                 ylab = "Percentage Unique (%)", xlab = "Library Preparation Method")

ggarrange(plot1, plot2, plot3, plot4 + rremove("x.text"),
          labels = c("A", "B", "C", "D"),
          ncol = 2, nrow = 2)

#### Fragment length distribution ####

frags<-read.csv("Fragment_lengths_Samples.csv")
frags.df <- as.data.frame(frags)

##### 18393 analysis #####

# QG + DSL 
data<- subset(frags.df, Sample=="18393.QG.DSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot1<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Niger_18393_QG_DSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))
  

# PB + DSL 
data<- subset(frags.df, Sample=="18393.PB.DSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot2<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Niger_18393_PB_DSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))

# QG + SSL
data<- subset(frags.df, Sample=="18393.QG.SSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot3<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Niger_18393_QG_SSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))

# PB + SSL
data<- subset(frags.df, Sample=="18393.PB.SSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot4<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Niger_18393_PB_SSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))


grid.arrange(plot1, plot2, plot3, plot4, ncol =2)

##### 18398 analysis #####

# QG + DSL 
data<- subset(frags.df, Sample=="18398.QG.DSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot1<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Niger_18398_QG_DSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))


# PB + DSL 
data<- subset(frags.df, Sample=="18398.PB.DSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot2<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Niger_18398_PB_DSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))

# QG + SSL
data<- subset(frags.df, Sample=="18398.QG.SSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot3<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Niger_18398_QG_SSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))

# PB + SSL
data<- subset(frags.df, Sample=="18398.PB.SSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot4<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Niger_18398_PB_SSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))


grid.arrange(plot1, plot2, plot3, plot4, ncol =2)

#### 18400 analysis ####

# QG + DSL 
data<- subset(frags.df, Sample=="18400.QG.DSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot1<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Niger_18400_QG_DSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))


# PB + DSL 
data<- subset(frags.df, Sample=="18400.PB.DSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot2<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Niger_18400_PB_DSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))

# QG + SSL
data<- subset(frags.df, Sample=="18400.QG.SSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot3<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Niger_18400_QG_SSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))

# PB + SSL
data<- subset(frags.df, Sample=="18400.PB.SSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot4<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Niger_18400_PB_SSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))


grid.arrange(plot1, plot2, plot3, plot4, ncol =2)

#### 18416 ####

# QG + DSL 
data<- subset(frags.df, Sample=="18416.QG.DSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot1<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Hungary_18416_QG_DSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))


# PB + DSL 
data<- subset(frags.df, Sample=="18416.PB.DSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot2<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Hungary_18416_PB_DSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))

# QG + SSL
data<- subset(frags.df, Sample=="18416.QG.SSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot3<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Hungary_18416_QG_SSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))

# PB + SSL
data<- subset(frags.df, Sample=="18416.PB.SSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot4<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Hungary_18416_PB_SSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))

grid.arrange(plot1, plot2, plot3, plot4, ncol =2)

#### 18421 ####

# QG + DSL 
data<- subset(frags.df, Sample=="18421.QG.DSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot1<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Hungary_18421_QG_DSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))


# PB + DSL 
data<- subset(frags.df, Sample=="18421.PB.DSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot2<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Hungary_18421_PB_DSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))

# QG + SSL
data<- subset(frags.df, Sample=="18421.QG.SSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot3<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Hungary_18421_QG_SSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))

# PB + SSL
data<- subset(frags.df, Sample=="18421.PB.SSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot4<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Hungary_18421_PB_SSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))

grid.arrange(plot1, plot2, plot3, plot4, ncol =2)

#### 18427 ####

# QG + DSL 
data<- subset(frags.df, Sample=="18427.QG.DSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot1<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Hungary_18427_QG_DSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))


# PB + DSL 
data<- subset(frags.df, Sample=="18427.PB.DSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot2<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Hungary_18427_PB_DSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))

# QG + SSL
data<- subset(frags.df, Sample=="18427.QG.SSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot3<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Hungary_18427_QG_SSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))

# PB + SSL
data<- subset(frags.df, Sample=="18427.PB.SSL") 
data$FragmentLength <- as.numeric(data$FragmentLength)
data$Frequency <- as.numeric(data$Frequency)
data<-filter(data,FragmentLength < 200)

plot4<-ggplot(data, aes(x = FragmentLength, y = Frequency, group = Sample, color = Sample)) +
  geom_line() +  labs(title = "Hungary_18427_PB_SSL",
                      x = "Fragment Length",       y = "Frequency") +
  theme(axis.line = element_line(color = "black")) +
  scale_x_continuous(breaks = seq(0, 200, 25))

grid.arrange(plot1, plot2, plot3, plot4, ncol =2)

