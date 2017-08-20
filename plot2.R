#plot2

hh_pow_cons<-read.table("household_power_consumption.txt",skip=1,sep=";")
names(hh_pow_cons)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_Intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
hh_pow_cons<-subset(hh_pow_cons,hh_pow_cons$Date=="1/2/2007"|hh_pow_cons$Date=="2/2/2007")
hh_pow_cons$Date<-as.Date(hh_pow_cons$Date,format="%d/%m/%Y")
hh_pow_cons$Time<-strptime(hh_pow_cons$Time,format="%H:%M:%S")
hh_pow_cons[1:1440,"Time"]<-format(hh_pow_cons[1:1440,"Time"],"2007-02-01 %H:%M:%S")
hh_pow_cons[1441:2880,"Time"]<-format(hh_pow_cons[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
png("plot2.png",width=480,height=480)
plot(hh_pow_cons$Time,as.numeric(as.character(hh_pow_cons$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
