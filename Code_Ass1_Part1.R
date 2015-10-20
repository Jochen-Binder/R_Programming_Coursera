pollutantmean <- function(directory, pollutant, id = 1) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!

  ## Set directory
  dir <- setwd("C:/GIM_JB/Coursera/RProgramming/Assignments")
  dir <- paste(dir, directory, sep = "/")
  
  ## Selection of files to be pastet together
  filelist <- list.files(dir)
  id <- as.vector(id)
  files <- filelist[id]
  
  ## Creating the data set to be evaluated ("working_data")
  for (i in files) {
    
    ## Setting the local directory to file
    locdir <- paste(dir, i, sep = "/")
    
    ## If the merged dataset does not already exist, create it
    if (!exists("working_data")) {
      working_data <- read.table(locdir, header = TRUE, sep = ",")
    }
    ## If the merged dataset already exists, append to it 
    else {
      working_data_temp <- read.table(locdir, header = TRUE, sep = ",")
      working_data <- rbind(working_data, working_data_temp)
      rm(working_data_temp)
    }
    
    rm(locdir)
  }
  
  result <- mean(working_data[, pollutant], na.rm = TRUE)
  print(result)
  
  rm(result)
}