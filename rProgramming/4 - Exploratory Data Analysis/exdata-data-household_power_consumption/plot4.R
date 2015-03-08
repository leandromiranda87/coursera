#read the data
source("load_data.R")

#plot the data
png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
par(mfrow = c(2, 2))
## Top-left
plot(epcsubdata$DateTime, epcsubdata$Global_active_power, 
     type = "l",
     xlab = "", ylab = "Global Active Power")
## Top-right
plot(epcsubdata$DateTime, epcsubdata$Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")
## Bottom-left
plot(epcsubdata$DateTime, epcsubdata$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(epcsubdata$DateTime, epcsubdata$Sub_metering_2, col = "red")
lines(epcsubdata$DateTime, epcsubdata$Sub_metering_3, col = "blue")
# Remove the border of legend here.
legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
## Bottom-right
plot(epcsubdata$DateTime, epcsubdata$Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = colnames(epcsubdata$newData)[4])
dev.off()