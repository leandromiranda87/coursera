complete <- function(directory, id = 1:332) {
    
    setwd("C:/Users/Carol e Le/Desktop/coursera/rProgramming/rprog-data-specdata")
    data_dir <- getwd()
    
    list <- list.files(directory, full.names = TRUE) 
    list <- list[id]
    data <- data.frame()
    result <- data.frame()
    
    for( i in seq_along(list) ){
        
        sub <- subset(file1, file1$ID %in% id)
        com <-sub[complete.cases(sub),]
        nobs <- sum(complete.cases(file1[,3:4]))
        data <- cbind(id[i], nobs[i])
        
    }
    names(data) <- c("id", "nobs")
    return(data)
    
}