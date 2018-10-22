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

#Plot 2 - Lines Plot
plot(HPC_data2$Global_active_power~HPC_data2$HPC_datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Save as PNG
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()