#functions
# Create function
x=2; y=3
(sumofnos = x+y)

x1 = c(1:10)
(sumofnos = sum(x1))

#Create a new function
fmean1 = function(x1) {
  sum(x1)/length(x1)
}
fmean1
fmean1((1:10))

# Alternately
fmean1 = function(x1){
  sumofnos = sum(x1)/length(x1)
  return(sumofnos)
}
fmean1(1:10)

fsum2 <- function(x1) {
  sumofnos = sum(x1)
  return(sumofnos)
}
fsum2(2:20)

# you want to create a function where u want to multiply; sum of one vector
#with the mean of another vector
fProductxy <- function(x1, y1) {
  productofnos = sum(x1)*mean(y1)
  return(productofnos)
}
fProductxy(5,10)

x1=1:10; y1=100:200
fProductxy(x1,y1)

#another function where u want to find the differenec between the sum of one vector
#and mean of another vector
Diffxy <- function(x1, y1) {
  Diffofnos = sum(x1) / mean(y1)
  return(Diffofnos)
}

x2 = 1:10; y2 = 100:200
Diffxy(x2,y2)

Diffxy <- function(x1, y1) {
  Diffofnos = sum(x1) / mean(y1)
  print(paste('Diff of nos is ' , Diffofnos, sep = '' ))
  cat(paste('Diff of nos is ' , Diffofnos, sep = '- ' ))
}

#Check structure of functio
body(Diffxy)
args(Diffxy) # argument of built in function

#built in function
args(bxp)
body(bxp)

# Create a function to calculate the area of cirle
Areaofcircle <- function(pi, x1) {
  Areaofcircle = pi*x1^2
  return(Areaofcircle)
}

Areaofcircle(pi,10)
Areaofcircle(pi,2)

Areaofcircle2 = function(mypi = 3.14, r){
  area = mypi * r^2
  return(area)
}

Areaofcircle2(, 2)
Areaofcircle2(2,2) # will override the default value if user gives a value
# you can change the sequence but then u have to give argument name
Areaofcircle2(r=4, mypi = 3.14)
Areaofcircle2(r=4)

#Third function for area of circle can be written as 
Areaofcircle3 = function(r){
  area= pi*r^2
  return(area)
}

Areaofcircle3(2)

#structure of functions
lsf.str()
search()
lsf.str(pos=-1) #relate to functions
lsf.str(pos=1)
lsf.str(pos=2)# relate to 2nd package in order found in search()
lsf.str(pos=4)

save(Areaofcircle3, Areaofcircle, Areaofcircle2, file='./Data/shruti1.RData')
#Clear Environment
rm(list=ls())
load('./Data/shruti1.RData')
load('./Data/shruti.RData')

#R commands and objects name into character strings
args(Areaofcircle)
(ch1= deparse(args(Areaofcircle)))
str(ch1)

# When u don't want to show the output of a function, u give invisible command
Areaofcircle <- function(pi, x1) {
  +   Areaofcircle = pi*x1^2
  +   invisible(Areaofcircle)
}
Areaofcircle(3.14,4)
?print
