x=scan() # to copy data from excel
x
mean(x) 
y=scan() # cannot use for character
y=scan(what='character') # use to copy text from excel
y
median(x)
hist(x)
mode(x) # it tells whether it is numeric integer etc
names(sort(-table(x)))[1] # to copute mode

table(x)
sort(table(x), decreasing = FALSE)
sort(table(x), decreasing = TRUE)

names(sort(table(x), decreasing = TRUE))[1] # to calculate Mode
set.seed(1234) # to get the same random number again, use it before giving below comman
m=ceiling(runif(50,0,10)) # to generate uniform random 50 data points

marks.cut=cut(x,breaks) # to generate the frequency disctribution
marks.cut
marks.cut=table(marks.cut) #to generate the frequency distribution in table form

