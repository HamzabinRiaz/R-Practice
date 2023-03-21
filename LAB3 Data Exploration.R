#DATA EXPLORATION LAB 3

library(readr)
library(tidyverse)

df = read_csv('https://raw.githubusercontent.com/lgellis/STEM/master/DATA-ART-1/Data/FinalData.csv', col_names = TRUE)
df
View(df)
summary(df)
glimpse(df)
names(df)
length(df)
dim(df)
head(df)
tail(df)

library(skimr)
skim(df)


#visualising the missing data of variables in the form of graph.

install.packages("devtools")
library(devtools)
devtools::install_github("ropensci/visdat")
library(visdat)
vis_miss(df)

#shows the missing values and types as well, separates them as char / numeric
vis_dat(df)

install.packages("DataExplorer")
library(DataExplorer)
DataExplorer::create_report(df)
install.packages("inspectdf")
library(inspectdf)

allGrades <- df
oldGrades <- allGrades %>% filter(Grade > 5)
oldGrades

youngGrades <- allGrades %>% filter(Grade < 6)
youngGrades


#INCOMPLETE
