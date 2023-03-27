###### Birdfeeder Lab 
###### 02 March 2023  
###### EKP 

# load libraries
library(dplyr)
library(tidyr)
library(ggplot2)

# read in a csv file and make it into an object
birdfeederLab_data <- read.csv("/Users/emilypower/Desktop/BIOL_0211A/Data/Birdfeeder_Data.csv") %>%
  mutate(Mass_Diff_g = Initial_Weight_g - Final_Weight_g)
head(birdfeederLab_data)

# determine spread and location
birdfeederTable <- birdfeederLab_data %>%
  group_by(Habitat, Food_Type) %>%
  summarise(median(Mass_Diff_g), sd(Mass_Diff_g))
birdfeederTable
write.csv(birdfeederTable, "Birdfeeder Table.csv")

# create chart
birdfeederLab_chart <- birdfeederLab_data %>%
  ggplot(aes(x=Habitat, y=Mass_Diff_g)) +
  geom_boxplot(aes(fill=Food_Type)) +
  ylab("Mass Difference (g)") +
  labs(fill = "Food Type") +
  theme_classic() +
  scale_fill_manual(values = c("darkolivegreen4", "orange2"))
birdfeederLab_chart

citation(package = "base", lib.loc = NULL, auto = NULL)
