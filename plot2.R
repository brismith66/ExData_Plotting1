# read the data.
powerdata <- read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)
# convert the fields
powerdata$Date <- as.POSIXct(paste(powerdata$Date, powerdata$Time), format="%d/%m/%Y %H:%M:%S")
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)

# subset the data
subsetdata <- powerdata[as.Date(powerdata$Date) >= "2007-02-01" & as.Date(powerdata$Date) <= "2007-02-02",]

#plot the data
png(file="plot2.png")

plot(subsetdata$Date, xaxt="n", subsetdata$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(subsetdata$Date, subsetdata$Global_active_power, type="l")
axis.POSIXct(1, subsetdata$Date, format="%a", labels=TRUE)
#copy it to plot2.png
dev.off()