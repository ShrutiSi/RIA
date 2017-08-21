n=c(2,3,5)
s=c("aa","bb","cc")
b=c(TRUE,FALSE,TRUE)
N
n
s
b
n;s;b
df=data.frame(n,s,b)
df
str(df)
summary(df)
d<-c('M','F','M')
d
df1=data.frame(df,d, stringsAsFactors = T)
df1
summary(df1)
str(df1)
str(mtcars)
?mtcars

head(mtcars)
?head
tail(mtcars)
nrow(mtcars)
mtcars[1:3]
mtcars[,1:3]
mtcars[c(1,5),1]
mtcars[1:5,]
names(mtcars)
rownames(mtcars)
mtcars$am
mtcars[mtcars$mpg>25,]
mtcars[mtcars$mpg>=25,]
mtcars[mtcars$carb>3&mtcars$wt>3,c(2,3)]
mtcars[mtcars$mpg>20 | mtcars$cyl<3,]
mtcars[rownames(mtcars)=='Fiat128',]
subset(mtcars,carb=="2")
library(dplyr)

slice(mtcars,1L)
colnames(df)=c("rollno","names","gender")
dim(df)
length(df)
attach(df)
gender
detach(df)
