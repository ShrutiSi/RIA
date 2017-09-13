getwd()
df2 = read.csv(file='./File/DSStudent.csv', stringsAsFactors = F) 
df2
# To give row names to the imported csv file
df2 = read.csv(file='./File/DSStudent.csv',row.names = c(paste("R", 1:11, sep ="")))

df2 = read.csv(file='./File/DSStudent.csv',row.names = 1)
head(df2[,1:2]) # remove the row numbering and take roll number as first column
df2$rollno2 = row.names(df2) # add the row number again in the end
df2[,c("rollno2")]
str(df2)

#Save single object in RDS
saveRDS(object=df2, file='./data/shruti.RDS')
markstotal = runif(11,50,150)
save(markstotal,df2,file='./data/shruti.RData') # save multiple objects in R
save.image(file='./data/shruti1.RData') #save all current objects/ multiple oblects
save.image() # saves to default RData

mydata = readRDS(file='./Data/shruti.RDS')
#load() # for data in .RData this happens automatically
load(file= './data/shruti.RData')
load(file= './data/shruti1.RData')
