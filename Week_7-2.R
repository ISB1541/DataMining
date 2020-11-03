# 7-2주차

# 시각화는 데이터를  올바르게 해석할 수 있게 해줌과 동시에, 많은 양의 데이터를 효과적으로 관찰할 수 있게 해주는 역할
## 직관을 얻을 수 있다.
## 핵심을 명확하게 이해할수 있다.
## 평균적인 경향과 이상값도 발견할 수 있다.
## 데이터에서 문제를 빨리 찾아낼 수 있다.

## 데이터의 시각화는 반복적으로, 여러 관점으로 시도되어야 함.
### 비교/순위
### 변화추세
### 분포 혹은 비율
### 상관관계

## plot() 함수
head(cars)
plot(cars, type="p", main="cars") #plot(데이터셋, 형태,  그래프 제목)
plot(cars, type="l", main="cars")
plot(cars, type="b", main="cars")

## pie, barplot 함수
x = gapminder %>% filter(year == 1952 & continent == "Asia") %>% 
  mutate(gdp = gdpPercap*pop) %>% select(country, gdp) %>% arrange(desc(gdp)) %>% 
  head() # mutate 열을 추가 gdp라는 열 (gdp = 1인당 총 생산량 x 인구) 추가

pie(x$gdp, x$country)
barplot(x$gdp, names.arg = x$country)
