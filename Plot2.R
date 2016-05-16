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

## PLOT 2
## subset baltimore (fips=24510)
BaltimoreNEI <- subset(NEI, fips=="24510")

## Sum Emisions by Year
BaltimoreSumPM25byYear <- tapply(BaltimoreNEI$Emissions/1000.0, BaltimoreNEI$year, sum)

## create plot
plot(names(BaltimoreSumPM25byYear), BaltimoreSumPM25byYear, type="b", xlab = "Year", ylab = "Total PM2.5 Emissions (1,000 ton)", main = "Baltimore Total PM2.5 Emissions (1,000 ton) by Year")

## copy to png file as plot2.png set height and width
dev.copy(png, file="plot2.png", height=600, width=800)

## make sure to close file
dev.off()
## PLOT 2

## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 