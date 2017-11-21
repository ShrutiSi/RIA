?scale
a = c(1,3,5,7,9,2,4,6,8,10)
#scale creates a mid value
(x1 = scale(a,scale=F,center=F))
#center: x - midvalue(5.5), it is taking a mean and reducing all the values
(xc = scale(a,scale = F, center=T))
# we can define the midvalue by giving value at center
(xc1 = scale(a,scale = F, center = 4))
cbind(a,-4,xc1) # only for visualization, to show how scale works
round((xs = scale(a, scale = T, center = F)),2)
#try doing it manually
(rmse = sqrt(sum(a^2)/(length(a)-1)))
round((xs2=(a/rmse)),2)
# scaling as true and center also
round((xsc = scale(a,scale=T, center=T)),2)
#doing it manually
round((zscore=(a-mean(a))/sd(a)),2)

# for two variables like matrix
x = matrix(1:10,ncol=2)
x
(x1=scale(x,center = T, scale = F))
(x11 = scale(x, center = c(2,7), scale = F))
(x11 = scale(x, center = c(2,7), scale = T))# when u change the scale to true

(x2 = scale(x, center= T, scale = T))
