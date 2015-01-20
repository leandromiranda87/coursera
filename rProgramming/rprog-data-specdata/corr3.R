corr <- function(directory, threshold = 0) {
    
    setwd("C:/Users/Carol e Le/Desktop/coursera/rProgramming/rprog-data-specdata")
    data_dir <- getwd()
    
    files_list <- list.files(directory, full.names=TRUE)
    
    cor <- vector()
    
    for( i in 1:332 ){
    
        a <- sum(complete.cases(read.csv(all[i])))
        
        if(nrow(a) > threshold){
            cor <- c(cor, i)
        }
            
    }
    return(cor)

}