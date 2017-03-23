library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Delayed by Rum"),
  

    mainPanel(                       
      h3("Map"),leafletOutput("map")
    )
  )
)