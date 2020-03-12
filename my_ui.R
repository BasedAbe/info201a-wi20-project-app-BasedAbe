source("analysis.R")

robbery_visual <- tabPanel(                              # Creates Robbery Comparsion Tab
  "Robbery Crime Rate Comparison",                          # Creates sidepanel
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "question", label = "Which city lowered the total number of robberies   # Create Question
                the most, Seattle or Chicago?"), 
      textOutput(outputId = "message")                                                            # Response to question above
    ),
    
    mainPanel(
      h3("Data Science Question"),
      h4("2. Which city has been able to reduce the number of robberies committed in the time period of our dataset?"),
      p("This question is significant because it allows us to gauge which city has taken the proper steps to reduce 
         the amount of robberies occurring in each city in a 10-year time span.  The datasets will allow us to answer 
         our question by giving us clear indication of  which city has been successful in reducing robberies."),
    )
  ),
  plotOutput(outputId = "my_plot"),        # Render Plot
  tableOutput(outputId = "table_data"),    # Render Table
  h3("Analysis"),
  p("It is quite evident from the results that there was a drastic decrease in the number of robberies in Chicago from 2008-2009 to 2018-2019. 
    Chicago went from having", strong("16,714"),"robberies in 2008-2009 to only", strong("9,439"), "in 2018-2019, compared to Seattle which seen an increase in 
    the number of robberies going from", strong("1,586"), "in 2008-2009 to", strong("2,214"), "in 2018-2019. As a result, Seattle seen the number of robberies increase 
    by", strong("+628"), "while Chicago was able to reduce the number of robberies by a staggering margin with", strong("-7,275"), "less robberies in 2018-2019 than 10 years 
    prior. A possible explanation for the large margin could be that there were 96,043 total entries for the 2018-2019 Chicago dataset compared to 149,652 
    entries for the 2008-2009 dataset. That may be due to a reduction in Chicago crime or it may be related to less entries being put in the system for 
    another unknown reason"),
  
)

home_page <- tabPanel(
  "Home",
  titlePanel("Property Crime Rates: Seattle Vs. Chicago"),
  h2("Data Introduction"),
  h3("Problem Domain"),
  p("Seattle, Washington and Chicago, Illinois are some of the most popular destinations for those looking to relocate or for those just 
    looking for a vacation destination. Unfortunately, both cities have faced challenges in being able to mitigate the high rates of property 
    crime plaguing each respective city. According to FindLaw, property crimes are defined as crimes relating to theft or destruction of 
    someone else's property. A few examples of property crimes include (but are not limited to) theft, burglary, robbery, and arson."), 
  h3("Data Description"),
    p("For the sake of being concise we will focus our dataset on the property crimes mentioned above and we will be 
    analyzing the years of 2018-2019 with one question including data from 2008-2009 as well. We collected our data 
    sets on crime from the", 
    
    a("City of Seattle Open Data Portal", href = "https://data.seattle.gov/Public-Safety/Crime-Data/4fs7-3vj5/data"),
    "and", 
    a("City of Chicago Data Portal.", href = "https://data.cityofchicago.org/Public-Safety/Crimes-2001-to-present/ijzp-q8t2/data"), 
    
    "Are datasets will allow those who live in or intend on frequenting either city to foster a better understanding of the current 
    state of property crime in each city and will allow them to analyze how each city has attempted to curb the high rates affecting 
    the city over time."),
  
  h3("GitHub Page"),
  p("If you are interested in learning more about the topic you can visit this", a("GitHub Page.", href = "https://info201a-wi20.github.io/Final_Project_Report_Team_Infomaniacs/"),
    "The GitHub page allows you to  see more details about the data and learn more about the report."),
  h3("How to Use This Shiny App"),
  p("You can navigate to the various pages by pressing on the tabs that are located near the top of the page. From there you can
    select the Seattle Property Crime Rates page which is the page that allows for the most interactive analysis. On that page you 
    can click on the trendline widget box to display a trendline on the visualization below. Above that trendline widget, there is 
    widget that allows you to select a property crime to display on the plot. From there you can develop your own insights on the 
    changes in property crime. If you select the robbery crime rate comparison tab you will be taken to a page where you can guess
    which city reduced the number of robberies in 10-year time frame. After guessing you can scroll below to see a visual and table
    that helps you understand which city was able to reduce the rates of robbery"),
  h4("Author: Abel Kassa")
)

feature_input <- selectInput(           # Creating feature widget for interactive page
  inputId = "feature_choice",       
  label = "Property Crime of Interest",
  choices = features,
  selected = "Robbery.Rates"
)

trendline_input <- checkboxInput(       # Widget to display trendline on plot when selected
  inputId = "show_trend",
  label = "Show Trendline",
  value = TRUE
)

interactive_page <- tabPanel(         # Creates Seattle Property Crime Tab
  "Seattle Property Crime Rates",
  mainPanel(
    h3("Data Science Question"),
    h4("1. Which property crimes has Seattle been able to reduce and which property crimes has Seattle seen
       a rise in?"),
    p("This question is significant because it allows us to visualize the changes in Seattle's property crime
      rates from the years 1995-2015. This will give us a better understanding of how the city has attempted to
      reduce its property crime rates in a 20-year period."),
    feature_input,                     # Using widgets
    trendline_input,                   # Using widget
    plotOutput(outputId = "sea_plot"),         # Render plot
    tableOutput(outputId = "num_analysis"),    # Render Table
    h3("Interactive Analysis"),
    p("It's slightly difficult to tell the changes at first glance but if you click on the trendline widget the property crime changes 
    become evident. For example, the robbery rates in Seattle have clearly grown when visualized with the trendline. Compare that to when you 
    look at theft rates which appear to have an obvious decline when visualized with the trendline. The rates of arson appear to be relatively
    steady while when looking at the burglary rates it appears to be a slight dip in the rate around the early 2000's. It appears that in
    Seattle property crime has risen across the board with the only exception being the theft rates which appears to have reduced slightly."),
  )
)