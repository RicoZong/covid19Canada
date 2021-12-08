library(shiny)


ui = fluidPage(

  titlePanel(tags$h1(tags$b("covid19Canada:"),"Canada Covid-19 Infection and Vaccination Data Analysis")),

  sidebarLayout(
    sidebarPanel(
      tags$p("Select the lines watted to show in the plot."),
      checkboxInput("vacPeopleNum", "Total number of vaccinated people", FALSE),
      checkboxInput("dailyInfectNum", "Number of daily infection",FALSE),
      checkboxInput("dailyDeathNum", "Number of daily death", FALSE),
    ),

    mainPanel(
      plotOutput("plot")
    )
  )
)


server = function(input, output) {
  output$plot <- renderPlot({
    covid19Canada::InfeVacPlot(input$vacPeopleNum,
                               input$dailyInfectNum,
                               input$dailyDeathNum)
  }

  )

}

shinyApp(ui = ui, server = server)


