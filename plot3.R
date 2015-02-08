mydata<- read.table(file="./household_power_consumption.txt",sep=";",skip=66637,nrows=2880, 
                    colClasses=c(rep("character",2),rep("numeric",7)),
                    col.names= c( "Date", "Time","Global_active_power","Global_reactive_power","Voltage",
                                  "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

thesedates<- as.Date(mydata$Date,"%d/%m/%Y")
datetime<- strptime(paste(mydata$Date,mydata$Time), format= "%d/%m/%Y %H:%M:%S", tz="GMT")
plot3<- plot(datetime, mydata$Sub_metering_1,xlab="",ylab="Energy sub metering", type="l") 
lines(datetime,mydata$Sub_metering_2, col="red")
lines(datetime,mydata$Sub_metering_3, col="blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,
       col=c("black","red","blue"),cex=0.4,y.intersp=.25, yjust=1)
dev.copy(png,file="plot3.png")
dev.off()