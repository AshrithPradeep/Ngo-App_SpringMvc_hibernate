<!-- ========== Left Sidebar Start ========== -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="left side-menu">
	<div class="slimscroll-menu" id="remove-scroll">
		<!--- Sidemenu -->
		<div id="sidebar-menu">
			<!-- Left Menu Start -->
			<ul class="metismenu" id="side-menu">
				<c:if test="${sessionBean.role eq 'Admin'}">
					<li><a href="/ngo/users/list" class="waves-effect"><i
							class="mdi mdi-account-location"></i> <span> Users </span> </a></li>
				</c:if>

				<c:if test="${sessionBean.role eq 'Volunteer'}">
					<li><a href="/ngo/agency/volunteer/list" class="waves-effect"><i
							class="mdi mdi-account-location"></i> <span> NGO List </span> </a></li>
				</c:if>
				<c:if test="${sessionBean.role eq 'Data Entry manager'}">
					<li><a href="/ngo/agency/list" class="waves-effect"><i
							class="mdi mdi-account-location"></i> <span> NGOs </span> </a></li>
				</c:if>
				<c:if test="${sessionBean.role eq 'Application Manager'}">
					<li><a href="/ngo/agency/list" class="waves-effect"><i
							class="mdi mdi-account-location"></i> <span> NGOs </span> </a></li>
				</c:if>
				<c:if test="${sessionBean.role eq 'Superintendent'}">
					<li><a href="/ngo/agency/list" class="waves-effect"><i
							class="mdi mdi-account-location"></i> <span> NGOs </span> </a></li>
				</c:if>
			</ul>
		</div>
		<!-- Sidebar -->
		<div class="clearfix"></div>
	</div>
	<!-- Sidebar -left -->
</div>
<!-- Left Sidebar End -->