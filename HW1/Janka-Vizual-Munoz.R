require(xlsx)
data = read.xlsx2("janka.xlsx",1, colClasses = c(rep("numeric", ncol(data)-1)))

