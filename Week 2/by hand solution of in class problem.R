library(pracma)
Data<-c(1,2,1,4,2,13,7,8,1,8,4,5)
M<-matrix(Data, nrow = 4, ncol = 3, byrow = TRUE)
m<-matrix()
length(m) <- nrow(M)*ncol(M)
dim(m)<-c(nrow(M),ncol(M))
v1<- c(rep(1,nrow(M)))
mu<-c(rep(0,ncol(M)))
for (i in 1:ncol(M)){
  m[,i]<-((v1%*%M[,i])/nrow(M))*v1
}
D<-M-m
CD<-cov(D)
a <- charpoly(CD,info = TRUE)
cpCD<-a$cp
roots<-roots(a$cp)
v<-eigen(CD)$vectors
Y<-M%*%v
prcnt<-roots[1]/sum(roots)
D;CD;cpCD;roots;v;prcnt;Y