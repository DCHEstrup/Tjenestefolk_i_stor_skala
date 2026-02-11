dir.create("data")

library(tidyverse)
library(dplyr)

#indlæsning af gammel og ren data

gammel_data <- read.csv2("data/Samlet 1787, 1801, 1834, 1850, 1860.csv")

ren_data <- read_csv("data/DCH-ændringer-3.csv")

#let rengøring af tomme kolonner
gammel_data <- gammel_data %>% 
  select(-c(X.48,X.47,X.46,X.45,X.44,X.43,X.42,X.41,X.40,X.39,X.38,X.37,X.36,X.35,X.34,X.33,X.32,X.31,X.30,X.29,X.28,X.27,X.26,X.25,X.24,X.23,X.22,X.21,X.20,X.19,X.18,X.17,X.16,X.15,X.14,X.13,X.12,X.11,X.10,X.9,X.8,X.7,X.6,X.5,X.4,X.3,X.2,X.1))

# ændringer af navne i det renset data

ren_data <- ren_data %>% 
  rename(
    Herregård_Clean = Herregård
  )

ren_data <- ren_data %>% 
  rename(
    Folketælling_Clean = Folketælling
  )
    
ren_data <- ren_data %>% 
  rename(
    Alder_Clean = Alder
  )
ren_data <- ren_data %>% 
  rename(
    Fødested_Clean = Fødested
  )
ren_data <- ren_data %>% 
  rename(
    Position_i_husstanden_Clean = `Position i husstanden`
  )
ren_data <- ren_data %>% 
  rename(
    Trossamfund_Clean = Trossamfund
  )
ren_data <- ren_data %>% 
  rename(
    Civilstand_clean = Civilstand
  )
ren_data <- ren_data %>% 
  rename(
    Arbejde_titel_Clean = `Arbejde/titel`
  )

#Tilføjelse af ID_person nummer 

gammel_data$ID_person <- 1:nrow(gammel_data)

ren_data$ID_person <- 1:nrow(ren_data)

  #Tilføjelse af de nye renset kolonner til de gamle

Nyt_data <- gammel_data %>% 
  left_join(ren_data %>% 
              select(ID_person,Herregård_Clean,Folketælling_Clean,Alder_Clean,Fødested_Clean,Position_i_husstanden_Clean,Trossamfund_Clean,Civilstand_clean,Arbejde_titel_Clean,`Køn_K/M`),
            by = "ID_person")


#udskriv den nye CSV fil med de tilføjet indformationer
write_csv2(Nyt_data,"ren1787_1801_1834_1850_1860.csv" )
