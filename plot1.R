##read the downloaded and unzipped file from the directory
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

##Change the first coloumn using as.date() to date format
data$Date<-as.Date(data$Date,"%d/%m/%Y")

## Consider data from 1/2/2007 - 2/2/2007
required_data <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

##Create the histogram plot and save it as png file
png("plot1.png", width=480, height=480, units="px")
hist(required_data$Global_active_power, col = "red", main = "Global Active Power", xlab= "Global Acrive Power (kilowatts)")
dev.off()