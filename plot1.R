library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date IN ('1/2/2007','2/2/2007')", header = TRUE, sep = ";",colClasses=c("Date","character",rep("double",7)))
png(file = "plot1.png",width = 480, height = 480, units = "px")
par(mar = c(4, 5, 2, 1))
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()

