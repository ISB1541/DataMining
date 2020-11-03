# 5-2주차

# 이상값을 결측값으로 표현하고, NA관련 함수를 사용하여 제거
patients = data.frame(name = c("철수", "춘향", "길동"), age = c(22, 20, 25), 
                      gender = factor(c("M", "F", "K")), blood.type=factor(c("A", "O", "C")))
patients
patients$gender=ifelse((patients$gender=="K"), NA, patients$gender)
patients$blood.type=ifelse((patients$blood.type=="C"), NA, patients$blood.type)
patients
patients=patients[!is.na(patients$blood.type) & !is.na(patients$gender), ]
patients

# 데이터 가공 - 구체적인 목적을 가지고 데이터를 만지거나 변형하는 작업

## Base R 활용 데이터 가공 실습

library(gapminder) # 세계 각국의 기대수명, 1인당 국내총생산, 인구 등을 집계해놓은 데이터셋을 담고 있음
library(dplyr)
glimpse(gapminder) # 훑어보기

gapminder[, c("country", "lifeExp")] # 수명을 5년 주기로 측정
gapminder[, c("country", "lifeExp", "year")]
gapminder[gapminder$country=="Croatia", ] 
gapminder[gapminder$country=="Croatia", "pop"]
gapminder[gapminder$country=="Croatia", c("lifeExp", "pop")]
