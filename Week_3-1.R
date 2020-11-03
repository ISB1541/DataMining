# 3-1주차

# 벡터 생성
1:7 # 1
vector(length = 5) # 2
c(1:5) # 3
c(1,2,3, c(4:6))
seq(from = 1, to=10, by=2) # 4 seq(초기값,종료값, 증가값)
seq(0, 1, length.out=11) # 0부터 1까지 요소가 11개인 벡터 생성
rep(c(1:3), tumes=2) # 반복 벡터 rep(벡터, 벡터 반복 횟수)

# 벡터 연산
x = c(2, 4, 6, 8, 10)
length(x)
x[1]
x[c(1, 2, 3)]

# 벡터끼리 연산: 벡터 길이가 같거나 요소 개수가 배수 관계에 있을 때만 연산 가능
x = c(1, 2, 3, 4)
y = c(5, 6, 7,  8)
z = c(3, 4)
w = c(5, 6, 7)
x+2 
x+z # 작은 벡터를 순환
x+w # x 와 w 크기가 정수배 x, 오류 발생

# all, any 함수
all(x>5) # 조건 검토 T & F로 출력 
any(x>5)

# head, tail 함수 
x = 1:10
head(x) # 데이터의 앞 6개 요소를 추출
tail(x) # 데이터의 뒤 6개 요소를 추출
head(x, 3)
tail(x, 3)

# union(x, y), intersect(x, y), setdiff(x, y), setdiff(y, x), setqual(x, y)
# 합집합         교집합           차집합        차집합         동일 요소 비교

