read_household <- function() {
    src_filename <- "household_power_consumption.txt"
    date_min <- as.POSIXct("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S") ## inclusive
    date_max <- as.POSIXct("2007-02-03 00:00:00", format="%Y-%m-%d %H:%M:%S") ## exclusive
    num_rows <- 2075259
    col_classes <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
    
    ## TODO is there a way to conditionally read the table using the base package?
    ## I know this is very slow compared to conditional reads from packagaes such as sqldf
    ## but I`ll avoid that to avoid confusion among peer reviews
    data <- read.table(src_filename, sep = ";", header = T, colClasses = col_classes, nrows = num_rows, na.strings = "?")
    
    ## Format the date and time columns
    data$Date <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
    data <- subset(data, select = -c(Time))
    
    ## Filter the dates to the selected range and return
    data[data$Date >= date_min & data$Date < date_max,]
}