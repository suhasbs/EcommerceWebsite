import csv
from ECommerce.ecom_webapp.models import Mobiles
with open('mobile_data.csv') as f:
	reader = csv.reader(f, delimiter=',')
	header = next(reader)
	for row in reader:
		print row[0]