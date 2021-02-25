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
											<th>Profile</th>
											<c:if test="${sessionBean.role ne 'Superintendent'}">
												<th>Actions</th>
											</c:if>
										</tr>
									</thead>


									<tbody>
										<c:forEach items="${users}" var="tempUser">

											<c:url var="approveLink" value="/agency/applicationUpdate">
												<c:param name="agencyId" value="${tempUser.agencyId}" />
												<c:param name="userId" value="${tempUser.userId}" />
												<c:param name="status" value="2" />
											</c:url>

											<c:url var="declineLink" value="/agency/applicationUpdate">
												<c:param name="agencyId" value="${tempUser.agencyId}" />
												<c:param name="userId" value="${tempUser.userId}" />
												<c:param name="status" value="3" />
											</c:url>

											<c:url var="infoLink"
												value="/users/showFormForVolunteerUpdate">
												<c:param name="usersId" value="${tempUser.userId}" />
											</c:url>

											<tr>

												<td>${tempUser.user.firstname}
													${tempUser.user.lastname}</td>
												<td>${tempUser.user.role}</td>
												<td>${tempUser.user.email}</td>
												<td>${tempUser.user.mobile}</td>
												<td>${tempUser.user.sex}</td>

												<td><a href="${infoLink}" class="btn btn-info">Info</a></td>
												<c:if test="${sessionBean.role ne 'Superintendent'}">
													<td><c:choose>
															<c:when test="${tempUser.status==2}">
																<a href="javascript:void()" class="btn btn-success">Approved</a>
															</c:when>
															<c:when test="${tempUser.status==3}">
																<a href="javascript:void()" class="btn btn-danger">Declined</a>
															</c:when>
															<c:otherwise>
																<a href="${approveLink}" class="btn btn-success">Approve</a>


																<a href="${declineLink}" class="btn btn-danger"
																	onclick="if(!(confirm('Are you sure you want to decline this request ?'))) return false">
																	Decline </a>
															</c:otherwise>
														</c:choose></td>
												</c:if>


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