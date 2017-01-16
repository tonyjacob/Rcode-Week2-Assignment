# Part 2
# 
# Write a function that reads a directory full of files and reports the number of 
# completely observed cases in each data file. The function should return a data frame 
# where the first column is the name of the file and the second column is the number of 
# complete cases.

complete <- function(directory, id = 1:332){
        
        all_files <- list.files(directory, full.names = TRUE) #creating a list of all required files to process
        completeCount <- data.frame() #initializing data frame to be returned
        
        #Build completeCount data frame
        for(i in id){
                temp_data <- read.csv(all_files[i])
                temp_data <- na.omit(temp_data) #returns new data frame after omiting records containing NA
                idandNobs <- c(i, nrow(temp_data))
                completeCount <- rbind(completeCount, idandNobs)
        }
        
        colnames(completeCount) <- c("id", "nobs")
        completeCount
}