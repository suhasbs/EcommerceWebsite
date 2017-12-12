import csv
from ecom_webapp.models import Product, Books, Laptop, Furniture, ProductImages
import pandas as pd
# with open('csv_files/book_data_educ.csv') as f:
# 	reader = csv.reader(f)
# 	header = next(reader)
# 	print reader
# 	ctr=0
# 	for row in reader:
# 		ctr+=1
# 		if ctr==1:

# 			continue

# 		# if is_ascii(row[6]):
# 		print str(row[6].split('(')[0])
# 		# print row[2]
# 		# for i in range(21, 41):
# 		# 	Books.objects.get(pdt_id='BOOK_'+str(i)).delete()
# 		# 	Product.objects.get(pdt_id='BOOK_'+str(i)).delete()

# 		highs= row[4]
# 		highs_list = highs.split(',')
# 		for h in highs_list:
# 			if 'Publisher:' in h:
# 				publisher = h[10:]
# 		# print publisher
# 		Product.objects.create(pdt_id="BOOK_"+str(int(row[0])+41), brand_name=str(row[6].split('(')[0]), units_in_stock=200, description=row[4])		
# 		Books.objects.create(pdt=Product.objects.get(pk="BOOK_"+str(int(row[0])+41)), genre=row[3], summary=row[2], publisher=publisher)
		


# with open('csv_files/laptops.csv') as f:
# 	reader = csv.reader(f)
# 	header = next(reader)
# 	ctr=0
# 	for row in reader:
# 		ctr+=1
# 		if ctr<=57:

# 			continue

# 		hd_cap = row[1]
# 		name = row[2]
# 		model_no = row[3]
# 		processor = row[5]+" "+row[6]+" "+row[7]
# 		ram = row[8]
# 		display_size = row[9]
# 		Product.objects.create(pdt_id="LPT_"+str(int(row[0])+1), brand_name=name, units_in_stock=200)
# 		Laptop.objects.create(laptop=Product.objects.get(pk="LPT_"+str(int(row[0])+1)), model_no=model_no, display_size=display_size, harddisk_capacity=hd_cap, ram=ram, processor=processor)		
		

# with open('csv_files/furniture.csv') as f:
# 	reader = csv.reader(f)
# 	header = next(reader)
# 	ctr=0
# 	for row in reader:
# 		ctr+=1
# 		if ctr<=2:

# 			continue

# 		# hd_cap = row[1]
# 		name = row[1]
# 		description = row[4]+','+row[5]+","+row[6]
# 		unit_weight = row[8]
# 		# processor = row[5]+" "+row[6]+" "+row[7]
# 		dim = row[3]+" x "+row[9]+" x "+row[2]
# 		print dim
# 		# display_size = row[9]
# 		fur_type = row[7]
# 		material = row[6]
# 		Product.objects.create(pdt_id="FUR_"+str(int(row[0])+1), brand_name=name, units_in_stock=200, unit_weight=unit_weight, description=description)
# 		Furniture.objects.create(furniture=Product.objects.get(pk="FUR_"+str(int(row[0])+1)), type=fur_type,dimensions=dim, material=material)
		
# with open('csv_files/mobile_data.csv') as f:
# 	reader = csv.reader(f)
# 	header = next(reader)
# 	# ctr=0
# 	data = {'ind':[], 'image_url':[]}
# 	for row in reader:
# 	# 	ctr+=1
# 	# 	if ctr<=2:

# 	# 		continue

# 		# hd_cap = row[1]
# 		# name = row[1]
# 		# description = row[4]+','+row[5]+","+row[6]
# 		# unit_weight = row[8]
# 		# # processor = row[5]+" "+row[6]+" "+row[7]
# 		# dim = row[3]+" x "+row[9]+" x "+row[2]
# 		# print dim
# 		# display_size = row[9]
# 		# fur_type = row[7]
# 		# material = row[6]
# 		images = row[-1]
# 		images = images.split('\n')
# 		# print images
# 		if row[0]=="12":
			
# 			for image in images:
# 				if image:
# 					if Product.objects.filter(pk='MOB_'+str(int(row[0])+1)) and not ProductImages.objects.filter(product=Product.objects.get(pk='MOB_'+str(int(row[0])+1)), image_url=image) : 
# 						ProductImages.objects.create(product=Product.objects.get(pk='MOB_'+str(int(row[0])+1)), image_url=image)	
				# data['ind'].append(int(row[0])+1)
				# data['image_url'].append(image)
		# print images.split('\n')
		# ProductImages.objects.create(product=Product.objects.get(pk='MOB_1'), image_url='example.jpeg')
		# ProductImages.objects.create(product=Product.objects.get(pk='MOB_1'), image_url='example2.jpeg')
		# print ProductImages.objects.filter(pk='MOB_1')[1].image_url
		
		# Product.objects.create(pdt_id="FUR_"+str(int(row[0])+1), brand_name=name, units_in_stock=200, unit_weight=unit_weight, description=description)
		# Furniture.objects.create(furniture=Product.objects.get(pk="FUR_"+str(int(row[0])+1)), type=fur_type,dimensions=dim, material=material)
# df = pd.DataFrame(data)
# df.to_csv('csv_files/mobile_images.csv')
# print df



# Querying from Images Table
# print ProductImages.objects.filter(product=Product.objects.get(pk='MOB_1'))


# with open('csv_files/book_data_educ.csv') as f:
# 	reader = csv.reader(f)
# 	header = next(reader)
# 	# ctr=0
# 	data = {'ind':[], 'image_url':[]}
# 	for row in reader:
# 		images = row[-2]
# 		images = images.split('\n')
# 		for image in images:
# 				if image:
# 					if Product.objects.filter(pk='BOOK_'+str(int(row[0])+41)) and not ProductImages.objects.filter(product=Product.objects.get(pk='BOOK_'+str(int(row[0])+21)), image_url=image) : 
# 						ProductImages.objects.create(product=Product.objects.get(pk='BOOK_'+str(int(row[0])+41)), image_url=image)	
# 						print "Inserting book:"+str('BOOK_'+str(int(row[0])+41)+"  "+image)


# with open('csv_files/furniture.csv') as f:
# 	reader = csv.reader(f)
# 	header = next(reader)
# 	# ctr=0
# 	data = {'ind':[], 'image_url':[]}
# 	for row in reader:
# 		images = row[-1]
# 		images = images.split('\n')
# 		for image in images:
# 				if image:
# 					if Product.objects.filter(pk='FUR_'+str(int(row[0])+1)) and not ProductImages.objects.filter(product=Product.objects.get(pk='FUR_'+str(int(row[0])+1)), image_url=image) : 
# 						ProductImages.objects.create(product=Product.objects.get(pk='FUR_'+str(int(row[0])+1)), image_url=image)	
# 						print "Inserting furniture:"+str('FUR_'+str(int(row[0])+1)+"  "+image)


with open('csv_files/laptops.csv') as f:
	print "here"
	reader = csv.reader(f)
	header = next(reader)
	# ctr=0
	
	data = {'ind':[], 'image_url':[]}
	for row in reader:
		images = row[-1]
		images = images.split('\n')
		# print images
		for image in images:
				if image:
					
					if Product.objects.filter(pk='LPT_'+str(int(row[0])+1)) and not ProductImages.objects.filter(product=Product.objects.get(pk='LPT_'+str(int(row[0])+1)), image_url=image): 
						ProductImages.objects.create(product=Product.objects.get(pk='LPT_'+str(int(row[0])+1)), image_url=image)	
						print "Inserting laptop:"+str('LPT_'+str(int(row[0])+1)+"  "+image)
