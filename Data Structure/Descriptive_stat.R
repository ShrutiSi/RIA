origin = c("USA","USA", "India", "India", "China", "China", "China")
Invoice = c(100,100,10000,12000,10,20,15)
S1 = data.frame(origin,Invoice)
S1
str(S1)
Agg = aggregate.data.frame(origin~Invoice, data = S1, mean)
Agg
?aggregate.data.frame
library(pastecs)
library(psych)
library(doBy)
?summaryBy
summaryBy(Invoice~origin, data = S1, FUN= c(mean, var, sd))
