
import random

arq = open('venda.csv', 'w')
d = ['2001-02-16 20:38:40', '2016-04-17 22:38:42',\
	'2011-05-16 16:38:40', '2009-07-13 13:39:42', '2009-07-17 14:39:42',\
	'2016-04-28 18:36:44']
txt = []
txt.append('data'+';'+'desconto'+';'+'id_cliente\n')

for i in range(1500000):
	id_cliente = random.randint(1,100000)
	desconto = round(random.uniform(0,20),2)
	total = round(random.uniform(20,5000),2)
	data = random.choice(d)
	txt.append(data+';'+str(desconto)+';'+str(id_cliente)+'\n')

arq.writelines(txt)
arq.close()