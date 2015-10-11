setwd("C:/Users/rbaiti.j/Documents/Training/Data Science Specialization/Exploratory Data Analysis/")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power.zip")
unzip("household_power.zip")
dir()

#install.packages("chron")
library(chron)
library(dplyr)
data <- read.table("household_power_consumption.txt",sep = ";",header = T,na.strings = "?")
head(data)
data[,1] <- as.Date(data[,1], format="%d/%m/%Y")
data[,2] <- paste(data[,1],data[,2],sep = " ")
data2 <- data
data2$DateTime = strptime(data2$Time, format = "%d/%m/%Y %H:%M:%S")
head(data2)
class(data2$DateTime)
subset <- data2[data2$Date>=as.Date("01/02/2007", format="%d/%m/%Y") & data2$Date<=as.Date("02/02/2007", format="%d/%m/%Y"),]
head(subset)

plot(subset$DateTime,subset$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.copy(png,"plot2.png")
dev.off()
