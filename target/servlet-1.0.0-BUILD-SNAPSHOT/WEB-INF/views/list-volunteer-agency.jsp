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

											<th>Status</th>
										</tr>
									</thead>


									<tbody>
										<c:forEach items="${agency}" var="tempAgency">

											<c:url var="updateLink" value="/agency/apply">
												<c:param name="agencyId" value="${tempAgency.agency.id}" />
												<c:param name="userId" value="${sessionBean.id}" />
											</c:url>

											<c:url var="deleteLink" value="/agency/delete">
												<c:param name="agencyId" value="${tempAgency.agency.id}" />
											</c:url>

											<tr>

												<td>${tempAgency.agency.name}</td>
												<td>${tempAgency.agency.email}</td>
												<td>${tempAgency.agency.workField}</td>
												<td>${tempAgency.agency.mobile}</td>
												<td>${tempAgency.agency.expYear}</td>

												<td><c:choose>
														<c:when
															test="${tempAgency.userId eq sessionBean.id && tempAgency.status==1}">
															<a href="javascript:void()" class="btn btn-secondary">Applied</a>
														</c:when>
														<c:when
															test="${tempAgency.userId eq sessionBean.id && tempAgency.status==2}">
															<a href="javascript:void()" class="btn btn-success">Approved</a>
														</c:when>
														<c:when
															test="${tempAgency.userId eq sessionBean.id && tempAgency.status==3}">
															<a href="javascript:void()" class="btn btn-danger">Declined</a>
														</c:when>
														<c:otherwise>
															<!-- <button type="button" class="btn btn-success">Success</button> -->
															<a href="${updateLink}" class="btn btn-primary">Apply</a>
														</c:otherwise>
													</c:choose></td>


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
	<script>
		document.getElementById("dropdownMenuLink").style.display = "none";
	</script>
</body>
</html>