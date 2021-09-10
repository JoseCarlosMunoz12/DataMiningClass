attach(iris) #load data set iris into memory
mu<-mean(iris[,1]);mu #mean
allmu<-colMeans(iris[1:4]);allmu #mean all columns
mu_by_colv<-tapply(iris$Sepal.Width,iris$Species,mean);mu_by_colv #mean selected attributes (arg1) by values of another col(arg2)
me<-median(as.matrix(iris[1:4])[,1]);me #median, select columns another way 
v<-var(iris[,1]);v #variance of random var
allv<-apply(iris[1:4], 2, var);allv #variance of all columns (arg1) - 2 is dimension number -col(arg2)
v_by_colv<-tapply(iris$Petal.Width,iris$Species, var);v_by_colv # variance of selected columns (arg1) by value of another col(arg2)
std<-sd(iris[,1]);std #standard deviation of a column
abs_dev<-apply(iris[1:4],2, mad);abs_dev #mean absolute deviation \sum_i|x_i-mu| 
