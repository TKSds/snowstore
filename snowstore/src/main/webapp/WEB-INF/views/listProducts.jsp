<div class="container">

	<div class="row">

		<!-- To Display side bar -->
		<div class="col-lg-3">

			<%@include file="./shared/sidebar.jsp"%>

		</div>

		<!-- To Display the actual products -->
		<div class="col-lg-9">

			<!-- Added breadcrumb component -->
			<div class="row">

				<div class="col-lg-12">

					<c:if test="${userClickAllProducts==true}">

						<script>
							window.categoryId = '';
						</script>

						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">

								<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">All
									Products</li>

							</ol>
						</nav>
					</c:if>

					<c:if test="${userClickCategoryProducts==true}">
						<script>
							window.categoryId = '${category.id}';
						</script>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">

								<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">Category</li>
								<li class="breadcrumb-item active" aria-current="page">${category.name}</li>

							</ol>
						</nav>
					</c:if>

				</div>

			</div>

			<div class="row">

				   <div class="container-fluid">
				     <div class="table-responsive">
				        <table id="productListTable" class="table table-striped table-bordered" style="width: 100%">

						<thead>
							<tr>
							    <th></th>
								<th>Name</th>
								<th>Brand</th>
								<th>Price</th>
								<th>No. of items in stock</th>
								<th></th>
							</tr>
						</thead>

						<tfoot>
							<tr>
							    <th></th>
								<th>Name</th>
								<th>Brand</th>
								<th>Price</th>
								<th>No. of items in stock</th>
								<th></th>
							</tr>
						</tfoot>

					</table>
				  </div>
			   </div>
					
			

		</div>

	  </div>

	</div>

</div>