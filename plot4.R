## Shared utility to read the data
source("utils.R")
data <- read_household_skip()

## Start the png device
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")

## Make 2x2 chart
par(mfrow=c(2,2))
par(mar = c(4,4,1,1))

## We're drawing 4 charts here. Let's use with() to avoid writing "data" all over
with(data, {
    ## Plot 1 is the same as the plot2.R
    plot(Date, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
    ## Plot 2 is similar to the first one
    plot(Date, Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
    ## Plot 3 is the same as plot3.R (the legend here has no border, though)
    plot(Date, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
    lines(Date, Sub_metering_1, col = "black")
    lines(Date, Sub_metering_2, col = "red")
    lines(Date, Sub_metering_3, col = "blue")
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n")
    ## Plot 4 is similar to Plot 2
    plot(Date, Global_reactive_power, xlab = "datetime", ylab = "Voltage", type = "l")
})

## ... Profit!
dev.off()
