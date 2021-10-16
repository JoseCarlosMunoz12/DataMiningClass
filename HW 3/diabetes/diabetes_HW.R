library(sets)
library(rpart)
library(partykit)
library(RWeka)
<<<<<<< HEAD
library(rattle)
D_Data <-read.csv(file="diabetes.csv",header=TRUE)
D_Data$class <-as.factor(D_Data$class)
=======
D_Data <-read.csv(file="diabetes.csv",header=TRUE) # load items from csv
D_Data$class <-as.factor(D_Data$class) # change the class type into a factor type
#----Randomly distributes the data into a train set and a test set
>>>>>>> 40623e6c89a30e8851d8c3bda927dd9d5e70bc98
set.seed(500)
ind <- sample(2,nrow(D_Data),replace = TRUE,prob = c(2/3,1/3))
d_TrD <- D_Data[ind==1,] # Training Set
d_TeD <- D_Data[ind==2,] # Testing Set

C45_Model <- J48(class~., data= d_TrD,control = Weka_control(U=TRUE,M=5))   # Create a Tree for C4.5
CART_Model <- rpart(class~., data = d_TrD, method = "class")                #create a tree for the CART

plot(C45_Model)  #Plot C45 Tree
<<<<<<< HEAD
ret <-predict(C45_Model,newdata= d_TeD)
table(d_TeD$class,ret,dnn = c("actual","predicted"))
ans <- 100 * sum(ret==d_TeD$class) / dim(d_TeD)[1]
CART <- rpart(class~., data = d_TrD,method="class")
res <- predict(CART,newdata = d_TeD,type="class")
fancyRpartPlot(CART)
table(d_TeD$class,res,dnn = c("actual","predicted"))
cans <- 100 * sum(res==d_TeD$class) / dim(d_TeD)[1]
=======
plot(CART_Model) #Plot CART Tree

C45_res <-predict(C45_Model,newdata= d_TeD)   #Test data with C45 Decision Tree
CART_res <- predict(CART_Model,newdata=d_TeD) #Test data with CART Decision Tree

table(d_TeD$class,C45_res,dnn = c("actual","predicted"))  #Display Results of the test for C45 
table(d_TeD$class,CART_res,dnn = c("actual","predicted")) #Display Results of the test for CART

C45_ac <- 100 * sum(C45_res==d_TeD$class) / dim(d_TeD)[1]  #C45 accuracy
CART_ac <- 100 * sum(results==d_TeD$class) / dim(d_TeD)[1] #CART accuracy
>>>>>>> 40623e6c89a30e8851d8c3bda927dd9d5e70bc98
