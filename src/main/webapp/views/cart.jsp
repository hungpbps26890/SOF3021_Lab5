<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Cart</title>

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
			<section class="main-container w-75 m-auto mt-3">
			  <div class="cart-top-content d-flex justify-content-between mb-3">
			    <a href="home" class="text-decoration-none">
			      <i class="fa-solid fa-chevron-left"></i> Browse more products
			    </a>
			    <span>Your Cart</span>
			  </div>
			  <div class="cart bg-white shadow-sm rounded py-3">
			    <!-- List Product  -->
			    <div class="list-product">
			      
			      <c:forEach var="item" items="${cart}">
			      	<form action="/cart/update" method="post">
			      		<input type="hidden" name="id" value="${item.id}">
			      		<div
					        class="product-item p-3 border-bottom"
					      >
					        <div class="row">
					          <div class="left-section col-2 text-center">
					            <img src="/images/${item.photo}" class="img-fluid" />
					            <a
					              class="mt-2 btn"
					              style="font-size: 12px; color: #999"
					              href="/cart/delete/${item.id}"
					            >
					              <i class="fa-solid fa-circle-xmark"></i> <span>Delete</span>
					            </a>
					          </div>
					
					          <div class="middle-section col-7">
					            <h1 class="mb-2 product-name" style="font-size: 14px">
					              ${item.name}
					            </h1>
					          </div>
					
					          <div
					            class="right-section col-3 d-flex flex-column justify-content-between"
					          >
					            <div>
					              <div
					                class="product-price"
					                style="color: #f30c28; font-size: 14px; text-align: right"
					              >
					                $${item.price}
					              </div>
					            </div>
					
					            <div class="choose-number">
					              <input
					                type="number"
					                class="form-control"
					                min="1"
					                name="quantity"
					                value="${item.quantity}"
					                onclick="this.form.submit()"
					                style="float: right; width: 70px"
					              />
					            </div>
					          </div>
					        </div>
					      </div>
			      	</form>
			      </c:forEach>
			
			    </div>
			
			    <!-- Total Price -->
			    <div
			      class="total-price d-flex justify-content-between mb-2 px-3 pb-2 border-bottom"
			      style="font-size: 14px"
			    >
			      <strong>Total (${count} product):</strong>
			      <span style="color: #f30c28; font-weight: 700"
			        >$${amount}</span
			      >
			    </div>
			    <div
			      class="accumulated-point d-flex justify-content-between mb-3 px-3"
			      style="font-size: 14px"
			    >
			    </div>
			
			    <!-- Order Button -->
			    <div class="order-button mb-3 px-3 row">
			      <div class="col-6">
			      	<button
				        class="submit-order"
				        style="
				          color: #fff;
				          border-radius: 4px;
				          width: 100%;
				          height: 100%;
				          border: 0;
				          cursor: pointer;
				          background: linear-gradient(180deg, #f79429, #f7712e);
				        "
				      >
				        Check Out
				      </button>
			      </div>
			      
					
			      <div class="col-6">
			      	<a
				        class="clear-button btn align-middle"
				        style="
				          border: 1px solid #2377e8;
				          color: #2377e8;
				          width: 100%;
				          height: 100%;
				          display: block;
				          border-radius: 4px;
				          background: #fff;
				          cursor: pointer;
				          text-decoration: none;
				        "
				        href="/cart/clear"
				      >
				        Clear Cart
				      </a>
			      </div>
			      
			      
			
			      <div class="text-center">
			        <small style="color: #666; font-size: 12px; text-align: center"
			          ></small
			        >
			      </div>
			    </div>
			  </div>
			</section>
		</div>

		<!-- Footer -->

		<%@include file="layout/footer.jsp"%>
	</div>

	<!-- Bootstrap JS -->
	<script src="https://kit.fontawesome.com/c4e33664cc.js"
		crossorigin="anonymous"></script>
</body>
</html>