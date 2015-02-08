
mydata<- read.table(file="./household_power_consumption.txt",sep=";",skip=66637,nrows=2880, 
  colClasses=c(rep("character",2),rep("numeric",7)),
  col.names= c( "Date", "Time","Global_active_power","Global_reactive_power","Voltage",
               "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

thesedates<- as.Date(mydata$Date,"%d/%m/%Y")
datetime<- strptime(paste(mydata$Date,mydata$Time), format= "%d/%m/%Y %H:%M:%S", tz="GMT")
plot1<- hist(mydata$Global_active_power,col="red",main="Global Active Power",
             xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()