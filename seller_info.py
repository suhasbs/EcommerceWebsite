from bs4 import BeautifulSoup 
import urllib2
import pandas as pd


# url = urllib2.urlopen('https://www.amazon.in/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=mobiles')
# soup = BeautifulSoup(url, 'html.parser')

# for s in soup.find_all("a","a-link-normal s-access-detail-page s-color-twister-title-link a-text-normal")[1:]:
# 	print s['title']
# 	print s['href']
# 	prod_url = urllib2.urlopen(s['href'])
# 	prod_soup = BeautifulSoup(prod_url, 'html.parser')
# 	# file = open('test.txt','w')
# 	# file.write(prod_soup.prettify().encode('utf-8'))
# 	# file.close()
	

# 	seller_url = prod_soup.find('span', 'olp-padding-right').a['href']
# 	seller_url = urllib2.urlopen("https://www.amazon.in"+seller_url)
# 	seller_soup = BeautifulSoup(seller_url, 'html.parser')
# 	info_span = seller_soup.find_all('span', 'a-size-medium a-text-bold')
# 	print info_span
# 	for sp in info_span:
# 		print "opening "+"https://www.amazon.in"+sp.a['href']
# 		info = urllib2.urlopen("https://www.amazon.in"+sp.a['href'])
# 		seller_info_soup = BeautifulSoup(info, 'html.parser')
# 		print seller_infohttps://www.91mobiles.com/dealers/Bangalore.html_soup.find('p', 'a-spacing-mini').get_text()


# 	break
seller_data = {}
seller_data['name'] = []
seller_data['address'] = []
seller_data['contact'] = []
url = urllib2.urlopen("https://www.91mobiles.com/dealers/Bangalore.html")
soup = BeautifulSoup(url, 'html.parser')

stores = soup.find_all('div', 'store')
contact = soup.find_all('div', 'show_phone')
for s,c in zip(stores, contact):
	name = s.h3.get_text().strip()
	address = s.div.get_text().strip()
	seller_data['name'].append(name)
	seller_data['address'].append(address)
	seller_data['contact'].append(c['data-number'])

# print seller_data
df = pd.DataFrame(data=seller_data)
writer = pd.ExcelWriter('seller_data.xlsx', engine='xlsxwriter')
df.to_excel(writer, sheet_name='Sheet1')
writer.save()
