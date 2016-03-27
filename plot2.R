##read the downloaded and unzipped file from the directory
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", 
                   colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

##Change the first coloumn using as.date() to date format
data$Date<-as.Date(data$Date,"%d/%m/%Y")

## Consider data from 1/2/2007 - 2/2/2007
required_data <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

##combine date and time to get exact time using strptime func.
required_data$Time <- strptime(paste(required_data$Date,required_data$Time,sep = " "),format = "%Y-%m-%d %H:%M:%S")

##plot the graph with global active power var. on Y axis and Date on X-Axis and save it to png file
png("plot2.png", width=480, height=480, units="px")
plot(required_data$Time,required_data$Global_active_power,type ="l",ylab = "Global Active Power (Kilowatts)",xlab = "")
dev.off()