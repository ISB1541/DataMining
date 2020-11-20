# 9-2주차

# 예제) 할인율에 따른 이익 '머플러 판매 데이터'
muffler = data.frame(discount = c(2.0, 4.0, 6.0, 8.0, 10.0), profit = c(0, 0, 0, 1, 1))
g = glm(profit~discount, data = muffler, family = binomial) # lm 대신 glm 함수, binomial 옵션은 두가지 값만 가짐을 의미
coef(g)
fitted(g)
residuals(g)

## 시각화
plot(muffler, pch = 20, cex = 2)
abline(g, col = 'blue', lwd = 2)

## 새로운 데이터 예측
newd = data.frame(discount = c(1, 5, 12, 20, 30))
p = predict(g, newd, type='response') # response는 예측 수행시 0~1사이의 확률을 구해줌
print(p)

## 그래프
plot(muffler, pch = 20, cex = 2, xlim = c(0, 32))
abline(g, col = 'blue', lwd = 2)
res = data.frame(discount = newd, profit = p)
points(res, pch = 20, cex = 2, col = 'red')
legend("bottomright", legend = c("train data", "new data"), pch = c(20, 20), cex = 2,
       col = c("black", "red"), bg ="gray")

# 실제 데이터 적용예제(Haberman survival)

## 파일 불러오기
haberman = read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/haberman/haberman.data",
                    header = FALSE)
names(haberman) = c('age', 'op_year', 'no_nodes', 'survival')
str(haberman)

haberman$survival %>% = factor(haberman$survival) # glm 함수는 label이 0,1 혹은 (범주형, factor)
str(haberman)

## y = survival, 나머지 x일 때 . 으로 대체 가능
h = glm(survival ~ age + op_year + no_nodes, data = haberman, family = binomial)
coef(h)
deviance(h)

## 새로운 환자에 대한 생존여부 예측
new_patients = data.frame(age = c(37, 66), op_year = c(58, 60), no_nodes = c(5, 32))
predict(h, newdata = new_patients, type = 'response')

### 결과 값 0.2225961 -> case 1(5년 이상) : 78%, csae 2(5년 이하) : 22%