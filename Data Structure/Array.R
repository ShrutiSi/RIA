#Array
# 2 companies: each com has 3dept:each dept has 4salesperson
company=c('com1','com2')
company
department=c('dept1','dept2','dept3')
department
salesman=c('salesman1','salesman2','salesman3','salesman4')
salesman
set.seed(1234)
sales=ceiling(runif(2*3*4,50,100))
cat(sales)
mean(sales)
sales; length(sales)
?array
salesarray=array(sales,c(4,3,2),dimnames=list(salesman,department,company))
salesarray
colnames(salesarray)
rownames(salesarray)
dimnames(salesarray)
length(salesarray)
dim(salesarray)
class(salesarray)
salesarray[3,2,1]
salesarray[4,1,2]
salesarray[3,2,]
salesarray[1,,]
salesarray[,3,]
salesarray[,,1]
apply(salesarray,c(1),sum) # salesmanwise
apply(salesarray,c(2),sum) #departmentwise
apply(salesarray,c(3),sum) #companywise
apply(salesarray,c(2,3),sum) #all salesman by dept and companywise
apply(salesarray,c(1,2,3),length) #companywise =number
