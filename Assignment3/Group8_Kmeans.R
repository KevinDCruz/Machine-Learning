data(iris)

pca <- princomp(iris[, 0:4], cor=T)
pc.comp <- pca$scores
PrincipalComponent1 <- -1*pc.comp[,1]
PrincipalComponent2 <- -1*pc.comp[,2]

clustering.data <- cbind(PrincipalComponent1, PrincipalComponent2)

## kmeans
set.seed(511)
km <- kmeans(clustering.data, 3,iter.max = 15,nstart=20)
plot(PrincipalComponent1, PrincipalComponent2, col=km$cluster)

## elbow kmeans
library(cluster)
library(ggplot2)

data("iris")

iris.scaled <- scale(iris[, -5])
k.max <- 8
data <- iris.scaled
wss <- sapply(1:k.max, 
              function(k){kmeans(data, k, nstart=10 )$tot.withinss})
plot(1:k.max, wss,
     type="b", col="green",pch = 19, frame = FALSE, 
     xlab="K = No. of Clusters",
     ylab="Sum of Cluster (J)")

abline(v = 3, col="red", lty =2)


## Kmeanspp
head(iris)
data <- iris[, -5] 
head(data)  

#elbow

library(factoextra)
library(LICORS)
# Elbow Method 

fviz_nbclust(data, 
             FUNcluster = kmeanspp,  
             method = "wss",    
             k.max = 12) + 
  labs(title="Elbow for Kmeans++") +
  geom_vline(xintercept = 3,
             linetype = 2)

