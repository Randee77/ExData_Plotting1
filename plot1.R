
## set directory
setwd("D:/Coursera/Exploratory Data Analysis/Exercise/Course Project 1")
getwd()

## load and convert data
source.data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character","character","character","character","character","character","character","character","character"), na.strings='?')
source.data1 <- transform(source.data, Date=as.Date(Date, format="%d/%m/%Y"), 
                          Global_active_power=as.numeric(Global_active_power),
                          Global_reactive_power=as.numeric(Global_reactive_power),
                          Voltage=as.numeric(Voltage),
                          Global_intensity=as.numeric(Global_intensity),
                          Sub_metering_1=as.numeric(Sub_metering_1),
                          Sub_metering_2=as.numeric(Sub_metering_2),
                          Sub_metering_3=as.numeric(Sub_metering_3)
)
source.data2 <- source.data1[source.data1$Date == as.Date("2007-02-01") | source.data1$Date == as.Date("2007-02-02") , ]

## plot
hist(source.data2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power 
(kilowatts)")

## export to png
dev.copy(png, file = "plot1.png") 
dev.off() 
