##Plot 4
###See get_nei_data.R for read-in of data
###Run from main.R

require(ggplot2)
require(dplyr)
require(magrittr)

if(!exists('NEI')) {
    source('get_nei_data.R')
}

###Subset and summarize data
motor_sources <- SCC[grep("mobile - on-road", SCC$EI.Sector, ignore.case=TRUE), c('SCC')]
NEI_motor <- NEI[NEI$SCC %in% motor_sources,]
NEI_subset <- NEI_motor[NEI_motor$fips == '24510',]
NEI_subset <- merge(x = NEI_subset, y = SCC[,c('SCC', 'EI.Sector')], by = "SCC", all.x = TRUE)
summed <- aggregate(NEI_subset$Emissions, by=list(NEI_subset$year, NEI_subset$EI.Sector), FUN=sum, na.rm=TRUE)
names(summed) <- c('Year', 'Vehicle', 'Emissions')
summed$Vehicle %<>% recode('Mobile - On-Road Diesel Heavy Duty Vehicles'='Diesel - Heavy Duty',
                           'Mobile - On-Road Diesel Light Duty Vehicles'='Diesel - Light Duty',
                           'Mobile - On-Road Gasoline Heavy Duty Vehicles'='Gasoline - Heavy Duty',
                           'Mobile - On-Road Gasoline Light Duty Vehicles'='Gasoline - Light Duty')

###Print and save plot
png('plot5.png', width=480, height=480)
p <- ggplot(data = summed, aes(x = Year, y = Emissions, color = Vehicle)) +    
    geom_line() + geom_point() +
    ggtitle('Motor Vehicle Emissions in Baltimore City') +
    labs(color='Vehicle') +
    xlab('Year') + ylab('Emissions')
print(p)
dev.off()
