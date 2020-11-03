# 5-3주차

# dplyr 라이브러리
## 데이터 프레임 가공에 특화된 라이브러리
## filter 혹은 select 같은 입출력 관계의 함수 제공, 사용자들이 보다 직관적 활용 가능

select(gapminder, country, year, lifeExp)
filter(gapminder, country=="Croatia")


## summarize, group_by 함수
summarize(group_by(gapminder, continent, country), pop_avg = mean(pop))

## %>% 연산자를 활용
### 뒤 명령어가 함수인 경우, 함수의 첫번째 인자로 사용됨!!
gapminder %>% group_by(continent, country) %>% summarize(pop_avg = mean(pop))

### %>% 중간 결과 변수 저장 유무 차이 > 속도 차이

