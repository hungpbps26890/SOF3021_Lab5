<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside class="col-sm-3">
	<div class="card mb-3 mt-3 p-3" style="max-width: 500px">
		<form class="d-flex" action="/home/search-by-keyword" method="post">
			<input 
				class="form-control" type="text" name="keyword"
				value="${keyword}" placeholder="Type something here..."
				aria-label="Search" 
			/>
		</form>
	</div>

	<div class="card">
		<div class="card-header">
			<strong><i class="fa-solid fa-list-ul"></i> <s:message code="cate.category"/></strong>
		</div>
		<div class="list-group list-group-flush">
			<c:forEach var="category" items="${categories}">
				<a
					href="/home/search-by-keyword?category=${category.name}" 
					class="list-group-item list-group-item-action"
					aria-current="true">${category.name}
				</a> 
			</c:forEach>
			
		</div>
	</div>
</aside>