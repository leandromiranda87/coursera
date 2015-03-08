##set the working directory
setwd("C:/Users/Carol e Le/Desktop/coursera/rProgramming/4 - Exploratory Data Analysis/exdata-data-household_power_consumption")

#get the file name
#filename <- list.files()
#or
filename <- "household_power_consumption.txt"

#read the text file
epcdata <- read.table(filename, header = TRUE, sep = ";",
                      colClasses = c("character", "character", rep("numeric",7)),
                      na = "?")

subset <- subset(epcdata, Date == "1/2/2007" | Date == "2/2/2007" )

#select sub-data
epcsubdata <- subset(epcdata, Date == "1/2/2007" | Date == "2/2/2007" )

#saving ram
remove(epcdata)

#dateTime column
x <- paste(epcsubdata$Date, epcsubdata$Time)
epcsubdata$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(epcsubdata) <- 1:nrow(epcsubdata)

#saving ram
remove(x)