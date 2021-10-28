require(xlsx);require(graphics)
#read file from janka
data = read.xlsx2("janka.xlsx",1)
allData = read.xlsx2("janka.xlsx", 1, colClasses = c(rep("numeric", ncol(data))))
#Get all the means from both atributes
allmu <-colMeans(allData[1:ncol(data)]);allmu
#Get All variance of the attributes
allVariance<-apply(allData[1:ncol(data)],2,var);allVariance
cvm<-cov(allData$Density,allData$Hardness);cvm
#Get All standard deviation of the attributes
allstd<-apply(allData[1:ncol(data)],2,sd);allstd
#Display both frequencies in a histogram and save it in a pdfjpeg(file="saving_plot1.jpeg")
jpeg(file="Density-Histogram-Munoz.jpeg")
hist(allData$Density,probability=FALSE,main="Density")
dev.off()
jpeg(file="Hardness-Histogram-Munoz.jpeg")
hist(allData$Hardness,probability=FALSE,main="Hardness")
dev.off()
#using the CDF and plotting them
plot(ecdf(allData$Density))
plot(ecdf(allData$Hardness))
#Plot the quantile data
plot(quantile(allData[,1],c(seq(from=0,to=1,by=0.1))), 
     quantile(allData[,2],c(seq(from=0,to=1,by=0.1))),
     main="X1 vs x2 Quantiles",xlab="x1 by 10 groups", ylab = "x2 by 10 groups")

