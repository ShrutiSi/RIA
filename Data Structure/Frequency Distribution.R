student=c("A","A","P","P","A","P","A")
Siblings=c(2,1,2,4,1,0,1,2,4,2)
Color= c('Red','Blue','Green','Magenta','Green','Black','Blue','Black')
Color
student;Siblings;Color
table(student)
table(Siblings)
table(Color)
cbind(table(student))
cbind(table(Siblings))
cbind(table(Color))
hist(table(Color))
pie(table(Color))

x=rnorm(100,mean=5,sd=6)
x
y=rnorm(100)
y
m=ceiling(runif(50,0,10))
m
set.seed(1234)
m=ceiling(runif(50,0,10))
m
set.seed(1234)
m=ceiling(runif(50,0,10))
m
cat(m)
breaks=seq(0,100,by=10)
breaks
cat(breaks)
marks.cut=cut(x,breaks)
marks.cut
marks.cut=table(marks.cut)
marks.cut
cbind(marks.cut)
table(m)
cbind(table(m))
colnames(m)="marks"
`colnames-`("marks")
?colnames


