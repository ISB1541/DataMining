# 2-3주차

# 변수(Variable) - 데이터 저장 공간

x = 1
y = 2
z = x + y
z
x + y = z # could not find function "+<-", '=' 연산자는 우변 먼저 계산 후, 좌변에 대입

# 변수 사용 예 temp
x=1
y=2
temp=x
x=y
y=temp
x
y

# 변수 이름 규칙 1) 대소문자 구별 2) 특수문자x 3) 언더바 첫글자x 4) 예약어 사용x

# 데이터형 1) 숫자형 2) 문자형 3) 범주형 4) 논리형 5) 특수 상수

# is.데이터형(x) 데이터형 확인
is.integer(x)
is.numeric(x)
is.complex(x)
is.character(x)
is.na(x)

# as.데이터형(x) 데이터형 변환
as.matrix(x), as.array(x)

# 특이사항 - 정수이면서 실수인 경우 ex) x = 1, 정수 명시 숫자 뒤 L or as.integer()


