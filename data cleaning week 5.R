# data cleaning

file.info("Mental_Health.csv")$size


library(tidyverse)
library(skimr)
library(dplyr)
mydata = read_csv("C:/Files-R/Mental_Health.csv", col_names = TRUE)
glimpse(summary(mydata))
mydata
object.size(mydata)
names(mydata)
length(mydata)
length(mydata$'Are you self-employed?')
dim(mydata)
str(mydata)
skim(mydata)

library(dplyr)
mydata <- mydata %>% rename(Employees = "How many employees does your company or organization have?", Self_Employeed = "Are you self-employed?", Tech_Company = "Is your employer primarily a tech company/organization?", IT_Role = "Is your primary role within your company related to tech/IT?", Health_Benefits = "Does your employer provide mental health benefits as part of healthcare coverage?", Health_Care_Awareness = "Do you know the options for mental health care available under your employer-provided coverage?")
colnames(mydata)
typeof(mydata$Employees)
unique(mydata$Employees)
sort(table(mydata$Employees), descending = TRUE)
View(unique(mydata$Employees))

#faulty data removal

typeof(mydata$Employees)

mydata$Employees <- as.factor(mydata$Employees)
typeof(mydata$Employees)
mydata

mean(mydata$Employees, na.rm = TRUE)
class(mydata$Employees)

View(mydata)

unique(mydata$Health_Benefits)

#finding missing values in a variable of a data frame with location
which(is.na(mydata$Health_Benefits))


table(mydata$Employees)
mydata$Employees <- as.factor(mydata$Employees)
unique(mydata$Employees)

mydata %>% 
  group_by(mydata$Employees) %>% 
  count()

for (x in 1:length(mydata$Employees)) {
  if (mydata$Employees[x] == "More than 1000") {
    mydata$Employees[x] = "1000+"
  }
}


md <- mydata$Employees
md

printmd(x)

for (x in 1:length(md)){
  print(md[x])
  if (!is.na(md[x]) & md[x] == "More than 1000") {
    print("A")
     md[x] <- "1000+"
  }
}

md

unique(md)

#removing inconsistencies

mydata

colnames(mydata)

unique(mydata$Gender)

genders <- list("male", "M", "m", "man", "Man", "cis male", "Dude", "mtf", "Male/genderqueer", "cis man", "Cis male", "Male (cis)", "Male.", "nb masculine", "Sex is male", "Malr", "I'm a man why didn't you make this a drop down question. You should of asked sex? And I would of answered yes please. Seriously how much text can this take?", "mail", "M|", "Cis Male", "Male (trans, FtM)", "MALE" )

genders
typeof(genders)

for(g in 1:length(mydata$Gender)){
  if(mydata$Gender[g] %in% genders){
    mydata$Gender[g] = "Male"
    print("***")
  }
}

mydata$Gender

unique(mydata$Gender)

female_genders <- list("woman", "female/woman" ,"female", "I identify as female.", "Female assigned at birth", "F", "Woman", "fm", "f", "Cis female", "Transitioned, M2F", "Genderfluid (born female)", "Other/Transfeminine", "Female or Multi-Gender Femme", "Cisgender Female", "genderqueer woman", "fem", "Female (props for making this a freeform field, though)", "Cis-woman", "Genderflux demi-girl", "female-bodied; no feelings about gender", "Transgender woman")

for (fg in 1:length(mydata$Gender)){
  if(mydata$Gender[fg] %in% female_genders){
    mydata$Gender[fg] = "Female"
    print("Updated")
  }
}

mydata$Gender
unique(mydata$Gender)


# ADJUSTING AGE

mydata <- mydata %>%  rename(age = "What is your age?")
unique(mydata$age)
ages <- mydata$age
mean(mydata$age)

for(a in 1:length(ages)){
  if(ages[a] < 18 | ages[a] > 80){
    ages[a] = mean(ages)
  }
}

unique(ages)
View(ages)

install.packages("Hmisc")
library(Hmisc)

ages <- ages %>%  impute(ages, mean(ages))
ages

genders

GG <- mydata$Gender
unique(GG)
table(unique(GG))
      
GG <- GG %>% impute(GG,)

which(is.na(GG))
