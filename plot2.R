#setting the desired working directory
setwd( "C:/Users/Utkarsh/Desktop/gcdata/edaFinal")
#checking if the required files exist
dir()
#initialization
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimoreData<-NEI[NEI$fips==24510,]
head(baltimoreData)
aggBaltimoreData<-aggregate(Emissions~year,baltimoreData,sum)
png("plot2.png",width=480,height=480)
#creating the barplot
barplot(aggBaltimoreData$Emissions,names.arg=aggBaltimoreData$year,main="PM2.5 Emission in Baltimore",xlab="Year",ylab="PM2.5 Emission in tons")
dev.off()