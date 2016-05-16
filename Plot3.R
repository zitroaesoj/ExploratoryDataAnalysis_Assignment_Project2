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

## PLOT 3
## subset baltimore (fips=24510)
BaltimoreNEI <- subset(NEI, fips=="24510")

BaltimorePlot <- ggplot(BaltimoreNEI, aes(factor(year), Emissions/1000.0, fill=type)) + 
	geom_bar(stat="identity") + 
	facet_grid(.~type) + 
	labs(x="Year", y="Total PM2.5 Emissions (1,000 ton)", title="Baltimore Total PM2.5 Emissions (1,000 ton) by Source / Year")
	
print(BaltimorePlot)

## copy to png file as plot3.png set height and width
dev.copy(png, file="plot3.png", height=600, width=800)

## make sure to close file
dev.off()
## PLOT 3

## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 