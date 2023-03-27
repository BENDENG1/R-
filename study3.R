library(descr)
library(readxl)


chickwts

#(1) chickwts에 대한 자료구를 설명하시오.
str(chickwts)

#(2) 사료의 종류를 보이시오.
unique(chickwts$feed)

#(3) 사료별 빈도표를 작성하시오.
table(chickwts$feed)

#(4) 사료별 무게의 평균을 수치로 제시하시오.
aggregate(weight ~ feed, chickwts, mean)

#(5) 사료별 무게의 평균을 그래프로 보이시오.
boxplot(weight~feed,chickwts,mean)

#(6) 아래와 같은 사료별 box-plot을 보이시오.
boxplot(weight~feed,chickwts,mean, col = c("red","yellow","green","skyblue","blue","pink"))

#(7) box-plot의 결과를 요약하시오.


#2번문제

#(1) 이 자료를 데이터프레임 primate에 저장하고 이를 보이시오.
primate <- data.frame(
  Animal = c("Potar monkey", "Gorilla", "Human", "Rhesus monkey", "Chimp"),
  Bodywt = c(115, 406, 1320, 179, 440),
  Brainwt =c(10.0, 207.0, 62.0, 6.8, 52.2))

primate


#(2) 체중 대비 뇌의 무게의 비율(%)을 구하고 이를 b_rate에 저장하시오. 
b_rate <- primate$Brainwt / primate$Bodywt * 100
b_rate


#(3) x축을 체중, y축을 뇌의 무게로 하여 아래와 같이 plotting 하시오.(단, 각 자료 옆에는 해당 영장류의 이름을 표시하시오)
plot(primate$Bodywt, primate$Brainwt, xlab = "Body weight (kg)", ylab = "Brain weight (g)", main = "Primates", xlim = c(0, 1400), ylim = c(0, 250), col = "green", pch = 21, bg = "green")
text(primate$Bodywt, primate$Brainwt, labels = primate$Animal, pos = 4,col = "red")

#(4) (2)에서 생성된 비율을 영장류의 종류에 따라 아래와 같이 plotting 하시오.
barplot(b_rate, names.arg = primate$Animal, col = "gray", main = "영장류의 체중과 뇌의 무게 비율", xlab = "Primate", ylab = "Rate (%)")

ggplot(primate, aes(x = Animal, y = b_rate)) +
  geom_col() +
  xlab("Primate") +
  ylab("Rate(%)") +
  ggtitle("영장류의 체중과 뇌의 무게비율") +
  theme(plot.title = element_text(hjust = 0.5),panel.grid.major = element_blank())

#(5) 위의 그림을 보고 알 수 있는 결과를 요약하시오.



# 3번문제
month <- 1:12
years.1949 <- window(AirPassengers, 1949, c(1949, 12))
years.1955 <- window(AirPassengers, 1955, c(1955, 12))
years.1960 <- window(AirPassengers, 1960, c(1960, 12))

#(1) 1949년 항공 승객수를 아래와 같이 선의 모양, 선의 색, x, y축과 전체 제목에 유의하여 plotting하시오.
years.1949.month_labels <- paste0("1949.", seq(2, 12, 2))
plot(month, years.1949, type = "o", col = "red",xaxt="n",xlab = "Month", ylab = "Passengers",ylim = c(100,150),yaxp = c(100,150,5), main = "1949년 항공 여행자")
points(month, years.1949, pch=19, col="red")
axis(1, at = seq(2, 12, by = 2), labels = years.1949.month_labels)

#(2) 1955년 항공 승객수를 아래와 같이 선의 모양, 선의 색, x, y축과 전체 제목에 유의하여 plotting하시오.
years.1955.month_labels <- paste0("1955.", seq(2, 12, 2))
plot(month, years.1955, type = "o", col = "blue",xaxt="n",xlab = "Month", ylab = "Passengers",ylim = c(200,400),yaxp = c(250,350,2), main = "1955년 항공 여행자",lty="dashed")
axis(1, at = seq(2, 12, by = 2), labels = years.1955.month_labels)

#(3) 1960년 항공 승객수를 아래와 같이 선의 모양, 선의 색, x, y축과 전체 제목에 유의하여 plotting하시오.
years.1960.month_labels <- paste0("1960.", seq(2, 12, 2))
plot(month, years.1960, type = "o", col = "pink",xaxt="n",xlab = "Month", ylab = "Passengers",ylim = c(350,650),yaxp = c(400,600,4), main = "1960년 항공 여행자")
points(month, years.1960, pch=19, col="pink")
axis(1, at = seq(2, 12, by = 2), labels = years.1960.month_labels)


#(4) 위의 3개의 그래프와 AirPassengers 데이터셋을 window를 2행 2열로 4분할하여 아래와 같이 한 번에 plotting하시오.
par(mfrow=c(2,2))

#첫번째 꺼
plot(month, years.1949, type = "o", col = "red",xaxt="n",xlab = "Month", ylab = "Passengers",ylim = c(100,150),yaxp = c(100,150,5), main = "1949년 항공 여행자")
points(month, years.1949, pch=19, col="red")
axis(1, at = seq(2, 12, by = 2), labels = years.1949.month_labels)
#두번째 꺼
plot(month, years.1955, type = "o", col = "blue",xaxt="n",xlab = "Month", ylab = "Passengers",ylim = c(200,400),yaxp = c(250,350,2), main = "1955년 항공 여행자",lty="dashed")
axis(1, at = seq(2, 12, by = 2), labels = years.1955.month_labels)
#세번째 꺼
plot(month, years.1960, type = "o", col = "pink",xaxt="n",xlab = "Month", ylab = "Passengers",ylim = c(350,650),yaxp = c(400,600,4), main = "1960년 항공 여행자")
points(month, years.1960, pch=19, col="pink")
axis(1, at = seq(2, 12, by = 2), labels = years.1960.month_labels)
#네번째 꺼
plot(AirPassengers,xlab = "Year",main = "연도별 항공 여행자 수 변화")
