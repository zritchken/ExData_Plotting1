

library("data.table")
AllData <- fread("household_power_consumption.txt")
Data <- subset(AllData,((AllData$Date == "1/2/2007") | (AllData$Date == "2/2/2007")))
Data$Global_active_power <- as.numeric(Data$Global_active_power)
hist(Data$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()
