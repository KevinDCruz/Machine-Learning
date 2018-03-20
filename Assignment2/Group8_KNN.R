data("iris")
head(iris,10)
set.seed(1234)

ind <- sample(2, nrow(iris), replace = T, prob = c(0.8, 0.2))
ind
train_data <- iris[ind == 1, 1:4]
test_data <- iris[ind==2, 1:4]

train_label <- iris[ind == 1, 5]
test_label <- iris[ind==2, 5]


library(class)
iris_test_pred<-knn(train=train_data, test=test_data,cl=train_label,k=13)
iris_test_pred

tab1 <- table(predicted = iris_test_pred, Actual = test_label)
tab1

accuracy <- sum(diag(tab1)) / sum(tab1)
accuracy
misclassification_error_rate = 1 - accuracy
misclassification_error_rate

###Bonus points

iris_test_pred2<-knn.cv(train=train_data,cl=train_label,k=13)

tab2 <- table(predicted = iris_test_pred2, Actual = train_label)
tab2



