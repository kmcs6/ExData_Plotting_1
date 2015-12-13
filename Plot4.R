# Plot 4: read in data and filter out all but 2 days of interest 
library(data.table)
library(dplyr)
power <- fread("household_power_consumption.txt", na.strings = "?")
power2 <- filter(power, Date == "2/2/2007" | Date == "1/2/2007")

# paste date and time into column datetime , convert to date class with as.POSIXct
power3 <- power2 %>% mutate(datetime = paste(Date, Time)) %>% 
      mutate(datetime = as.POSIXct(datetime, format="%d/%m/%Y %H:%M:%S"))

# In png file plot all 4 line graphs in a 2x2 panel
png(file = "plot4.png", width=480, height=480)
par(mfrow = c(2,2))                                #set 2x2 graph panel
with(power3, {
      plot(datetime, Global_active_power, type = "l", ylab = 
                 "Global Active Power (kilowatts)", xlab = "")
      plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
      plot(datetime, Sub_metering_1, type = "l", xlab = "", 
      ylab = "Energy sub metering")
      lines(datetime, Sub_metering_2, type = "l", col = "red")
      lines(datetime, Sub_metering_3, type = "l", col = "blue")
      legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty = "n",
                   legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      plot(datetime, Global_reactive_power, type = "l", xlab = "datetime", 
           ylab = "Global_reactive_power")
      })
dev.off()