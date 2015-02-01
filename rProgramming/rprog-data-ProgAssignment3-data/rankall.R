rankall <- function(outcome, num = "best") {
    
    ## Read outcome data
    setwd("C:/Users/Carol e Le/Desktop/coursera/rProgramming/rprog-data-ProgAssignment3-data")
    data_dir <- getwd()
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", header = TRUE, na.strings="Not Available")
    
    uniqueState <- unique( data[, "State"] )
    
    if (outcome != "heart attack" && outcome != "heart failure" && outcome != "pneumonia") {
        stop("invalid outcome")
    }
    
    subData <- (subset(x = data, select = c(2, 7, 11, 17, 23)))
    
    colnames(subData)<- c("hospital name","State","heart attack","heart failure","pneumonia")
    
    subData <- subset(subData, select = c("hospital name", "State", outcome))
    subData <- na.omit(subData)
    
    #dataState <- subData[which(subData$State == i),]
    #orderedState <- dataState[order(as.double(dataState[,3]),dataState[,1]),]
    rankedData <- data.frame()
    
    ## For each state, find the hospital of the given rank
    for( i in uniqueState ){
        dataState <- subData[which(subData$State == i),]
        orderedState <- dataState[order(as.double(dataState[,3]),dataState[,1]),]
        rankedState <- cbind(orderedState, c(1:nrow(x = orderedState)))
        rankedData <- rbind(rankedData, rankedState)
    }
    
    colnames(rankedData)[4] <- "rank"
    returnData <- data.frame()
    
    for( j in uniqueState ){
        
        if (num == "best"){
            num2 <- 1
        } else if (num == "worst"){
            num2 <- nrow(rankedData[which(rankedData$State == j),])
        }else{
            num2 <- num
        }
        
        #positionData <- cbind(subset( rankedData, rankedData[, "rank"] == num2 & rankedData[, "State"] == j, select = "hospital name" ), j)
        
        numberRow <- nrow(subset( rankedData, rankedData[, "rank"] == num2 & rankedData[, "State"] == j, select = "hospital name" ))
        
        if( numberRow == 0 ){
            positionData <- cbind(NA, j)
        }else{
            positionData <- cbind(subset( rankedData, rankedData[, "rank"] == num2 & rankedData[, "State"] == j, select = "hospital name" ), j)
        }
        
        colnames(positionData) <- c("hospital", "state")
        
        returnData <- rbind( returnData, positionData)
        
        colnames(returnData) <- c("hospital", "state")
        
    }
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    returnData[order(returnData[,2]),]
}