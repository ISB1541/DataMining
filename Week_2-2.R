# 2-2주차

# R의 라이브러리란 특정 분야를 위해 개발된 R 함수를 모아둔 소프트웨어 (패키지)

# R의 장점 : 방대한 라이브러리

# CRAN 사이트 : R의 모든 라이브러리 분야별로 확인 가능

# install.pacakges("라이브러리이름") 라이브러리 설치 

# library() 사용할 함수를 부착) 라이브러리 설치(하드디스크)->라이브러리 부착(RAM)

# search() 부착 함수 확인 가능

# str() & head()

head(iris, 10) # 10개의 샘플을 출력

plot(iris$Petal.Width, iris$Petal.Length, col=iris$Species) #종의 속성으로 색깔 구분

# 예제 데이터 실습(Tips)

# 1. 데이터 수집
tips=read.csv('https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv')
str(tips)
head(tips, 10)

# summary() -속성(열, column) 별로 요약 통계 확인
summary(tips)

# dplyr() & ggplot2() - 직관적 분석을 위한 시각화
library(ggplot2)
tips%>%ggplot(aes(size)) + geom_histogram() # histogram
tips%>%ggplot(aes(total_bill, tip))+geom_point(aes(col=day)) # 산점도(Scatter plot)
tips%>%ggplot(aes(total_bill, tip))+geom_point(aes(col=day, pch=sex), size=3)

#2.탐색적 데이터 분석, 효과 -> 이익 창출을 위한 전략 수립 가능

#3. 모델링 -> 예측 가능