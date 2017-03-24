##Plot 3
###See get_nei_data.R for read-in of data
###Run from main.R

require(ggplot2)

if(!exists('NEI')) {
    source('get_nei_data.R')
}

###Subset and summarize data
NEI_baltimore <- NEI[NEI$fips == '24510',]
summed <- aggregate(NEI_baltimore$Emissions, by=list(NEI_baltimore$year, NEI_baltimore$type), FUN=sum, na.rm=TRUE)
names(summed) <- c('Year', 'Type', 'Emissions')

###Print and save plot
png('plot3.png', width=480, height=480)
p <- ggplot(data = summed, aes(x = Year, y = Emissions, color = Type)) +    
    geom_line() + geom_point() +
    ggtitle('Emissions in Baltimore City 1999-2008') +
    labs(color='Source Type') +
    xlab('Year') + ylab('Emissions')
print(p)
dev.off()
