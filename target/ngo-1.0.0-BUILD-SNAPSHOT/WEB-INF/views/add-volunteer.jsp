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
							<h4 class="page-title">Volunteer Profile (creation)</h4>

						</div>
					</div>
				</div>
				<!-- end row -->
				<div class="row">

					<div class="col-12">

						<div class="card m-b-20">

							<div class="card-body">

								<form:form action="saveUser" modelAttribute="user"
									id="adherentForm" method="POST" enctype="multipart/form-data">
									<form:hidden path="id" />


									<p>
										<i> NB : Les champs obligatoires apparaissent en rouge</i>
									</p>
									<br>





									<div class="form-group row">
										<label for="example-text-input"
											class="col-sm-2 col-form-label">First Name: <span
											style="color: red"> * </span></label>
										<div class="col-sm-10">
											<form:input path="firstname" class="form-control" type="text"
												value="" id="example-text-input" />
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
												<option>Male</option>
												<option>Female</option>
											</form:select>
										</div>
									</div>

									<c:if test="${sessionBean.role eq 'Administrateur'}">
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Role: <span
												style="color: red"> * </span></label>
											<div class="col-sm-10">
												<form:select path="role" modelAttribute="user"
													class="form-control">
													<c:if test="${sessionBean.role eq 'Administrateur'}">
														<option value="Administrateur">Administrateur</option>
													</c:if>
													<option value="Responsable Executif">Responsable
														Executif</option>
													<option value="Responsable RH">Responsable RH</option>
													<option value="Responsable argents">Responsable
														argents</option>
													<option value="Simple membre">Simple membre</option>
												</form:select>
											</div>
										</div>
									</c:if>


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
										<label for="example-tel-input" class="col-sm-2 col-form-label">Telephone:
											<span style="color: red"> * </span>
										</label>
										<div class="col-sm-10">
											<form:input path="mobile" class="form-control" type="tel"
												value="" id="example-tel-input" required="required" />
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
										<label for="example-text-input"
											class="col-sm-2 col-form-label">User Name: <span
											style="color: red"> * </span></label>
										<div class="col-sm-10">
											<form:input path="username" class="form-control" type="text"
												value="" id="example-text-input" required="required" />
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


									<div class="form-group row">
										<label for="example-password-input"
											class="col-sm-2 col-form-label">Confirm Password: <span
											style="color: red"> * </span>
										</label>
										<div class="col-sm-10">
											<form:input path="confirmMdp" class="form-control"
												type="password" value="" id="example-password-input"
												required="required" />
										</div>
									</div>


									<center>
										<div>
											<input type="submit" value="Register" /> <input
												type="submit" value="Retour a la Liste"
												onclick="window.location.href='list'; return false;" />
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
				&#169; 2019 - 2020 Ngo - <span
					class="d-none d-sm-inline-block"> Created by <i
					class="mdi mdi-heart text-danger"></i> Ashrith Pradeep
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

</body>

</html>










