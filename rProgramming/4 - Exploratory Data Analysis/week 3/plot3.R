setwd("C:/Users/Carol e Le/Desktop/coursera/coursera/rProgramming/4 - Exploratory Data Analysis/week 3")
# Load the data.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
baltimoreNEI <- subset(NEI, fips == "24510") 
pd <- aggregate(baltimoreNEI[c("Emissions")], list(type = baltimoreNEI$type, year = baltimoreNEI$year), sum)

#  Create Plot
png('plot3.png', width=480, height=480)
p <- ggplot(pd, aes(x=year, y=Emissions, colour=type)) +
    geom_point(alpha=.3) +
    geom_smooth(alpha=.2, size=1, method="loess") +
    ggtitle("Total Emissions by Type in Baltimore City")

print(p)

dev.off()