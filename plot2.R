# read the entire data file and then subset it for the 2 required days
# it is assumed that current working directory contains the .txt file
#all the data in the original datafile is character type 

dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SubSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Use strptime for datetime convert GlobalActivePower to numeric set size of graph
#plot datetime v/s GlobalActivePower turn device off
datetime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


