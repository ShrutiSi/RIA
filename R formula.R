x=scan() # to copy data from excel
x
mean(x) 
y=scan() # cannot use for character
y=scan(what='character') # use to copy "text"/alphanumeric from excel
y
median(x)
hist(x)
mode(x) # it tells whether it is numeric integer etc

names(sort(table(x), decreasing = TRUE))[1] # to calculate Mode

set.seed(1234) # to get the same random number again, use it before giving below comman
m=ceiling(runif(50,0,10)) # to generate uniform normal distributiom random 50 data points
set.seed(1234)
x=ceiling(rnorm(100,60,15)) #to generate random normal numbers 
x
range(x)  #to find the range of data generated, min and max value
bks=seq(min(x),max(x),10)  #to create an interval class(breaks) for our frequency distribution
bks
cut1 =cut(x,bks) #create the class interval
cut1
table1= table(cut1) # to create frequency distribution table
table1
cbind(table1)
hist(table1)
?cut
x[c(1,2,3,4,5)] = c(0,10,11,99,100) # to change the value of first five data points
x
bks=seq(0,100,10)
bks
classinterval = cut(x,breaks = bks)
classinterval
head(x,n=5)
table(classinterval, useNA='ifany') # to check if distribution has any value that is not falling in any interval
classinterval2= cut(x,breaks=bks, right=F) #this will miss considering 100 and will put in NA
classinterval2
table(classinterval2)
head(classinterval2)
head(x)

#to avoid 0 or 100 to be missed, we will give this command
classinterval2= cut(x,breaks=bks, include.lowest = T)
classinterval2
as.character(head(classinterval2,n=5))
head(x,n=5)
table(classinterval2,useNA = 'ifany')

LETTERS[1:5] # to create the capital alphabet
letters[1:8] # to create small alphabets
month.abb[1:5] # to create the month

marks.cut=cut(x,bks) # to generate the frequency disctribution
marks.cut
marks.cut=table(marks.cut) #to generate the frequency distribution in table form
marks.cut
cbind(marks.cut)

#Giving Labels
classinterval2= cut(x,breaks=bks, include.lowest = T, labels=LETTERS[1:length(bks)-1])
classinterval2
as.character(head(classinterval2))
head(x, n=5)
length(bks)
table(classinterval2)
