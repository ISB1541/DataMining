## 9-3주차

#다중선형회귀 - 특징이 2개 이상인 회귀


## 실습
install.packages("scatterplot3d")
library(scatterplot3d)
x = c(3.0, 6.0, 3.0, 6.0)
u = c(10.0, 10.0, 20.0, 20.0)
y = c(4.65, 5.9, 6.7, 8.02)
scatterplot3d(x, u, y, xlim=2:7, ylim = 7:23, zlim = 0:10, pch = 20, type = 'h')

### 다중선형회귀 적용
m = lm(y ~ x + u)
coef(m)
s = scatterplot3d(x, u, y, xlim=2:7, ylim = 7:23, zlim = 0:10, pch = 20, type = 'h')
s$plane3d(m) # 평균값
fitted(m)
residuals(m)
deviance(m) # 잔차 제곱합
deviance(m) / length(x) # 평균 제곱 오차

### 실제값 예측
nx = c(7.5, 5.0)
nu = c(15.0, 12.0)
new_data = data.frame(x = nx, u = nu)
ny = predict(m, new_data)
ny 
  
s = scatterplot3d(nx, nu, ny, xlim = 0:10, ylim = 7:23, zlim = 0:10, pch = 20, 
                  type = 'h', color = "red", angle = 60)
s$plane3d(m)

## Trees 실습(1)
str(trees)
summary(tress)
scatterplot3d(trees$Girth, trees$Height, trees$Volume)
m = lm(Volume ~ Girth + Height, data = trees)
m
s = scatterplot3d(trees$Girth, trees$Height, trees$Volume, pch = 20, type = 'h', angle = 55)
s$plane3d(m)

ndata = data.frame(Girth = c(8.5, 13.0, 19.0), Height = c(72, 86, 85))
predict(m, newdata = ndata)

## 과제
### 트레이닝셋 
x = c(3.0, 6.0, 3.0, 6.0, 7.7)
u = c(10.0, 10.0, 20.0, 20.0, 14.8)
y = c(4.65, 5.9, 6.7, 8.02, 7.7)

### 회귀모델
m = lm(y ~ x + u)
m

### 실제값 적용
nx = c(7.5, 5.0)
nu = c(15.0, 12.0)
new_data = data.frame(x = nu, u = nu)
ny = predict(m, new_data)

s = scatterplot3d(nx, nu, ny, xlim = 0:10, ylim = 7:23, zlim = 0:10, pch = 20, 
                  type = 'h', color = "red", angle = 60)
s$plane3d(m)