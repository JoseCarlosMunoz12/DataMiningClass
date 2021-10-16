library(sets)
library(rpart)
library(partykit)
library(RWeka)
library(rattle)
D_Data <-read.csv(file="diabetes.csv",header=TRUE)
D_Data$class <-as.factor(D_Data$class)
set.seed(500)
ind <- sample(2,nrow(D_Data),replace = TRUE,prob = c(2/3,1/3))
d_TrD <- D_Data[ind==1,] # Training Data
d_TeD <- D_Data[ind==2,] # Test Data
C45_Model <- J48(class~., data= d_TrD,control = Weka_control(U=TRUE,M=5))      # Create a Tree for C4.5
plot(C45_Model)  #Plot C45 Tree
ret <-predict(C45_Model,newdata= d_TeD)
table(d_TeD$class,ret,dnn = c("actual","predicted"))
ans <- 100 * sum(ret==d_TeD$class) / dim(d_TeD)[1]
CART <- rpart(class~., data = d_TrD,method="class")
res <- predict(CART,newdata = d_TeD,type="class")
fancyRpartPlot(CART)
table(d_TeD$class,res,dnn = c("actual","predicted"))
cans <- 100 * sum(res==d_TeD$class) / dim(d_TeD)[1]
