
##Download and import data file
download.file(url='https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip', destfile='nei_data.zip')
unzip('nei_data.zip')
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')
