#' Canada COVID-19 Vaccination Count
#'
#' A function that demonstrates the COVID-19 vaccination data in Canada. User
#' is able to enter the date of interested to look up the vaccination data of
#' Canada on that specific date.
#'
#' @param dateOfInterest The string indicates the date of interest.(year-mongth-day)
#'
#' @return Returns a data frame with 16 different columns that each indicates COVID-19 vaccination related counts.
#'
#'@examples
#' # Example 1:
#' #Use the function without arguments.
#'
#' covidVaccination <- VaccinationCanada()
#' covidVaccination
#'
#' # Example 2:
#' #Use the function only with the one argument.
#'
#' covidVaccination <- VaccinationCanada("2021-01-01")
#' covidVaccination
#'
#' @references
#' Ponce et al. (2021). covid19.analytics: An R Package to Obtain, Analyze and
#' Visualize Data from the Coronavirus Disease Pandemic. Journal of Open Source
#' Software, 6(59), 2995. https://doi.org/10.21105/joss.02995
#'
#' @export
#' @import covid19.analytics
VaccinationCanada <- function(dateOfInterest){
  globalVaccination <- covid19.analytics::covid19.vaccination(tgt = "global")
  canadaVaccination <- subset(globalVaccination, grepl("Canada", location))
  if(missing(dateOfInterest)){
    result <- canadaVaccination
    return(result)
  }
  else{
    result <- subset(canadaVaccination, grepl(dateOfInterest, date))
    return(result)
  }
}

# [END]



