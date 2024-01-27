<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Report</title>

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
			<article class="col-12">
				<div class="row mt-3">
					<div class="col-12">
						<div class="card">
					      	<div class="card-header">
					          <h3>Category Report</h3>
					        </div>
					        <div class="card-body">
					        	<c:url var="url" value="/admin"/>
					          
					          <div class="row">
					            <div class="col-lg-12">
					              <table class="table table-bordered table-hover">
					                <thead>
					                  <tr>
					                    <th>Category</th>
					                    <th>Total Price</th>
					                    <th>Number of Product</th>
					                  </tr>
					                </thead>
					                <tbody>
					                  <c:forEach var="item" items="${categoryReports}">
					                    <tr class="align-middle">
					                      <td>${item.group.name}</td>
					                      <td>${item.sum}</td>
					                      <td>${item.count}</td>
					                    </tr>
					                  </c:forEach>
					                </tbody>
					              </table>
					            </div>
					          </div>
					         
					        </div>
				      	</div>
					</div>
					
				</div>
			</article>
		</div>

		<!-- Footer -->

		<%@include file="layout/footer.jsp"%>
	</div>

	<!-- Bootstrap JS -->
	<script src="https://kit.fontawesome.com/c4e33664cc.js"
		crossorigin="anonymous"></script>
</body>
</html>