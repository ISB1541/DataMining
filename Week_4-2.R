# 4-2주차

# 데이터 취득과 정제
# 취득 : 데이터는 인터넷 서핑, 문서, 설문조사, 실험을 통해 얻을 수 있다.
# 정제 : 수집한 자료를 데이터 과학 목적에 맞게 사용하기 위해서는 적절히 정제해야 한다.
# 가공 : 정제한 데이터를 이용하여 대부분의 데이터 가공과 처리가 이루어질 수 있다.

# 파일 읽기 (read.csv 함수)
students = read.csv("E:/Rstudio/dataMining/students.csv") # 첫 행이 데이터인 경우 header = F 옵션 제공해야함
students

## 문자형을 범주형으로 인식하는 경우
### as.character를 사용
students$name = as.character(students$name)
str(students)

### stringsAsFactors = FALSE
students = read.csv("E:/Rstudio/dataMining/students.csv", stringsAsFactors = FALSE)

# 파일 쓰기 (write.csv 함수)
write.csv(students, file="E:/Rstudio/dataMining/writeStudents.csv", quote = F) # 따옴표 포함 x quote = F 옵션
