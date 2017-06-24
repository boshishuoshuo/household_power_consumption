power_consump <- read.table("household_power_consumption.txt", header = T,
                            sep = ";", na.strings = "?", 
                            stringsAsFactors = FALSE, 
                            colClasses = c(rep("character", 2), 
                                           rep("numeric", 7)))
power_consump$Date <- as.Date(power_consump$Date, format = "%d/%m/%Y")

twodayconsump <- subset(power_consump, Date >= "2007-02-01" & 
                                Date <= "2007-02-02")

png("plot2.png")

plot(twodayconsump$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xaxt = 'n', xlab = "")

axis(1, at = seq(0, 2880, len = 3), labels = c("Thu", "Fri", "Sat"))

dev.off()