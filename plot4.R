#Set Working Directory
setwd("C:/Users/Gabriela Olivo/Desktop/Coursera/Exploratory Data Analysis/Week 1/Project Course")

#Read Data
HPC_data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Filter Dates
HPC_data2 <- HPC_data[HPC_data$Date %in% c("1/2/2007","2/2/2007") ,]

#Format Date-Time
HPC_datetime <- strptime(paste(HPC_data2$Date, HPC_data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
HPC_data2 <- cbind(HPC_data2,HPC_datetime)
#Format Data Variable
HPC_data2$Global_active_power<-as.numeric(HPC_data2$Global_active_power)
HPC_data2$Voltage<-as.numeric(HPC_data2$Voltage)
HPC_data2$Global_reactive_power<-as.numeric(HPC_data2$Global_reactive_power)
HPC_data2$subMetering1 <- as.numeric(HPC_data2$Sub_metering_1)
HPC_data2$subMetering2 <- as.numeric(HPC_data2$Sub_metering_2)
HPC_data2$subMetering3 <- as.numeric(HPC_data2$Sub_metering_3)

#Plot 4
par(mfrow=c(2,2), mar=c(5,5,1,1))
    ##Plot (1,1)
plot(HPC_data2$Global_active_power~HPC_data2$HPC_datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    ##Plot (1,2)
plot(HPC_data2$Voltage~HPC_data2$HPC_datetime, type="l", xlab="datetime", ylab="Voltage")
    ##Plot (2,1)
plot(HPC_data2$Sub_metering_1~HPC_data2$HPC_datetime, type="l", xlab="", ylab="Energy sub metering")
lines(HPC_data2$Sub_metering_2~HPC_data2$HPC_datetime, col="red")
lines(HPC_data2$Sub_metering_3~HPC_data2$HPC_datetime, col="blue")
legend("topright", inset = -0.01, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, 
       col=c("black", "red", "blue"), cex=0.65, bty="n", x.intersp=0.3, y.intersp=0.8)
##Plot (2,2)
plot(HPC_data2$Global_reactive_power~HPC_data2$HPC_datetime, type="l", xlab="datetime", ylab="Global_reactive_power")

#Save as PNG
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()