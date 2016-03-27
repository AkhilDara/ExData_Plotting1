##read the downloaded and unzipped file from the directory
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", 
                   colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

##Change the first coloumn using as.date() to date format
data$Date<-as.Date(data$Date,"%d/%m/%Y")

## Consider data from 1/2/2007 - 2/2/2007
required_data <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

##combine date and time to get exact time using strptime func.
required_data$Time <- strptime(paste(required_data$Date,required_data$Time,sep = " "),format = "%Y-%m-%d %H:%M:%S")

## save image as .png file
png("plot4.png", width=480, height=480, units="px")

##plot the graph and add legend to the top right corner
## create four segments for 4 graphs
par(mfrow=c(2,2))

## graph1 -> plot Global Active Power Vs Time
plot(required_data$Time,required_data$Global_active_power,
                type="l",ylab="Global Active Power",xlab="")

## graph2 -> plot Voltage Vs Time
plot(required_data$Time,required_data$Voltage,type="l",
                ylab='Voltage',xlab="datetime")

## graph3 -> plot Energy Sub Metering Vs Time
plot(required_data$Time,required_data$Sub_metering_1,
                type ="l",ylab = "Energy sub metering",xlab = "")
lines(required_data$Time,required_data$Sub_metering_2,type="l",col='red')
lines(required_data$Time,required_data$Sub_metering_3,type="l",col='blue')
legend('topright',lty=1,col=(c('black','red','blue')),
                legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

## graph3 -> plot Global Reactive Power Vs Time
plot(required_data$Time,required_data$Global_reactive_power,
                type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()