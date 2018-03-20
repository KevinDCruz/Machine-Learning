cutPoints <- c(5,7,9)
truePositive <- c(0.56,0.78,0.91)
falsePositive <- c(0.1, 0.19, 0.58)
library(pROC)
plot(roc(cutPoints, truePositive, falsePositive),
     col="yellow", lwd=3, main="ROC for the Given Data")
