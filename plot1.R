# read the entire data file and then subset it for the 2 required days
# it is assumed that current working directory contains the .txt file
#all the data in the original datafile is character type 
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Extract the GlobalActivePower from the subSetData and convert to numeric 
#Set size of png plot create histogram for GlobalActivePower turn device off
GlobalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()