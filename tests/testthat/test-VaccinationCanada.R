context("Vaccination Canada")
library(covid19Canada)

test_that("function returns the correct data", {
  dateOfInterest = "2021-01-01"
  covidVaccination <- VaccinationCanada(dateOfInterest)

  expect_type(covidVaccination, "list")
  expect_length(covidVaccination, 16)
  expect_identical(covidVaccination$date, "2021-01-01")
})
# [END]

