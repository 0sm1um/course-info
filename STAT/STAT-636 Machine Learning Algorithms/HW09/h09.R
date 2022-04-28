setwd(dir="C:\Users\echo4\Class\STAT\STAT-636 Machine Learning Algorithms\HW09")
library(rgl)
library(cluster)

#problem 4
summary(USArrests)
mydata <- USArrests
myagnes <- agnes(mydata) # Create a dendrogram

#pdf("images/myagnes.pdf")
pltree(myagnes)
dev.off()

grp <- cutree(myagnes, k=2)
grp[20]
grp[46]
pltree(grp)


mykmeans <- kmeans(mydata, centers=2, nstart=100)
mykmeans$cluster[20]
mykmeans$cluster[46]
