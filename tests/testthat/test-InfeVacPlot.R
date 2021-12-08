context("Incfection and Vaccination Plot ")
library(covid19Canada)

test_that("function generates the correct data and plot", {

  plot <- InfeVacPlot(TRUE)

  expect_type(plot, "list" )
})
# [END]

