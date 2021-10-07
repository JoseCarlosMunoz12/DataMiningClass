library(sets); library(C50)
set.seed(500)
ind <- sample(2, nrow(iris), replace = TRUE, prob=c(2/3, 1/3))
irisTL<-iris[ind==1,]; # learning
irisTC<-iris[ind==2,] # testing

#no pruning at all
C5T<-C5.0(Species ~ ., data=irisTL, control=C5.0Control(minCase = 5,noGlobalPruning = TRUE, earlyStopping = FALSE)) #minimum instances is 5, no pruning no early stopping
C5T
plot(C5T)
pred.C5T <-predict(C5T,newdata=irisTC) # classify TC
acc.C5T <-sum(pred.C5T==irisTC$Species)/dim(irisTC)[1]
acc.C5T

# postpruning with confidence level
C5T.pop<-C5.0(Species ~ ., data=irisTL, control=C5.0Control(minCase = 5, noGlobalPruning = FALSE, earlyStopping = FALSE, CF=0.001)) #minimum instances is 5, confidence level 0.01
plot(C5T.pop)
pred.C5T.pop <-predict(C5T.pop,newdata=irisTC)
acc.C5T.pop <-sum(pred.C5T.pop==irisTC$Species)/dim(irisTC)[1]
acc.C5T.pop
C5T.prp<-C5.0(Species ~ ., data=irisTL, control=C5.0Control(minCase = 5, noGlobalPruning = FALSE, earlyStopping = TRUE, CF=0.01)) #minimum instances is 5, confidence level 0.4
plot(C5T.prp)

pred.C5T.prp <-predict(C5T.prp,newdata=irisTC)
acc.C5T.prp <-sum(pred.C5T.prp==irisTC$Species)/dim(irisTC)[1]
acc.C5T.prp

