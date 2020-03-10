library("shiny")
library("ggplot2")
library("dplyr")

source("analysis.R")
source("my_ui.R")


my_ui <- navbarPage(
 "Welcome",
 home_page,  
 robbery_visual
  
  
)


my_server <- function(input, output){
  output$plot <- renderPlot({return(graph_of_change_in_robberies)})
  
    
}
  
  
shinyApp(ui = my_ui, server = my_server)