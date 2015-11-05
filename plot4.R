##read in data and subset for required date (note separator is not default)
powerfile <- "household_power_consumption.txt"
data <- read.table(powerfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datesubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#standardize date and times and multiple base plot preparation (type = line)
dt <- strptime(paste(datesubset$Date, datesubset$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
gap <- as.numeric(datesubset$Global_active_power)
grp <- as.numeric(datesubset$Global_reactive_power)
voltage <- as.numeric(datesubset$Voltage)
sub1 <- as.numeric(datesubset$Sub_metering_1)
sub2 <- as.numeric(datesubset$Sub_metering_2)
sub3 <- as.numeric(datesubset$Sub_metering_3)

png("plot4.png", width=480, height=480)

#prepare multiple plot
par(mfrow = c(2,2))

#plot multiple plots
plot(dt, gap, type="l", xlab="", ylab="Global Active Power", cex=0.4)

plot(dt, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dt, sub1, type="l", xlab ="", ylab="Energy sub metering")
lines(dt, sub2, type="l", col ="red")
lines(dt, sub3, type="l", col ="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = 'n',lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

plot(dt, grp, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()


