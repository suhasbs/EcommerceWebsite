from django import forms
from django.contrib.auth.models import User

class ProductForm(forms.Form):
	model_no = forms.CharField(label='Model Number', max_length=20)
	model_name = forms.CharField(label='Model Name', max_length=100)
	ram = forms.CharField(label='RAM', max_length=10)
	primary_cam = forms.CharField(label='Prim Cam', max_length=10)
	

class UserForm(forms.ModelForm):
	password = forms.CharField(widget=forms.PasswordInput) 

	class Meta:
		model = User
		fields = ['username', 'email', 'password', 'first_name', 'last_name']
		# fields = "__all__"

class UserLoginForm(forms.Form):
	username = forms.CharField(max_length=150)
	password = forms.CharField(widget=forms.PasswordInput) 


class CustomerRegForm(forms.Form):
	first_name = forms.CharField(max_length=50)
	last_name = forms.CharField(max_length=50)
	email = forms.CharField(max_length=100)
	contact_no = forms.CharField(max_length=15, required=False)
	password = forms.CharField(widget=forms.PasswordInput) 
	username = forms.CharField(max_length=150)
	# cart = models.ForeignKey('Cart', models.DO_NOTHING)