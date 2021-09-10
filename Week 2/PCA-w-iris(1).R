attach(iris)
d<-dim(iris)[2]-1 #number of features/components
prc <- prcomp(iris[1:d],retx=TRUE,center = TRUE,scale. = TRUE)
prc$x #rotated data
prc$sdev # vector of standard deviations of principal components 
prc$center #means of iris data features
prc$scale # total z-score of all features
prc$rot   # eigenvectors - new basis
biplot(prc, scale = 0) #note that petal length is roughly PC1 and Sepal width is roughly correponding to -PC2
spectrum<-prc$sdev^2 #vector of variances (eigenvalues) 
totvar<-sum(spectrum);totvar #total variance
#_____________________________________________________dimensionality reduction
varpct<-spectrum/totvar; varpct #prct of variance by component
plot(varpct, xlab = "Principal Component",
             ylab = "Proportion of Variance Explained",
             type = "b")
for (i in 1:d) {
  if (varpct[i] <0.03) break
} #i is the number of first component that carries less that 3% of varinace
Prcvec<-prc$rot[,1:(i-1)] #keep all components that carry >than 3% of variance
newdat<-as.matrix(iris[1:d])%*%as.matrix(Prcvec) #new data
backimage<-newdat%*%t(Prcvec)#bringing back reduced dimesionality data
diff<-as.matrix(iris[1:4]-backimage)#difference between orinal iris and is backimage
dist<-as.vector(numeric(n))#prepare the space for computing distances between vectorsof original data and backimages
n<-dim(iris)[1]
for (i in 1:n) {
  dist[i]=norm(diff[i,],type="2")} #computing eucledean distances between vectors and their post-images
