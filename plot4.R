#read data
d.train<-read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, comment.char = "")

#add date column
d.train$Date <- as.POSIXlt((strptime(paste(d.train$V1,d.train$V2), "%d/%m/%Y %H:%M:%S")))

#relevant dates which determine the subset of data for Feb 01, feb 02
startDate = as.Date("2007-02-01", tz="America/Los_Angeles")
endDate = as.Date("2007-02-02", tz="America/Los_Angeles")

#now subset for Feb 1-2, 2007
sub<-subset(d.train, as.Date(d.train$Date) == startDate | as.Date(d.train$Date) == endDate)

par(mfrow=c(2,2))

## Create Line Chart
plot(as.POSIXlt(sub$Date), as.numeric(sub$V3), type='l',ylab="Global Active Power", xlab="")

## Create Line Chart
plot(as.POSIXlt(sub$Date), as.numeric(sub$V5), type='l',ylab="Voltage", xlab="datetime")


# Create Line Chart
plot(as.POSIXlt(sub$Date), as.numeric(sub$V7), type='l',ylab="Energy Sub Metereing", xlab="")
lines(as.POSIXlt(sub$Date), as.numeric(sub$V8), type='l',col='red')
lines(as.POSIXlt(sub$Date), as.numeric(sub$V9), type='l',col='blue')

## Create Line Chart
plot(as.POSIXlt(sub$Date), as.numeric(sub$V4), type='l',ylab="Global_Reactive_Power", xlab="datetime")
