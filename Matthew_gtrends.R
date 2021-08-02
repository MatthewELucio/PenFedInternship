library(data.table)
library(tidyverse)
library(gtrendsR)
library(jsonlite)
keywords = c("Penfed","NFCU")
trends = gtrends(keywords)
time_trend = trends$interest_over_time
head(time_trend)
qplot(date,hits,data=time_trend,facets=.~keyword)+geom_smooth(aes(color=keyword,fill=keyword),method="lm")



# NOT RUN {
session <- gconnect("usr@gmail.com", "psw")

gtrends(c("PenFed", "Pentagon Federal"))

gtrends("NHL", geo = c("CA", "US"))

# Search only for the sport category.
gtrends("PenFed", geo = c("CA", "US"), cat = "0-20")

# Trends between 2015-01-01 and 2015-03-01 in Sweeden. Will be daily data.
gtrends("NHL", geo = c("SE"), start_date = "2015-01-01", end_date = "2015-03-01")

# Trends between 2015-01-01 and 2015-04-01 in Sweeden. Will be weekly data.
gtrends("NHL", geo = c("SE"), start_date = "2015-01-01", end_date = "2015-04-01")

# Last 4 hours trends
gtrends("NHL", geo = c("CA"), res = "4h")

# Last 7 days trends
gtrends("PenFed", geo = c("CA"), res = "7d")

# Using categories

data("categories")
categories[grepl("music", categories$name, ignore.case = TRUE), ]

gtrends(cat = "1087")
# }
# NOT RUN {
data("sport_trend")
plot(sport_trend)
# }
