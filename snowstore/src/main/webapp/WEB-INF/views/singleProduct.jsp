<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<div class="container">

	<!-- Breadcrumb -->
	<div class="row">

		<div class="col-xs-12 col-lg-6">


			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">

					<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
					<li class="breadcrumb-item"><a
						href="${contextRoot}/show/all/products">Products</a></li>
					<li class="breadcrumb-item active" aria-current="page">${product.name}</li>

				</ol>
			</nav>

		</div>

	</div>

	<div class="row">

		<!-- Display the product image -->
		<div class="col-xs-12 col-lg-4">

			<div class="thumbnail">

				<img src="${images}/${product.code}.jpg" class="img-fluid" />

			</div>

		</div>


		<!-- Display the product description -->
		<div class="col-xs-12 col-lg-6">

			<h3>${product.name}</h3>
			<hr />

			<p>${product.description}</p>
			<hr />

			<h4>
				Price: <strong>${product.unitPrice} &#8364;</strong>
			</h4>
			<hr />

			<c:choose>

				<c:when test="${product.quantity < 1}">

					<h6>
						No. of items in stock: <span style="color:red">Out of stock!</span>
					</h6>

				</c:when>
				<c:otherwise>

					<h6>No. of items in stock: ${product.quantity}</h6>

				</c:otherwise>

			</c:choose>
            
            <security:authorize access="hasAuthority('USER')">
			<c:choose>

			<c:when test="${product.quantity < 1}">

					<a href="javascript:void(0)" class="btn btn-success disabled"><strike>
					<i class="fa fa-shopping-cart" aria-hidden="true"></i> Add to Cart</strike></a>

			</c:when>
			<c:otherwise> 

					<a href="${contextRoot}/cart/add/${product.id}/product"
						class="btn btn-success"> <i class="fa fa-shopping-cart"
						aria-hidden="true"></i> Add to Cart
					</a>

			</c:otherwise>

			</c:choose>
			</security:authorize>
			
			<security:authorize access="hasAuthority('ADMIN')">
				<a href="${contextRoot}/manage/${product.id}/product"
					class="btn btn-warning"><i class="fa fa-pencil" aria-hidden="true"></i> Edit
				</a>
			</security:authorize>

			<a href="${contextRoot}/show/all/products" class="btn btn-primary">
				<i class="fa fa-arrow-circle-left" aria-hidden="true"></i> Back
			</a>

		</div>

	</div>


</div>