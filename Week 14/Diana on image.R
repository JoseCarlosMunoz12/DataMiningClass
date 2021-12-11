library(cluster);library(png);library(graphics) 
readImage<-readPNG('example.png')
dm <- dim(readImage)
rgbImage <- data.frame(
  x=rep(1:dm[2], each=dm[1]),
  y=rep(dm[1]:1, dm[2]),
  r.value=as.vector(readImage[,,1]),
  g.value=as.vector(readImage[,,2]),
  b.value=as.vector(readImage[,,3]))
plot(y ~ x, data=rgbImage, main="Image for Pattern Analysis",
     col = rgb(rgbImage[c("r.value", "g.value", "b.value")]), 
     asp = 1, pch = ".") 
mimg<-as.matrix(readImage[,,2])
ind<-which(mimg!= 1, arr.ind=TRUE)
s<-sample(1:dim(ind)[1],2000,F)
sind<-ind[s,c(2,1)]
dv <- diana(sind, metric = "eucledian", stand = TRUE)
plot(dv) #see the tree
dv1 <- cutree(as.hclust(dv), k = 6) #there are 6 clusters
table(dv1)
simg<-data.frame(sind) #convert back to data frame
names(simg)[names(simg)=="row"] <- "x"
names(simg)[names(simg)=="col"] <- "y"
simg$clust<-dv1[1:2000]
plot(simg$x,simg$y,col=simg$clust)
