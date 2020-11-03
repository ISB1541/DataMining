# 4-3주차
# 조건문
# []에 행/열 조건 명시
test = c(15, 20, 30, NA, 45)
test[test<40]
test[test%%3!=0] # 공백 x
test[is.na(test)]
test[!is.na(test)]
test[test%%2==0& !is.na(test)]

## 데이터프레임에서 활용
characters = data.frame(name=c("길동", "춘향", "철수"), age = c(30, 16, 21), 
                        gender = factor(c("M", "F", "M")))
characters
characters[characters$gender=="F", ]
characters[characters$age<30 & characters$gender =="M", ]

# if문 활용
x = 5
if(x %% 2 ==0) {
  print('x는 짝수')
} else { 
  print('x는 홀수')
}  

if(x %% 2 ==0) {
  print('x is a positive value')
} else if(x<0) { 
  print('x is a negative value')
} else {
  print('x is zero.')
}

# if/else문을 합쳐놓은 형태
# ifelse(조건식, 조건식이 참인 경우 반환값, 조건식이 거짓인 경우 반환값)
x = c(-5:5)
options(digits = 3)
sqrt(x)
sqrt(ifelse(x>0, x, NA))


# 반복문 - repeat, while, for
## repeat
i = 1
repeat {
  if(i>10) {
    break
  } else {
    print(i)
    i= i+1
  }
}

i = 1
while(i<=10) {
  print(i)
  i=i+1
}

i=1
while(i<10) {
  print(paste(2, "X", i, "=", 2*i))
  i = i+1
}

i= 1
for(i in 1:10) {
  print(i)
}

for(i in 2:9) {
  for(j in 1:9) {
    print( paste(i, "X", j, "=", i*j))
  }
}

i=1
for(i in 1:10) {
  if(i%%2==0) {
    print(i)
  }
}
