library(sqldf)
#My default locale is not English, so I have to set it to print days in English on x axis
Sys.setlocale("LC_ALL", "English")
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date IN ('1/2/2007','2/2/2007')", header = TRUE, sep = ";",colClasses=c("Date","character",rep("double",7)))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
png(file = "plot3.png",width = 480, height = 480, units = "px")
par(mar = c(4, 5, 2, 1))

plot(data$DateTime,data$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright", col = c("black", "red","blue"), legend = paste("Sub_metering_",1:3,sep=""),lty=c(1,1))
dev.off()
