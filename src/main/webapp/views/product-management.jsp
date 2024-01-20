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
					          <h3>Product Management</h3>
					        </div>
					        <div class="card-body">
					        	<c:url var="url" value="/admin"/>
					          <form:form action="/admin/product" modelAttribute="product" method="post" enctype="multipart/form-data">
					            <div class="mb-3">
					              <label for="id" class="form-label">Product ID</label>
					              <form:input type="text" class="form-control" id="id" path="id" value="${product.id}"/>
					              <div class="mt-2">
					              	<form:errors path="id" class="badge text-bg-danger"></form:errors>
					              </div>
					            </div>
					
					            <div class="mb-3">
					              <label for="name" class="form-label">Product Name</label>
					              <form:input
					                type="text"
					                class="form-control"
					                path="name"
					                id="name"
					                value="${product.name}"
					              />
					              <div class="mt-2">
					              	<form:errors path="name" class="badge text-bg-danger"></form:errors>
					              </div>
					            </div>
					
					            <div class="mb-3">
					              <label for="price" class="form-label">Price</label>
					              <form:input
					                type="text"
					                class="form-control"
					                path="price"
					                id="price"
					                value="${product.price}"
					              />
					              <div class="mt-2">
					              	<form:errors path="price" class="badge text-bg-danger"></form:errors>
					              </div>
					            </div>
					            
					            <div class="mb-3">
					              <label for="status" class="form-label">Status: </label>
					              <form:radiobuttons
					                class="form-check-input ms-3 me-2"
					                path="available"
					                id="available"
					                items="${statuses}"
					                delimeter=""
					               />
					              <div>
					              	<form:errors path="available" class="badge text-bg-danger"></form:errors>
					              </div>
					              
					            </div>
					            
					            <div class="mb-3">
					              <label for="category" class="form-label">Category</label>
					              <form:select class="form-select" path="category.id">
					              	<form:options items="${categories}" itemValue="id" itemLabel="name"/>
					              </form:select>
					            </div>
					            
					            <div class="mb-3">
					              <label for="photo" class="form-label">Photo</label>
					              <input
					                type="file"
					                class="form-control"
					                name="photo"
					                accept="image/png, image/jpeg, image/webp"
					              />
					              <p class="badge text-bg-danger mt-2">${errorFile}</p>
					            </div>
					            
					            <p class="badge text-bg-primary">${message}</p>
					            <p class="badge text-bg-danger">${errorMessage}</p>
					
					            <div class="mb-3">
					              <button class="btn btn-primary">Save</button>
					              <button class="btn btn-warning" formaction="/admin/product/update">Update</button>
					              <a class="btn btn-secondary" href="/admin/product">Cancel</a>
					            </div>
					          </form:form>
					          <hr />
					          <div class="row">
					            <div class="col-lg-12">
					              <table class="table table-bordered table-hover">
					                <thead>
					                  <tr>
					                    <th>Product ID</th>
					                    <th>Name</th>
					                    <th>Price</th>
					                    <th>Status</th>
					                    <th>Category</th>
					                    <th>Image</th>
					                    <th>Action</th>
					                  </tr>
					                </thead>
					                <tbody>
					                  <c:forEach var="item" items="${products}">
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