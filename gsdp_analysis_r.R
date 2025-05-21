library(tidyverse)
library(janitor)


"final_statewise_gsdp.csv" %>% 
  read_csv() %>% 
 rename("sector" = "item")-> statewise_gsdp

 
 statewise_gsdp %>% 
   pull(sector) %>% 
   unique()

 
 
 
 #1. For every financial year, which sector has performed well
 statewise_gsdp %>% 
   group_by(year,sector) %>% 
   summarise(total_gsdp = sum(gsdp,na.rm = T))->df
   
   
   df %>% 
     group_by(year) %>% 
     arrange(desc(total_gsdp)) %>% 
     slice(1)
   
   
 #2. For every financial year, which sector has performed least
     
     
     statewise_gsdp %>% 
     group_by(year,sector) %>% 
     summarise(total_gsdp = sum(gsdp,na.rm = T))->df
   
   df %>% 
     group_by(year) %>% 
     arrange(total_gsdp) %>% 
     slice(1) 
   
 #3. For every financial year, which state has performed well
   
   statewise_gsdp %>% 
     group_by(year,state) %>% 
     summarise(total_gsdp=sum(gsdp,na.rm=T)) ->df
   
   df %>% 
     group_by(year) %>% 
     arrange(desc(total_gsdp)) %>%
     slice(1)
   
 #4. For every financial year, which state has performed least
   
   statewise_gsdp %>% 
     group_by(year,state) %>% 
     summarise(total_gsdp=sum(gsdp,na.rm=T)) ->df
   
   df %>% 
     group_by(year) %>% 
     arrange(total_gsdp) %>%
     slice(1)
 #5. Top 5 performing states in Manufacturing
   
   statewise_gsdp %>%
     filter(sector == "manufacturing") %>% 
     group_by(state) %>% 
     summarise(total_gsdp = sum(gsdp,na.rm= T))-> df
   df %>% 
     arrange(desc(total_gsdp)) %>% 
     slice(1:5)
   
 #6. Top 5 performing states in Construction
   statewise_gsdp %>%
     filter(sector == "Construction") %>% 
     group_by(state) %>% 
     summarise(total_gsdp = sum(gsdp,na.rm= T))-> df
   df %>% 
     arrange(desc(total_gsdp)) %>% 
     slice(1:5)
 #7. For financial year 2016-17, for every state get top performing sector
   statewise_gsdp %>% 
     filter(year == "2016-2017") %>% #pull(state) %>% unique()
     group_by(state, sector) %>% 
     summarise(total_gsdp = sum(gsdp, na.rm = T)) ->df
   
   df %>% 
     group_by(state) %>% 
     arrange(desc(total_gsdp)) %>% 
     slice(1)

   
 #8. For financial year 2016-17, for every state get top 5 performing sectors
   statewise_gsdp %>% 
     filter(year=="2016-17") %>% 
     group_by(state,sector) %>% 
     summarise(total_gsdp=sum(gsdp,na.rm=T)) ->df
   
   df %>% 
     group_by(state) %>% 
     arrange(desc(total_gsdp)) %>% 
     slice(1:5)
 #9. How many states are performing well in Manufacturing, (if Manufacturing is in top 3)
   statewise_gsdp %>% 
     filter(sector=="Manufacturing") %>% 
     group_by(state) %>%
     summarise(total_gsdp = sum(gsdp, na.rm = TRUE), .groups = "drop") %>% 
     arrange(desc(total_gsdp)) %>%
     slice(1:5)
   
 #10. What is the GROSS GSDP of Karnataka for all financial years
   statewise_gsdp %>% 
     filter(state == "Karnataka") %>% 
     group_by(year) %>% 
     summarise(total_gsdp = sum(gsdp,na.rm = T))
   
#11. what is the total Gsdp of karnataka in 2015-16
   
 
   # Step 1: Calculate total GSDP (numeric value, not a data frame)
   total_gsdp <- statewise_gsdp %>% 
     filter(state == "Karnataka", year == "2015-16") %>% 
     summarise(total = sum(gsdp)) %>% 
     pull(total)
   
   # Step 2: Calculate percentage contribution of each row
   statewise_gsdp %>% 
     filter(state == "Karnataka", year == "2015-16") %>%
     mutate(percent = (gsdp / total_gsdp) * 100)
   
 
 
 