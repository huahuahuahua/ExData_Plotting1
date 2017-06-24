mydata<-read.table("./household_power_consumption.txt", header = FALSE, sep = ";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?", skip = 66637, nrows = 2880, stringsAsFactors = FALSE)
mydata$Date<-as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$dt<-strptime(paste(mydata$Date, mydata$Time), "%Y-%m-%d %H:%M:%S")

#plot4
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
#top left plot
plot(mydata$dt, mydata$Global_active_power , type = "l",  ylab="Global Active Power", xlab="")

#top right plot
plot(mydata$dt, mydata$Voltage , type = "l",  ylab="Voltage", xlab="datetime")

#bottom left plot
plot(mydata$dt, mydata$Sub_metering_1 , col="black",  type = "l",  ylab="Energy sub metering", xlab="")
points(mydata$dt, mydata$Sub_metering_2 , col="red",  type = "l" ,ylab="Energy sub metering", xlab="")
points(mydata$dt, mydata$Sub_metering_3 , col="blue",  type = "l" ,ylab="Energy sub metering", xlab="")
legend("topright",  bty="n", cex=0.75, lty = 1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#bottom right plot
plot(mydata$dt, mydata$Global_reactive_power , type = "l",  ylab="Global_reactive_power", xlab="datetime")

dev.off()
