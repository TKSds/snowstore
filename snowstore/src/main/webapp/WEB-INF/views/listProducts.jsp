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
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">

								<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">All
									Products</li>

							</ol>
						</nav>
					</c:if>

					<c:if test="${userClickCategoryProducts==true}">
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

				<div class="col-xs-12">

					<table id="productListTable" class="table table-striped table-bordered" style="width:100%">

						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
							</tr>
						</thead>

					</table>

				</div>

			</div>

		</div>

	</div>

</div>