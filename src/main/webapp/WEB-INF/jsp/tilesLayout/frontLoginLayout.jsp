<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<body class="wrapper">
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">        
        	<tiles:insertAttribute name="header"/>        
    	</nav>
		<tiles:insertAttribute name="body" /> 
		<div class="frontLogin_footer">
	        <div class="frontLogin_footer-inner">
	            <tiles:insertAttribute name="footer" />
	        </div>
	    </div>
	</body>
</html>