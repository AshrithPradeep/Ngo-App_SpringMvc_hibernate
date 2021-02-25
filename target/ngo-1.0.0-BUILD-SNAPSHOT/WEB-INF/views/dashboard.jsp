<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*" %>
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
							<h4 class="page-title">Dashboard</h4>
                          <ol class="breadcrumb">
                                        <li class="breadcrumb-item active">
                                           Welcome <i style = "color: red;" > ${sessionBean.firstName} !</i> <b> Current Time is :  <%= (new java.util.Date()).toLocaleString()%>  </b>  
                                        </li>
                                    </ol>
						</div>
					</div>
				</div>
				
				<h4 class="mt-0 header-title">Statistiques</h4> <br>
				
				<div class="row">
				
				<c:if test="${sessionBean.role eq 'Administrateur' 
				|| sessionBean.role eq 'Responsable Executif' || sessionBean.role eq 'Responsable RH'}">
                                <div class="col-xl-3 col-md-6">
                                    <div class="card mini-stat bg-primary">
                                        <div class="card-body mini-stat-img">
                                            <div class="mini-stat-icon">
                                                <i class="mdi mdi-account-box float-right"></i>
                                            </div>
                                            <div class="text-white">
                                                <h6 class="text-uppercase mb-3">Volunteers</h6>
                                                <h4 class="mb-4">${adherentCount}</h4>
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:if>
                                
                                <c:if test="${sessionBean.role eq 'Administrateur' 
				|| sessionBean.role eq 'Responsable Executif' || sessionBean.role eq 'Responsable argents'}">
                                <div class="col-xl-3 col-md-6">
                                    <div class="card mini-stat bg-primary">
                                        <div class="card-body mini-stat-img">
                                            <div class="mini-stat-icon">
                                                <i class="mdi mdi-buffer float-right"></i>
                                            </div>
                                            <div class="text-white">
                                                <h6 class="text-uppercase mb-3">Transactions</h6>
                                                <h4 class="mb-4">${transactionCount}</h4>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                                </c:if>
                                
                                <c:if test="${sessionBean.role eq 'Administrateur' 
				|| sessionBean.role eq 'Responsable Executif' || sessionBean.role eq 'Responsable RH'}">
                                <div class="col-xl-3 col-md-6">
                                    <div class="card mini-stat bg-primary">
                                        <div class="card-body mini-stat-img">
                                            <div class="mini-stat-icon">
                                                <i class="mdi mdi-chart-line float-right"></i>
                                            </div>
                                            <div class="text-white">
                                                <h6 class="text-uppercase mb-3">Agencys</h6>
                                                <h4 class="mb-4">${projectCount}</h4>
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:if>
                                
                               
				                  <c:if test="${sessionBean.role eq 'Administrateur' 
				|| sessionBean.role eq 'Responsable Executif' || sessionBean.role eq 'Responsable RH'}">
                                <div class="col-xl-3 col-md-6">
                                    <div class="card mini-stat bg-primary">
                                        <div class="card-body mini-stat-img">
                                            <div class="mini-stat-icon">
                                                <i class="mdi mdi-briefcase-check float-right"></i>
                                            </div>
                                            <div class="text-white">
                                                <h6 class="text-uppercase mb-3">Taches</h6>
                                                <h4 class="mb-4">${tacheCount}</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div> </c:if>
                            </div> 
                            
                            
                            <!-- end row -->
                            
                            
                            <div class="row">
                           
                           
                                <div class="col-xl-3 col-md-6">
                                 <c:if test="${sessionBean.role eq 'Administrateur' 
				|| sessionBean.role eq 'Responsable Executif' || sessionBean.role eq 'Responsable RH'}">
                                    <div class="card mini-stat bg-primary">
                                        <div class="card-body mini-stat-img">
                                            <div class="mini-stat-icon">
                                                <i class="mdi mdi-account-multiple float-right"></i>
                                            </div>
                                            <div class="text-white">
                                                <h6 class="text-uppercase mb-3">Reunions</h6>
                                                <h4 class="mb-4">${reuniounCount}</h4>
                                               
                                            </div>
                                        </div> 
                                    </div> </c:if>
                                </div>
                                
                                
                                 <c:if test="${sessionBean.role eq 'Administrateur' 
				|| sessionBean.role eq 'Responsable Executif' || sessionBean.role eq 'Responsable RH'}">
                                <div class="col-xl-3 col-md-6">
                                    <div class="card mini-stat bg-primary">
                                        <div class="card-body mini-stat-img">
                                            <div class="mini-stat-icon">
                                                <i class="mdi mdi-album float-right"></i>
                                            </div>
                                            <div class="text-white">
                                                <h6 class="text-uppercase mb-3">Conventions</h6>
                                                <h4 class="mb-4">${conventionCount}</h4>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                              </c:if>
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

	


	<!-- ============================================================== -->
	<!-- End Right content here -->
	<!-- ============================================================== -->


	
	<!-- END wrapper -->

	<!-- jQuery  -->
	<script
		src="${pageContext.request.contextPath}/resources/template/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/js/metisMenu.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/js/jquery.slimscroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/js/waves.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/template/plugins/jquery-sparkline/jquery.sparkline.min.js"></script>

	<!-- Required datatable js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/plugins/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Buttons examples -->
	<script
		src="${pageContext.request.contextPath}/resources/template/plugins/datatables/dataTables.buttons.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/plugins/datatables/buttons.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/plugins/datatables/jszip.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/plugins/datatables/pdfmake.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/plugins/datatables/vfs_fonts.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/plugins/datatables/buttons.html5.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/plugins/datatables/buttons.print.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/plugins/datatables/buttons.colVis.min.js"></script>
	<!-- Responsive examples -->
	<script
		src="${pageContext.request.contextPath}/resources/template/plugins/datatables/dataTables.responsive.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/plugins/datatables/responsive.bootstrap4.min.js"></script>

	<!-- Datatable init js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/pages/datatables.init.js"></script>

	<!-- App js -->
	<script src="${pageContext.request.contextPath}/resources/template/js/app.js"></script>
<script>
		document.getElementById("dropdownMenuLink").style.display = "none";
	</script>
</body>

</html>