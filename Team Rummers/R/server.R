#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$map <- renderLeaflet({
    
    map <- leaflet() %>% addProviderTiles(providers$CartoDB.DarkMatter) %>%
      #addTiles %>% 
      addMarkers(data=visdata,lng=~lng,lat=~lat,popup = ~popup,label=~status,group="Aircraft",icon=~airplaneIcons) %>%
      addCircles(data = visdata,lng = ~lng,lat=~lat, radius = log(visdata$preddelay)*100000,stroke = F,fillColor = "white",group="Delay") %>%
      addLayersControl(
        overlayGroups = c("Delay","Aircraft"),
        options = layersControlOptions(collapsed = FALSE)
      ) %>% hideGroup(c("Delay","Aircraft"))
    map

  })
  
})
