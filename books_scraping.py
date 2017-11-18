from bs4 import BeautifulSoup 
import urllib2
import pandas as pd



book_data = {}
book_data['name'] = []
book_data['authors'] = []
book_data['highlights'] = []
book_data['description'] = []
book_data['genre'] = []
book_data['images'] = []
pages = 1
ctr=0
for page in range(pages):
	# url = urllib2.urlopen("https://www.flipkart.com/books/fiction-nonfiction-books/literature-fiction-books/action-adventure-books/pr?sid=bks,fnf,gld,5wu&q=books&otracker=categorytree")
	# url = urllib2.urlopen("https://www.flipkart.com/books/philosophy-books/pr?sid=bks,1zh&otracker=categorytree")
	url = urllib2.urlopen("https://www.flipkart.com/books/educational-and-professional-books/pr?sid=bks,enp&otracker=categorytree")
	soup = BeautifulSoup(url, 'html.parser')
	for s in soup.find_all("a", "Zhf2z-"): #loops through all products in page
		# print s['href']
		prod_url = urllib2.urlopen("https://www.flipkart.com"+s['href'])

		prod_soup = BeautifulSoup(prod_url, 'html.parser')
		name = prod_soup.find('h1', '_3eAQiD').get_text()
		# print name

		author = prod_soup.find('div', "col col-4-5 _3dpydb")
		if not author:
			continue
		author_name = author.get_text()

		highlights = prod_soup.find('div', "_3WHvuP")
		highs = ""
		for h in highlights.find_all('li'):
			highs+=h.get_text()+","
		# print highs

		description = prod_soup.find('div', "bzeytq")
		if description:
			description = description.get_text()
		else:
			continue
		# print "Description: "+description

		genre = "Education"
		imgs_list = prod_soup.find_all('div', "_1kJJoT")
		images = ""
		if imgs_list:
			for img in imgs_list:
				# print img['style'][21:-2]
				images+=(img['style'][29:-2])+"\n"
			# print specs[2]

		else:
			imgs_list = prod_soup.find('img', "sfescn")
			images = imgs_list['src']
		# print images

		if name  and author  and highs and genre  and images  and description:
			book_data['name'].append(name)
			book_data['highlights'].append(highs)
			book_data['description'].append(description)
			book_data['genre'].append(genre)
			book_data['images'].append(images)
			book_data['authors'].append(author_name)
			ctr=ctr+1
			# print book_data
		if ctr==20:
			break

df = pd.DataFrame(data=book_data)
writer = pd.ExcelWriter('book_data_edu.xlsx', engine='xlsxwriter')
df.to_excel(writer, sheet_name='Sheet1')
writer.save()