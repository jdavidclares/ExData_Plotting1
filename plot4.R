#Getting the data
data <- read.table('household_power_consumption.txt', sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
data$Date <- strptime(data$Date, format="%d/%m/%Y")

#Subsetting the data 
data_red <- subset(data, (Date==strptime("01/02/2007", format="%d/%m/%Y"))|(Date==strptime("02/02/2007", format="%d/%m/%Y")))

data_red$CompleteDate <- strptime(paste(as.Date(data_red$Date), data_red$Time), format= "%Y-%m-%d %H:%M:%S")

Sys.setlocale("LC_TIME", "English") #To have dates in English

#Plotting the data
png('plot4.png',height=470,width=470 )
par(mfrow=c(2,2))
#Graph1
with(data_red,plot(CompleteDate,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
#Graph2
with(data_red,plot(CompleteDate,Voltage, type="l", xlab="datetime", ylab="Voltage"))
#Graph3
with(data_red,plot(CompleteDate,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data_red,lines(CompleteDate,Sub_metering_2,col="red"))
with(data_red,lines(CompleteDate,Sub_metering_3,col="blue"))
legend(x="topright",y=5, legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),bty="n", lty=c(1,1,1), col=c("black","red","blue"))
#Graph4
with(data_red,plot(CompleteDate,Global_reactive_power, type="l", xlab="datetime", yaxt="n"))
axis(2,at=seq(0.0,0.5,0.1))
dev.off()