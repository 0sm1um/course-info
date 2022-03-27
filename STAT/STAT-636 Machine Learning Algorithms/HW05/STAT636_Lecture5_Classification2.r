# save file to same directory as data
# Session -> Set Working Directory -> Source File Location

#install.packages("rpart") # only do this once

library(rpart)
?rpart
?rpart.control
mydata <- read.table("GeneData.csv", header=TRUE,
                     row.names=1, sep=",")
mydatanames <- names(mydata)
dim(mydata)
mydatanames[12400:12646]
mydata$BT

# declare a list of empty strings with length equal to the
# number of rows in the data
BTresponse <- character(length(mydata$BT))
BTresponse[grep("B", mydata$BT)] <- "B"
BTresponse[grep("T", mydata$BT)] <- "T"
BTresponse <- as.factor(BTresponse)
table(mydata$BT, BTresponse)

first100df <- data.frame(BTresponse, mydata[,1:100])
head(first100df)
myrpart <- rpart(BTresponse ~ ., data=first100df)
names(myrpart)
myrpart
# Draw a classification tree
plot(myrpart)
text(myrpart)


# install.packages("rpart.plot") # only do this once
library(rpart.plot)
# use "extra" option to add rates
prp(myrpart, extra=3)

myrpartPredict <- predict(myrpart, type="class")
myrpartPredict
table(myrpartPredict, BTresponse)

# show importance of variables
myrpart$variable.importance
sum(myrpart$variable.importance)

# Prune an overgrown tree
myrpart.full <- rpart(BTresponse ~ ., data=first100df, 
                      control = rpart.control(minsplit = 2))
prp(myrpart.full, extra=1)
myrpart.pruned <- prune(myrpart.full, cp = 0.1)
prp(myrpart.pruned, extra=1)

# Regression tree
age <- mydata$age
summary(age)
myagedf <- data.frame(age, mydata[,1:100])
myagetree <- rpart(age ~ ., data=myagedf)
myagetree

# Draw the regression tree
plot(myagetree)
text(myagetree)
# A better way
prp(myagetree)

myagetree$variable.importance

# install.packages("randomForest") # Only once
library(randomForest)
?randomForest
myrf <- randomForest(BTresponse ~ ., data=first100df)
myrf
varImpPlot(myrf)

