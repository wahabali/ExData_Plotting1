
colTypes = c("character","character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric")
edata = read.csv("Data//household_power_consumption.txt",header=TRUE,sep=";",colClasses=colTypes, skipNul= TRUE,na.strings="?")
edata <- within(edata, Datetime <- as.POSIXlt(paste(Date, Time),
                                              format = "%d/%m/%Y %H:%M:%S"))

minDate = strptime("20070201 00:00:01","%Y%m%d %H:%M:%S")
maxDate = strptime("20070202 23:59:59","%Y%m%d %H:%M:%S")
edataSub = subset(edata,edata$Datetime >= minDate & edata$Datetime <= maxDate)
