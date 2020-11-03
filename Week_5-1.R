# 5-1주차

# 사용자 정의 함수
# 함수명 = funtction (전달인자1, 전달인자2, ...) {
#          함수 동작 시 수행할 코드
#          return(반환값)
# }

# 데이터 정제 : 결측값 처리 
## is.na 함수 - NA인 데이터가 있으면 T, 없으면 F
## na.omit 함수 - NA인 데이터를 제거, 즉 NA가 포함된 행을 지운다.
## 함수의 속성 이용 - na.rm=T로 히여 함수 수행시, NA를 제외
str(airquality)
head(is.na(airquality))
table(is.na(airquality))
table(is.na(airquality$Temp))
mean(airquality$Temp)
head(na.omit(airquality))
air_narm = airquality[!is.na(airquality$Ozone), ] # 오존의 결측값 제거
air_narm

air_narm1 = na.omit(airquality) # 오존뿐만 아니라 결측값이 들어간 행 모두 제거
air_narm2 = na.omit(airquality$Ozone)
mean(air_narm1$Ozone)
mean(air_narm2)
mean(airquality$Ozone, na.rm=T)
air_narm3 = airquality[!is.na(airquality$Ozone) & !is.na(airquality$Solar.R), ]
mean(air_narm3$Ozone)

# 이상값 : 통계학에서 이상값이란, '다른 관측값과 멀리 떨어진 관측값'
# 예시) 성별 : K, 혈액형 : C
patients = data.frame(name = c("철수", "춘향", "길동"), age = c(22, 20, 25), 
                      gender = factor(c("M", "F", "K")), blood.type=factor(c("A", "O", "C")))

patients

## 이상값 제거
patients_outrm = patients[patients$gender=="M"|patients$gender=="F", ]
patients_outrm
