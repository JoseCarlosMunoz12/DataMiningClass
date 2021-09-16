library(pracma)
Data<-c(19,12,22,6,6,9,3,15,2,13,20,5)
M<-matrix(Data, nrow = 6, ncol = 2, byrow = TRUE)
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
