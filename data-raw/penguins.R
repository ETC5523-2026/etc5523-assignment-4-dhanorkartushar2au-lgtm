## code to prepare the `penguins` dataset
##
## Source: palmerpenguins R package (Horst, Hill & Gorman, 2020) — body-size
## measurements of penguins from the Palmer Archipelago, Antarctica, collected
## by Dr Kristen Gorman and the Palmer Station LTER. CC0 licensed.

library(dplyr)

penguins <- palmerpenguins::penguins |>
  filter(!is.na(bill_length_mm), !is.na(bill_depth_mm),
         !is.na(flipper_length_mm), !is.na(body_mass_g), !is.na(sex)) |>
  mutate(
    species      = factor(species),
    island       = factor(island),
    sex          = factor(sex),
    year         = as.integer(year),
    body_mass_kg = body_mass_g / 1000
  ) |>
  select(species, island, sex, year,
         bill_length_mm, bill_depth_mm, flipper_length_mm,
         body_mass_g, body_mass_kg) |>
  as.data.frame()

usethis::use_data(penguins, overwrite = TRUE)

cat("Rows:", nrow(penguins), " Species:", nlevels(penguins$species), "\n")