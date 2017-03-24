##Plot 2
###See get_nei_data.R for read-in of data
###Run from main.R

if(!exists('NEI')) {
    source('get_nei_data.R')
}

###Subset and summarize data
NEI_baltimore <- NEI[NEI$fips == '24510',]
summed <- aggregate(NEI_baltimore$Emissions, by=list(NEI_baltimore$year), FUN=sum, na.rm=TRUE)

###Plot summary
png("plot2.png", width=480, height=480)
plot(summed[,1], summed[,2], type='b', 
     xlab='Year', ylab='Total emissions',
     main='Total emissions by year')
dev.off()

