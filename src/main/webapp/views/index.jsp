<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Home</title>

<link rel="stylesheet" href="<c:url value='/views/css/index.css'/>" />

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container-fluid">
		<c:url var="url" value="/account"/>

		<!-- Navigation -->

		<%@include file="layout/nav.jsp"%>

		<!-- Main -->

		<div class="row">
			<article class="col-sm-9">
				<div class="row mt-3">
					<c:forEach var="item" items="${products.content}">
						<div class="col-6 col-md-3 mb-3">
							<div class="card h-100">
								<img src="/images/${item.image}" class="card-img-top mt-3"/>
								<div class="card-body">
									<h5 class="card-text text-danger"><i class="fa-solid fa-dollar-sign"></i> ${item.price }</h5>
									<h5 class="card-title">${item.name }</h5>
						
									<a href="/product/detail/${item.id}" class="btn btn-primary">Buy now</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<nav aria-label="Page navigation example">
				  <ul class="pagination d-flex justify-content-center">
				  	<li class="page-item ${products.first ? 'disabled' : ''}"><a class="page-link" href="/home/search-by-keyword?page=0">First</a></li>
				    <li class="page-item ${products.first ? 'disabled' : ''}"><a class="page-link" href="/home/search-by-keyword?page=${products.number - 1}">Previous</a></li>
				    
				    <c:forEach varStatus="i" begin="0" end="${products.totalPages - 1}">
				    	<li class="page-item ${products.number == i.index ? 'active' : ''}"><a class="page-link" href="/home/search-by-keyword?page=${i.index}">${i.index + 1}</a></li>
				    </c:forEach>
				    
				    
				    <li class="page-item ${products.last ? 'disabled' : ''}"><a class="page-link" href="/home/search-by-keyword?page=${products.number + 1}">Next</a></li>
				    <li class="page-item ${products.last ? 'disabled' : ''}"><a class="page-link" href="/home/search-by-keyword?page=${products.totalPages - 1}">Last</a></li>
				  </ul>
				</nav>
			</article>

			<%@include file="layout/aside.jsp"%>
		</div>

		<!-- Footer -->

		<%@include file="layout/footer.jsp"%>
	</div>

	<!-- Bootstrap JS -->
	<script src="https://kit.fontawesome.com/c4e33664cc.js"
		crossorigin="anonymous"></script>
</body>
</html>