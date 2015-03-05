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


##################################################################
#  Plot 2
##################################################################
#hpc_subset <- hpc_subset$Time=as.POSIXct(hpc_subset[,3], format="%y/%m/%d %H:%M:%S")  

#ggplot(hpc_subset, aes(Time, Global_active_power)) + geom_line() + theme(aspect.ratio = 3/4)

#makes another variable to be used for Plot2
hpc_subset <- transform(hpc_subset, date_time=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

plot(hpc_subset$date_time, hpc_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
