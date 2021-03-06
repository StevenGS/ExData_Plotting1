Data=subset(read.csv('household_power_consumption.txt', sep=";", header=TRUE, na.strings="?", stringsAsFactors=F, comment.char=""), Date=='1/2/2007'|Date=='2/2/2007')

Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")
Data$DateTime = paste(as.Date(Data$Date), (Data$Time))
Data$DateTimeTrue = as.POSIXct(Data$DateTime)

png('plot4.png')
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(Data, {
  plot(Global_active_power~DateTimeTrue, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~DateTimeTrue, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~DateTimeTrue, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTimeTrue,col='Red')
  lines(Sub_metering_3~DateTimeTrue,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTimeTrue, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.off()