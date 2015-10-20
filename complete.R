complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases

  ## Set directory
  dir <- setwd("C:/GIM_JB/Coursera/RProgramming/Assignments")
  dir <- paste(dir, directory, sep = "/")
  
  ## Selection of files to be pasted together
  filelist <- list.files(dir)
  id <- as.vector(id)
  
  
  ## Creating the data set to be evaluated ("working_data")
  for (i in id) {
    
    files <- filelist[i]
    
    ## Setting the local directory to file
    locdir <- paste(dir, filelist[i], sep = "/")
    
    working_data <- read.table(locdir, header = TRUE, sep = ",")
    
    ## If the merged dataset does not already exist, create it
    if (!exists("df", inherits = FALSE)) {
      df <- data.frame(id = i, nobs = nrow(na.omit(working_data)))
    }
    ## If the merged dataset already exists, append to it 
    else {
      df_temp <- data.frame(id = i, nobs = nrow(na.omit(working_data)))
      df <- rbind(df, df_temp)
      rm(df_temp)
    }
    rm(working_data)
  }
  return(df)
  rm(df)
}


