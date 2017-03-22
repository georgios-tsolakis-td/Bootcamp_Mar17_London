#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

source("global.R")

# Define UI for application that generates plotbuildR
dashboard_header <- dashboardHeader(
  title = "Team Name", # Add your team name
  titleWidth = 250
)
dashboard_sidebar <- dashboardSidebar(disable = T)
dashboard_body <- dashboardBody(
  fluidPage(
    # `fuildRow` allows you to separate shiny objects in different rows
    fluidRow(
      ## the id should be unique for each shiny object
      ## you can adjust all the parameters listed below
      ## id: add a custom id specific to this plot
      ## col_width: width of the plot, max = 12(default), should be integer value
      ## status: Sets the theme of the plotbuildR. 
         ### Possible values: "primary" = blue, "success" = green, "info" = aqua, "warning" = yellow, "danger" = red(Default)
      ## solidHeader: logical value; should the header be solid theme color? True(Default), False
      ## check ?generatePlotUI for more details
      generatePlotUI(id = "test-plot", col_width = 12, status = "danger", solidHeader = T)
    )
  )
)

ui <- dashboardPage(
  header = dashboard_header,
  sidebar = dashboard_sidebar,
  body = dashboard_body,
  skin = "red"
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  ## module: after final update of the package this agrument will be depricated
  ## id: the id should be same as the corresponding generatePlotUI in the UI section
  ## df_list: it's a mandatory argument; Pass a list containing the names of all the data frames that you would like to visualise
      ## check global.R file: `df_list` list consists the names of all the R objects in global environment
  ## check ?generatePlot to get the list of all accepted input arguments

  callModule(module = generatePlot, id = "test-plot", df_list = df_list)
}

# Run the application 
shinyApp(ui = ui, server = server)

