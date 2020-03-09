library(dplyr)
library(tidyr)
library(ggplot2)
library(leaflet)

# Data for Robberies including Full dataset
chicago_full <- read.csv("data/Full_Crimes_Chicago_Working.csv", stringsAsFactors = FALSE)
seattle <- read.csv("data/Crime_Seattle_Data.csv", stringsAsFactors = FALSE)

chicago_2008 <- read.csv("data/Crimes_Chicago_2008_2009.csv", stringsAsFactors = FALSE)
seattle_2008 <- read.csv("data/Crime_Seattle_2008_2009.csv", stringsAsFactors = FALSE)

# Data for smaller Chicago Dataset
chicago <- read.csv("data/Crimes_Chicago_Working.csv", stringsAsFactors = FALSE)



##########################################################################################

seattle_renamed_columns <- seattle      # Creating new df and renaming columns for Summary table
colnames(seattle_renamed_columns)[colnames(seattle_renamed_columns) == "Crime.Subcategory"] <- "Primary.Type"
colnames(seattle_renamed_columns)[colnames(seattle_renamed_columns) == "Primary.Offense.Description"] <- "Description"
colnames(seattle_renamed_columns)[colnames(seattle_renamed_columns) == "Neighborhood"] <- "Location.Description"
colnames(seattle_renamed_columns)[colnames(seattle_renamed_columns) == "Occurred.Date"] <- "Date"

sea_summary <- seattle_renamed_columns %>%        # Creating summary tables with head of table
  select(Date,Primary.Type, Description, Location.Description, Precinct) %>% 
  head(5)

chi_summary <- chicago_full %>%                       # Creating summary tables with head of table
  select(Date, Primary.Type, Description, Location.Description, IUCR) %>% 
  head(5)

# 2018-2019 Summary of Property Crime #################################################################################### 

sea_robbery <- seattle_full %>% 
  filter(grepl("ROBBERY", Crime.Subcategory)) %>% 
  count() %>% 
  pull()

chi_robbery <- chicago_full %>% 
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

chicago_summary_analysis <- chicago_2008 %>% 
  group_by(Primary.Type) %>% 
  count()

seattle_summary_analysis <- seattle_2008 %>% 
  group_by(Crime.Subcategory) %>% 
  count()


# Robbery Question Summary Analysis#################################################################################### 
=======
library("dplyr")
<<<<<<< HEAD
library("tidyr")
library("ggplot2")
library("ggmap")
library("leaflet")

# load the csv file into R

chicago <- read.csv("data/Crimes_Chicago_Working.csv", stringsAsFactors = FALSE)

# AVG time of theft 
# Chicago
# What location has the most domestic violence occur,involving property
# theft(Robbery, Arson, Burglary)?

# What locations have the highest chance of a crime occuring?

# Whys this question beneficial for others to know?
# This Question is beneficial to others because it provides insight to other
# individuals, families, and businesses of the type of crimes in which to be 
# aware of. 

# You might encounter something but mention why it was interesting you have
# came across this

chicago_theft <- chicago %>%
  filter(Primary.Type == "THEFT" || Primary.Type == "MOTOR VEHICLE THEFT" ) 

# Include is.na to remove the locations that are unknown
# encountered that there were more locations that were unknown that had the
# most crimes occur than the known locations however I filtered the data frame
# in order for it to not include locations that are unknown. 

chicago_remove_na <- chicago %>% filter_all(all_vars(!is.na(.))) 

# creates a new data frame with the Location, Longitude, Latitude, and 
# Description. counts the number of times a variable shows up
# arranges by count.
most_crime_location <- chicago_remove_na %>%
  group_by(Location, Longitude, Latitude, Description) %>%
  summarise(count = n()) %>%
  arrange(-count)

# Slices the first five rows in the most crime location data frame 
first_5_most_crime_location <- most_crime_location[1:5, ]

# The tiles are created by "CartoDB.Positron
# setView allows for the positioning of the US geographical features to be set
# in chicago where it zooms in to capture all 5 most common areas in Chicago
# for crime.
map_5_most_crime <- leaflet(data = chicago_remove_na) %>% 
  addProviderTiles("CartoDB.Positron") %>% 
  setView(lng = -87.627876698, lat = 41.883500187, zoom = 11.2) %>% 
  addCircles(
    lat = ~ Latitude,
    lng = ~ Longitude,
    stroke = FALSE,
    popup = ~ Description
  ) %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng = first_5_most_crime_location$Longitude, 
             lat = first_5_most_crime_location$Latitude, 
             label = first_5_most_crime_location$count)

map_5_most_crime


#summary(most_crime_location$count)
#geom_boxplot(1.000, 1.000, 1.0000, 29.000, 1.000)

# It appears that the most violent areas in Chicago  are primarily within, 
# a couple blocks away from each other.The plot represents the number of crimes
# that have been reported in that given area  This data is important for those 
# whom are planning to visit chicago or move to chicago and plan to have a safe
# trip being unharmed.



=======
library("ggplot2")

#Seattle crime rates 2018-2019
seattle_crime <- read.csv("data/Crime_Seattle_Full.csv", stringsAsFactors = FALSE)
View(seattle_crime)

#What quarter of the year sees the most crime in Seattle? (Quarters: Jan-Mar, Apr-Jun, Jul-Sep, Oct-Dec)

seattle_crime$Occurred.Date <- as.Date(seattle_crime$Occurred.Date, "%m/%d/%Y")
seattle_crime <- seattle_crime %>% arrange(Occurred.Date)

# each quarter as own data frame

#2018 Quarter data frames
seattle_crime <- seattle_crime %>% 
  mutate(yearmonth = substr(Occurred.Date, 0, 7))
quarter <- function(yearmonth) {
  if(is.na(yearmonth)) {
    return("None")
  }
   if(yearmonth == "2018-01" | yearmonth == "2018-02" | yearmonth == "2018-03"){
    return("Q1_2018")
  }
  else if(yearmonth == "2018-04" | yearmonth == "2018-05" | yearmonth == "2018-06"){
    return("Q2_2018")
  }
  else if(yearmonth == "2018-07" | yearmonth == "2018-08" | yearmonth == "2018-09"){
    return("Q3_2018")
  }
  else if(yearmonth == "2018-10" | yearmonth == "2018-11" | yearmonth == "2018-12"){
    return("Q4_2018")
  }
   else if(yearmonth == "2019-01" | yearmonth == "2019-02" | yearmonth == "2019-03"){
      return("Q1_2019")
  }
  else if(yearmonth == "2019-04" | yearmonth == "2019-05" | yearmonth == "2019-06"){
      return("Q2_2019")
    }
    else if(yearmonth == "2019-07" | yearmonth == "2019-08" | yearmonth == "2019-09"){
      return("Q3_2019")
    }
    else if(yearmonth == "2019-10" | yearmonth == "2019-11" | yearmonth == "2019-12"){
      return("Q4_2019")
    }
    else{
      return("None") 
    }
  }

#sapply returns a string
seattle_crime$quarter <- sapply(seattle_crime$yearmonth, quarter)

quarters_total <- seattle_crime %>% 
  group_by(quarter) %>% 
  summarize(Crime_Count = n()) 
View(quarters_total)


crimes_committed_plot <- ggplot(data = quarters_total, mapping = aes(quarter, Crime_Count)) +
  geom_col() +
  scale_color_brewer(palette = "Dark2") +
  labs(title = "Crimes Committed Per Quarter Year (2018-2019) in Seattle") 
print(crimes_committed_plot)
>>>>>>> d50d1c7ae5c883dd69a0d39c48860dfe0ef43165

change_in_chi_robberies <- chi_robbery - chi_robbery_2008 # Chicago had -7275 robberies in 2018-19 than in 2008-09
change_in_sea_robberies <- sea_robbery - sea_robbery_2008 # Seattle had 105 more robberies in 2018-19 than in 2008-09

<<<<<<< HEAD
chi_percent_change <- paste0(round((chi_robbery / chi_robbery_2008) * 100), "%")
sea_percent_change <- paste0(round((sea_robbery /sea_robbery_2008) * 100), "%")


robbery_results <- data.frame("City" = c("Seattle", "Chicago"),
                              "Robberies_in_08_09" = c(sea_robbery_2008, chi_robbery_2008),
                              "Robberies_in_18_19" = c(sea_robbery, chi_robbery),
                              "Reduction_in_Robberies" = c(change_in_sea_robberies, change_in_chi_robberies),
                              "Percent Change" = c(sea_percent_change, chi_percent_change))

colnames(robbery_results)[colnames(robbery_results) == "Robberies_in_08_09"] <- "Robberies in 2008-2009"
colnames(robbery_results)[colnames(robbery_results) == "Robberies_in_18_19"] <- "Robberies in 2018-2019"
colnames(robbery_results)[colnames(robbery_results) == "Reduction_in_Robberies"] <- "Change_in_Robberies"

graph_of_change_in_robberies <- ggplot(data = robbery_results) +
  geom_col(mapping = aes(x = City, y = Change_in_Robberies, fill = City))+
  labs(title = "Reduction in Robberies Years 2018-2019 vs. 2008-2009",
       x = "City",
       y = "Change in Robberies")

<<<<<<< HEAD
############################################################################################################

nrow(seattle)

#use group by to group the seattle data frame by neighborhoods
hoods_tibble <- group_by(seattle,Neighborhood)

#make a frame of 
hood_frame <- hoods_tibble %>% 
  summarize(
    freq_of_crime = n())

#View(hood_frame)

hood_frame %>% 
  filter(freq_of_crime == max(freq_of_crime))

#rename subcats for ease
seattle$Crime.Subcategory[grepl("THEFT", seattle$Crime.Subcategory)] <- "THEFT"

seattle$Crime.Subcategory[grepl("ARSON", seattle$Crime.Subcategory)] <- "ARSON"

seattle$Crime.Subcategory[grepl("BURGLARY", seattle$Crime.Subcategory)] <- "BURGLARY"

seattle$Crime.Subcategory[grepl("ROBBERY", seattle$Crime.Subcategory)] <- "ROBBERY"

#group by crime and neighborhood 
neighborhood_group <- group_by(seattle,Crime.Subcategory,Neighborhood) %>% summarize(quantity_of_crime = n()) %>% as.data.frame()

#shorten name is chinatown/Intl District for visual 
neighborhood_group$Neighborhood[grepl("CHINATOWN/INTERNATIONAL DISTRICT", neighborhood_group$Neighborhood)] <- "INTL. DISTRICT"

neighborhood_group$Neighborhood[grepl("CENTRAL AREA/SQUIRE PARK", neighborhood_group$Neighborhood)] <- "SQUIRE PARK"

neighborhood_group$Neighborhood[grepl("DOWNTOWN COMMERCIAL", neighborhood_group$Neighborhood)] <- "DOWNTOWN"

neighborhood_group$Neighborhood[grepl("ROOSEVELT/RAVENNA", neighborhood_group$Neighborhood)] <- "RAVENNA"

#arrange df by the heighest quanity of crimes 
neighborhood_group <- arrange(neighborhood_group,-quantity_of_crime,Neighborhood)

#Create four seperate data frames of the top 10 neighborhood for each crime 
arson_freq_df <- filter(neighborhood_group,Crime.Subcategory == "ARSON") %>% 
  head(10)

theft_freq_df <- filter(neighborhood_group,Crime.Subcategory == "THEFT") %>% 
  head(10)

robbery_freq_df <- filter(neighborhood_group,Crime.Subcategory == "ROBBERY") %>% 
  head(10)

burglary_freq_df <- filter(neighborhood_group,Crime.Subcategory == "BURGLARY") %>% 
  head(10)

#filter data for quantiative analysis 
most_crime_df <- filter(neighborhood_group,quantity_of_crime %in% c("2560","813", "356", "11")) %>% 
  filter(Neighborhood %in% c("DOWNTOWN","QUEEN ANNE","SLU/CASCADE"))

#get mean for each crime per neighborhood 

mean(neighborhood_group$quantity_of_crime)
median(neighborhood_group$quantity_of_crime)

arson_stats <- filter(neighborhood_group,Crime.Subcategory == "ARSON")
mean(arson_stats$quantity_of_crime)
median(arson_stats$quantity_of_crime)

theft_stats <- filter(neighborhood_group,Crime.Subcategory == "THEFT")
mean(theft_stats$quantity_of_crime)
median(theft_stats$quantity_of_crime)

robbery_stats <- filter(neighborhood_group,Crime.Subcategory == "ROBBERY")
mean(robbery_stats$quantity_of_crime)
median(robbery_stats$quantity_of_crime)

burglary_stats <- filter(neighborhood_group,Crime.Subcategory == "BURGLARY")
mean(burglary_stats$quantity_of_crime)
median(burglary_stats$quantity_of_crime)

##################################arson plot####################################################
arson_plot <- ggplot(data = arson_freq_df, mapping = aes(x = reorder(Neighborhood,quantity_of_crime), y = quantity_of_crime, fill = "orangered1")) +
  geom_col() +
  facet_wrap(~Crime.Subcategory)+
  labs(x = "Neighborhood", y = "Quantity of Crimes") +
  theme(legend.position = "none",axis.text.x = element_text(angle = 90, hjust = 1))

#######################################theft plot###############################################

theft_plot <- ggplot(data = theft_freq_df, mapping = aes(x = reorder(Neighborhood,quantity_of_crime), y = quantity_of_crime)) +
  geom_col(fill = "seagreen4") +
  facet_wrap(~Crime.Subcategory) +
  labs(x = "Neighborhood", y = "Quantity of Crimes") +
  theme(legend.position = "none", axis.text.x = element_text(angle = 90, hjust = 1)) 

###########################################burglary##############################################

burglary_plot <- ggplot(data = burglary_freq_df, mapping = aes(x = reorder(Neighborhood,quantity_of_crime), y = quantity_of_crime)) +
  geom_col(fill = "orange2") +
  facet_wrap(~Crime.Subcategory) +
  labs(x = "Neighborhood", y = "Quantity of Crimes") +
  theme(legend.position = "none", axis.text.x = element_text(angle = 90, hjust = 1))

############################################robbery############################################
robbery_plot <- ggplot(data = robbery_freq_df, mapping = aes(x = reorder(Neighborhood,quantity_of_crime), y = quantity_of_crime)) +
  geom_col(fill = "blue4") +
  facet_wrap(~Crime.Subcategory) +
  labs(x = "Neighborhood", y = "Quantity of Crimes") +
  theme(legend.position = "none", axis.text.x = element_text(angle = 90, hjust = 1))

#put all of the seperate graphs in one grid


=======
>>>>>>> d50d1c7ae5c883dd69a0d39c48860dfe0ef43165

#determine which crime happens most in which neighborhood 
arson_frequency <- filter(neighborhood_group, Crime.Subcategory == "ARSON") %>% filter(quantity_of_crime == max(quantity_of_crime))

burg_frequency <-filter(neighborhood_group, Crime.Subcategory == "BURGLARY") %>% filter(quantity_of_crime == max(quantity_of_crime))

rob_frequency <- filter(neighborhood_group, Crime.Subcategory == "ROBBERY") %>% filter(quantity_of_crime == max(quantity_of_crime))

theft_frequency <- filter(neighborhood_group, Crime.Subcategory == "THEFT") %>% filter(quantity_of_crime == max(quantity_of_crime))

<<<<<<< HEAD
=======
            
>>>>>>> f0c9230847ee11384b34e0981c2014e7c1f36686
>>>>>>> d50d1c7ae5c883dd69a0d39c48860dfe0ef43165
=======
>>>>>>> Abel_code
