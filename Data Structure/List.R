a='My First List'
a
b=c(25,26,18,39)
b
c=matrix(1:10,nrow=2)
c
d=c("one","two","three","Four")
d
b;c;d
e=data.frame(b,c,d)
f=c("A","B","C","D")
f
e=data.frame(b,d,f,stringsAsFactors = F)
e
colnames(e)=c("age","name","code")
e
str(e)
a;b;c;d;e;f
mylist=list(a,b,c,d,e,f)
mylist
str(mylist)
mylist=list(String=a, vector=b,matrix=c,d,e,f)
mylist[1]
mylist[3]
mylist['vector']
sum(mylist['vector']) #doesnot work bcoz it is list
sum(mylist[['vector']]) #works bcoz it is vector

mylist[[5]]$name
    