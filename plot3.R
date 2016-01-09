
directory <- "C:/DataScience/CourseraProjects/ExData_Plotting1/"
plot3 <- function()
{
        ##read the file
        hhpc <- read.table(file.path(directory, "household_power_consumption.txt"), sep = ";", colClasses = "character", header = TRUE)
        
        ##subset required records 
        hhpc = hhpc[hhpc$Date %in% c("1/2/2007", "2/2/2007"), ]

        ## set all ? to NA
        hhpc[hhpc == "?"] <- NA
        
        #Get Graph Parmeter
        Sub_metering_1 <- as.numeric(hhpc$Sub_metering_1)
        Sub_metering_2 <- as.numeric(hhpc$Sub_metering_2)
        Sub_metering_3 <- as.numeric(hhpc$Sub_metering_3)
        datedays <- as.POSIXct(strptime(paste(hhpc$Date,hhpc$Time), "%d/%m/%Y %H:%M:%S"))

        #Plot the Graph
        plot(datedays, Sub_metering_1, type= "l", xlab = "", col= "black", ylab = "Energy sub metering")
        lines(datedays, Sub_metering_2, col="red")
        lines(datedays, Sub_metering_3, col="blue")
        
        legend("topright",  lty = 1, col = c("black", "blue", "red"), legend =  c("Sub_metering_1","Sub_metering_3","Sub_metering_3"))
        
        #save to file
        dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")
        dev.off()
}