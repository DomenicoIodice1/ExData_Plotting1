#plot4

hh_pow_cons<-read.table("household_power_consumption.txt",skip=1,sep=";")
names(hh_pow_cons)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_Intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
hh_pow_cons<-subset(hh_pow_cons,hh_pow_cons$Date=="1/2/2007"|hh_pow_cons$Date=="2/2/2007")
hh_pow_cons$Date<-as.Date(hh_pow_cons$Date,format="%d/%m/%Y")
hh_pow_cons$Time<-strptime(hh_pow_cons$Time,format="%H:%M:%S")
hh_pow_cons[1:1440,"Time"]<-format(hh_pow_cons[1:1440,"Time"],"2007-02-01 %H:%M:%S")
hh_pow_cons[1441:2880,"Time"]<-format(hh_pow_cons[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with(hh_pow_cons,{
  plot(hh_pow_cons$Time,as.numeric(as.character(hh_pow_cons$Global_active_power)),type="l",xlab="",ylab="Global Active Power")
  plot(hh_pow_cons$Time,as.numeric(as.character(hh_pow_cons$Voltage)),type="l",xlab="datetime",ylab="Voltage")
  plot(hh_pow_cons$Time,hh_pow_cons$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(hh_pow_cons,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(hh_pow_cons,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(hh_pow_cons,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
  plot(hh_pow_cons$Time,as.numeric(as.character(hh_pow_cons$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})  
dev.off() 