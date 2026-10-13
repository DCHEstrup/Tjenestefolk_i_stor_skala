library(dplyr)
library(tidyverse)
database<-read.csv2("datamedhandicap3.csv")
gammel_data <- read_excel(
  "data/Manglende data.xlsx",
  col_types = "text"
)
gammel_data$ID_person <- 105809 + seq_len(nrow(gammel_data))

database <- database %>%
  mutate(ID_person = as.character(ID_person))

gammel_data <- gammel_data %>%
  mutate(ID_person = as.character(ID_person))

# Kontrollér at ID_person er unik i gammel_data
if (anyDuplicated(gammel_data$ID_person) > 0) {
  stop("Der findes dubletter af ID_person i gammel_data!")
}
nye_pa_id <- gammel_data %>%
  select(ID_person, pa_id) %>%
  mutate(pa_id = as.character(pa_id))

if ("pa_id" %in% names(database)) {
  database <- database %>%
    rename(pa_id_gammel = pa_id)
} else {
  database$pa_id_gammel <- NA_character_
}
Database_med_pa_id <- database %>%
  left_join(
    nye_pa_id,
    by = "ID_person",
    relationship = "many-to-one"
  ) %>%
  mutate(
    pa_id = coalesce(
      na_if(trimws(pa_id), ""),
      na_if(trimws(as.character(pa_id_gammel)), "")
    )
  ) %>%
  select(-pa_id_gammel)
Database_med_pa_id_og_source_id <- Database_med_pa_id %>%
  mutate(
    source_id = case_when(
      as.character(Folketælling_Clean) == "1787" ~ 0L,
      as.character(Folketælling_Clean) == "1801" ~ 1L,
      as.character(Folketælling_Clean) == "1834" ~ 2L,
      as.character(Folketælling_Clean) == "1850" ~ 5L,
      as.character(Folketælling_Clean) == "1860" ~ 6L,
      TRUE ~ NA_integer_
    )
  )
cat(
  "Antal personer efter sammenkædning:",
  nrow(Database_med_pa_id_og_source_id),
  "\n"
)

cat(
  "Antal personer med pa_id:",
  sum(!is.na(Database_med_pa_id_og_source_id$pa_id)),
  "\n"
)

cat(
  "Antal personer med source_id:",
  sum(!is.na(Database_med_pa_id_og_source_id$source_id)),
  "\n"
)

stopifnot(
  nrow(Database_med_pa_id_og_source_id) == antal_foer
)
write_csv2(
  Database_med_pa_id_og_source_id,
  "datamedsourceogpa3.csv",
  na = ""
)
