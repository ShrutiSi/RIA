library(dplyr)

home_data= read.csv(file= './Data/home_data.csv')
home_data
str(home_data)
summary(home_data)
table(home_data$zipcode)
home_data$zipcode = as.factor(home_data$zipcode)
#I.	Discover which neighborhood (zip code) of Seattle had the highest average house sale price
(AvgPrice = aggregate(home_data$price,by = list(home_data$zipcode),FUN = mean))
#filter(AvgPrice,x==max(x))
colnames(AvgPrice) = c("Zipcode", "Price")
AvgPrice[order(AvgPrice$Price, decreasing = T),]
#number of square feet of living space (‘sqft_living’) in the house
(sqftliv = filter(home_data, sqft_living > 2000 & sqft_living<= 4000))
(nrow(sqftliv))/(nrow(home_data))

# Data split into Test data and Training Data
library(caTools)
set.seed(123)
split = sample.split(home_data, SplitRatio = 0.75)
training_set = subset(home_data, split == TRUE)
test_set = subset(home_data, split == FALSE)
training_set

#my_features = ['bedrooms', 'bathrooms', 'sqft_living', 'sqft_lot', 'floors', 'zipcode']
(my_features = lm(price~bedrooms+bathrooms+sqft_living+sqft_lot+floors+zipcode, data = training_set))
summary(my_features)

(advanced_features = lm(price~bedrooms+bathrooms+sqft_living+sqft_lot+floors+zipcode+
  condition+grade+waterfront+view+sqft_above+sqft_basement+yr_built+yr_renovated+
    lat+long+sqft_living15+sqft_lot15, data = training_set))
summary(advanced_features)

prob_pred2 = predict(my_features, type = 'response', newdata = test_set)
(prob_pred= round(prob_pred,2))

prob_pred3 = predict(advanced_features, type = 'response', newdata = test_set)
(prob_pred= round(prob_pred,2))

RMSE1 = sqrt(mean((test_set$price-prob_pred2)^2))
RMSE1

RMSE2 =sqrt(mean((test_set$price-prob_pred3)^2))
RMSE2

(fit1 = lm(price~bedrooms+bathrooms+sqft_living+sqft_lot+floors+zipcode+
                          condition+grade+waterfront+view+sqft_above+yr_built+yr_renovated+
                          lat+long+sqft_living15, data = training_set))
summary(fit1)

(fit2 = lm(price~bedrooms+bathrooms+sqft_living+floors+zipcode+
                          condition+grade+waterfront+view+sqft_above+yr_built+yr_renovated+
                          lat+long+sqft_living15+sqft_lot15, data = training_set))
summary(fit2)

(fit3 = lm(price~bedrooms+bathrooms+sqft_living+sqft_lot+zipcode+
                          condition+grade+waterfront+view+sqft_above+yr_built+yr_renovated+
                          lat+long+sqft_living15+sqft_lot15, data = training_set))
summary(fit3)

prob_pred4 = predict(fit2, type = 'response', newdata = test_set)
(prob_pred4= round(prob_pred4,2))
RMSE3 = sqrt(mean((test_set$price-prob_pred4)^2))
RMSE3

AIC(fit1,fit2,fit3)
