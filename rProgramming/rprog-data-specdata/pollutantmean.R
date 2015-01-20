pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    setwd("C:/Users/Carol e Le/Desktop/coursera/rProgramming/rprog-data-specdata")
    data_dir <- getwd()
    
    list <- list.files(directory, full.names = TRUE) 
    list <- list[id]
    data <- data.frame()
    
    for( i in seq_along(list) ){
        
        data <- rbind(data, read.csv(paste(data_dir, list[[i]], sep="/")))
    
    }
    
    dat_sub <- data[which(data [ ,"ID"] %in% id),]
    pMean <- mean(dat_sub[, pollutant], na.rm = TRUE)
    return (pMean)
}