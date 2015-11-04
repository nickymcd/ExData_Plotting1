#read in data and subset for required date (note separator is not default)
powerfile <- "household_power_consumption.txt"
data <- read.table(powerfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datesubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#standardize date and times and plot base plot with submetering 1 - 3 (type = line)
dt <- strptime(paste(datesubset$Date, datesubset$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
gap <- as.numeric(datesubset$Global_active_power)
sub1 <- as.numeric(datesubset$Sub_metering_1)
sub2 <- as.numeric(datesubset$Sub_metering_2)
sub3 <- as.numeric(datesubset$Sub_metering_3)
png("plot3.png", width=480, height=480)

#plot sub 1 first, then add, 2nd and 3rd layers
plot(dt, sub1, type="l", xlab ="", ylab="Energy sub metering")
lines(dt, sub2, type="l", col ="red")
lines(dt, sub3, type="l", col ="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()

