plot2 <- function() {
    
    library(datasets)
    
    ## Read data
    edata <- as.data.frame(read.table("../household_power_consumption.txt", 
                                      header=TRUE, sep=";", na.strings="?", as.is=TRUE))
    
    ## Select specific days
    sdata <- edata[as.character(edata$Date) %in% c("1/2/2007", "2/2/2007"),]
    dt <- paste(sdata$Date, sdata$Time)
    sdata$datetime <- strptime(dt, "%d/%m/%Y %H:%M:%S")
    
    
    png(filename="plot2.png", width=480, height=480, units="px")
    
    ## Create the graph
    with(sdata, plot(datetime, Global_active_power, 
                     xlab="", ylab="Global Avtive Power (kilowatts)", type="l"))
    
    dev.off()
    
}