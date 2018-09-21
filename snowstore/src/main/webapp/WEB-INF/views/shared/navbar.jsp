<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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
				<security:authorize access="hasAuthority('ADMIN')">
				<li id="manageProducts" class="nav-item"><a class="nav-link py-0" href="${contextRoot}/manage/products">Manage Products</a>
				</security:authorize>
				<li id="about" class="nav-item"><a class="nav-link py-0" href="${contextRoot}/about">About</a></li>
				<li id="contact" class="nav-item"><a class="nav-link py-0" href="${contextRoot}/contact">Contact</a></li>
			</ul>
		</div>
		
		<div class="navbar-collapse collapse w-100 order-3 dual-collapse2" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
			
			   <security:authorize access="isAnonymous()">
			   <li id="register" class="nav-item"><a class="nav-link py-0" href="${contextRoot}/register">Sign Up</a></li>
			   <li id="login" class="nav-item"><a class="nav-link py-0" href="${contextRoot}/login">Login</a></li>
			   </security:authorize>
			   
			   <security:authorize access="isAuthenticated()">
			   <li class="dropdown">
			   
			      <a href="javascript:void(0)" class="btn btn-default dropdown-toggle nav-link py-0" id="dropdownMenu1" data-toggle="dropdown" >
			      
			          ${userModel.fullName} <span class="caret"></span>
			      
			      </a>
			      
			      <ul class="dropdown-menu">
			      
			          <security:authorize access="hasAuthority('USER')">
			          <li>
			             <a href="${contextRoot}/cart/show">
			             <i class="fa fa-shopping-cart" aria-hidden="true"></i>
			             <span class="badge">${userModel.cart.cartLines}</span>
			             - &#8364; ${userModel.cart.grandTotal}
			             </a>
			          </li>
			          <li class="divider" role="separator"></li>
			          <hr/>
			          </security:authorize>
			          <li>
			             <a href="${contextRoot}/perform-logout">Logout</a>
			          </li>
			      
			      </ul>
			   
			   </li>
			   </security:authorize>
			   
			</ul>
		</div>
	</div>
</nav>
<script>

   window.userRole = '${userModel.role}';

</script>