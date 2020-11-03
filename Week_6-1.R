# 6-1����

# �ƺ�ī�� �����ͼ� �ǽ�
avocado = read.csv("E:/Rstudio/dataMining/avocado.csv")
str(avocado)
library(dplyr)
avocado %>% group_by(region) %>% summarize(V_avg = mean(Total.Volume), 
                                           P_avg=mean(AveragePrice))
# summarize(group_by(avocado, region), V_avg = mean(Total.Volume), P_avg=mean(AveragePrice))

x_avg = avocado %>% group_by(region, year, type) %>% summarize(V_avg = mean(Total.Volume), 
                                                   P_avg=mean(AveragePrice))

# arrange �Լ� - ����
# arrange(x_avg, desc(V_avg))
arrange(x_avg, desc(V_avg))
x_avg1 = x_avg %>% filter(region != "TotalUS")
x_avg1

# Date�� �����ͺ� ���
install.packages("lubridate")
library(lubridate)

(x_avg = avocado %>% group_by(region, year, month(Date), type) 
  %>% summarize(V_avg= mean(Total.Volume), P_avg=mean(AveragePrice)))