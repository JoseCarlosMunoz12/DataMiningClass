library(MASS);library(mlbench)
data(BreastCancer)
x<-sample(1:nrow(BreastCancer),nrow(BreastCancer)/3,F)
BrCaLDA<- lda(Class ~ .,BreastCancer[-x,-1])
plot(BrCaLDA, panel = panel.lda, cex = 0.7, dimen = 1, abbrev = FALSE,type="density")
suppressWarnings(table(BreastCancer[-x,]$Class,predict(BrCaLDA,BreastCancer[-x,2:10])$class))
suppressWarnings(acc.BrCaLDATr <- sum(BreastCancer[-x,]$Class==predict(BrCaLDA,BreastCancer[-x,2:10])$class,na.rm=TRUE)/ nrow(BreastCancer[-x,]));acc.BrCaLDATr
#warnings()
suppressWarnings(pred <- predict(BrCaLDA,BreastCancer[x,2:10]))
table(BreastCancer[x,]$Class,pred$class)
acc.BrCaLDA <- sum(pred$class==BreastCancer[x,]$Class,na.rm=TRUE)/nrow(BreastCancer[x,]);acc.BrCaLDA