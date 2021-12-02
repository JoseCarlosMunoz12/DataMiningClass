require(e1071)
require(mlbench)
library(tidymodels)
m0_data<-read.csv(file = "data.csv",header = TRUE)
m0_data$Class <- as.factor(m0_data$Class)
svm_model<-svm(Class ~ ., data = m0_data,kernel = "linear")#Create a SVM Model
m_res<-predict(svm_model,newdata = m0_data)#Test Data with SVM
table(m0_data$Class,m_res,dnn = c("Actual","Predicted"))#Display actual and predicted
plot(svm_model,m0_data)#Plot results
svm_acc <- 100 * sum(m_res==m0_data$Class) / dim(m0_data)[1] #Show Accuracy
cat("the training data has an accuracy of ",svm_acc)
#1)By visual inspection it doesn't look like it can be separable
#load other data
m1_data<-read.csv(file = "data1.csv",header = TRUE)
m1_data$Class <- as.factor(m1_data$Class)
t_res<-predict(svm_model,newdata = m1_data)#use other data and predict results
table(m1_data$Class,t_res,dnn = c("Actual","Predicted"))# display actual and predicted
plot(svm_model,m1_data)#plot results
svm0_acc <- 100 * sum(t_res==m1_data$Class) / dim(m1_data)[1]# accuracy of the results
cat("the second data has an accuracy of ",svm0_acc)
#2)From visual inspection it looks that the data can be separate better.

#3)
data(Ionosphere)
dataset <-Ionosphere[,-c(1:2)]
dataset$Class <-as.factor(dataset$Class)
set.seed(2)
y<-sample(1:nrow(dataset),2*nrow(dataset)/3,F)
ion_svm<-svm(Class ~ .,data = dataset[y,], kernel="linear")
svm_res <- predict(ion_svm, newdata = dataset[-y,])
table(dataset[-y,]$Class,svm_res,dnn = c("Actual","Predicted"))
ion_svm_acc <- 100 * sum(svm_res == dataset[-y,]$Class) / dim(dataset[-y,])[1]
cat("The SVM model has an accuraccy of",ion_svm_acc)
ion_nBayes<-naiveBayes(Class ~ ., data = dataset[y,])
nBayes_res <-predict(ion_nBayes,dataset[-y,])
table(dataset[-y,]$Class,nBayes_res,dnn = c("Actual","Predicted"))
ion_nBayes_acc <-100 * sum(nBayes_res == dataset[-y,]$Class) / dim(dataset[-y,])[1]
cat("The naive Bayes model has an accuraccy of", ion_nBayes_acc)
#The accuracy of the SVM is much higher than that of the naive Bayes.This could be because the SVM
#allows a certain margin of acceptable error. So it can still classify them well.