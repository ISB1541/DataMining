# 11-3주차

library(rpart)
# UCLA admission 실습

# UCLA admission 데이터
ucla = read.csv('https://stats.idre.ucla.edu/stat/data/binary.csv')
str(ucla)

ucla$admit=factor(ucla$admit)
ucla$admit

# Dession Tree
r= rpart(admit~., data=ucla)
par(mfcol=c(1,1), xpd=NA)
plot(r)
text(r, use.n=TRUE)

# 훈련집합에 대한 예측
p = predict(r, ucla, type = 'class')
table(p, ucla$admit)

# randomForest 적용
f = randomForest(admit~., data=ucla)
print(f)

# voice 실습
voice = read.csv('./resource/voice.csv')
str(voice)
table(is.na(voice))

# f = randomForest

# Assignment
ucla = read.csv('https://stats.idre.ucla.edu/stat/data/binary.csv')
str(ucla)
ucla$admit=factor(ucla$admit)
ucla$admit

r= rpart(admit~., data=ucla)
par(mfcol=c(1,1), xpd=NA)
plot(r)
text(r, use.n=TRUE)

# rpart 적용 - 정확도 (249 + 54)/ 400 = 80.5%
p = predict(r, ucla, type='class')
table(p, ucla$admit)

# randomForest 적용 - 정확도 73.25%
f = randomForest(admit~., data=ucla)
print(f)

# SVM 적용(cost=1) - 72.25%
s=svm(admit~., data=ucla, cost=1)
print(s)
table(predict(s, ucla), ucla$admit)
