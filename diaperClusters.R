options(stringsAsFactors = FALSE)
library(mclust)
library(ggplot2)

filenames <- list.files("data", pattern="*.csv", full.names=TRUE)
tables <- lapply(filenames, read.csv)
data <- do.call(rbind, tables)
data <- unique(data)

c2 <- data[data$Activity=="Diaper",c(1,6)]
c <- data.frame(
	as.POSIXct(c2[,1]),
	rep(0,nrow(c2)),
	rep(0,nrow(c2)),
	rep(0,nrow(c2))
)
names(c) <- c("start.ct", "start.hour", "BM", "Wet")
c$start.hour <- as.POSIXlt(c$start.ct)$hour + as.POSIXlt(c$start.ct)$min/60 + as.POSIXlt(c$start.ct)$sec/3600
c$Wet[grep("Wet", c2[,2])] <- 1
c$BM[grep("BM", c2[,2])] <- 1

fit <- Mclust(c)
hours<-qplot(start.ct, jitter(start.hour), col=factor(fit$classification),data=c) + scale_colour_brewer(palette="Set1","cluster")
png("diaperHours.png")
hours + ggtitle("Day and Time of Day")
dev.off()

diaperWet <-qplot(jitter(start.hour), jitter(Wet), col=factor(fit$classification),data=c) + scale_colour_brewer(palette="Set1","cluster")
png("diaperWetHour.png")
diaperWet + ggtitle("Time of Day for Wet Diapers")
dev.off()

diaperBM <-qplot(jitter(start.hour), jitter(BM), col=factor(fit$classification),data=c) + scale_colour_brewer(palette="Set1","cluster")
png("diaperBMHour.png")
diaperBM + ggtitle("Time of Day for BM Diapers")
dev.off()

diaperStart <- qplot(start.ct, jitter(BM+Wet), col=factor(fit$classification),data=c) + scale_colour_brewer(palette="Set1","cluster")
png("diaperStart.png") + ggtitle("Day and Any Diaper")
diaperStart
dev.off()

diaperHour <- qplot(jitter(start.hour), jitter(BM+Wet), col=factor(fit$classification),data=c) + scale_colour_brewer(palette="Set1","cluster")
png("diaperHour.png")
diaperHour + ggtitle("Time of Day and Any Diaper")
dev.off()
