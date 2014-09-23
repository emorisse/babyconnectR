# babyconnectR
I am a new and first-time father using [Baby Connect](baby-connect.com) to track my son's feeding and diaper changes. The basics are all there, but I wanted to know how and when my son's behaviors where changing over time and answer questions like:

* Is today's feeding part of a larger pattern, or an anomaly?
* Is he eating more during the day, or am I deluded by sleep deprivation?     

I've started by performing cluster analysis and generating pretty pictures in R. There's a longer writeup, and some early version example graphs taken from this code, on [HowWeKnowUs.com](http://www.howweknowus.com/2014/09/05/the-baby-measureur/).

If you have a similar interest for your own kids, I'd love to hear your ideas. 

# howto
* download your csv files from http://www.baby-connect.com/home
* create data/
* place your csv files in data/
* run the feedingClusters.R or diaperClusters.R script from within R
``` 
source("feedingClusters.R", echo=TRUE) 
```


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

![feedingRange.png](http://i0.wp.com/www.howweknowus.com/wp-content/uploads/2014/09/feedingRange.png) 

![diaperStart.png](http://i0.wp.com/www.howweknowus.com/wp-content/uploads/2014/09/diaperStart.png) 

# R library requirements
* diaperClusters.R:library(mclust)
* diaperClusters.R:library(ggplot2)
* feedingClusters.R:library(mclust)
* feedingClusters.R:library(ggplot2)
* feedingClusters.R:library(plyr)
