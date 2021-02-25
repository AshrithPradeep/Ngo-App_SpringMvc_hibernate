<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>


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
							<h4 class="page-title">List of Users</h4>
						</div>
					</div>
				</div>
				<!-- end row -->



				<div class="row">
					<div class="col-12">
						<div class="card m-b-20">
							<div class="card-body">

								<table id="datatable-buttons"
									class="table table-striped table-bordered dt-responsive nowrap"
									style="border-collapse: collapse; border-spacing: 0; width: 100%;">
									<thead>
										<tr>
											<th>Name</th>
											<th>Role</th>
											<th>Email</th>
											<th>Phone Number</th>
											<th>Gender</th>
											<th>Actions</th>
										</tr>
									</thead>


									<tbody>
										<c:forEach items="${users}" var="tempUser">

											<c:url var="updateLink" value="/users/showFormForUpdate">
												<c:param name="usersId" value="${tempUser.id}" />
											</c:url>

											<c:url var="deleteLink" value="/users/delete">
												<c:param name="usersId" value="${tempUser.id}" />
											</c:url>

											<tr>

												<td>${tempUser.firstname} ${tempUser.lastname}</td>
												<td>${tempUser.role}</td>
												<td>${tempUser.email}</td>
												<td>${tempUser.mobile}</td>
												<td>${tempUser.sex}</td>

												<td><a href="${updateLink}"><i
														class="fas fa-user-edit"></i></a> &nbsp; &nbsp; <c:if
														test="${sessionBean.role eq 'Admin'}">

														<a href="${deleteLink}"
															onclick="if(!(confirm('Are you sure you want to delete this record ?'))) return false">
															<i class="fas fa-trash-alt" aria-hidden="true"></i>
														</a>
													</c:if></td>


											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
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


	<%@ include file="footer.jsp"%>
	<c:if test="${sessionBean.role ne 'Admin'}">
		<script>
			document.getElementById("dropdownMenuLink").style.display = "none";
		</script>
	</c:if>
	<c:if test="${sessionBean.role eq 'Admin'}">
		<script>
			document.getElementById("dropdownMenuLink").style.display = "block";
		</script>
	</c:if>
</body>
</html>