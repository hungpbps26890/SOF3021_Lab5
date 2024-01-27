<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="row navbar navbar-expand-lg"
	style="background-color: rgb(255, 212, 0)">
	<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<!-- active = in đậm trang hiện tại --> <!-- aria-current="page" => xác định trang hiện tại -->
					<a class="nav-link active" aria-current="page" href="<c:url value='/home'/>">
						<!-- Chèn Icon --> <i class="fa-solid fa-house"></i> Home
				</a>
				</li>
				<c:choose>
					<c:when test="${sessionScope.currentUser.admin == true}">
						<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/product'/>">
						<i class="fa-solid fa-warehouse"></i> Product Management</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/category'/>"><i
						class="fa-solid fa-list"></i> Category Management</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/report'/>"><i
						class="fa-solid fa-chart-simple"></i> Report</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa-solid fa-list"></i> About</a></li>
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="fa-solid fa-phone"></i> Contact</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <i
								class="fa-solid fa-envelope"></i> Feedback
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <i
								class="fa-solid fa-circle-question"></i> FAQ
						</a></li>
					</c:otherwise>
				</c:choose>
				
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false">
						<i class="fa-solid fa-user"></i> Account
				</a>
					<ul class="dropdown-menu"
						style="background-color: rgb(255, 212, 0); border: none; box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);">
						<c:choose>
							<c:when test="${not empty sessionScope.currentUser}">
								<li><a class="dropdown-item" href="${url}/logout">Logout</a></li>
								<li><a class="dropdown-item" href="${url}/change-password">Change Password</a></li>
								<li><a class="dropdown-item" href="${url}/profile">Profile</a></li>
								<li><hr class="dropdown-divider" /></li>
								<li><a class="dropdown-item" href="#">Cart</a></li>
							</c:when>
							<c:otherwise>
								<li><a class="dropdown-item" href="${url}/login">Login</a></li>
								<li><a class="dropdown-item" href="#">Register</a>
								<li><a class="dropdown-item" href="#">Forgot Password</a></li>
							</c:otherwise>
						</c:choose>
					</ul></li>
			</ul>
			<c:if test="${not empty sessionScope.currentUser}">
				<ul class="navbar-nav mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="${url}/profile">Welcome, ${sessionScope.currentUser.firstName} ${sessionScope.currentUser.lastName}</a>
					</li>
				</ul>
			</c:if>
		</div>
	</div>
</nav>