plot3 <- function() {
    
    library(datasets)
    
    ## Read data
    edata <- as.data.frame(read.table("../household_power_consumption.txt", 
                                      header=TRUE, sep=";", na.strings="?", as.is=TRUE))
    
    ## Select specific days
    sdata <- edata[as.character(edata$Date) %in% c("1/2/2007", "2/2/2007"),]
    dt <- paste(sdata$Date, sdata$Time)
    sdata$datetime <- strptime(dt, "%d/%m/%Y %H:%M:%S")
    
    
    png(filename="plot3.png", width=480, height=480, units="px")
    
    ## Create the graph
    with(sdata, plot(datetime, Sub_metering_1,
                     xlab="", ylab="Energy sub metering", type="l"))        
    with(sdata, lines(datetime, Sub_metering_2, type="l", col="red"))
    with(sdata, lines(datetime, Sub_metering_3, type="l", col="blue"))
    
    legend("topright", lwd = 1, lty = 1, col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    dev.off()
    
}