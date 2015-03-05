# This program start with the premises that the necessary files 
# have been downloaded from https://d396qusza40orc.cloudfront.net/
# exdata%2Fdata%2Fhousehold_power_consumption.ziphave and have been 
# saved in the proper working directory".  The first 20 lines of codes
# attempts to do that for you.

setwd("C:/Users/Owner/Desktop/ExploreData/Course_Project_One")

# Checks for the directory the files that will be downloaded into
if(!file.exists("Course_Project_One")){
  message("Creating Temp_Project File")
  dir.create("Course_Project_One")
}
# Checks to see if the Dataset has been downloaded and unzipped
if(!file.exists("Course_Project_One/household_power_consumption.txt")){
  file_URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  zipfile <- "Course_Project_One/household_power_consumption.zip"
  download.file(file_URL, destfile=zipfile)
  unzip(zipfile, exdir="Course_Project_One")
}
# Checks to see if data.table and dplyr are loaded and if not loads
# and/or installs 
if(!require(data.table)){
  install.packages("data.table")
  library(data.table)
}

# I looked at the data in a text editor and found the relevant data and
# set nrows to 70000 to speed up read.table()
hpc <-read.table("household_power_consumption.txt"
                 ,header=TRUE
                 ,na.strings="?"
                 ,sep=";",
                 ,nrows= 70000)   

#formats Date Variable
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

#Brutally subsets the data like a boss
hpc_subset <- (hpc[c(66638:69517),])

##################################################################
#  Plot 1
##################################################################

# Creates a blank png file
png(filename = "C:/Users/Owner/Desktop/ExData_Plotting1/plot1.png", width = 480, height = 480)

# Creates a histogram for Global_active_power in the blank png file.
hist(hpc_subset$Global_active_power, col = "red", main='Global Active Power',
     xlab='Global Active Power (kilowatts)', ylim= c(0, 1200))

dev.off()