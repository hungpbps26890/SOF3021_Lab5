<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
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
						<!-- Chèn Icon --> <i class="fa-solid fa-house"></i> <s:message code="nav.home"/>
				</a>
				</li>
				<c:choose>
					<c:when test="${sessionScope.currentUser.admin == true}">
						<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/product'/>">
						<i class="fa-solid fa-warehouse"></i> <s:message code="nav.productManagement"/></a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/category'/>"><i
						class="fa-solid fa-list"></i> <s:message code="nav.categoryManagement"/></a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/report'/>"><i
						class="fa-solid fa-chart-simple"></i> <s:message code="nav.report"/></a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa-solid fa-list"></i> <s:message code="nav.about"/></a></li>
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="fa-solid fa-phone"></i> <s:message code="nav.contact"/></a></li>
						<li class="nav-item"><a class="nav-link" href="/mailer"> <i
								class="fa-solid fa-envelope"></i> <s:message code="nav.feedback"/>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <i
								class="fa-solid fa-circle-question"></i> <s:message code="nav.faq"/>
						</a></li>
					</c:otherwise>
				</c:choose>
				
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false">
						<i class="fa-solid fa-user"></i> <s:message code="nav.account"/>
				</a>
					<ul class="dropdown-menu"
						style="background-color: rgb(255, 212, 0); border: none; box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);">
						<c:choose>
							<c:when test="${not empty sessionScope.currentUser}">
								<li><a class="dropdown-item" href="${url}/logout"><s:message code="nav.logout"/></a></li>
								<li><a class="dropdown-item" href="${url}/change-password"><s:message code="nav.changePassword"/></a></li>
								<li><a class="dropdown-item" href="${url}/profile"><s:message code="nav.profile"/></a></li>
								<li><hr class="dropdown-divider" /></li>
								<li><a class="dropdown-item" href="#"><s:message code="nav.cart"/></a></li>
							</c:when>
							<c:otherwise>
								<li><a class="dropdown-item" href="${url}/login"><s:message code="nav.login"/></a></li>
								<li><a class="dropdown-item" href="#"><s:message code="nav.register"/></a>
								<li><a class="dropdown-item" href="#"><s:message code="nav.forgotPassword"/></a></li>
							</c:otherwise>
						</c:choose>
					</ul></li>
			</ul>
			
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a href="?lang=vi" class="nav-link">
				<img src="/images/coVietNam.png" width="55" height="35"></a></li>
				<li class="nav-item"><a href="?lang=en" class="nav-link">
				<img src="/images/coNuocAnh.png" width="55" height="35">
				</a></li>
				<li class="nav-item"><a href="?lang=cn" class="nav-link">
				<img src="/images/coTrungQuoc.png" width="55" height="35">
				</a></li>
			</ul>
			
			
			<c:if test="${not empty sessionScope.currentUser}">
				<ul class="navbar-nav mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="${url}/profile"><s:message code="nav.welcome"/>, ${sessionScope.currentUser.firstName} ${sessionScope.currentUser.lastName}</a>
					</li>
				</ul>
			</c:if>
		</div>
	</div>
</nav>