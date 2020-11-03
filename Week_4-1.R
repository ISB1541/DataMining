# 4-1����
# ����Ʈ : ������ �����Ӻ��� ���� �ǹ��� ������ ����
## Ư¡ 1) ���� �ٸ� ���������� ���� �ڷ� ���� 2) ��� �Ӽ��� ũ�Ⱑ ���� ����

# ����Ʈ ����
patients = data.frame(name = c("ö��", "����", "�浿"), age = c(22, 20, 25), 
                      gender = factor(c("M", "F", "M")), blood.type=factor(c("A", "O", "B")))
no.patients = data.frame(day = c(1:6), no = c(50, 60, 55, 52, 65, 58))
head(no.patients)

listPatients = list(patients, no.patients)
listPatients
listPatients = list(patients=patients, no.patients = no.patients)
listPatients

# ����Ʈ ��� ����
listPatients$patients # ��Ҹ� �Է�
listPatients[[1]] # �ε��� �Է� 
listPatients[["patients"]] # ��Ҹ��� ""�� �Է�

# ����Ʈ ���� �Լ�
## lapply - list + apply - ����Ʈ�� ���� �پ��� �Լ��� ����
lapply(listPatients$no.patients, mean)

## sapply - ����� �� �� �ܼ��ϰ� ���
sapply(listPatients$no.patients, mean)
sapply(listPatients$no.patients, mean, simplify = F) # lF ���� �� apply() ����� ����  

# ����Ʈ�� ��� �߰�
remaining_room = 30
listPatients$room = remaining_room
listPatients

# ����Ʈ ��� ����
listPatients$room = NULL
listPatients