# Coursera: Exploratory Data Analysis
# Course Project 1: Plot 2

# Check for data file. If not present, download and unzip.

if (!file.exists("powerData.zip")) {
        dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(dataset_url, "powerData.zip")
        unzip("powerData.zip")
}

# Read in data for the specified dates.

powerData <- read.csv("household_power_consumption.txt", skip=66637, nrows=2880,
                       header=FALSE, na.strings="?", sep=";")

# Add variable names back onto file.

names(powerData) <- names(read.csv("household_power_consumption.txt", nrows=1, 
                                     sep=";"))

# Combine date and time variables into new dateTime variable.

powerData$DateTime <- strptime(paste(powerData$Date, powerData$Time),
                               format="%d/%m/%Y %H:%M:%S")

# Create and save plot 2

png(filename="plot2.png", width=480, height=480, bg="transparent")
with(powerData, plot(DateTime, Global_active_power, type="l", xlab="",
                     ylab="Global Active Power(kilowatts)"))
dev.off()

