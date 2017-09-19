#Margin Table

parties1 = c("bjp", "congress", "sp", "aap")
length(parties1)
states1 = c("UP", "Delhi","Haryana","punjab", "UK")
length(states1)
set.seed(1234)
Seats = c(ceiling(runif(20,25,50)))
Seats
sum(Seats)
PartyDF = data.frame(parties1,states1,Seats)
PartyDF
table(PartyDF$parties1,PartyDF$Seats)
sort(PartyDF$parties1[order(PartyDF$states1)])
ftable(PartyDF)

# alternate way of doing it
col1 = rep(parties1, each=5)
col1
col2= rep(states1, times=4)
col2
cbind(col1,col2)
party=factor(col1)
state=factor(col2)
set.seed(1234)
(mps= ceiling(runif(20,25,50)))
sum(mps)
DF2= data.frame(party,state,mps)
#table doesnot work for dataframe, u can also use it for vector or one column
ftable(DF2)
table(DF2[,c("party", "state")])

table(DF2[,c("party", "state")], dnn=list('Political parties', 'State of India'))

# Cross tab method or formula method
xtabs(mps~party+state, data = DF2)
states2 =c('UP', 'Delhi') #vector of state name, few name
xtabs(mps~party+state, data = DF2, subset = state %in% states2, 
      drop.unused.levels = T) # when u want to show select few states only
party2 =c("bjp", "congress")
xtabs(mps~party+state, data = DF2, subset = party %in% party2, 
      drop.unused.levels = T)

xtabs(mps~party+state, data = DF2, subset = party %in% party2 & state %in% states2, 
      drop.unused.levels = T) # when u want to show selected party and state

# Margins----
matresults = xtabs(mps~party+state, data = DF2)
matresults
str(matresults)
margin.table(matresults, margin=NULL) # total MPS
margin.table(matresults, margin=1) # total MPs in party rows
margin.table(matresults, margin=2) # total Mps in states
margin.table(matresults, margin=3) # will give error as it is two dimensional
addmargins(matresults, 2, sum) #to add sum total by party and insert a new column

# Proportion Table ----
prop.table(matresults, margin = NULL ) # proportion of total
(round(prop.table(matresults, margin = NULL ),2)) #round the proportion to 2decimal points
sum(round(prop.table(matresults, margin = NULL ),2)) # should add upto 1

(p1 = round(prop.table(matresults, margin=1),2)) # proportion row wise, 
#shd give margin=1 for row and 2 for column
rowSums(p1) # shows the row total of party by proportion
addmargins(p1,2, sum)
(p2 = round(prop.table(matresults, margin=2),2))# proportion column wise
addmargins(p2,1,sum)

addmargins(p2)
addmargins(p2,1)
addmargins(p2,2) # Sum will not be equal to 1

