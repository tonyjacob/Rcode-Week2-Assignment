# Part 3
# 
# Write a function that takes a directory of data files and a threshold for complete 
# cases and calculates the correlation between sulfate and nitrate for monitor locations 
# where the number of completely observed cases (on all variables) is greater than the 
# threshold. The function should return a vector of correlations for the monitors that 
# meet the threshold requirement. If no monitors meet the threshold requirement, then 
# the function should return a numeric vector of length 0.

corr <- function(directory, threshold = 0){
        
        #Build a list of all files available in directory and initiate threshCor vector with NULL
        all_files <- list.files(directory, full.names = TRUE)
        threshCor <- NULL
        
        #Read all files and check if complete cases meet threshold.
        #If met, then store cor values iteratively into threshCor, and finaly return vector
        for(i in 1:332){
                temp_data <- read.csv(all_files[i])
                temp_data <- na.omit(temp_data) #returns new data frame after omiting records containing NA
                if(nrow(temp_data) > threshold){
                        threshCor <- c(threshCor, cor(temp_data[, "sulfate"], temp_data[, "nitrate"]))
                }
        }
        threshCor
}