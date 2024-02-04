#### Preamble ####
# Purpose: Simulates and Tests ...
# Author: Maroosh Gillani
# Date: February 3, 2024
# Contact: maroosh.gillani@mail.utoronto.ca

# The simulation code is modified from the code provided in professor ROhan's 
# textbook "Telling Stories with Data": https://tellingstorieswithdata.com/07-gather.html#prime-ministers-of-the-united-kingdom

# Simulation of Canadian Prime-Minister Birth/Death dates
library(dplyr)
library(babynames)

set.seed(777)

simulated_dataset <-
  tibble(
    prime_minister = babynames |>
      distinct(name) |>
      unlist() |>
      sample(size = 15, replace = FALSE),
    birth_year = sample(1700:1990, size = 15, replace = TRUE),
    years_lived = sample(50:100, size = 15, replace = TRUE),
    death_year = birth_year + years_lived
  ) |>
  select(prime_minister, birth_year, death_year, years_lived) |>
  arrange(birth_year)

simulated_dataset

# Testing
simulated_dataset$birth_year |> min() >= 1700
simulated_dataset$death_year |> max() <= 2090
simulated_dataset$years_lived |> min() >= 50
simulated_dataset$years_lived |> max() <= 100


