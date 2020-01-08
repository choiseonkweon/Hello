<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body class="wrapper">
	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">        
        <tiles:insertAttribute name="header"/>        
    </nav>
    <div id="page-wrapper">
    	<div class="content">  
    		<tiles:insertAttribute name="menu" />                
        	<tiles:insertAttribute name="content" />                                                  
        </div>
    </div>
    <div class="main_footer">
        <div class="main_footer-inner">
            <tiles:insertAttribute name="footer" />
        </div>
    </div>
    
</body>
</html>