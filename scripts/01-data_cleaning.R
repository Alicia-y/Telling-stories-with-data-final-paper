#### Preamble ####
# Purpose: Clean the data downloaded from Statistics Canada 
# Author: Alicia Yang
# Data: 27 April 20212
# Contact: aliciam.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the data from https://open.canada.ca/data/en/dataset/b06716c0-eea7-4267-87b6-4faaa2679f22 and saved it to inputs/data


#### Workspace setup ####
# Use R Projects, not setwd().
library(haven)
library(tidyverse)
library(dplyr)

# Read in the raw data. 
raw_data<- read_csv(here::here("Telling-stories-with-data-final-paper/inputs/income.csv"))

# Just keep some variables that may be of interest
raw_data <- raw_data %>%
  select(REF_DATE, GEO, `Economic family type`, `Income concept`, Statistics, `Income decile`, UOM, VALUE)

# Rename some variables
raw_data <- raw_data %>% 
  rename(Year = REF_DATE, `Geographical Location` = GEO, Income = VALUE)

# Filter out rows not of interest
raw_data <- raw_data %>%
  filter(`Income concept` == "Total income",
         Statistics == "Average income",
         `Economic family type` == "Economic families and persons not in an economic family") %>%
  select(!`Income concept`) %>%
  select(!Statistics) %>%
  select(!UOM) %>%
  select(!`Economic family type`)


# Create a new variable that indicates the difference in income between the richest and poorest population of Canada
raw_data <- raw_data %>%
  mutate(`Income range` = ifelse(`Income decile` == "Total deciles", 0, NA))

for(i in 1:nrow(raw_data)) {
  if (raw_data[i,3] == "Total deciles") {
    if (raw_data[i+1,3] == "Lowest decile" && raw_data[i+10,3] == "Highest decile") {
      raw_data[i,5] = raw_data[i+10,4] - raw_data[i+1,4]
    } else{
      raw_data[i,5] = NA
    }
  }
}


# remove unavailable data
cleaned_data <- raw_data %>%
  drop_na(Year, `Geographical Location`, `Income decile`, Income)      

# save the cleaned data to inputs folder, adjust the path based on where you saved the file
write_csv(cleaned_data, "Telling-stories-with-data-final-paper/inputs/cleaned_data.csv")


         