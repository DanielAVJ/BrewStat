dir()

setwd("./Mi unidad")

library(dplyr)
library(ggplot2)
library (readr)

ratings <- read.csv("./punk_ratings.csv", sep = ",")
recipes <- read.csv("./punk_recipes.csv", fileEncoding = "latin1", sep = ",")
brewstat <- read.csv("./brewstat.csv",fileEncoding = "latin1", sep = ",")

length(ratings$beer_name)
length(recipes$beer_name)
match(unique(ratings$beer_name),unique(recipes$beer_name))

data <- merge(ratings,recipes, by="beer_name")

summary(data)
class(data)

a <- sapply(data, function(x) sum(is.na(x)))
table(a)
seq(a[a<85])
a
data1 <- select_if(data, a=85)

