<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<body>

	<%@ include file="begin-page.jsp"%>

	<%@ include file="leftbar.jsp"%>
	<!-- ============================================================== -->
	<!-- Start right Content here -->
	<!-- ============================================================== -->
	<div class="content-page">
		<!-- Start content -->
		<div class="content">
			<div class="container-fluid">

				<div class="row">
					<div class="col-sm-12">
						<div class="page-title-box">
							<h4 class="page-title">Agency Form</h4>

						</div>
					</div>
				</div>
				<!-- end row -->
				<div class="row">

					<div class="col-12">

						<div class="card m-b-20">

							<div class="card-body">

								<form:form action="saveAgency" modelAttribute="agency"
									id="agencyForm" method="POST" enctype="multipart/form-data">
									<form:hidden path="id" />


									<br>
									<div class="form-group row">
										<label for="example-text-input"
											class="col-sm-2 col-form-label">Agency Name: <span
											style="color: red"> * </span></label>
										<div class="col-sm-10">
											<form:input path="name" class="form-control" type="text"
												value="" id="example-text-input" required="required"
												oninvalid="this.setCustomValidity('Enter Agency Name Here')"
												oninput="this.setCustomValidity('')" />
										</div>
									</div>

									<div class="form-group row">
										<label for="example-text-input"
											class="col-sm-2 col-form-label">Address: </label>
										<div class="col-sm-10">
											<form:textarea path="address" rows="5" class="form-control" />
										</div>
									</div>



									<div class="form-group row">
										<label for="example-email-input"
											class="col-sm-2 col-form-label">Contact Email: <span
											style="color: red"> * </span></label>
										<div class="col-sm-10">
											<form:input path="email" class="form-control" type="email"
												value="" id="example-email-input" required="required"
												oninvalid="this.setCustomValidity('Enter Valid Email Here')"
												oninput="this.setCustomValidity('')" />
										</div>
									</div>

									<div class="form-group row">
										<label for="example-tel-input" class="col-sm-2 col-form-label">Phone
											Number: <span style="color: red"> * </span>
										</label>
										<div class="col-sm-10">
											<form:input path="mobile" class="form-control" type="tel"
												value="" id="example-tel-input" required="required"
												oninvalid="this.setCustomValidity('Enter Valid Number Here')"
												oninput="this.setCustomValidity('')" />
										</div>
									</div>

									<div class="form-group row">
										<label for="example-tel-input" class="col-sm-2 col-form-label">Require
											Field: <span style="color: red"> * </span>
										</label>
										<div class="col-sm-10">
											Healthcare
											<form:radiobutton path="workField" value="Healthcare"
												checked="checked" />
											Eeducation
											<form:radiobutton path="workField" value="Eeducation" />

										</div>
									</div>

									<div class="form-group row">
										<label for="example-text-input"
											class="col-sm-2 col-form-label">Work Description: </label>
										<div class="col-sm-10">
											<form:textarea path="workDesc" rows="3" class="form-control" />
										</div>
									</div>

									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Experience (in
											years): <span style="color: red"> * </span>
										</label>
										<div class="col-sm-10">
											<form:select path="expYear" modelAttribute="user"
												class="form-control">
												<form:option value="1">1</form:option>
												<form:option value="2">2</form:option>
												<form:option value="3">3</form:option>
												<form:option value="4">4</form:option>
												<form:option value="5">5</form:option>
												<form:option value="6">6</form:option>
												<form:option value="7">7</form:option>
												<form:option value="8">8</form:option>
												<form:option value="9">9</form:option>
												<form:option value="10">10</form:option>
												<form:option value="11">11</form:option>
												<form:option value="12">12</form:option>
												<form:option value="13">13</form:option>
												<form:option value="14">14</form:option>
												<form:option value="15">15</form:option>

											</form:select>
										</div>
									</div>


									<center>
										<div>
											<input type="submit" value="Submit" />
										</div>
									</center>
								</form:form>
							</div>
						</div>
						<!-- end col -->
					</div>
					<!-- end row -->

				</div>
				<!-- container-fluid -->

			</div>
			<!-- content -->

			<footer class="footer">
				&#169; 2019 - 2020 Ngo - <span class="d-none d-sm-inline-block">
					Created by <i class="mdi mdi-heart text-danger"></i> Ashrith
					Pradeep
				</span>.
			</footer>
		</div>

		<c:if test="${sessionBean.role ne 'Administrateur'}">
			<script>
				document.getElementById("dropdownMenuLink").style.display = "none";
			</script>
		</c:if>
		<c:if test="${sessionBean.role eq 'Administrateur'}">
			<script>
				document.getElementById("dropdownMenuLink").style.display = "block";
			</script>
		</c:if>

		<!-- ============================================================== -->
		<!-- End Right content here -->
		<!-- ============================================================== -->
	</div>
	<!-- END wrapper -->

	<!-- END wrapper -->
	<%@ include file="footer.jsp"%>

</body>

</html>










