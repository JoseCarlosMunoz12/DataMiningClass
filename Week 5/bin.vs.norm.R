windows()
par(mfrow=c(2,2)) #put 4 plots in 2 'row' by 2 'cols'
n <- 200 #n=200 samples
v<-c(1:200) #same number of sample points for normal
x<-seq(0.125,0.5, by=0.125)
#success p varies from 0.125 to 0.5
for(p in x){  y <- rep(0, times = n) # for each success pr.
 # prepare an array of values
  #for binomial dist
  for(i in 1:n){y[i]<-dbinom(i,n,p) #for i successes
     #compute pr. value of binomial
    plot(y,type="h") #plot the vector of bin. pr's
    hv <- dnorm(v,n*p,sqrt(n*p*(1-p)))
  # for 200 sample compute norm.
    lines(v,hv,col="red")} #overlay norm. (as a function,
#i.e. hv=h(v) in red) on bin.
}
dev.off()
