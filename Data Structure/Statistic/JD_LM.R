#Multiple Linear Regression
dataset = read.csv(file='./Data/50_Startups.csv')
dataset
#splitting the dataset into the training set and Test set
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
split
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Multiple Linear regression to the training set
(regressor = lm(Profit~., data = training_set))
summary(regressor)
#Predicting the test set result based on the multiple linear model we has created
(y_pred = predict(regressor, newdata = test_set))
test_set$Profit_Pred = y_pred
test_set
test_set$Pred_error = test_set$Profit - test_set$Profit_Pred
 #Mean Absolute Deviation (MAD)
MAD = mean(abs(test_set$Pred_error))
MAD           

#Mean square error
(MSE = mean(test_set$Pred_error^2))

#Root Mean Square
RMSE = sqrt(mean(test_set$Pred_error^2))
RMSE
attach(dataset) 
regressor = lm(formula = Profit~ R.D.Spend+Marketing.Spend, data = dataset)
summary(regressor)

# Step down method, We shd try to eliminate one IV and create the model to try to understand the behavior and impact

regressor = lm(formula = Profit~R.D.Spend, data = dataset)
summary(regressor)

# Cross validation is a method to determine the best method, some commonly used is 5 cross method
# where u divide the entire dataset into 5 equal dataset and treat 4 part as training data set 
# and one as test dataset and keep repeating the permutation

# Logistic Regression

