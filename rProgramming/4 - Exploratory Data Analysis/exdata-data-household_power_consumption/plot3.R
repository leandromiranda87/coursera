#read the data
source("load_data.R")

#plot the data
png(filename = "plot3.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
plot(epcsubdata$DateTime, epcsubdata$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(epcsubdata$DateTime, epcsubdata$Sub_metering_2, col = "red")
lines(epcsubdata$DateTime, epcsubdata$Sub_metering_3, col = "blue")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.off()