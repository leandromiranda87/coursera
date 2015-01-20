corr <- function(directory, threshold = 0) {
    
    setwd("C:/Users/Carol e Le/Desktop/coursera/rProgramming/rprog-data-specdata")
    data_dir <- getwd()
    
    f_name <- list.files(directory, full.names=TRUE)
    ##f_name <- list.files(paste(data_dir, directory, sep="/"), full.names=TRUE)
    
    cor <- vector()
    newCor <- vector()
    
    for( i in seq_along( f_name ) ){
        cor <- rbind(cor, read.csv(f_name[i], header=TRUE))
        good <- complete.cases(cor)
        
        x <- f_name[good][2]
        y <- f_name[good][3]
        newCor <- c(newCor, cor(x,y))
    }
    return(newCor)
}