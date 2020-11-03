# 7-3주차

# matplot 함수
matplot(iris[, 1:4], type="l") # 4개의 열과 모든 행
legend("topleft", names(iris)[1:4], lty=c(1,2,3,4), col=c(1,2,3,4)) # lty : 라인 type

hist(cars$speed)

# ggplot2 라이브러리
## 시각화에 특화된 가장 많이 사용하는 라이브러리
## gg - grammar of graphics
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, col=continent)) + geom_point(alpha = 0.2) # alpha 투명도

## aes x와 y에 어떤 데이터를 넣어줄 것언지 정해주는 함수
gapminder %>% filter(lifeExp>70) %>%group_by(continent) %>% summarize(n=n_distinct(country)) %>% ggplot(aes(x=continent, y=n)) + geom_bar(stat="identity")

## geom_point 함수
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, col=continent)) + geom_point(alpha = 0.2) # alpha 투명도

## geom_line 함수 

## geom_bar 함수 aes에 x,y 모두 지정하고, stat="identity" 옵션 꼭 추가
gapminder %>% filter(lifeExp>70) %>% group_by(continent) %>% summarize(n = n_distinct(country)) %>% ggplot(aes(x=continent, y = n)) + geom_bar(stat="identity")
### distinct 중복 제거

## geom_histogram 함수, 막대를 가로로 position = "dodge" 변경
gapminder %>% filter(year == 2007) %>% ggplot(aes(lifeExp, col=continent)) + geom_histogram()

## scale_x_log10, scale_y_log10 함수
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, col=continent)) + geom_point(alpha=0.2) + scale_x_log10()

## coord_filp 함수, 플롭의 방향을 전환

gapminder %>% filter(continent == "Africa") %>% ggplot(aes(country, lifeExp)) + geom_bar(stat="identity") + coord_flip()
