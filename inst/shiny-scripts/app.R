library(shiny)

ui = fluidPage(

  titlePanel(tags$h1(tags$b("covid19Canada:"),"Canada Covid-19 Infection and Vaccination Data Analysis")),

  sidebarLayout(
    sidebarPanel(
      tags$p("There are three functions. 1. demonstrates the COVID-19 infection
             data in Canada.User can enter the date of interest and interested
             province as the arguments to better undersadnd Canadian COVID-19
             infections. 2. function that demonstrates the COVID-19 vaccination
             data in Canada. User is able to enter the date of interested to
             look up the vaccination data of Canada on that specific date. 3.A
             function that generates the plotting demonstrating the correlation
             of COVID-19 vaccination and infection in Canada."),


      tags$p("1.Enter the date of interest (dd-mm-yyyy) or/and the province of
             interest tosee the infection data (blank argument will show up the
             entire Canadian infection data)"),
             textAreaInput("dateOfInterestInfect", "Date of interest"),
             textAreaInput("province", "Province of interest" ),

      tags$p("2.Enter the date of interest (yyyy-mm-dd) to see the vaccination
             data (blank argument will show up the entire Canadian vaccination
             data)"),
             textAreaInput("dateOfInterestVac", "Date of interest" ),



      tags$p("3.Select the lines watted to show in the plot."),
      checkboxInput(inputId = "vacPeopleNum",
                    "Total number of vaccinated people",
                    FALSE),
      checkboxInput(inputId= "dailyInfectNum",
                    "Number of daily infection",
                    FALSE),
      checkboxInput(inputId = "dailyDeathNum",
                    "Number of daily death",
                    FALSE),
      actionButton("start", "Start"),
    ),

    mainPanel(
      dataTableOutput("InfectTable"),
      dataTableOutput("VacTable"),
      plotOutput("plot")
    )
  )
)


server = function(input, output) {

  v <- reactiveValues(dothing = FALSE)

  observeEvent(input$start, {
    v$dothing <- input$start
  })

  observeEvent(input$tabset, {
    v$dothing <- FALSE
  })

  output$InfectTable <- renderDataTable({
    if (v$dothing == FALSE) return(NULL)
    else{
    covid19Canada::InfectionCanada(input$dateOfInterestInfect,
                                   input$province)
    }
  })

  output$VacTable <- renderDataTable({
    if (v$dothing == FALSE) return(NULL)
    else{
    covid19Canada::VaccinationCanada(input$dateOfInterestVac)
    }
  })

  output$plot <- renderPlot({
    if (v$dothing == FALSE) return()
    else{
    covid19Canada::InfeVacPlot(input$vacPeopleNum,
                               input$dailyInfectNum,
                               input$dailyDeathNum)
    }
  })

}

shinyApp(ui = ui, server = server)


