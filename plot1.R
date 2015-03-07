# read the data.
powerdata <- read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)
# convert the fields
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)

# subset the data
subsetdata <- powerdata[powerdata$Date %in% c("2007-02-01", "2007-02-02"),]

#plot the data
hist(subsetdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", breaks=20, main="Global Active Power")

#copy it to plot1.png
dev.copy2pdf(file="plot1.pdf", output.type="pdf")