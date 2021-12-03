library(dclust)
iris50 <- iris[sample(x = 1:150, size = 50, replace = FALSE),]
x <- as.matrix(iris50[, 1:4])
rownames(x) <- iris50[, 5]
dnd <- dclust(x, nstart = 20)
plot(dnd, horiz = FALSE, yaxt = "n")
