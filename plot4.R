##Plot 4
###See get_nei_data.R for read-in of data
###Run from main.R

require(ggplot2)

if(!exists('NEI')) {
    source('get_nei_data.R')
}

###Subset and summarize data
coal_sources <- SCC[grep('coal', SCC$Short.Name, ignore.case=TRUE), c('SCC')]
NEI_coal <- NEI[NEI$SCC %in% coal_sources,]
summed <- aggregate(NEI_coal$Emissions, by=list(NEI_coal$year), FUN=sum, na.rm=TRUE)
names(summed) <- c('Year', 'Emissions')

###Print and save plot
png('plot4.png', width=480, height=480)
p <- ggplot(data = summed, aes(x = summed$Year, y = summed$Emissions)) +    
    geom_line() + geom_point() +
    ggtitle('Emissions from Coal Sources') +
    xlab('Year') + ylab('Emissions') +
    expand_limits(y=0)
print(p)
dev.off()
