# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals
from django.contrib.auth.models import User
from django.db import models


class Accessory(models.Model):
    acc = models.ForeignKey('Product', models.DO_NOTHING, primary_key=True)
    model_no = models.CharField(max_length=20, blank=True, null=True)
    type = models.CharField(max_length=30, blank=True, null=True)
    spec = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'accessory'


# class AuthGroup(models.Model):
#     name = models.CharField(unique=True, max_length=80)

#     class Meta:
#         managed = False
#         db_table = 'auth_group'


# class AuthGroupPermissions(models.Model):
#     group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
#     permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

#     class Meta:
#         managed = False
#         db_table = 'auth_group_permissions'
#         unique_together = (('group', 'permission'),)


# class AuthPermission(models.Model):
#     name = models.CharField(max_length=255)
#     content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
#     codename = models.CharField(max_length=100)

#     class Meta:
#         managed = False
#         db_table = 'auth_permission'
#         unique_together = (('content_type', 'codename'),)


# class AuthUser(models.Model):
#     password = models.CharField(max_length=128)
#     last_login = models.DateTimeField(blank=True, null=True)
#     is_superuser = models.IntegerField()
#     username = models.CharField(unique=True, max_length=150)
#     first_name = models.CharField(max_length=30)
#     last_name = models.CharField(max_length=30)
#     email = models.CharField(max_length=254)
#     is_staff = models.IntegerField()
#     is_active = models.IntegerField()
#     date_joined = models.DateTimeField()

#     class Meta:
#         managed = False
#         db_table = 'auth_user'


# class AuthUserGroups(models.Model):
#     user = models.ForeignKey(AuthUser, models.DO_NOTHING)
#     group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

#     class Meta:
#         managed = False
#         db_table = 'auth_user_groups'
#         unique_together = (('user', 'group'),)


# class AuthUserUserPermissions(models.Model):
#     user = models.ForeignKey(AuthUser, models.DO_NOTHING)
#     permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

#     class Meta:
#         managed = False
#         db_table = 'auth_user_user_permissions'
#         unique_together = (('user', 'permission'),)


class Authors(models.Model):
    book = models.ForeignKey('Books', models.DO_NOTHING, primary_key=True)
    author_name = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'authors'
        unique_together = (('book', 'author_name'),)

    def get_fields(self):
        return [(field.verbose_name, field.value_to_string(self)) for field in Books._meta.fields]




class Bill(models.Model):
    bill_id = models.IntegerField(primary_key=True)
    billing_price = models.DecimalField(max_digits=10, decimal_places=2)
    payment_type = models.CharField(max_length=20)
    bill_replaces = models.ForeignKey('self', models.DO_NOTHING, db_column='bill_replaces', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'bill'


class Books(models.Model):
    pdt = models.ForeignKey('Product', models.DO_NOTHING, primary_key=True)
    publisher = models.CharField(max_length=50)
    genre = models.CharField(max_length=50, blank=True, null=True)
    summary = models.TextField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'books'
    def __str__(self):
        return self.pdt.brand_name


class Cart(models.Model):
    cart_id = models.IntegerField(primary_key=True)
    cust_email = models.ForeignKey('Customer', models.CASCADE, db_column='cust_email',  related_name='+')
    no_of_products = models.IntegerField(blank=True, null=True)
    total_price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cart'
        unique_together = (('cart_id', 'cust_email'),)


class Clothes(models.Model):
    cloth = models.ForeignKey('Product', models.DO_NOTHING, primary_key=True)
    gender = models.CharField(max_length=10)
    material = models.CharField(max_length=50, blank=True, null=True)
    type = models.CharField(max_length=20, blank=True, null=True)
    size = models.CharField(max_length=10)

    class Meta:
        managed = False
        db_table = 'clothes'


class Customer(models.Model):
    first_name = models.CharField(max_length=50, blank=True, null=True)
    last_name = models.CharField(max_length=50, blank=True, null=True)
    email_id = models.CharField(primary_key=True, max_length=100)
    contact_no = models.CharField(max_length=15, blank=True, null=True)
    cart = models.ForeignKey('Cart', models.CASCADE,null=True)
    user = models.ForeignKey(User, models.CASCADE)

    class Meta:
        managed = False
        db_table = 'customer'


# class DjangoAdminLog(models.Model):
#     action_time = models.DateTimeField()
#     object_id = models.TextField(blank=True, null=True)
#     object_repr = models.CharField(max_length=200)
#     action_flag = models.SmallIntegerField()
#     change_message = models.TextField()
#     content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
#     user = models.ForeignKey(AuthUser, models.DO_NOTHING)

#     class Meta:
#         managed = False
#         db_table = 'django_admin_log'


# class DjangoContentType(models.Model):
#     app_label = models.CharField(max_length=100)
#     model = models.CharField(max_length=100)

#     class Meta:
#         managed = False
#         db_table = 'django_content_type'
#         unique_together = (('app_label', 'model'),)


# class DjangoMigrations(models.Model):
#     app = models.CharField(max_length=255)
#     name = models.CharField(max_length=255)
#     applied = models.DateTimeField()

#     class Meta:
#         managed = False
#         db_table = 'django_migrations'


# class DjangoSession(models.Model):
#     session_key = models.CharField(primary_key=True, max_length=40)
#     session_data = models.TextField()
#     expire_date = models.DateTimeField()

#     class Meta:
#         managed = False
#         db_table = 'django_session'


class Furniture(models.Model):
    furniture = models.ForeignKey('Product', models.DO_NOTHING, primary_key=True)
    type = models.CharField(max_length=20, blank=True, null=True)
    dimensions = models.CharField(max_length=50, blank=True, null=True)
    material = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'furniture'

    def __str__(self):
        return self.furniture.brand_name+" "+self.type

    def get_fields(self):
        return [(field.verbose_name, field.value_to_string(self)) for field in Furniture._meta.fields]



class GenerateBill(models.Model):
    order_id_fk = models.ForeignKey('Order', models.DO_NOTHING, db_column='order_id_fk')
    bill_id_fk = models.ForeignKey(Bill, models.DO_NOTHING, db_column='bill_id_fk', primary_key=True)
    customer_id_fk = models.ForeignKey(Customer, models.DO_NOTHING, db_column='customer_id_fk')

    class Meta:
        managed = False
        db_table = 'generate_bill'


class Laptop(models.Model):
    laptop = models.ForeignKey('Product', models.DO_NOTHING, primary_key=True)
    model_no = models.CharField(max_length=20, blank=True, null=True)
    display_size = models.CharField(max_length=10, blank=True, null=True)
    harddisk_capacity = models.CharField(max_length=10, blank=True, null=True)
    ram = models.CharField(max_length=5, blank=True, null=True)
    processor = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'laptop'

    def __str__(self):
        return self.laptop.brand_name

    def get_fields(self):
        return [(field.verbose_name, field.value_to_string(self)) for field in Laptop._meta.fields]




class MobileData(models.Model):
    index = models.IntegerField(db_column='Index', primary_key=True)  # Field name made lowercase.
    display_size = models.TextField(db_column='Display_Size', blank=True, null=True)  # Field name made lowercase.
    internal_storage = models.TextField(db_column='Internal_Storage', blank=True, null=True)  # Field name made lowercase.
    model_name = models.TextField(db_column='Model_Name', blank=True, null=True)  # Field name made lowercase.
    model_number = models.TextField(db_column='Model_Number', blank=True, null=True)  # Field name made lowercase.
    primary_camera = models.TextField(db_column='Primary_Camera', blank=True, null=True)  # Field name made lowercase.
    processor_type = models.TextField(db_column='Processor_Type', blank=True, null=True)  # Field name made lowercase.
    ram = models.TextField(db_column='RAM', blank=True, null=True)  # Field name made lowercase.
    secondary_camera = models.TextField(db_column='Secondary_Camera', blank=True, null=True)  # Field name made lowercase.
    weight = models.TextField(db_column='Weight', blank=True, null=True)  # Field name made lowercase.
    image_urls = models.TextField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'mobile_data'


class Mobiles(models.Model):
    mobile = models.ForeignKey('Product', models.DO_NOTHING, primary_key=True)
    model_no = models.CharField(max_length=100)
    ram = models.CharField(max_length=5)
    screen_size = models.CharField(max_length=10)
    internal_memory = models.CharField(max_length=10)
    processor = models.CharField(max_length=255)
    primary_camera = models.CharField(max_length=20, blank=True, null=True)
    secondary_camera = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'mobiles'

    def __str__(self):
        return self.mobile.brand_name


    def get_fields(self):
        return [(field.verbose_name, field.value_to_string(self)) for field in Mobiles._meta.fields]


class Order(models.Model):
    order_id = models.IntegerField(primary_key=True)
    order_datetime = models.DateTimeField(blank=True, null=True)
    delivery_date = models.DateField(blank=True, null=True)
    delivery_address = models.CharField(max_length=255, blank=True, null=True)
    cart_id_fk = models.ForeignKey(Cart, models.DO_NOTHING, db_column='cart_id_fk')

    class Meta:
        managed = False
        db_table = 'order'


class Product(models.Model):
    pdt_id = models.CharField(primary_key=True, max_length=20)
    brand_name = models.CharField(max_length=255)
    description = models.CharField(max_length=255, blank=True, null=True)
    unit_weight = models.CharField(max_length=10, blank=True, null=True)
    units_in_stock = models.IntegerField()
    price = models.DecimalField(max_digits=10,decimal_places=2,null=True)
    class Meta:
        managed = True
        db_table = 'product'
    def __str__(self):
        return self.brand_name

    def get_fields(self):
        return [(field.verbose_name, field.value_to_string(self)) for field in Product._meta.fields]


class ProductImages(models.Model):
    product = models.ForeignKey(Product, models.DO_NOTHING, primary_key=True)
    image_url = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'product_images'
        unique_together = (('product', 'image_url'),)

    def __str__(self):
        return self.product




class ProductSupply(models.Model):
    supplier = models.ForeignKey('Supplier', models.DO_NOTHING, primary_key=True)
    prod = models.ForeignKey(Product, models.DO_NOTHING)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    quantity = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'product_supply'
        unique_together = (('supplier', 'prod'),)


class ProductsInCart(models.Model):
    cart_id_fk = models.ForeignKey(Cart, models.DO_NOTHING, db_column='cart_id_fk', primary_key=True)
    prd = models.ForeignKey(Product, models.DO_NOTHING)
    quantity = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'products_in_cart'
        unique_together = (('cart_id_fk', 'prd'),)


class Supplier(models.Model):
    sup_id = models.IntegerField(primary_key=True)
    sup_name = models.CharField(max_length=100, blank=True, null=True)
    contact = models.IntegerField(blank=True, null=True)
    address = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'supplier'


class Television(models.Model):
    tv = models.ForeignKey(Product, models.DO_NOTHING, primary_key=True)
    model_no = models.CharField(max_length=20, blank=True, null=True)
    type = models.CharField(max_length=20, blank=True, null=True)
    display_size = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'television'
