mtcars
summary(mtcars)
str(mtcars)
lm1 = glm(formula = am ~ ., data = mtcars, family = binomial )
lm1
dim(mtcars)
(t=table(mtcars$am))
(sum1 = addmargins(t))
(prop1 = prop.table(t))
?mtcars
# automatic car percentage is 59.375 and manual is 40.625
lm0 = glm(am~1, data=mtcars, family = binomial)
lm0
odds = exp(-0.3795)
odds
summary(lm1)
lm2= glm(am~mpg+disp+hp+wt, data = mtcars, family = binomial)
summary(lm2)
anova(lm2)
plot(lm2)
# for resetting the plot area
layout(matrix(c(1,2,3,4),2,2))
#second model
lm3 = glm(am~ mpg+hp+wt, data = mtcars, family = binomial)
summary(lm3)
lm4 = glm(am~hp+wt, data = mtcars, family = binomial)
summary(lm4)
lm5 = glm(am~mpg+wt, data = mtcars, family = binomial)
summary(lm5)
lm6 = glm(am~mpg+hp, data = mtcars, family = binomial)
summary(lm6)
lm7=glm(am~wt+hp+cyl,data = mtcars, family = binomial)
summary(lm7)

# Predicting the Test set results
prob_pred = predict(lm3, type = 'response', newdata= mtcars[,c(1,4,6)])
(y_pred = ifelse(prob_pred > 0.5, 1, 0))

# Making the Confusion Matrix
cm = table(mtcars$am, y_pred)
cm
30/32

prob_pred1 = predict(lm4, type = 'response', newdata = mtcars[,c('wt','hp')])
(prob_pred1 = round(prob_pred1,2))
(y_pred1 = ifelse(prob_pred1>0.5,1,0) )
cm1 = table(mtcars$am, y_pred1)
cm1
plot(lm4)
#to compare the values
cbind(mtcars$am,mtcars$wt, mtcars$hp, prob_pred1,y_pred1)
#creating a test data by creating a data frame and predicting the probability
newdata = data.frame(wt=3.85,hp = 175)
predict(lm4, newdata, type= 'response')
caret::confusionMatrix(cm1)
#correlation between the two variables
car::vif(lm3)
sqrt(car::vif(lm3))>2
