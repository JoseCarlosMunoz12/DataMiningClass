library(sets)
library(caret)
library(randomForest)

set.seed(365) # good to set seed so each run yields the same results

x<-sample(1:150, 50, replace = T) #randomly select record #’s with replacement
y<-as.integer(as.set(1:150)-as.set(x)) # take a complement
irisTL<-iris[x,]; # learning
irisTC<-iris[y,] # testing

# Random Forest
randomForest <- train(Species ~ ., data = irisTL, control = trainControl(method="repeatedcv", number=10, repeats=3))

# prediction
pred.randomForest <- predict(randomForest,newdata=irisTC)
acc.randomForest <- sum(pred.randomForest==irisTC$Species)/dim(irisTC)[1]
acc.randomForest