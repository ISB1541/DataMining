# 6-1주차

# 아보카도 데이터셋 실습
avocado = read.csv("E:/Rstudio/dataMining/avocado.csv")
str(avocado)
library(dplyr)
avocado %>% group_by(region) %>% summarize(V_avg = mean(Total.Volume), 
                                           P_avg=mean(AveragePrice))
# summarize(group_by(avocado, region), V_avg = mean(Total.Volume), P_avg=mean(AveragePrice))

x_avg = avocado %>% group_by(region, year, type) %>% summarize(V_avg = mean(Total.Volume), 
                                                   P_avg=mean(AveragePrice))

# arrange 함수 - 정렬
# arrange(x_avg, desc(V_avg))
arrange(x_avg, desc(V_avg))
x_avg1 = x_avg %>% filter(region != "TotalUS")
x_avg1

# Date형 데이터별 통계
install.packages("lubridate")
library(lubridate)

(x_avg = avocado %>% group_by(region, year, month(Date), type) 
  %>% summarize(V_avg= mean(Total.Volume), P_avg=mean(AveragePrice)))
