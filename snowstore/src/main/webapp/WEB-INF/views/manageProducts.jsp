<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container py-5">

	<div class="row">
	
	
	<c:if test="${not empty message}">
			<div class="col-lg-12">
			
			 <div class="alert alert-success alert-dismissible" >
			 
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

				<sf:form class="form" role="form" autocomplete="off" modelAttribute="product"
				     action="${contextRoot}/manage/products"
				     method="POST"
				>

					<div class="form-group row">

						<label class="col-lg-3 col-form-label form-control-label">Enter Product Name: </label>

						<div class="col-lg-9">

							<sf:input type="text" path="name" id="name" placeholder="Product Name" class="form-control" /> 

						</div>

					</div>

					<div class="form-group row">

						<label class="col-lg-3 col-form-label form-control-label">Enter Brand Name: </label>

						<div class="col-lg-9">

							<sf:input type="text" path="brand" id="brand" placeholder="Brand Name" class="form-control" /> 

						</div>

					</div>

					<div class="form-group row">

						<label class="col-lg-3 col-form-label form-control-label">Product Description: </label>

						<div class="col-lg-9">

							<sf:textarea path="description" rows="4" placeholder="Write a description" class="form-control"></sf:textarea>

						</div>

					</div>

					<div class="form-group row">

						<label class="col-lg-3 col-form-label form-control-label">Price: </label>

						<div class="col-lg-9">
						
						    <sf:input type="number" path="unitPrice" id="unitPrice" class="form-control" placeholder="Enter Price" />

						</div>

					</div>
					
					<div class="form-group row">

						<label class="col-lg-3 col-form-label form-control-label">Quantity: </label>

						<div class="col-lg-9">
						
						    <sf:input type="number" path="quantity" id="quantity" class="form-control" placeholder="Enter No. of Items Available" />

						</div>

					</div>
					
					<div class="form-group row">

						<label class="col-lg-3 col-form-label form-control-label">Select Category: </label>

						<div class="col-lg-9">
						
						  <sf:select class="form-control" id="categoryId" path="categoryId" 
						     items="${categories}"
						     itemLabel="name"
						     itemValue="id"
						  
						  />

						</div>

					</div>

					<div class="form-group row">

						<label class="col-lg-3 col-form-label form-control-label"></label>
						
						    <div class="col-lg-9">

                              <input type="submit" name="submit" value="Submit" class="btn btn-primary"/> 

						   </div>

					</div>
					
					<!-- Hidden fields for product -->
					<sf:hidden path="id"/>
					<sf:hidden path="code"/>
					<sf:hidden path="active"/>
					<sf:hidden path="supplierId"/>
					<sf:hidden path="purchases"/>
					<sf:hidden path="views"/>
					

				</sf:form>

			</div>

		</div>


	</div>


</div>




</div>