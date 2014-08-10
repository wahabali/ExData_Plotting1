source("preprocess.R") #comment this line if data preprocessing is  done

plot2 <- function()
{
  xrange = range(edataSub$Datetime)
  yrange = range(edataSub$Global_active_power)
  plot(xrange,yrange,ylim= c(0,7), type='n', ylab="Global Active Power (kilowatts)",xlab="",cex.lab=.7, cex.axis=0.7)
  with(edataSub, lines(Datetime,Global_active_power))
}
plot3 <- function()
{
  
  ymax = max(max(edataSub$Sub_metering_1), max(edataSub$Sub_metering_2), max(edataSub$Sub_metering_2))
  xrange = range(edataSub$Datetime)
  
  y1range = range(edataSub$Sub_metering_1)
  y2range =  range(edataSub$Sub_metering_2)
  y3range =  range(edataSub$Sub_metering_3)
  yrange = range(y1range, y2range, y3range)
  
  plot(xrange,yrange, type='n', ylab="Energy by sub metering",xlab="",cex.lab=.7, cex.axis=0.7)
  with(edataSub, lines(Datetime,Sub_metering_1,col="black"))
  with(edataSub, lines(Datetime,Sub_metering_2,col="red"))
  with(edataSub, lines(Datetime,Sub_metering_3,col="blue"))
  
  legend("topright", # places a legend at the appropriate place
         c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), # puts text in the legend 
         lty=c(1,1,1), # gives the legend appropriate symbols (lines)
         #lwd=c(2.5,2.5),
         col= c("black", "red", "blue"),
         cex=0.6,
         bty="n",
         xjust=0.7,
         yjust=0,
         y.intersp=0.5) # gives the legend lines the correct color and width
  
}

plotVoltage <- function(){
  xrange = range(edataSub$Datetime)
  yrange = range(edataSub$Voltage)
  plot(xrange,yrange, type='n', ylab="Volate",xlab="datetime",cex.lab=.7, cex.axis=0.7)
  with(edataSub, lines(Datetime,Voltage))
}

plotGlobalReactivePower <- function(){
  xrange = range(edataSub$Datetime)
  yrange = range(edataSub$Global_reactive_power)
  plot(xrange,yrange, type='n', ylab="Global_reactive_power",xlab="datetime",cex.lab=.7, cex.axis=0.7)
  with(edataSub, lines(Datetime,Global_reactive_power))
}




par(mfcol = c(2, 2))
par(mar=c(4,5,1,1))
plot2()
plot3()
plotVoltage()
plotGlobalReactivePower()


dev.copy(png,file="plot4.png")
dev.off()
par(mfcol = c(1, 1))