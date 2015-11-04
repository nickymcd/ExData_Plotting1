#read in data and subset for required date (note separator is not default)
powerfile <- "household_power_consumption.txt"
data <- read.table(powerfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datesubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot histogram with given settings
gap <- as.numeric(datesubset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()