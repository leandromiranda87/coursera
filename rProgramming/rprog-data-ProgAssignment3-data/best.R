best <- function(state, outcome) {
    
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
    
    subData <- subset(subData, subData[,outcome] == min(subData[, outcome]))
    
    #hospitalList <- sort( subset(x = subData, select = "hospital name"), decreasing = FALSE )
    hospitalList <- suppressWarnings(subData[order(as.double(subData[,1])),])
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    as.character(hospitalList[1,1])
}