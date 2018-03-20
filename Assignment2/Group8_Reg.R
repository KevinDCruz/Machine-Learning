#Importing the Dataset
library(readxl)
Demand_Estimation <- read_excel("C:/Users/Kevin D'Cruz/Downloads/UMass/Sem 3/Machine Learning/Assignment 2/Demand Estimation.xlsx")
View(Demand_Estimation)

head(Demand_Estimation)

summary(Demand_Estimation)

Demand_Estimation <- data.frame(Demand_Estimation)
model1 <- lm(Demand_Estimation$Number.of.weekly.riders ~ ., data = Demand_Estimation)
summary(model1)


str(Demand_Estimation)

#Creating A Dataframe
newdf = data.frame(City = numeric(1), Price.per.week = numeric(1), Population.of.city = numeric(1), Monthly.income.of.riders = numeric(1), Average.parking.rates.per.month = numeric(1) )
newdf$City = 1
newdf$Price.per.week = 35
newdf$Population.of.city = 1600000
newdf$Monthly.income.of.riders = 12000
newdf$Average.parking.rates.per.month = 110


predict(model1, newdf)

#Computing SSE
SSE <-sum(model1$residuals^2)
SSE

#Computing MSE
MSE <-mean(model1$residuals^2)
MSE