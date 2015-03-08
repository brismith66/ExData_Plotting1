# read the data.
powerdata <- read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)
# convert the date fields
powerdata$Date <- as.POSIXct(paste(powerdata$Date, powerdata$Time), format="%d/%m/%Y %H:%M:%S")

# subset the data
subsetdata <- powerdata[as.Date(powerdata$Date) >= "2007-02-01" & as.Date(powerdata$Date) <= "2007-02-02",]
# convert the fields for the smaller set.
subsetdata$Sub_metering_1 <- as.numeric(subsetdata$Sub_metering_1)
subsetdata$Sub_metering_2 <- as.numeric(subsetdata$Sub_metering_2)
subsetdata$Sub_metering_3 <- as.numeric(subsetdata$Sub_metering_3)

#plot the data
png(file="plot3.png")

plot(subsetdata$Date, xaxt="n", subsetdata$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(subsetdata$Date, subsetdata$Sub_metering_1)
lines(subsetdata$Date, subsetdata$Sub_metering_2, col="red")
lines(subsetdata$Date, subsetdata$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red","blue"))
axis.POSIXct(1, subsetdata$Date, format="%a", labels=TRUE)

dev.off()