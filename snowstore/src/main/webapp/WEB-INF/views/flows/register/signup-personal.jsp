<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<%@include file="../shared/flows-header.jsp"%>

<div class="container">

	<div class="row">
		<div class="col-md-8 offset-md-2">

			<div class="card card-outline-secondary">
				<div class="card-header">
					<h3 class="mb-0">User Registration</h3>
				</div>


				<div class="card-body">

					<sf:form class="form" role="form" modelAttribute="user"
						method="POST" id="registerForm">

						<div class="form-group row">
							<label class="col-lg-3 col-form-label form-control-label">First
								Name: </label>
							<div class="col-lg-9">
								<sf:input type="text" path="firstName" id="firstName"
									placeholder="Please enter your first name" class="form-control" />
								<sf:errors path="firstName" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group row">
							<label class="col-lg-3 col-form-label form-control-label">Last
								Name: </label>
							<div class="col-lg-9">
								<sf:input type="text" path="lastName" id="lastName"
									placeholder="Please enter your last name" class="form-control" />
								<sf:errors path="lastName" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group row">
							<label class="col-lg-3 col-form-label form-control-label">Email:
							</label>
							<div class="col-lg-9">
								<sf:input type="text" path="email" id="email"
									placeholder="Please enter your email address"
									class="form-control" />
								<sf:errors path="email" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group row">
							<label class="col-lg-3 col-form-label form-control-label">Contact
								Number: </label>
							<div class="col-lg-9">
								<sf:input type="text" path="contactNumber" id="firstName"
									placeholder="XXXXXXXXXX" class="form-control" max-length="10" />
								<sf:errors path="contactNumber" cssClass="help-block"
									element="em" />
							</div>
						</div>

						<div class="form-group row">
							<label class="col-lg-3 col-form-label form-control-label">Password:
							</label>
							<div class="col-lg-9">
								<sf:input type="password" path="password" id="password"
									placeholder="Please enter a password" class="form-control" />
								<sf:errors path="password" cssClass="help-block" element="em" />
							</div>
						</div>

						<!-- Radio Button Using bootstrap class of radio-inline -->
						<div class="form-group row">
							<label class="col-lg-3 col-form-label form-control-label">Select
								Role: </label>
							<div class="col-lg-9">
								<label class="radio-inline"> <sf:radiobutton path="role"
										value="USER" checked="checked" /> User
								</label> <label class="radio-inline"> <sf:radiobutton
										path="role" value="SUPPLIER" /> Supplier
								</label>
							</div>
						</div>

						<!-- Submit Button -->
						<div class="form-group row text-center">
							<div class="col-lg-9">
								<button type="submit" class="btn btn-primary"
									name="_eventId_billing">

									Next - Billing <i class="fa fa-arrow-right" aria-hidden="true"></i>

								</button>
							</div>
						</div>



					</sf:form>

				</div>
			</div>
		</div>
	</div>

	<%@include file="../shared/flows-footer.jsp"%>