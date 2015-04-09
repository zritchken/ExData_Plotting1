

library("data.table")
AllData <- fread("household_power_consumption.txt")
Data <- subset(AllData,((AllData$Date == "1/2/2007") | (AllData$Date == "2/2/2007")))
Data$DateTime <- paste(Data$Date,Data$Time)
Data$RealTime <- as.data.frame(strptime(Data$DateTime,format="%d/%m/%Y %H:%M:%S"))
par(mar=c(2,2))
with(Data, {
        
        plot(RealTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
        points(RealTime,Sub_metering_2,type="l",col="red")
        points(RealTime,Sub_metering_3,type="l",col="blue")
        legend("topright",lwd=5,cex=.5,pch = "__", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
})
dev.copy(png,file="plot3.png")
dev.off()