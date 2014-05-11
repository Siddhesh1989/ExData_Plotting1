plotter<-function()
{
  ##reading just one row of data in order to get header names
  
  headerData<-read.table("household_power_consumption.txt", header=TRUE, nrow=1, sep=";")
  
  ##reading the required rows of data only in order to save memory
  ## 1/2/2007 to 2/2/2007 match the row numbers mentioned below
  
  readDataSubset<-read.table("household_power_consumption.txt", header=TRUE, skip=66637, nrow=2879, sep=";")
  
  ## now assigning the header names to this subset
  
  names(readDataSubset)<-names(headerData)
  
  ## merging date and time
  readDataSubset$DateTime<-paste(readDataSubset$Date, readDataSubset$Time)
  readDataSubset$DateTimeConverted<-strptime(readDataSubset$DateTime, "%d/%m/%Y %H:%M:%S")
  
  plot(readDataSubset$DateTimeConverted, readDataSubset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
  points(readDataSubset$DateTimeConverted, readDataSubset$Sub_metering_2, type="l", col="red")
  points(readDataSubset$DateTimeConverted, readDataSubset$Sub_metering_3, type="l", col="blue")
  legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  ## saving this plot
  dev.copy(png, file="plot3.png")
  dev.off()
}
