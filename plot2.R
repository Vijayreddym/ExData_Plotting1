
directory <- "C:/DataScience/CourseraProjects/ExData_Plotting1/"
plot2 <- function()
{
        ##read the file
        hhpc <- read.table(file.path(directory, "household_power_consumption.txt"), sep = ";", colClasses = "character", header = TRUE)
        
        ##subset required records 
        hhpc = hhpc[hhpc$Date %in% c("1/2/2007", "2/2/2007"), ]
        
        ## set all ? to NA
        hhpc[hhpc == "?"] <- NA
        
        #Get Graph Parmeter
        Global_active_power <- as.numeric(hhpc$Global_active_power)
        datedays <- as.POSIXct(strptime(paste(hhpc$Date,hhpc$Time), "%d/%m/%Y %H:%M:%S"))
        
        #Plot the Graph
        plot(datedays, Global_active_power, type= "l", xlab = "", ylab = "Global active power (kilowatts)")
        
        #save to file
        dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
        dev.off()
}