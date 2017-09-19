df2
rollno = rep(c(10,11,12,13),4)
rollno
(sname = rep(c("Achal","Apporva", "Goldie", "Hitesh"), 4))
(examunit= rep(c("u1", "u2", "u3", "u4"), each =4))
set.seed(1234)
(rpgm = ceiling(rnorm(4*4,60,10)))
set.seed(1234)
(sql = ceiling(rnorm(4*4, 65,10)))
df1 = data.frame(rollno,sname,examunit,rpgm,sql)
df1
str(df1)

#melt the data : wide to long (more rows)
library(reshape)
md= reshape::melt(df1,id=c("rollno", "sname", "examunit"))
md[md$rollno==12,]

#cast ----
#without aggregation, important
reshape::cast(md,rollno+sname+examunit~variable)
reshape::cast(md, rollno + sname +variable~ examunit)
reshape::cast(md, rollno+sname ~variable ~examunit) # gives mark unitwise, array structure

