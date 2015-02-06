## Plot 1: Global Active Power: household global minute-averaged active power (in kilowatt)

# Clean up workspace
rm(list=ls())

# set working directory to the location where the dataset was unzipped
setwd("C:\\Users\\Moira\\ExData_Plotting1")

# load the packages needed 
library(datasets)

# read in the data to a data table
DT <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))
DT <- DT[(DT$Date == '1/2/2007') | (DT$Date == '2/2/2007'),]

# convert the columns to date type and time type
DT$Date = as.Date(DT$Date, "%d/%m/%Y")
# Create a new DateTime variable
DT$DateTime = as.POSIXct(paste(DT$Date, DT$Time), format="%Y-%m-%d %H:%M:%S")

# save plot as a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")

# Draw a new plot
hist(DT$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")

dev.off()


