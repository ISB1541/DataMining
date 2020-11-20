# 9-1주차

# 예제) 할인율에 따른 이익 '머플러 판매 데이터'
muffler = data.frame(discount = c(2.0, 4.0, 6.0, 8.0, 10.0), profit = c(0, 0, 0, 1, 1))
plot(muffler, pch = 20, cex = 2, xlim = c(0, 12))

m = lm(profit~discount, data = muffler)
coef(m)
fitted(m)
residuals(m)
deviance(m)

## 시각화를 통해 오차 확인
plot(muffler, pch = 20, cex = 2, xlim = c(0, 12))
abline(m)

## 새로운 할인율 적용, 예측
newd = data.frame(discount=c(1, 5, 12, 20, 30))
p = predict(m, newd)
print(p)
### 원하는 결과 -> 순수익 5만원 미만 0, 이상 1 모델 
### 실제 결과 -> -0.35  0.25  1.30  2.50  4.00

## 시각화
plot(muffler, pch = 20, xlim = c(0, 32), ylim = c(-0.5, 4.2))
abline(m)
res = data.frame(discount=newd, profit = p)
points(res, pch = 20, cex = 2, col = 'red')
legend("bottomright", legend = c("train data", "new data"), pch = c(20, 20), 
cex = 2, col = c("black", "red"), bg = "gray")

# 과제
temp = c(38.8, 34.0, 39.0, 38.8, 36.2, 30.4, 32.2, 34.1, 35.0, 42.2, 37.3, 32.6,
         31.6, 34.1, 34.1, 33.8, 35.8, 32.3, 36.3, 31.3)
sell = c(423000, 207900, 464600, 460000, 264500, 107500, 161600, 131200, 206000,
         910400, 338600, 137300, 157400, 172100, 153000, 127200, 200600, 116100,
         265200, 132500)

icecream = data.frame(temp, sell)
m = lm(sell~temp, data = icecream)
coef(m)
fitted(m)
residuals(m)
deviance(m)

newd = data.frame(c(30:49))
p = predict(m, newd)
print(p)