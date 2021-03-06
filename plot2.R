library(data.table)
setwd("/Users/murtuza/coursera/data-analysis/week1")
dt <- read.table("household_power_consumption.txt",
                 sep = ";", stringsAsFactors=FALSE, header=TRUE)
dt <- cbind(datetime = strptime(paste(dt$Date, dt$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), dt)
x1 <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
x2 <- strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
sub <- subset(dt, dt$datetime >= x1 & dt$datetime < x2)
png("plot2.png", width=480, height=480)
x <- sub$datetime
y <- as.numeric(sub$Global_active_power)
plot(x,y,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()