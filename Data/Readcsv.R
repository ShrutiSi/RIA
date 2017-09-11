# to import data from excel
?read.csv
getwd()
file.show()

df1=read.csv(file='./Data/DSStudent.csv') # read csv file
df1
str(df1)
#If u don't want to upload all character as Factor then give the following command
df1=read.csv(file='./Data/DSStudent.csv', stringsAsFactors = F)
# another way to choose a file when u have not upload in R
df1a = read.csv(file = file.choose())
df1a
names(df1) # give the column names
colcls = c('numeric', NA, 'factor', 'factor' , 'logical', 'character', 'numeric',
           'character', 'character', 'character', rep('numeric',4)) 
# rep(numeric,4) : repeat the structer for next four column
colcls
df2 = read.csv(file='./Data/DSStudent.csv', colClasses = colcls, as.is = T )
str(df2)
names(df1)

as.Date('1967-10-15') # right format is y-m-d; %y-%b-%d - learn it, use capital Y and capital M for full name or year
?as.Date
as.Date("15-10-67", format= "%d-%b-%y")
as.Date("05-10-1967", format = "%d-%b-%y")

str(df2$dob)
df2$dob = as.Date(df2$dob, format = "%d-%b-%y") # change the structure from character to date
df2$dob
str(df2$dob)
Sys.Date()- df2$dob # days = age
# to compute the age in years, following command to be given
difftime(Sys.Date(), df2$dob, unit = 'weeks')
(df2$age = ceiling(as.numeric(difftime(Sys.Date(), df2$dob, unit = 'weeks'))/52.25))
head(df2$age)
str(df2)
df2[df2$age>30,][1:2] # filter the data, find all students whose age is more than 30
df2[df2$gender == 'M' & df2$course == 'PGDDS', ][1:2]
