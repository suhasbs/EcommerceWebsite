# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render, HttpResponse, redirect
from django.http import JsonResponse
from django.db import connection
from django.views import View
from .forms import ProductForm
from django.http import HttpResponseRedirect 
from .models import MobileData, Product, Mobiles, ProductImages, Customer, Cart,Books, Furniture
from .models import *
from . forms import *
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from django.core import serializers
from datetime import datetime, date, time, timedelta
from . import recommender
import cPickle
import os

# Create your views here.

# def index(request):

# 	with connection.cursor() as cursor:
# 		# cursor.execute("UPDATE bar SET foo = 1 WHERE baz = %s", [self.baz])
# 		cursor.execute("SELECT * FROM mobile_data")
# 		results = dictfetchall(cursor)
# 		print results[0]
# 	return render(request,'ecomm_webapp/index.html', {'results':results})


# def dictfetchall(cursor):
#     "Return all rows from a cursor as a dict"
#     columns = [col[0] for col in cursor.description]
#     return [
#         dict(zip(columns, row))
#         for row in cursor.fetchall()
#     ]


def root(request):
	return redirect('ecom_webapp:index')


class UserFormView(View):
	form_class = CustomerRegForm
	template_name = 'ecomm_webapp/registration.html'

	def get(self, request):
		form = self.form_class(None)
		return render(request, self.template_name, {'form':form})

	def post(self, request):
		form = self.form_class(request.POST)
		print form
		if form.is_valid():

			# customer = form.save(commit=False)
			username = form.cleaned_data['username']
			password = form.cleaned_data['password']
			fname = form.cleaned_data['first_name']
			lname = form.cleaned_data['last_name']
			email = form.cleaned_data['email']
			contact = form.cleaned_data['contact_no']
			user = User.objects.create(first_name=fname, last_name=lname, email=email, username=username)
			user.set_password(password)
			user.save()
			customer = Customer.objects.create(first_name=fname, last_name=lname, email_id=email, contact_no=contact, user=user)
			# if not Cart.objects.all():
			# 	cart = Cart.objects.create(cart_id=1)
			# else:
			# 	cart = Cart.objects.create(cart_id=Cart.objects.order_by("-cart_id")[0]+1)
			# customer.cart = cart
			customer.save()
			print "User created"
			customer.user = authenticate(username=username, password=password)
			if not Cart.objects.all():
				cart = Cart.objects.create(cart_id=1, cust_email=customer)
			else:
				cart = Cart.objects.create(cart_id=Cart.objects.order_by("-cart_id")[0].cart_id+1, cust_email=customer)
			# customer.cart = cart
			# customer.save()
			print "Cart created"
			recommender.add_new_user(customer.user.username)
			f = open('/home/suhas/Web_Tech_Project/E-Commerce/ECommerce/recommender.save', 'wb')
			cPickle.dump(recommender, f, protocol = cPickle.HIGHEST_PROTOCOL)
			f.close()
			if user is not None:
				if user.is_active:
					login(request, user)
					return redirect('ecom_webapp:index')

		else:
			return render(request, self.template_name, {'form':form})


class LoginView(View):
	form_class = UserLoginForm
	template_name = 'ecomm_webapp/login.html'

	def get(self, request):
		if request.user.is_authenticated():
			return redirect("ecom_webapp:index")
		form = self.form_class(None)
		return render(request, self.template_name, {'form':form})

	def post(self, request):
		form = self.form_class(request.POST)
		print form
		if form.is_valid():
			# user = form.save(commit=False)
			username = form.cleaned_data['username']
			password = form.cleaned_data['password']
			# user.set_password(password)
			# user.save()
			# print "User created"
			user = authenticate(username=username, password=password)
			if user is not None:
				if user.is_active:
					login(request, user)
					if(request.GET.get('next')):
						print "Here"
						return redirect(request.GET['next'])
					return redirect('ecom_webapp:index')
			else:
				error_msg = "Wrong Login Credentials! "
				return render(request, "ecomm_webapp/login.html", {'error_msg': error_msg})


class LogoutView(View):
	def get(self, request):
		if request.user.is_authenticated():
			f = open('/home/suhas/Web_Tech_Project/E-Commerce/ECommerce/recommender.save', 'wb')
			cPickle.dump(recommender, f, protocol = cPickle.HIGHEST_PROTOCOL)
			f.close()
			logout(request)
			return redirect('ecom_webapp:index')


class IndexView(View):
	def get(self, request):
		if request.user.is_authenticated():
			print request.user
		else:
			print "Not authenticated"
		
		
		results = MobileData.objects.all()
		prod = (Mobiles.objects.values('mobile_id'))
		all_mobiles = []
		for i in prod:
			# print i['mobile_id']
			new_prod = {}
			new_prod['mobile_id'] = i['mobile_id'] 
			new_prod['image_url'] = "http://"+ProductImages.objects.filter(pk=i['mobile_id'])[0].image_url
			# for image in new_prod['image_url'].split()
			wid_ht = ProductImages.objects.filter(pk=i['mobile_id'])[0].image_url.split('/')
			wid_ht[2] = "1024"
			wid_ht[3]= "1024"
			new_prod['image_url'] = "https://"+'/'.join(wid_ht)


			new_prod['name'] = Product.objects.get(pk=i['mobile_id']).brand_name
			new_prod['price'] = Product.objects.get(pk=i['mobile_id']).price
			all_mobiles.append(new_prod)

		# for 
		# print results.model_name
		return render(request,'ecomm_webapp/index.html', {'all_mobiles':all_mobiles})

def is_ascii(s):
		return all(ord(c) < 128 for c in s)



#available only to admin
class AddProductView(View):
	form_class = ProductForm
	template_name = 'ecomm_webapp/new_product_template.html'
	# initial = {'key', 'value'}
	initial = {}
	def get(self, request, *args, **kwargs):
		form = self.form_class(initial=self.initial)
		# print form
		return render(request, self.template_name, {'form': form})


	def post(self, request, *args, **kwargs):
		form = self.form_class(request.POST)
		print (form.data)

		# with connection.cursor() as cursor:
		# 	# cursor.execute("UPDATE bar SET foo = 1 WHERE baz = %s", [self.baz])
		# 	print "Inserting "+form.data['model_no']+form.data['model_name']
		# 	cursor.execute("INSERT into mobile_data values(200, '10.5 inch', '50 GB', %s, %s, 'test', 'test', 'test', 'test', 'test', 'test')", [form.data['model_name'], form.data['model_no']])


		return HttpResponseRedirect('/products/')


class MobileDetails(View):

	template_name = 'ecomm_webapp/details.html'

	def get(self, request, *args, **kwargs):
		pk = self.kwargs['prod_id']
		prod = Product.objects.get(pk=pk)
		mob = Mobiles.objects.get(pk=prod)
		results = {}
		results['prod_attr'] = prod
		results['mob_attr'] = mob
		# results['image_url'] = ProductImages.objects.filter(pk=pk).values('image_url')
		list_images = ProductImages.objects.filter(pk=pk).values('image_url')
		for img in list_images:
			img['image_url'] = img['image_url'].replace("128", "1024")
			# print img['image_url']
		results['image_url'] = list_images
		# print results
		# print results['prod_attr'].brand_name
		# pdts_recom =  recommender.recommend(1,request.user.username, prod.pdt_id)
		# products = Product.objects.filter(pdt_id__in=pdts_recom)
		# print products

		return render(request, self.template_name, {'results': results})



class AddProductToCartView(View):
	@method_decorator(login_required)
	@method_decorator(csrf_exempt)
	def dispatch(self, *args, **kwargs):
		return super(AddProductToCartView, self).dispatch(*args, **kwargs)


	def get(self, request,*args, **kwargs):
		pass

	def post(self, request,*args, **kwargs):
		product_id = request.POST['product_id']
		print request.user
		customer = Customer.objects.filter(user=request.user)
		print customer
		cart = Cart.objects.filter(cust_email=customer)[0]
		if ProductsInCart.objects.filter(cart_id_fk=cart, prd=Product.objects.get(pk=product_id), quantity=1):
		 	return JsonResponse({"failure":1,"message":"Product already exists in cart!" })
		ProductsInCart.objects.create(cart_id_fk=cart, prd=Product.objects.get(pk=product_id), quantity=1)
		print "Prod Added"
		products = ProductsInCart.objects.filter(cart_id_fk=cart).values('prd')
		products = Product.objects.filter(pdt_id__in=products)
		images = ProductImages.objects.filter(pk__in=[p.pdt_id for p in products])
		images = serializers.serialize('json', list(images),)
		print products
		data = serializers.serialize('json', list(products),)
		return JsonResponse({"success":1, "products":data, "images":images})


class GetCartProducts(View):
	def get(self, request,*args, **kwargs):
		customer = Customer.objects.filter(user=request.user)
		print customer
		cart = Cart.objects.filter(cust_email=customer)[0]
		# ProductsInCart.objects.create(cart_id_fk=cart, prd=Product.objects.get(pk=product_id), quantity=1)
		print "Prod Added"
		products = ProductsInCart.objects.filter(cart_id_fk=cart).values('prd')
		products = Product.objects.filter(pdt_id__in=products)
		images = {}
		images['image_urls']= []
		for p in products:
			i = ProductImages.objects.filter(pk=p.pdt_id)[0].image_url.split('//')[-1]			
			images['image_urls'].append(i)
		print images
		print products
		data = serializers.serialize('json', list(products),)
		# images = serializers.serialize('json', list(images),)
		return JsonResponse({"success":1, "products":data, "images":images})		



class RemoveCartItem(View):
	
	@method_decorator(login_required)
	@method_decorator(csrf_exempt)
	def dispatch(self, *args, **kwargs):
		return super(RemoveCartItem, self).dispatch(*args, **kwargs)

	def get(self, request, *args, **kwargs):
		product_id = request.GET['product_id']
		print product_id
		customer = Customer.objects.filter(user=request.user)
		cart = Cart.objects.filter(cust_email=customer)[0]
		ProductsInCart.objects.filter(cart_id_fk=cart, prd=Product.objects.get(pk=product_id)).delete()
		return JsonResponse({"Success":1})



class BooksListView(View):
	def get(self, request):
		results = Books.objects.all()
		prod = (Books.objects.values('pdt_id'))
		print prod[0:10]
		all_books = []
		for i in prod:
			# print i['mobile_id']
			new_prod = {}
			new_prod['pdt_id'] = i['pdt_id'] 
			print "Inside: "+str(i['pdt_id'])

			new_prod['image_url'] = "http://"+ProductImages.objects.filter(pk=i['pdt_id'])[0].image_url
			# for image in new_prod['image_url'].split()
			wid_ht = ProductImages.objects.filter(pk=i['pdt_id'])[0].image_url.split('//')[-1].split('/')
			wid_ht[2] = "1024"
			wid_ht[3]= "1024"
			new_prod['image_url'] = "https://"+'/'.join(wid_ht)


			new_prod['name'] = Product.objects.get(pk=i['pdt_id']).brand_name
			new_prod['price'] = Product.objects.get(pk=i['pdt_id']).price
			all_books.append(new_prod)

		# for 
		# print results.model_name
		return render(request,'ecomm_webapp/bookslist.html', {'all_books':all_books})


class BookDetails(View):
	template_name = 'ecomm_webapp/book_details.html'

	def get(self, request, *args, **kwargs):
		pk = self.kwargs['prod_id']
		prod = Product.objects.get(pk=pk)
		book = Books.objects.get(pk=prod)
		results = {}
		results['prod_attr'] = prod
		results['mob_attr'] = book
		# results['image_url'] = ProductImages.objects.filter(pk=pk).values('image_url')
		list_images = ProductImages.objects.filter(pk=pk).values('image_url')
		for img in list_images:
			img['image_url'] = img['image_url'].replace("128", "1024").split("//")[-1]
			# print img['image_url']
		results['image_url'] = list_images
		# print results
		# print results['prod_attr'].brand_name
		return render(request, self.template_name, {'results': results})


class FurnitureListView(View):
	def get(self, request):
		
		results = Furniture.objects.all()
		prod = (Furniture.objects.values('furniture_id'))
		all_furniture = []
		for i in prod:
			# print i['mobile_id']
			new_prod = {}
			new_prod['furniture_id'] = i['furniture_id'] 
			new_prod['image_url'] = "http://"+ProductImages.objects.filter(pk=i['furniture_id'])[0].image_url
			# for image in new_prod['image_url'].split()
			wid_ht = ProductImages.objects.filter(pk=i['furniture_id'])[0].image_url.split('/')
			wid_ht[2] = "1024"
			wid_ht[3]= "1024"
			new_prod['image_url'] = "https://"+'/'.join(wid_ht)


			new_prod['name'] = Product.objects.get(pk=i['furniture_id']).brand_name
			new_prod['price'] = Product.objects.get(pk=i['furniture_id']).price
			all_furniture.append(new_prod)

		# for 
		# print results.model_name
		return render(request,'ecomm_webapp/furniture_list.html', {'all_furniture':all_furniture})


class FurnitureDetails(View):
	template_name = 'ecomm_webapp/furniture_details.html'

	def get(self, request, *args, **kwargs):
		pk = self.kwargs['prod_id']
		prod = Product.objects.get(pk=pk)
		furniture = Furniture.objects.get(pk=prod)
		results = {}
		results['prod_attr'] = prod
		results['mob_attr'] = furniture
		# results['image_url'] = ProductImages.objects.filter(pk=pk).values('image_url')
		list_images = ProductImages.objects.filter(pk=pk).values('image_url')
		for img in list_images:
			img['image_url'] = img['image_url'].replace("128", "1024").split("//")[-1]
			# print img['image_url']
		results['image_url'] = list_images
		# print results
		# print results['prod_attr'].brand_name
		return render(request, self.template_name, {'results': results})


class LaptopListView(View):
	def get(self, request):
		
		results = Laptop.objects.all()
		prod = (Laptop.objects.values('laptop_id'))
		# print prod
		all_laptops = []
		for i in prod:
			# print i['mobile_id']
			new_prod = {}
			new_prod['laptop_id'] = i['laptop_id'] 
			print i
			new_prod['image_url'] = "http://"+ProductImages.objects.filter(pk=i['laptop_id'])[0].image_url
			# for image in new_prod['image_url'].split()
			wid_ht = ProductImages.objects.filter(pk=i['laptop_id'])[0].image_url.split('/')
			wid_ht[2] = "1024"
			wid_ht[3]= "1024"
			new_prod['image_url'] = "https://"+'/'.join(wid_ht)


			new_prod['name'] = Product.objects.get(pk=i['laptop_id']).brand_name
			new_prod['price'] = Product.objects.get(pk=i['laptop_id']).price
			all_laptops.append(new_prod)

		# for 
		# print results.model_name
		return render(request,'ecomm_webapp/laptop_list.html', {'all_laptops':all_laptops})


class LaptopDetails(View):
	template_name = 'ecomm_webapp/laptop_details.html'

	def get(self, request, *args, **kwargs):
		pk = self.kwargs['prod_id']
		prod = Product.objects.get(pk=pk)
		laptop = Laptop.objects.get(pk=prod)
		results = {}
		results['prod_attr'] = prod
		results['mob_attr'] = laptop
		# results['image_url'] = ProductImages.objects.filter(pk=pk).values('image_url')
		list_images = ProductImages.objects.filter(pk=pk).values('image_url')
		for img in list_images:
			img['image_url'] = img['image_url'].replace("128", "1024").split("//")[-1]
			# print img['image_url']
		results['image_url'] = list_images
		# print results
		# print results['prod_attr'].brand_name
		return render(request, self.template_name, {'results': results})



class BuyView(View):
	def get(self, request, *args, **kwargs):
		user = request.user
		customer = Customer.objects.filter(user=request.user)
		cart = Cart.objects.filter(cust_email=customer)[0]
		products = ProductsInCart.objects.filter(cart_id_fk=cart)
		names = []
		for p in products:
			names.append(p.prd.pdt_id)
		print names
		# print products
		return HttpResponse("U have finished buying")
		


class InvoiceView(View):
	def get(self, request, *args, **kwargs):
		user = request.user
		customer = Customer.objects.filter(user=request.user)
		cart = Cart.objects.filter(cust_email=customer)[0]
		products = ProductsInCart.objects.filter(cart_id_fk=cart)
		names = []
		for p in products:
			names.append(p.prd.pdt_id)
		# print names
		recommender.shop(request.user.username, names)
		if not Order.objects.all():
				order = Order.objects.create(order_id=1, cart_id_fk=cart)
		else:
 			order = Order.objects.create(order_id=Order.objects.order_by("-order_id")[0].order_id+1, cart_id_fk=cart)
		order.order_datetime = datetime.now()
		order.delivery_date = datetime.now()+ timedelta(days=3)
		order.save()
		results = {}
		results['order'] = order
		results['user'] = user.first_name+" "+user.last_name
		results['email'] = user.email
		results['products'] = products
		total=0
		for p in products:
			total+=p.prd.price

		results['total'] = total
		print results



		ProductsInCart.objects.filter(cart_id_fk=cart).delete()

		return render(request, 'ecomm_webapp/bill.html', {'results':results})


def recommendations(request):

	url_dict = {
		"BOOK": '/products/books/',
		"MOB": '/products/mobiles/',
		"LPT": '/products/laptops/',
		"FUR": '/products/furniture/'
	}

	pdt_id = request.GET['product_id']
	pdts_recom =  recommender.recommend(3,request.user.username, pdt_id)
	products = Product.objects.filter(pdt_id__in=pdts_recom)
	images = {}
	images['image_urls']= []
	prod_urls = []
	for p in products:
		i = ProductImages.objects.filter(pk=p.pdt_id)[0].image_url.split('//')[-1]
		prod_urls.append(url_dict[p.pdt_id.split('_')[0]]+p.pdt_id)
		images['image_urls'].append(i)
	print images
	print products
	data = serializers.serialize('json', list(products),)
	# images = serializers.serialize('json', list(images),)
	return JsonResponse({"success":1, "products":data, "images":images, 'prod_urls':prod_urls})	







def search(request):
	q = request.GET.get('q')
	if q:
		products = Product.objects.filter(brand_name__icontains=q)
	else:
		return render(request,'ecomm_webapp/search.html')
	all_results = []
	url_dict = {
		"BOOK": '/products/books/',
		"MOB": '/products/mobiles/',
		"LPT": '/products/laptops/',
		"FUR": '/products/furniture/'
	}
	for i in products.values('pdt_id'):
			# print i['mobile_id']
			new_prod = {}
			new_prod['pdt_id'] = i['pdt_id'] 
			print "Inside: "+str(i['pdt_id'])

			new_prod['image_url'] = "http://"+ProductImages.objects.filter(pk=i['pdt_id'])[0].image_url
			# for image in new_prod['image_url'].split()
			wid_ht = ProductImages.objects.filter(pk=i['pdt_id'])[0].image_url.split('//')[-1].split('/')
			wid_ht[2] = "1024"
			wid_ht[3]= "1024"
			new_prod['image_url'] = "https://"+'/'.join(wid_ht)

			new_prod['url'] = url_dict[i['pdt_id'].split('_')[0]]+i['pdt_id']
			new_prod['name'] = Product.objects.get(pk=i['pdt_id']).brand_name
			all_results.append(new_prod)
	return render(request,'ecomm_webapp/search.html', {'all_books': all_results})