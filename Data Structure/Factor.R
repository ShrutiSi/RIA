x=factor(c("Male",'Female','Male'))
x
x1=factor(c("yes","no","yes"),levels=c("yes","no"))
x1
x3=factor(c("low","medium","high"),ordered=T)
x3
x2=factor(c("yes","no","No"))
x2
gender =c('M','M','F','F','F','M')
gender
g1=factor(gender)
g1
months=c('Mar','Sep','Nov','Apr', 'May', 'Apr', 'Mar','Sep','Nov','Apr','May')
months
month.abb[1:12]
m1=factor(months)
m1
table(m1)
m2=factor(months,levels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"),ordered=T)
m2
m5=c(months,'xyz')
m5
str(m5)
cat(m5)


gender=c(1,2,1,1,2)
gender
fgender=factor(gender)
fgender
fgender=factor(gender, levels=c(1,2),labels=c('M','F'))
fgender

summary(m5)
m5
m5=factor(m5)
levels(m5)[12]='XYZ'
m5
m5[14]= 'abc'
m5
sum(is.na(m5))
m5=na.omit(m5)
m5
summary(m5)
table(m5)
m5

#ordinal
clsposn=c(1,2,3,4,1)
clsposn
class(clsposn)
summary(clsposn)
mode(clsposn)
fclsposn = factor(clsposn)
fclsposn
levels(fclsposn)
summary(fclsposn)
fclsposn2=factor(clsposn,levels =c(1,2,3,4,5), ordered=T, labels = c('First','Second','Third','Fourth','Fifth)'))
fclsposn2
summary(fclsposn2)
fclsposn3=factor(fclsposn2,levels(fclsposn2)[c(5,3,4,2,1)])
fclsposn3
print(levels(fclsposn3))
levels(fclsposn2)
fclsposn2
fclsposn4=factor(fclsposn2,levels=rev(levels(fclsposn2)))
fclsposn4

status=c('Poor','Improved','Excellent','Improved')
status
fstatus=factor(status)
fstatus
fstatus2=relevel(fstatus,'Poor')
fstatus2
fstatus2=relevel(fstatus,'Poor')
fstatus2
fstatus3=factor(status,ordered = T,levels=c('Poor','Improved','Excellent'))
fstatus3
plot(fstatus3)
plot(table(fstatus3))
