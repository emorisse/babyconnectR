# create three output images from the model based analysis across all of the nursing data:  
#   1. hours.png - hour of the day (or night) the nursing took place, compared with full datetime
#   2. durationHour.png - hour of the day or night, compared with the length of the nursing
#   3. durationStart.png - full datetime, compared with the length of the nursing
# Note: I was only able to recognize any discernable change over time for my son with durationStart.png

options(stringsAsFactors = FALSE)
library(mclust)
library(ggplot2)

filenames <- list.files("data", pattern="*.csv", full.names=TRUE)
tables <- lapply(filenames, read.csv)
data <- do.call(rbind, tables)
data <- unique(data)

c2 <- data[data$Activity=="Nursing",c(1,2,4)]
c2 <- c2[!is.na(c2$Duration..min.),]
c <- data.frame(
	as.POSIXct(c2[,1]),
	as.POSIXct(c2[,2]),
	c2[,3],
	rep(0,nrow(c2)),
	rep(0,nrow(c2))
)
names(c) <- c("start.ct", "end.ct", "duration", "start.hour", "end.hour")
c$start.hour <- as.POSIXlt(c$start.ct)$hour + as.POSIXlt(c$start.ct)$min/60 + as.POSIXlt(c$start.ct)$sec/3600
c$end.hour   <- as.POSIXlt(c$end.ct)$hour + as.POSIXlt(c$end.ct)$min/60 + as.POSIXlt(c$end.ct)$sec/3600

fit <- Mclust(c)
hours<-qplot(start.ct, jitter(start.hour), col=factor(fit$classification),data=c) + scale_colour_brewer(palette="Set1","cluster")
png("hours.png")
hours
dev.off()

durationHour <-qplot(jitter(start.hour), duration, col=factor(fit$classification),data=c) + scale_colour_brewer(palette="Set1","cluster")
png("durationHour.png")
durationHour
dev.off()

durationStart <- qplot(start.ct, duration, col=factor(fit$classification),data=c) + scale_colour_brewer(palette="Set1","cluster")
png("durationStart.png")
durationStart
dev.off()

