babyconnectR
============

* download your csv files from http://www.baby-connect.com/home
* create data/
* place your csv files in data/
* run the feedingClusters.R or diaperClusters.R script from within R
``` source("feedingClusters.R", echo=TRUE) ```

# output graphs
* diaperClusters.R:png("diaperHours.png"): Diapers by time of day over time
* diaperClusters.R:png("diaperWetHour.png"): (BM&Wet|Wet) vs BM-only by time of day
* diaperClusters.R:png("diaperBMHour.png"): (BM&Wet|BM) vs Wet-only by time of day
* diaperClusters.R:png("diaperStart.png"): BM&Wet vs BM|Wet over time
* diaperClusters.R:png("diaperHour.png"): BM&Wet vs BM|Wet by time of day  

* feedingClusters.R:png("feedingHours.png"): Time of day, over time
* feedingClusters.R:png("feedingDurationHour.png"): Duration by time of day
* feedingClusters.R:png("feedingDurationStart.png"): Duration over time
* feedingClusters.R:png("feedingRange.png"): Time of day, over time, and duration
* feedingClusters.R:png("feedingPercentByHour.png"):  Percentage of daily feeding completed by hour, labeled by hour of completion

# R library requirements
* diaperClusters.R:library(mclust)
* diaperClusters.R:library(ggplot2)
* feedingClusters.R:library(mclust)
* feedingClusters.R:library(ggplot2)
* feedingClusters.R:library(plyr)