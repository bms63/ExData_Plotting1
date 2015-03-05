setwd("C:/Users/Owner/Desktop/ExploreData/Course_Project_One")
library(data.table)

hpc <-read.table("household_power_consumption.txt"
                 ,header=TRUE
                 ,na.strings="?"
                 ,sep=";"
                 ,nrows= 70000)   

#formats Date Variable
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

#Brutally subsets the data
hpc_subset <- (hpc[c(66638:69517),])

hpc_subset <- transform(hpc_subset, date_time=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")


par(mfrow = c(2, 2))

#plot (1,1)
plot(hpc_subset$date_time, hpc_subset$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")


#plot (1, 2)
plot(hpc_subset$date_time, hpc_subset$Voltage,  type="l", 
     col="black", xlab = '', ylab = 'Voltage')


#plot (2, 1)
plot(hpc_subset$date_time, hpc_subset$Sub_metering_1,  type="l", 
     col="black", xlab = '', ylab = 'Energy sub metering')
lines(hpc_subset$date_time, hpc_subset$Sub_metering_2, type="l", 
      col="red")
lines(hpc_subset$date_time, hpc_subset$Sub_metering_3, type="l", 
      col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1", 
      "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(1,1), 
       cex = 0.6)

#plot (2, 2)
plot(hpc_subset$date_time, hpc_subset$Global_reactive_power,  type="l", 
     col="black")





