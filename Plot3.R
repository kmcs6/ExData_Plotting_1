# Plot 3
# read in data and filter out all but 2 days of interest 
library(data.table)
library(dplyr)
power <- fread("household_power_consumption.txt", na.strings = "?")
power2 <- filter(power, Date == "2/2/2007" | Date == "1/2/2007")

# paste date and time columns into a new column datetime , convert to date class
# with as.POSIXct
power3 <- power2 %>% mutate(datetime = paste(Date, Time)) %>% 
      mutate(datetime = as.POSIXct(datetime, format="%d/%m/%Y %H:%M:%S"))

# graph the 3 sub metering variables as lines in the same graph with plot()
png(file = "plot3.png", width=480, height=480)
plot(power3$datetime, power3$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(power3$datetime, power3$Sub_metering_2, type = "l", col = "red")
lines(power3$datetime, power3$Sub_metering_3, type = "l", col = "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()