context("Infection Canada")
library(covid19Canada)

test_that("function returns the correct data", {
  dateOfInterest = "01-01-2021"
  province = "Ontario"
  CanadaInfection <- InfectionCanada(dateOfInterest, province )

  expect_type(CanadaInfection, "list")
  expect_length(CanadaInfection, 40)
  expect_identical(CanadaInfection$pruid, as.integer(35))
})
# [END]

