power_consump <- read.table("household_power_consumption.txt", header = T,
                            sep = ";", na.strings = "?", 
                            stringsAsFactors = FALSE, 
                            colClasses = c(rep("character", 2), 
                                           rep("numeric", 7)))
power_consump$Date <- as.Date(power_consump$Date, format = "%d/%m/%Y")

twodayconsump <- subset(power_consump, Date >= "2007-02-01" & 
                                Date <= "2007-02-02")

png("plot4.png")

par(mfrow = c(2,2))

plot(twodayconsump$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts", xaxt = 'n', xlab = "")
axis(1, at = seq(0, 2880, len = 3), labels = c("Thu", "Fri", "Sat"))

plot(twodayconsump$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage", xaxt = 'n')
axis(1, at = seq(0, 2880, len = 3), labels = c("Thu", "Fri", "Sat"))

plot(twodayconsump$Sub_metering_1, ylab = "Engergy sub metering", 
     type = 'l', xaxt = 'n', xlab = "")
lines(twodayconsump$Sub_metering_2, type = 'l', xaxt = 'n', xlab = "", col = 2)
lines(twodayconsump$Sub_metering_3, type = 'l', xaxt = 'n', xlab = "", col = 4)
legend("topright", lty = 1, 
       legend = c("Sub-metering-1", "Sub-metering-2", "Sub-metering-3"), 
       col = c(1,2,4))
axis(1, at = seq(0, 2880, len = 3), labels = c("Thu", "Fri", "Sat"))

plot(twodayconsump$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power", xaxt = 'n')
axis(1, at = seq(0, 2880, len = 3), labels = c("Thu", "Fri", "Sat"))

dev.off()