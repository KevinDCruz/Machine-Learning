#Naive Bayes

data <- iris

indep = iris[,-5]
dep <- iris$Species

library("caret")
library("klaR")
library("e1071")
library("MASS")

nb = train(indep,dep,'nb',trControl=trainControl(method='cv',number=8))
nb

predict(nb$finalModel,indep)
(tab1 <- table(predict(nb$finalModel,indep)$class,dep))

(missclassification_error <- 1 - sum(diag(tab1))/sum(tab1))

#LDA Model
library(MASS)
data <- iris

lda_model <- lda(Species~., data)
summary(lda_model)

p1 <- predict(lda_model, data[,1:4])$class
(tab2 <- table(p1, data$Species))

(missclassification_error <- 1 - sum(diag(tab2))/sum(tab2))