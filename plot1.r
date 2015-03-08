data_raw <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_raw$Date <- as.Date(data_raw$Date, format="%d/%m/%Y")
data_time <- subset(data_raw, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data_time$Date), data_time$Time)
data_time$Datetime <- as.POSIXct(datetime)
hist(data_time$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency",col="Red")
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()
