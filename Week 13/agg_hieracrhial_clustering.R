library(graphics); 
data(iris)
data_iris<-iris[, -5]
cl_sin_s <- hclust(dist(data_iris), method = "single") #using Euclidean Distance dist
plot(cl_sin_s, hang = -1)
rect.hclust(cl_sin_s, 3)
true_cl_s<-cutree(cl_sin_s, 3) #extract 3 level classification
table(true_cl_s,iris$Species) #compare with true classification
cl_sin_c <- hclust(dist(data_iris), method = "complete")
#dev.new()
plot(cl_sin_c, hang = -1)
rect.hclust(cl_sin_c, 3)
true_cl_c<-cutree(cl_sin_c, 3) #extract 3 level classification
table(true_cl_c,iris$Species) #compare with true classification
cl_sin_a <- hclust(dist(data_iris), method = "ave")
#dev.new()
plot(cl_sin_a, hang = -1)
rect.hclust(cl_sin_a, 3)
true_cl_a<-cutree(cl_sin_a, 3) #extract 3 level classification
table(true_cl_a,iris$Species) #compare with true classification
dev.off();dev.off();dev.off()
#show classification into 3 classes as needed
cl_sin_w <- hclust(dist(data_iris), method = "ward.D2") #Ward using Euclidean Distance dist
plot(cl_sin_w, hang = -1)
rect.hclust(cl_sin_w, 3)#much much better
true_cl_w<-cutree(cl_sin_w, 3) #extract 2 level classification
table(true_cl_w,iris$Species) #compare with true classification
