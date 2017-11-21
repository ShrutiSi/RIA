library(AER)
data(Affairs)
Affairs
mydata= Affairs
summary(mydata)
str(mydata)
?Affairs
x = mydata$affairs
table(x)
round(prop.table(table(x)),3)
round(prop.table(table(x))*100,1)
y = mydata$gender
round(prop.table(table(y))*100,1)
z=mydata$children
round(prop.table(table(z))*100,1)
#convert the number of affairs in a new column Y/N
mydata$ynaffair[mydata$affairs>0]=1
mydata$ynaffair[mydata$affairs==0]=0
mydata$ynaffair = factor(mydata$ynaffair, levels = c(0,1), labels = c('No', 'Yes'))
table(mydata$ynaffair)
# to remove a column
mydata1 = mydata[,-c(1)]
mydata1
fit1 = glm(formula = ynaffair~1,family = binomial,data = mydata1)
fit1
fitall = glm(formula = ynaffair~., family=binomial, data = mydata1)
fitall
summary(fitall)
step(fit1,scope = list(lower= fit1, upper = fitall), direction = "forward")
finalfit = glm(formula = ynaffair ~ rating + religiousness + yearsmarried + 
                 age + gender, family = binomial, data = mydata1)
summary(finalfit)
