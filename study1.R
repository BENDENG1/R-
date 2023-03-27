d <- 100:200
d
d[91:100]
d[d%%2==1]
d[d%%3==0]
d.20 <-d[1:20]
d.20
d.20[-5]
d.20[-c(5,7,9)]

absent <- c(10,8,14,15,9,10,15,12,9,7,8,7)
names(absent) <- c('JAN','FEB','MAR','APR','MAY','JUN', 'JUL','AUG','SEP','OCT','NOV','DEC')
absent
absent['MAY']
absent[c('JUL','SEP')]
#(4)
sum(absent[1:6])
#(5)
mean(absent[7:12])


#3
d1 <- 1:50
d2 <- 51:100
#(1)
d1
d2
#(2)
length(d2)
#(3)
d1+d2
d2-d1
d1*d2
d2/d1
#(4)
sum(d1)
sum(d2)
#(5)
sum(c(d1,d2))
sum(d1)+sum(d2) # 방법 2
#(6)
max(d2)
min(d2)
#(7)
abs(mean(d2)-mean(d1))
#(8)
sort(d1, decreasing = T)
#(9)
d3 <- c(d1[1:10], d2[1:10])
d3
d3 <-c(sort(d1)[1:10], sort(d2)[1:10]) # 더 정확한 답


v1 <- 51:90

#(1)
v1[v1<60]
#(2)
length(v1[v1<70])
#(3)
sum(v1[v1>65])
#(4)
v1[v1>60 & v1<73]
#(5)
v1[v1<65 | v1>80]
#(6)
v1[v1%%7==3]
#(7)
v1[v1%%7==0] <- 0
v1
#(8)
v1 <- 51:90
sum(v1[v1%%2==0])
#(9)
v1[v1%%2==1 | v1>80]
#(10)
v1[v1%%3==0 & v1%%5==0]
#(11)
v1[v1%%2==0] <- v1[v1%%2==0]*2
v1
#(12)
v1 <- 51:90
v1 <- v1[v1%%7 != 0]
v1



#(1)
st <- data.frame(state.x77)
#(2)
st
#(3)
colnames(st)
#(4)
rownames(st)
#(5)
nrow(st) # 행의개수
ncol(st) # 열의개수
dim(st) # 행과 열의 개수
#(6)
str(st)
#(7)
rowSums(st)
rowMeans(st)
#(8)
colSums(st)
colMeans(st)
#(9)
st['Florida',]
#(10)
st[,'Income']
#(11)
st['Texas','Area']
#(12)
st['Ohio',c('Population','Income')]
#(13)
subset(st, Population>=5000)
#(14)
subset(st, Income>=4500, select = c('Income','Area')) # 방법1
subset(st, Income>=4500)[,c('Income','Population','Area')]
#(15)
nrow(subset(st, Income>=4500))
#(16)
subset(st, Area>=100000 & Frost > 120)
#(17)
subset(st, Population<2000 & Murder < 12)
#(18)
# 방법 1
check <- subset(st, Illiteracy>=2.0)
check <- check$Income
mean(check)
# 방법 2
mean(subset(st, Illiteracy>=2.0)$Income)
#(19)
# 방법 1
tmp1 <- subset(st, Illiteracy<2.0)
tmp1 <- tmp1$Income
tmp2 <- subset(st, Illiteracy>=2.0)
tmp2 <- tmp2$Income
abs(mean(tmp1)-mean(tmp2))
# 방법 2
abs(mean(subset(st, Illiteracy<2.0)$Income) - mean(subset(st, Illiteracy>=2.0)$Income))
#(20)
high.life <- max(st$ Life.Exp)
rownames(subset(st, Life.Exp== high.life))
#(21)
pen.income <- st['Pennsylvania','Income']
rownames(subset(st, Income > pen.income))



#(1)
class(mtcars)
#(2)
nrow(mtcars)
ncol(mtcars)
dim(mtcars)
#(3)
str(mtcars)
#(4)
help 창에서 mtcars 입력하여 검색
[, 1] mpg Miles/(US) gallon (자동차의 연비)
[, 2] cyl Number of cylinders
[, 3] disp Displacement (cu.in.)
[, 4] hp Gross horsepower
[, 5] drat Rear axle ratio
[, 6] wt Weight (1000 lbs)
[, 7] qsec 1/4 mile time
[, 8] vs Engine (0 = V-shaped, 1 = straight)
[, 9] am Transmission (0 = automatic, 1 = manual)
[,10] gear Number of forward gears
[,11] carb Number of carburetors
#(5)
max.mpg <- max(mtcars$mpg)
rownames(mtcars[mtcars$mpg==max.mpg,]) 
rownames(subset(mtcars, mpg==max.mpg)) # 방법 2
#(6)
min.mpg <- min(mtcars[mtcars$gear==4,'mpg'])
rownames(mtcars[mtcars$mpg==min.mpg,]) # 방법 1
rownames(subset(mtcars, mpg==min.mpg)) # 방법 2
#(7)
mtcars['Honda Civic',c('mpg','gear')]
#(8)
pon.mpg <- mtcars['Pontiac Firebird','mpg']
rownames(mtcars[mtcars$mpg>pon.mpg,]) # 방법 1
rownames(subset(mtcars, mpg>pon.mpg)) # 방법 2
#(9)
mean(mtcars$mpg)
#(10)
unique(mtcars$gear)



#(1)
class(airquality)
#(2)
head(airquality)
#(3)
max.temp <- max(airquality$Temp)
airquality[airquality$Temp==max.temp, c('Month','Day')] # 방법 1
subset(airquality, Temp==max.temp, select=c('Month','Day')) # 방법 2
#(4)
max(airquality[airquality$Month==6,'Wind'])
#(5)
mean(airquality[airquality$Month==7,'Temp'])
#(6)
# 방법 1
condi <- airquality$Month==5 & !is.na(airquality$Ozone)
mean(airquality[condi,'Ozone'])
# 방법 2
condi <- airquality$Month==5
mean(airquality[condi,'Ozone'])
#(7)
nrow(airquality[airquality$Ozone>100 &
                  !is.na(airquality$Ozone),]) # 방법 1
nrow(subset(airquality, Ozone>100)) # 방법 2

#8번이다.
#(1)
str(swiss)
#(2)
rownames(subset(swiss, Agriculture==max(swiss$Agriculture)))
#(3)
#방법 1
tmp <- swiss[order(swiss$Agriculture, decreasing=T),]
tmp['Agriculture']
#방법 2
swiss[order(swiss$Agriculture, decreasing=T),]['Agriculture']
#(4)
subset(swiss, Catholic>=80, select=c('Agriculture'))
#(5)
subset(swiss, Examination<20 & Agriculture<50,select=c('Examination','Agriculture'))


#9번이다.
weight<-c(69,50,55,71,89,64,59,70,71,80)
#(1)
which(weight==max(weight))
#(2)
which(weight==min(weight))
#(3)
which(weight>=61 & weight<=69)
#(4)
idx <- which(weight<=60)
weight.2 <- weight[idx]
weight.2

