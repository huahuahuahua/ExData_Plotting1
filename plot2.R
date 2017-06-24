mydata<-read.table("./household_power_consumption.txt", header = FALSE, sep = ";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?", skip = 66637, nrows = 2880, stringsAsFactors = FALSE)
mydata$Date<-as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$dt<-strptime(paste(mydata$Date, mydata$Time), "%Y-%m-%d %H:%M:%S")

#plot2
png(filename = "plot2.png", width = 480, height = 480)
plot(mydata$dt, mydata$Global_active_power , type = "l",  ylab="Global Active Power (kilowatts)", xlab="")
dev.off()