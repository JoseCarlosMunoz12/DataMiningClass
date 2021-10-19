library(RWeka); library(sets); library(mlbench)
data(BreastCancer)
BC<-BreastCancer
rm(BreastCancer)# no meaningful work just too long to write each time
BC$Id <- NULL # remove id column that will just confuse learning
set.seed(2) #set random seed for pseudorandom generator
ind <- sample(2, nrow(BC), replace = TRUE, prob=c(2/3, 1/3))
#sample from values [1:2] with replacement with probbabilities 2/3 for 1 and 1/3 for 2
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Unprunned
C45T <- J48(Class ~ ., data = BC[ind==1,], control = Weka_control(U =TRUE, M = 5)); C45T
#unprunned tree U=True with min node 5datapoints 
plot(C45T)  # plot the tree
pred.C45T <- predict(C45T,newdata=BC[ind==2,-11]) # classify TC
table(BC[ind==2,]$Class, pred.C45T, dnn = c("Actual class", "Predicted class"))
acc.C45T <- 100*sum(pred.C45T==BC[ind==2,]$Class)/dim(BC[ind==2,])[1];acc.C45T
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% confidence interval prunned
C45T1 <- J48(Class ~ ., data = BC[ind==1,], control = Weka_control(C=.05,S =FALSE,M = 5)); C45T1
#statistically prunned tree with confidence level C=0.05, Tree raising Disallowed S=False 
plot(C45T1) 
pred.C45T1 <- predict(C45T1,newdata=BC[ind==2,-11]) # classify TC
table(BC[ind==2,]$Class, pred.C45T1, dnn = c("Actual class", "Predicted class"))
acc.C45T1 <- 100*sum(pred.C45T1==BC[ind==2,]$Class)/dim(BC[ind==2,])[1];acc.C45T1
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MDL prunned
C45T2 <- J48(Class ~ ., data = BC[ind==1,], control = Weka_control(S =TRUE,J=FALSE,M = 5)); C45T2
# nos statistical prunning, but MDL pruning  J=FALSE and Tree rasising allowed S=True
plot(C45T2) 
pred.C45T2 <- predict(C45T2,newdata=BC[ind==2,-11]) # classify TC
table(BC[ind==2,]$Class, pred.C45T2, dnn = c("Actual class", "Predicted class"))
acc.C45T2 <- 100*sum(pred.C45T2==BC[ind==2,]$Class)/dim(BC[ind==2,])[1];acc.C45T2
