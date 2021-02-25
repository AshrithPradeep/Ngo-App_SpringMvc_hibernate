<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<body>
	<!-- ============================================================== -->
	<!-- Start right Content here -->
	<!-- ============================================================== -->
	<fieldset
		<c:if test="${sessionBean.role eq 'Application Manager' || sessionBean.role eq 'Superintendent'}">
				 disabled="disabled"
				</c:if>>
		<div class="content-page-volunteer">
			<!-- Start content -->
			<div class="content">
				<div class="container-fluid">

					<div class="row">
						<div class="col-sm-12">
							<div class="page-title-box">
								<c:if
									test="${sessionBean.role ne 'Application Manager' || sessionBean.role ne 'Superintendent'}">
									<h4 class="page-title">Volunteer Form</h4>
								</c:if>
							</div>
						</div>
					</div>
					
					<!-- end row -->
					<div class="row">

						<div class="col-12">

							<div class="card m-b-20">

								<div class="card-body">

									<form:form action="saveUser" modelAttribute="user"
										id="volunteerForm" method="POST" enctype="multipart/form-data">
										<form:hidden path="id" />


										<br>
										<p><strong><font color="red"> ${validationMessage} </font></strong></p>
										<div class="form-group row">
											<label for="example-text-input"
												class="col-sm-2 col-form-label">First Name: <span
												style="color: red"> * </span></label>
											<div class="col-sm-10">
												<form:input path="firstname" class="form-control"
													type="text" value="" id="example-text-input"
													required="required" />
											</div>
										</div>


										<div class="form-group row">
											<label for="example-text-input"
												class="col-sm-2 col-form-label">Last Name: <span
												style="color: red"> * </span></label>
											<div class="col-sm-10">
												<form:input path="lastname" class="form-control" type="text"
													value="" id="example-text-input" required="required" />
											</div>
										</div>

										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Gender: <span
												style="color: red"> * </span></label>
											<div class="col-sm-10">
												<form:select path="sex" class="form-control">
													<form:option value="Male">Male</form:option>
													<form:option value="Female">Female</form:option>
												</form:select>
											</div>
										</div>



										<div class="form-group row">
											<label for="example-email-input"
												class="col-sm-2 col-form-label">Email: <span
												style="color: red"> * </span></label>
											<div class="col-sm-10">
												<form:input path="email" class="form-control" type="email"
													value="" id="example-email-input" required="required" />
											</div>
										</div>

										<div class="form-group row">
											<label for="example-tel-input"
												class="col-sm-2 col-form-label">Contact Number: <span
												style="color: red"> * </span>
											</label>
											<div class="col-sm-10">
												<form:input path="mobile" class="form-control" type="tel"
													value="" id="example-tel-input" required="required" />
											</div>
										</div>

										<div class="form-group row">
											<label for="example-tel-input"
												class="col-sm-2 col-form-label">Work Field: <span
												style="color: red"> * </span>
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
												class="col-sm-2 col-form-label">Profession: <span
												style="color: red"> * </span></label>
											<div class="col-sm-10">
												<form:input path="profession" class="form-control"
													type="text" value="" id="example-text-input"
													required="required" />
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

										<c:if test="${fromVolunteer eq 'yes' }">
											<form:hidden path="role" />
										</c:if>

										<c:if
											test="${sessionBean.role ne 'Application Manager' && sessionBean.role ne 'Superintendent'}">
											<div class="form-group row">
												<label for="example-text-input"
													class="col-sm-2 col-form-label">User Name: <span
													style="color: red"> * </span></label>
												<div class="col-sm-10">
													<form:input path="username" class="form-control"
														type="text" value="" id="example-text-input"
														required="required" />
												</div>
											</div>


											<div class="form-group row">
												<label for="example-password-input"
													class="col-sm-2 col-form-label">Password <span
													style="color: red"> * </span></label>
												<div class="col-sm-10">
													<form:input path="pwd" class="form-control" type="password"
														value="" id="example-password-input" required="required" />
												</div>
											</div>
										</c:if>
										<c:if
											test="${sessionBean.role ne 'Application Manager' && sessionBean.role ne 'Superintendent'}">
											<center>
												<div>
													<input type="submit" value="Register" />
												</div>
											</center>
										</c:if>
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
					&#169; 2019 - 2020 Ngo - <span
						class="d-none d-sm-inline-block"> Created by <i
						class="mdi mdi-heart text-danger"></i> Ashrith Pradeep
					</span>.
				</footer>
			</div>



			<!-- ============================================================== -->
			<!-- End Right content here -->
			<!-- ============================================================== -->
		</div>
		<!-- END wrapper -->
	</fieldset>
	<!-- END wrapper -->
	<%@ include file="footer.jsp"%>


</body>

</html>










