setwd("./Coursera Data Science/Exploratory Data Analysis")
list.files()

#read in household data.
household <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#subset household data with the dates we want.
household <- subset(household, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)

#subset and change Date and Time
datetime <- as.POSIXct(paste(household$Date, household$Time), format= "%d/%m/%Y %H:%M:%S", sep=" ")

#create png
png("plot4.png", width = 480, height = 480)

#arrange the 4 plots
par(mfrow=c(2,2))

# create the plots
##plot1
plot(datetime, globalpoweractive, xlab="", ylab="Global Active Power (kilowatts)", type="l")

##plot2
plot(datetime, household$Voltage, xlab="", ylab="Voltage", sub="datetime", type="l")

##plot3
plot(datetime, household$Sub_metering_1, xlab="", ylab="Energy Sub metering", type="l")
lines(datetime, household$Sub_metering_2, type = "l", col="red")
lines(datetime, household$Sub_metering_3, type = "l", col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1), bty = "n")

##plot4
plot(datetime, household$Global_reactive_power, xlab="", ylab="Global_reactive_power", sub="datetime", type="l")

dev.off()