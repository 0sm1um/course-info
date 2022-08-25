setwd("C:/Users/echo4/Class/STAT/STAT-636 Machine Learning Algorithms/HW04")
mydata <- read.table("GeneData_first15BT.csv", sep=",", header=TRUE, row.names=1)
BTresponse <- character(length(mydata$BT))
BTresponse[grep("B", mydata$BT)] <- "B"
BTresponse[grep("T", mydata$BT)] <- "T"
BTresponse <- as.factor(BTresponse)
BTdata <- data.frame(BTresponse, mydata[,-16])
summary(BTdata)


logis.fit <- glm(BTresponse ~ X1000_at  + X1001_at + X1002_f_at + X1003_s_at + X1004_at +
                 X1005_at + X1006_at + X1007_s_at + X1008_f_at + X1008_f_at + X1009_at +
                 X100_g_at + X1010_at + X1011_s_at + X1012_at + X1013_at,
                 data = BTdata, family = binomial)
summary(logis.fit)