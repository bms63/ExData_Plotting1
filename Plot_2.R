# This program start with the premises that the necessary files 
# have been downloaded from https://d396qusza40orc.cloudfront.net/
# exdata%2Fdata%2Fhousehold_power_consumption.zip andhave and have been 
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
# Checks to see if data.table is loaded and if not loads
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
                 ,sep=";"
                 ,nrows= 70000)   

# Formats Date Variable
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

# Brutally subsets the data
hpc_subset <- (hpc[c(66638:69517),])

##################################################################
#  Plot 2
##################################################################

# Makes another variable called date_time to be used for Plot2
hpc_subset <- transform(hpc_subset, 
            date_time=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

# Creates a blank png file in the git repository on local pc
png(filename = "C:/Users/Owner/Desktop/ExData_Plotting1/plot2.png", width = 480, height = 480)

# Creates a line graph with date_time as input and G_a_p as output for the 
# blank png file.
plot(hpc_subset$date_time, hpc_subset$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
