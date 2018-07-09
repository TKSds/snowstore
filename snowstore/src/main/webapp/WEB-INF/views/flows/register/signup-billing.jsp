<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<%@include file="../shared/flows-header.jsp"%>

<div class="container">

	<div class="row">
		<div class="col-md-8 offset-md-2">

			<div class="card card-outline-secondary">
				<div class="card-header">
					<h3 class="mb-0">Add A Billing Address</h3>
				</div>


				<div class="card-body">

					<sf:form class="form" role="form" modelAttribute="billing"
						method="POST" id="registerForm">

						<div class="form-group row">
							<label class="col-lg-3 col-form-label form-control-label"
								for="addressLineOne">Address Line One: </label>
							<div class="col-lg-9">
								<sf:input type="text" path="addressLineOne"
									placeholder="Please enter the first address"
									class="form-control" />
								<sf:errors path="addressLineOne" cssClass="help-block"
									element="em" />
							</div>
						</div>

						<div class="form-group row">
							<label class="col-lg-3 col-form-label form-control-label"
								for="addressLineTwo">Address Line Two: </label>
							<div class="col-lg-9">
								<sf:input type="text" path="addressLineTwo"
									placeholder="Please enter the second address"
									class="form-control" />
								<sf:errors path="addressLineTwo" cssClass="help-block"
									element="em" />
							</div>
						</div>

						<div class="form-group row">
							<label class="col-lg-3 col-form-label form-control-label"
								for="city">City: </label>
							<div class="col-lg-9">
								<sf:input type="text" path="city"
									placeholder="Please enter your city" class="form-control" />
								<sf:errors path="city" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group row">
							<label class="col-lg-3 col-form-label form-control-label"
								for="postalCode">Postal Code: </label>
							<div class="col-lg-9">
								<sf:input type="text" path="postalCode" placeholder="XXXXXX"
									class="form-control" />
								<sf:errors path="postalCode" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group row">
							<label class="col-lg-3 col-form-label form-control-label"
								for="state">State: </label>
							<div class="col-lg-9">
								<sf:input type="text" path="state"
									placeholder="Please enter your state" class="form-control" />
								<sf:errors path="state" cssClass="help-block"
									element="em" />
							</div>
						</div>

						<div class="form-group row">
							<label class="col-lg-3 col-form-label form-control-label"
								for="country">Country: </label>
							<div class="col-lg-9">
								<sf:input type="text" path="country"
									placeholder="Please enter your country" class="form-control" />
								<sf:errors path="country" cssClass="help-block" element="em" />
							</div>
						</div>

						<!-- Back and Submit Buttons -->
						<div class="form-group row text-center">
							<div class="col-lg-9">
								<button type="submit" class="btn btn-primary"
									name="_eventId_personal">

									<i class="fa fa-arrow-left" aria-hidden="true"></i> Back - User Registration

								</button>
								<button type="submit" class="btn btn-primary"
									name="_eventId_confirm">

									Next - Confirm <i class="fa fa-arrow-right" aria-hidden="true"></i>

								</button>
							</div>

						</div>



					</sf:form>

				</div>
			</div>
		</div>

	</div>

	<%@include file="../shared/flows-footer.jsp"%>