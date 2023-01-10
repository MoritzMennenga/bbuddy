.libPaths("D:\\owncloud\\Documents\\R_Pakete\\r")
setwd("D:\\buddy\\bbuddy")
pacman::p_load(shiny, leaflet,leaflet.extras, stringr)

#Autodownload data
#dataset_source <- read.csv2("www\\datasets.csv",stringsAsFactors=FALSE)
#dataset <- data.frame(anonymized_latitude= double(),
#                      anonymized_longitude = double(),
#                      timestamp = character(),
#                      species_name = character(),
#                      stringsAsFactors=FALSE)

#for (i in seq(nrow(dataset_source))){
#  #download data
#  new_data <-read.csv(dataset_source$url[i])
#  rbind(dataset,new_data)
#}

file_name <- c("www//all_metadata_december.csv")
#header = read.csv(file_name, header = F, nrows = 1, as.is = T, stringsAsFactors = FALSE)
dataset = read.csv(file_name, header = T, stringsAsFactors = FALSE)
#colnames(dataset)= header

#Timestamp to date only
dataset$timestamp <- gsub(" .+$", "", dataset$timestamp)

#get min and max date
dates_uni <- sort(unique(dataset$timestamp))
mindate <- dates_uni[1] 
maxdate <- dates_uni[length(dates_uni)] 

#get speciesnames
species_names <- sort(unique(dataset$species_name))



