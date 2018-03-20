data("iris")
## reference: https://www.r-bloggers.com/hierarchical-clustering-in-r-2/
iris <- iris[,1:4]
hcMaxCluster <- hclust(dist(iris))
plot(hcMaxCluster,main="Maximum Linkage")

hcAvgCluster <- hclust(dist(iris), method = "average")
plot(hcAvgCluster,main="Average Linkage")

hcMinCluster <- hclust(dist(iris), method = "single")
plot(hcMinCluster,main="Minimum Linkage")
