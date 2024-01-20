<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-sm-6 col-md-4 col-lg-3 mb-3">
	<div class="card">
		<img src="images/${param.image }" class="card-img-top"/>
		<div class="card-body">
			<p class="card-text">${param.name }</p>
			<h5 class="card-title">${param.price }đ</h5>

			<a href="/SOF3011_Lab4/detail" class="btn btn-primary"><i
				class="fa-solid fa-cart-shopping"></i> Mua ngay</a>
		</div>
	</div>
</div>