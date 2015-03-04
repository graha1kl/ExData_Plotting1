# Coursera: Exploratory Data Analysis
# Course Project 1: Plot 1

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

# Convert date variable to date class.

powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")

# Create and save plot 1

png(filename="plot1.png", width=480, height=480)
with(powerData, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
                     ylab="Frequency", main="Global Active Power"))
dev.off()

