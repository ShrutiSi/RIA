#Simple example in Cart/ decision tree
train1 = data.frame(rollno = c(1,2,3), gender = c("M","M", "F"), play = c('Play', 'NotPlay', 'Play'))
train1
library(rpart)
?rpart
tree1 = rpart(play~gender, data = train1, method = 'class')
tree1
train2 = data.frame(rollno = c(1,2,3,4), gender = c("M","M", "F", "F"), play = c('NotPlay', 'NotPlay', 'Play','Play'))
train2
tree2 = rpart(play~gender, data = train2, method = 'class')
tree2
tree3 = rpart(play~gender, data = train2, method = 'class', minsplit = 1, minbucket =1)
tree3
train3 = data.frame(rollno = c(1,2,3,4,5,6,7), gender = c("M","M", "F","M", "F", "F","M"), play = c('Play', 'Play','NotPlay','NotPlay', 'NotPlay', 'NotPlay','Play'))
table(train3$gender,train3$play)
tree3 = rpart(play~gender, data = train3, method = 'class', minsplit = 2, minbucket =1, cp = -1)
tree3
library(rattle)
library(rpart.plot)
fancyRpartPlot(tree3)
train3$married = c('Married', 'single', 'Married', 'Married','single', 'Married', 'single' )
train3
tree4 = rpart(play~gender+married, data = train3, method = 'class', minsplit = 2, minbucket =1, cp = -1)
tree4
fancyRpartPlot(tree4)
tree_4 = rpart(play~gender+married, data = train3, method = 'class', minsplit = 2, minbucket =1)
tree_4
tree4$where
