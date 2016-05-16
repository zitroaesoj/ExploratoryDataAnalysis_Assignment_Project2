## libraries used
library(ggplot2)

## my working directoy
setwd("H:/Dropbox/__GitHub/ExploratoryDataAnalysis_Assignment_Project2/")

## set url of zip file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

## set localzip name 
localzip <- "pm25EmissionsAndClassificationCodeTable.zip"

## download zip and save it as localzip
download.file(url, destfile = localzip)

## unzip
unzip(localzip)

## set localfile names
localfile1 <- "summarySCC_PM25.rds"
localfile2 <- "Source_Classification_Code.rds"

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS(localfile1)
SCC <- readRDS(localfile2)

## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 

## PLOT 6
## subset baltimore (fips=24510) and los angeles (fips=06037)
BaltimoreNEI <- subset(NEI, fips=="24510")
BaltimoreNEI$City <- "Baltimore City"
LosAngelesNEI <- subset(NEI, fips=="06037")
LosAngelesNEI$City <- "Los Angeles County"
CompareCitiesNEI <- rbind(BaltimoreNEI,LosAngelesNEI)

## subset Vehicle combustion
Vehicle <- grepl("Vehicle", SCC$SCC.Level.Two, ignore.case=TRUE) 
VehicleSCC <- SCC[Vehicle,]$SCC
CompareCitiesVehicleNEI <- CompareCitiesNEI[CompareCitiesNEI$SCC %in% VehicleSCC,]

CompareCitiesVehiclePlot <- ggplot(CompareCitiesVehicleNEI, aes(factor(year), Emissions/1000.0, fill=City)) + 
	geom_bar(stat="identity") + 
	facet_grid(.~City) + 
	labs(x="Year", y="Total PM2.5 Emissions (1,000 ton)", title="Vehicle Total PM2.5 Emissions (1,000 ton) by City / Year")

print(CompareCitiesVehiclePlot)

## copy to png file as plot6.png set height and width
dev.copy(png, file="plot6.png", height=600, width=800)

## make sure to close file
dev.off()
## PLOT 6

## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 
