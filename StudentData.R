df = read.csv((file= './data/dsstudent2.csv'))
df
str(df)
summary(df)
is.na(df)
anyNA(df)
table(is.na(df))
all(is.na(df))
all(is.na(df)==F | is.na(df)==T) # is NA True or NA False

complete.cases(df) # gives row wise true false data whether data is complete;
                    #false if data is missing
!complete.cases(df) # not complete is "True"
sum(complete.cases(df)) # rows which are complete, have all the data
sum(!complete.cases(df)) # rows not complete
df[complete.cases(df),][1:2] # list the name and roll number of all the student where 
                            #data is complete
mean(df$excel) # will not get mean as it has na value
mean(df$excel, na.rm = T) # to get mean if there is a NA value
mean(df$excel, na.rm = T, trim=.2) # trimming the extreme values or outliers
df$excel
na.omit(df$excel) # deleting rows which has NA value
na.omit(df)[1:2]

colSums(is.na(df)) # displays the NA value at column level
apply(df,2,function(x) sum(is.na(x))) # can use apply function also to get the same output as before
# to replace NA value with the mean value, use following command
df$excel[is.na(df$excel)]= mean(df$excel, na.rm=T)
df$excel

df$sql[is.na(df$sql)] = max(df$stats) # replace Sql missing value with max stats marks'
df$sql
df

