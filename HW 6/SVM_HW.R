require(e1071)
m0_data<-read.csv(file = "data.csv",header = TRUE)
m0_data$Class <- as.factor(m0_data$Class)
svm_model<-svm(Class ~ ., data = m0_data,kernel = "linear")#Create a SVM Model
m_res<-predict(svm_model,newdata = m0_data)#Test Data with SVM
table(m0_data$Class,m_res,dnn = c("Actual","Predicted"))#Display actual and predicted
plot(svm_model,m0_data)#Plot results
svm_acc <- 100 * sum(m_res==m0_data$Class) / dim(m0_data)[1] #Show Accuracy
#load other data
m1_data<-read.csv(file = "data1.csv",header = TRUE)
m1_data$Class <- as.factor(m1_data$Class)
t_res<-predict(svm_model,newdata = m1_data)#use other data and predict results
table(m1_data$Class,t_res,dnn = c("Actual","Predicted"))# display actual and predicted
plot(svm_model,m1_data)#plot results
svm0_acc <- 100 * sum(t_res==m1_data$Class) / dim(m1_data)[1]# accuracy of the results
