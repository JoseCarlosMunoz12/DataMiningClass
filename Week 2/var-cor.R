attach(iris)
cov_sl_sw<-cov(iris$Sepal.Length,iris$Sepal.Width);cov_sl_sw #Sample covariance of sepal length and sepal width 
covmatrix_AllIris<-cov(iris[1:4]);covmatrix_AllIris #covariance matrix of all attributes
cor_1_2<-cor(iris[,1],iris[,2]);cor_1_2 #correlation between attributes
cormatrix_AllIris<-cor(iris[1:4]);cormatrix_AllIris #correlation matrix of all attributes
pairs(iris[1:4],main = "Iris Data",
      pch = 21,bg = c("red","green","blue")[unclass(iris$Species)]) #visual correlation
