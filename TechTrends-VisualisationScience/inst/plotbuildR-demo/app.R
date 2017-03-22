#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

source("global.R")
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  sidebarLayout(
    sidebarPanel = selectInput("species", label = "Select a Species", choices = data1$Species),
    mainPanel = generatePlotUI(id = "test-plot", col_width = 12, status = "danger",solidHeader = T)
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  reactive_list <- list()
  reactive_list$data_filtered <- reactive({
     data1 %>% filter(Species %in% input$species)
  })
   callModule(module = generatePlot, id = "test-plot", df_list = df_list, reactive_df = reactive_list, df = "data_filtered")
}

# Run the application 
shinyApp(ui = ui, server = server)

