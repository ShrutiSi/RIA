# 1
(x= seq.int(10,200,length.out = 40)) # 40 Integers
(y=matrix(x,ncol = 8)) #Matrix with 8Columns
class(y)
apply(y,1,prod) # product of row elements
apply(y,2,sum) #sum of each column
(Z = sweep(M,1,10,FUN = '%%')) # modulo of matrix value
(A = sweep(M,1,2,FUN = '%%')) # odd numbers in column where we have remainder of 1
(i = iris) # view IRIS
i
class(i)
is.na(i)
#Mean of first four variables grouped by species
M1<- aggregate.data.frame(i,by=list(i$Species),FUN=mean,simplify =T, drop =T) 
M1

#2
# Create a new environment
e <- new.env()
# two environment variables, a - matrix and b as an array
e$a <- matrix(1:12,nrow=4)
e$b <- array(c(1:3*4*2),dim=c(3,4,2))
#mean
mean(e$a)
mean(e$b)
class(e$a)
class(e$b)

#3
L1 = list(1:20,55:100, mtcars$mpg,mtcars$wt )
L1
# Sum of values
lapply(L1,FUN = sum)
# print the values in Vector form
sapply(L1,sum)

#4
V1 = array(1:24,dim=c(4,3,2) )
V1
#SUmmary statistics
sweep(V1,1,mean(V1),FUN="-")
#Dataset Attitude
attitude
dim(attitude)
class(attitude)
summary(attitude)
#Median of column
M1 = apply(attitude, 2,median)
M1
# Subtract median of each column to respective of value of that column
sweep(attitude,2,M1,FUN = "-")
#Create an array of values 1 to 24 with 3 dimension - 4,3,2
AR1 = array(1:24,dim=c(4,3,2) )
AR1
#Subtract 5 from each row dimension values
sweep(AR1,1,5,FUN = "-")
#Find minimum of each row dimension values
(minm = apply(AR1,1,min))
# subtract this minimum value from each row dimension values
sweep(AR1,1,minm,FUN = "-")
# subtract median value across row & col dimensions
(med = apply(AR1,c(1:2),median))
sweep(AR1,c(1:2),med)

#5
# create data frame
(x = data.frame(subject = c("Lalit", "Vijay"),    time = c(1,1), age = c(33,NA),   weight = c(80, NA),  height = c(2,2)) )
