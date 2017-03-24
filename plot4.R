plot4 <- function(){
        
        #load dataset which should be located in working directory
        data <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
        
        #change date variable into class
        data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
        
        #make new column with data + time combined
        data$dateandtime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
        
        #extract required subset of data
        datasubset <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
        
        
        #create plots
        par(mfrow = c(2, 2))
        
        plot(datasubset$dateandtime, datasubset$Global_active_power,type = "l", xlab="",ylab = "Global active power")
        
        plot(datasubset$dateandtime, datasubset$Voltage,type="l",xlab="datetime",ylab = "Voltage" )
        
        plot(datasubset$dateandtime, datasubset$Sub_metering_1,type = "l", xlab="",ylab = "Energy sub metering")
        lines(datasubset$dateandtime, datasubset$Sub_metering_2,col="red")
        lines(datasubset$dateandtime, datasubset$Sub_metering_3,col="blue")
        legend("topright", cex=0.8,lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
        
        plot(datasubset$dateandtime, datasubset$Global_reactive_power,type = "l", xlab="datetime",ylab = "Global_reactive_power")
        
        #copy plot into .png file; note that the screen with the plots has to 
        #have roughly the right dimension for the output file to look right
        dev.copy(png, file="plot4.png", height = 480, width = 480)
        dev.off()
        
}