#setting the desired working directory
setwd( "C:/Users/Utkarsh/Desktop/gcdata/edaFinal")
#checking if the required files exist
dir()
#initialization
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
agg<-aggregate(Emissions~year,NEI,sum)
#making emissions data more readable by experessing in Millions
agg$Emissions <-(agg$Emissions)/10^6
png("plot1.png",width=480,height=480)
#creating the barplot
barplot(agg$Emissions,names.arg=agg$year,main="PM2.5 Emissions in US",xlab="Year",ylab="PM2.5 Emissions in a Million Ton")
dev.off()