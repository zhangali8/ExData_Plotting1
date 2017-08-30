setwd("~/Desktop/coursera/Explorassign1")
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
powerconsumption.zip<-download.file(url,"powerconsumption.zip")
powerconsumption<-unzip("powerconsumption.zip",exdir="./Explorassign1")
powerplot<-read.table(powerconsumption,header=T,sep=";",na.strings = "?")
powerplotdata<-powerplot[powerplot$Date %in% c("1/2/2007","2/2/2007"),]
powerplotdate<-as.Date(powerplotdata$Date,format="%d/%m/%Y")
powerplotall<-cbind(powerplotdata,"DateTime"=as.POSIXct(paste(powerplotdate,powerplotdata$Time)))

png(file="plot1.png")
hist(powerplotall$Global_active_power,col="red",main="Global Active Power",xlab="Global Active power(kilowatts)",ylab="Frequency")
dev.off()
