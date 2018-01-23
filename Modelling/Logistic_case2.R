loans = read.csv(file='./Data/loans.csv')
loans
str(loans)
loans$purpose = as.factor(loans$purpose)
loans$credit.policy= as.factor(loans$credit.policy)
loans$not.fully.paid= as.factor(loans$not.fully.paid)

as.data.frame(colSums(is.na(loans)))

library(Amelia)
missmap(loans, main = "Missing values vs Observed")

#Treating the missing values using the MICE Package
#install.packages("MICE", dependencies = TRUE)
library(mice)
set.seed(144)
(vars.for.imputation = setdiff(names(loans), "not.fully.paid"))
imputed = complete(mice(loans[vars.for.imputation]))
loans[vars.for.imputation] = imputed
as.data.frame(colSums(is.na(loans)))

#Creating Train and Test data
library(caTools)
set.seed(144) 
sample = sample.split(loans$not.fully.paid,0.70)
loans_train = subset(loans, sample == T )
loans_test = subset(loans, sample == F)
str(loans_train)
nrow(loans_test)
nrow(loans_train)
names(loans)
#Modeling
Model1<-glm(not.fully.paid~.,family = binomial(link = 'logit'), data = loans_train)
summary(Model1)

Model2<- glm(not.fully.paid~ credit.policy+I(purpose == "credit_card")+I(purpose== "debt_consolidation")+I(purpose=="major_purchase")+I(purpose=="small_business")+installment+log.annual.inc+fico+revol.bal+inq.last.6mths+pub.rec ,family = binomial(link = 'logit'), data = loans_train)
summary(Model2)

?stargazer
stargazer(Model1, Model2, type = "text", out = "LC_2.txt")

library(car)
vif(Model2)

anova(Model2, test = "Chisq")

library(BaylorEdPsych)

PseudoR2(Model2)

pred_loan=predict(Model2,newdata=loans_test,type="response")
pred_loan_n=ifelse(pred_loan>0.5,1,0)


#Building the Confusion Matrix
library(caret)
confusionMatrix(pred_loan_n,loans_test$not.fully.paid)