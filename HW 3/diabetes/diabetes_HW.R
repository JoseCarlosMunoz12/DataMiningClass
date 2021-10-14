library(sets)
df <-read.csv(file="diabetes.csv",header=TRUE)
df$class <-as.factor(df$class)
set.seed(500)
ind <- sample(2,nrow(df),replace = TRUE,prob = c(2/3,1/3))
dfTL <- df[ind==1,]
dfTC <- df[ind==2,]
