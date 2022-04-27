# Investigating the Evolution of Income Disparity in Canada

## Overview
This repository contains a paper investigating whether and how income inequality has expanded in different provinces of Canada as time passed. The data about the income level information of economic families and unattached individuals in the ten provinces of Canada between 1976 and 2020 can be found in the Open Government Portal of Statistics Canada: https://open.canada.ca/data/en/dataset/b06716c0-eea7-4267-87b6-4faaa2679f22

## Files Structure
There are three folders in this repository: inputs, scripts, and outputs.
- Inputs folder contains the raw and cleaned dataset used in this paper as well as the datasheet.
- Scripts folder contains two R files. 00-simulation.R simulate the data that we expected for this paper. 01-cata_cleaning.R imports and cleans the dataset obtained from the Open Government Portal of Statistics Canada.
- Outputs folder conatins the paper, the rmd file of the paper, and a reference file.

## How to generate the paper
- Download a ZIP file of this repository
- Run 01-cata_cleaning.R to 