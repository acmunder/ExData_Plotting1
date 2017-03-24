plot3 <- function(){
        
        #load dataset which should be located in working directory
        data <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
        
        #change date variable into class
        data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
        
        #make new column with data + time combined
        data$dateandtime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

        #extract required subset of data
        datasubset <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
        
        
        #create plot
        plot(datasubset$dateandtime, datasubset$Sub_metering_1,type = "l", xlab="",ylab = "Energy sub metering")
        lines(datasubset$dateandtime, datasubset$Sub_metering_2,col="red")
        lines(datasubset$dateandtime, datasubset$Sub_metering_3,col="blue")
        legend("topright",cex=0.8, lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        
        #copy plot into .png file
        dev.copy(png, file="plot3.png", height = 480, width = 480)
        dev.off()
        
}