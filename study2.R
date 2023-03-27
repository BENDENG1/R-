install.packages("svDialogs")
library(svDialogs)

#1번문제
two_sum <- function(){
  num1 <- as.numeric(dlgInput('First Number')$res)
  num2 <- as.numeric(dlgInput('Second Number')$res)
  sum <- num1 + num2
  return(paste(num1, num2, sum, sep = ' '))
}

y <- two_sum()
y

#2번문제
# (1)
state <- data.frame(state.x77)

# (2)
names(state)[1] <- "State"
state

# (3)
write.csv(state, file = "state.csv", row.names = FALSE)

# (4)
head(read.csv("state.csv"))

# (5)
apply(state[, 1:8], 2, sum)

# (6)
apply(state[, 1:8], 2, mean)

# (7)
lapply(state[, 1:8], function(x) list(min = min(x), max = max(x), mean = mean(x)))

# (8)
sapply(state[, 1:8], function(x) list(min = min(x), max = max(x), mean = mean(x)))

# (9)
state$Region <- state.region
state


# 3번문제!
library(data.table)
dstate <- data.table(state.x77,State=row.names(state.x77))

#(1)
dstate[Income > 5000, .(Population, Income, State)]

#(2)
dstate[Income > 5000, .(mean(Population), mean(Income))]

#(3)
dstate[,Region:=state.region]
head(dstate, 3)


#dstate 데이터 테이블에 Region 이라는 새로운 컬럼이 추가되었으며, 각 주(State)의 지역(region) 정보가 저장되어 있습니다.

#(4)
dstate[,c("Division","Abb"):=.(state.division, state.abb)]
head(dstate, 3)
#dstate 데이터 테이블에 Division 과 Abb 라는 두 개의 새로운 컬럼이 추가되었으며, 각 주(State)의 state.division과 state.abb 정보가 저장되어 있습니다.

#(5)
dstate[, sum(Population), by=Region]

#(6)
dstate[, sum(Population), by=.(Region, Division)]

#(7)
dstate[order(Region)]

#(8)
dstate[order(Region, -as.character(State))]

#(9)
dstate[, IncomeGreaterThan5000 := (Income > 5000)]

#(10)
dstate[, AreaLessThan5000 := (Area < 5000)]

#(11)
str(dstate)
library(data.table)
fwrite(dstate, file="dstate.csv")

#(12)
dstate_read <- fread("dstate.csv")
print(dstate_read)











































