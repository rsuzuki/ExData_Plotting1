## Shared utility to read the data
source("utils.R")
data <- read_household_skip()

## Start the png device and plot
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
par(mar = c(5.1,4.1,4.1,2.1))
hist(data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

## ... Profit!
dev.off()
