## EDA - Assignment 1 

## Read, subset data and change DateTime format

data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings =  '?', colClasses=c("character", "character", "numeric","numeric", "numeric", "numeric","numeric", "numeric", "numeric"))

subsetdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

subsetdata$DateTime <- strptime(paste(subsetdata$Date, subsetdata$Time), format="%d/%m/%Y %H:%M:%S", tz="UTC")

## Plot 4

dev.copy(png, 'plot4.png', height = 480, width = 480)

par(mfrow= c(2,2))

## Graph 1
plot(subsetdata$DateTime, subsetdata$Global_active_power, type ="l", col = "black", xlab = "", ylab = "Global Active Power")

## Graph 2
plot(subsetdata$DateTime, subsetdata$Voltage, type ="l", col = "black", xlab ="datetime", ylab = "Voltage")

## Graph 3
plot(subsetdata$DateTime, subsetdata$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(subsetdata$DateTime, subsetdata$Sub_metering_2, col = "red")
lines(subsetdata$DateTime, subsetdata$Sub_metering_3, col = "blue")
legend("topright", bty = "n", lty=1, lwd=1, col =c("black", "red", "blue"), c("Sub_metering_1 ", "Sub_metering_2", "Sub_metering_3"))


## Graph 4

plot(subsetdata$DateTime, subsetdata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()