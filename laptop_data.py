from bs4 import BeautifulSoup 
import urllib.request as urllib2
import pandas as pd
# url = urllib2.urlopen('https://www.amazon.in/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=mobiles&rh=i%3Aaps%2Ck%3Amobiles')
# url = urllib2.urlopen("https://www.flipkart.com/search?as=off&as-show=off&otracker=start&page=1&q=mobiles&viewType=list")
# url = urllib2.urlopen('https://www.flipkart.com/search?q=mobiles&otracker=start&as-show=off&as=off')
# soup = BeautifulSoup(url, 'html.parser')

# for s in soup.find_all("a","a-link-normal s-access-detail-page s-color-twister-title-link a-text-normal"):
# 	print s['title']
# 	print s['href']
# 	prod_url = urllib2.urlopen(s['href'])
# 	prod_soup = BeautifulSoup(prod_url, 'html.parser')
# 	specs = prod_soup.find("div", "pdTab")
# 	attr - ["RAM", "Item Weight", ""]
# 	vals = specs.find("td")
# 	break

mobData = {}

# df = pd.DataFrame(data=mobData)
# writer = pd.ExcelWriter('pandas_simple.xlsx', engine='xlsxwriter')
# df.to_excel(writer, sheet_name='Sheet1')
# writer.save()
pages = 10
for page in range(pages):
	url = urllib2.urlopen("https://www.flipkart.com/search?as=on&as-pos=1_1_ic_laptop&as-show=on&otracker=start&page="+str(page+1)+"&q=laptop&sid=6bo%2Fb5g&viewType=list")
	soup = BeautifulSoup(url, 'html.parser')
	for s in soup.find_all("a", "_1UoZlX"): #loops through all products in page
		# print s['href']
		


		prod_url = urllib2.urlopen("https://www.flipkart.com"+s['href'])
		prod_soup = BeautifulSoup(prod_url, 'html.parser')
		specs = prod_soup.find_all("div", "_2Kp3n6")
		imgs_list = prod_soup.find_all('div', "_1kJJoT")
		images = ""
		for img in imgs_list:
			# print img['style'][21:-2]
			images+=(img['style'][29:-2])+"\n"
		# print specs[2]
		attr_list = ['Model Number', 'Model Name', 'Screen Size', 'Processor Brand', 'Processor Name','Processor Generation', 'HDD Capacity', 'RAM', 'Operating System']
		# attr_list = '\t'.join(attr_list)
		for s in specs:	
			lis = s.find_all("li")
			for att in lis:
				# print att.get_text() 
				# print ""
				# print ""
				for word in attr_list:
					if word in att.get_text() and 'Primary Camera Available' not in att.get_text() and 'Secondary Camera Available' not in att.get_text():
						if word in mobData:
							mobData[word].append(att.get_text()[len(word):])

						else:
							mobData[word] = [att.get_text()[len(word):]]
						attr_list.remove(word)
						# print word+" : "+att.get_text()[len(word):]


		if len(attr_list) > 0:
			for word in attr_list:
				mobData[word].append(" ")
			attr_list = ['Model Number', 'Model Name', 'Screen Size', 'Processor Brand', 'Processor Name','Processor Generation', 'HDD Capacity', 'RAM', 'Operating System']
			for word in attr_list:
				mobData[word].pop()
		else:
			if "image_urls" not in mobData:
				mobData['image_urls'] = [images]
			else:
				mobData['image_urls'].append(images)
		# print ""
		# print ""

# print mobData
df = pd.DataFrame(data=mobData)
writer = pd.ExcelWriter('laptops.xlsx', engine='xlsxwriter')
df.to_excel(writer, sheet_name='Sheet1')
writer.save()


