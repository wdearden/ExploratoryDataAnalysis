
##Plot 1
###See get_nei_data.R for read-in of data
###Run from main.R

###Subset and summarize data
NEI_yearsubset <- NEI[NEI$year %in% c(1999, 2002, 2005, 2008),]
summed <- aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum, na.rm=TRUE)

###Plot summary
png("plot1.png", width=480, height=480)
plot(summed[,1], summed[,2], type='b', 
     xlab='Year', ylab='Total emissions',
     main='Total emissions by year')
dev.off()