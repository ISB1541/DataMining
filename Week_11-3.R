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
