plot4 <- function() {
    
    library(datasets)
    
    ## Read data
    edata <- as.data.frame(read.table("../household_power_consumption.txt", 
                                      header=TRUE, sep=";", na.strings="?", as.is=TRUE))
    
    ## Select specific days
    sdata <- edata[as.character(edata$Date) %in% c("1/2/2007", "2/2/2007"),]
    dt <- paste(sdata$Date, sdata$Time)
    sdata$datetime <- strptime(dt, "%d/%m/%Y %H:%M:%S")
    
    
    png(filename="plot4.png", width=480, height=480, units="px")
    
    ## Create the graph
    par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
    
    with(sdata, {
        plot(datetime, Global_active_power, xlab="", ylab="Global Avtive Power", type="l")
        plot(datetime, Voltage, type="l")
        plot(datetime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
        lines(datetime, Sub_metering_2, type="l", col="red")
        lines(datetime, Sub_metering_3, type="l", col="blue")                     
        legend("topright", lwd = 1, lty = 1, bty="n", col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(datetime, Global_reactive_power, type="l")
    })
    
    dev.off()
    
}