
library(tidyverse)
library(dplyr)
dir.create("Data")

data <- read_csv("Data/Databasedata.csv")

Handicaps <- read_csv("Data/handicaps-på-herregårde1 (1).csv")


data_med_ændringer <- data %>%
  mutate(
    Handicap = if_else(
      Handicaps$handicap_arbejde == "Intet",
      Handicaps$handicap_posistion,
      Handicaps$handicap_arbejde
    )
  )

write_csv2(data_med_ændringer,"datamedhandicap.csv" )

