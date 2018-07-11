<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container py-5">

	<div class="row">


		<c:if test="${(message eq 'Product Submited Successfully!') && (message eq 'Category Submited Successfully!')}">
			<div class="col-lg-12">

				<div class="alert alert-success alert-dismissible">

					<button type="button" class="close" data-dismiss="alert">&times;</button>

					${message}

				</div>

			</div>
		</c:if>
		
		<c:if test="${message=='Validation Failed For Product Submission!'}">
		
		    <div class="col-lg-12">
		    
		    	<div class="alert alert-warning alert-dismissible">

					<button type="button" class="close" data-dismiss="alert">&times;</button>

					${message}

				</div>
		    
		    
		    </div>
		
		</c:if>

		<div class="col-md-8 offset-md-2">

			<div class="card card-outline-secondary">
				<div class="card-header">
					<h3 class="mb-0">Product Management</h3>
				</div>

				<div class="card-body">

					<!-- Form Elements -->

					<sf:form class="form" role="form" autocomplete="off"
						modelAttribute="product" action="${contextRoot}/manage/products"
						method="POST" enctype="multipart/form-data">

						<div class="form-group row">
							<label class="col-lg-3 col-form-label form-control-label">Enter
								Product Name: </label>
							<div class="col-lg-9">
								<sf:input type="text" path="name" id="name"
									placeholder="Product Name" class="form-control" />
								<sf:errors path="name" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group row">

							<label class="col-lg-3 col-form-label form-control-label">Enter
								Brand Name: </label>

							<div class="col-lg-9">

								<sf:input type="text" path="brand" id="brand"
									placeholder="Brand Name" class="form-control" />
								<sf:errors path="brand" cssClass="help-block" element="em" />

							</div>

						</div>

						<div class="form-group row">

							<label class="col-lg-3 col-form-label form-control-label">Product
								Description: </label>

							<div class="col-lg-9">

								<sf:textarea path="description" rows="4"
									placeholder="Write a description" class="form-control"></sf:textarea>
								<sf:errors path="description" cssClass="help-block" element="em" />

							</div>

						</div>

						<div class="form-group row">

							<label class="col-lg-3 col-form-label form-control-label">Price:
							</label>

							<div class="col-lg-9">

								<sf:input type="number" path="unitPrice" id="unitPrice"
									class="form-control" placeholder="Enter Price" />
								<sf:errors path="unitPrice" cssClass="help-block" element="em" />

							</div>

						</div>

						<div class="form-group row">

							<label class="col-lg-3 col-form-label form-control-label">Quantity:
							</label>

							<div class="col-lg-9">

								<sf:input type="number" path="quantity" id="quantity"
									class="form-control" placeholder="Enter No. of Items Available" />

							</div>

						</div>

						<!-- File Element For Image Upload -->
						<div class="form-group row">

							<label class="col-lg-3 col-form-label form-control-label"
								for="file">Select Image: </label>

							<div class="col-lg-9">

								<sf:input type="file" path="file" id="file" class="form-control" />
								<sf:errors path="file" cssClass="help-block" element="em" />

							</div>

						</div>

						<div class="form-group row">

							<label class="col-lg-3 col-form-label form-control-label">Select
								Category: </label>

							<div class="col-lg-9">

								<sf:select class="form-control" id="categoryId"
									path="categoryId" items="${categories}" itemLabel="name"
									itemValue="id" />
									
								<c:if test="${product.id == 0}">
								
								<div class="text-right">
								
								    <br/>
								    <button type="button" data-toggle="modal" data-target="#myCategoryModal" class="btn btn-warning">Add Category</button>
								    
								</div>
								</c:if>

							</div>

						</div>

						<div class="form-group row">

							<label class="col-lg-3 col-form-label form-control-label"></label>

							<div class="col-lg-9">

								<input type="submit" name="submit" value="Submit"
									class="btn btn-primary" />
							</div>
						</div>

						<!-- Hidden fields for product -->
						<sf:hidden path="id" />
						<sf:hidden path="code" />
						<sf:hidden path="active" />
						<sf:hidden path="supplierId" />
						<sf:hidden path="purchases" />
						<sf:hidden path="views" />


					</sf:form>

				</div>

			</div>


		</div>


	</div>

   <!-- Modal -->
   <div class="modal fade" id="myCategoryModal" role="dialog" tabindex="-1"  aria-labeldby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
      
          <div class="modal-content">
              <!-- Modal Header -->
              <div class="modal-header text-center">
                  <button type="button" class="close" data-dismiss="modal" aria-label="close">
                     <span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="myModalLabel">Add New Category</h4>
              </div>
              
               <!-- Category Form -->
              <sf:form id="categoryForm" modelAttribute="category" action="${contextRoot}/manage/category" method="POST"
                      class="form">
              <div class="modal-body mx-3">
                      
                      <div class="md-form mb-5">
                           <label for="category_name">Category Name</label>
                           <div class="col-lg-12">
                              <sf:input type="text" path="name" id="category_name" class="form-control" />            
                           </div> 
                      </div>
                      
                      <div class="md-form mb-5">
                           <label for="category_description">Category Description</label>
                           <div class="col-lg-12">
                              <sf:textarea cols="" rows="5" path="description" id="category_description" class="form-control" />            
                           </div> 
                      </div>       
              </div>
              
              <!-- Modal Footer -->
			  <div class="modal-footer d-flex justify-content-center">
					<input type="submit" name="submit" value="Add Category"
						class="btn btn-primary" />
				</div>

			
			</sf:form>
			</div>
      
      </div>
   </div>
   
   	<div class="row">


		<div class="col-lg-12">
			<h3>Available Products</h3>
			<hr />

		</div>

		<div class="col-lg-12">
			<div style="overflow: auto">

				<!-- Products table for Admin -->

				<table id="adminProductsTable"
					class="table table-striped table-bordered">

					<thead>
						<tr>
							<th>Id</th>
							<th>&#160;</th>
							<th>Name</th>
							<th>Brand</th>
							<th>No. of items in stock</th>
							<th>Price</th>
							<th>Active</th>
							<th>Edit</th>
						</tr>
					</thead>

					<tfoot>
						<tr>
							<th>Id</th>
							<th>&#160;</th>
							<th>Name</th>
							<th>Brand</th>
							<th>No. of items in stock</th>
							<th>Price</th>
							<th>Active</th>
							<th>Edit</th>
						</tr>
					</tfoot>



				</table>


			</div>

		</div>


	</div>
   
</div>