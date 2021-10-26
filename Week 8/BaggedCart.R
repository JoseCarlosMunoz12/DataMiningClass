library(MASS);library(mlbench);library(caret)
data("iris")
x<-sample(1:nrow(iris),nrow(iris)/3,F)
control <- trainControl(method="repeatedcv", number=10, repeats=3)
fit.treebag <- train(Species~., data=iris[-x,], method="treebag", metric="Accuracy", trControl=control,na.rm=TRUE)
pred.treebag <- predict(fit.treebag,newdata=iris[x,-5])
acc.treebag <- sum(pred.treebag==iris[x,]$Species)/dim(iris[x,])[1]
acc.treebag