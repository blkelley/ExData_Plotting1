mydata<- read.table(file="./household_power_consumption.txt",sep=";",skip=66637,nrows=2880, 
                    colClasses=c(rep("character",2),rep("numeric",7)),
                    col.names= c( "Date", "Time","Global_active_power","Global_reactive_power","Voltage",
                                  "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

thesedates<- as.Date(mydata$Date,"%d/%m/%Y")
datetime<- strptime(paste(mydata$Date,mydata$Time), format= "%d/%m/%Y %H:%M:%S", tz="GMT")

par(mfrow= c(2,2), mar= c(4,4,2,1), oma= c(0,0,2,0))
plot4<- {
        plot(datetime, mydata$Global_active_power,ylab="Global Active Power", type="l")
        plot(datetime, mydata$Voltage,ylab="Voltage", type="l")
        plot(datetime, mydata$Sub_metering_1,xlab="",ylab="Energy sub metering", type="l") 
        lines(datetime,mydata$Sub_metering_2, col="red")
        lines(datetime,mydata$Sub_metering_3, col="blue")
        legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,
               col=c("black","red","blue"),cex=0.3,y.intersp=.25, yjust=0)
        plot(datetime,mydata$Global_reactive_power,ylab="Global_reactive_power", type="l")
        }
dev.copy(png,file="plot4.png")
dev.off()