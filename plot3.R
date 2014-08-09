## EDA - Assignment 1 

## Read, subset data and change DateTime format

data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings =  '?', colClasses=c("character", "character", "numeric","numeric", "numeric", "numeric","numeric", "numeric", "numeric"))

subsetdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

subsetdata$DateTime <- strptime(paste(subsetdata$Date, subsetdata$Time), format="%d/%m/%Y %H:%M:%S", tz="UTC")

## Plot 3

dev.copy(png, 'plot3.png', height = 480, width = 480)
plot(subsetdata$DateTime, subsetdata$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(subsetdata$DateTime, subsetdata$Sub_metering_2, col = "red")
lines(subsetdata$DateTime, subsetdata$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col =c("black", "red", "blue"), c("Sub_metering_1 ", "Sub_metering_2", "Sub_metering_3"))
dev.off()
