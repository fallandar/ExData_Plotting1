library(sqldf)
#My default locale is not English, so I have to set it to print days in English on x axis
Sys.setlocale("LC_ALL", "English")

data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date IN ('1/2/2007','2/2/2007')", header = TRUE, sep = ";",colClasses=c("Date","character",rep("double",7)))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
png(file = "plot4.png",width = 480, height = 480, units = "px")
par(mfrow = c(2, 2), mar = c(4, 5, 2, 1), oma = c(0, 0, 2, 0))

#graph1
plot(data$DateTime,data$Global_active_power, type="l",ylab="Global Active Power",xlab="")
#graph2
plot(data$DateTime,data$Voltage, type="l",ylab="Voltage",xlab="")
mtext("datetime",side=1,outer=FALSE,line=3,cex=0.9)
#graph3
plot(data$DateTime,data$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright", col = c("black", "red","blue"), legend = paste("Sub_metering_",1:3,sep=""),lty=c(1,1))
#graph4
plot(data$DateTime,data$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="")
mtext("datetime",side=1,outer=FALSE,line=3,cex=0.9)
dev.off()
