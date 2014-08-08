#setwd("C:\\Users\\I013285\\Documents\\Amit\\CourseraR\\Project1")

#read data
d.train<-read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, comment.char = "")

#add date column
d.train$Date <- as.Date(as.POSIXct(strptime(paste(d.train$V1,d.train$V2), "%d/%m/%Y %H:%M:%S")), tz="America/Los_Angeles")

#relevant dates which determine the subset of data for Feb 01, feb 02
startDate = as.Date("2007-02-01")
endDate = as.Date("2007-02-02")
#now subset for Feb 1-2, 2007
sub<-subset(d.train, d.train$Date == startDate | d.train$Date == endDate)

#histogram
hist(as.numeric(sub$V3), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
