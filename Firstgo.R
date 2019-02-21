library(tidyverse)
library(readxl)

elec <- read_csv(file = "https://raw.githubusercontent.com/TheUpshot/2018-live-poll-results/master/data/elections-poll-az06-3.csv",
                 col_types =cols(
                   .default = col_character(),
                   turnout_scale = col_double(),
                   turnout_score = col_double(),
                   w_LV = col_double(),
                   w_RV = col_double(),
                   final_weight = col_double(),
                   timestamp = col_datetime(format = "")
                 )) 
   


glimpse(elec)

elec %>%   
  select(response, educ4, final_weight ) %>% 
  group_by(response, educ4) %>% 
  filter(! educ4 =="[DO NOT READ] Don't Knoq/Refused") %>% 
  summarize(total= n()) %>% 
  spread(key= response, value=  total)
  
            

View(elec) 

