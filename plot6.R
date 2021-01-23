library(ggplot2)
#setting the desired working directory
setwd( "C:/Users/Utkarsh/Desktop/gcdata/edaFinal")
#checking if the required files exist
dir()
#initialization
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
vehicles<-grepl("vehicle",SCC$SCC.Level.Two,ignore.case = TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
baltimoreNEIVehicles <- vehiclesNEI[vehiclesNEI$fips=="24510",]
baltimoreNEIVehicles$city<-"Baltimore"
laNEIVehicles<-vehiclesNEI[vehiclesNEI$fips=="06037",]
laNEIVehicles$city<-"Los Angeles"
png("plot6.png",width=480,height=480)
baltimoreLA<-rbind(baltimoreNEIVehicles,laNEIVehicles)
ggpObj<-ggplot(baltimoreLA,aes(x=factor(year),y=Emissions,fill=city))+geom_bar(stat="identity",aes(fill=year),width=0.5) + theme_bw() + guides(fill=FALSE)+xlab("Year")+ylab("Total PM2.5 Emissions")+ ggtitle("PM2.5 Emissions in Baltimore and LA between 1999 and 2008 ") +facet_grid(.~city)
dev.off()