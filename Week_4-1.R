# 4-1주차
# 리스트 : 데이터 프레임보다 넓은 의미의 데이터 모임
## 특징 1) 서로 다른 데이터형을 갖는 자료 구조 2) 모든 속성의 크기가 같지 않음

# 리스트 생성
patients = data.frame(name = c("철수", "춘향", "길동"), age = c(22, 20, 25), 
                      gender = factor(c("M", "F", "M")), blood.type=factor(c("A", "O", "B")))
no.patients = data.frame(day = c(1:6), no = c(50, 60, 55, 52, 65, 58))
head(no.patients)

listPatients = list(patients, no.patients)
listPatients
listPatients = list(patients=patients, no.patients = no.patients)
listPatients

# 리스트 요소 접근
listPatients$patients # 요소명 입력
listPatients[[1]] # 인덱스 입력 
listPatients[["patients"]] # 요소명을 ""에 입력

# 리스트 관련 함수
## lapply - list + apply - 리스트에 대한 다양한 함수를 적용
lapply(listPatients$no.patients, mean)

## sapply - 결과를 좀 더 단순하게 출력
sapply(listPatients$no.patients, mean)
sapply(listPatients$no.patients, mean, simplify = F) # lF 설정 시 apply() 결과와 동일  

# 리스트에 요소 추가
remaining_room = 30
listPatients$room = remaining_room
listPatients

# 리스트 요소 삭제
listPatients$room = NULL
listPatients