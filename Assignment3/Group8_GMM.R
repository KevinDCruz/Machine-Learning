## https://stats.stackexchange.com/questions/111145/how-to-fit-mixture-model-for-clustering
set.seed(999)
data(iris)
class <- iris$Species
X <- iris[,1:4]

plot(X,class,  pch = 19, col = "gray40")


library("mclust")
mod2 <- MclustDA(X, class, modelType = "EDDA")
plot(mod2, what = "scatterplot")

