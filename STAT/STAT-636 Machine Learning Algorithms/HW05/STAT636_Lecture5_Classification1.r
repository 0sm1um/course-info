mydata <- read.table("SAheart.csv", sep = ',', header=TRUE, row.names=1)

# logistic regression
logis.fit <- glm(chd ~ sbp + tobacco + ldl + famhist + obesity + alcohol + age,
                 data = mydata, family = binomial)
summary(logis.fit)

# Reduced model
logis.fit2 <- glm(chd ~ tobacco + ldl + famhist + age,
                 data = mydata, family = binomial)
summary(logis.fit2)

# calculate prob
logis.prob <- predict(logis.fit2, type = "response")
logis.prob[1:10]

# Performance in training data
logis.pred <- logis.prob > .5
table(logis.pred, mydata$chd)

# LDA
library(MASS)
lad.fit <- lda(chd ~ tobacco + ldl + famhist + age,
               data = mydata)
lad.fit
lad.pre <- predict(lad.fit, mydata)
table(lad.pre$class, mydata$chd)
