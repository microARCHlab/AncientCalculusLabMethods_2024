####### Renaming File names then plotting #######
##January 11, 2024
##Iyunoluwa Ademola-Popoola
##MDPlot_Anaerolineacea439

# set working directory
setwd("$PATH")

library(ggplot2)
library(plyr)
library(dplyr)
library(data.table)
library(stringr)
library(ggpubr)
library(extrafont) 
library(patchwork)

setwd("/Users/sterl/OneDrive/Desktop/microArch/RA-duties/Summer_2022/Library/MapDamage/Anaerolineacea439/HUNGARY_FILES/")

#### Hungary - Anaerolineacae oral taxon 439 ####

# list files 
three_files<- list.files(pattern = "-3")
five_files<- list.files(pattern = "-5")

# creates a list of df for each sample 
my_list_five <- list()
for (file in five_files){
  x<-print(file)
  y<-paste(x, "_5", sep = "")
  file_n <- read.table(file, header = TRUE)
  my_list_five[[file]] <- file_n
}


# bind data together 
df_5<-cbind(cat=rep(names(my_list_five), sapply(my_list_five, nrow)), do.call(rbind, my_list_five))


# creates a list of df for each sample 
my_list_three <-list()
for (file in three_files){
  x<-print(file)
  y<-paste(x, "_3", sep = "")
  file_n<-read.table(file, header = TRUE)
  my_list_three[[file]] <- file_n
}


df_3<-cbind(cat=rep(names(my_list_three), sapply(my_list_three, nrow)), do.call(rbind, my_list_three))

# bind data together 
plot5<-ggplot(df_5, aes(df_5$pos, df_5$X5pC.T, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "5' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30)) +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs")

print(plot5)

plot3<- ggplot(df_3, aes(df_3$pos, df_3$X3pG.A, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "3' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30), position = "right") +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs") +
  xlim(rev(range(df_3$pos))) 

plot3<-ggplot(df_3, aes(df_3$pos, df_3$X3pG.A, color=cat)) + 
  geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "3' ends") + 
  theme_minimal() + 
  scale_y_continuous(limits = c(0, 0.30), position = "right") +
  theme(legend.position = c(.6, .75), 
        text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  xlim(rev(range(df_3$pos)))

figure <- ggarrange(plot5, plot3,
                    labels = c("A", "B"),
                    #hjust = 1.2,
                    vjust = 3,
                    ncol = 2, nrow = 1)

#### Niger - Anaerolineacae oral taxon 439 ####

setwd("/Users/sterl/OneDrive/Desktop/microArch/RA-duties/Summer_2022/Library/MapDamage/Anaerolineacea439/NIGER_FILES/")

# list files 
three_files<- list.files(pattern = "-3")
five_files<- list.files(pattern = "-5")

# creates a list of df for each sample 
my_list_five <- list()
for (file in five_files){
  x<-print(file)
  y<-paste(x, "_5", sep = "")
  file_n <- read.table(file, header = TRUE)
  my_list_five[[file]] <- file_n
}


# bind data together 
df_5<-cbind(cat=rep(names(my_list_five), sapply(my_list_five, nrow)), do.call(rbind, my_list_five))


# creates a list of df for each sample 
my_list_three <-list()
for (file in three_files){
  x<-print(file)
  y<-paste(x, "_3", sep = "")
  file_n<-read.table(file, header = TRUE)
  my_list_three[[file]] <- file_n
}


df_3<-cbind(cat=rep(names(my_list_three), sapply(my_list_three, nrow)), do.call(rbind, my_list_three))

# bind data together 
plot5<-ggplot(df_5, aes(df_5$pos, df_5$X5pC.T, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "5' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30)) +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs")

#print(plot5)

plot3<- ggplot(df_3, aes(df_3$pos, df_3$X3pG.A, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "3' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30), position = "right") +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs") +
  xlim(rev(range(df_3$pos))) 

figure <- ggarrange(plot5, plot3,
                    labels = c("A", "B"),
                    #hjust = 1.2,
                    vjust = 3,
                    ncol = 2, nrow = 1)

figure

setwd("/Users/sterl/OneDrive/Desktop/microArch/RA-duties/Summer_2022/Library/MapDamage/Anaerolineacea439/NIGER_FILES/")

# list files 
three_files<- list.files(pattern = "-3")
five_files<- list.files(pattern = "-5")

# creates a list of df for each sample 
my_list_five <- list()
for (file in five_files){
  x<-print(file)
  y<-paste(x, "_5", sep = "")
  file_n <- read.table(file, header = TRUE)
  my_list_five[[file]] <- file_n
}


# bind data together 
df_5<-cbind(cat=rep(names(my_list_five), sapply(my_list_five, nrow)), do.call(rbind, my_list_five))


# creates a list of df for each sample 
my_list_three <-list()
for (file in three_files){
  x<-print(file)
  y<-paste(x, "_3", sep = "")
  file_n<-read.table(file, header = TRUE)
  my_list_three[[file]] <- file_n
}


df_3<-cbind(cat=rep(names(my_list_three), sapply(my_list_three, nrow)), do.call(rbind, my_list_three))

# bind data together 
plot5<-ggplot(df_5, aes(df_5$pos, df_5$X5pC.T, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "5' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30)) +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs")

#print(plot5)

plot3<- ggplot(df_3, aes(df_3$pos, df_3$X3pG.A, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "3' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30), position = "right") +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs") +
  xlim(rev(range(df_3$pos))) 

figure <- ggarrange(plot5, plot3,
                    labels = c("A", "B"),
                    #hjust = 1.2,
                    vjust = 3,
                    ncol = 2, nrow = 1)

figure

#### Hungary - M. oralis ####

setwd("/Users/sterl/OneDrive/Desktop/microArch/RA-duties/Summer_2022/Library/MapDamage/Methanobrevibacter_DSM_7256/HUNGARY/")

# list files 
three_files<- list.files(pattern = "-3")
five_files<- list.files(pattern = "-5")

# creates a list of df for each sample 
my_list_five <- list()
for (file in five_files){
  x<-print(file)
  y<-paste(x, "_5", sep = "")
  file_n <- read.table(file, header = TRUE)
  my_list_five[[file]] <- file_n
}


# bind data together 
df_5<-cbind(cat=rep(names(my_list_five), sapply(my_list_five, nrow)), do.call(rbind, my_list_five))


# creates a list of df for each sample 
my_list_three <-list()
for (file in three_files){
  x<-print(file)
  y<-paste(x, "_3", sep = "")
  file_n<-read.table(file, header = TRUE)
  my_list_three[[file]] <- file_n
}


df_3<-cbind(cat=rep(names(my_list_three), sapply(my_list_three, nrow)), do.call(rbind, my_list_three))

# bind data together 
plot5<-ggplot(df_5, aes(df_5$pos, df_5$X5pC.T, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "5' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30)) +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs")

#print(plot5)

plot3<- ggplot(df_3, aes(df_3$pos, df_3$X3pG.A, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "3' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30), position = "right") +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs") +
  xlim(rev(range(df_3$pos))) 

figure <- ggarrange(plot5, plot3,
                    labels = c("A", "B"),
                    #hjust = 1.2,
                    vjust = 3,
                    ncol = 2, nrow = 1)

figure

setwd("/Users/sterl/OneDrive/Desktop/microArch/RA-duties/Summer_2022/Library/MapDamage/Anaerolineacea439/NIGER_FILES/")

# list files 
three_files<- list.files(pattern = "-3")
five_files<- list.files(pattern = "-5")

# creates a list of df for each sample 
my_list_five <- list()
for (file in five_files){
  x<-print(file)
  y<-paste(x, "_5", sep = "")
  file_n <- read.table(file, header = TRUE)
  my_list_five[[file]] <- file_n
}


# bind data together 
df_5<-cbind(cat=rep(names(my_list_five), sapply(my_list_five, nrow)), do.call(rbind, my_list_five))


# creates a list of df for each sample 
my_list_three <-list()
for (file in three_files){
  x<-print(file)
  y<-paste(x, "_3", sep = "")
  file_n<-read.table(file, header = TRUE)
  my_list_three[[file]] <- file_n
}


df_3<-cbind(cat=rep(names(my_list_three), sapply(my_list_three, nrow)), do.call(rbind, my_list_three))

# bind data together 
plot5<-ggplot(df_5, aes(df_5$pos, df_5$X5pC.T, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "5' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30)) +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs")

#print(plot5)

plot3<- ggplot(df_3, aes(df_3$pos, df_3$X3pG.A, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "3' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30), position = "right") +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs") +
  xlim(rev(range(df_3$pos))) 

figure <- ggarrange(plot5, plot3,
                    labels = c("A", "B"),
                    #hjust = 1.2,
                    vjust = 3,
                    ncol = 2, nrow = 1)

figure

#### Niger - M. oralis ####

setwd("/Users/sterl/OneDrive/Desktop/microArch/RA-duties/Summer_2022/Library/MapDamage/Methanobrevibacter_DSM_7256/NIGER/")

# list files 
three_files<- list.files(pattern = "-3")
five_files<- list.files(pattern = "-5")

# creates a list of df for each sample 
my_list_five <- list()
for (file in five_files){
  x<-print(file)
  y<-paste(x, "_5", sep = "")
  file_n <- read.table(file, header = TRUE)
  my_list_five[[file]] <- file_n
}


# bind data together 
df_5<-cbind(cat=rep(names(my_list_five), sapply(my_list_five, nrow)), do.call(rbind, my_list_five))


# creates a list of df for each sample 
my_list_three <-list()
for (file in three_files){
  x<-print(file)
  y<-paste(x, "_3", sep = "")
  file_n<-read.table(file, header = TRUE)
  my_list_three[[file]] <- file_n
}


df_3<-cbind(cat=rep(names(my_list_three), sapply(my_list_three, nrow)), do.call(rbind, my_list_three))

# bind data together 
plot5<-ggplot(df_5, aes(df_5$pos, df_5$X5pC.T, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "5' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30)) +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs")

#print(plot5)

plot3<- ggplot(df_3, aes(df_3$pos, df_3$X3pG.A, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "3' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30), position = "right") +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs") +
  xlim(rev(range(df_3$pos))) 

figure <- ggarrange(plot5, plot3,
                    labels = c("A", "B"),
                    #hjust = 1.2,
                    vjust = 3,
                    ncol = 2, nrow = 1)

figure

#### Hungary - Olsenella 807 ####

setwd("/Users/sterl/OneDrive/Desktop/microArch/RA-duties/Summer_2022/Library/MapDamage/Olsenella807/HUNGARY/")

# list files 
three_files<- list.files(pattern = "-3")
five_files<- list.files(pattern = "-5")

# creates a list of df for each sample 
my_list_five <- list()
for (file in five_files){
  x<-print(file)
  y<-paste(x, "_5", sep = "")
  file_n <- read.table(file, header = TRUE)
  my_list_five[[file]] <- file_n
}


# bind data together 
df_5<-cbind(cat=rep(names(my_list_five), sapply(my_list_five, nrow)), do.call(rbind, my_list_five))


# creates a list of df for each sample 
my_list_three <-list()
for (file in three_files){
  x<-print(file)
  y<-paste(x, "_3", sep = "")
  file_n<-read.table(file, header = TRUE)
  my_list_three[[file]] <- file_n
}


df_3<-cbind(cat=rep(names(my_list_three), sapply(my_list_three, nrow)), do.call(rbind, my_list_three))

# bind data together 
plot5<-ggplot(df_5, aes(df_5$pos, df_5$X5pC.T, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "5' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30)) +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs")

#print(plot5)

plot3<- ggplot(df_3, aes(df_3$pos, df_3$X3pG.A, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "3' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30), position = "right") +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs") +
  xlim(rev(range(df_3$pos))) 

figure <- ggarrange(plot5, plot3,
                    labels = c("A", "B"),
                    #hjust = 1.2,
                    vjust = 3,
                    ncol = 2, nrow = 1)

figure

#### Niger - Olsenella 807 ####

setwd("/Users/sterl/OneDrive/Desktop/microArch/RA-duties/Summer_2022/Library/MapDamage/Methanobrevibacter_DSM_7256/NIGER/")

# list files 
three_files<- list.files(pattern = "-3")
five_files<- list.files(pattern = "-5")

# creates a list of df for each sample 
my_list_five <- list()
for (file in five_files){
  x<-print(file)
  y<-paste(x, "_5", sep = "")
  file_n <- read.table(file, header = TRUE)
  my_list_five[[file]] <- file_n
}


# bind data together 
df_5<-cbind(cat=rep(names(my_list_five), sapply(my_list_five, nrow)), do.call(rbind, my_list_five))


# creates a list of df for each sample 
my_list_three <-list()
for (file in three_files){
  x<-print(file)
  y<-paste(x, "_3", sep = "")
  file_n<-read.table(file, header = TRUE)
  my_list_three[[file]] <- file_n
}


df_3<-cbind(cat=rep(names(my_list_three), sapply(my_list_three, nrow)), do.call(rbind, my_list_three))

# bind data together 
plot5<-ggplot(df_5, aes(df_5$pos, df_5$X5pC.T, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "5' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30)) +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs")

#print(plot5)

plot3<- ggplot(df_3, aes(df_3$pos, df_3$X3pG.A, color=cat)) + geom_line() +
  xlab("Position") +
  ylab("Misincorporation frequency") + 
  labs(subtitle = "3' ends") + 
  theme_minimal() + scale_y_continuous(limits = c(0, 0.30), position = "right") +
  theme(legend.position = c(.6, .75), text = element_text(size = 13, family = "TT Times New Roman"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")) +
  scale_colour_discrete("Sample IDs") +
  xlim(rev(range(df_3$pos))) 

figure <- ggarrange(plot5, plot3,
                    labels = c("A", "B"),
                    #hjust = 1.2,
                    vjust = 3,
                    ncol = 2, nrow = 1)

figure

