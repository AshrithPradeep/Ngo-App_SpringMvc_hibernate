<!-- Begin page -->
<div id="wrapper">
	<!-- Top Bar Start -->
	<div class="topbar">
		<!-- LOGO -->
		<div class="topbar-left">
			<a href="/myapp/dashboard/show" class="logo"> <span> <img
					src="${pageContext.request.contextPath}/resources/template/images/Ngo.png"
					alt="" height="30">
			</span> <i> <img
					src="${pageContext.request.contextPath}/resources/template/images/Ngo.png"
					alt="" height="22">
			</i>
			</a>
		</div>
		<nav class="navbar-custom">
			<ul class="navbar-right d-flex list-inline float-right mb-0">


				<li class="dropdown notification-list">
					<div class="dropdown notification-list nav-pro-img">
						<a
							class="dropdown-toggle nav-link arrow-none waves-effect nav-user"
							data-toggle="dropdown" href="#" role="button"
							aria-haspopup="false" aria-expanded="false"> <img
							src="${pageContext.request.contextPath}/resources/template/images/users/user-4.jpg"
							alt="user" class="rounded-circle">
						</a>
						<div class="dropdown-menu dropdown-menu-right profile-dropdown ">
							<!-- item-->
							<a class="dropdown-item text-danger"
								href="${pageContext.request.contextPath}/logout"><i
								class="mdi mdi-power text-danger"></i> Logout</a>
						</div>
					</div>
				</li>
			</ul>
			<ul class="list-inline menu-left mb-0">
				<li class="float-left">
					<button class="button-menu-mobile open-left waves-effect">
						<i class="mdi mdi-menu"></i>
					</button>
				</li>

				<li class="d-none d-sm-block">
					<div class="dropdown pt-3 d-inline-block">
						<a class="btn btn-light"
							onclick="window.location.href='showFormForAdd'; return false;"
							role="button" id="dropdownMenuLink" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> Add </a>
					</div>
				</li>

			</ul>
		</nav>
	</div>
</div>
<!-- Top Bar End -->