library(sqldf)
#My default locale is not English, so I have to set it to print days in English on x axis
Sys.setlocale("LC_ALL", "English")
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date IN ('1/2/2007','2/2/2007')", header = TRUE, sep = ";",colClasses=c("Date","character",rep("double",7)))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
png(file = "plot2.png",width = 480, height = 480, units = "px")
plot(data$DateTime,data$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
