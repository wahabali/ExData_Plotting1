source("preprocess.R") #comment this line if data preprocessing is  done
xrange = range(edataSub$Datetime)
yrange = range(edataSub$Global_active_power)
plot(xrange,yrange, type='n', ylab="Global Active Power (kilowatts)",xlab="",cex.lab=.7, cex.axis=0.7)
with(edataSub, lines(Datetime,Global_active_power))
dev.copy(png,file="plot2.png")
dev.off()