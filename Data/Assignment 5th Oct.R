df3 = read.csv(file='./Data/dsstudent2.csv') 
df3

str(df3)
summary(df3)
is.na(df3)
table(is.na(df3))# Displays total number of NA data
all(is.na(df3))
nrow(df3)#

complete.cases(df3) # rowwise NA data, false if data is missing
colSums(is.na(df3)) # column wise missing data
sum(!complete.cases(df3)) # rows not complete


# Rollnumber>Numeric, Name>character, course>factor, gender>factor, Hostel>Logical
#DoB>character, fees>Numeric, Email> Character, Mob>character, City>Character, 
#Subject marks>numeric
names(df3)
columnclass = c('numeric', NA, 'factor', 'factor' , 'logical', 'character', 'numeric',
                 'character', 'character', 'character', rep('numeric',5)) 
df3 = read.csv(file='./Data/dsstudent2.csv', colClasses = columnclass, as.is = T )
str(df3)

#Compute Age in years
str(df3$dob)
df3$dob = as.Date(df3$dob, format = "%d-%b-%y") # change the structure from character to date
df3$dob
str(df3$dob)
(df3$age = ceiling(as.numeric(difftime(Sys.Date(), df3$dob, unit = 'weeks'))/52.25))
head(df3$age)

#Add a new student
df3[12,]=c(17000, "Ramesh Singh", "MSCDS","","TRUE", "1994-10-17", 50000, "ramesh@gmail.com","", "Delhi","" ,"" ,"" ,"","")
df3$dob = as.Date(df3$dob, format = "%d-%b-%y")
df3
str(df3)
(df3$age = ceiling(as.numeric(difftime(Sys.Date(), df3$dob, unit = 'weeks'))/52.25))
head(df3$age)
# Convert the column classes
df3$hostel= as.logical(df3$hostel) # Hostel as logical
df3$hostel
names(df3)
df3$rollno= as.numeric(df3$rollno) # Roll number as numeric
df3$rollno
df3$fees = as.numeric(df3$fees) #Fees as numeric
df3$rpgm = as.numeric(df3$rpgm) #marks as numeric
df3$excel= as.numeric(df3$excel)
df3$sql= as.numeric(df3$sql)
df3$stats = as.numeric(df3$stats)
df3$age = as.numeric(df3$age)
str(df3)
colSums(is.na(df3)) # check if column has any NA value
# Assign the value to NA field using mean, default, median, max, min values
df3$excel[is.na(df3$excel)]= mean(df3$excel, na.rm=T) 
df3$excel
df3$gender[is.na(df3$gender)] = "M"
df3$gender
df3$hostel[is.na(df3$hostel)] = T
df3$hostel
df3$fees[is.na(df3$fees)]= mean(df3$fees, na.rm=T)
df3$fees
df3$rpgm[is.na(df3$rpgm)]= median(df3$rpgm, na.rm = T)
df3$rpgm
df3$sql[is.na(df3$sql)] = min(df3$sql, na.rm= T)
df3$sql
df3$stats[is.na(df3$stats)]= max(df3$stats, na.rm=T)
df3$stats

# Create a table with Rollnumber as first row and marks, find the total sum, mean and median
df3a = data.frame(df3)
df3a
col(df3a)
df3aa=as.table(as.matrix((round(head(df3a[,c(1,11:14)])))))
df3aa
str(df3aa)
round(addmargins(df3aa,c(2,1,1),list(sum,mean,median)))

#Summary table: Course and Gender wise
Table2 = table(df3$course,df3$gender)
Table2
addmargins(Table2)
#Prop Table
prop.table(Table2)
 # Total marks, Grade and Rank
Table3 = df3[,c(1,2,11:14)]
Table3
Table3$Total = round(rowMeans(Table3[,3:6])) #Total marks student and roll no wise

Grades = function(x){
  if(x>70){
    print ('A')
  } else if (x>=60 & x<=70){
    print ('B')
  }  else {
    print ('c')
  }
}
  
for (i in c(1:12)){
  Table3$Grade[i] <- Grades(Table3$Total[i])
}
Table3
#Rank
Table3$Rank = round(rank(-Table3$Total, ties.method = 'random'))
Table3$name[Table3$Rank==5] # Showing Shruti Sinha

#Rowwise & Columnwise means-
rpgm1 = c(df3$course,df3$rpgm)
rpgm1
Table4 <- df3[,c(3,11,12,13,14)]
Table4
str(Table4)
table(Table4)
