import random

print Product.objects.all()[0]

for p in Product.objects.all():
	#if product is mobile
	if 'BOOK' in p.pdt_id:
		p.price = random.randint(5,75)*10
		# print p.price
		

	elif 'MOB' in p.pdt_id:
		p.price = random.randint(500,1500)*10
		print p.price

	elif 'LPT' in p.pdt_id:
		p.price = random.randint(1500,5500)*10
		print p.price

	elif 'FUR' in p.pdt_id:
		p.price = random.randint(500,2000)*10
		print p.price

	p.save()