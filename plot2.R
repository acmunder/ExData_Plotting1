plot2 <- function(){
        
        #load dataset which should be located in working directory
        data <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
        
        #change date variable into class
        data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
        
        #make new column with data + time combined
        data$dateandtime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

        #extract required subset of data
        datasubset <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
        
        
        #create plot
        plot(datasubset$dateandtime, datasubset$Global_active_power,type = "l", xlab="",ylab = "Global Active Power (kilowatts)")
        
        #copy plot into .png file
        dev.copy(png, file="plot2.png", height = 480, width = 480)
        dev.off()
        
}