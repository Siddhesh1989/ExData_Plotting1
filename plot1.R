plotter<-function()
{
  ##reading just one row of data in order to get header names
  
  headerData<-read.table("household_power_consumption.txt", header=TRUE, nrow=1, sep=";")
  
  ##reading the required rows of data only in order to save memory
  ## 1/2/2007 to 2/2/2007 match the row numbers mentioned below
  
  readDataSubset<-read.table("household_power_consumption.txt", header=TRUE, skip=66637, nrow=2879, sep=";")
  
  ## now assigning the header names to this subset
  
  names(readDataSubset)<-names(headerData)
  
  ##creating the histogram
  hist(readDataSubset$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
  
  ##saving the histogram in png format
  
  dev.copy(png, file="plot1.png")
  dev.off()
}
