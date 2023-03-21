library(tidyverse)
View(msleep)

my_data = msleep %>% 
  select(name, order, bodywt, sleep_total) %>% 
  filter(order == "Primates" | bodywt > 20) %>% 
  filter(between(sleep_total, 16, 22)) %>% 
  filter(near(sleep_total, 17, tol = 0.5)) %>% 
  filter(!is.na(order))
 
