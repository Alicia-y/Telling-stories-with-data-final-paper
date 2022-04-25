#### Preamble ####
# Purpose: Simulate data 
# Author: Alicia Yang
# Data: 27 April 20212
# Contact: aliciam.yang@mail.utoronto.ca

# Workplace setup
library(tidyverse)

simulated_data <-
  tibble(Year = rep(1976:2020, each=143),
         `Geographical Location`=rep(c(
           rep("Canada",11),
           rep("Atlantic provinces", 11),
           rep("Newfoundland and Labrador", 11),
           rep("Prince Edward Island", 11),
           rep("Nova Scotia", 11),
           rep("New Brunswick", 11),
           rep("Quebec", 11),
           rep("Ontario", 11),
           rep("Prairie provinces", 11),
           rep("Manitoba", 11),
           rep("Saskatchewan", 11),
           rep("Alberta", 11),
           rep("British Columbia", 11)
         ), 45),
         `Income decile` = rep(c("Total deciles","Lowest decile","Second decile","Third decile","Fourth decile", "Fifth decile","Sixth decile","Seventh decile","Eighth decile","Ninth decile","highest decile"),585),
         Income = rep(0,6435),
         `Income range` = rep(0,6435))


for (i in 1:nrow(simulated_data)) {
  
}
