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

