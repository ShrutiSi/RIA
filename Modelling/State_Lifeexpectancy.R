read.csv(file ='./Data/statedata.csv')
State = read.csv(file ='./Data/statedata.csv', stringsAsFactors = F,header = T,as.is = T)
State
str(State)
summary(State)
colSums(is.na(State))
State_ctn = subset(State, select = c(Population, Income,Illiteracy, Life.Exp , Murder, HS.Grad, Frost, Area, state.area,  x, y ))
State_cat = subset(State, select = -c(Population, Income,Illiteracy, Life.Exp , Murder, HS.Grad, Frost, Area ))
State_cat
State_ctn

library(pastecs)
library(boot)
options(scipen = 100) # if data is in exponential then we make the data in numeric
options(digits = 2) # setting the decimal to 2
stat.desc(State_ctn)

#categorical values
as.matrix(sort(table(State_cat$state.division), decreasing = TRUE))
as.matrix(sort(table(State_cat$state.name), decreasing = TRUE))
as.matrix(sort(table(State_cat$state.region), decreasing = TRUE))

#Data Visualisation
plot(State$x,State$y, xlab = "longtitude of centres", ylab = "latitude of centres", main = "PLOT OF STATE CENTRES")

# About Highest Median High School Graduation Rate

boxplot(State$HS.Grad ~ State$state.region, xlab = "Region of USA", ylab = "High School Graduation Rate", main = "Distribution of High School Graduation Rate")

#Inital Model- 1st Iteration 
#Converting Character into Factor Variables
State$state.region<-as.factor(State$state.region)
State$state.division<-as.factor(State$state.division)
State$state.name<-as.factor(State$state.name)


Model1<-lm(Life.Exp~ Population + Income + Illiteracy + Murder + HS.Grad + 
             Frost + Area + x + y + state.division   + state.region,
           data = State)
summary(Model1)

#2nd Iteration
Model2<-lm(Life.Exp~ Population + Income + Illiteracy + Murder + HS.Grad + 
             Frost + Area,
           data = State)
summary(Model2)

#3rd Iteration
Model3 = lm(Life.Exp~Population + Murder + HS.Grad + 
              Frost, data = State)
summary(Model3)

#4th Iteration
Model4 = lm(Life.Exp~Population  + Murder + x+y , data = State)
summary(Model4)
library(car)
as.data.frame(vif(Model4)) # checking multicolliniarity, shd be less than or equal to 1.7

#Further Data Exploration (for Income)
plot(State$Life.Exp, State$Income)
