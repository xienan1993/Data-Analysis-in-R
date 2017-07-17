#kaggle case 1
#Nelson
remove(list = ls())

library("rpart")
setwd("D:/academic/kaggle实例/Kaggle第一节课")
train <- read.csv("train.csv",stringsAsFactors = F)
test <- read.csv("test.csv",stringsAsFactors = F)

table(train$Survived)

test$survived <- rep(0,418)

fit <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked,
             data=train,
             method="class")
#plot(fit)
#text(fit)

#options(useFancyQuotes = FALSE)
# install.packages('rattle')
# install.packages('rpart.plot')
# install.packages('RColorBrewer')
# library("rattle")
# library("rpart.plot")
# library("RColorBrewer")
# 
# fancyRpartPlot(fit)

Prediction <- predict(fit, test, type = "class")
test$survived <- Prediction

## creat a new csv file to save the prediction result
submit <- data.frame(PassengerId = test$PassengerId, Survived = test$survived)
write.csv(submit, file = "theyallperish.csv", row.names = FALSE)
