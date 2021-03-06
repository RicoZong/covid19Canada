#' Canada COVID-19 Infection Count
#'
#' Function that demonstrates the COVID-19 infection data in Canada. User can
#' enter the date of interest and interested province as the arguments to better
#' analyze Canadian COVID-19 infections.
#'
#' @param dateOfInterest The string indicates the date of interest(dd-mm-yyyy)
#' @param province The string that indicates the province of interest in Canada.
#'
#' @return Returns a data frame with 40 different columns that each indicates COVID-19 related counts.
#'
#' @examples
#' # Example 1:
#' #Use the function without arguments "all" that generates the entire Canadian infection data.
#'
#' CanadaInfection <- InfectionCanada("all", "all")
#' CanadaInfection
#'
#' # Example 2:
#' #Use the function only with the first argument.
#'
#' CanadaInfection <- InfectionCanada("01-01-2021")
#' CanadaInfection
#'
#' # Example 3:
#' #Use the function only with the second argument.
#'
#' CanadaInfection <- InfectionCanada(, "Ontario")
#' CanadaInfection
#'
#' # Example 4:
#' #Use the function with both arguments.
#'
#' CanadaInfection <- InfectionCanada("01-01-2021", "Ontario")
#' CanadaInfection
#'
#' @references
#' Ponce et al. (2021). covid19.analytics: An R Package to Obtain, Analyze and
#' Visualize Data from the Coronavirus Disease Pandemic. Journal of Open Source
#' Software, 6(59), 2995. https://doi.org/10.21105/joss.02995
#'
#' @export
#' @import covid19.analytics
InfectionCanada <- function(dateOfInterest = "none", province = "none"){
  canadaInfectionData <- covid19.analytics::covid19.Canada.data()
  if(dateOfInterest == "none" && province == "none"){
    stop("Need arguments")
  }
  if(dateOfInterest == "none"){
    result <- subset(canadaInfectionData, grepl(province, prname))
    return(result)
  }
  if(province == "none"){
    result <-  subset(canadaInfectionData, grepl(dateOfInterest,date))
    return(result)
  }
  if(dateOfInterest == "all" && province == "all"){
    result <- canadaInfectionData
    return(result)
  }
  else{
    preresult <- subset(canadaInfectionData, grepl(dateOfInterest, date))
    result <- subset(preresult, grepl(province, prname))
    return(result)
  }
}

# [END]



