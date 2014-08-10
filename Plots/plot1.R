source("preprocess.R") #uncomment this line if data preprocessing is not done
hist(edataSub$Global_active_power, col="red", xlab = "Global Active Power (killowatts)", main="Global Active Power", ylim = c(0,1200),cex.lab=.7, cex.axis=0.7)
dev.copy(png,file="plot1.png")
dev.off()

