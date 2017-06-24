power_consump <- read.table("household_power_consumption.txt", header = T,
                            sep = ";", na.strings = "?", 
                            stringsAsFactors = FALSE, 
                            colClasses = c(rep("character", 2), 
                                           rep("numeric", 7)))
power_consump$Date <- as.Date(power_consump$Date, format = "%d/%m/%Y")

twodayconsump <- subset(power_consump, Date >= "2007-02-01" & 
                                Date <= "2007-02-02")

png("plot1.png")

hist(twodayconsump$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()