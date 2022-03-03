setwd("C:/Users/echo4/Class/STAT/STAT-636 Machine Learning Algorithms/HW03")
mydata <- read.table("GeneData_first15.csv", row.names = 1)


mypca <- prcomp(mydata[,c(1:15)], center = TRUE,scale. = TRUE)
summary(mypca)

myvar <- mypca$sdev^2
myvar_scaled <- myvar/sum(myvar)

barplot(myvar_scaled)

