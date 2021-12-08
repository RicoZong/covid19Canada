#' Vaccination and Infection Plotting
#'
#' A function that generates the plotting demonstrating the correlation of
#' COVID-19 vaccination and infection in Canada.
#'
#' @param vacPeopleNum the Boolean indicates whether to include the line
#' representing the number of total vaccinated people in the line plot.
#' @param dailyInfectNum the Boolean indicates whether to include the line
#' representing the number of daily infection in the line plot.
#' @param dailyDeathNum the Boolean indicates whether to include the line
#' representing the number of daily death in the line plot.
#'
#' @return Returns a plot that demonstrates the correlation of
#' COVID-19 vaccination(vaccinated & fully vaccinated) and
#' infection(infection & death) in Canada.
#'
#' @examples
#' #Example 1:
#' #Generate the plot with only one line representing the number of vaccinated
#' #people.
#'
#' InfeVacPlot(TRUE)
#'
#' #Example 2:
#' #Generate the plot with two lines representing the number of total vaccinated
#' #people and daily death respectively.
#'
#' InfeVacPlot(TRUE, FALSE, TRUE)
#'
#' #Example 2:
#' #Generate the plot with three lines representing the number of total
#' #vaccinated people，daily infected and daily death.
#'
#' InfeVacPlot(TRUE, TRUE, TRUE)
#'
#'
#' @references
#' Ponce et al. (2021). covid19.analytics: An R Package to Obtain, Analyze and
#' Visualize Data from the Coronavirus Disease Pandemic. Journal of Open Source
#' Software, 6(59), 2995. https://doi.org/10.21105/joss.02995
#'
#' R Core Team (2021). R: A language and
#' environment for statistical computing. R
#' Foundation for Statistical Computing, Vienna,
#' Austria. URL https://www.R-project.org/.
#'
#' Wickham et al., (2019). Welcome to the tidyverse.
#' Journal of Open Source Software, 4(43), 1686,
#' https://doi.org/10.21105/joss.01686
#'
#' H. Wickham. Reshaping data with the reshape
#' package. Journal of Statistical Software, 21(12),
#' 2007.
#'
#' @export
#' @import covid19.analytics
#' @import graphics
#' @import tidyverse
#' @import reshape
InfeVacPlot <- function(vacPeopleNum = FALSE,
                        dailyInfectNum = FALSE,
                        dailyDeathNum = FALSE){
  if(vacPeopleNum == FALSE & dailyInfectNum & FALSE & dailyDeathNum == FALSE){
    stop("Need at least one input")}

  canadaInfectionData <- covid19.analytics::covid19.Canada.data()
  canadaInfectionTotal <- subset(canadaInfectionData, grepl("Canada", prname ))
  globalVaccination <- covid19.analytics::covid19.vaccination(tgt = "global")
  canadaVaccination <- subset(globalVaccination, grepl("Canada", location))


  vacPeople <- canadaVaccination$people_vaccinated
  dailyInfect <- canadaInfectionTotal$numtoday
  dailyDeath <- canadaInfectionTotal$numdeathstoday
  lengthdifference <- length(dailyDeath)- length(vacPeople)
  blankSpace <- c(rep(0, lengthdifference))
  vacPeople <- c(blankSpace,vacPeople)
  date <- canadaInfectionTotal$date
  #create a datafram
  DF <- data.frame(date)
  if(vacPeopleNum == TRUE){
    DF["vacPeople(millions)"] <- vacPeople/1000000
  }
  if(dailyInfectNum == TRUE){
    DF["dailyInfect(hundred)"] <- dailyInfect/100
  }
  if(dailyDeathNum == TRUE){
    DF["dailyDeath"] <- dailyDeath
  }
  meltData <- reshape::melt(DF)
  date <- as.Date(meltData$date, "%d-%m-%Y")
  meltData$date <- date

  ggplot2::ggplot(meltData, aes(x = date, y = value, color = variable, group = variable)) +
    geom_line() +
    labs(x = "Date",  y = "Number of people")+
    scale_x_date(date_labels = "%m-%Y")+
    ggtitle("Line plot of Vaccination and Infection in Canada")
  return(invisible(NULL))

}

# [END]








