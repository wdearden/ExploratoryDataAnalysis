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
summed <- aggregate(NEI_coal$Emissions, by=list(NEI_coal$year, NEI_coal$type), FUN=sum, na.rm=TRUE)
names(summed) <- c('Year', 'Type', 'Emissions')

###Print and save plot
png('plot4.png', width=480, height=480)
p <- ggplot(data = summed, aes(x = Year, y = Emissions, color = Type)) +    
    geom_line() + geom_point() +
    ggtitle('Coal Emissions by Type 1999-2008') +
    labs(color='Source Type') +
    xlab('Year') + ylab('Emissions')
print(p)
dev.off()
