#explore your data

#calling the tidyverse data set
library(tidyverse)

#checking all the available data sets in tidyverse
data()

#calling starwars data frame from tidyverse
starwars

#checking dimensions of starwars
dim(starwars)

#checking structure of starwars data frame
str(starwars)

#making the structure look cleaner
glimpse(starwars)

#viewing whole data frame
View(starwars)

#checking upper observations of data set
head(starwars) #by default it shows 6
head(starwars, 4)

#checking lower observations of data set
tail(starwars) #by default it shows 6
tail(starwars, 4)

#checking certain index of the dataset
starwars[2,3]

#checking certain variable of the dataset
starwars$name
glimpse(starwars$name)

#if you want to use any data set in the function, you can use
attach(starwars)

# ... this will help you to call the variable directly

#use names fun to check names of all variables
names(starwars)

#find the number of observations in the dataset
length(starwars)

#checking observations of the data set
length(hair_color)

# checking class of a variable
class(hair_color)

#checking unique values in the observation
unique(hair_color)

sort(table(hair_color), decreasing = TRUE)

#finding unique values, sorting them, and viewing them as table
View(sort(table(hair_color), decreasing = TRUE))

#viewing the results in barplot
barplot(sort(table(hair_color), decreasing = TRUE))

#DOING THE SAME THING USING CODE 

starwars %>% 
  select(hair_color) %>% 
  count(hair_color) %>% 
  arrange(desc(n)) %>% 
  View() %>% 
  boxplot(hair_color)


