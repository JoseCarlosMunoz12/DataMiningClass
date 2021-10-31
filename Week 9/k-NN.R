library(FNN);data(iris3)
x<-sample(1:50,25,F)
train <- rbind(iris3[x,,1], iris3[x,,2], iris3[x,,3])
test <- rbind(iris3[-x,,1], iris3[-x,,2], iris3[-x,,3])
cl <- factor(c(rep("s",25), rep("c",25), rep("v",25)))
NN<-knn(train, test, cl, k = 3, prob=TRUE)
summary(NN)
table(NN,cl)
err<-(nrow(test)-sum(diag(table(NN,cl))))/nrow(test);err
NN
