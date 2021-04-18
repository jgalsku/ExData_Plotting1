library(lubridate)

#set working directory
setwd("C:/Users/yo/Dropbox/coursera/Exploratory_Data_Analysis/exdata_data_household_power_consumption/ExData_Plotting1")

#load data
hpc <- read.table("./household_power_consumption.txt", sep = ";", na.strings = "?")

#set names of columns and eliminate first row originally read as header
names(hpc) <- hpc[1,]
hpc <- hpc[-1,]

#change class of variable Date to as.date
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

#change class to numeric in columns 3 through 9   
hpc[,c(3:9)] = apply(hpc[,c(3:9)], 2, function(x) as.numeric(as.character(x)));
str(hpc)

#subset data to only include two days: 2007-02-01 & 2007-02-02
hpc <- subset(hpc, Date >= "2007-02-01" & Date <= "2007-02-02")

#create datetime variable
hpc$datetime <- paste(hpc$Date, hpc$Time, sep = " ")
hpc$datetime <- ymd_hms(hpc$datetime)



#plot 1
png(filename = "plot1.png", width = 480, height = 480)
hist(hpc$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()
