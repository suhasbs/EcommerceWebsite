"""ECommerce URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from .views import IndexView, AddProductView, MobileDetails, \
UserFormView, AddProductToCartView ,BooksListView, BookDetails, FurnitureListView, FurnitureDetails,LaptopListView,LaptopDetails, GetCartProducts,RemoveCartItem, BuyView,InvoiceView, recommendations,search,root


app_name = 'ecom_webapp'
urlpatterns = [
	url(r'^$', root, name='root'),
    url(r'^mobiles/$', IndexView.as_view(), name='index'),
    url(r'^books/$', BooksListView.as_view(), name='books'),
    url(r'^books/(?P<prod_id>\w+)/$', BookDetails.as_view(), name='book_details'),
    url(r'^furniture/$', FurnitureListView.as_view(), name='furniture'),
    url(r'^furniture/(?P<prod_id>\w+)/$', FurnitureDetails.as_view(), name='furniture_details'),
    url(r'^new/$', AddProductView.as_view(), name='add_product'),
    url(r'^laptops/$', LaptopListView.as_view(), name='laptops'),
     url(r'^laptops/(?P<prod_id>\w+)/$', LaptopDetails.as_view(), name='laptop_details'),
    url(r'^mobiles/(?P<prod_id>\w+)/$', MobileDetails.as_view(), name='mob_details'),
    url(r'^add/$', AddProductToCartView.as_view(), name='add_to_cart'),
    url(r'^getCart/$', GetCartProducts.as_view(), name='getCart'),
    url(r'^remove/$', RemoveCartItem.as_view(), name='remove_from_cart'),
    url(r'^buy/$', BuyView.as_view(), name='buy'),
    url(r'^invoice/$', InvoiceView.as_view(), name='invoice'),
    url(r'^recommendations/$', recommendations, name='recommendations'),
    url(r'^search/', search, name='search'),
    

]
