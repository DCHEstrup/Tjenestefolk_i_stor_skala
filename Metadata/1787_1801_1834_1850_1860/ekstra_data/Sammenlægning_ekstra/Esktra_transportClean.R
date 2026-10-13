#dir.create("data")

# ikke alle pakker bruges
library(tidyverse)
library(dplyr)
library(stringr)
library(ggplot2)
library(scales)
library(plotly)
library(shiny)
library(readr)

#install.packages("geosphere")
library(geosphere)

#indlæsning af data personer er dataen før lokationer tilføjes. Lokationer er de lokationer amalie har lavet. Herregård er centerets liste over herregårde
personer <- read_csv2("ren1787_1801_1834_1850_1860_ekstra.csv")
Herregaard <- read_csv("data/Herregård3.csv")
lokationer <- read.csv("data/Ekstra_lokation.csv")
#lokationer <- lokationer %>%
#rename(
# ID_person = Person_ID
# )
#Tilføjelse af Længde og breddegrader
personer1 <- personer %>% 
  left_join(lokationer %>% 
              select(ID_person,Breddegrader_Fødested,Længdegrader_Fødested),
            by ="ID_person")


#Problemfinding
Herregaard <- Herregaard %>% mutate(ID = as.numeric(ID))
lokationer <- lokationer %>% mutate(ID_person = as.numeric(ID_person))
personer <- personer %>% mutate(ID_person = as.numeric(ID_person))

count(Herregaard, ID) %>% filter(n > 1)
count(personer1, ID) %>% filter(n > 1)
problem_ids <- intersect(
  Herregaard %>% count(ID) %>% filter(n > 1) %>% pull(ID),
  personer1 %>% count(ID) %>% filter(n > 1) %>% pull(ID)
)



#Tilføjelse af herregårde data, herunde lokationen af hver herregård
data <- personer1 %>% 
  left_join(Herregaard, by ="ID")

write.csv(data, file = "25_10_01, 1787, 1801, 1834, 1850, 1860. Person_ID_Folketælling_Alder_køn_trossamfund_fødested_Civilstand_Længde_Bredde.csv")


write_csv2(data, file = "2.csv")

#Renggøring af koordinator
data <- data %>%
  mutate(
    Længdegrader_Fødested = as.numeric(ifelse(Længdegrader_Fødested %in% c("NULL", "Usikker", "Ukendt","Ulæseligt"), NA, Længdegrader_Fødested)),
    Breddegrader_Fødested = as.numeric(ifelse(Breddegrader_Fødested %in% c("NULL", "Usikker", "Ukendt","Ulæseligt"), NA, Breddegrader_Fødested)),
    Long = as.numeric(Long),
    Lat = as.numeric(Lat)
  )


#Oprettelse af ny kolonne med hvor langt folk har rejst fra deres fødesogn til den herregård de arbejder på
data2 <- data %>%
  mutate(Transport = distHaversine(
    cbind(Længdegrader_Fødested, Breddegrader_Fødested), 
    cbind(Long,Lat)
  ) / 1000)


#Sletning af kolonner som ikke skal med i den endelige

Rendata <- data2 %>%
  select(-Oversigtsnavn, -`Nuværende navn`, -Adresse, -HjemmesideLAT, -`HjemmesideLONG'`, -Lat, -Long)

#Ændring af navn på nogle kolonner

Nynavne <- Rendata %>%
  rename(
    HerregaardRegion = Region,
    HerregaardKommune = Kommune
  )


#oprunding af KM i transport
Nynavne <- Nynavne %>%
  mutate(Transport = round(Transport, 6))

Nynavne2<-Nynavne %>% 
  select(-household_id,-pa_id)
Nynavne3<-Nynavne2 %>% 
  rename(
    X = ...12
  )

#Gem fil
write_csv2(Nynavne3, "Transport.csv")

summary(Nynavne3$Transport)


















summary(data$Breddegrader_Fødested)
summary(data$Længdegrader_Fødested)
summary(data$Long)
summary(data$Lat)
glimpse(data$Long)
max(data$Long)

data <- data %>%
  mutate(
    Breddegrad_Fødested   = as.numeric(Breddegrad_Fødested),
    Længdegrad_Fødested    = as.numeric(Længdegrad_Fødested),
    `Long;;;` = as.numeric(`Long;;;`),
    Lat  = as.numeric(Lat)
  )

data <- data %>%
  mutate(Transport = distHaversine(
    cbind(Længdegrader_Fødested, Breddegrader_Fødested), 
    cbind(Long,Lat)
  ) / 1000)



head(data$Breddegrad_Fødested)
head(data$Længdegrad_Fødested)
head(data$`Long;;;`)
head(data$Lat)

colSums(is.na(data[, c("Breddegrad_Fødested", "Længdegrad_Fødested", "Long;;;", "Lat")]))


data <- data %>%
  mutate(
    Transport = ifelse(
      is.na(Breddegrad_Fødested) | is.na(Længdegrad_Fødested) |
        is.na(`Long;;;`) | is.na(Lat),
      NA,  # sæt transport til NA hvis der mangler data
      distHaversine(
        cbind(Længdegrad_Fødested, Breddegrad_Fødested),
        cbind(`Long;;;`, Lat)
      ) / 1000  # km
    )
  )


summary(data$Transport)


data_clean <- data %>%
  filter(
    !is.na(Breddegrad_Fødested),
    !is.na(Længdegrad_Fødested),
    !is.na(`Long;;;`),
    !is.na(Lat)
  )



