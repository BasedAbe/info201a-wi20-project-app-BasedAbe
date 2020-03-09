library("shiny")
library("ggplot2")
library("dplyr")

source("analysis.R")

my_ui <- fluidPage(
  titlePanel("Property Crime: Seattle vs. Chicago"),
  
  
)


my_server <- function(input, output){

    
}
  
  
shinyApp(ui = my_ui, server = my_server)