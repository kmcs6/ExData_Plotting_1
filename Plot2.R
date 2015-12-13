# Plot 2
# read in data and filter out all but 2 days of interest 
library(data.table)
library(dplyr)
power <- fread("household_power_consumption.txt", na.strings = "?")
power2 <- filter(power, Date == "2/2/2007" | Date == "1/2/2007")

# paste date and time columns into a new column datetime , convert to date class
# with as.POSIXct
power3 <- power2 %>% mutate(datetime = paste(Date, Time)) %>% 
      mutate(datetime = as.POSIXct(datetime, format="%d/%m/%Y %H:%M:%S"))

# graph as a line graph with plot()
png(file = "plot2.png", width=480, height=480)
plot(power3$datetime, power3$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()