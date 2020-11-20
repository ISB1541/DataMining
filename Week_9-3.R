# 9-3주차

# Feature selection(속성 선택) : 어떤 기준에 따라 일부 피쳐만을 선택하는 작업
# 예제) Haberman survival 데이터의 경우 '수술 연도'는 생존에 영향을 미치지 않는다고 가정하고 제외
h = glm(survival ~age + no_nodes, data = haberman, family = binomial)
coef(h)
deviance(h) # 전체 feature 사용보다 증가

new_patients = data.frame(age = c(37, 66), no_nodes = c(5, 32)) # 새로운 환자 두 명
predict(h, newdata = new_patients, type = 'response')

# 실습) UCLA admission 데이터
ucla = read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
str(ucla)
m = glm(admit~., data = ucla, family =  binomial)
coef(m)
deviance(m, type='response')
summary(ucla)

## 과제
for (i in 1:4) { 
  s = data.frame(gre = c(376), gpa =c(3.6), rank = c(i))
  a = predict(m, newdata = s, type = 'response')
  print(a)
}
