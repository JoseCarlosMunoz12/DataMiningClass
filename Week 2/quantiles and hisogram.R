require(xlsx);require(graphics)
data = read.xlsx2("example.xlsx", 1)
example = read.xlsx2("example.xlsx", 1, colClasses = c(rep("numeric", ncol(data)-1)))
#or example[,2]<-as.numeric(as.character(data[,2]))
hist(example[,2],probability=TRUE,main="Y")
dev.copy2pdf(file="histogram.pdf")
quantile(example[,1],c(seq(from=0,to=1,by=0.1)))
plot(quantile(example[,1],c(seq(from=0,to=1,by=0.1))), 
     quantile(example[,2],c(seq(from=0,to=1,by=0.1))),
     main="X1 vs x2 Quantiles",xlab="x1 by 10 groups", ylab = "x2 by 10 groups")
plot(ecdf(example[,2]))
pairs(iris[1:4],main = "Iris Data",pch = 21, bg =
        c("red","green","blue")[unclass(iris$Species)])
