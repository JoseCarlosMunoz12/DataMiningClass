library(RWeka);library(sets);
library(mlbench);library(partykit)
data(BreastCancer);BC<-BreastCancer
rm(BreastCancer)
BC$Id <- NULL
set.seed(2)
ind <- sample(2, nrow(BC), replace = TRUE, prob=c(2/3,1/3))
C45T <-J48(Class ~ .,data = BC[ind==1,],control = Weka_control(U=TRUE,M=5));C45T
windows();
a<-dev.cur()
plot(C45T)
savePlot("saveplot.pdf",type = "pdf")
dev.off(a)
plot(C45T)
dev.copy(file="copy2pdf.pdf",width = 7, height = 5)
pred.C45T <- predict(C45T, newdata = BC[ind==1,-11])
table(BC[ind==2,]$Class,pred.C45T,dnn=c("Actual Class", "Predicted Class"))
#acc.C45T <-100 * sum(pred.C45T==BC[ind==2,]$Class)dim