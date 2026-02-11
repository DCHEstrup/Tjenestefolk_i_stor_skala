dir.create("data")

# ikke alle pakker bruges
library(tidyverse)
library(dplyr)
library(stringr)
library(ggplot2)
library(scales)
library(plotly)
library(shiny)
library(readr)

install.packages("geosphere")
library(geosphere)

#indlæsning af data personer er dataen før lokationer tilføjes. Lokationer er de lokationer amalie har lavet. Herregård er centerets liste over herregårde
personer <- read_csv2("data/25_10_01, 1787, 1801, 1834, 1850, 1860. Person_ID_Folketælling_Alder_køn_trossamfund_fødested_Civilstand_Længde_Bredde.csv", na ="NULL")
Herregaard <- read_csv("data/Herregård3.csv")
lokationer <- read.csv("data/lokationer 4.csv")
#Tilføjelse af Længde og breddegrader
personer1 <- personer %>% 
  left_join(lokationer %>% 
              select(Person_ID,Breddegrader_Fødested,Længdegrader_Fødested),
            by ="Person_ID")


#Problemfinding
Herregaard <- Herregaard %>% mutate(ID = as.numeric(ID))
lokationer <- lokationer %>% mutate(Person_ID = as.numeric(Person_ID))
personer <- personer %>% mutate(Person_ID = as.numeric(Person_ID))

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
data <- data %>%
  mutate(Transport = distHaversine(
    cbind(Længdegrader_Fødested, Breddegrader_Fødested), 
    cbind(Long,Lat)
  ) / 1000)


#Sletning af kolonner som ikke skal med i den endelige

Rendata <- data %>%
  select(-Oversigtsnavn, -`Nuværende navn`, -Adresse, -HjemmesideLAT, -`HjemmesideLONG'`, -Lat, -Long)

#Ændring af navn på nogle kolonner

Nynavne <- Rendata %>%
  rename(
    Fødested = Fødested...7,
    Fødested_Clean = Fødested...23,
    HerregaardRegion = Region,
    HerregaardKommune = Kommune
  )


#oprunding af KM i transport
Nynavne <- Nynavne %>%
  mutate(Transport = round(Transport, 6))

#Gem fil
write_csv2(Nynavne, "25_10_2.csv")

summary(Nynavne$Transport)


















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



