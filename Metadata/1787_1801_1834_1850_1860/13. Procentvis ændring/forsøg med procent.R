library(tidyverse)

Database <- read_csv("data/Mette-Bastholm-Mathiesen (1).csv")

#install.packages("stringdist")
library(stringdist)
library(dplyr)

#Opret 2 kolonner der viser den procentvise ændring mellem de nye og gamle kolonner med position i Hustand og Arbejdstitel

clean_text <- function(x) {
  x <- tolower(x)
  x <- trimws(x)
  x
}

Database$procent_forskel_Arbejdstitel <- mapply(function(x, y) {
  x <- clean_text(x)
  y <- clean_text(y)
  
  afstand <- stringdist(x, y, method = "lv")
  afstand / max(nchar(x), nchar(y)) * 100
  
}, Database$Arbejde.titel, Database$Arbejde_titel_Clean)


Database$procent_forskel_Position <- mapply(function(x, y) {
  x <- clean_text(x)
  y <- clean_text(y)
  
  afstand <- stringdist(x, y, method = "lv")
  afstand / max(nchar(x), nchar(y)) * 100
  
}, Database$Position.i.husstanden, Database$Position_i_husstanden_Clean)

# Tilføjelse af ny kolonne med fødselsår. Den er ikke helt præcis da det er +/- 1 år

Database <- Database %>%
  mutate(
    Folketælling_Clean = as.numeric(Folketælling_Clean),
    Alder_Clean = as.numeric(Alder_Clean)
  )

Database <- mutate(Database, Fødselår = Database$Folketælling_Clean - Database$Alder_Clean)




