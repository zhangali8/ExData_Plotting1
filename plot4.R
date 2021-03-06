setwd("~/Desktop/coursera/Explorassign1")
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
powerconsumption.zip<-download.file(url,"powerconsumption.zip")
powerconsumption<-unzip("powerconsumption.zip",exdir="./Explorassign1")
powerplot<-read.table(powerconsumption,header=T,sep=";",na.strings = "?")
powerplotdata<-powerplot[powerplot$Date %in% c("1/2/2007","2/2/2007"),]
powerplotdate<-as.Date(powerplotdata$Date,format="%d/%m/%Y")
powerplotall<-cbind(powerplotdata,"DateTime"=as.POSIXct(paste(powerplotdate,powerplotdata$Time)))
png(file="plot4.png")
par(mfrow=c(2,2))
plot(powerplotall$DateTime,powerplotall$Global_active_power,type="l",xlab="",ylab="Global Active power(kilowatt)")
plot(powerplotall$DateTime,powerplotall$Voltage,type="l",xlab="datetime",ylab="Voltage")

with(powerplotall,plot(DateTime,Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering"))
lines(powerplotall$Sub_metering_2 ~ powerplotall$DateTime, col = 'Red')
lines(powerplotall$Sub_metering_3 ~ powerplotall$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(powerplotall$DateTime,powerplotall$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()