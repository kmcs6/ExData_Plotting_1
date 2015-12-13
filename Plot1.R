# Plot 1 as a png file.
library(data.table)
library(dplyr)
power <- fread("household_power_consumption.txt", na.strings = "?")
power2 <- filter(power, Date == "2/2/2007" | Date == "1/2/2007")
png(file = "plot1.png", width=480, height=480)
hist(power2$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = "red")
dev.off()