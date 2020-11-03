# 7-1주차

# 데이터 시각화
## ex) 앤스콤 데이터
anscombe # data 1 ~ 4를 구성하는 데이터 샘플은 평균, 분산, 그리고 x, y간의 상관관계가 모두 동일

apply(anscombe, 2, mean) # 평균
apply(anscombe, 2, var) # 분산
cor(anscombe$x1, anscombe$y1) #상관관계 
cor(anscombe$x2, anscombe$y2)
cor(anscombe$x3, anscombe$y3)
cor(anscombe$x4, anscombe$y4) 

### 시사점
#### 통계 지표와 분석 수치만으로 비교하면, 4개의 데이터 셋은 거의 동일하다고 볼 수 있음
#### 그러나 그래프로 보면 서로 다른 분포를 가진 데이터임을 알 수 있다.
#### 즉 눈으로 직접 확인하는 것이 중요하며, 정보가 잘못 전달될 가능성이 낮아지고 데이터 과학의 신뢰성이 증가한다.

library(gapminder)
library(dplyr)
y <- gapminder %>% group_by(year, continent) %>% summarize(c_pop=sum(pop)) # 인구 변화의 추이는 대륙별 관찰이 더 효과적
head(y, 20)

### 시각화
plot(y$year, y$c_pop)
plot(y$year, y$c_pop, col=y$continent, pch=c(1:5))
legend("topleft", legend = levels(y$continent), col=y$continent, pch=c(1:5)) # 라벨
