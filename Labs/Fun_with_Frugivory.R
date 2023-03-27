# load in packages
library(dplyr)
library(vegan)
library(ggplot2)

frugivory_data <- read.csv("/Users/emilypower/Desktop/BIOL_0211A/Data/bci_birds_mar_24_2023.csv")
head(frugivory_data)

sampleMean <- mean(frugivory_data$Fruit.Percent)
hypothesizedMean <- 14.8
standardDeviation <- sd(frugivory_data$Fruit.Percent)
sampleSize <- length(frugivory_data$Fruit.Percent)
t <- (sampleMean - hypothesizedMean)/(standardDeviation / sqrt(sampleSize))
t
