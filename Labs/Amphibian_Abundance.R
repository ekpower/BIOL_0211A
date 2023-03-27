# iNat independent projects:
# basic map and lat-long plotting code 

#to make basic map using coordinates and overlay lat/long points

install.packages("sf")
install.packages("rnaturalearth")
library("ggplot2") 
library("sf")
library("rnaturalearth")
theme_set(theme_bw()) #not sure if this is necessary, try without?

#import dataset with Latitude and Longitude values
sites2 <- read.csv("/Users/emilypower/Desktop/BIOL_0211A/Data/Amphibian_Observations.csv", header=T) 

#plot on map 
world <- ne_countries(scale = "medium", returnclass = "sf")
ggplot(data = world) +
  geom_sf() +
  geom_point(data = sites2, aes(x = Longitude, y = Latitude, colour=Value), size = 4, 
             shape = 19) +
  coord_sf(xlim = c(-85.5, -77.5), ylim = c(24.5, 33), expand = FALSE)
world

#
######

