#Set Working Directory
setwd("C:/Users/Gabriela Olivo/Desktop/Coursera/Exploratory Data Analysis/Week 1/Project Course")

#Read Data
HPC_data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Filter Dates
HPC_data2 <- HPC_data[HPC_data$Date %in% c("1/2/2007","2/2/2007") ,]

#Format Date
HPC_data2$Date<-as.Date(HPC_data2$Date, format="%d/%m/%Y")
#Format Data Variables
HPC_data2$Global_active_power<-as.numeric(HPC_data2$Global_active_power)

#Plot 1 - Histogram
hist(HPC_data2$Global_active_power, xlab="Global Active Power (kilowatts)", main = "Global Active Power", col="red")

#Save as PNG
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()