# 3-3주차

# 데이터 프레임
name = c("철수", "춘향", "길동")
age = c(22, 20, 25)
gender = factor(c("M", "F", "M"))
blood.type = factor(c("A", "O", "B"))

patients = data.frame(name, age, gender, blood.type)
patients

## $ - 속성값 출력
patients$name

## [, ] - 행과 열에 접근
patients[1,]
patients[patients$name=="철수",] # ',' 빼먹지 말것
patients[patients%name=="철수", c("name", "age")] # 철수 이름과 나이 정보만 추출

# 데이터 프레임 관련 함수
## attach, detach - 데이터프레임의 속성명을 변수명으로 변경 -> $, [, ] 사용x
head(cars)
spped # error 
attach(cars)
speed
detach(cars) # 해제

## with - 열 이름을 변수명처럼 바로 사용하여 함수(평균이나 최대값)를 적용
mean(cars$speed)
with(cars, mean(speed))

## subset - 데이터프레임의 일부 데이터만 추출
subset(cars, speed > 20) #속도 20초과 데이터만 추출
subset(cars, speed>20, select=-c(dist)) # 속도 20 초과인 데이터 중 dist를 제외한 데이터만 추출

## na.omit - 데이터프레임의 결측값(NA) 제거
head(airquality)
head(na.omit(airquality))

## merge - 여러 데이터 프레임 병합]
name = c("철수", "춘향", "길동")
age = c(22, 20, 25)
gender = factor(c("M", "F", "M"))
blood.type=factor(c("A", "O", "B"))

patients1 = data.frame(name, age, gender)
patients2 = data.frame(name, blood.type)
patients = merge(patients1, patients2, by ="name")
patients
