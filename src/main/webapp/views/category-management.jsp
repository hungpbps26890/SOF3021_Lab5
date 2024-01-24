<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Category Management</title>

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
					          <h3>Category Management</h3>
					        </div>
					        <div class="card-body">
					        	<c:url var="url" value="/admin"/>
					          <form:form action="/admin/category" modelAttribute="category" method="post">
					            <div class="mb-3">
					              <label for="id" class="form-label">Category ID</label>
					              <form:input type="text" class="form-control" id="id" path="id" value="${category.id}"/>
					              <div class="mt-2">
					              	<form:errors path="id" class="badge text-bg-danger"></form:errors>
					              </div>
					            </div>
					
					            <div class="mb-3">
					              <label for="name" class="form-label">Category Name</label>
					              <form:input
					                type="text"
					                class="form-control"
					                path="name"
					                id="name"
					                value="${category.name}"
					              />
					              <div class="mt-2">
					              	<form:errors path="name" class="badge text-bg-danger"></form:errors>
					              </div>
					            </div>
					
					            <p class="badge text-bg-primary">${message}</p>
					            <p class="badge text-bg-danger">${errorMessage}</p>
					
					            <div class="mb-3">
					              <button class="btn btn-primary">Save</button>
					              <button class="btn btn-warning" formaction="/admin/category/update">Update</button>
					              <button class="btn btn-danger" formaction="/admin/category/delete/${category.id}">Delete</button>
					              <a class="btn btn-secondary" href="/admin/category">Cancel</a>
					            </div>
					          </form:form>
					          
					          <div class="row">
					            <div class="col-lg-12">
					              <table class="table table-bordered table-hover">
					                <thead>
					                  <tr>
					                    <th><a href="/admin/category?field=id">Category ID</a></th>
					                    <th><a href="/admin/category?field=name">Category Name</a></th>
					                    <th>Action</th>
					                  </tr>
					                </thead>
					                <tbody>
					                  <c:forEach var="item" items="${categories.content}">
					                    <tr class="align-middle">
					                      <td>${item.id}</td>
					                      <td>${item.name}</td>
					                      <td class="text-center">
					                        <a class="btn btn-warning" href="/admin/category/${item.id}">
					                          Edit
					                        </a>
					                        <a class="btn btn-danger" href="/admin/category?btnDel=&id=${item.id}">
					                          Delete
					                        </a>
					                      </td>
					                    </tr>
					                  </c:forEach>
					                </tbody>
					              </table>
					              <nav aria-label="Page navigation example">
									  <ul class="pagination d-flex justify-content-center">
									  	<li class="page-item ${categories.first ? 'disabled' : ''}"><a class="page-link" href="/admin/category?page=0">First</a></li>
									    <li class="page-item ${categories.first ? 'disabled' : ''}"><a class="page-link" href="/admin/category?page=${categories.number - 1}">Previous</a></li>
									    
									    <c:forEach varStatus="i" begin="0" end="${categories.totalPages - 1}">
									    	<li class="page-item ${categories.number == i.index ? 'active' : ''}"><a class="page-link" href="/admin/category?page=${i.index}">${i.index + 1}</a></li>
									    </c:forEach>
									    
									    
									    <li class="page-item ${categories.last ? 'disabled' : ''}"><a class="page-link" href="/admin/category?page=${categories.number + 1}">Next</a></li>
									    <li class="page-item ${categories.last ? 'disabled' : ''}"><a class="page-link" href="/admin/category?page=${categories.totalPages - 1}">Last</a></li>
									  </ul>
									</nav>
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