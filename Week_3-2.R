# 3-2주차

# 행렬 - 행과 열로 구성된 데이터 

# 행렬 생성
x = array(1:5, c(2:4)) # 1~5 값을 2 x 4 행렬로 할당
x
x[1, ] # 1행 요소 값 출력
x[, 2] # 2열 요소 값 출력

# 2차원 배열 생성
x=1:12
x
matrix(x, nrow = 3) # matrix(행렬 구성할 벡터, nrow or ncol 둘 중 하나 결정)
matrix(x, nrow = 3, byrow = T) # byrow 행 단위로 배치할지 여부 
matrix(x, nrow = 3, byrow = T, dimnames=list(c('a', 'b', 'c'), c('X', 'Y', 'Z', 'W')))# dimname 옵션을 이용하여 행과 열 이름 목록 추가 가능

# cbind, rbind 함수: 열, 행 단위로 묶어 배열 생성
v1 = c(1, 2, 3, 4)
v2 = c(5, 6, 7, 8)
v3 = c(7, 8, 9, 10)

cbind(v1, v2, v3) # 열 단위

rbind(v1, v2, v3) # 행 단위

# 행렬 연산자 
# 1) %*% 수학적인 행렬 곱셈
# 2) t(), aperm() 전치 행렬
# 3) solve() 역행렬
# 4) det() 행렬식

# 행렬 관련 함수

## 1) apply 함수 - 행렬의 행 또는 열 별로 함수 적용
x = array(1:12, c(3, 4))
x
apply(x, 1, mean) # 가운데 값이 1이면 함수를 행별로 각각 적용
apply(x, 2, mean) # 가운데 값이 2이면 함수를 열별로 각각 적용

## 2) dim 함수 : 행렬의 크기(차원의 수)
dimx(x)

## 3) sample 함수 : 벡터나 배열에서 샘플 추출
sample(x, 10) # 배열 요소 중 10개를 랜덤으로 추출
sample(10) # 단순히 숫자만 추출 가능

# 데이터 프레임 생성
name = c("철수", "춘향", "길동")
age = c(22, 20, 25)
gender = factor(c("M", "F", "M"))
blood.type = factor(c("A", "O", "B"))

patients = data.frame(name, age, gender, blood.type)
patients
