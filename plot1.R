## EDA - Assignment 1 

## Read, subset data and change DateTime format

data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings =  '?', colClasses=c("character", "character", "numeric","numeric", "numeric", "numeric","numeric", "numeric", "numeric"))

subsetdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

subsetdata$Date <- as.Date(subsetdata$Date, format="%Y-%m-%d")
subsetdata$Time <- strptime(subsetdata$Time, format="%H:%M:%S")


## Plot1 

dev.copy(png, 'plot1.png', height = 480, width = 480)
hist(subsetdata$Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)',main = 'Global Active Power')
dev.off()

