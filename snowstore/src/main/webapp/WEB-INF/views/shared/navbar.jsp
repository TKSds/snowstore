
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${contextRoot}/home">Snow Store</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2" id="navbarResponsive">
			<ul class="navbar-nav mr-auto">
			<!--  
				<li id="home" class="nav-item"><a class="nav-link py-0" href="${contextRoot}/home">Home
						<span class="sr-only">(current)</span>
				</a></li>
			-->
				<li id="listProducts" class="nav-item"><a class="nav-link py-0" href="${contextRoot}/show/all/products">View All Products</a>
				<li id="manageProducts" class="nav-item"><a class="nav-link py-0" href="${contextRoot}/manage/products">Manage Products</a>
				<li id="about" class="nav-item"><a class="nav-link py-0" href="${contextRoot}/about">About</a></li>
				<li id="contact" class="nav-item"><a class="nav-link py-0" href="${contextRoot}/contact">Contact</a></li>
			</ul>
		</div>
		
		<div class="navbar-collapse collapse w-100 order-3 dual-collapse2" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
			   <li id="register" class="nav-item"><a class="nav-link py-0" href="${contextRoot}/register">Sign Up</a></li>
			   <li id="login" class="nav-item"><a class="nav-link py-0" href="${contextRoot}/login">Login</a></li>
			   
			   <li class="dropdown">
			   
			      <a href="javascript:void(0)" class="btn btn-default dropdown-toggle nav-link py-0" id="dropdownMenu1" data-toggle="dropdown" >
			      
			          ${userModel.fullName} <span class="caret"></span>
			      
			      </a>
			      
			      <ul class="dropdown-menu">
			      
			          <li>
			             <a href="${contextRoot}/cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i>
			             <span class="badge">${userModel.cart.cartLines}</span>
			             - &#8364; ${userModel.cart.grandTotal}
			             </a>
			          </li>
			          <li class="divider" role="separator"></li>
			          <li>
			             <a href="${contextRoot}/logout">Logout</a>
			          </li>
			      
			      </ul>
			   
			   </li>
			   
			</ul>
		</div>
	</div>
</nav>