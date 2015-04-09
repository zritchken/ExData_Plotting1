

library("data.table")
AllData <- fread("household_power_consumption.txt")
Data <- subset(AllData,((AllData$Date == "1/2/2007") | (AllData$Date == "2/2/2007")))
Data$DateTime <- paste(Data$Date,Data$Time)
Data$RealTime <- as.data.frame(strptime(Data$DateTime,format="%d/%m/%Y %H:%M:%S"))

par(mfrow = c(2, 2),mar = c(4, 4, 4, 4),oma=c(0,0,0,0))
with(Data, {
        
        plot(RealTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
        plot(RealTime,Voltage,type="l",ylab="Voltage",xlab="datetime")
        plot(RealTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
        points(RealTime,Sub_metering_2,type="l",col="red")
        points(RealTime,Sub_metering_3,type="l",col="blue")
        legend("top", pch = "__",cex=0.5,bty="n", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
        plot(RealTime,Global_reactive_power,type="h",lwd=0.5,ylab="Global_reactive_power",xlab="datetime")
})
dev.copy(png,file="plot4.png")
dev.off()