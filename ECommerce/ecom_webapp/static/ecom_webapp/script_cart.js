
var myCart = null;
var images = null;

function addToCart(user, product_id)
{
	// alert(user);
	if(user=="None"){
		alert("Please login before proceeding further!");
		return ;
	}
	$.ajax({

		url: "/products/add/",
		data : {"product_id":product_id},
		type: "POST",
		dataType: 'json',
		success: function(json)
		{
			if(json.failure){
				alert(json.message);
				getCartObjects();
				return ;
			}
			console.log("Added");
			// Populate pdts in cart
			// $("#myModal").modal('show');
			myCart = JSON.parse(json.products);
			images = JSON.parse(json.images);
			// populateCart(myCart,images);
			getCartObjects();
			console.log(JSON.parse(json.products));
		},

	})
}


function populateCart(myCart, images){

	// $('modal-body')[0].html()
	
	var html='';
	var total_price=0;
	for(var i=0;i<myCart.length;i++)
	{
		// console.log(myCart[i]);
		price = myCart[i].fields.price
		total_price+=parseFloat(price);
		removeButton = '<button style=\'float:right;\' class="btn btn-outline-danger" onclick="removeCartItem(\''+myCart[i].pk+'\')">Remove</button>'
		html+="<br><div><img src='http://"+images[i]+"' width='50' height='60' >&nbsp&nbsp"+myCart[i].fields.brand_name+" &nbsp &nbsp &nbsp<i class=\'fa fa-inr\'></i> "+price+removeButton+"</div>";
	}
	

	// console.log($('.modal-body'));
	// footer = $('.modal-footer').html();
	footer = "<h2>Total : <i class=\'fa fa-inr\'></i>"+total_price+"</h2>";
	$('.total').html(footer);
	$('.modal-body').html(html);
	// $('.modal-footer').html(footer);
	$("#myModal").modal('show');

}
 
function getCartObjects(){

	$.ajax({

		url: "/products/getCart/",
		// data : {"product_id":product_id},
		type: "GET",
		dataType: 'json',
		success: function(json)
		{
			console.log("Added");
			// Populate pdts in cart
			// $("#myModal").modal('show');
			console.log(json.images);
			images = json.images.image_urls;
			// console.log(JSON.parse(json.images.image_urls));
			myCart = JSON.parse(json.products);
			console.log(myCart);
			// images = JSON.parse(json.images);
			populateCart(myCart, images);
			// console.log(JSON.parse(json.images));
		},

	})

}

function removeCartItem(product_id){

	console.log(product_id);

	$.ajax({

		url: "/products/remove/",
		data : {"product_id":product_id},
		type: "GET",
		dataType: 'json',
		success: function(json)
		{
			console.log("Removed");
			// Populate pdts in cart
			// $("#myModal").modal('show');
			console.log(json);
			// images = JSON.parse(json.images);
			getCartObjects();
			// populateCart(myCart, images);
			// console.log(JSON.parse(json.images));
		},

	})

}


function getRecommendations(product_id)
{
	console.log(product_id);

	$.ajax({

		url: "/products/recommendations/",
		data : {"product_id":product_id},
		type: "GET",
		dataType: 'json',
		success: function(json)
		{
			// console.log("Removed");
			// Populate pdts in cart
			// $("#myModal").modal('show');
			console.log(json.images);
			products = JSON.parse(json.products);
			images = json.images.image_urls;
			urls = json.prod_urls;
			var html='<div class="container-fluid"><div class="row">';

			for(i=products.length-1;i>=0;i--)
			{	
				html+='<div class="col"><center><a href="'+urls[i]+'"><img src="http://'+images[i]+'" width="120" height="160"><br>'+products[i].fields.brand_name+'<br><i class="fa fa-inr"></i>'+ products[i].fields.price +'</a></center></div>';

			}
			html+="</div></div>";
			console.log(products.length);
			var card = $(".card").eq(1);
			console.log(card);
			if(products.length==0)
				card.hide();	
			else
			$("#fixedDiv").html(html);
			// images = JSON.parse(json.images);
			// getCartObjects();
			// populateCart(myCart, images);
			// console.log(JSON.parse(json.images));
		},

	})
}

$('#card1').scroll(function() { 
    $('#fixedDiv').css('top', $(this).scrollTop());
});