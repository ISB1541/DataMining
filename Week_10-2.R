# 10-2주차

install.packages("rpart")
library(rpart)
r = rpart(Species~., data=iris)
printcp(r)

# 결정트리 시각화
par(mfcol=c(2,1), xpd=NA) # mfcol 열부터 채움, xpd 범례
plot(r)
text(r, use.n = TRUE)
iris

# 훈련집합에 대한 예측
p = predict(r, iris, type = 'class') # type 기본 prob
table(p, iris$Species)

p = predict(r, iris)
print(p)

# 실제 데이터 예측
newd = data.frame(Sepal.Length = c(7.01, 5.11, 6.32), Sepal.Width = c(3.2, 3.51, 3.31), 
                  Petal.Length = c(4.71, 1.4, 6.02), Petal.Width = c(1.4, 0.19, 2.49))
print(newd)
predict(r, newdata = newd) # 확률
predict(r, newdata = newd, type = 'class') # 클래스
