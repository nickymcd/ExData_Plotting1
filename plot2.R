#read in data and subset for required date (note separator is not default)
powerfile <- "household_power_consumption.txt"
data <- read.table(powerfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datesubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#standardize date and times and plot base plot with given settings (type = line)
dt <- strptime(paste(datesubset$Date, datesubset$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
gap <- as.numeric(datesubset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dt, gap, type="l", main="Global Active Power", xlab ="", ylab="Global Active Power (kilowatts)")
dev.off()

