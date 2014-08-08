#read data
d.train<-read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, comment.char = "")

#add date column
d.train$Date <- as.POSIXlt((strptime(paste(d.train$V1,d.train$V2), "%d/%m/%Y %H:%M:%S")))

#relevant dates which determine the subset of data for Feb 01, feb 02
startDate = as.Date("2007-02-01", tz="America/Los_Angeles")
endDate = as.Date("2007-02-02", tz="America/Los_Angeles")

#now subset for Feb 1-2, 2007
sub<-subset(d.train, as.Date(d.train$Date) == startDate | as.Date(d.train$Date) == endDate)

# Create Line Chart
plot(as.POSIXlt(sub$Date), as.numeric(sub$V3), type='l',ylab="Global Active Power (kilowatts)", xlab="")