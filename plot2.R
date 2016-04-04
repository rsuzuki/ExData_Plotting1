## Shared utility to read the data
source("utils.R")
data <- read_household()

## Start the png device, set margins and plot
png(filename = "plot2.png", width = 400, height = 400, units = "px", bg = "white")
par(mar = c(4,4,1,1))
plot(data$Date, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

## ... Profit!
dev.off()
