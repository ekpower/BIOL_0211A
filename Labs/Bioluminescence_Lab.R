### EKP
### Biostatistics
### Bioluminescence lab
### 03/16/23

# load in packages
library(dplyr)
library(vegan)
library(ggplot2)
library(colorBlindness)

# load in data
vibrio_rawData <- read.csv("/Users/emilypower/Desktop/BIOL_0211A/Data/Vibrio lab Thursday data entry - Sheet1.csv")

# narrow down to only 72 hr observations
vibrio <- vibrio_rawData %>%
  filter(Time_Since_Plating_hrs == "72")

# create chart
vibrio_chart <- vibrio %>%
  ggplot() +
  geom_mosaic(aes(x=product(Glow,Vibrio_Concentration_ul),fill=Glow)) +
  scale_fill_manual(values=c("darkolivegreen4","darkolivegreen1"), labels=c("Not Glowing", "Glowing")) +
  theme_classic() +
  xlab("Vibrio Concentration after 72 Hours (ul)") +
  scale_y_continuous(breaks=NULL) +
  ylab("Glow")
vibrio_chart
cvdPlot(vibrio_chart) # make sure chart is colorblind friendly

# perform Fisher's Test
fisher.test(vibrio$Vibrio_Concentration_ul, vibrio$Glow)
