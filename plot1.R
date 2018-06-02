setwd("./Coursera Data Science/Exploratory Data Analysis")
list.files()

#read in household data.
household <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#subset household data with the dates we want.
household <- subset(household, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)

# change Date from a factor variable to a date variable
household$Date <- as.Date(household$Date, "%d/%m/%Y")

#set and save png file width and height
png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12)
#create plot
hist(household$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#close off
dev.off()