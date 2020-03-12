library("shiny")


source("analysis.R")
source("my_ui.R")
source("my_server.R")


my_ui <- navbarPage(
 "Welcome",
 home_page,  
 interactive_page,
 robbery_visual
 
)

shinyApp(ui = my_ui, server = my_server)