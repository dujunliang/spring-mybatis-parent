<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <title>404资源无法找到</title>
</head>
  
  <body class="error">
    <div class="title">
      <h1>
        404
      </h1>
    </div>
    <div class="actions">
      <div class="list-group">
        <li class="list-group-item list-group-header align-center">
          Ooops! It looks like you have taken a wrong turn.
        </li>
        <a href="index.html" class="list-group-item">
          <i class="icon-home">
          </i>
          Go to Dashboard
          <i class="icon-angle-right align-right">
          </i>
        </a>
        <a href="javascript:void(0);" class="list-group-item">
          <i class="icon-question">
          </i>
          Support
          <i class="icon-angle-right align-right">
          </i>
        </a>
        <a href="javascript:void(0);" class="list-group-item">
          <i class="icon-phone">
          </i>
          Call us
          <i class="icon-angle-right align-right">
          </i>
          <span class="badge">
            021-215-584
          </span>
        </a>
      </div>
    </div>
    <div class="footer">
      Melon - Flat &amp; Responsive Admin Template
      <br>
      &copy; 2013
    </div>

  </body>

</html>