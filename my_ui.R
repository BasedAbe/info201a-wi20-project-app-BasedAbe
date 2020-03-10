robbery_visual <- tabPanel(
  "Robbery Results",
  h2("Data Science Question"),
  h3("1. Which city has been able to reduce the number of robberies committed in the time period of our dataset?"),
  p("This question is significant because it allows us to gauge which city has taken the proper steps to reduce 
    the amount of robberies occurring in each city in a 10-year time span.  The datasets will allow us to answer 
    our question by giving us clear indication of  which city has been successful in reducing robberies."),
  
  h3("Specific Question Description & Analysis Method"),
  p("Robbery is a form of property crime and there are many different types of robberies. Robbery is defined as taking 
    something from a victim's person where that person uses or threatens to use, force or violence.  We filtered for then 
    combined the different forms of robbery in our data set to summarize the number of robberies in each city in 2008-2009 and 2018-2019. 
    We then took those results and compared them to find out which city was able to reduce the number of robberies after ten years."),
  plotOutput(outputId = "graph_of_change_in_robberies"),
  
  
)

home_page <- tabPanel(
  "Home",
  titlePanel("Property Crime Rates: Seattle Vs. Chicago"),
  h2("Data Introduction"),
  h3("Problem Domain and Data Description"),
  p("Seattle, Washington and Chicago, Illinois are some of the most popular destinations for those looking to relocate or for those just 
    looking for a vacation destination. Unfortunately, both cities have faced challenges in being able to mitigate the high rates of property 
    crime plaguing each respective city. According to FindLaw, property crimes are defined as crimes relating to theft or destruction of 
    someone else's property. A few examples of property crimes include (but are not limited to) theft, burglary, robbery, and arson. 
    For the sake of being concise we will focus our dataset on the property crimes mentioned above and we will be 
    analyzing the years of 2018-2019 with one question including data from 2008-2009 as well. We collected our data 
    sets on crime from the", 
    
    a("City of Seattle Open Data Portal", href = "https://data.seattle.gov/Public-Safety/Crime-Data/4fs7-3vj5/data"),
    "and", 
    a("City of Chicago Data Portal.", href = "https://data.cityofchicago.org/Public-Safety/Crimes-2001-to-present/ijzp-q8t2/data"), 
    
    "Are datasets will allow those who live in or intend on frequenting either city to foster a better understanding of the current 
    state of property crime in each city and will allow them to analyze how each city has attempted to curb the high rates affecting 
    the city over time."),
  
  h3("GitHub Page"),
  p("If you are intereseted in learning more about the topic you can visit this", a("GitHub Page.", href = "https://info201a-wi20.github.io/Final_Project_Report_Team_Infomaniacs/"),
    "The GitHub page allows you to  see more details about the data and learn more about the report."),
  h4("Author: Abel Kassa")
  
)