dir.create("data")

library(tidyverse)
library(dplyr)

#indlæsning af gammel og ren data

gammel_data <- read.csv2("data/ren1787_1801_1834_1850_1860.csv")

ren_data <- read_csv("data/Del2Samlet-1787-1801-1834-1850-1860-csv2.csv")


# ændringer af navne i det renset data

ren_data <- ren_data %>% 
  rename(
    Sted_Clean = Sted
  )

ren_data <- ren_data %>% 
  rename(
    Nærmere_lokation_Clean = `Nærmere lokation`
  )



#Tilføjelse af ID_person nummer 


ren_data$ID_person <- 1:nrow(ren_data)

#Tilføjelse af de nye renset kolonner til de gamle

Nyt_data <- gammel_data %>% 
  left_join(ren_data %>% 
              select(ID_person,Nærmere_lokation_Clean,Sted_Clean),
            by = "ID_person")


#udskriv den nye CSV fil med de tilføjet indformationer
write_csv2(Nyt_data,"ren1787_1801_1834_1850_1860.csv" )
