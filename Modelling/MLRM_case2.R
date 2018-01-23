esales = read.csv(file ='./Data/elantra.csv', stringsAsFactors = F,header = T,as.is = T)
str(esales)

es_train = esales[esales$Year <= 2012,]
es_train
str(es_train)
es_test = esales[esales$Year >2012,]
es_test
str(es_test)

Model1 = lm(ElantraSales~Unemployment+Queries+CPI_energy+CPI_all, data = es_train)
summary(Model1)

Model2 = lm(ElantraSales~Unemployment+Queries+CPI_energy+CPI_all+Month, data = es_train)
summary(Model2)

es_train$Month = as.factor(es_train$Month)
es_test$Month = as.factor(es_test$Month)
Model3 = lm(ElantraSales~Unemployment+Queries+CPI_energy+CPI_all+Month, data = es_train)
summary(Model3)

Model4 = lm(ElantraSales~Queries, data = es_train)
summary(Model4)

Model5 = lm(ElantraSales~Queries+Unemployment, data = es_train)
summary(Model5)
plot(Model5)

prob_pred2 = predict(Model5, type = 'response', newdata = es_test)
(prob_pred2= round(prob_pred2,2))
str(prob_pred2)
(cbind(es_test$ElantraSales,prob_pred2))

RMSE = sqrt(mean((es_test$ElantraSales-prob_pred2)^2))
RMSE

