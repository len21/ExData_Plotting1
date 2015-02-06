## Plot 3: plot the 3 sub-metering values by the new datetime variable.

# Clean up workspace
rm(list=ls())

# set working directory to the location where the dataset was unzipped
setwd("C:\\Users\\Moira\\ExData_Plotting1")

# load the packages needed 
library(datasets)

# read in the data to a data table
DT <- read.table("C:/Users/Moira/Documents/DSClass/DS4/data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))
DT <- DT[(DT$Date == '1/2/2007') | (DT$Date == '2/2/2007'),]

# convert the columns to date type and time type
DT$Date = as.Date(DT$Date, "%d/%m/%Y")
# Create a new DateTime variable
DT$DateTime = as.POSIXct(paste(DT$Date, DT$Time), format="%Y-%m-%d %H:%M:%S")

# save plot as a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")

# Draw a new plot using plot(x, y, ...)

plot(DT$DateTime, DT$Sub_metering_1, 
     xlab = "",                   # no label on X axis
     ylab = "Energy sub metering", # label on y axis
     type="l",                     # set the type to line
     col='black')
lines(DT$DateTime, DT$Sub_metering_2, type="l", col="red")
lines(DT$DateTime, DT$Sub_metering_3, type="l", col="blue")

# add a legend for the lines
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col=c("black", "red", "blue"))

dev.off()
