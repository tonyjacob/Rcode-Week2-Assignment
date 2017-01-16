# Part 1
# 
# Write a function named 'pollutantmean' that calculates the mean of a pollutant 
# (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' 
# takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor 
# ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the 
# directory specified in the 'directory' argument and returns the mean of the pollutant 
# across all of the monitors, ignoring any missing values coded as NA.

pollutantmean <- function(directory, pollutant, id = 1:332){
        
        all_files <- list.files(directory, full.names = TRUE) #creating a list of all required files to process
        full_data <- data.frame() #initializing data frame
        
        for(i in id){
                full_data <- rbind(full_data, read.csv(all_files[i])) #builds data frame iteratively
        }
        
        mean(full_data[, pollutant], na.rm = TRUE) #computes mean after removing records with NA
}
