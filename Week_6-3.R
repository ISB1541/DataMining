# 6-3����

# ������ ���� ����
elec_gen = read.csv("E:/Rstudio/dataMining/electricity_generation_per_person.csv", 
                    header = TRUE, sep=",")
names(elec_gen)
names(elec_gen)[2:33] = substr(names(elec_gen[2:33]), 2, nchar(names(elec_gen[2:33])))
names(elec_gen)

elec_use = read.csv("E:/Rstudio/dataMining/electricity_use_per_person.csv", 
                    header = TRUE, sep=",")
names(elec_use)
names(elec_use)[2:56] = substr(names(elec_use)[2:56], 2, nchar(names(elec_use[2:56])))
names(elec_use)                               

## ������ ������ Ȯ��
### gather() �Լ��� Ȱ���Ͽ� ������ ������ �籸��, tidyr ���̺귯�� �ʿ�
library(tidyr)
elec_gen_new = gather(elec_gen, -country, key="year", value="ElecGen")
elec_use_new = gather(elec_use, -country, key="year", value="ElecGen")
View(elec_gen_new)
View(elec_use_new)
elec_gen_use = merge(elec_gen_new, elec_use_new)
View(elec_gen_use)