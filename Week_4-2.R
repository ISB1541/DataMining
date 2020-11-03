# 4-2����

# ������ ���� ����
# ��� : �����ʹ� ���ͳ� ����, ����, ��������, ������ ���� ���� �� �ִ�.
# ���� : ������ �ڷḦ ������ ���� ������ �°� ����ϱ� ���ؼ��� ������ �����ؾ� �Ѵ�.
# ���� : ������ �����͸� �̿��Ͽ� ��κ��� ������ ������ ó���� �̷���� �� �ִ�.

# ���� �б� (read.csv �Լ�)
students = read.csv("E:/Rstudio/dataMining/students.csv") # ù ���� �������� ��� header = F �ɼ� �����ؾ���
students

## �������� ���������� �ν��ϴ� ���
### as.character�� ���
students$name = as.character(students$name)
str(students)

### stringsAsFactors = FALSE
students = read.csv("E:/Rstudio/dataMining/students.csv", stringsAsFactors = FALSE)

# ���� ���� (write.csv �Լ�)
write.csv(students, file="E:/Rstudio/dataMining/writeStudents.csv", quote = F) # ����ǥ ���� x quote = F �ɼ�