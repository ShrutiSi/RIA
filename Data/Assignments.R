month <- c('January', 'February', 'March', 'April', 'May', 'June', 'July',
           'August', 'September', 'October', 'November', 'December')
high_2000 <- c(32.5, 37.6, 49.9, 53.0, 69.1, 75.4, 76.5, 76.6, 70.7, 60.6, 45.1, 29.3)
low_2000 <- c(13.8, 22.3, 32.5, 37.2, 49.9, 56.1, 57.7, 58.3, 51.2, 42.8, 31.6, 15.9)
data1 <- data.frame(month, high_2000,low_2000)
data1
mean(data1$high_2000)
sd(data1$high_2000)
par(mar = c(1,1,1,1))
par('mar')
par(mfrow=c(2,2))
par("mfrow")
qqnorm(data1$high_2000,main="Normal Q-Q Plot of the Temperature",
       xlab="Theoretical Quantiles of the 2007 High Temp",
       ylab="Sample Quantiles of the 2007 High Temp")
qqline(data1$high_2000)

qqnorm(data1$low_2000,main="Normal Q-Q Plot of the Temperature",
       xlab="Theoretical Quantiles of the 2007 High Temp",
       ylab="Sample Quantiles of the 2007 High Temp")
qqline(data1$low_2000)

      # Assignment - 3
      
#1.
Quarter = c("Q1", "Q2", "Q3", "Q4")
Sales = c(10000, 13000, 12000, 15000 )
Coy1 = data.frame(Quarter, Sales)
Coy1       
#Graph

plot(Coy1$Quarter,Coy1$Sales, type = "l", labels(Coy1$Quarter), main = "Company Quarter Sales",
                                      xlab = "Quarter", ylab = "Sales"   ) 
barplot(Coy1$Sales, names.arg = Coy1$Quarter, main = "Company Quarter Sales",
        xlab = "Quarter", ylab = "Sales"   ) 

Q1 = Coy1[Coy1$Sales>11000,]
Q1
Q3 = Coy1[Coy1$Quarter== "Q3",2]
Q3

#2
Rollcall = sample(c('A','P'), size=30, replace=T, prob = c(0.2, 0.8)) 
Rollcall
Attendance = factor(Rollcall)
Attendance
table(Attendance)

#3
set.seed(1000)
P1 = ceiling(runif(10 ,min = 30,max = 100))
P1

set.seed(1100)
P2 = ceiling(runif(10 , min=30, max=100))
P2

set.seed(1200)
P3 = ceiling(runif(10, min =30, max = 100))
P3

set.seed(1300)
P4 = ceiling(runif(10, min =30, max = 100))
P4

set.seed(1400)
P5 = ceiling(runif(10, min =30, max = 100))

Player = matrix(c(P1,P2,P3,P4,P5), nrow = 5)
Player
rownames(Player) = c("Player1","Player2","Player3","Player4","Player5")
colnames(Player) = c('M1','M2','M3','M4','M5','M6','M7','M8','M9','M10')
Player

rowMeans(Player)
colMeans(Player)

#4
Guests = c("Achal", "Apoorva", "Lalit", "Goldie")
Guests
Hosts = matrix(c("BSc","Animation", "LLB", "Law", "MSc", "DS",50,40,10,20,16,4,24,19,5), nrow = 3)
colnames(Hosts) = c("Course", "School", "No.", "Male", "Female")
Hosts
rownames(Hosts) =c(1,2,3)
Bills = matrix(c(100,500,300,200,400,150,500,400,230,700), nrow=2)
Bills
colnames(Bills)= c("B1","B2", "B3", "B4","B5")
rownames(Bills) = c("Decoration", "Food")
Bills
cat("Total Decoration Expense -", sum(Bills[1,]))
cat("Total Food Expense -", sum(Bills[2,]))
cat("Male among Guest -", Hosts[,4])

# Remaining question will be submitted tom
