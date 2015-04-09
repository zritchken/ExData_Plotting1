

library("data.table")
AllData <- fread("household_power_consumption.txt")
Data <- subset(AllData,((AllData$Date == "1/2/2007") | (AllData$Date == "2/2/2007")))
Data$Global_active_power <- as.numeric(Data$Global_active_power)
Data$DateTime <- paste(Data$Date,Data$Time)
Data$RealTime <- as.data.frame(strptime(Data$DateTime,format="%d/%m/%Y %H:%M:%S"))
with(Data,plot(RealTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.copy(png,file="plot2.png")
dev.off()