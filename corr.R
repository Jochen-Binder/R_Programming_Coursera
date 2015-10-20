corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!

  ## Set directory
  dir0 <- setwd("C:/GIM_JB/Coursera/RProgramming/Assignments")
  dir <- paste(dir0, directory, sep = "/")
  source("complete.R")
  
  ## Selection of id's of the files to be pasted together
  nobs <- complete(directory)
  id <- nobs[1][nobs[,2] > threshold, ]
  
  ## Selection of files to be pastet together
  filelist <- list.files(dir)
  id <- as.vector(id)
  files <- filelist[id]
  
  results <- c()
  
  
  ## Creating the data set to be evaluated ("working_data")
  for (i in files) {
    
    ## Setting the local directory to file
    locdir <- paste(dir, i, sep = "/")
    
    working_data <- read.table(locdir, header = TRUE, sep = ",")

    
    rm(locdir)
    correlation <- cor(working_data[2], working_data[3], use = "complete.obs")
    results <- c(results, correlation)
    rm(working_data)
  }
  return(results)
  rm(results)
}