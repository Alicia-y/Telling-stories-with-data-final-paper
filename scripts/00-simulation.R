#### Preamble ####
# Purpose: Simulate data 
# Author: Alicia Yang
# Data: 27 April 20212
# Contact: aliciam.yang@mail.utoronto.ca

# Workplace setup
library(tidyverse)
set.seed(1005813130)

# Generate the variables
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
         `Income decile` = rep(c("Total deciles","Lowest decile","Second decile","Third decile","Fourth decile", "Fifth decile","Sixth decile","Seventh decile","Eighth decile","Ninth decile","Highest decile"),585),
         Income = rep(0,6435),
         `Income range` = rep(0,6435))

# Simulate random numbers based on the expected pattern
num = 1
for (i in 1:nrow(simulated_data)) {
  if (simulated_data[i,3] == "Total deciles"){
    simulated_data[i,4] = runif(1, num*20+70000,  num*60+70000)
  }
  if (simulated_data[i,2] == "British Columbia") {
    num =  num + 1
  }
}

num = 1
for (i in 1:nrow(simulated_data)) {
  if (simulated_data[i,3] == "Lowest decile"){
    simulated_data[i,4] = runif(1, num*2+9000,  num*6+9000)
  }
  if (simulated_data[i,2] == "British Columbia") {
    num =  num + 1
  }
}

num = 1
for (i in 1:nrow(simulated_data)) {
  if (simulated_data[i,3] == "Lowest decile"){
    simulated_data[i,4] = runif(1, num*2+9000,  num*6+9000)
  }
  if (simulated_data[i,2] == "British Columbia") {
    num =  num + 1
  }
}


for (i in 1:nrow(simulated_data)) {
  if (simulated_data[i,3] == "Second decile"){
    indicator = (simulated_data[i,1] - 1975)*1000
    simulated_data[i,4] = simulated_data[i-1,4] + runif(1, as.integer(indicator)+8000,  as.integer(indicator)+12000)
  }
}

for (i in 1:nrow(simulated_data)) {
  if (simulated_data[i,3] == "Third decile"){
    indicator = (simulated_data[i,1] - 1975)*1000
    simulated_data[i,4] = simulated_data[i-1,4] + runif(1, as.integer(indicator)+8000,  as.integer(indicator)+12000)
  }
}

for (i in 1:nrow(simulated_data)) {
  if (simulated_data[i,3] == "Fourth decile"){
    indicator = (simulated_data[i,1] - 1975)*1000
    simulated_data[i,4] = simulated_data[i-1,4] + runif(1, as.integer(indicator)+8000,  as.integer(indicator)+12000)
  }
}

for (i in 1:nrow(simulated_data)) {
  if (simulated_data[i,3] == "Fifth decile"){
    indicator = (simulated_data[i,1] - 1975)*1000
    simulated_data[i,4] = simulated_data[i-1,4] + runif(1, as.integer(indicator)+8000,  as.integer(indicator)+12000)
  }
}

for (i in 1:nrow(simulated_data)) {
  if (simulated_data[i,3] == "Sixth decile"){
    indicator = (simulated_data[i,1] - 1975)*1000
    simulated_data[i,4] = simulated_data[i-1,4] + runif(1, as.integer(indicator)+8000,  as.integer(indicator)+12000)
  }
}

for (i in 1:nrow(simulated_data)) {
  if (simulated_data[i,3] == "Seventh decile"){
    indicator = (simulated_data[i,1] - 1975)*1000
    simulated_data[i,4] = simulated_data[i-1,4] + runif(1, as.integer(indicator)+8000,  as.integer(indicator)+12000)
  }
}

for (i in 1:nrow(simulated_data)) {
  if (simulated_data[i,3] == "Eighth decile"){
    indicator = (simulated_data[i,1] - 1975)*1000
    simulated_data[i,4] = simulated_data[i-1,4] + runif(1, as.integer(indicator)+8000,  as.integer(indicator)+12000)
  }
}

for (i in 1:nrow(simulated_data)) {
  if (simulated_data[i,3] == "Ninth decile"){
    indicator = (simulated_data[i,1] - 1975)*1000
    simulated_data[i,4] = simulated_data[i-1,4] + runif(1, as.integer(indicator)+8000,  as.integer(indicator)+12000)
  }
}

for (i in 1:nrow(simulated_data)) {
  if (simulated_data[i,3] == "Highest decile"){
    indicator = (simulated_data[i,1] - 1975)*1000
    simulated_data[i,4] = simulated_data[i-1,4] + runif(1, as.integer(indicator)+8000,  as.integer(indicator)+12000)
  }
}

for(i in 1:nrow(simulated_data)) {
  if (simulated_data[i,3] == "Total deciles") {
    if (simulated_data[i+1,3] == "Lowest decile" && simulated_data[i+10,3] == "Highest decile") {
      simulated_data[i,5] = simulated_data[i+10,4] - simulated_data[i+1,4]
    } else{
      simulated_data[i,5] <- NA
    }
  }
}

