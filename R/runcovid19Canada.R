#' Launch Shiny App for covid19Canada
#'
#' A function that launches the Shiny app for covid19Canada.
#' The purpose of this app is only to illustrate how a Shiny
#' app works. The code has been placed in \code{./inst/shiny-scripts}.
#'
#' @return No return value but open up a Shiny page.
#'
#' @examples
#' \dontrun{
#'
#' covid19Canada::runcovid19Canada()
#' }
#'
#' @references
#' Grolemund, G. (2015). Learn Shiny - Video Tutorials. \href{https://shiny.rstudio.com/tutorial/}{Link}
#'
#' @export
#' @importFrom shiny runApp

runTestingPackage <- function() {
  appDir <- system.file("shiny-scripts",
                        package = "covid19Canada")
  shiny::runApp(appDir, display.mode = "normal")
  return()
}
# [END]
