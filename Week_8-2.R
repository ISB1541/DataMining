## 9-2주차

# 선형 회귀
## lm을 이용해 최적화 풀기
x = c(3.0, 6.0, 9.0, 12.0)
y = c(3.0, 4.0 ,5.5, 6.5)
m = lm(y ~ x)
m
plot(x, y)
abline(m, col='red')

# 모델의 특성
coef(m) # 매계변수(계수) 값
fitted(m) # 훈련집합의 샘플에 대한 예측값 
residuals(m) # 잔차
deviance(m) / length(x) # 잔차 제곱합을 평균 제곱 오차로 변환하여 출력 MSE
summary(m)

# 예측 함수
newx = data.frame(x=c(1.2, 2.0, 20.65))
predict(m, newdata = newx)

# 실습
str(cars)
head(cars)
plot(cars)
car_model=lm(dist~speed, data = cars)
coef(car_model)
abline(car_model, col="red")
fitted(car_model) # 4번째 샘플 (7, 22) 0.94 실제값 22 -> 12만큼 오차 발생
residuals(car_model)

## 시속 21.5일 때 제동거리는?
nx1 = data.frame(speed=c(21.5))
predict(car_model, nx1)

## 시속 25부터 0.5씩 증가시키며 달렸을 때 제동거리의 변화
nx2 = data.frame(speed=c(25.0, 25.5, 26.0, 26.5, 27.0, 27.5, 28.0))
predict(car_model, nx2)

nx = data.frame(speed=c(21.5, 25.0, 25.5, 26.0, 26.5, 27.0, 27.5, 28.0))
plot(nx$speed, predict(car_model, nx), col="red", cex = 2, pch = 20)
abline(car_model)

## 과제
x = c(10.0, 12.0, 9.5, 22.2, 8.0)
y = c(360.2, 420.0, 359.5, 679.0, 315.3)
m = lm(y ~ x)
plot(x, y)
abline(m, col='green')

newx = data.frame(x=c(10.5, 25.0, 15.0))
predict(m, newdata = newx)
