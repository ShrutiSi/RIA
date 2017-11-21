seq.int(10,100,length.out = 40) # to create 40 integers
x= matrix(c(1:12),nrow =4)
x
Y=cbind (x,(x[,1]*x[,2]*x[,3]))
Y
Z= matrix(c(1,2,3,3,4,5,6,7,7,7,7,8),ncol=3)
class(Z)
Z
names(sort(table(Z), decreasing = TRUE))[1]# to calculate mode

# Mean
set.seed(1234)
x = ceiling(rnorm(100,50,10))
x
(meanx = sum(x)/length(x))
summary(x)
#trimming values
mean(x, trim=.1)

#NA values - Remove
x[c(1,20,30)]= NA
x
table(is.na(x))
mean(x,na.rm=T)

#Mean absolute deviation
x1 =c(3,6,6,7,8,11,15,16)
(mx= mean(x1))
(mdev= x1-mx)

(mabsdev = sum(abs(mdev))/length(x1))

#Median Absolute deviation
?mad
mad(x)
mad(x,center = median(x))

#mode
library(modeest)
m=mlv(x, method="mfv")
m
?mlv

#Quartile
quantile(x1, seq(.01,1.0, by=.01))

set.seed(1234)
x = ceiling(rnorm(100,50,10))
x
quantile(x,c(0.25,0.5,0.75))
quantile(x)
IQR(x)

#Decile
quantile(x,seq(.1,1,by=.01))

#percentile
quantile(x,seq(.01,1,by=.1))
Q3 = quantile(x,.75)
Q3

summary(x)
fivenum(x)
plot(density(x))
hist(x)

library(timeSeries)
colQuantiles(mtcars)
?colQuantiles
colSkewness(mtcars)
colStats

library(Rcmdr)
library(fBasics)
skewness(x)

#Descriptive statistics
#T test
x1 = c(45,47,50,52,48,47,49,53,51)
t.test(x1, alternative = "two.sided", mu = 47.5, conf.level = .95)
qt(p= .95+ .05/2, df = length(x1)-1)
mean(x1)

