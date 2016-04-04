## Shared utility to read the data
source("utils.R")
data <- read_household_skip()

## Start the png device, set margins and plot
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")
par(mar = c(4,4,1,1))
plot(data$Date, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

## ... Profit!
dev.off()
