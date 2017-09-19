set.seed(1123)
marks=ceiling(runif(11,5,10))
marks
sort(marks)
order(marks) # indices
marks[order(marks)] # similar to sort
rank(marks)
sort(rank(marks))
sort(marks, decreasing = T)
rev(sort(marks))
order(marks, decreasing = T)
marks2 = marks
marks2[5 ] =NA # check with NA value: display position
marks2
order(marks2)
order(marks2, na.last = NA) # removes NA from order or indexing
is.na(marks2)
anyNA(marks2)
mean(marks2) # mean will not work if there is NA value
mean(marks2, na.rm =T) #add na.rm=T to remove NA value
order(marks2, na.last=NA) # removed
order(marks2, na.last= FALSE) # shows NA value first
order(marks2, na.last= T) # shows NA value last
        
?rank
table(marks)
# ties method available are average, first, last, random, max, min
rank(marks, ties.method = 'first') #based on order, it gives rank
rank(marks, ties.method = 'average') 
rank(marks, ties.method = 'max')
rank(marks, ties.method = 'random')

#SOrt dataframe and not just column by age:
sort(df2$age) 
df2$name[order(df2$age)] #sort by age; display by name
df2$name[order(-df2$age)] #sort by descending age
df2$name[]
df2[order(df2$age),c("name", "age")] # retrive data from order command and then print name and age accordingly
df2$name[rev(order(df2$age))] # when u want to reverse the order
df2[order(df2$hostel,df2$age), c("name", "age", "hostel")] # sort by hostel and age
df2[order(df2$hostel,-df2$age), c("name", "age", "hostel")] # sort by hostel and rev age

df2

