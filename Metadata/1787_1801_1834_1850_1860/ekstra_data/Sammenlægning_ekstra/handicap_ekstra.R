library(tidyverse)
library(dplyr)
#dir.create("Data")

data <- read_csv2("Transport.csv")

Handicaps <- read_csv("data/ekstra_handicaps.csv")


data_med_ændringer <- data %>%
  mutate(
    Handicap = if_else(
      Handicaps$handicap_arbejde == "Intet",
      Handicaps$handicap_posistion,
      Handicaps$handicap_arbejde
    )
  )

write_csv2(data_med_ændringer,"datamedhandicap2.csv" )
