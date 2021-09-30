rm(list = ls())
library(sets);library(partykit);library(TH.data)
data("GlaucomaM",package = "TH.data")
Gl<-GlaucomaM
rm(GlaucomaM)
a<-dim(Gl)
set.seed(6)
x<-sample(1:a[1],a[1]/3,F)#randomly select record numbers
y<-as.integer(as.set(1:a[1])-as.set(x)) #take a complement
Train.Gl<-Gl[y,];Test.Gl<-Gl[x,] # Tl training set; TC testing set
Gl.tree <- ctree(Class ~ ., data = Train.Gl) # build a tree model w Tl
Gl.tree
plot(Gl.tree)
pred.test.Gl<-predict(Gl.tree, newdata = Test.Gl[-11]) # classify TC
table(Test.Gl$Class, pred.test.Gl,dnn = c("Actual class","Predicted Class"))
acc.Gl.tree <- 100 * sum(pred.test.Gl == Test.Gl$Class) / dim(Test.Gl)[1];acc.Gl.tree
