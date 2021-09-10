r<-1
s<-1.5
l<-2
z<-complex(real=1,imaginary=1)
t<-list(z,2,'a',4)
p<-seq(from=6,to=36,by=2)
m<-matrix(unlist(p),nrow=4,byrow=TRUE)
m1<-matrix(c(1,2,3,4),nrow=2,byrow=FALSE);m1[1,2];m1[,1];m1[1,]
m2<-sum(m1[,1])
n<-as.data.frame(m)
u<-"this is a string"
u[2]<-"add";u
k<-c(1,2,3)
k2<-c(r,l,"c")
k1<-strtoi(k2[1:2])
x <- pi * c(-1:1, 10);x
y<-c(1,7,"c")
d<-intersect(k,y)
my.name <- readline(prompt="Enter name: ")
my.age <- readline(prompt="Enter age: ")
#convert character into integer
my.age <- as.integer(my.age)
print(paste("Hi,", my.name, "next year you will be", my.age+1, "years old."))