setwd("./Coursera Data Science/Exploratory Data Analysis")
list.files()

#read in household data.
household <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#subset household data with the dates we want.
household <- subset(household, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)

#subset and change Date and Time
datetime <- as.POSIXct(paste(household$Date, household$Time), format= "%d/%m/%Y %H:%M:%S", sep=" ")

#create png
png("plot3.png", width = 480, height = 480)
 
#create plot3
plot(datetime, household$Sub_metering_1, xlab="", ylab="Energy Sub metering", type="l")
lines(datetime, household$Sub_metering_2, type = "l", col="red")
lines(datetime, household$Sub_metering_3, type = "l", col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1))
       
 
dev.off()
