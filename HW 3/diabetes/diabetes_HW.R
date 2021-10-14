library(sets)
library(rpart)
library(RWeka)
D_Data <-read.csv(file="diabetes.csv",header=TRUE)
D_Data$class <-as.factor(D_Data$class)
set.seed(500)
ind <- sample(2,nrow(D_Data),replace = TRUE,prob = c(2/3,1/3))
d_TrD <- D_Data[ind==1,] # Training Data
d_TeD <- D_Data[ind==2,] # Test Data
Cart_Model <- rpart(Class ~., data = D_TrD) # create a Tree for CART
C45_Model <- J48(Class~., data= D_TrD)      # Create a Tree for C4.5
summary(Cart_Model)
summary(C45_Model)
