household_function()



datetime <- as.POSIXct(paste(household$Date, household$Time), format= "%d/%m/%Y %H:%M:%S", sep=" ")

globalpoweractive <- as.numeric(household$Global_active_power)

#set sys language fro german to english
Sys.setlocale("LC_TIME", "English")

#create png
png("plot2.png", width = 480, height = 480)

#create plot2
plot(datetime, globalpoweractive, xlab="", ylab="Global Active Power (kilowatts)", type="l")

dev.off()