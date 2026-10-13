
#dir.create("Data")
library(dplyr)
library(tidyverse)
Database <- read.csv2("datamedhandicap2.csv")
Folketælling_1850 <- read.csv("data/census_1850__v1__cl.csv")
Folketælling_1860 <- read.csv("data/census_1860__v1__cl.csv")
library(dplyr)
library(readxl)

gammel_data <- read_excel(
  "data/Manglende data.xlsx",
  col_types = "text"
)
gammel_data$ID_person <- 105809 + seq_len(nrow(gammel_data))
# Sørg for at ID_person har samme datatype
Database <- Database %>%
  mutate(ID_person = as.character(ID_person))

gammel_data <- gammel_data %>%
  mutate(ID_person = as.character(ID_person))

# Hent de to kolonner fra gammel_data
nye_oplysninger <- gammel_data %>%
  select(ID_person, Fødested, Trossamfund)

# Erstat værdierne i Database
Database <- Database %>%
  left_join(
    nye_oplysninger,
    by = "ID_person",
    suffix = c("", "_ny"),
    relationship = "many-to-one"
  ) %>%
  mutate(
    Fødested = if_else(
      !is.na(Fødested_ny) & trimws(Fødested_ny) != "",
      Fødested_ny,
      Fødested
    ),
    Trossamfund = if_else(
      !is.na(Trossamfund_ny) & trimws(Trossamfund_ny) != "",
      Trossamfund_ny,
      Trossamfund
    )
  ) %>%
  select(-Fødested_ny, -Trossamfund_ny)
 
#1850

matches_1850 <- Folketælling_1850 %>%
  inner_join(
    Database,
    by = c(
      "Kilde" = "Folketælling",
      "navn" = "Navn",
      "Alder" = "Alder",
      "Civilstand" = "Civilstand",
      "Erhverv" = "Arbejde.titel",
      "fødested" = "Fødested"
    )
  )


handicap_forskelle_1850 <- matches_1850 %>%
  filter(
    # Udeluk hvor værdierne er ens
    handicaps != Handicap | is.na(handicaps) | is.na(Handicap)
  ) %>%
  filter(
    # Udeluk tom handicaps + "Intet" i Handicap
    !((is.na(handicaps) | handicaps == "") & Handicap == "Intet")
  )

handicap_forskelle_1850 <- handicap_forskelle_1850 %>%
  filter(trimws(handicaps) != "-")


Database_med_handicaps <- Database %>%
  left_join(
    handicap_forskelle_1850 %>%
      select(ID_person, handicaps),
    by = "ID_person"
  ) %>%
  mutate(
    Handicap = if_else(
      Handicap == "Intet" &
        !is.na(handicaps) &
        handicaps != "",
      handicaps,
      Handicap
    )
  ) %>%
  select(-handicaps)

#1860
matches_1860 <- Folketælling_1860 %>%
  inner_join(
    Database,
    by = c(
      "Kilde" = "Folketælling",
      "navn" = "Navn",
      "Alder" = "Alder",
      "Civilstand" = "Civilstand",
      "fødested" = "Fødested"
    )
  )

handicap_forskelle_1860 <- matches_1860 %>%
  filter(
    # Udeluk hvor værdierne er ens
    handicaps != Handicap | is.na(handicaps) | is.na(Handicap)
  ) %>%
  filter(
    # Udeluk tom handicaps + "Intet" i Handicap
    !((is.na(handicaps) | handicaps == "") & Handicap == "Intet")
  )

handicap_forskelle_1860 <- handicap_forskelle_1860 %>%
  filter(trimws(handicaps) != "-")

Database_med_handicaps <- Database_med_handicaps %>%
  left_join(
    handicap_forskelle_1860 %>%
      select(ID_person, handicaps),
    by = "ID_person"
  ) %>%
  mutate(
    Handicap = if_else(
      Handicap == "Intet" &
        !is.na(handicaps) &
        handicaps != "",
      handicaps,
      Handicap
    )
  ) %>%
  select(-handicaps)

write_csv2(Database_med_handicaps,"datamedhandicap3.csv" )
glimpse(Database_med_handicaps$Handicap)
