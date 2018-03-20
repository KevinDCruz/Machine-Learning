library(glmnet)
data <- read.csv(file.choose(), header= T)
x=model.matrix(Balance~.,data=data)
y <- as.double(as.matrix(data[, 12])) # Only class
#head(y)
set.seed(999)
cv.lasso <- cv.glmnet(x, y, alpha=1, parallel=TRUE, standardize=TRUE, type.measure='auc')
plot(cv.lasso)
plot(cv.lasso$glmnet.fit, xvar="lambda", label=TRUE)
cv.lasso$lambda.min
cv.lasso$lambda.1se
coef(cv.lasso, s=cv.lasso$lambda.1se)
coef <- coef(cv.lasso, s='lambda.1se')
