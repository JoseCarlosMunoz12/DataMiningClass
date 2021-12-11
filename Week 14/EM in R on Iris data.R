library(mclust); library(sets)
data(iris)
#when we know the model - supposed diagonal covariance and each component has equal volume 
modelName = "EEE"
data = iris[,-5] 
z <- matrix(data = NA, nrow = dim(iris)[1], ncol = 3)#prepare matrix for initial 
#random assignment of datapoints to clusters
ranclass <- matrix(sample(list(c(0,0,1),c(0,1,0),c(1,0,0)),dim(iris)[1], replace=TRUE),dim(iris)[1],3)
#choose random vectors of assignment to classes by sampling of all possible assignments
for (i in 1:dim(iris)[1]){#convert the assignemnt lists to matrix format
  for (j in 1:3)
  {z[i,j] <- (as.numeric(ranclass[[i]])[j])}}
msEst <- mstep(modelName, data, z)#initialize at random as described in the algorithm,
#run one maximization stepto determine all initialization parameters  
parameters = msEst$parameters
mix<-em(modelName, data, parameters)
mix$z #we see probabilities of clsses for each datapoint 
mix$G #of clusters discovered
clus<-c(1:dim(iris)[1]) #compare cluster assignment with true Iris species
for(j in 1:dim(iris)[1])
{clus[j]<-which.max(mix$z[j,])}
table(clus,iris$Species)
#let's try version of em that computes optimal model and nummber of classes wrt to covariance
#we have no idea of what the model is so we apply EM that is initialized by hclust: 
#we do hierarchical clustering, in it determines initial means and priors of each class 
#and then apply EM with these initial priors and means. The defauult for number of clusters is to try 1:9
irisMclust <- Mclust(iris[,-5])
plot(irisMclust,what = "classification")
summary(irisMclust)
table(irisMclust$classification,iris$Species)