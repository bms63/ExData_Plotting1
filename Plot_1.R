setwd("C:/Users/Owner/Desktop/ExploreData/Course_Project_One")
library(data.table)

hpc <-read.table("household_power_consumption.txt"
                 ,header=TRUE
                 ,na.strings="?"
                 ,sep=";",
                 ,nrows= 70000)   

#formats Date Variable
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

#Brutally subsets the data
hpc_subset <- (hpc[c(66638:69517),])

##################################################################
#  Plot 1
##################################################################

#View(hpc_subset)

hist(hpc_subset$Global_active_power, col = "red", main='Global Active Power',
     xlab='Global Active Power (kilowatts)', ylim= c(0, 1200))