source("analysis.R")


my_server <- function(input, output){
  output$message <- renderText(({
    message_str <- paste("You answered", input$question, ".Check out the analysis below to see if you were correct" ) 
  }))
  output$my_plot <- renderPlot({graph_of_change_in_robberies})
  output$table_data <- renderTable(({robbery_results}))
  
  output$sea_plot <- renderPlot({
  the_plot <- ggplot(data = seattle_rates, 
                     mapping = aes_string(
                       x = input$feature_choice,
                       y = "Year",
                       color = "Year")) +  labs(
                         title = "Seattle Property Crime Rates 1995-2015", 
                         color = "Year" # legend label for the "color" property
                       ) + geom_point()
  if(input$show_trend == TRUE){
    the_plot <- the_plot + geom_smooth(se = FALSE)
  }
  
  return(the_plot)
  
  })
  output$num_analysis <- renderTable(top_5)
}