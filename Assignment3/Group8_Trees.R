# Read data
data <- read.csv(file.choose(), header = T)
data$X <- NULL
data <- na.omit(data)

# Tree
library(tree)
tree1 <- tree(AHD ~., data)
plot(tree1)
title("Fig1: Classification Tree")
text(tree1, pretty = NULL)

# Pruned Tree
ptree <- prune.misclass(tree1, best = 6)
plot(ptree)
text(ptree, pretty = NULL)

# Variable Importance Plot
importance(rf)
varImpPlot(rf,main = "Variable Importance Figure")

## Splitting data
set.seed(511)
ind <-sample(2,nrow(data), replace = T, prob = c(0.7, 0.3))
train <- data[ind ==1,]
test <- data[ind ==2,]

# Train Random Forest
rf <- randomForest(AHD ~ ., train,
                   importance = T,
                   ntree = 500,
                   mtry = 8)
plot(rf, main="Train: Random Forest")

# Test Random Forest
rf <- randomForest(AHD ~ ., test,
                   importance = T,
                   ntree = 500,
                   mtry = 8)
plot(rf, main="Test: Random Forest")


# Train Begging
train1 = sample(1:nrow(data), nrow(train))
bagging <- randomForest(AHD ~., data, subset = train1, mtry = 8, importance = TRUE)
plot(bagging, main="Train:Bagging")

# Test Begging
test1 = sample(1:nrow(data), nrow(test))
bagging <- randomForest(AHD ~., data, subset = test1, mtry = 8, importance = TRUE)
plot(bagging, main="Test:Bagging")

## Tree size and error
## Reference: http://www.stat.cmu.edu/~cshalizi/350/lectures/22/lecture-22.pdf
treeSE = cv.tree(tree1, FUN = prune.misclass)
plot(treeSE$size, treeSE$dev, type='b')

## OOB Error - Train
t <- tuneRF(train[,-14], train[,14],
            stepFactor = 0.5,
            plot = T,
            ntreeTry = 100,
            trace = T,
            improve = 0.05)

## OOB Error - Test
t <- tuneRF(test[,-14], test[,14],
            stepFactor = 0.5,
            plot = T,
            ntreeTry = 100,
            trace = T,
            improve = 0.05)
