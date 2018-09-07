#Getting the data
data <- read.table('household_power_consumption.txt', sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
data$Date <- strptime(data$Date, format="%d/%m/%Y")

#Subsetting the data 
data_red <- subset(data, (Date==strptime("01/02/2007", format="%d/%m/%Y"))|(Date==strptime("02/02/2007", format="%d/%m/%Y")))

data_red$CompleteDate <- strptime(paste(as.Date(data_red$Date), data_red$Time), format= "%Y-%m-%d %H:%M:%S")

Sys.setlocale("LC_TIME", "English") #To have dates in English

#Plotting the data
png('plot2.png',height=470,width=470 )
with(data_red,plot(CompleteDate,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()