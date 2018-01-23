Ttrain = read.csv(file ='./Data/train1.csv', stringsAsFactors =
                    F,header = T,as.is = T, na.strings = c(""))
str(Ttrain)
summary(Ttrain)
Ttest= read.csv(file ='./Data/test1.csv', stringsAsFactors = F,header = T,as.is = T, na.strings = c(""))
str(Ttest)
#Checking missing values
as.data.frame(colSums(is.na(Ttrain)))
library(Amelia)
missmap(Ttrain, main = "Missing values vs Observed")

Ttrain1 = subset(Ttrain,select = -c(Cabin,PassengerId,Ticket, Name))

#Age (with mean)
Ttrain1$Age[is.na(Ttrain1$Age)]<-mean(Ttrain1$Age, na.rm = TRUE)

#Imputing the missing values of categorical variables
str(Ttrain1$Embarked)
Ttrain1$Embarked<-as.factor(Ttrain1$Embarked)
str(Ttrain1$Sex)
Ttrain1$Sex<-as.factor(Ttrain1$Sex)

contrasts(Ttrain1$Embarked)
contrasts(Ttrain1$Sex)

#Removing the two missing values of Embarked from the dataset

Ttrain1<-Ttrain1[!is.na(Ttrain1$Embarked),]
rownames(Ttrain1)<-NULL
Ttrain1
colSums(is.na(Ttrain1))

library(caTools)
set.seed(113)
spl = sample.split(Ttrain1$Survived, 0.85)
Ttrain_t = subset(Ttrain1, spl == TRUE)
Ttrain_v = subset(Ttrain1, spl == FALSE)
nrow(Ttrain_t)
nrow(Ttrain_v)

#Inital Model- 1st Iteration 
Model1<-glm(Survived~.,family = binomial(link = 'logit'), data = Ttrain_t)
summary(Model1)

Model2<- glm(Survived~Pclass+Sex+Age+SibSp+Embarked,family = binomial(link = 'logit'), data = Ttrain_t)
summary(Model2)

Model3<- glm(Survived~Pclass+Sex+Age+SibSp+I(Embarked == "S"),family = binomial(link = 'logit'), data = Ttrain_t)
summary(Model3)

Model3$coefficients
#changes in odd ratio
#coefficients(Odds Ratio)
exp(Model3$coefficients)

library(car)
#to check multicollinearity of independent variables, 
vif(Model3)

#Residual vs Null Deviance
anova(Model3, test = "Chisq")

#Goodness of Fit of the Model
#install.packages(BaylorEdPsych)
library(BaylorEdPsych)
#to compute R square for logistic model amd rsquare shd be less than 0.5, value between .35 and .45
PseudoR2(Model3)


#Assessing the predictive power of the model
#Predicted Probabilities
pred_sur=predict(Model3,newdata=Ttrain_v,type="response")
pred_sur_n=ifelse(pred_sur>0.5,1,0)

library(caret)
confusionMatrix(pred_sur_n,Ttrain_v$Survived)
Ttrain1$Survived<-as.factor(Ttrain1$Survived)

#Building the AUC Curve
library(ROCR)

pr <- prediction(pred_sur, Ttrain_v$Survived)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf)

auc <- performance(pr, measure = "auc")
auc <- auc@y.values[[1]]
auc
