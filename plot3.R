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
png("plot3.png",width=480,height=480)
ggplotObject<-ggplot(baltimoreData,aes(factor(year),Emissions,fill=type))+xlab("Year")+ylab("log of PM2.5 emission")+ggtitle("PM2.5 Emission from 1999 to 2008 ny Source type")+geom_bar(stat="identity")+labs(fill="Type")+facet_grid(.~type)
dev.off()