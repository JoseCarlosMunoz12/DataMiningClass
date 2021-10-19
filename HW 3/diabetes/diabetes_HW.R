library(sets)
library(rpart)
library(rpart.plot)
library(partykit)
library(RWeka)

set.seed(5)
D_Data <- read.csv(file = "diabetes.csv", header = TRUE)
D_Data$class <- as.factor((D_Data$class))
ind <- sample(2,nrow(D_Data),replace = TRUE,prob = c(2/3,1/3))
d_TrD <- D_Data[ind==1,] # Training Set
d_TeD <- D_Data[ind==2,] # Testing Set

C45_Model <- J48(class~., data= d_TrD,control = Weka_control(U=TRUE,M=5))   # Create a Tree for C4.5
CART_Model <- rpart(class~., data = d_TrD, method = "class")                #create a tree for the CART

plot(C45_Model,unicorm=TRUE)  #Plot C45 Tree
rpart.plot(CART_Model,uniform=TRUE) #Plot CART Tree

C45_res <-predict(C45_Model,newdata=d_TeD)   #Test data with C45 Decision Tree
CART_res <- predict(CART_Model,newdata=d_TeD, type="class") #Test data with CART Decision Tree

table(d_TeD$class,C45_res,dnn = c("actual","predicted"))  #Display Results of the test for C45 
table(d_TeD$class,CART_res,dnn = c("actual","predicted")) #Display Results of the test for CART

C45_ac <- 100 * sum(C45_res==d_TeD$class) / dim(d_TeD)[1]  #C45 accuracy
CART_ac <- 100 * sum(CART_res==d_TeD$class) / dim(d_TeD)[1] #CART accuracy

cat("C45 has an accuracy of ", C45_ac)
cat("CART has an accuracy of ", CART_ac)

#6)The Trees are not the same. The C45 tree is much more complex compare to that of the CART.
#This is because the 
#
#
