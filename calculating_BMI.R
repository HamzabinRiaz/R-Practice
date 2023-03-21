install.packages("tidyverse")
require(tidyverse)
data()
View(starwars)
starwars %>% 
  select(gender, mass, height, species) %>% 
  filter(species == "Human") %>% 
  na.omit() %>% 
  mutate(height = height / 100) %>% 
  mutate(BMI = mass / height^2) %>% 
  group_by(gender) %>% 
  summarize(Avg_BMI = mean(BMI))
    