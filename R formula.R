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

# TO change the graph parameters
par() # to get the c0mplete list of parameters
par(pin=c(2,3)) # to change the width and height of the graph
par(col.lab = "red") # to change the color of the label
hist(mtcars$mpg)   
par(no.readonly = T) # this command will list all the parameters that can be changed
opar = par(no.readonly = T)
opar
par(opar) # to revert back to default setting
hist(mtcars$mpg)
par('mar') # default values to set margin
par(mar = c(0.5,0.5,0.5,0.5)) # to change margin in cms
par('mar')
hist(mtcars$mpg)
par(mai =c(1,1,1,1)) # to change the margin value in inches
Par('mai')
hist(mtcars$mpg)
attach(mtcars)
par(mfrow=c(2,2)) # to plot multiple frames per row, plot multiple graph in one frame
hist(mpg,main= "1")
hist(cyl,main= "2")
hist(wt,main="3")
hist(hp,main="4")

par(mfcol=c(2,2)) # to plot it column wise
hist(mpg,main= "1")
hist(cyl,main= "2")
hist(wt,main="3")
hist(hp,main="4")

layout((matrix(c(1,1,2,3),byrow=T,nrow=2))) # to plot one graph in the first row and multiple in second row. Repeat "1" number of times as many graph u want in second row 
hist(mpg,main= "1")
hist(cyl,main= "2")
hist(wt,main="3")
# Horizontal proportion 1:3 and Vertical proportion is 1:2, to change th proportion u add following command
layout((matrix(c(1,1,2,3),byrow=T,nrow=2)),widths=c(1,3),heights=c(1,2))
hist(mpg,main= "1")
hist(cyl,main= "2")
hist(wt,main="3")
hist(hp,main="4")
par(opar)
plot.new()
#Redisgn the frame by the use of Figure command
par(fig=c(0, 0.8,0,0.8),new=T) # add a box plot above the scatter plot
plot(wt,mpg)
par(fig=c(0, 0.8,0.65,1),new=T)
boxplot(wt,horizontal =T,axes=T)
par(fig=c(0.65,1,0,0.8),new=T)
boxplot(mpg,axes=F)

#13/09/2017
#To store only one Dataframe in a file, we use RDS: filename.RDS
# where as for storing multiple datastructure we use RData: Filename.RData
# When we save file in csv, we loose all the data structure features, to retain that we can save 
#it in .RDS or .RData

# Filter-----------
df2[df2$gender =="M" & df2$course == 'PGDDS', c('rollno', 'name')]
df2[df2$gender == 'M' & df2$course == 'PGDDS', c(1,2)]

# Find from Indices---------
df2[df2$hostel == TRUE,][1:2] #stay in hostel
which(df2$hostel == T) #using which command Tells indices
df2[which(df2$hostel ==T),][c(1,2,4,5)] # in hostel
df2[which(!df2$hostel ==T),][c(1,2,4,5)] # not in hostel

#sort x=c(1,2,3,4)
#sort(x) = 1 2 3 4 sort the data
#order(x) = 1 5 3 4 2 , gives the order number or position; index
#rank(x) = give ranks like 1st 2nd 3rd etc

df2
rm(list=ls()) # to remove all the data from environment
load(file='./data/shruti1.RData')

df2
#16-09-2017
#Create a function----
Feestatus = function(x){
  if(x>=150000)
    print(paste(i, df2$name[i], x, '- Fee Paid'))
  else
    print(paste(i, df2$name[i], x, '- Fee Not Paid -xxxx'))
}
for(i in c(1:11)){
  Feestatus(df2$fees[i])
}
# i is for printing the serial number also, u can create function without that also

Feestatus1 = function(x){
  if(x>=150000)
    print(paste(df2$name, x, '- Fee Paid'))
  else
    print(paste(df2$name, x, '- Fee Not Paid -xxxx'))
}
Feestatus1(df2$fees)

#19-09-2017
