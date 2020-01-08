<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<title>동작완료</title>
</head>
<body>	

<a>${check}</a>
		<c:if test="${returnCode > 0}">
			<script>
				alert("신청이 완료되었습니다.");
				location.href="/db/onlineApply.do";
			</script>
		</c:if>

		<c:if test="${returnCode==0}">
			<script>
				alert("신청이 취소 되었습니다.");
				Return true;
			</script>
		</c:if>
		
</body>
</html>