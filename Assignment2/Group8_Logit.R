#read file named logistic
data <- read.table(file.choose(),header =T)
#data
#factor variables
data$admit <- as.factor(data$admit)
data$rank <- as.factor(data$rank)

set.seed(1234)
ind <- sample(2, nrow(data), replace = T, prob = c(0.8, 0.2))

#Logistic Regression 
lrmodel <- glm(admit ~ . , data = data, family = "binomial")
summary(lrmodel)

##confustion matrix 
p3 <- predict(lrmodel, data, type = "response")
p3 <- ifelse(p3>0.5,1,0)
(tab3 <- table(predicted = p3, Actual = data$admit))

#Miss classification rate
1 - sum(diag(tab3))/sum(tab3)

#prediction if student will get admit or not Student will be admitted or not
newdf = data.frame( gre = numeric(1), gpa = double(1), rank = numeric(1) )
newdf$gre = 720
newdf$gpa = 3.8
newdf$rank= 2

newdf$rank = as.factor(newdf$rank) 
str(newdf)

predict(lrmodel, newdata = newdf, interval = 'confidence')
