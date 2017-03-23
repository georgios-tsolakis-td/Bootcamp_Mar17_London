library(leaflet)
library(parcoords)
library(dplyr)
library(glmnet)
#setwd("Desktop/R/Testing Area/Airlines/DelayedByRum/")
visdata<-read.csv("visdata.csv")

#ds <- select_(dataset,.dots=c("DepDelay","TailNum","engines","seats","Distance","DayOfWeek","DaysToHoliday","year","alt","lat","lon"))
#ds$year<- 2016-ds$year
#ds<-na.omit(ds)

#visdata<-ds[sample(nrow(ds),40),]
#visdata$DepDelay<-ifelse(visdata$DepDelay<0,0,visdata$DepDelay)
#names <- visdata$TailNum

#preddelay<- as.character(visdata$DepDelay)
#preddelay <- paste0("Predicted Delay Time: ",preddelay)
#visdata <- data.frame(lng=visdata$lon,lat=visdata$lat,popup=names,status=preddelay,preddelay=visdata$DepDelay)

airplaneIcons <- iconList(
  type1 = makeIcon("http://www.iconsdb.com/icons/preview/orange/airplane-11-xxl.png", iconWidth= 14, iconHeight= 14)
)


#asd<-select_(dataset,.dots=c("DepDelay","engines","seats","Distance","manufacturer"))

#asd$Delay <- cut(asd$DepDelay,breaks=30*(-2:10))
#asd$Delay <- asd$DepDelay
#asd2<-asd[sample(10000),]
#asd2$DepDelay<-NULL
#parcoords(
#  asd2
#  ,color = list(
#    colorBy="Delay"
#    ,colorScale=htmlwidgets::JS('d3.scale.category10()')
#  )
#  ,rownames=FALSE
#)
