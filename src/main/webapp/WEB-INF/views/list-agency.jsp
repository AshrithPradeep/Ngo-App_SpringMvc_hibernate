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
							<h4 class="page-title">List of Agency</h4>
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
											<th>Agency Name</th>
											<th>Contact Email</th>
											<th>Require Field</th>
											<th>Phone Number</th>
											<th>Experience Year</th>
											<c:if test="${sessionBean.role eq 'Data Entry manager'}">
												<th>Actions</th>
											</c:if>
											<c:if test="${sessionBean.role eq 'Application Manager'}">
												<th>Show Request</th>
											</c:if>
											<c:if test="${sessionBean.role eq 'Superintendent'}">
												<th>Approved Applicant</th>
											</c:if>
										</tr>
									</thead>


									<tbody>
										<c:forEach items="${agency}" var="tempAgency">

											<c:url var="updateLink" value="/agency/showFormForUpdate">
												<c:param name="agencyId" value="${tempAgency.id}" />
											</c:url>

											<c:url var="deleteLink" value="/agency/delete">
												<c:param name="agencyId" value="${tempAgency.id}" />
											</c:url>

											<c:url var="requestLink" value="/agency/volunteerreq">
												<c:param name="agencyId" value="${tempAgency.id}" />
											</c:url>

											<tr>

												<td>${tempAgency.name}</td>
												<td>${tempAgency.email}</td>
												<td>${tempAgency.workField}</td>
												<td>${tempAgency.mobile}</td>
												<td>${tempAgency.expYear}</td>
												<td><c:if
														test="${sessionBean.role eq 'Data Entry manager'}">
														<a href="${updateLink}"><i class="fas fa-user-edit"></i></a> &nbsp; &nbsp; <a
															href="${deleteLink}"
															onclick="if(!(confirm('Are you sure you want to delete this record ?'))) return false">
															<i class="fas fa-trash-alt" aria-hidden="true"></i>
														</a>
													</c:if> <c:if test="${sessionBean.role eq 'Application Manager'}">
														<a href="${requestLink}" class="btn btn-primary">Show
															Applicants</a>
													</c:if> <c:if test="${sessionBean.role eq 'Superintendent'}">
														<a href="${requestLink}" class="btn btn-primary">Approved
															Applicants</a>
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

</body>
</html>