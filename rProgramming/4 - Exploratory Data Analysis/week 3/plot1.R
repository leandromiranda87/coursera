setwd("C:/Users/Carol e Le/Desktop/coursera/coursera/rProgramming/4 - Exploratory Data Analysis/week 3")
# Load the data.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Create the aggregate data by sum the total emission by year
aggTotals <- aggregate(Emissions ~ year,NEI, sum)

png("plot1.png",width=480,height=480,units="px",bg="transparent")

barplot(
    (aggTotals$Emissions)/10^6,
    names.arg=aggTotals$year,
    xlab="Year",
    ylab="PM2.5 Emissions (10^6 Tons)",
    main="Total PM2.5 Emissions From All US Sources"
)

dev.off()