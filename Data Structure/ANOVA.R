# ANOVA
Sup1 = c(18.5,24,17.2,19.9,18)
Sup2 = c(26.3,25.3,24,21.2,24.5)
Sup3 = c(20.6,25.2,20.8,24.7,22.9)
Sup4 = c(25.4,19.9,22.6,17.5,20.4)
df2 = data.frame(Sup1,Sup2,Sup3,Sup4)
df2
colMeans(df2)
colSums(df2)
round(addmargins(as.matrix(df2),c(1,2),FUN = list(list(mean,sd,length),list(length))),2)
stack(df2) # when we want to change the way data is shown
unstack(stack(df2)) # when we want to reverse the stack
dfstack = stack(df2) # this is done to create the independent variable into a factor and also create two variables, one as dependent variable and another as independent variable
dfstack
str(dfstack)
aggregate(dfstack$values, by=list(dfstack$ind), FUN = mean)
aggregate(dfstack$values, by=list(dfstack$ind), FUN = sd)
fit2A = aov(values~ind, data = dfstack) #aov(dependent variable~independent varible, database)
summary(fit2A)
fit2A
#to get the p critical value based on the table, we use command
qf(p=0.95, 3,16)
#since p calculated value is greater than p critical value, we reject null hypothesis

boxplot(dfstack$values)
boxplot(dfstack)
boxplot(df2)

gplots::plotmeans(values~ind,data = dfstack)
abline(h=colMeans(df2))
# tells which all means are significantly different
TukeyHSD(fit2A)
plot(TukeyHSD(fit2A))
#very large difference in the first sup2-sup1 as it is furthest away from the mean levels
library(multcomp)
tuk = glht(fit2A, linfct= mcp(ind= 'Tukey'))
tuk
plot(cld(tuk,level = 0.05))

# normality test
car::qqPlot(fit2A,simulate = T, labels=F)

# for checking the homeogenarity of variables
bartlett.test(values~ind, data = dfstack)
# we are not rejecting the null hypothesis as variable are homeogenous

car::outlierTest(fit2A)
# shows there are not many outliers according to outlier test
