<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Send Email</title>

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
		<c:url var="url" value="/account" />

		<!-- Navigation -->

		<%@include file="layout/nav.jsp"%>

		<!-- Main -->

		<div class="row">
			<article class="col-12">
				<div class="row mt-3">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h3>Send Email</h3>
							</div>
							<div class="card-body">
								<form enctype="multipart/form-data" class="formMailer"
									action="/mailer/send" method="post">
									<div class="mb-3">
										<label for="to" class="form-label">To</label> <input
											type="email" class="form-control" id="to" name="txtTo">
									</div>
									<div class="mb-3">
										<label for="cc" class="form-label">CC</label> <input
											type="text" class="form-control" id="cc" name="txtCC">
									</div>
									<div class="mb-3">
										<label for="bcc" class="form-label">BCC</label> <input
											type="text" class="form-control" id="bcc" name="txtBCC">
									</div>
									<div class="mb-3">
										<label for="title" class="form-label">Title</label> <input
											type="text" class="form-control" id="title" name="txtSubject">
									</div>
									<div class="mb-3">
										<label for="content" class="form-label">Content</label>
										<textarea class="form-control" id="content" name="txtContent"
											rows="4"></textarea>
									</div>
									<div class="mb-3">
										<label for="file" class="form-label">Attach File</label> <input
											type="file" class="form-control" id="file" name="file">
									</div>

									<p class="badge text-bg-primary">${message}</p>
									<p class="badge text-bg-danger">${errorMessage}</p>

									<div class="mb-3">
										<button class="btn btn-primary">Send</button>
										<button type="reset" class="btn btn-secondary">Cancel</button>
									</div>

								</form>

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