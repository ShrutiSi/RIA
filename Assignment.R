FD=c(10,10,10,10,20,20,20,30,30,10,10,20,20,30,30,40,40,40,40,50,50,50,50)
FD
cbind(FD)
table(FD)
cbind(table(FD))
hist(FD)
mean(FD)
mode(FD)
str(FD)
dim(FD)
set.seed(1234)
m=ceiling(runif(50,12,100))
m
table(m)
cbind(table(m))
?nobs
x = c(3,5,1,10,12,6)
x
y=c(7,4,7,8,2,1)
y
d=c(x,y)
d
e=data.frame(x,y)
e
nobs(e)
nrows(e)
nrow(e)
e[e<6]=0
e

mtcars
nobs(mtcars)

marks2=c(rep(10,3),rep(20,5),rep(30,2),10,10,rep(40,4),rep(50,4))
marks2
table(marks2)
cbind(table(marks2))
mean(FD)
mean(marks2)

M1=c(10,12,13,14,17)
M1
mean(M1)
m2=c(5,7,9,8,4)
sum(m2)
(markstotal=M1*m2)
sum(markstotal/sum(m2))

a=rep(M1,m2) #create the frequency table
a
table(a)
mean(a)

M2=c("10-20","20-30","30-40","40-50")
M2
m3=c(5,7,9,8)
m3
DF1=data.frame(M2,m3)
DF1
str(DF1)
MP2=c(15,25,35,45)
DF1$MP2=MP2  #to add a column in a dataframe
DF1
DF1$Total=DF1$m3*DF1$MP2 #to multiply two column
DF1
sum(DF1$Total) # to get the total of freq and observation
sum(DF1$Total)/sum(m3)

x=scan()
x

a=c("a","b","b","c")
a
table(a)
sort(table(a), decreasing = TRUE)
sort(table(a), increasing = FALSE)

x=c(1:12,1,5,5)
x
table(x)
names(table(x))
sort(table(x), dec= T)
names(sort(table(x), dec= T))[1]
