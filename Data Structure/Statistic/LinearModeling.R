#30/10/2017
x = c(1.7,1.6,2.8,5.6,1.3,2.2,1.3,1.1,3.2,1.5,5.2,4.6,5.8,3 )
y = c(3.7,3.9,6.7,9.5,3.4,5.6,3.7,2.7,5.5,2.9,10.7,7.6,11.8,4.1 )
df = data.frame(x,y)
fit=lm(formula = y ~ x)
fit
length(x)
sum(x)
mean(x)
sum(y)
mean(y)
cov(x,y)
cor(x,y)
#Correlation Test: Pearson's product moment correlation coefficient
cor.test(x,y)
?cor.test
plot(x,y,main="Plot between X and Y")
abline(lm(y~x), col = "red")
summary(fit)
# Manually compute the value of regression
df$X = round(x-mean(x),2)
df
df$Y= round(y-mean(y),2)
df
(df$xy = round(df$X * df$Y,2))
df$X2 = round(df$X^2,2)
df
(SSxy= sum(df$xy))
(SSx2 = sum(df$X2))
B1 = SSxy/SSx2
B1
B0 = mean(y) - B1*mean(x)
B0
df$yh = round(fitted(fit),2)
df
plot(df$yh,x)
df$SSE = round((df$y -df$yh)^2,2)
summary(df$SSE)
summary(fit)
(df$SSR = round((df$yh- mean(y))^2,2))
df
#coefficient of determination R2
R2 = round(sum(df$SSR)/(sum(df$SSE)+ sum(df$SSR)),4)
R2
#Standard error of the estimate
n = length(x)
(stderror = sqrt(sum(df$SSE)/(n-2)))
abline(lm(y~x,col='blue'))
text(10,4, labels = "Shruti")
text(x=X, y=Y, labels = paste0(X,Y), cex= .9, col = 'red')
paste0('(',x,',',y,')')

p=1 # no. of independent variables
(SSr = round(sum(df$SSR),2))
(SSE = round(sum(df$SSE),2))
(MSR = SSr/p)
(MSE = SSE/ (n-p-1))
(Fstats = MSR/MSE)
# Second linear model exercise
women
class(women)
cor.test(women$weight,women$height)
Fit1=lm(weight~height,data = women)
Fit1
summary(Fit1)
plot(women$height,women$weight)
abline(Fit1,col='blue')
text(women$height=A, women$weight=B, labels=paste0(A,B), cex=.9, col = 'red')

fitted(Fit1) # to calculate the predicted value, command use is 'fitted'

# To compute another model using polynomial
attach(women)
fit2 = lm(weight~height+I(height^2), data = women)
fit2
summary(fit2)
plot(women$height,women$weight, xlab = "Height", ylab = "Weight")
lines(women$height,fitted(fit2),col = 'red')
# Not recommended to add another polynomial if it is not making significant impact 
# as it will increase the processing time and also will try to include outliers
fit3 = lm(weight~height+I(height^2)+I(height^3), data = women)
fit3
summary(fit3)

library(car)
car::scatterplot(weight~height,data=women,spread=FALSE, lty.smooth=2, pch=19,
                 main= "Women Age 30-39", xlab = "Height", ylab = "Weigth")
