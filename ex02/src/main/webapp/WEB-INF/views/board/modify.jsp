<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Modify/Delete</div>
			<!-- /.panel-heading -->


			<div class="panel-body">
				<form>
					<h1>Board Board Modify/Delete</h1>
					<div class="form-group">
						<label>BNO</label> <input class="form-control" name="bno"
							readonly="readonly" value='<c:out value="${board.bno}"/>'>
					</div>
					<div class="form-group">
						<label>Title</label> <input class="form-control" name="title"
							value='<c:out value="${board.title}"/>'>
					</div>
					<div class="form-group">
						<label>Content</label>
						<textarea class="form-control" rows="3" cols="50" name="content"><c:out
								value="${board.content}" /></textarea>
					</div>
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name="writer"
							value="'<c:out value="${board.writer}"/>'">
					</div>

					<button class="btn btn-default" data-oper="modify">저장</button>
					<button class="btn btn-danger" data-oper="remove">삭제</button>
					<button class="btn btn-info" data-oper="list">리스트</button>
				</form>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<script>
	$(document).ready(
			function() {

				var formObj = $("form");

				$('.btn').click(
						function(e) {

							e.preventDefault();

							var operation = $(this).data("oper");
							console.log(operation);

							if (operation === 'list') {
								self.location = "/board/list"
							} else if (operation === 'remove') {
								formObj.attr("action", "/board/remove").attr(
										"method", "post").submit();
							} else if (operation === 'modify') {
								formObj.attr("action", "/board/modify").attr(
										"method", "post").submit();
							}
						})

			})
</script>
<%@include file="../includes/footer.jsp"%>