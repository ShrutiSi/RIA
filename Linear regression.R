# Simple Linear regression y = mx + c, has only one factor
data(women)
women
# contains height and weight of US women
str(women)
attach(women)
cov(women$height,women$weight) # cov gives u directions, not magnitude
cor(women$height, women$weight) #correlation gives u magnitude with direction
(weight.lm = lm(weight ~ height, data = women)) # to print the values put the braacket before the model name
summary(weight.lm)
plot(women$height, women$weight)
abline(weight.lm, col = "red") # best fit line for graph
abline(v=c(62,64,66,68)) # to create a vertical line in a graph
abline(h= c(120,140,160)) # to create horizontal line
