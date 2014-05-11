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
  
  ## plotting this data
  plot(readDataSubset$DateTimeConverted, readDataSubset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  ## saving this plot
  dev.copy(png, file="plot2.png")
  dev.off()
  
}
