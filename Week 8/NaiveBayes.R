library(e1071)
data("iris")
set.seed(2)
y<-sample(1:nrow(iris),2*nrow(iris)/3,F)
nBayes <- naiveBayes(Species ~ ., data = iris[y,]);nBayes
table(iris[y,]$Species,predict(nBayes,iris[y,-5]))
table(iris[-y,]$Species, predict(nBayes,newdata=iris[-y,-5]))
