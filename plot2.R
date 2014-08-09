## EDA - Assignment 1 

## Read, subset data and change DateTime format

data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings =  '?', colClasses=c("character", "character", "numeric","numeric", "numeric", "numeric","numeric", "numeric", "numeric"))

subsetdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

subsetdata$DateTime <- strptime(paste(subsetdata$Date, subsetdata$Time), format="%d/%m/%Y %H:%M:%S", tz="UTC")

## Plot 2

dev.copy(png, 'plot2.png', height = 480, width = 480)
plot(subsetdata$DateTime, subsetdata$Global_active_power, type ="l", col = "black", xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()
