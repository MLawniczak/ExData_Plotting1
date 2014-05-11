plot1 <- function() {
    
    library(datasets)
    
    ## Read data
    edata <- read.table("../household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
    
    ## Select specific days
    sdata <- edata[as.character(edata$Date) %in% c("1/2/2007", "2/2/2007"),]
 
    png(filename="plot1.png", width=480, height=480, units="px")
    
    ## Create the graph
    hist(sdata$Global_active_power, main="Global Active Power", col="red", 
         xlab="Global Active Power (kilowatts)")
    
    dev.off()
    
}