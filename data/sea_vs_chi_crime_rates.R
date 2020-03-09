library(dplyr)
library(tidyr)
library(ggplot2)
 
chicago <- read.csv("Full_Crimes_Chicago_Working.csv", stringsAsFactors = FALSE)
seattle <- read.csv("Crime_Seattle_Data.csv", stringsAsFactors = FALSE)

chicago_2008 <- read.csv("Crimes_Chicago_2008_2009.csv", stringsAsFactors = FALSE)
seattle_2008 <- read.csv("Crime_Seattle_2008_2009.csv", stringsAsFactors = FALSE)

##########################################################################################

seattle_renamed_columns <- seattle      # Creating new df and renaming columns for Summary table
colnames(seattle_renamed_columns)[colnames(seattle_renamed_columns) == "Crime.Subcategory"] <- "Primary.Type"
colnames(seattle_renamed_columns)[colnames(seattle_renamed_columns) == "Primary.Offense.Description"] <- "Description"
colnames(seattle_renamed_columns)[colnames(seattle_renamed_columns) == "Neighborhood"] <- "Location.Description"
colnames(seattle_renamed_columns)[colnames(seattle_renamed_columns) == "Occurred.Date"] <- "Date"

sea_summary <- seattle_renamed_columns %>%        # Creating summary tables with head of table
  select(Date,Primary.Type, Description, Location.Description, Precinct) %>% 
  head(5)

chi_summary <- chicago %>%                       # Creating summary tables with head of table
  select(Date, Primary.Type, Description, Location.Description, IUCR) %>% 
  head(5)

# 2018-2019 Summary of Property Crime #################################################################################### 

sea_robbery <- seattle %>% 
  filter(grepl("ROBBERY", Crime.Subcategory)) %>% 
  count() %>% 
  pull()

chi_robbery <- chicago %>% 
  filter(grepl("ROBBERY",Primary.Type)) %>% 
  count() %>% 
  pull()

# 2008-2009 Summary of Property Crime #################################################################################### 

sea_robbery_2008 <- seattle_2008 %>% 
  filter(grepl("ROBBERY", Crime.Subcategory)) %>% 
  count() %>% 
  pull()

chi_robbery_2008 <- chicago_2008 %>% 
  filter(grepl("ROBBERY", Primary.Type)) %>% 
  count() %>% 
  pull()

data = chicago_2008 %>% 
  group_by(Primary.Type) %>% 
  count()
# Robbery Question Summary Analysis#################################################################################### 

change_in_chi_robberies <- chi_robbery - chi_robbery_2008 # Chicago had -7275 robberies in 2018-19 than in 2008-09
change_in_sea_robberies <- sea_robbery - sea_robbery_2008 # Seattle had 105 more robberies in 2018-19 than in 2008-09

chi_percent_change <- paste0(round((chi_robbery / chi_robbery_2008) * 100), "%")
sea_percent_change <- paste0(round((sea_robbery /sea_robbery_2008) * 100), "%")


robbery_results <- data.frame("City" = c("Seattle", "Chicago"),
                      "Robberies_in_08_09" = c(sea_robbery, chi_robbery_2008),
                      "Robberies_in_18_19" = c(sea_robbery_2008, chi_robbery),
                      "Reduction_in_Robberies" = c(change_in_sea_robberies, change_in_chi_robberies),
                      "Percent Change" = c(sea_percent_change, chi_percent_change))

colnames(robbery_results)[colnames(robbery_results) == "Robberies_in_08_09"] <- "Robberies in 2008-2009"
colnames(robbery_results)[colnames(robbery_results) == "Robberies_in_18_19"] <- "Robberies in 2018-2019"
colnames(robbery_results)[colnames(robbery_results) == "Reduction_in_Robberies"] <- "Change_in_Robberies"

robbery_crimes <- 

summary(chicago)
  
graph_of_change_in_robberies <- ggplot(data = robbery_results) +
  geom_col(mapping = aes(x = City, y = Change_in_Robberies, fill = City))+
  labs(title = "Reduction in Robberies Years 2018-2019 vs. 2008-2009",
       x = "City",
       y = "Change in Robberies")

############################################################################################################
