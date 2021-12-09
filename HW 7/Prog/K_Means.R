library(mlbench)
library(cluster)
library(ClusterR)
data(BreastCancer)
rd <- na.omit(BreastCancer)
rBC_Data <- BreastCancer[,-11]
BC <- rBC_Data[,-1]
BC <- na.omit(BC)
set.seed(240)
res <- kmeans(BC,centers = 2)
table(rd$Class, res$cluster)
#
new_res <- kmeans(BC,iter.max = 1000,centers = 2)
table(rd$Class, new_res$cluster)
#
cl_sin_s <- hclust(dist(BC), method = "single") #using Euclidean Distance dist
plot(cl_sin_s, hang = -1)
rect.hclust(cl_sin_s, 2)
true_cl_s<-cutree(cl_sin_s, 2) #extract 2 level classification
table(true_cl_s,rd$Class) #compare with true classification
#The results are worst than than K - means
cl_sin_w <- hclust(dist(BC), method = "ward.D2") #Ward using Euclidean Distance dist
plot(cl_sin_w, hang = -1)
rect.hclust(cl_sin_w, 2)#much much better
true_cl_w<-cutree(cl_sin_w, 2) #extract 2 level classification
table(true_cl_w,rd$Class) #compare with true classification
# the ward algorithm is slight worst, but still fine