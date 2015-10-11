setwd("C:/Users/rbaiti.j/Documents/Training/Data Science Specialization/Exploratory Data Analysis/")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power.zip")
unzip("household_power.zip")
dir()

#install.packages("chron")
library(chron)

data <- read.table("household_power_consumption.txt",sep = ";",header = T,na.strings = "?")
head(data)
data[,1] <- as.Date(data[,1], format="%d/%m/%Y")
data[,2] <- as.character(data[,2])
data[,2] <- chron(times = data[,2])
class(data[,2])
subset <- data[data$Date>=as.Date("01/02/2007", format="%d/%m/%Y") & data$Date<=as.Date("02/02/2007", format="%d/%m/%Y"),]

hist(subset$Global_active_power,xlab = "Global Active Power (kilowatts)",col = "red",main = "Global Active Power")
dev.copy(png,"plot1.png")
dev.off()
