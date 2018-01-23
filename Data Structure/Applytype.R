#Apply function

#array
V1array = array(1:24,dim=c(4,3,2) )
V1array
dimnames(V1array)= list(c("C1", "C2", "C3","C4"), c("D1","D2","D3"), c("S1", "S2"))
V1array

#matrix
M1 = matrix(c(10:1, rep(5,10), rep(c(5,6),5), seq_len(length.out = 10)),ncol=4)
M1
colnames(M1)= c("sub1", "sub2", "sub3", "sub4")
rownames(M1) = c("R1", "R2", "R3", "R4", "R5", "R6", "R7", "R8", "R9","R10")
M1
rownames(M1)= c("R", 1:10, sep="")
M1
#Dataframe
D1 = data.frame(sub1= 10:1, sub2=5, sub3= rep(c(5,6),5), sub4= seq_len(length.out = 10))
D1

#List
(L1 = list(sub1=10:1, sub2= rep(5,3), sub3= rep(c(5,6),4), sub4=seq_len(length.out = 10)))

#print objects
V1array
M1
D1
L1
?apply

(X=V1array)
apply(X,1,sum) # sum the row of S1 & S2 array
apply(X,2, sum) #sum the column of S1 & S2
apply(X, 2, sqrt)
apply(X, 3, sum)
apply(X, 3, sqrt)
apply(X,c(1,2,3),sqrt)
apply(X,c(1,2), sum)  #c & D
apply(X, c(1,2,3), sum) # sum will not work here, will give original value

class(apply(X,1,sum))
addmargins(X,1,sum)
addmargins(X,2,sum)
addmargins(X,c(1,2), sum)
addmargins(X,c(1,3), sum)
M1
addmargins(M1,c(1,2), FUN = list(sum,mean)) # for multiple functions to be displayed it needs to be Table or Matrix
round(addmargins(M1,c(1,2), FUN = list(list(sum,sd),list(mean,var, IQR))),2) # to display multiple function in a row or column

#10/10/2017
m1 =matrix(1:24, nrow=4)
m1
mean(m1[1,])
#for loop to calculate the mean
for(i in 1:nrow(m1)){
    print(mean(m1[i,]))
  }
#using add margin to calculate the mean 
addmargins(m1,2,FUN=mean)
addmargins(m1,c(2,1),FUN=mean)
colMeans(m1)
rowMeans(m1)
addmargins(m1,c(2,1),FUN=c(mean,sum))
addmargins(m1,c(2,2,1),FUN=c(mean,sum,mean))


array5 = array(1:24,dim=c(3,4,2))
 array5
 apply(array5,c(1,3))
 apply(array5,c(1,3),sum)
 apply(array5,3,sd)#matrixwise sd
 apply(array5,c(2,3),mean)
 (x<- list(a=1,b=1:3,c=1:100))
 #lapply and Sapply
 #lapply is used for list and display result in list
 #sapply is used on list but display the result in vector
 lapply(x,FUN =length)
 lapply(x,FUN = sum)
 lapply(x,FUN = mean)
 lapply(x,FUN = sd)
 sapply(x,FUN = sum)
 #If our function returns a 2dimensional matrix,
 #sapply will do essentially the same thing
 #treating each returned matrix as a single long vector
 sapply(1:5,function(x)rnorm(3,x))
 func2= function(x){
   rnorm(3,x)
 }
 func2(1)
 sapply(1:5, func2)
sapply(1:5,function(x)matrix(x,2,2))
for(i in 1:5){
  matrix(i,2,2)
}

#mapply
#multivariate apply. Its purpose is to be able to vectorize arguments to a fu

Q1<- matrix(c(rep(1,4),rep(2,4),rep(3,4),rep(4,4)),4,4)
Q1
# same can be achieved by using mapply
Q2<- mapply(rep,1:4,5)
Q2
mapply(function(x,y)x^y,c(2,4,3),c(4,2,2))# to create two vectors using function where values return is x^y
mapply(function(x,y)x*y,c(3,5,7),c(6,8,9))
mapply(function(x,y,z,k){x+k}^{y+z},x=c(a=2,b=3),y=c(A=3,B=4),MoreArgs = list(z=1,k=2))
#values z & k are 1 &2 respectively and is constant

#eapply - like lapply except rathe rthan applying a function to every element in a list
#it applies a function to every elemnt in an environment. For example if u want to
# find a list of user defined functions in the global environment

A<-c(1,3,5,7,9)
B<-c(0,3,6,9,12)
c<-list(x=1,y=2)
D<-function(x){x+1}
ls()
lsf.str()
unlist(eapply(.GlobalEnv,is.function)) #convert list into vector
#will come handy if ur creating alot of packages or create a lot of environment
#output True and False

#Apply family - by (group by along with the function bemg performed)
#used for DF split by factors
mtcars
mtcars$am
mtcars$mpg
mtcars$am;mtcars$mpg
by(mtcars$mpg,mtcars$am,mean)

by(warpbreaks[,1:2],warpbreaks[,"tension"],summary)
by(data=mtcars[,"disp"],INDICES=mtcars[,c('vs','am')],mean)

#Vapply u basically give R an exampke what sort of thing ur function will return, can save time'
x
vapply(x,FUN=length, FUN.VALUE = 0L) #speed up the process of Lapply
 library(MASS)
str(painters)
school=painters$School
c_school=school=="c"
#tapply: Apply a summary function to a vector based on the levels of another vector
tapply(painters$Composition,painters$School, mean)

#sweep commande is applicabel on matrix only
(M=matrix(1:12,ncol=3))
M+1
M+c(1,2)
M+c(1,2,3)
#calculate the column wise mw=ean for M
(dx=colMeans(M))
(dx1=rowMeans(M))
#now sweep that summary statistics from M
sweep(M,2,dx,FUN= "-") #columnwise subtration mean from the matrix
sweep(M,1,dx1,FUN="+") #rowwise addition of the row with the rowmean
sweep(M,c(1,2),3,FUN = '+') #adding 3 to each datapoint of the matrix
sweep(M,c(1,2),1:12, FUN = "+")
M
