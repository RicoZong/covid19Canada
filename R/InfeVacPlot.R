#' Vaccination and Infection Plotting
#'
#' A function that generates the plotting demonstrating the correlation of
#' COVID-19 vaccination and infection in Canada.
#'
#' @return Returns a plotting that demonstrates the correlation of
#' COVID-19 vaccination(vaccinated & fully vaccinated)and infection in Canada.
#'
#'@examples
#' InfeVacPlot()
#'
#' @references
#' Ponce et al. (2021). covid19.analytics: An R Package to Obtain, Analyze and
#' Visualize Data from the Coronavirus Disease Pandemic. Journal of Open Source
#' Software, 6(59), 2995. https://doi.org/10.21105/joss.02995
#'
#'R Core Team (2021). R: A language and
#'environment for statistical computing. R
#'Foundation for Statistical Computing, Vienna,
#'Austria. URL https://www.R-project.org/.
#'
#' @export
#' @import covid19.analytics
#' @import graphics
InfeVacPlot <- function(){
  canadaInfectionData <- covid19.analytics::covid19.Canada.data()
  canadaInfectionTotal <- subset(canadaInfectionData, grepl("Canada", prname ))
  globalVaccination <- covid19.analytics::covid19.vaccination(tgt = "global")
  canadaVaccination <- subset(globalVaccination, grepl("Canada", location))


  vacPeople <- canadaVaccination$people_vaccinated
  #fullVacPeople <- canadaVaccination$people_fully_vaccinated
  dailyInfect <- canadaInfectionTotal$numtoday
  dailyDeath <- canadaInfectionTotal$numdeathstoday
  #numofInfec <- canadaInfectionTotal$numconf
  #numofDeath <- canadaInfectionTotal$numdeaths
  lengthdiff <- length(dailyDeath)- length(vacPeople)
  blankSpace <- c(rep(0,lengthdiff))
  vacPeople <- c(blankSpace,vacPeople)
  #fullVacPeople <- c(blankSpace,fullVacPeople)

  plot(vacPeople,dailyInfect,
       main="Vaccination and Infection",
       xlab="People who vaccinated at least once",
       ylab="Daily new infections and death",
       type="l",
       col="blue")
  lines(vacPeople,dailyDeath, col="red")
  legend("topright",
         c("Dailyinfect","Dailydeath"),
         fill=c("blue","red")
  )
  return(invisible(NULL))

}

# [END]








