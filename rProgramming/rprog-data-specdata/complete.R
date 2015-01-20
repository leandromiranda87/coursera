complete <- function(directory, id = 1:332) {
    
    setwd("C:/Users/Carol e Le/Desktop/coursera/rProgramming/rprog-data-specdata")
    data_dir <- getwd()
    
    files_list <- list.files(directory, full.names=TRUE)
    files_list <- files_list[id]
    nobs_list <- vector()
    
    
    for (i in seq_along(files_list)) {
        dataset <- read.csv(paste(data_dir, files_list[[i]], sep="/"))
        naR <- na.omit(dataset)
        nobs_list <- c(nobs_list, nrow(naR))
    }
    
    data <- data.frame(id = id, nobs = nobs_list)
    data
}