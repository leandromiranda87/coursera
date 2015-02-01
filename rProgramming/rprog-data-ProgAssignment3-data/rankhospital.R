rankhospital <- function(state, outcome, num = "best") {
    
    ## Read outcome data
    setwd("C:/Users/Carol e Le/Desktop/coursera/rProgramming/rprog-data-ProgAssignment3-data")
    data_dir <- getwd()
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", header = TRUE, na.strings="Not Available")
    
    uniqueState <- unique( data[, "State"] )
    
    ## Check that state and outcome are valid
    if (is.na(match(state, uniqueState))){
        stop("invalid state")
    }
    
    if (outcome != "heart attack" && outcome != "heart failure" && outcome != "pneumonia") {
        stop("invalid outcome")
    }
    
    ## Set the subData using the state`s data
    subData <- data[which(data$State == state),]
    subData <- (subset(x = subData, select = c(2, 7, 11, 17, 23)))
    
    colnames(subData)<- c("hospital name","State","heart attack","heart failure","pneumonia")
    
    subData <- subset(subData, select = c("hospital name", "State", outcome))
    subData <- na.omit(subData)
    
    orderedData <- subData[order(as.double(subData[,3]),subData[,1]),]
    
    rankedData <- cbind(orderedData, c(1:nrow(x = orderedData)))
    
    colnames(rankedData)[4] <- "rank"
    
    if (num == "best"){
        num <- 1
    } else if (num == "worst"){
        num <- nrow(rankedData)
    }
    
    if (num > nrow(subData)){
        return(NA)
    }
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    as.character(subset(rankedData[1], rankedData[,"rank"] == num))
}
