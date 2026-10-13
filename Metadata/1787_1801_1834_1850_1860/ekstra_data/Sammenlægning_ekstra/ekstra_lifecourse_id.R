database <- read.csv2("datamedsourceogpa3.csv")
Linked_life <- read.csv("data/life_courses_v2.1.csv")


library(dplyr)
library(tidyr)
library(tidyverse)

# Split pa_ids
pa_long <- Linked_life %>%
  select(life_course_id, pa_ids) %>%
  separate_longer_delim(pa_ids, delim = ",") %>%
  group_by(life_course_id) %>%
  mutate(number = row_number()) %>%
  ungroup() %>%
  rename(pa_id = pa_ids)

# Split source_ids
source_long <- Linked_life %>%
  select(life_course_id, source_ids) %>%
  separate_longer_delim(source_ids, delim = ",") %>%
  group_by(life_course_id) %>%
  mutate(number = row_number()) %>%
  ungroup() %>%
  rename(source_id = source_ids)

# Kombiner pa_id og source_id igen efter deres placering
Linked_life_long <- pa_long %>%
  left_join(
    source_long,
    by = c("life_course_id", "number")
  ) %>%
  filter(
    !is.na(pa_id),
    !is.na(source_id),
    pa_id != "",
    source_id != ""
  ) %>%
  mutate(
    pa_id = as.integer(trimws(pa_id)),
    source_id = as.integer(trimws(source_id))
  )


Database_med_life_course_id <- database %>%
  left_join(
    Linked_life_long %>%
      select(pa_id, source_id, life_course_id),
    by = c("pa_id", "source_id")
  )

gammel_data <- read_excel(
  "data/Manglende data.xlsx",
  col_types = "text"
)
gammel_data$ID_person <- 105809 + seq_len(nrow(gammel_data))

Database_med_life_course_id <- Database_med_life_course_id %>%
  select(-any_of("Husstands_familienr")) %>%
  mutate(Husstands_familienr = NA_character_)


nye_household_id <- gammel_data %>%
  select(ID_person, household_id)

# Kontrollér at ID_person er unik
if (anyDuplicated(nye_household_id$ID_person) > 0) {
  stop("Der findes dubletter af ID_person i gammel_data!")
}

# Gem oprindeligt antal rækker
antal_foer <- nrow(Database_med_life_course_id)

# Tilføj household_id
Database_med_life_course_id <- Database_med_life_course_id %>%
  select(-any_of("household_id")) %>%
  left_join(
    nye_household_id,
    by = "ID_person",
    relationship = "many-to-one"
  ) %>%
  relocate(household_id, .after = last_col())

# Kontrollér resultat
cat("Antal personer:", nrow(Database_med_life_course_id), "\n")

cat(
  "Personer med household_id:",
  sum(!is.na(Database_med_life_course_id$household_id) &
        trimws(as.character(Database_med_life_course_id$household_id)) != ""),
  "\n"
)


Database_med_life_course_id <- Database_med_life_course_id %>%
  mutate(
    household_census_id = if_else(
      !is.na(source_id) & !is.na(household_id) &
        trimws(as.character(household_id)) != "",
      paste0(source_id, "-", household_id),
      NA_character_
    )
  ) %>%
  relocate(household_census_id, .after = last_col())


write_delim(
  Database_med_life_course_id,
  "Databasemed_lifecourse3.csv",
  delim = ";",
  na = ""
)

write_csv2(Database_med_life_course_id,"Databasemed_lifecourse2.csv")

test <- read.csv2("Databasemed_lifecourse.csv")

sum(!is.na(Database_med_life_course_id$life_course_id))

colnames(Database_med_life_course_id)
