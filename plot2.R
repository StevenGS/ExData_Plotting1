Data=subset(read.csv('household_power_consumption.txt', sep=";", header=TRUE, na.strings="?", stringsAsFactors=F, comment.char=""), Date=='1/2/2007'|Date=='2/2/2007')

Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")
Data$DateTime = paste(as.Date(Data$Date), (Data$Time))
Data$DateTimeTrue = as.POSIXct(Data$DateTime)
png('plot2.png', width=480, height=480)
plot(Data$DateTimeTrue,Data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
