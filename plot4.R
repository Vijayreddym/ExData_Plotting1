


directory <- "C:/DataScience/CourseraProjects/ExData_Plotting1/"

plot4 <- function()
{
        ##read the file
        hhpc <- read.table(file.path(directory, "household_power_consumption.txt"), sep = ";", colClasses = "character", header = TRUE)
        
        ##subset required records 
        hhpc = hhpc[hhpc$Date %in% c("1/2/2007", "2/2/2007"), ]
        
        ## set all ? to NA
        hhpc[hhpc == "?"] <- NA
        
        Global_active_power <- as.numeric(hhpc$Global_active_power)
        datedays <- as.POSIXct(strptime(paste(hhpc$Date,hhpc$Time), "%d/%m/%Y %H:%M:%S"))
        par(mfrow = c (2,2), mar= c(4,4,2,1))
        

         #1
         datedays <- as.POSIXct(strptime(paste(hhpc$Date,hhpc$Time), "%d/%m/%Y %H:%M:%S"))
         plot(datedays, Global_active_power, type= "l", xlab = "", ylab = "Global active power (kilowatts)")
         
         #2
         datedays <- as.POSIXct(strptime(paste(hhpc$Date,hhpc$Time), "%d/%m/%Y %H:%M:%S"))
         plot(datedays, as.numeric(hhpc$Voltage), type= "l", xlab = "", ylab = "Voltage")

         #3
         Sub_metering_1 <- as.numeric(hhpc$Sub_metering_1)
         Sub_metering_2 <- as.numeric(hhpc$Sub_metering_2)
         Sub_metering_3 <- as.numeric(hhpc$Sub_metering_3)
         plot(datedays, Sub_metering_1, type= "l", xlab = "", col= "black", ylab = "Energy sub metering")
         lines(datedays, Sub_metering_2, col="red")
         lines(datedays, Sub_metering_3, col="blue")
         legend("topright",  lty = 1, col = c("black", "blue", "red"), legend =  c("Sub_metering_1","Sub_metering_3","Sub_metering_3"))
         
         #4
         datedays <- as.POSIXct(strptime(paste(hhpc$Date,hhpc$Time), "%d/%m/%Y %H:%M:%S"))
         plot(datedays, as.numeric(hhpc$Global_reactive_power), type= "l", xlab = "datatime", ylab = "Global_reactive_power")
        
        dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")
        
        dev.off()
}