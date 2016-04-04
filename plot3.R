## Shared utility to read the data
source("utils.R")
data <- read_household()

## Start the png device
png(filename = "plot3.png", width = 400, height = 400, units = "px", bg = "white")

## Plot an empty chart at first
par(mar = c(4,4,1,1))
plot(data$Date, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")

## Add the line series
lines(data$Date, data$Sub_metering_1, col = "black")
lines(data$Date, data$Sub_metering_2, col = "red")
lines(data$Date, data$Sub_metering_3, col = "blue")

## Add a legend
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

## ... Profit!
dev.off()
