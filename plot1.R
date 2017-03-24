plot1 <- function(){

#load dataset which should be located in working directory
data <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

#change date variable into class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")


#extract required subset of data
datasubset <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))


#create plot
hist(datasubset$Global_active_power,col="red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main ="Global Active Power")

#copy plot into .png file
dev.copy(png, file="plot1.png", height = 480, width = 480)
dev.off()

}