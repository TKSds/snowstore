<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<%@include file="../shared/flows-header.jsp"%>

<div class="row">

    <!-- Column To Display The Personal Details -->
    <div class="col-md-8 offset-md-2">
      <div class="card card-outline-secondary">
			<div class="card-header">
				<h3 class="mb-0">Personal Details</h3>
			</div>
			
			<div class="card-body">
			  <!-- code to display the personal details -->
			  <div class="text-center">
			     <h4>${registerModel.user.firstName} ${registerModel.user.lastName}</h4>
			     <h5>Email: ${registerModel.user.email}</h5>  
			     <h5>Contact Number: ${registerModel.user.contactNumber}</h5>
			     <h5>Role: ${registerModel.user.role}</h5>
			  </div>
			</div>
			
			<div class="card-footer">
			  <!-- anchor to move to the edit of personal details -->
			  <a href="${flowExecutionUrl}&_eventId_personal" class="btn btn-primary">Edit</a>
			</div>
      </div>
   </div>
   
   <!-- Column To Display The Address -->
   <div class="col-md-8 offset-md-2">
      <div class="card card-outline-secondary">
			<div class="card-header">
				<h3 class="mb-0">Billing Address</h3>
			</div>
			
			<div class="card-body">
			  <!-- code to display the personal details -->
			   <div class="text-center">
			     <h4>${registerModel.billing.addressLineOne}</h4>
			     <h4>${registerModel.billing.addressLineTwo}</h4>
			     <h4>${registerModel.billing.city} - ${registerModel.billing.postalCode}</h4>
			     <h4>${registerModel.billing.state} - ${registerModel.billing.country}</h4>
			  </div>
			</div>
			
			<div class="card-footer">
			  <!-- anchor to move to the edit of personal details -->
			  <a href="${flowExecutionUrl}&_eventId_billing" class="btn btn-primary">Edit</a>
			</div>
      </div>
   </div>
   
</div>

<!-- Provide The Confirm Button After Displaying The Details -->
<div class="row">
  <div class="col-md-8 offset-md-2">
    <div class="text-center">
       <!-- anchor to move to the success page -->
       
       <a href="${flowExecutionUrl}&_eventId_submit" class="btn btn-primary">Confirm</a>
    </div>
  
  </div>
</div>



<%@include file="../shared/flows-footer.jsp"%>