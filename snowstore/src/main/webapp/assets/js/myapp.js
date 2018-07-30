$(function() {
	
	// solving the active menu problem

	switch (menu) {
	case 'About Us':
		$('#about').addClass('active');
		break;
	case 'Contact Us':
		$('#contact').addClass('active');
		break;
	case 'Home':
		$('#home').addClass('active');
		break;
	case 'Manage Products':
		$('#manageProducts').addClass('active');
		break;
	case 'View All Products':
		$('#listProducts').addClass('active');
		break;
	default:
		$('#listProducts').addClass('active');
		$('#a_' + menu).addClass('active');
		break;
	}
	
	// for handling CSRF token
	var token = $('meta[name="_csrf"]').attr('content');
	var header = $('meta[name="_csrf_header"]').attr('content');
	

	if(token.length > 0 && header.length > 0) {		
		// set the token header for the ajax request
		$(document).ajaxSend(function(e, xhr, options) {	
			xhr.setRequestHeader(header, token);

		});				
	}

	// code for jQuery dataTable

	var $table = $('#productListTable');

	// execute the below code, only where we have this table

	if ($table.length) {
		// console.log('Inside the table!');

		var jsonUrl = '';
		if (window.categoryId == '') {
			jsonUrl = window.contextRoot + '/json/data/all/products';
		} else {
			jsonUrl = window.contextRoot + '/json/data/category/'
					+ window.categoryId + '/products';
		}

		$table
				.DataTable({
					lengthMenu : [ [ 5, 10, 20, -1 ],
							[ '5 Records', '10 Records', '20 Records', 'ALL' ] ],
					pageLength : 5,
					ajax : {
						url : jsonUrl,
						dataSrc : ''
					},
					columns : [

							{
								data : 'code',
								mRender : function(data, type, row) {

									return '<img src="' + window.contextRoot
											+ '/resources/images/' + data
											+ '.jpg" class="dataTableImg" />';
								}
							},

							{
								data : 'name'
							},

							{
								data : 'brand'
							},

							{
								data : 'unitPrice',
								mRender : function(data, type, row) {
									return data + ' &#8364;';
								}
							},

							{
								data : 'quantity',
								mRender : function(data, type, row) {
									if (data < 1) {
										return '<span style="color:red">Out of stock!</span>';
									}

									return data;
								}

							},

							{
								data : 'id',
								bSortable : false,
								mRender : function(data, type, row) {

									var str = '';
									str += '<a href="'
											+ window.contextRoot
											+ '/show/'
											+ data
											+ '/product" class="btn btn-primary"><i class="fa fa-eye" aria-hidden="true"></i></a> &#160;';

									if (row.quantity < 1) {
										str += '<a href="javascript:void(0)" class="btn btn-success disabled"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>';
									} else {
										
										if (userRole == 'ADMIN') {
											
											str += '<a href="'
												+ window.contextRoot
												+ '/manage/'
												+ data
												+ '/product" class="btn btn-warning"><i class="fa fa-pencil" aria-hidden="true"></i></a>';
											
										} else {
											str += '<a href="'
												+ window.contextRoot
												+ '/cart/add/'
												+ data
												+ '/product" class="btn btn-success"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>';
										}
										

									}

									return str;
								}

							}

					]

				});
	}

	// dismissing the alert after 3 seconds

	var $alert = $('.alert');

	if ($alert.length) {

		setTimeout(function() {
			$alert.fadeOut('slow');
		}, 3000)

	}

	// -------------------------------------------------------

	// dataTable for Admin

	var $adminProductsTable = $('#adminProductsTable');

	// execute the below code, only where we have this table

	if ($adminProductsTable.length) {
		// console.log('Inside the table!');

		var jsonUrl = window.contextRoot + '/json/data/admin/all/products';

		$adminProductsTable
				.DataTable({
					lengthMenu : [ [ 10, 20, 50, -1 ],
							[ '10 Records', '20 Records', '50 Records', 'ALL' ] ],
					pageLength : 20,
					ajax : {
						url : jsonUrl,
						dataSrc : ''
					},
					columns : [
							{
								data : 'id'
							},

							{
								data : 'code',
								mRender : function(data, type, row) {

									return '<img src="'
											+ window.contextRoot
											+ '/resources/images/'
											+ data
											+ '.jpg" class="adminDataTableImg" />';
								}
							},

							{
								data : 'name'
							},

							{
								data : 'brand'
							},

							{
								data : 'quantity',
								mRender : function(data, type, row) {
									if (data < 1) {
										return '<span style="color:red">Out of stock!</span>';
									}

									return data;
								}

							},

							{
								data : 'unitPrice',
								mRender : function(data, type, row) {
									return data + ' &#8364;';
								}
							},

							{
								data : 'active',
								bSortable : false,
								mRender : function(data, type, row) {
									var str = '';

									if (data) {
										str += '<label class="switch"><input type="checkbox" value="'+row.id+'" checked="checked"><div class="slider"></div></label>';
									} else {
										str += '<label class="switch"><input type="checkbox" value="'+row.id+'"><div class="slider"></div></label>';
									}

									return str;
								}

							},

							{
								data : 'id',
								bSortable : false,
								mRender : function(data, type, row) {
									var str = '';

									str += '<a href="' + window.contextRoot + '/manage/'+ data + '/product" class="btn btn-warning">';
									str += '<i class="fa fa-pencil" aria-hidden="true"></i></a>';
									
									return str;
								}
							}

					],

					initComplete: function () {
						var api = this.api();
						api.$('.switch input[type="checkbox"]').on('change' , function() {							
							var dText = (this.checked)? 'You want to activate the Product?': 'You want to de-activate the Product?';
							var checked = this.checked;
							var checkbox = $(this);
							debugger;
						    bootbox.confirm({
						    	size: 'medium',
						    	title: 'Product Activation/Deactivation',
						    	message: dText,
						    	callback: function (confirmed) {
							        if (confirmed) {
							            $.ajax({							            	
							            	type: 'POST',
							            	url: window.contextRoot + '/manage/product/'+checkbox.prop('value')+'/activation',
							        		timeout : 100000,        	    
							        		success : function(data) {
							        			bootbox.alert(data);							        										        			
							        		},
							        		error : function(e) {
							        			bootbox.alert('ERROR: '+ e);
							        			//display(e);
							        		}						            	
							            });
							        }
							        else {							        	
							        	checkbox.prop('checked', !checked);
							        }
						    	}
						    });																											
						});
							
					}

		 });
	}

	// ------------------------------------------------------------------
	// Validation code for category form

	var $categoryForm = $('#categoryForm');

	if ($categoryForm.length) {

		$categoryForm
				.validate({

					rules : {

						name : {

							required : true,
							minlength : 2

						},

						description : {
							required : true,
						}

					},

					messages : {

						name : {

							required : 'Please add the category name!',
							minlength : 'The category name should not be less than 2 characters!'
						},

						description : {

							required : 'Please add a category description!'
						}

					},

					errorElement : 'em',
					errorPlacement : function(error, element) {

						// add the class of help-block
						error.addClass("help-block");

						// add the error element after the input element
						error.insertAfter(element);
					}

				});

	}

	// -----------------------------------------------------------

	// Validation code for login form

	var $loginForm = $('#loginForm');

	if ($loginForm.length) {

		$loginForm.validate({

					rules : {

						username : {

							required : true,
							email: true

						},

						password : {
							required : true,
						}

					},

					messages : {

						username : {

							required : 'Please enter the username!',
							email : 'Please enter valid email address!'
						},

						password : {

							required : 'Please enter the password!'
						}

					},

					errorElement : 'em',
					errorPlacement : function(error, element) {

						// add the class of help-block
						error.addClass("help-block");

						// add the error element after the input element
						error.insertAfter(element);
					}

				});

	}

	// -----------------------------------------------------------

});