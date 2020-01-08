<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<body>
		<tiles:insertAttribute name="body" /> 
		<div class="main_footer">
	        <div class="main_footer-inner">
	            <tiles:insertAttribute name="footer" />
	        </div>
	    </div>
	</body>
</html>