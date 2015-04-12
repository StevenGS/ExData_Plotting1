Data=subset(read.csv('household_power_consumption.txt', sep=";", header=TRUE, na.strings="?", stringsAsFactors=F, comment.char=""), Date=='1/2/2007'|Date=='2/2/2007')
png('plot1.png', width=480, heigh=480)
histinfo=hist(((Data$Global_active_power)), breaks=c(seq(0,6,.5), 60), xlim=c(0,6), freq=TRUE, main="Global Active Power", col='red', xlab="Global Active Power (kilowatts)", ylim=c(0,1200))
dev.off()
