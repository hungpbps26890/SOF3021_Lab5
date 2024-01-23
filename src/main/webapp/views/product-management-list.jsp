<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Product Management</title>

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
					          <h3>Product List</h3>
					        </div>
					        <div class="card-body">
					        	<c:url var="url" value="/admin"/>
					          
					          <div class="row">
					            <div class="col-lg-12">
					              <table class="table table-bordered table-hover">
					                <thead>
					                  <tr>
					                    <th><a href="/admin/product/list/sort?field=id">Product ID</a></th>
					                    <th><a href="/admin/product/list/sort?field=name">Name</a></th>
					                    <th><a href="/admin/product/list/sort?field=price">Price</a></th>
					                    <th><a href="/admin/product/list/sort?field=available">Available</a></th>
					                    <th><a href="/admin/product/list/sort?field=category">Category</a></th>
					                    <th>Image</th>
					                    <th>Action</th>
					                  </tr>
					                </thead>
					                <tbody>
					                  <c:forEach var="item" items="${products.content}">
					                    <tr class="align-middle">
					                      <td>${item.id}</td>
					                      <td>${item.name}</td>
					                      <td>${item.price}</td>
					                      <td>${statuses.get(item.available)}</td>
					                      <td>${item.category.name}</td>
					                      <td><img alt="${item.image}" src="/images/${item.image}" style="width: 100px"></td>
					                      <td class="text-center">
					                        <a class="btn btn-warning" href="/admin/product/${item.id}">
					                          Edit
					                        </a>
					                        <a class="btn btn-danger" href="/admin/product?btnDel=&id=${item.id}">
					                          Delete
					                        </a>
					                      </td>
					                    </tr>
					                  </c:forEach>
					                </tbody>
					              </table>
					              <nav aria-label="Page navigation example">
									  <ul class="pagination d-flex justify-content-center">
									  	<li class="page-item ${products.first ? 'disabled' : ''}"><a class="page-link" href="/admin/product/list?page=0">First</a></li>
									    <li class="page-item ${products.first ? 'disabled' : ''}"><a class="page-link" href="/admin/product/list?page=${products.number - 1}">Previous</a></li>
									    
									    <c:forEach varStatus="i" begin="0" end="${products.totalPages - 1}">
									    	<li class="page-item ${products.number == i.index ? 'active' : ''}"><a class="page-link" href="/admin/product/list?page=${i.index}">${i.index + 1}</a></li>
									    </c:forEach>
									    
									    
									    <li class="page-item ${products.last ? 'disabled' : ''}"><a class="page-link" href="/admin/product/list?page=${products.number + 1}">Next</a></li>
									    <li class="page-item ${products.last ? 'disabled' : ''}"><a class="page-link" href="/admin/product/list?page=${products.totalPages - 1}">Last</a></li>
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