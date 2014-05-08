library(data.table)
setwd("/Users/murtuza/coursera/data-analysis/week1")
dt <- read.table("household_power_consumption.txt",
                 sep = ";", stringsAsFactors=FALSE, header=TRUE)
dt <- cbind(datetime = strptime(paste(dt$Date, dt$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), dt)
x1 <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
x2 <- strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
sub <- subset(dt, dt$datetime >= x1 & dt$datetime < x2)
png("plot3.png", width=480, height=480)
x <- sub$datetime
s1 <- as.numeric(sub$Sub_metering_1)
s2 <- as.numeric(sub$Sub_metering_2)
s3 <- as.numeric(sub$Sub_metering_3)
plot(x,s1,type="l",xlab="",ylab="Energy sub metering",col="black")
lines(x,s2,col="red")
lines(x,s3,col="blue")
legend("topright",col=c("black","red","blue"),
       legend=c("sub_metering_1","sub_metering_2","sub_metering_3"), lty=c(1,1,1))
dev.off()